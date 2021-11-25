Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840A945D9AC
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 13:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239834AbhKYMFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 07:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239138AbhKYMDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 07:03:43 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD8FC061746
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 04:00:32 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id m16so2774867vkl.13
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 04:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Lylh8DR+450t+VKD+Wrn7i+Xuwy9BF3AUDecTVOK4g=;
        b=erksV85QXm/bqtxQPmB7msXlbNBDCVOQLjiysuFCaDkVczzFvYyAl5dXhwb+8YbvxT
         yYfptkjAO28P25RNMRp7yU2utcDxwTtprCmykjLrDjlwBXc+xEXFM03rSibA7KbedEpP
         Z4tEpYadJa01M2Ewa2YfPP0S+CIEP7EDKn+vc1o3jAuGRqF6ucXS4hC9ZTURS8fm2GwZ
         AMhr8TAKYcvFsrQUlRtTGtPVu/3nW1h5xGvbd79S22JduH8vIEZDlT0gKFOtiwU+JybA
         JkVte1dr+fEhRJ19HCwBFy3luCv+Aa+nIQm8NWdS+NN/a1+vHezBFoJ1lkIVnEjat7Ka
         o1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Lylh8DR+450t+VKD+Wrn7i+Xuwy9BF3AUDecTVOK4g=;
        b=UKppVdyTS2TFSEzeFWmBVDmuVeT5S9LGAUSVxgyF7UwLQUqLEZgMaLI38Vb/KJqsua
         MYndk2qGxSrjR8Nf1FxTKwYi+afy6qJQLvbgvIUaTHthfQIrTKl0ORh3LQDj8mXJLKni
         pWTXsYZW2geM7p/uQazXzPac8LJM1G8eo2N2MBVIK3D5tKldQ/90vZH+ePzbejlhL6Hl
         R5wlKLwu0qzjT4abK008miZOkh0YbdVMPgajO7kQteRWfjStkYPpyFt4iD7heTuwu3Vc
         0T8+UgTJvcpTwxJipFpirZhvXWF1qGVFGgVknU/JcJgC7IhTD6NLBO4vAxijC4UnL/IV
         2ShA==
X-Gm-Message-State: AOAM530/umPkGhoMdk1ewfZGIDlfE0NfLGkfS6Xzda+lfJtBa2KjtJVR
        YBmUUi9/oGjB7VaUVuxssR66Bw==
X-Google-Smtp-Source: ABdhPJygr6uthtUgThXM0nJKXNt/5LsubRRa0ZItKbmNtKp+p8GFTBFPOJp05+fRHPe/w8EB24DpCg==
X-Received: by 2002:a05:6122:d08:: with SMTP id az8mr9774743vkb.15.1637841631793;
        Thu, 25 Nov 2021 04:00:31 -0800 (PST)
Received: from eze-laptop (host208.201-253-22.telecom.net.ar. [201.253.22.208])
        by smtp.gmail.com with ESMTPSA id c9sm1710140uaf.12.2021.11.25.04.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 04:00:30 -0800 (PST)
Date:   Thu, 25 Nov 2021 09:00:24 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 4/7] media: hantro: move postproc enablement for old cores
Message-ID: <YZ962CvUbKoiIGyZ@eze-laptop>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
 <20211122184702.768341-5-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122184702.768341-5-jernej.skrabec@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Mon, Nov 22, 2021 at 07:46:59PM +0100, Jernej Skrabec wrote:
> Older G2 cores, like that in Allwinner H6, seem to have issue with
> latching postproc register values if this is first thing done in job.
> Moving that to the end solves the issue.
> 

Any idea what exact register should be written before the post-processor
is enabled, for H6 to work? Also, which of the PP registers need
to be written "at the end"?

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 8c3de31f51b3..530994ab3024 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -130,7 +130,7 @@ void hantro_start_prepare_run(struct hantro_ctx *ctx)
>  	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
>  				&ctx->ctrl_handler);
>  
> -	if (!ctx->is_encoder) {
> +	if (!ctx->is_encoder && !ctx->dev->variant->legacy_regs) {

To make this less fragile, do you think it would make sense to
have a dedicated quirk flag, something like "legacy_post_proc",
instead of overloading the meaning of legacy_regs.

What do you think?

Thanks,
Ezequiel

>  		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
>  			hantro_postproc_enable(ctx);
>  		else
> @@ -142,6 +142,13 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  {
>  	struct vb2_v4l2_buffer *src_buf;
>  
> +	if (ctx->dev->variant->legacy_regs && !ctx->is_encoder) {
> +		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
> +			hantro_postproc_enable(ctx);
> +		else
> +			hantro_postproc_disable(ctx);
> +	}
> +
>  	src_buf = hantro_get_src_buf(ctx);
>  	v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
>  				   &ctx->ctrl_handler);
> -- 
> 2.34.0
> 
