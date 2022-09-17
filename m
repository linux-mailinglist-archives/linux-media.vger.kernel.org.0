Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508065BB834
	for <lists+linux-media@lfdr.de>; Sat, 17 Sep 2022 14:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiIQMbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Sep 2022 08:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIQMbB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Sep 2022 08:31:01 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126B52F389
        for <linux-media@vger.kernel.org>; Sat, 17 Sep 2022 05:31:00 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g5so36248979ybg.11
        for <linux-media@vger.kernel.org>; Sat, 17 Sep 2022 05:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=YrZzsr76o+8cdLFX9duugjxnFaPrysczJIfNK8qi1Go=;
        b=DwovTmLdRb6Jv99vm7tU6Qtpi9HOdhA4/WeSZaL/KXmapZegdQUOsyJxUnTM99sG7B
         zQSHCRt073AqhRcL6BI96wR7I7ciTOuvBsmINQI1aJMqgdrNTjEKHieim7gR+ACEorDR
         gag5HAQD4UogVYzmu0pPzulHbC0w9SbQxwfijBJAVrkcC22hh1QgunzYaEdsxIQq961+
         hnzxkHx0lk9so7E8lP/3I/PQCzaHFGX8r+acGij3FhPKrqabSRg95/BzVYK/n6KDzKiz
         axZqCf6+JhEs4bBTHkY4CsAL9r/bsG/6OK24uqnGPX+3rup+MI+QQ533y3Ll4mx/p94T
         c1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YrZzsr76o+8cdLFX9duugjxnFaPrysczJIfNK8qi1Go=;
        b=lu+kmuEh7Awvz2OyWAbyPSa15K8ix9fWW3xmeSHQYzbldrGcAxH3EOTmtiqzeHduZ2
         wrtbNaOynrvHncYg+5srCVl51wCme4eCR3wWO9GopjlnZOFe/mSZoAMOS+HKE9yTyMCh
         mz3bE3ZegfVgoBmUDaG1G7z6fD4XhLMZtk4iF4RTm90LMzYA8KjcNcOImkh8FEP1t7A2
         TdkJzJqtSR863/RSOlZBGpBqNiJMKJX71wuCpLp8sVyMV/aACcmN5fvJHuZjgI5TIb9/
         DJtlYDa4buKzgIusM/SGWX4Ujj2VBD4O/nNwFoxzHvMEXkuQH+TLN1+Z8pprkCtTTepo
         zYSw==
X-Gm-Message-State: ACrzQf1awdB5SHmf7c1Sgov1FfCQbao0NpFNqahYSz0ZRIuqxzhfQJ+/
        J29OcDwkG/O5Eb3ZADvDIGgLDvSmPxCi0xt5VmU=
X-Google-Smtp-Source: AMsMyM7Fso8CRUQg+Fog53Di8wZaDN/9nI85ZOXw3brUJkaEabLNoTZj91x6M3Y3jAOYKOHSUHnbq/shMtT8iXZXy50=
X-Received: by 2002:a5b:4c5:0:b0:6af:3d83:9335 with SMTP id
 u5-20020a5b04c5000000b006af3d839335mr7786655ybp.422.1663417859145; Sat, 17
 Sep 2022 05:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:a404:b0:305:7c10:3780 with HTTP; Sat, 17 Sep 2022
 05:30:58 -0700 (PDT)
Reply-To: abraaahammorrison1980@gmail.com
From:   Abraham Morrison <sambchambers06@gmail.com>
Date:   Sat, 17 Sep 2022 05:30:58 -0700
Message-ID: <CA+RS1P1x=vOXt+uqZ6tcTWM6CVXM+HT5+mXBfg8ZNaeK4ArDGA@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b34 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.1131]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [sambchambers06[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sambchambers06[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [abraaahammorrison1980[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.5 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Uppm=C3=A4rksamhet sn=C3=A4lla,

Jag =C3=A4r Mr Abraham Morrison, hur m=C3=A5r du, jag hoppas att du m=C3=A5=
r bra och
frisk? Detta f=C3=B6r att informera dig om att jag har slutf=C3=B6rt
transaktionen framg=C3=A5ngsrikt med hj=C3=A4lp av en ny partner fr=C3=A5n =
Indien och
nu har fonden =C3=B6verf=C3=B6rts till Indien till den nya partnerns bankko=
nto.

Samtidigt har jag beslutat att kompensera dig med summan av $500
000.00 (endast femhundratusen amerikanska dollar) p=C3=A5 grund av dina
tidigare anstr=C3=A4ngningar, =C3=A4ven om du gjorde mig besviken. Men jag =
=C3=A4r
=C3=A4nd=C3=A5 v=C3=A4ldigt glad f=C3=B6r att transaktionen avslutades utan=
 problem och
det =C3=A4r anledningen till att jag har beslutat att kompensera dig med
summan av $500 000,00 s=C3=A5 att du kommer att dela gl=C3=A4djen med mig.

Jag r=C3=A5der dig att kontakta min sekreterare f=C3=B6r ett bankomatkort p=
=C3=A5
$500 000,00, som jag beh=C3=B6ll =C3=A5t dig. Kontakta henne nu utan dr=C3=
=B6jsm=C3=A5l.

Namn: Linda Koffi
E-post: koffilinda785@gmail.com


V=C3=A4nligen bekr=C3=A4fta f=C3=B6r henne f=C3=B6ljande information nedan:

Ditt fullst=C3=A4ndiga namn:........
Din adress:..........
Ditt land:..........
Din =C3=A5lder:.........
Ditt yrke:..........
Ditt mobilnummer:...........
Ditt pass eller k=C3=B6rkort:.........

Observera att om du inte har skickat till henne ovanst=C3=A5ende
information helt, kommer hon inte att l=C3=A4mna ut bankomatkortet till dig
eftersom hon m=C3=A5ste vara s=C3=A4ker p=C3=A5 att det =C3=A4r du. Be henn=
e skicka den
totala summan av ($500 000,00) bankomatkort, som jag beh=C3=B6ll =C3=A5t di=
g.

V=C3=A4nliga h=C3=A4lsningar,

Herr Abraham Morrison
