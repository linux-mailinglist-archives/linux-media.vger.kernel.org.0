Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9C32C782F
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 07:08:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgK2GIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 01:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgK2GIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 01:08:45 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA4EC0613D1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:04 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id m19so8628777ejl.11
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oBuF+7TgU/ZfyiFolzpZTN7G+5moGv16x7YISSbf2WI=;
        b=Sa+KUL04mbhl4rwgaA9YJuTDBxqbdL5uxIXeUp631xJLXww0w3G6Rq5FN9HD8PINF9
         SQpzslfjFUGE0+7KJQXqHgtqUBKzgX4z5PpC/VTQ7o5v9VmVbkB44fNLPxAI7CaF9OQ3
         +CZ+/oqvsXC0JWkiDue713l8H7KiAZ3CRHJn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oBuF+7TgU/ZfyiFolzpZTN7G+5moGv16x7YISSbf2WI=;
        b=fynG3A6e8QG93+j8Vh9+rd5kx3eMC6pBlqs88wEiy6ukfjQNwr8avMJY1TiOKSlS7d
         wXeXMKC6L8Yn1sks7TPG/3F7U+Z7L05URrOutDajzrFm7Iz8m6HuhdbEbTswlgmHJHqB
         SE7uLrtlzbC7+XLAQ3jFNwXxDuqw7FuXo6TveQSt6IJ1M6zsotj7EAH1FLvpDQ5d7W53
         2ZUiWERD4ZsUeLkVzFxbUbLvysEV/OagDObM6kpMTfrZYZrXOE5ZjJHraKFGDy3tModT
         QCMwHiIx3B2jIWPKjMe8n6eaXaoO3wojEtSaL4QwsMemjdvJTGhzqcb1Dzyt+KBTBqJ/
         7uQA==
X-Gm-Message-State: AOAM5324R7xG9xUs9yeiDhWW9BAu71cX6oK+3PGMpmXbly5RwnPVwsGY
        jvFlYsVW6LRykrA/UHm9Gs1LpMH4rNB+bw==
X-Google-Smtp-Source: ABdhPJzHBdaenf+6E6Hdd8fLdE9MG569SjTJhhuxg225J2Tk2CZoWVAth/OYcFBpx9be+05X3LtRlA==
X-Received: by 2002:a17:906:1e93:: with SMTP id e19mr15500686ejj.440.1606630083258;
        Sat, 28 Nov 2020 22:08:03 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id cw26sm7014169ejb.47.2020.11.28.22.08.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 22:08:02 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id u10so3666770wmm.0
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2020 22:08:02 -0800 (PST)
X-Received: by 2002:a1c:9e53:: with SMTP id h80mr7849050wme.50.1606630082300;
 Sat, 28 Nov 2020 22:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org> <20201111143755.24541-5-stanimir.varbanov@linaro.org>
In-Reply-To: <20201111143755.24541-5-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Sat, 28 Nov 2020 22:07:49 -0800
X-Gmail-Original-Message-ID: <CAMfZQbwMwPkQzakC+6aLqCnoHnjEL7ZhSn_WngcycAF0=6MFxg@mail.gmail.com>
Message-ID: <CAMfZQbwMwPkQzakC+6aLqCnoHnjEL7ZhSn_WngcycAF0=6MFxg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] venus: helpers: Calculate properly compressed
 buffer size
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 11, 2020 at 6:38 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> For resolutions below 720p the size of the compressed buffer must
> be bigger. Correct this by checking the resolution when calculating
> buffer size and multiply by four.

I'm confused because the commit message doesn't appear to line up with
the code.  It says multiply by four here, but the code has by eight.

>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 688e3e3e8362..490c026b58a3 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -986,6 +986,8 @@ u32 venus_helper_get_framesz(u32 v4l2_fmt, u32 width, u32 height)
>
>         if (compressed) {
>                 sz = ALIGN(height, 32) * ALIGN(width, 32) * 3 / 2 / 2;
> +               if (width < 1280 || height < 720)
> +                       sz *= 8;
>                 return ALIGN(sz, SZ_4K);
>         }
>
> --
> 2.17.1
>
