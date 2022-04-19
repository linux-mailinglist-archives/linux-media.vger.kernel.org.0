Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B38507AE6
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 22:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350654AbiDSU2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 16:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242939AbiDSU2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 16:28:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA74344FE
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 13:25:38 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e21so23952402wrc.8
        for <linux-media@vger.kernel.org>; Tue, 19 Apr 2022 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=jk+At37pWha++fG0bOqH1cehAjORXIhVilgOsoOr4DiVQEWJ7Q1GvtuRDol2+RaZww
         H24QRMFi5eiF6gBlVvMX0xRXf1qscpTti5kE3R9ggMkFo+z7BTAEcsLsYKCf6u9DcFys
         6GQw06yQkdCIjp0S0rQvzHqpqd2hSbyH5g4NmZNlLwMCrIpwCOoIpGOJkelLcUThmx4H
         RDHgbQQdvJXmSNjQTQ7je/fywIObGcoZae1EGm2CXGnkuucfydAoGV7JjrOlVOOqCrzI
         gmiCVnCeRxUE3D9IXYlMvfkhlWNi0YBgAsv8qkSGFAcuE42MWwvDULcyCeagD9zbG1JS
         hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=bXIDCX9Z1FUAA9LfZ/TK1T9AM3UVATwChLHKymefvghIFoIXVNW0u4C/dWQ08KSXmv
         Z40RnA8xzynlK44mrwmtD3NE8eEzibJ0FMhiN3Xgb2OznAM6l3y0N6XD8ss6g5W+orsn
         bQLAegQTmOycKT0OeBKf2IK4E4SMC9mR0Ow4TqAB5zBEYQNkptIV39rYwFJ4GiABUBk/
         8l07Uz0cgPfUVpw+FMGhGIuDImXu2cEEtDluWJ7Wy8Exrf3w5cTIKu3RHvyxzK8vsoK8
         mPIvX58+rPALg5HWrjgQdXJXt5+mP6n8VT8I8Y2SHJqa326DiROlA/MSmuIP2QVv9qV8
         Ysrw==
X-Gm-Message-State: AOAM531hnNeYQuQPUYCrSg54gJSRrK6MWgpSOmUHCDlWLcurMlHX1sYA
        5lyhy4VHkoPhjt7P+DPg0/4ofrv5sIqqoHd2cZE=
X-Google-Smtp-Source: ABdhPJygUGbsmMxwnnpq+a8Nu0zn5exh49TfDNpQphRFfVaqpgsFVn1cxlgftswXyTqfV/17nmK0JAn2gPg8LEvLpV4=
X-Received: by 2002:a5d:4d91:0:b0:207:ac32:cffb with SMTP id
 b17-20020a5d4d91000000b00207ac32cffbmr13083676wru.644.1650399936791; Tue, 19
 Apr 2022 13:25:36 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mr.a.manga99@gmail.com
Sender: arnettdavid1991@gmail.com
Received: by 2002:a5d:4304:0:0:0:0:0 with HTTP; Tue, 19 Apr 2022 13:25:36
 -0700 (PDT)
From:   "Mr. Amos Manga" <mr.a.manga99@gmail.com>
Date:   Tue, 19 Apr 2022 13:25:36 -0700
X-Google-Sender-Auth: s8sQu229s9ZS7TV6lMLuaeoKmd8
Message-ID: <CAPpYQm=32YU-xYJDONfPQ+j3weQDAsHf-DXiGEOh7jbFxcoqtw@mail.gmail.com>
Subject: STRICTLY AND CONFIDENTIAL:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORM_FRAUD_5,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,MONEY_FORM_SHORT,MONEY_FRAUD_5,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_FILL_THIS_FORM_SHORT,T_MONEY_PERCENT,
        T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:432 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5755]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.a.manga99[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [arnettdavid1991[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mr.a.manga99[at]gmail.com]
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
        *  0.0 MONEY_FORM_SHORT Lots of money if you fill out a short form
        *  2.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.1 MONEY_FRAUD_5 Lots of money and many fraud phrases
        *  0.0 FORM_FRAUD_5 Fill a form and many fraud phrases
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good day,

I know this means of communication may not be morally right to you as
a person but I also have had a great thought about it and I have come
to conclusion which I am about to share with you.

INTRODUCTION: I am a banker; I hope you will cooperate with me as a
partner in a project of transferring an abandoned fund of late
customer of the bank worth $18,000,000 (Eighteen Million Dollars
only).

This will be disbursed or shared between the both of us in these
percentages, 55% for me and 45% for you. Contact me immediately if
that is alright for you so that we can enter into an agreement before
we start processing for the transfer of the funds. If you are
satisfied with this proposal, please provide the below details for the
Mutual Confidentiality Agreement

1. Full Name and Address

2. Occupation and Country of Origin

3. Telephone Number

I wait for your response so that we can commence on this transaction
as soon as possible.

Regards,

Mr.Amos Manga.
