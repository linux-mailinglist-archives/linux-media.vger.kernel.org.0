Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407FF525FBC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379488AbiEMKdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 06:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379445AbiEMKdp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 06:33:45 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE3B1A7298
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 03:33:40 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id y76so14616934ybe.1
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=RvA5lzkLxU8tpsVAzbO184Ql82UZtj1ZXVomhVjQdiU=;
        b=PZAJcpSB3TfSvJk9a3aQ3cgBxVTivWXW4g2NSIBxBr16G1Ra2UHH3SvzJZftyCsD+m
         sBuXzt0o5cSQzaqlE8eUw4tFPs64JEppKs39RDuQg8JQ+RhjjtizVrFbJB9h3dWstQO5
         15CYkyuyJCC6YHc7uBpCaT3m67na38/swWp+mS2MHqsflHrBQy3Kr55tXlaDw0XRFTzD
         OQxMY0hJwEBzgvlTdvfaxy6Ce36ic3G0O0GDgt0tdVcN0a1GcSKbPHRw2IrC5+rGlFW3
         Wnu6+7296l+bGp0nNIxZZ9NmUf9o+pqxRIah/7dN9am7+Cz3VhEE1Lyb7OxM0RPW/oop
         Nj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=RvA5lzkLxU8tpsVAzbO184Ql82UZtj1ZXVomhVjQdiU=;
        b=aU5s83twi9RjG8CzUJU9IUP6pBCER03EV+H8bttbJGTCc5AgjoPGVOdgV34IM6vXih
         4tHFDQSOzHdj0xtaePDDD6ErKTFjWosf51AjqwyRw+fBtx/QUKotTjlW3gCVlBf62jUu
         opK4t+P0vBr5qjK8OQfXC+YWbL3n4+Q+q4D+Mkjk2eTXITk3DDXwbTTbATU1EO6RK84Z
         4J0P4DSdO7wuhuxL+QN4438+XOGpBANfNVJKSSKHTfsPEeBuIeMxC1JbubsoBmfCri9o
         lk8bxjgLC8SrbHi1SvIAm7cdNOwLw8FuAXPjngBxMUR8Jz9bzI70QvKMORFFq+N45mnG
         T62A==
X-Gm-Message-State: AOAM531qkIVbw3A35m86d8LJcsUUMOe+C9hz42Zqg+Xa2GJpYXJ/GXqb
        Cg9jrbE6Sp9THZi4FQQccqTsW5u2s+BvotpW6mI=
X-Google-Smtp-Source: ABdhPJxdTQOkKBi6FuTDJmTpmT1rRAfdqh4qODGeb5wMJmNMEpr+EPZqHGa78S2jW0jloUKrCbUoO6uvz19BF7zECvM=
X-Received: by 2002:a5b:8cb:0:b0:645:d65f:dcdd with SMTP id
 w11-20020a5b08cb000000b00645d65fdcddmr3829020ybq.233.1652438019980; Fri, 13
 May 2022 03:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:dc0a:b0:2a3:301:ca60 with HTTP; Fri, 13 May 2022
 03:33:39 -0700 (PDT)
Reply-To: gb528796@gmail.com
From:   george brown <kotsllos2000@gmail.com>
Date:   Fri, 13 May 2022 12:33:39 +0200
Message-ID: <CAKnPpxDTYt+M9Eohyh7S1qVdZXyj2-LYadZNJ0Whc20UbXNj3w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,REPTO_419_FRAUD_GM,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2e listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  3.0 REPTO_419_FRAUD_GM Reply-To is known advance fee fraud
        *      collector mailbox
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kotsllos2000[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kotsllos2000[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gb528796[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ahoj

Jmenuji se George Brown. Povol=C3=A1n=C3=ADm jsem pr=C3=A1vn=C3=ADk. r=C3=
=A1d bych
nab=C3=ADdnout ti
p=C5=99=C3=ADbuzn=C3=AD m=C3=A9ho klienta. Zd=C4=9Bd=C3=ADte =C4=8D=C3=A1st=
ku (8,5 milionu $)
dolar=C5=AF, kter=C3=A9 m=C5=AFj klient nechal v bance p=C5=99ed svou smrt=
=C3=AD.

M=C5=AFj klient je ob=C4=8Dan va=C5=A1=C3=AD zem=C4=9B, kter=C3=BD zem=C5=
=99el p=C5=99i autonehod=C4=9B se svou =C5=BEenou
a jedin=C3=BD syn. Budu m=C3=ADt n=C3=A1rok na 50 % z celkov=C3=A9ho fondu,=
 zat=C3=ADmco na 50 % ano
b=C3=BDt pro tebe.
Pro v=C3=ADce informac=C3=AD pros=C3=ADm kontaktujte m=C5=AFj soukrom=C3=BD=
 e-mail zde:
georgebrown00006@gmail.com

p=C5=99edem d=C4=9Bkuji,
Pan. George Brown,
