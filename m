Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5BC72477F
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 17:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238568AbjFFPUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 11:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238665AbjFFPUA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 11:20:00 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5948E40
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 08:19:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f6170b1486so5029397e87.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 08:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686064797; x=1688656797;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PXSnykSl2m8GUoGHPGyHMUT1Oob4xT3ddV97ZlLQSfo=;
        b=gFhgmpMY05DjQ8KsKO/uybTiJ9yKPK2xD+mrm86hZm3kxTo0gvsPmO0dg1Zk44zvV4
         exLmOivLJFGJMFyRwmA43Vo1gbtXtDiPD80eITDxvuEtrcRP0H4ybDXbek9y6dGBIAdk
         nX4bsHQpZyoX4QV1tsGw5ZX7qvNuQmW2EOdfi02Kw08k1NnUcSiobTiO9cCh70ovT1Ia
         VnrlZxy5SHVU28JlRHN2jpSpAFL9fPDbHKEgpfnRVSf/nMGp+GszSWrtUkt63qZI/w0D
         VEaR91u11dtZBtb/EsevqMkevj7oRgMFyMHOnbrr2rfXiwqQca1rhc2nJDUuQfwN5h5X
         psGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064797; x=1688656797;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXSnykSl2m8GUoGHPGyHMUT1Oob4xT3ddV97ZlLQSfo=;
        b=GM4EjUooWoA0U8spyjKbilPjbax65p8CCzmNB2Z4U3czICPYnwz8d8p1I1ugSPZTNh
         TUqzAre0KMvoLCzDnEkKlesOh3I275idMJipylr1qNj2kPGpxxZHVnwNWm/kfTfug6cb
         BdsCtyxhnr+B6bgR62TMwAfnsdfS1ejGUahbNy8CStO7FUsSiwHYv35HjAh2rso9z0nu
         K/C8eYyKkJ9VOYBdKe7XYrFtxLhY80UzWNuDXAI2WMK9qIki0Bx2fpu36/hwBqIpL6vP
         zomEQQHX/AlVYFrZVoAx5HjwQ2RazxoWU6gJALf7ygJ3fQxiQwKkOIkoWO4RXpWT9HP0
         t0FQ==
X-Gm-Message-State: AC+VfDwT0BwNcIQyBPlm2Z61IAOf1jzokNZbgQO5wk0c8N785ZHy0xML
        NxILhWStk9qO2YJNms3qL5wxLtiAvcqajhnlMrs=
X-Google-Smtp-Source: ACHHUZ5Bnc8SwAKxEjMAjEKFmdYjpebbkLljMTFnQAv85r7Hx5hcuzvq30JLw7RoxUyeqYz79wwD4jxUqh3vYW3vLHs=
X-Received: by 2002:a05:6512:33c5:b0:4f4:f38a:4423 with SMTP id
 d5-20020a05651233c500b004f4f38a4423mr5677644lfg.27.1686064796697; Tue, 06 Jun
 2023 08:19:56 -0700 (PDT)
MIME-Version: 1.0
Sender: traoreseriba174@gmail.com
Received: by 2002:a2e:8506:0:b0:2b1:b972:80e1 with HTTP; Tue, 6 Jun 2023
 08:19:55 -0700 (PDT)
From:   Maya olivier <madamoliviermaya@gmail.com>
Date:   Tue, 6 Jun 2023 08:19:55 -0700
X-Google-Sender-Auth: mW5_BVm4uCr6nQhKewon7buTT3o
Message-ID: <CAKViA0XbyYvDnKXdMQjxVoM++uvCRnbWwaUhNbbL0FNXqy1rww@mail.gmail.com>
Subject: Have a nice weekend,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.1 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [traoreseriba174[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [traoreseriba174[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  1.3 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am Mrs. Maya Oliver,
From the United Kingdom. Firstly, I am married to Mr. Patrick Oliver,
A diamond and gold merchant who owns a small gold Mine in Thailand
Bangkok; He died of Cardiovascular Disease in mid-March 2011. During
his lifetime he deposited the sum of =E2=82=AC 12.7 Euros in a bank in Bang=
kok
the capital city of Thailand. The deposited money was from the sale of
the shares, death benefits payment and entitlements of my deceased
husband by his company. Since his death I decided not to remarry, when
my late husband was Alive he deposited the sum of =E2=82=AC 12.7 Million Eu=
ro)
Twelve million, Seven hundred Thousand Euro) in a bank in Thailand,
Presently this money is Still in the bank. And My Doctor told me that
I don't have much time to leave because of the cancer problem, having
known my condition I decided to hand you over this fund to take Care
of the less-privileged people
Meanwhile i have concluded with the bank to transfer the funds to you,
through the listed options below 1, Money gram 2, ATM card,3 RIA 4,
Online Transfer
 Please i will be glad to hear from you before i can send you the
contact details of the bank.
You can contact the bank for the transaction with the email below:
transferriamoney0@gmail.com
Mrs. Maya Oliver
