Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E3653B454
	for <lists+linux-media@lfdr.de>; Thu,  2 Jun 2022 09:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbiFBH2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jun 2022 03:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiFBH2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jun 2022 03:28:43 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B2329FE65
        for <linux-media@vger.kernel.org>; Thu,  2 Jun 2022 00:28:42 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id p8so4047043pfh.8
        for <linux-media@vger.kernel.org>; Thu, 02 Jun 2022 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8wZEhrx3meNoOfRpvSHrZZtZauJF80x1Y9QVY2KLX4k=;
        b=hkhx0g/ikCthA+2PcCVNY3OUxxnTo0xg7jMFVh+7Rtd+5RS5O0XKslp8oCfnC49xyJ
         IzzNN1uFuyAwA2lDNiG9/92fi5bvUCpSbX/x6gDskCxVpDI0M+ojuWhQNF8v90GfAsjI
         Fy+QttsYQwScBrEVrPbwLpWRzrLeI+KAUqSUz81byCFY9buGcdPBAS/M6C8MpD6g7xfL
         TsFsUSJCKFdYifwBudSACq2MT+H9OpZ/Wv81eBqbGcGgPOGLkOPirb63v4edzpubOh3x
         2L0eYH/0cb+nzaTKi71ZuLxSfAPAjC0iTWkmi5k0fUInJXWl08puQrGenFX1KsdTLufZ
         3FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=8wZEhrx3meNoOfRpvSHrZZtZauJF80x1Y9QVY2KLX4k=;
        b=IitW7EH1nbukD40xH9jZYiJgF7xz6yZXbxX4KRthV0E6SnY6FSQAvP72wMBef4Am00
         KqneqVAmWW5xhI567Ew7ZW7b9NcsrFC2YX+lXyDG7uACBF/++fCKPwP6igeCrZnNavbG
         4/rIkjg9D9aknNNhfeKklXsNFHS8XgcYXzA17iyEDeeqeX2MphsxJ7MLg0PyqooXyjoQ
         wvYDQu3n43V0++IInrjERH1T0NG/wZelaqPeUn7cq/Z17FhQIHhOBYSY+5g9FBigBuBF
         n9EY1PamR6MLQM12Z6yHCE/ke+WANxdyWXiEoyAH4LbaHSGIJ1uHLPXHdWFTn/LS4tUi
         vVRw==
X-Gm-Message-State: AOAM530Pl4x/n8W6jPDGGXgKzElHf7iVLRCe2g6SpdjQgyqpAz2b+xP1
        9Ldtj+SKeGQxu3lUPjEVKT80a56FmEnLG6p6zkI=
X-Google-Smtp-Source: ABdhPJzNzH8DrWS3aQJZxovGbL6JugG+NqJnptQtXrAC3qolVCUK8ZgQ0TJojToVGyPiaudIWZ+oH+0wVmyHCRbybnc=
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr71055129pfu.79.1654154921718; Thu, 02
 Jun 2022 00:28:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:488:b0:2a0:ea7e:8adf with HTTP; Thu, 2 Jun 2022
 00:28:41 -0700 (PDT)
Reply-To: robertbailey00023@gmail.com
From:   Mr Robert Bailey <skobo080m@gmail.com>
Date:   Thu, 2 Jun 2022 00:28:41 -0700
Message-ID: <CACA0f+XETAnmUeyv9imr7CgjsvOr_wXw97GQVQUi-dcLRPnSHg@mail.gmail.com>
Subject: SPENDE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:442 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5353]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [robertbailey00023[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [skobo080m[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Guten Tag lieber Beg=C3=BCnstigter
Sie erhalten diese E-Mail von der Robert Bailey-Stiftung
pensionierter Regierungsangestellter aus Harlem und Gewinner des Powerballs
Lotterie-Jackpot im Wert von 343,8 Millionen Dollar, ich bin der gr=C3=B6=
=C3=9Fte Jackpot
Gewinner der New Yorker Lotteriegeschichte, United State of America.
Ich habe gewonnen
diese Lotterie am 27. Oktober 2018 und ich schreibe, um Sie dar=C3=BCber zu
informieren
Google hat in Verbindung mit Microsoft Ihre "E-Mail-Adresse" an gesendet
Meine Bitte, dass Sie einen Spendenbetrag von 3.000.000,00 Mio. =E2=82=AC e=
rhalten
Euro Ich spende Ihnen diesen Betrag in H=C3=B6he von 3 Millionen Euro, um
die Wohlt=C3=A4tigkeitsorganisation zu unterst=C3=BCtzen
H=C3=A4user und arme Menschen in Ihrer Gemeinde, damit wir die Welt zu
einem machen k=C3=B6nnen
besserer Ort f=C3=BCr alle. Weitere Informationen finden Sie auf der Websit=
e
Informationen, damit Sie dieser Spende von 3 =E2=82=AC nicht skeptisch gege=
n=C3=BCberstehen
Millionen EUR.

https://nypost.com/2018/11/14/meet-the-winner-of-the-biggest-lottery-jackpo=
t-in-neue-york-geschichte/

Sie k=C3=B6nnen mein YouTube auch f=C3=BCr weitere Best=C3=A4tigung ansehen=
:
https://www.youtube.com/watch?v=3DH5vT18Ysavc

 Bitte antworten Sie mir =C3=BCber: (robertbailey00023@gmail.com), damit wi=
r
kann weiter vorgehen, damit die verantwortliche Bank einen
Geldautomaten generiert
Karte im Wert von 3 Millionen Euro und diese ATM-Karte wird
Sie erhalten den PIN-Code f=C3=BCr den Zugriff auf die Spendengelder.
Bitte beachten Sie, dass alle Antworten an gesendet werden m=C3=BCssen
(robertbailey00023@gmail.com) f=C3=BCr weitere Informationen zum Empfang
Diese Spende erfolgt =C3=BCber die universelle Bankomatkarte, die Ihnen
zugesandt wird
so bald wie m=C3=B6glich. melde dich jetzt bei mir.

Beste Gr=C3=BC=C3=9Fe
Robert Bailey
* * * * * * * * * * * * * * * * *
Powerball Jackpot-Gewinner
