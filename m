Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F700536C5D
	for <lists+linux-media@lfdr.de>; Sat, 28 May 2022 12:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbiE1Ko2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 May 2022 06:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234067AbiE1Ko1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 May 2022 06:44:27 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A592C5
        for <linux-media@vger.kernel.org>; Sat, 28 May 2022 03:44:26 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id w10so6472665vsa.4
        for <linux-media@vger.kernel.org>; Sat, 28 May 2022 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=JEXCayo16kmZ32x8Td4+++LErx6W51mB5TgV+SIHHS+JTlH1SmSYe05MZLptDXhIi6
         q09ALCiX+Q9owcDYscUSaRjFpkChbGjR8HTEucmbWnrGRs7mL7wEzuFtwY1asgUl+vbA
         Nk/eua+5sYZjC99I4Scw+x8ONQokF+YOmTs8RQ+LC8/JY+XW58CFKeK9AJhkSOUQv+xN
         0oToeE0NeF+lZkVaGH/kAERst0aTbM75QtM171NBfeNplqfVSbV4s+C/DQmMn5DecwVV
         Q2h0qZQt1ODZn9fIKq/EQX3Szm8gYHWiBdSyj3l+LOmXOnr+NF1ReARBZxpjpIv/aaaq
         L8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=SUWQMmwZSct1NUq5pHL/uGOr0m/f9iWjJQkP63QJuAY=;
        b=jehAloAQQ8r1tds+VPhsjy3/73sprdsxD3nf1NFSBVZCaCM0tTileKyg2/3Xxv3CqD
         1TA/gULFrBaMnX5Te3Ec7lwweiZqs9C+gVTBMbqxkOB80xLoqrft6ILw1AfFTdxbyMxU
         7KFLGnPmH/jT+Ym8fqaVblUSFecw8OHjnaLbDbkwt7FY2YMlBY4IsI3B0jtTTXiMXoV4
         qFoJ0LyUhj1QeOLXlm10sRT1d1IHoUxNXLIpraq844gRHk7j3f4QmfC6ngxslV4zp21d
         RNDgA3aKcS5lr2XZIXocsXk0ftPndyWvV8AyNTEfQAUnClmn9IQPWGwtlZTPgV26jvW4
         K+5Q==
X-Gm-Message-State: AOAM530FyIsSYg+vqJa80iixhSquZtodQtMR4Uvz0XJhuv6akrNaxmOB
        pq6jQkLbFysS1pccN//+r2svlIIQ188VZTBya7Y=
X-Google-Smtp-Source: ABdhPJwfnTxXKx+oJZB8dsKrY6aazeX/HtpqmoWraBwmuXpI050Zyy2zPaTYvsc9O2ZGxAeTMqw0NszX5plT3GlM2iE=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr19541502vsa.38.1653734665638; Sat, 28
 May 2022 03:44:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:612c:1095:b0:2ba:f7f:f651 with HTTP; Sat, 28 May 2022
 03:44:25 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikarm <kodjoafanou2001@gmail.com>
Date:   Sat, 28 May 2022 10:44:25 +0000
Message-ID: <CALgh3emw-XyPko=zBO6kjMz9DUmpbUDCx5YYS7xAAo2GRMwYXQ@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4996]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kodjoafanou2001[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kodjoafanou2001[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jub47823[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear ,


Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.

Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
