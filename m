Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BD440F232
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 08:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbhIQGUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 02:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhIQGUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 02:20:09 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF2FC061764
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 23:18:48 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id y63-20020a9d22c5000000b005453f95356cso4625446ota.11
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hzp3W57grtENZ1UMp0tOsXr8ZoYgbq44MmPXCel3Oa4=;
        b=W6qfmBMKsTv98mLlYbwvasVyjfbNJpx35I87S9ODLKaOW8i/gNzfJE227YWEEgZ7wh
         HcABjt4NZynd7MI2AHz3zEcEuPDkRMfAYmQzf1NnC+Z4nm0YsbTjP3xFj0y7TvJOBz/K
         yBRt65DdAnOgAaUg6TeeXusYlDXyatoOmf07Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hzp3W57grtENZ1UMp0tOsXr8ZoYgbq44MmPXCel3Oa4=;
        b=SD8JajN9vQv2mWK4O8qc67tM4rCKTtb+kZkdRWSUKkvl9Qg2TRnDk8KTHvJKuQHj3J
         Gf6yYWzo4rspt8cvkJakjQWxBBdKYRTI9eHxG9zRNAi4IBSC9Q8j3SX1yza8b2vQPGjx
         p2o5xQcXvMcaI/IkGodOrD/o6+ETyHPOyV+acREWpllXpCxFDQHyR5FPUeUI1JOf31oq
         DeycKzGeDkhjeqGE+V168NDoMvrUPezp4eGL9g1n6yA5PXO6uopT5ZdePsZgftedwVnU
         OvCxWjwo4R7NxQG+wKd52zLtyR0Fm1/4XTuRoglMssrpQfdFg6J3WiLEZnrt4a24fJyE
         fPtw==
X-Gm-Message-State: AOAM533AmKDvDsf2i6YIboSpKy39qqz0pRyR7Nl/abyLWCxUqkFd0B44
        SgBnpFCYP4mavIaN6Ou1I5NKJBniiDbOUECoHFef0Q==
X-Google-Smtp-Source: ABdhPJwnpapPZqGI9tLkWKhUef481j23KWl2vfNPI9pI3jrBmxG+IzpYd9/UGy7aQL1rw4TZIJqyFcky0nzdXD72gH4=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr7931455ots.77.1631859527357;
 Thu, 16 Sep 2021 23:18:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:18:46 -0700
MIME-Version: 1.0
In-Reply-To: <53a38a24cca0b6f1c2a3120f14dfc865@codeaurora.org>
References: <20200730095350.13925-1-stanimir.varbanov@linaro.org>
 <20200730095350.13925-3-stanimir.varbanov@linaro.org> <159718256557.1360974.458611240360821676@swboyd.mtv.corp.google.com>
 <8c1fdf2d0807f07ec57b232497b405f1@codeaurora.org> <CAE-0n53T-RoOvR=s9nHiXAriMgKvBfDqfBfoGKX5Ju5YF3Tcqw@mail.gmail.com>
 <53a38a24cca0b6f1c2a3120f14dfc865@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:18:46 -0700
Message-ID: <CAE-0n51Pxs7stTdJ5AO3i+Xm=q1R_EUcueR2+_-gFAa7iqUypg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] venus: Add a debugfs file for SSR trigger
To:     dikshita@codeaurora.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, jim.cromie@gmail.com,
        Joe Perches <joe@perches.com>, Jason Baron <jbaron@akamai.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media-owner@vger.kernel.org,
        Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting dikshita@codeaurora.org (2021-09-15 23:29:36)
> On 2021-09-16 01:09, Stephen Boyd wrote:
> > Quoting dikshita@codeaurora.org (2021-09-15 02:13:09)
> >>
> >> So, IMO, we will have to use custom debugfs only.
> >
> > Can you use DECLARE_FAULT_ATTR()? Or you need it to be active instead
> > of
> > passive, i.e. it shouldn't wait for should_fail() to return true, but
> > actively trigger something on the remoteproc?
> >
>
> yes, it doesn't need to wait for should_fail() to return true.
> the client/user should be able to trigger this subsystem restart(SSR) at
> any point of time
> when a session is running. It's totally client-driven.
>
> >>
> >> Please feel free to correct me in case my understanding of the
> >> framework
> >> is wrong.
> >>
> >
> > I presume the fault injection framework could get a new feature that
> > lets the fault be injected immediately upon writing the debugfs file.
> > My goal is to consolidate this sort of logic into one place and then
> > put
> > it behind some config option that distros can disable so the kernel
> > isn't bloated with debug features that end users will never care about.

So you can modify fault injection framework to support direct injection
instead of statistical failures?
