Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343906AB7E0
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 09:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjCFICa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 03:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjCFIC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 03:02:28 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92BE20548
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 00:01:52 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y14so8690626ljq.4
        for <linux-media@vger.kernel.org>; Mon, 06 Mar 2023 00:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eCxcDPuwuFuyyMyHFV3kcsYj1QGLAv+5TSKB/lMJQo=;
        b=hL3Wpy0xapUbBn8CE3040sYOgM9vEOjbF2vzfrb72me0FVO3h5OZMMOuFI3YjYdf2z
         3nv/pG/Kt88WuKgEPtQNcO2iH3s+68XbvIfX5N2ly1mgEWC95HEP5zWplvWGc4y6jhaN
         ZQYpkylIgNSwzS7Zwn5OMuQWJQToagi731uX3zydPnEltqMGuwOfwUVwz188Pum8mkmh
         bxPTGI6hPMj/Ya7lzOAG8vEg0jW5JsFHdJ/QAJY8n4ZRtckQ6ewBdLPtVVHIDP9HZKiI
         8NZJ3khNcjBC0F6W1HXIff+lbDcWRHEPK1Dco+Zaia7Yzkkyxe+tRLARgsZOZPClnKvb
         wNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eCxcDPuwuFuyyMyHFV3kcsYj1QGLAv+5TSKB/lMJQo=;
        b=7BCq3tr2mLqSCefd7Toz1M+XXnqMI5U2WUyFLC/8YWF0AAZx+Ep0D8l+b0Z8SBGnBP
         3ul3tv5bF1doLltMkjjUup3fEl5Ow4RDoHvE4k0Te2t2Sn6srRXmmSCBDEt/VEuKc6X+
         auAP0QwUy3y5MOhrrkruIXWV2goDKlRzV4TlOKHQZ+sZpVKDcd10rsevdil6o1rSCvQA
         RMBDRDix4Rl+Dq6gcjqQiSj/vGosgfwXGPyJhsfmu/LfskGEpKxiAVLP5ETUv1Cp18nL
         fempI4Qa65TdsJkPekxY9pfEmGfj0/Vy1AWG+/ZeAg4J61xBQbfam3INrTDoB5/Ky50E
         4mYQ==
X-Gm-Message-State: AO0yUKWKaE+ZGjizs3Nc0jLjdwQTkRQDDyIKskoAcf3mEbW2Hpka6nB+
        Zjf6/xroX7+ydL49n0jDk1jYAroH6RCCI3/bBtE=
X-Google-Smtp-Source: AK7set9mkqgdAWNo5RkgF2bRFB0cD/jUiuF3ArA1xVQoSm6V54mpdyM4p/a+uAuLTS1l8pyaLP9oHBDNK6EwDEnfiyc=
X-Received: by 2002:a05:651c:231b:b0:295:ac45:f08e with SMTP id
 bi27-20020a05651c231b00b00295ac45f08emr2871171ljb.7.1678089650256; Mon, 06
 Mar 2023 00:00:50 -0800 (PST)
MIME-Version: 1.0
Sender: aishagaddfi05@gmail.com
Received: by 2002:ab2:4d18:0:b0:187:27ef:c5fc with HTTP; Mon, 6 Mar 2023
 00:00:48 -0800 (PST)
From:   "Mrs. Rita Hassan" <ritahassan02@gmail.com>
Date:   Mon, 6 Mar 2023 08:00:48 +0000
X-Google-Sender-Auth: L0TLxZMnmvwfmpL1T6HxQccHUtI
Message-ID: <CAJzdtKMYZBqgHk6J6fzcX=AK+fUTaP7Ng-aUPysy382W3CvCWQ@mail.gmail.com>
Subject: URGENT.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_MONEY_PERCENT,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22d listed in]
        [list.dnswl.org]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9997]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9997]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aishagaddfi05[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ritahassan02[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please forgive me for stressing you with my predicaments as I know
that this letter may come to you as big surprise. Actually, I came
across your E-mail from my personal search afterward I decided to
email you directly believing that you will be honest to fulfill my
final wish before i die.

Meanwhile, I Am Mrs. Rita,  62 years old,I am suffering from a long
time cancer and from all indication my condition is really
deteriorating As a matter of fact, registered nurse by profession
while my husband was dealing on Gold Dust and Gold Dory Bars till his
sudden death the year 2019 then I took over his business till date. In
fact,at this moment I have a deposit sum of $5.5million dollars with
one of the leading bank.

Therefore, I want you to receive the money and take 30% to take care
of yourself and family while 70% should be use basically on
humanitarian purposes mostly to orphanages home, Motherless babies
home, less privileged and disable citizens and widows around the
world. and as soon as I receive your respond I shall send you my
pictures, and with full contacts of the bank please contact me for
more details on this email. ( ritahassan02@gmail.com )

Yours Faithfully

Mrs. Rita Hassan.
