Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D57535182
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 17:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347974AbiEZPdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 11:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347972AbiEZPdt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 11:33:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C283BD808E
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 08:33:46 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u3so2611044wrg.3
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 08:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=OyaRzhiBGq19hx91ypN3/Is9e83mqOXLZx5qRmAnt9wJXFDBkel6oX7OZhuAey3yv8
         dBUH6oZxDP+T4Jw2KCPGiRkPpEELgbqJtbMyUaFrcx/sCUazNduCCOuzRO4aCr12kFEc
         TmnUEMKCfpamtxsLuO5tixC4NpQcMx0qUrZWD0Stz0EpIRiE6flY+o6K4svj+V+8T034
         Qz9P5rNVaI0s04Z/aUTdLu7slAUfrh4R/WDQH9J/bo7ARZlWUCCxroQk4RZnCEMnrCvH
         HGbY5QP0coimTZZ5eXDlO6UGWrH/4TpdhIYTbQvcSkP77Pest3z/aJPwkZbeO3d3ek5+
         19kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=Gszv0cF1pBjiQJfHsV/x5sTo9GLrqiadVzEcRCnUBICFfCTEw0RSajvkahVuRktLdi
         F6je0ZjDXniEZk3McqsxZD6CK68f/5IQ2G1XAZlCSnWhVIAypKkL8IpFEelEVU/CpKIW
         +BJ863IpUuLFaPYU0lMk+J7YIRJoM0wEyP4oL/NSrFnuoZYCHiXkBv6Jr+BTJeZ/i9t9
         8QUszZbToS/LbrIVAVu4rtGSk06MUSjpYuk38YvdkHNZImc7aTicI50iJTISOV1sqNoX
         400eQzIiu/gGeUXxrADnlmotJWH9Uoz0bVbcEKMNuhmNvaJAhivtRAXAQMhsXZvcsQIo
         rpyw==
X-Gm-Message-State: AOAM532jevlbZSf7oudaIh1gFsvzLO8Q1BAfmZWQDvyhA0LKXMfKEvCd
        LP7B0ImZYEHC4RLa0JjaFkxurxsMVB8urV1yBOg=
X-Google-Smtp-Source: ABdhPJz4ymsfpZ6XE9nNt+dQEXfMcgEAWohhEJk5D1aVJE7siDYkIb9/O6pw09BM31g5F5i7nVQgAqKRkiMjZDBMmhE=
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr33156092wrq.96.1653579224973; Thu, 26
 May 2022 08:33:44 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mr.a.manga99@gmail.com
Sender: arnettdavid1991@gmail.com
Received: by 2002:adf:c98a:0:0:0:0:0 with HTTP; Thu, 26 May 2022 08:33:44
 -0700 (PDT)
From:   "Mr. Amos Manga" <mr.a.manga99@gmail.com>
Date:   Thu, 26 May 2022 08:33:44 -0700
X-Google-Sender-Auth: ykbJWHFNl0fEWNmMObs8GR2XEBA
Message-ID: <CAPpYQmnBp-S_EEAy1G=syNfWGj5_teDNsmSREFGJKOBrUhoW6w@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORM_FRAUD_5,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FORM_SHORT,MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
