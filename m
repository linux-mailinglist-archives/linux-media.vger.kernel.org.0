Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E64D4D27B5
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 05:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiCICTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 21:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbiCICTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 21:19:44 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970B255769
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 18:18:42 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id h2so511436ila.12
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 18:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dzFAOxXC/7RCVjCuqlK9btoE0XiuVI7vKQUl87dn2ow=;
        b=EH18Vr9kkfhJ0Xj7waoPuYg4xRN8+uNJHIITpkWABJwEIdrXgO9Qvzdb7ena5TZS3u
         4qif5pt71gcaZojshCrTa0gshEPaVYxl9UkCMiHGSIMPz6peJMfhnCz7aU697JT0XgoD
         rqv3NCsx1EQ+VA+rwTwlaPhwNNU/BrcZXB9Vpinx+B7UOZHBPvqmeWHNCW/YP5W8TrOB
         TXHMmF9ILGQwyKxapzIyD5eDQYEhwv+jlxqCOO39X0i04shddIFVLNRNOPNstFs5j9w+
         kpxDf/I0SwOWu3PUUOLsMB72NZ7VLRWeBbzAm9UqtLKpAXZuKjdsW5lYR9Z1kfBXdQls
         6qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=dzFAOxXC/7RCVjCuqlK9btoE0XiuVI7vKQUl87dn2ow=;
        b=jhoCvlrXZJXc6RMqkAmJXvwNblXQUlZKbB99ppasetB1pCBGtFh7kT0Cli3cCy+xtS
         /moaYPDPKbgSPkv4R960AoFZjPceoAPyvuMYDgJEn+LjVLtGobfPu4Ir2TzpaA5qR5AB
         h1QGXbVwVLg5YFaYoS6PAoCmz4aYKRyx9dME8NMwKVUJwZkCxoAjBxwIyaNbkrAignFK
         Xwl1LO7vxuvhpEiC4k1xyR/ecNOfYniXYU1BHbzWYYLjIzieomlTs/iG/QrFmlCqFU1D
         Ekh5ChHQdWaNndXpxIK7vJZPEysM4Dml4N5i2y0zgmPQWryx7VGMOhAMhYAQVohdbdQa
         xfDg==
X-Gm-Message-State: AOAM532hfeBD7MC1XsIxCtUzG9k51O7BYkcc30Cw3SJfnNhgS+7BUs6U
        rlOj2EILgQILUq5MTpySoiWv7wq4kbqedtdZ+Y4=
X-Google-Smtp-Source: ABdhPJzsjuZwzK6YRI/dTFNSojo+0qgPE2OtxjP9+5k8b7AVcHCOypwTsbtXQy4ARZ44oKOXkPLPQJYn8v0wFlOVYvM=
X-Received: by 2002:a92:b009:0:b0:2c2:c409:1252 with SMTP id
 x9-20020a92b009000000b002c2c4091252mr18208295ilh.8.1646792321865; Tue, 08 Mar
 2022 18:18:41 -0800 (PST)
MIME-Version: 1.0
Sender: adamsfrancis145@gmail.com
Received: by 2002:a05:6602:1352:0:0:0:0 with HTTP; Tue, 8 Mar 2022 18:18:41
 -0800 (PST)
From:   Vera Wilfred <vera.wilfried145@gmail.com>
Date:   Wed, 9 Mar 2022 03:18:41 +0100
X-Google-Sender-Auth: xFQCXLBMiFERHbT9-MWPlxZRacE
Message-ID: <CAGVJC0MhAWH+EK9RvvRqN7G9u9==L+QsSU6ijZXr23w4tnaHng@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,
        MILLION_USD,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:12b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5062]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [vera.wilfried145[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adamsfrancis145[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 HK_SCAM No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
Hello,

I am Miss Vera Wilfred from Abidjan, C=C3=B4te D'Ivoire (Ivory Coast) . I
am a 22 years old girl orphan, that is as a result of having no
parents, I have about ($10.500,000.00 United state dollars ) Ten
million, five hundred thousand United state dollars.

Which I inherited from my late father he Deposited the fund in a fixed
/ suspense account in one of the prime banks here in Abidjan,

My father used my name as his only daughter and only child for the
next of kin to the fund.

Secondly, on your full acceptance to work with me regarding this
purpose, kindly indicate your interest by replying back to me so that
I will furnish you with the needful information and the details on how
to proceed further. I will offer you 20% of the money for your help.

May God bless you for your prompt attention, My best and lovely
Regards to you and all your family as you contact me for more details.

I need your assistant to help me invest this fund in your country
,contact me now for more details.
Thanks

Vera Wilfred.
