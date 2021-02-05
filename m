Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2ACD3118FA
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 03:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhBFCwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 21:52:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhBFCno (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 21:43:44 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB1AC08ED3F
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 15:21:07 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id u20so8674459qku.7
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 15:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SkxWmY1OEi5ew/OSKLvpq24apidSW6DwKqLmpKsAI24=;
        b=dhJm5DFgG5FfOYeun7i2ErLsVXGm89DNuESD4ai0pZA9JRMXOL49fcDBKB7extQ27X
         Tu9PDANUQC4qGLS7Z7bZB6dQ1IOZRIUKeugve68PY0ozncrU6jqeTYyZ7BqteTcuQOpW
         8nu7d+SvxvYW9YIgUXskMc9cXCKatE1mnSXJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkxWmY1OEi5ew/OSKLvpq24apidSW6DwKqLmpKsAI24=;
        b=jsuTe2aEuC1Y9xqCit1oYtkx+U+9wN3debkNFwhCc99DTCJxktKDFhn9UoLuJfOtyN
         y3CuYzhPfcNybgGiDvpb9FHBwLDI8Tkl2sYR0rsRthGDMbSZ6MCa7nVfv7N0p1Tdl/a1
         rPi6ZYvdijlSd1cuM4/oiFJ0bnfbcH/5gc++8D9VsH8e1vjVh6eGuYUStfoMxv8iQJWD
         sRmJqEgWgS4TqTarDFvTRGwY1Du76ZBteT6m6x8qOYukRFhE2zD7cGeMB9YbM9km1JDF
         wnP/ZOv6Qh6o2INM9KfagSdEjdpXdDTNdoL5wV883i63Jtg6JoFF7ReM0X5NKdvY3ZvZ
         arhQ==
X-Gm-Message-State: AOAM532TpOjGXtlI2dyTOQzqd9oqaXVXX9rXKvTjNLSTRxOlUDSKexOh
        hnwsY4DX0c7O6AChY2891/kEqEUtrd36uA==
X-Google-Smtp-Source: ABdhPJzorhvOlwriAyrhgD5nImbW5hZ4iyb0Vyb6IqQ0mfZ+KjDjow3zV4u6lcOGWm9cguwgLQKUBA==
X-Received: by 2002:a05:620a:918:: with SMTP id v24mr6920644qkv.350.1612567266211;
        Fri, 05 Feb 2021 15:21:06 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id d71sm10473820qkc.75.2021.02.05.15.21.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 15:21:05 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id c3so8400975ybi.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 15:21:04 -0800 (PST)
X-Received: by 2002:a25:b048:: with SMTP id e8mr10485056ybj.0.1612567264272;
 Fri, 05 Feb 2021 15:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20210202194752.247301-1-swboyd@chromium.org>
In-Reply-To: <20210202194752.247301-1-swboyd@chromium.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 5 Feb 2021 15:20:53 -0800
X-Gmail-Original-Message-ID: <CAMfZQbyM-3mMchUgFZgiX48x7WG=BG=dZ6aBwAyu-K_y05=qkw@mail.gmail.com>
Message-ID: <CAMfZQbyM-3mMchUgFZgiX48x7WG=BG=dZ6aBwAyu-K_y05=qkw@mail.gmail.com>
Subject: Re: [PATCH -next] media: venus: Include io.h for memremap()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 2, 2021 at 11:51 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This file uses memremap() now, so we should include io.h instead of
> relying on any sort of implicit include elsewhere.
>
> Cc: Dikshita Agarwal <dikshita@codeaurora.org>
> Fixes: 0ca0ca980505 ("media: venus: core: add support to dump FW region")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 1471c7f9c89d..915b3ed8ed64 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/init.h>
>  #include <linux/interconnect.h>
> +#include <linux/io.h>
>  #include <linux/ioctl.h>
>  #include <linux/delay.h>
>  #include <linux/devcoredump.h>
>
> base-commit: 0ca0ca9805055bb0efc16890f9d6433c65bd07cc
> --
> https://chromeos.dev

Reviewed-by: Fritz Koenig <frkoenig@chromium.org>
