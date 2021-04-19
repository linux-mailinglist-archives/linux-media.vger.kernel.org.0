Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502DA3649BA
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 20:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240865AbhDSSW2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 14:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240096AbhDSSWY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 14:22:24 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98CFC061761
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:21:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id s20so2369224plr.13
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=DKBt0bp0TTUgQvWPxoeal8fGy3PXdZiGA8cPBtHBn2U=;
        b=IDPh+v7Nlj5LhsRlTw3r13uDJHgp7ZoeNXF689zP+Jx/mhY0EMgT6B4RFBPpENQBs1
         pvFpZ3FT4+m74+Zna3vdjvvi44xLqs9JqR6Ob3blEJOlFXF5luVSq1IwRmGVayZG9hoP
         H8Wc+TCBmdTru7S/n9qTN0hR2XRUjzvw2zKsyq4jLySVNQXDZDQUXiNdBhw7e8iUKsr0
         Kx3a9CEqgL68OnwzDa1D6gNK0YEnSW2OK0P7ALk9yxRDITzaB80REEMOfHrgfJa2bNP8
         gdwKuxEtlxj4xnNYrpIsJvkdFAyYMN/9zBbqQEsFN7pUvIwShRRs3SE/WohQ5GdSNeU6
         xBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=DKBt0bp0TTUgQvWPxoeal8fGy3PXdZiGA8cPBtHBn2U=;
        b=LQYLBJkYxtvNSvlcRsKw1/em0QDjb6rOxXsRGqVKCWcGSw1dM27CLBeow4D9mlK94L
         ZZbDRRhk1vCZe32vU6wiVb1vcwewQ9w2HyULNprrsSzBqMDUpV5+h00fyEZJYbUgQ/7J
         vHUbzU06fBqUiid+0w9/qVu7+CXBiTPaJOCgQ+P0qD3SsAKnWkL6zx4kXXG37pucdaVQ
         eticnl1z0XWX7nHG+g6KCA8g3jRL6oKQUVFIsbIdpp0O3OosYF3qi+3oma/hyhEy5RPb
         KdMKceM1LdnD3YaKF85r5NGBwS7BMjRdviKcO0K+2lqtbNDlmnmhXBLA09J+T6uKAYGo
         UWZQ==
X-Gm-Message-State: AOAM532rtlDpjpxQKTuMP4Otb/rJu8XwAkbVj4c0BizeF+u6ERu/3mPU
        qHrzkA7rJt0N8JPFAsGmMgz11Q==
X-Google-Smtp-Source: ABdhPJySTiB62+fr1hP716taw9mSevM+JdM2Cz6AlKimXZ/yP3GxW7LcSVLAYU9+u/SZ9eGusKkFTg==
X-Received: by 2002:a17:90a:bb94:: with SMTP id v20mr419834pjr.144.1618856514155;
        Mon, 19 Apr 2021 11:21:54 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id b7sm12900585pfi.42.2021.04.19.11.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 11:21:53 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] media: meson-ge2d: fix rotation parameters
In-Reply-To: <20210412134833.3467694-1-narmstrong@baylibre.com>
References: <20210412134833.3467694-1-narmstrong@baylibre.com>
Date:   Mon, 19 Apr 2021 11:21:53 -0700
Message-ID: <7hh7k2xhha.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> With these settings, 90deg and 270deg rotation leads to inverted
> vertical, fix them to have correct rotation.
>
> Fixes: 59a635327ca7 ("media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index 153612ca96fc..a1393fefa8ae 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -757,7 +757,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		if (ctrl->val == 90) {
>  			ctx->hflip = 0;
> -			ctx->vflip = 0;
> +			ctx->vflip = 1;
>  			ctx->xy_swap = 1;
>  		} else if (ctrl->val == 180) {
>  			ctx->hflip = 1;
> @@ -765,7 +765,7 @@ static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->xy_swap = 0;
>  		} else if (ctrl->val == 270) {
>  			ctx->hflip = 1;
> -			ctx->vflip = 1;
> +			ctx->vflip = 0;
>  			ctx->xy_swap = 1;
>  		} else {
>  			ctx->hflip = 0;
> -- 
> 2.25.1
