Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F49607656
	for <lists+linux-media@lfdr.de>; Fri, 21 Oct 2022 13:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiJULh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Oct 2022 07:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiJULhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Oct 2022 07:37:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9677E4DB0E
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 04:37:17 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c20so3284223ljj.7
        for <linux-media@vger.kernel.org>; Fri, 21 Oct 2022 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qkaiv2o3NVqHRnpYdsOz0DnLx29kYFAjU3QBqzY3M+0=;
        b=UZ82XeRyAW4KdaBkeBt0o9ghzP7pHeYUKs8Q8Mh6AdyFeME85nP9XaNck0DqpUpXh+
         nWJQD0CxUz5YjGpbqYWEUCs807bnTwH/QlmQkf5hyIVADeggI8x7yUqsy48bRSb53l4S
         h88/o5pgmUIznge2VpFxicpiCeaUJAiAW1h5tZMiIkaPBi2WtVAJQrAVah5gks97tlVW
         eUXlxUEXGa0QygninAOK2qf+8Tok7S57b7r2Se1oZ0uOFBUfWSIBYB7Azw59wmBMI54O
         0NM01JHALqsVk04bnp076H3UbPWQMalEITmAVdEaam0TWkTa2vgRGfPVU7g4zhPXNQMa
         6NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkaiv2o3NVqHRnpYdsOz0DnLx29kYFAjU3QBqzY3M+0=;
        b=nyH9N4wG5xX/MmQJpIWnu7LPp45g6e8SnWFUdHG94K24IpAMxEy0h7X21WZTjK+vjM
         iJQz6y7Ws/pSUfdHPxh9FFi/W9vnGPI84fpBYFBz3N8Dgfl/n7czEYww43JgPMVNPtia
         ZutqPhtDPjBRJzMVcZUnqp5spRPPRHlqpAIfdZ9vfHG1zQv54GZdpgYEvPw1VtCOPzsC
         ueffUVQ5c3KLDO+nAaaXwOGU3oJBKSz+FF0AtnvKNmLKg+wnsLgpyTTRlhCDWxCtZEar
         MmJn//YzpjLMP0lLncvlwVsoZbBBaSEIewI49FG+EKJyAex/jNeM+CFdoGtkP5G+wgmJ
         AnOg==
X-Gm-Message-State: ACrzQf0CJU9AcKKx1dywnuJvscTJGIYhB5QxbtWBLxjBLyCBZa5/bmOd
        Lk7iN+CHvgnzOMlq0uPPScwHnE/cCUXk5NuEN9s=
X-Google-Smtp-Source: AMsMyM4lIQkLr59jswu1yJ4hrOFbU1Y+ZZEJ/qoBJiBoBypM0/lBwxFpq3zgEK2PQ84hqS57EjnU9iAHUn+d9OwOkKw=
X-Received: by 2002:a2e:83c6:0:b0:26d:e24c:ec01 with SMTP id
 s6-20020a2e83c6000000b0026de24cec01mr6302811ljh.340.1666352235392; Fri, 21
 Oct 2022 04:37:15 -0700 (PDT)
MIME-Version: 1.0
Sender: safio8242@gmail.com
Received: by 2002:a05:6504:2108:b0:1f6:a3e9:8eaf with HTTP; Fri, 21 Oct 2022
 04:37:14 -0700 (PDT)
From:   Hannah Alex <hannah.aalex1@gmail.com>
Date:   Fri, 21 Oct 2022 11:37:14 +0000
X-Google-Sender-Auth: rkIxcOw7Avwso349MI0nhlmdwzs
Message-ID: <CABdtqMCBYqWaNZ0uZ_0cmvwAyfyBiWCyJ85iKXvgWkYPkF9Bow@mail.gmail.com>
Subject: =?UTF-8?B?T2zDoQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Querido,
Meu nome =C3=A9 Hannah Alex, gostaria de saber sobre seus servi=C3=A7os par=
a ser meu
parceiro/investidor estrangeiro e me ajude a transferir e gerenciar meu
fundos investindo em empreendimentos lucrativos, como a compra de empresas
a=C3=A7=C3=B5es ou Im=C3=B3veis em seu pa=C3=ADs. Eu tenho uma quantia razo=
=C3=A1vel que eu
herdado do meu falecido pai, que eu gostaria que voc=C3=AA me ajudasse a in=
vestir
seu pa=C3=ADs. eu anexo minhas fotos pessoais, comprovante de pagamento do =
fundo, meu
passaporte internacional, certid=C3=A3o de =C3=B3bito do meu falecido pai e=
 um
documento de quatro p=C3=A1ginas
testamento do meu falecido pai. Estou lhe enviando tudo isso para que
voc=C3=AA possa ter
confian=C3=A7a de que voc=C3=AA est=C3=A1 lidando com uma pessoa real
Observa=C3=A7=C3=A3o: abaixo est=C3=A3o os principais motivos pelos quais e=
stou
entrando em contato com voc=C3=AA.
(1) Para fornecer uma nova conta banc=C3=A1ria vazia na qual esse dinheiro =
seria
transferido. se voc=C3=AA n=C3=A3o quiser que usemos sua conta pessoal.
(2) Servir como guardi=C3=A3o deste fundo, uma vez que o banco insistiu que=
 seus
acordo com meu pai era que eu fornecesse um parceiro estrangeiro antes
liberando o fundo.
(3) Fazer arranjos para que eu venha ao seu pa=C3=ADs para promover minha
educa=C3=A7=C3=A3o e obter uma autoriza=C3=A7=C3=A3o de resid=C3=AAncia em =
seu pa=C3=ADs.
Por favor, responda assim que voc=C3=AA ler esta mensagem para mais
detalhes e provas.
Atenciosamente.
Hana Alex.
