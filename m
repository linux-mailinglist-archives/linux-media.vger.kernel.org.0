Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175015EF4F0
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 14:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbiI2MGG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 08:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbiI2MGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 08:06:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C634E511B
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 05:06:01 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lx7so1167077pjb.0
        for <linux-media@vger.kernel.org>; Thu, 29 Sep 2022 05:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=hMZ9Vemdv8syuRFF2/0V/mH81fjpaVXnKQjjwOdiEzcdi9eSlbUXmRicblzMOOY4+n
         3XVfpmMUQ/3YQ6kMfcS6R1v37gh5eJua8Y2rcDEMS9N74yRMQEjIHMjYSUKDf2O6mlnG
         dR6fOeDG0eYFBjEg8bQC0fzvcwoaUJMTVg06GEPuGuRYm5F5wT3xLIIGrzveR5U2NMas
         N3dY4IxNlzraL9EUxzpgck+x7nLCIJGP2UpKJUG9FzSZfG0ASvOOBryQc9V/wQ44b1R5
         4e4pYhc6dX4DGlqXlgSP7ZaPCYXRT8qUJZE9rLa0UTHtHwUAmAzeK687fE3YhcNLNp+E
         NXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=C+z24Pl7od6xO10XmMEfecsYemTIfW+XARlPRi62dVY=;
        b=RLOAzFoOi5DaUwrfggHnqTHzxB1CLM6ob3NzAJaBPxuEolCjut6dcF6/aQvKwnfCBe
         KviDo+4tyu0U7MAzfH7Nmq2Sck3h+vY039V/MW0lvrKyaBS9CSXIqhsqJkxjawKrDm5B
         l8JZndOSGHR8iiD3xf9RVTcTSxBuEu7HfdLAGupLzQhgX3ItqBFSkl1mqlYBn9MGed4j
         JcRpXzIDEPOKwXsADia4jmkeLI3fTcxD43shYdg17PwJkF+PXsYCdkdhBryAz6fOM8wK
         M4oTr+uwXUYDKWoUbM2eNCdWJveSx6ekmTDL29G34rbrYWcajmYtTyFIUaBTgUSFSV2m
         g63Q==
X-Gm-Message-State: ACrzQf1vSqk4YX5PZlbbXCtXY/lebRvmP8iInDvIVS9aktIbvNHFSvFC
        rfieyF/5tPPnd8mOTgXRwjuoJYBWajWcZoBhhCU=
X-Google-Smtp-Source: AMsMyM7ChnpWsxK8gWDJem1rYc7kvm5VZH89+RSwLAjDf7KURvFbt9Y3/z8oi/oRZ08Hkv/NaTEEd0B4TLt+O3EAuFc=
X-Received: by 2002:a17:902:cec9:b0:178:5fa6:f3c3 with SMTP id
 d9-20020a170902cec900b001785fa6f3c3mr3111043plg.83.1664453160345; Thu, 29 Sep
 2022 05:06:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:3d86:b0:96:fd77:da8a with HTTP; Thu, 29 Sep 2022
 05:05:59 -0700 (PDT)
Reply-To: paulmichael7787@gmail.com
From:   paul michael <josephkaufamn@gmail.com>
Date:   Thu, 29 Sep 2022 13:05:59 +0100
Message-ID: <CA+TatOGzGuwoS+3x0Cvb6L+MQJKMSnJjHgqu1pT5vzAdNB_RUQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Every time I retest your email, it tells me to check with my ISP or
Log onto incoming mail server (POP3): Your e-mail server rejected .
Kindly verify if your email is still valid for us to talk.
