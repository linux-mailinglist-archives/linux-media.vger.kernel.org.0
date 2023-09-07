Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571947977AC
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbjIGQbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239328AbjIGQau (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:30:50 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103593594
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:29:27 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bf6ea270b2so8536295ad.0
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694104111; x=1694708911; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rCDBR1fsUEx2p/nApJyW/A5dqpYDTlYo66j8765zGq4=;
        b=MEvEdU8MrFpV/7YUoQSQU6JECI2uh7PLkmXIV8kuj4cix1xB8rng3pNMez37TCG1i4
         O7hiutU8xe+arzr7yQx4vr03PGMcHBdQpqkGG9xwe7iUnukAjex4eD/67mwDxFJr8ezH
         /tlH6/FYbw0K54lny2tBayQqWw9dCObrTsKf3l852mK0BBUsrLl7/Pnl4dV58CLfrfj4
         1OX62AGAPKJaah0cKrPbzbzX6PbvTVo4nrXncVoWZOoV3UVzN7K/5/R/lFb9IU9QFTGE
         aUFgtjsIuSN2PzQgOSCfKXdPg/L5zgHyNmr498XBrjsTk29iklxMeCm5hZMEgOPEacw8
         EbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104111; x=1694708911;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCDBR1fsUEx2p/nApJyW/A5dqpYDTlYo66j8765zGq4=;
        b=SwaRDS/E9cZIY/9LvJjo9aRsAgZrUujvscDhVYlq8gij7yRK953NIIL7Dsuu7ZJG5b
         7b2eXKvM7PEW4k0QQ4Qu2V5W0i3bR15yLIfoW9gTWIPycpT81eyDTU4CB9cG4dRGXqDM
         wc/TswIayVN2FXmNP4TcgwjDI7FSfPspEGrXdKPJrfTH2Qb046+FKj/IN7Zny6muQJze
         jV3XWLn5TkDSi/nsDzlkcKvdEHuau6c78WHUMaBT7GTjnU8R73Z15r1IhXGvJ5RRXs+u
         kmKK/nkTPJbIkZFANzVMzJnuR3ClAJQD13gbpa+/P0IiXZrwot8g6fe56SyyifZ0SmTX
         N0cw==
X-Gm-Message-State: AOJu0Yz8gV3gqgHoN11tda2nRiSg7V5FkuXNRvnk9gA4f6Ko2nmQnhwV
        EY0R7RCjna/Ouiy6mM7Wy1lh3onjvAmNf87uI6wsBrFX3qI=
X-Google-Smtp-Source: AGHT+IFwiwDXm4GB+xvYHK/St1Ow7XmiSoVyNc04HMLcwd8atiMBS7IlfHn/q/6urwJY8FHId0OpJXz6iA5pCRLQRhA=
X-Received: by 2002:a05:6870:3921:b0:1bf:61e3:df1 with SMTP id
 b33-20020a056870392100b001bf61e30df1mr26092651oap.50.1694102210971; Thu, 07
 Sep 2023 08:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:890:b0:125:6733:d756 with HTTP; Thu, 7 Sep 2023
 08:56:50 -0700 (PDT)
Reply-To: westernunion.headoffice@chef.net
From:   Jeremy Hillman <hillmanjeremy75@gmail.com>
Date:   Thu, 7 Sep 2023 15:56:50 +0000
Message-ID: <CANV0NL2PS0TzWXuwDx2yA=OJOAYkJAw9Y2Suy5iVNMu9nyosqA@mail.gmail.com>
Subject: RE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pozor,

Ulo=C5=BEili sme =C5=A1ek v=C3=A1=C5=A1ho fondu (2,5 mili=C3=B3na USD) pros=
tredn=C3=ADctvom
oddelenia Western Union Nakoniec po na=C5=A1om stretnut=C3=AD =C4=8Co sa t=
=C3=BDka v=C3=A1=C5=A1ho
fondu, Jedin=C3=A9, =C4=8Do mus=C3=ADte urobi=C5=A5, je kontaktova=C5=A5 ri=
adite=C4=BEa Western
Union Dr. Achilles Abdera prostredn=C3=ADctvom e-mailu
(westeruniontransferunite@gmail.com). da=C5=A5
ako budete dost=C3=A1va=C5=A5 prostriedky denne, nezabudnite mu posla=C5=A5=
 svoje
=C3=BApln=C3=A9 inform=C3=A1cie, aby ste sa vyhli nespr=C3=A1vnemu prevodu,=
 ako napr.

Meno pr=C3=ADjemcu _______________
Adresa: _________________
Krajina: _____________
Telef=C3=B3nne =C4=8D=C3=ADslo: _____________
Va=C5=A1a emailov=C3=A1 adresa _______________

Napriek tomu Dr. Achilles Abdera dnes poslal 5 000 USD cez Western
Union vo va=C5=A1om mene, tak=C5=BEe ihne=C4=8F po prijat=C3=AD tohto e-mai=
lu kontaktujte
Dr. Achillesa Abderu a povedzte mu, aby v=C3=A1m dal Mtcn, meno
odosielate=C4=BEa a ot=C3=A1zku/odpoved na v=C3=BDber 5 000 USD a dajte n=
=C3=A1m vedie=C5=A5 =C4=8Do
najsk=C3=B4r
dostali ste v=C5=A1etky svoje prostriedky.

S Pozdravom.
AGENT Z=C3=81PADNEJ =C3=9ANIE
