% Fatos: pais(clima, area, lingua, motivacao, pais, descricao).

% quente, urbana
pais(quente, urbana, ingles, educacao, 'Singapura', 'Célula financeira com forte presença educacional.').
pais(quente, urbana, ingles, trabalho, 'Emirados Arabes Unidos', 'Destino popular para profissionais em busca de oportunidades no Oriente Médio.').
pais(quente, urbana, ingles, melhoria_de_vida, 'Austrália', 'Vida de alta qualidade e excelente sistema de saúde.').
pais(quente, urbana, espanhol, educacao, 'Espanha', 'A Espanha é um país da Europa, localizado na Península Ibérica, com uma rica história, cultura vibrante e paisagens diversas. Sua capital é Madri, e outras grandes cidades incluem Barcelona e Sevilha. O país é famoso por suas culinária, festas e monumentos históricos, como a Sagrada Família e a Alhambra.').
pais(quente, urbana, espanhol, trabalho, 'Chile', 'Oportunidades de trabalho especialmente em áreas urbanas.').
pais(quente, urbana, espanhol, melhoria_de_vida, 'Argentina', 'Conhecida por sua cultura vibrante e clima ameno.').
pais(quente, urbana, portugues, educacao, 'Portugal', 'Excelente sistema educacional com muitas universidades renomadas.').
pais(quente, urbana, portugues, trabalho, 'Angola', 'Mercado de trabalho crescente, principalmente para áreas técnicas.').
pais(quente, urbana, portugues, melhoria_de_vida, 'Brasil', 'Diversidade cultural e grande potencial de crescimento econômico.').

% quente, rural
pais(quente, rural, ingles, educacao, 'Jamaica', 'Destino educacional com forte tradição cultural e esportiva.').
pais(quente, rural, ingles, trabalho, 'Quênia', 'Paisagens naturais e crescimento nas áreas de turismo e ecologia.').
pais(quente, rural, ingles, melhoria_de_vida, 'Filipinas', 'Paisagem tropical e vida tranquila fora dos centros urbanos.').
pais(quente, rural, espanhol, educacao, 'Peru', 'Cultura rica e forte influência indígena nas escolas.').
pais(quente, rural, espanhol, trabalho, 'Bolívia', 'Mercado de trabalho voltado para agricultura e turismo.').
pais(quente, rural, espanhol, melhoria_de_vida, 'Paraguai', 'Ambiente rural ideal para quem busca paz e tranquilidade.').
pais(quente, rural, portugues, educacao, 'Moçambique', 'Forte presença educacional com programas de inclusão social.').
pais(quente, rural, portugues, trabalho, 'Guiné-Bissau', 'Mercado de trabalho focado em agricultura e pequenas empresas.').
pais(quente, rural, portugues, melhoria_de_vida, 'Cabo Verde', 'Paisagens de montanhas e vida rural tranquila.').

% frio, urbana
pais(frio, urbana, ingles, educacao, 'Estados Unidos', 'Sistema educacional de referência com diversas oportunidades de estudo.').
pais(frio, urbana, ingles, trabalho, 'Canadá', 'Paisagem urbana e oportunidades de trabalho nas grandes cidades.').
pais(frio, urbana, ingles, melhoria_de_vida, 'Reino Unido', 'Rico em história e com alta qualidade de vida em grandes centros.').
pais(frio, urbana, espanhol, educacao, 'México', 'Cultura rica e tradição educacional focada em arte e ciência.').
pais(frio, urbana, espanhol, trabalho, 'Uruguai', 'Mercado de trabalho estável e focado em turismo e agricultura.').
pais(frio, urbana, espanhol, melhoria_de_vida, 'Equador', 'Otima qualidade de vida com custo acessivel em areas urbanas.').
pais(frio, urbana, portugues, educacao, 'Luxemburgo', 'Um dos melhores sistemas educacionais da Europa com forte presença internacional.').
pais(frio, urbana, portugues, trabalho, 'Macao', 'Mercado de trabalho com foco em turismo e negócios internacionais.').
pais(frio, urbana, portugues, melhoria_de_vida, 'Timor-Leste', 'Cultura rica e crescente setor educacional e de saúde.').

% frio, rural
pais(frio, rural, ingles, educacao, 'Nova Zelândia', 'Paisagem natural rica e educação focada em sustentabilidade.').
pais(frio, rural, ingles, trabalho, 'Irlanda', 'Mercado de trabalho crescente e paisagens deslumbrantes.').
pais(frio, rural, ingles, melhoria_de_vida, 'Escócia', 'Vida tranquila e forte presença histórica e cultural.').
pais(frio, rural, espanhol, educacao, 'Colômbia', 'Sistema educacional crescente, com forte foco em humanidades.').
pais(frio, rural, espanhol, trabalho, 'Guatemala', 'Crescimento do mercado agrícola e oportunidades no ecoturismo.').
pais(frio, rural, espanhol, melhoria_de_vida, 'Honduras', 'Ambiente rural com forte apelo à vida simples e sem pressa.').
pais(frio, rural, portugues, educacao, 'São Tomé e Príncipe', 'Paisagens tropicais com foco em educação e turismo.').
pais(frio, rural, portugues, trabalho, 'Guiné Equatorial', 'Mercado de trabalho em desenvolvimento focado na agricultura.').
pais(frio, rural, portugues, melhoria_de_vida, 'Madeira', 'Região tranquila, ideal para quem busca qualidade de vida no campo.').

pais_flexivel(Clima, Area, Lingua, Motivacao, Pais, Descricao) :-
    (var(Clima) ; Clima = quente ; Clima = frio),
    (var(Area) ; Area = urbana ; Area = rural),
    (var(Lingua) ; Lingua = ingles ; Lingua = espanhol ; Lingua = portugues),
    (var(Motivacao) ; Motivacao = educacao ; Motivacao = trabalho ; Motivacao = melhoria_de_vida),
    pais(Clima, Area, Lingua, Motivacao, Pais, Descricao).
