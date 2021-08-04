Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B050F3DFB4B
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 08:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235484AbhHDGFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 02:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbhHDGFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 02:05:09 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C80AC0613D5
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 23:04:57 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id a20so1921887plm.0
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=s1QyI4OuNNIL0d9/Fmn3kOUfdBzFZ5BJ2C6Hz/djbOw=;
        b=HXRRUGyLr9PjLgBIQjsDpIex5Ip0Wmy5gEglMHyuagYiI0SAuFK6bWFYu9PgvDzhZl
         p9K+haRnyuxmcdCqvwUnpIPWtun1AIwrznOYY3YP/dA7C0zNUEp3Bn0g/22gCVjbTBgk
         ch/AJ/J3F4R86zdqFoILQPSKgA2ce+i+zJ9V+XkFpCkYMpgQYQg26BbUvSJW14xQR9jM
         n40PePtjJjGwx69NLf0fIhqZ/rzQWxkuf+aAzcgiRF+gZ0WF61uuD0PDHjfZzYSSQYM9
         t4aBRPOlrRnKBfNSmWj78dYFhIksAVdNWOeeSo8QLi4MscKo3+tGgFOBxd1ETKw+/vUI
         StMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
         :message-id:user-agent:mime-version;
        bh=s1QyI4OuNNIL0d9/Fmn3kOUfdBzFZ5BJ2C6Hz/djbOw=;
        b=U+SUo85a3uhk+DZ0PA8iBUNW4goRC0OMw5EQqYS5L/ZQKzWK/1dA21kMJoSkT1E12I
         edxgWyFmEfu5/7eJwAj6MXxyIwyfQBjgMUc1GU7KHZXv7Q2GzpMgreEiPL3mwB29Y8Sb
         4akRSQvCX3FyjzMqgUIUeDit3Di5ttULkkd7SgzTPm4ZickDSxemf+uv6aINT5sLORLC
         ulbssj1Gaw1nGg0GGqfuNRTXVIGBwn9UucIXPVubbjlg0fruYZ81dTKsko1orTdh/M9Q
         CLRq3E20KlYTJhSZhawUH4pzBH4ro7iJZlJC/au1TCGurQMLrBHvhFb4KuR5wgndvb9O
         +X0A==
X-Gm-Message-State: AOAM533W0jbSjIvGkoPKZJleJ8WJVeV70nzkPYd4GTwSPcUv3cxVPBeI
        UaFqMxFjd8N4QEQmfixgzLA=
X-Google-Smtp-Source: ABdhPJxPyeldaLFniJ2bsS1qVuFaVJGixvOJu0BNJMdnhJ7m3WYFLplU6xl/ZxGrevxTA9HTiSHIqg==
X-Received: by 2002:a65:55c9:: with SMTP id k9mr106005pgs.262.1628057097110;
        Tue, 03 Aug 2021 23:04:57 -0700 (PDT)
Received: from localhost (122x211x248x161.ap122.ftth.ucom.ne.jp. [122.211.248.161])
        by smtp.gmail.com with ESMTPSA id b12sm4823110pjw.6.2021.08.03.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 23:04:56 -0700 (PDT)
From:   Punit Agrawal <punitagrawal@gmail.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, Andrej Picej <andrej.picej@norik.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: coda: fix frame_mem_ctrl for YUV420 and YVU420
 formats
References: <20210719145708.10643-1-p.zabel@pengutronix.de>
Date:   Wed, 04 Aug 2021 15:04:53 +0900
In-Reply-To: <20210719145708.10643-1-p.zabel@pengutronix.de> (Philipp Zabel's
        message of "Mon, 19 Jul 2021 16:57:08 +0200")
Message-ID: <87lf5hsq2i.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Philipp Zabel <p.zabel@pengutronix.de> writes:

> The frame memory control register value is currently determined
> before userspace selects the final capture format and never corrected.
> Update ctx->frame_mem_ctrl in __coda_start_decoding() to fix decoding
> into YUV420 or YVU420 capture buffers.
>
> Reported-by: Andrej Picej <andrej.picej@norik.com>
> Fixes: 497e6b8559a6 ("media: coda: add sequence initialization work")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Thank you for the patch.

The patch fixes a failure (green screen) to display videos when using
I420 and YV12 with gstreamer.

Tested-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>

Considering it's a bug fix, any chance this can be picked up for 5.14?
It'll help land it to stable kernels which are being used on i.MX6 based
platforms internally.

Thanks,
Punit

> ---
>  drivers/media/platform/coda/coda-bit.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index 2f42808c43a4..c484c008ab02 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -2053,17 +2053,25 @@ static int __coda_start_decoding(struct coda_ctx *ctx)
>  	u32 src_fourcc, dst_fourcc;
>  	int ret;
>  
> +	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	src_fourcc = q_data_src->fourcc;
> +	dst_fourcc = q_data_dst->fourcc;
> +
>  	if (!ctx->initialized) {
>  		ret = __coda_decoder_seq_init(ctx);
>  		if (ret < 0)
>  			return ret;
> +	} else {
> +		ctx->frame_mem_ctrl &= ~(CODA_FRAME_CHROMA_INTERLEAVE | (0x3 << 9) |
> +					 CODA9_FRAME_TILED2LINEAR);
> +		if (dst_fourcc == V4L2_PIX_FMT_NV12 || dst_fourcc == V4L2_PIX_FMT_YUYV)
> +			ctx->frame_mem_ctrl |= CODA_FRAME_CHROMA_INTERLEAVE;
> +		if (ctx->tiled_map_type == GDI_TILED_FRAME_MB_RASTER_MAP)
> +			ctx->frame_mem_ctrl |= (0x3 << 9) |
> +				((ctx->use_vdoa) ? 0 : CODA9_FRAME_TILED2LINEAR);
>  	}
>  
> -	q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> -	q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> -	src_fourcc = q_data_src->fourcc;
> -	dst_fourcc = q_data_dst->fourcc;
> -
>  	coda_write(dev, ctx->parabuf.paddr, CODA_REG_BIT_PARA_BUF_ADDR);
>  
>  	ret = coda_alloc_framebuffers(ctx, q_data_dst, src_fourcc);
