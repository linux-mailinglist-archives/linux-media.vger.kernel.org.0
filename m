Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C5C1E7C78
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 13:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgE2L7Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 07:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgE2L7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 07:59:24 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DFFC03E969;
        Fri, 29 May 2020 04:59:22 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l1so678408ede.11;
        Fri, 29 May 2020 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eV9CwBqylCF7CPOO0rRld4R7dHmlZE7+GnaGmpmW08E=;
        b=KqdlDvVvSZUDRV0eq2aLhSZdGFxOHL/xT+EO4kB28G026EuulXkl7lVmMO26DrvSiL
         htDWHaLOeV4FdQVtQ2wBVm+toUqQqCsAj3K5VpHlh8Lob2WQDFexNK8bkQAPUj17SQN3
         hBZLa+X2jSuIQ5jAIsLZ5fIeh6dldNL6fjvitNuZPYQm5GGeIkIUnreYwURIaa7c1lNo
         86T6dC7NeBVXEMfojOU1IuCOn+xC/Ui9+m/qIxSt1GTOjhel7aDC5T1E5k9n30zFRA/c
         S8sR0dkym+u12hqgONI8w6YW1nKZXL/692/Ak0dsSWecE2XqOryGTdis9RYaY8LdPSMG
         l83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eV9CwBqylCF7CPOO0rRld4R7dHmlZE7+GnaGmpmW08E=;
        b=mMQ3NibStqmpdcn6ihzt6QHzIzNQZV7GUvLoZrlMkJnqRO0wa8BRKTmqVlr5TNIMv5
         /Z9uN8ZUU38c0V1NYhv5f43JQvFYDP6W2EyjV5ZIPWWP1a6xZCwIpVmo0uu7cbQs51gP
         JDCLNtNyEMuyvwqEKTOd3MK3+qnis9qzINfNskkXhAX7Q7VwB5VoRV2DzEffueCxAW/Y
         fzMmyn6C9DGZp8yYZVT51XEspZuWGrQO249iahCVuCm1p9bVLCCZv1rN2RgcxjCTB190
         gEJSIog0d/zL7UX0B6PvA9oZT7xWqHY2P6YN54o/LTN8KdNH4Hct/tPuMAJkir73H6qN
         KrOw==
X-Gm-Message-State: AOAM533fQyH6ESctpmZKGuG69FdQRfeZLxUtFo8VfoTW3KWXSsBuYyuK
        uuxbajX/mWAP5iPqsSFNNB56xgZ8Bp8=
X-Google-Smtp-Source: ABdhPJxYXnp2pxEEYgWRfJyEi+fg5/wsiAZbfBfeqsd9iS7sqgrPA5RYNr7TcRovs4iwD6H03FMS8A==
X-Received: by 2002:aa7:dd16:: with SMTP id i22mr8273414edv.366.1590753561153;
        Fri, 29 May 2020 04:59:21 -0700 (PDT)
Received: from [192.168.15.109] ([194.152.46.38])
        by smtp.gmail.com with ESMTPSA id w7sm6517186edq.94.2020.05.29.04.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 04:59:19 -0700 (PDT)
Subject: Re: [Patch 2/2] media: use v4l2_rect_enclosed helper
To:     Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200528132605.18339-1-bparrot@ti.com>
 <20200528132605.18339-3-bparrot@ti.com>
From:   Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Message-ID: <a282e6f4-8400-1fd8-81c1-9f0e281d9c6a@gmail.com>
Date:   Fri, 29 May 2020 13:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528132605.18339-3-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch.

W dniu 28.05.2020 o 15:26, Benoit Parrot pisze:
> Several drivers implement the same enclosed_rectangle() function to
> check if a rectangle is enclosed into another. Replace this with the
> newly added v4l2_rect_enclosed() helper function.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>

for the s5p-jpeg part:

Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   drivers/media/platform/am437x/am437x-vpfe.c   | 19 +++----------------
>   .../media/platform/exynos4-is/fimc-capture.c  | 18 +++---------------
>   drivers/media/platform/exynos4-is/fimc-lite.c | 18 +++---------------
>   drivers/media/platform/s5p-jpeg/jpeg-core.c   | 16 ++--------------
>   4 files changed, 11 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 66079cc41f38..0fb9f9ba1219 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -26,6 +26,7 @@
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-rect.h>
>   
>   #include "am437x-vpfe.h"
>   
> @@ -1987,20 +1988,6 @@ vpfe_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>   	return 0;
>   }
>   
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -	if (a->left < b->left || a->top < b->top)
> -		return 0;
> -
> -	if (a->left + a->width > b->left + b->width)
> -		return 0;
> -
> -	if (a->top + a->height > b->top + b->height)
> -		return 0;
> -
> -	return 1;
> -}
> -
>   static int
>   vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>   {
> @@ -2025,10 +2012,10 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>   	r.left = clamp_t(unsigned int, r.left, 0, cr.width - r.width);
>   	r.top  = clamp_t(unsigned int, r.top, 0, cr.height - r.height);
>   
> -	if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
> +	if (s->flags & V4L2_SEL_FLAG_LE && !v4l2_rect_enclosed(&r, &s->r))
>   		return -ERANGE;
>   
> -	if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
> +	if (s->flags & V4L2_SEL_FLAG_GE && !v4l2_rect_enclosed(&s->r, &r))
>   		return -ERANGE;
>   
>   	s->r = vpfe->crop = r;
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 705f182330ca..8b10741a847a 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -21,6 +21,7 @@
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-rect.h>
>   #include <media/videobuf2-v4l2.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> @@ -1299,19 +1300,6 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
>   	return -EINVAL;
>   }
>   
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -	if (a->left < b->left || a->top < b->top)
> -		return 0;
> -	if (a->left + a->width > b->left + b->width)
> -		return 0;
> -	if (a->top + a->height > b->top + b->height)
> -		return 0;
> -
> -	return 1;
> -}
> -
>   static int fimc_cap_s_selection(struct file *file, void *fh,
>   				struct v4l2_selection *s)
>   {
> @@ -1334,11 +1322,11 @@ static int fimc_cap_s_selection(struct file *file, void *fh,
>   	fimc_capture_try_selection(ctx, &rect, s->target);
>   
>   	if (s->flags & V4L2_SEL_FLAG_LE &&
> -	    !enclosed_rectangle(&rect, &s->r))
> +	    !v4l2_rect_enclosed(&rect, &s->r))
>   		return -ERANGE;
>   
>   	if (s->flags & V4L2_SEL_FLAG_GE &&
> -	    !enclosed_rectangle(&s->r, &rect))
> +	    !v4l2_rect_enclosed(&s->r, &rect))
>   		return -ERANGE;
>   
>   	s->r = rect;
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index 394e0818f2d5..9c666f663ab4 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -25,6 +25,7 @@
>   #include <media/v4l2-device.h>
>   #include <media/v4l2-ioctl.h>
>   #include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-rect.h>
>   #include <media/videobuf2-v4l2.h>
>   #include <media/videobuf2-dma-contig.h>
>   #include <media/drv-intf/exynos-fimc.h>
> @@ -868,19 +869,6 @@ static int fimc_lite_reqbufs(struct file *file, void *priv,
>   	return ret;
>   }
>   
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -	if (a->left < b->left || a->top < b->top)
> -		return 0;
> -	if (a->left + a->width > b->left + b->width)
> -		return 0;
> -	if (a->top + a->height > b->top + b->height)
> -		return 0;
> -
> -	return 1;
> -}
> -
>   static int fimc_lite_g_selection(struct file *file, void *fh,
>   				 struct v4l2_selection *sel)
>   {
> @@ -922,11 +910,11 @@ static int fimc_lite_s_selection(struct file *file, void *fh,
>   	fimc_lite_try_compose(fimc, &rect);
>   
>   	if ((sel->flags & V4L2_SEL_FLAG_LE) &&
> -	    !enclosed_rectangle(&rect, &sel->r))
> +	    !v4l2_rect_enclosed(&rect, &sel->r))
>   		return -ERANGE;
>   
>   	if ((sel->flags & V4L2_SEL_FLAG_GE) &&
> -	    !enclosed_rectangle(&sel->r, &rect))
> +	    !v4l2_rect_enclosed(&sel->r, &rect))
>   		return -ERANGE;
>   
>   	sel->r = rect;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 86bda3947110..9b22dd8e34f4 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -24,6 +24,7 @@
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/v4l2-ioctl.h>
> +#include <media/v4l2-rect.h>
>   #include <media/videobuf2-v4l2.h>
>   #include <media/videobuf2-dma-contig.h>
>   
> @@ -1735,19 +1736,6 @@ static int exynos3250_jpeg_try_downscale(struct s5p_jpeg_ctx *ctx,
>   	return 0;
>   }
>   
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -	if (a->left < b->left || a->top < b->top)
> -		return 0;
> -	if (a->left + a->width > b->left + b->width)
> -		return 0;
> -	if (a->top + a->height > b->top + b->height)
> -		return 0;
> -
> -	return 1;
> -}
> -
>   static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>   				   struct v4l2_rect *r)
>   {
> @@ -1780,7 +1768,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>   	r->left = round_down(r->left, 2);
>   	r->top = round_down(r->top, 2);
>   
> -	if (!enclosed_rectangle(r, &base_rect))
> +	if (!v4l2_rect_enclosed(r, &base_rect))
>   		return -EINVAL;
>   
>   	ctx->crop_rect.left = r->left;
> 
