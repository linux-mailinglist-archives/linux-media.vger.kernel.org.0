Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2B5535211
	for <lists+linux-media@lfdr.de>; Thu, 26 May 2022 18:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348096AbiEZQ3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 May 2022 12:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiEZQ3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 May 2022 12:29:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8181D9A987
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 09:29:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 202so2141251pfu.0
        for <linux-media@vger.kernel.org>; Thu, 26 May 2022 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=qsX7tZ2WyLRtY66GJBSkIA/fXY4PQcBTX49kCBByX+ju+12FnmPws2UX0mQc5Na4EI
         XOLv+1a+rXAF4+6PBeIA6S4Juy+VundpqCQbLl7jTQxBZmCX9BB7DclNK93Rpb3MAmKQ
         G+wT0p9+gBoWCWQGghkVQFmmOQkyhx2t5uF0QprWvta0FJ7tofDdPU0zdMf23TA7RV4f
         pc3JGE/P1lkbcihC23wX2W8pcqj2hDfSgNNKNyZQRDWTUzC0xTpJIXV9PSyIv1sX6NAr
         orzFWzJS1LoK/KUWs+I1FGYzIq/7IM1tYDC8UItbOApbDlGXAx+3QAnzzLXJ2MA42Iil
         x+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=pcOIqjfOGD4mtjARe3uelHp7io5D0VG5aulAy4XSsSE=;
        b=XxsJiYFxYqI6xolDh9TjBAP7MQ6A5qZNdGEaMrTvd7otK0QQrIN1Y48ESnSGS0EZr+
         OqfPTfltrrTwzNmsLlcufukzVjCtOVm8Fz/c/GqFoA0FwPu+7R2C/1bcXqPNy0ntCYn5
         hrDahgJ6z9q5DbmvQmjXrbBunBEUCCW06KvbtbBUTSVAS1d9UIqLDl5f7sUuPapT649X
         G4IbnatvR5+ZSUl5nPKTX2kuVF1eXeZFvax83lk8szdHudS1Bkmyxn6raKu9+x4bBOhP
         DyY0Ls6Eb6XgFpVVjT5DrLBDs5jXDkwuwjdNsQBIePVbqV1e5Y9RnHt03SsawgWDvBkv
         CtHQ==
X-Gm-Message-State: AOAM533wMi5AKAOu5VCvguHSfRBe+VynZpYjSlXCEkMQaU/rW33uqHrk
        HhWpW6DGOyXCf638Ub6sb4mvc9ZFi1onehQvrLo=
X-Google-Smtp-Source: ABdhPJzR4pDeON4Oqc7r91fRBKum6xIG5GjzHU8NvkI1Wwp9ocLze1lUkjBQkrduEjF4d2xrhNG/i4D1sdQu6Uu2kGQ=
X-Received: by 2002:a63:4:0:b0:3c6:cce2:8457 with SMTP id 4-20020a630004000000b003c6cce28457mr32928452pga.612.1653582583800;
 Thu, 26 May 2022 09:29:43 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mr.a.manga99@gmail.com
Sender: mrsannahbruun605@gmail.com
Received: by 2002:a17:90b:4a10:0:0:0:0 with HTTP; Thu, 26 May 2022 09:29:43
 -0700 (PDT)
From:   "Mr. Amos Manga" <mr.a.manga99@gmail.com>
Date:   Thu, 26 May 2022 09:29:43 -0700
X-Google-Sender-Auth: aK6KCpH-JwwZkP9T4hNAXJiSIRI
Message-ID: <CAEyYVPEwVLRVBRSuvLW7B-G3LmbtfG-P2WHostH-+uu1+6jX9g@mail.gmail.com>
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
