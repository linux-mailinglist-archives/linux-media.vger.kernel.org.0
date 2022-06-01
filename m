Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86382539DF0
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 09:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350215AbiFAHNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 03:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350256AbiFAHNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 03:13:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E23986DC
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 00:13:24 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id me5so1296567ejb.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 00:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=Epf2HNNGUuXBopEfAR0nghYgz3pKW+wHjG8106j2ENk=;
        b=k6V6bJuL9neaOcfKbXwbSlWvz5gM2s0dypFVWq1VP33JqPXq/aTQ2YG4JbV8EcIy/R
         /ScVVdg6Psal0WXtUof75fZNsJFhA6li5osnn8VAqZ10D1zHlNAZGhjVhiNrsOxhGCgY
         tmCRlyi1Cyl89L6rv1/5q4GaP9wmsQggaZpseFGX1UjtSnFRnF1+KqAhw15XxoYEJCQM
         9+BOOG2VWFeFU3A2X5che/Q6CBsaFLqeou0IeVMEuhD+sEZY5oA/EQ4mg04E1cHXnha4
         fD0+XkjnQ1BbxI+xhr1mPW/m+kUv9KM4yUCX1r0LtrsunV4EM8XxZUASoEI5S05d8BkK
         EmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Epf2HNNGUuXBopEfAR0nghYgz3pKW+wHjG8106j2ENk=;
        b=B72HD9ZgU9cqmUluOkeqJds7FQ+/FQ3uKPBQpTEP3fzBTegwjGWYPSVFvFgsThe3d2
         VjyitycrOJvxlm1WdCsjagreLhlPX5E1JxplFPB0XFZR9k04EsH5w3/g7vmtznuIBjE7
         A2/ZvDELD7V8X0CPJ2LgHrAdxpWTRrjS/ZgPtg73ps6+LRCDOYmfzxghSZ5ylpzbUKfp
         vbwzqmPJ637d29F+mD5BxBZJoT5Ck/aHQ7tKBqo3JS9INxbC0uXidXKK+mi+m7kAceMQ
         79ejIFwcCwNQ9tN8Bi02uft/II5iIS3JzCYX6CUGa43502dGaLNO0Bz6hZVVuFjTe3ld
         f4MQ==
X-Gm-Message-State: AOAM530OBWV0ydBstkGsw0emPSLkkSKN9Htx62fXf7iEIiMSxznD/Mi4
        d9A8PVRf7kzzVRVyYgecAzfYKCHPTo//C6m8qKk=
X-Google-Smtp-Source: ABdhPJzJjBe1z+oiSwH8ZH7mswqAyt35ZM6ri/jFBDLN+CDZHoA8Ljh2K5ANc3d7bF4OC5yYxQSzAO/aO/lBdiqXdzc=
X-Received: by 2002:a17:906:7313:b0:6fe:ed0b:9964 with SMTP id
 di19-20020a170906731300b006feed0b9964mr40443899ejc.95.1654067595432; Wed, 01
 Jun 2022 00:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:34c7:0:0:0:0:0 with HTTP; Wed, 1 Jun 2022 00:13:15 -0700 (PDT)
From:   Cheng Lee <clee23916@gmail.com>
Date:   Wed, 1 Jun 2022 09:13:15 +0200
Message-ID: <CAAUA_X8rN5=VrB_z5unS4woVWM4xCgYrbYoY8_s1L-=egk+RRQ@mail.gmail.com>
Subject: GREETINGS,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_99,BAYES_999,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:635 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9999]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 0.9999]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [clee23916[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [clee23916[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 HK_SCAM No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Greetings,

Gods Protections,
I have a proposal for you, however is not mandatory nor will I in any
manner compel you to honor against your will. I am Mr Cheng Lee,I am a business
partners with former executive director of Arab Tunisian Bank here in Tunisia;

HE retired A year and 7 months ago after putting in 28 years of
meticulous service. During his days with Arab Tunisian Bank, I was the
personal account officer and one of the financial advisers to Mr. Zine
Al-Abidine Ben Ali the past Tunisian President in self exile at Saudi
Arabia. During his tryer period he instructed me to move all his
investment in my care which consists of US$115M and 767KG of gold out
of the Gulf States for safe keeping; and that I successfully did by
moving US$50M to Madrid Spain, US$50M to Dubai United Arab Emirate,
US$15M to Burkina Faso and the 767KG of gold to Accra Ghana in West
Africa as an anonymous deposits, so that the funds will in no way to
be traced to him. He has instructed me to find an investor who would
stand as the beneficiary of the fund and the gold; and claim it for
further investment.

Consequent upon the above, my proposal is that I would like you as a
foreigner to stand in as the beneficiary of this fund and the gold
which I have successfully moved outside the country and provide an
account overseas where this said fund will be transferred into. It is
a careful network and my voluntary retirement from the Arab Tunisian
Bank is to ensure a hitch-free operation as all modalities for you to
stand as beneficiary and owner of the deposits has been perfected by
me. Mr. Zine al-Abidine Ben Ali will offer you 20% of the total
investment if you can be the investor and claim this deposits in Spain
and Burkina Faso as the beneficiary.


Now my questions are:-

1. Can you handle this transaction?
2. Can I give you this trust?

Consider this and get back to me as soon as possible so that I can
give you more details regarding this transaction. Finally, it is my
humble request that the information as contained herein be accorded
the necessary attention, urgency as well as the secrecy it deserves
I expect your urgent response if you can handle this project.

Respectfully yours,
From:Mr Cheng Lee.
