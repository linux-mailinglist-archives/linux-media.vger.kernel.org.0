Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490A053EA0E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235948AbiFFL6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 07:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbiFFL6p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 07:58:45 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A2E283B58
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 04:58:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n8so11955440plh.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=oFPao6+FHTUKOYc11RmLF8YTaUlvFn2TAMXlqT2wmEQ=;
        b=Nw9H+Q5s1W8hmd+2f4FkFfV5zDv9vUC9f/i76RkmO9ByCNNx39f6iOnu+Q4vasA6/R
         cIKYhqKdwN/LlaY6R4CCtviCtccl5yNoMBtJ7BZ9Pb9pSacd732UlSxBL9Pz5/9c7mSa
         d/lZXbUW0A3RV97N03x54kGxzx9qa3ErjwwpExFeLzLj6zWLcS+tk7H/UDCU/GP/LUXh
         FyH8EqgBHLK3HWKKz26PgWJEL6QDU+f0QP3Z6+4aXKjQBcZgH0latez3tAzZ4d75/WaF
         3cfU80mED3VPtfAcB/qSfBv4k+E7JFVk9tThpKc9S41kHlTBEMuDiRr2igGSwTkCRZ+q
         uLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=oFPao6+FHTUKOYc11RmLF8YTaUlvFn2TAMXlqT2wmEQ=;
        b=s8ZUaAK7fJw0XQpatWF+A2SkoIM8JU0Canfb5wMVIkRvCLRdy7aqvUjTMdGRA3EWCx
         Wm2ar3vqicSW+3LkcLhPtPicD09CowZSeqXwAgKiHQSvP3tzRM+NXXUyCob3fcW16bem
         GTrmijB7JaMOIfS4yCadyFGskKXnGM7ADF8r6xqVfysTuHQsnPftrCeFaGwdtsc1SadB
         JTf02KWyzx8Y2MeDHBSwUG0Wg+NEd9HxZFBcuiYYznyGDglmCSZCfyNfMKsPEFl3wUn1
         Ml5e88m7ftaHP5LHfKR6pfOG28DzqF/djv5paSedvPLxiDfo5rYWGRmA5Uyr6v5ECAmO
         24pg==
X-Gm-Message-State: AOAM532RonKqdF7CZ5sLEKmzva4wQR4HJr2zd1sQHyZarBZgwSCXiWrj
        V0vnivtdL+AWcxMfnTx2Wff6X6uTVRnJ8FZUdPg=
X-Google-Smtp-Source: ABdhPJzEDe9mpjYP1J0W+/QxPiVTNVaEg61A8vEM1OJak7dr81/e/FSqHIv05PYC4CH0rEvo95OMMT3zeyNudRhcm0w=
X-Received: by 2002:a17:902:c945:b0:163:c3c3:aff8 with SMTP id
 i5-20020a170902c94500b00163c3c3aff8mr24064129pla.56.1654516717308; Mon, 06
 Jun 2022 04:58:37 -0700 (PDT)
MIME-Version: 1.0
Sender: mohammeddrashok@gmail.com
Received: by 2002:a05:6a11:e28c:0:0:0:0 with HTTP; Mon, 6 Jun 2022 04:58:36
 -0700 (PDT)
From:   Ibrahim idewu <ibrahimidewu4@gmail.com>
Date:   Mon, 6 Jun 2022 12:58:36 +0100
X-Google-Sender-Auth: M0qNExx_6xQoQCUm8NhVHS9uYJ4
Message-ID: <CAL=ghb48ZZsQsNS0izjpj4wXRZud-j4mkdbRyOTOsJZ=RJYLGw@mail.gmail.com>
Subject: GREETINGS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=ADVANCE_FEE_5_NEW_FRM_MNY,
        BAYES_99,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MONEY_FORM,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:641 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9959]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ibrahimidewu4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 HK_SCAM No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  2.0 ADVANCE_FEE_5_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear,
                       Can you trust a financial relationship that is
mutually beneficial to us both? I have received your name and contact
information from your country's banking data Information, hoping that
you are interested in what I am going to tell you.

I'm Mr. Ibrahim idewu from Ouagadougou, here in Burkina Faso. I work
for coris bank international. I am writing to you about a business
proposal that will be of great benefit to both of us. In my
department, as a banker, I discovered $19,300,000 in the account of
one of our deceased foreign clients.
The choice to contact you depends on the sensitivity of the
transaction and the confidentiality it contains. Now our bank has been
waiting for one of the family members to file the application, but
nobody has done so. Personally, I have not found family members for a
long time. I ask for permission to present you as the next of kin /
beneficiary of the deceased, so the proceeds of this account are worth
$19,300,000 to you.

This is paid or shared in these percentages, 60% for me and 40% for
you. I have secured legal documents that can be used to substantiate
this claim. The only thing I have to do is put your names in the
documents and legalize them here in court to prove you as the rightful
beneficiary. All I need now is your honest cooperation,
confidentiality and your trust, so that we can complete this
transaction. I guarantee that this transaction is 100% risk-free, as
the transfer is subject to international banking law

Please give me this as we have 5 days to work through this. This is very urgent.

1. Full Name:
2. Your direct mobile number:
3. Your contact address:
4. Your job:
5. Your nationality:
6. Your gender / age:

Please confirm your message and interest to provide further
information. Please do get back to me on time.

Best regards
Mr. Ibrahim idewu
