Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14DC17A6CFD
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 23:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjISVhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 17:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjISVhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 17:37:15 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48CCBD
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 14:37:09 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3ade77970a9so627103b6e.2
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 14:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695159429; x=1695764229; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx3VWfKW3EtNyZed4FnlPCOsuD/vA9pv6x4aqpyK3AA=;
        b=ce7XmMpQbbDMWufsL/y6cOMfs3UrmKQ9245V/4t5LbXGI3H6Y+D3s0mE0ZL5pohQdM
         Nvg6vM8FaP7IQ3pjnU71SCeQrcqfK5eaqO8AiEoyHIWzyEXsyemD+rIPFFE5m+xhoQ29
         ul6gOTDY63SrXmPavflGSWdSoTGll5D9IAem45g+sOoQKCEsNydNulseD4FJRzp/rvHQ
         UrKRzukYBIzneUyz8URFE9ocvt8uFbIGZOgGzJwgt90tvVk/G3fUCOMs1OBuuZ00Av1S
         2LJRJOTFjAAu1cK3yrh2oDd1M//7VTzGK6u/AKYYavVjRVyQgVCfd35hmBap5eMf1xDU
         t6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159429; x=1695764229;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mx3VWfKW3EtNyZed4FnlPCOsuD/vA9pv6x4aqpyK3AA=;
        b=F3kfhveI94iBxRrHmNa159xoV6m9lAkf+694AzoZxW6LOVe+9B4ON+mdoMadJjmYa3
         Uyg//XcDhOAf0SfGiWQRh90mVxEd3eOaYsfqnwWNhgIMiER2cuuWgrXYURJc4MoHt0Js
         6job4zs+O2x7hEBDzZogql/91Sk+k1aqZPiltMPniw1+56AsDKdWIt1IXc75oNhxvClT
         XyR/GEezf9KvTGAZ0nfNjFnUCJMMVqy1kmbpCHaP+TyaGcA8xPvi7+FIbR/4DgGgx7pl
         jxxlp++Wo4HZh1B2ArqRjZUNionINyaPd/hWfdecsTp3yvtsSXzr/mbWIjHaXH2u9v1Y
         6QLg==
X-Gm-Message-State: AOJu0YxI7UNnCSYqtZKjjYxmLGysbZzbpBKPrZ/hwvpNdei9KZoKHhpH
        8qNUkbPXkwn5d7UfRYnxHf9wGNv7bDpy6Nn5rAE=
X-Google-Smtp-Source: AGHT+IENF5sHCBigyi1Eel/+vTKewcU3IKBOuv2G4E44Y2zzi2oVi+9cbS5T6XXPrXRnx0ddgnrL8O9OKYue6CFq1w8=
X-Received: by 2002:a54:4e0d:0:b0:3a8:6144:2b0c with SMTP id
 a13-20020a544e0d000000b003a861442b0cmr562114oiy.18.1695159428785; Tue, 19 Sep
 2023 14:37:08 -0700 (PDT)
MIME-Version: 1.0
Sender: aileen.samih221@gmail.com
Received: by 2002:a05:7010:4581:b0:37d:10d5:31b4 with HTTP; Tue, 19 Sep 2023
 14:37:08 -0700 (PDT)
From:   Juliette Morgan <juliettemorgan21@gmail.com>
Date:   Tue, 19 Sep 2023 23:37:08 +0200
X-Google-Sender-Auth: vpF44JelSoEXRCJ-DqYBTrQ8O5g
Message-ID: <CAD5DnU2zMv+s1BEyDV1KSwtB-DdPOUy27MXVy_FAq=vjB52EoQ@mail.gmail.com>
Subject: READ AND REPLY URGENT
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        MONEY_NOHTML,RCVD_IN_DNSWL_BLOCKED,RISK_FREE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,T_MONEY_PERCENT,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2607:f8b0:4864:20:0:0:0:22c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aileen.samih221[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [juliettemorgan21[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_NOHTML Lots of money in plain text
        *  0.0 RISK_FREE No risk!
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dear God,s Select Good Day,

I apologized, If this mail find's you disturbing, It might not be the
best way to approach you as we have not met before, but due to the
urgency of my present situation i decided  to communicate this way, I
came across your e-mail contact through a private search, so please
pardon my manna, I am writing this mail to you with heavy tears In my
eyes and great sorrow in my heart, My Name is Mrs.Juliette Morgan, and
I am contacting you from my country Norway, I want to tell you this
because I don't have any other option than to tell you as I was
touched to open up to you,

I married to Mr.sami Morgan. Who worked with Norway embassy in Burkina
Faso for nine years before he died in the year 2020.We were married
for eleven years without a child He died after a brief illness that
lasted for only five days. Since his death I decided not to remarry,
When my late husband was alive he deposited the sum of $12.645 Million
(Twelve million, six hundred and Forty five thousand Dollars) in a
bank in Ouagadougou the capital city of Burkina Faso in west Africa
Presently this money is still in bank, This is
not a stolen money and there are no dangers involved. It is 100% risk
free with full legal proof. He made this money available for
exportation of Gold from Burkina Faso mining.

Recently, My Doctor told me that I would not last for the period of
seven months due to cancer problem. The one that disturbs me most is
my stroke sickness.Having known my condition I decided to hand you
over this money to take care of the less-privileged people, you will
utilize this money the way I am going to instruct herein.

I want you to take 40 Percent of the total money for your personal use
While 60% of the money will go to charity, people in the street and
helping the orphanage. I grew up as an Orphan and I don't have any
body as my family member, just to endeavour that the house of God is
maintained. Am doing this so that God will forgive my sins and accept
my soul because these sicknesses have suffered me so much.

As soon as I receive your reply I shall give you the contact of the
bank in Burkina Faso and I will also instruct the Bank Manager to
issue you an authority letter that will prove you the present
beneficiary of the money in the bank that is if you assure me that you
will act accordingly as I Stated herein.

Always reply to my alternative for security purposes

Hoping to receive your reply:
From Mrs.Juliette Morgan,
