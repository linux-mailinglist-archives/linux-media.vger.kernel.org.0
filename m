Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3740E476841
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 03:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhLPCoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 21:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhLPCoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 21:44:44 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DBBC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 18:44:44 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id i5-20020a05683033e500b0057a369ac614so27283649otu.10
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 18:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZBQ577Z00Gsm2ELBgWvaGZ7PZo29hRdVb3EOpEKqss=;
        b=ajjUafm9zvAnqME9F3Y0Ln4XTUl/3+81o1V+PkzAz1hXxVH+tjHuzpOAWWhTY7zBWQ
         Ykb3fJaKBT0OOy2XjeHUxGryNCpWWE9TxysZjMOYLjarVvZv4x6p5O40y7GNyTmf2u7T
         Ia8L5bm2IuBuXKWOw7uK0i0pk8TwYJu5OknTYSaHHYxJL80HIJ8EFugZ+IYT74exu47l
         hqI3PcHsueVeNUs8Qe/2msXGlkjkfat6KL81di0IdeQETSYS+I+cxD4dHM+sbnfZUzIR
         XIdO7h7d7wcqHVPahRV5hPDVNnOBakBahcitvjdwrAUsNVFyJOxwI3k0wcOU793Y0+uh
         OM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZBQ577Z00Gsm2ELBgWvaGZ7PZo29hRdVb3EOpEKqss=;
        b=w5tB60M4hkLMvnAOztJfjJsI5USjMKld1v43M27Pw1aC53afTEDmwGhUlVzKaQ2Rsx
         cuGqhAhPRdctAfOCZpKtMaqNZa+ZpE9c2LkmtVXgGk71DTWasEQtr0MGZU3nkI+LK/eb
         Sm3vf3lHWaq8lSS7B7Q/BIJScnSiJz+aPD30g8TaaFwb5B7oQzGMiYKuw/ozq9WfnvpA
         0VOTvptBKo2sw0j1QdL2PZsOSIniBYpDbnZC4WNIzDucVRZGu3wkFFhYDMMPP0dK1MeX
         prXQz9Lyf3T5GKyYpt4yRKmpk4tx8sW3WDvjCZO0AyaFNjjhylbmpQRRhektUAKsEdQb
         fxfA==
X-Gm-Message-State: AOAM533kFl5daX86ycYlv2FqrrojLKHF7OvKVR3zl3cmV2vniWRvFlwq
        LdmMcEXjFTehp5WMV6GdXPYuwobaZXVJV9vlP44wKw==
X-Google-Smtp-Source: ABdhPJwNby26TXaQenyHeX9TznyLunCDxBe80eRHr3WPHDPwv5u1r1oIikC75XJd9IMyaOKYK8vE0wU1cB3nU0OHZe4=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr11421164otg.179.1639622683376;
 Wed, 15 Dec 2021 18:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl> <20211206131648.1521868-4-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211206131648.1521868-4-hverkuil-cisco@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 03:44:32 +0100
Message-ID: <CACRpkdbvmAGP=MWQ8mSHbeEqBBRxfU6FmxeYapN-b178-75X0w@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] pinctrl-sunxi: don't call pinctrl_gpio_direction()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 6, 2021 at 2:16 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Set the direction directly without calling pinctrl_gpio_direction().
> This avoids the mutex_lock() calls in that function, which would
> invalid the can_sleep = false.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Patch applied.

Yours,
Linus Walleij
