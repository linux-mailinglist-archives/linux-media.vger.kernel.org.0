Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637FC560A2D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 21:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiF2TRk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 15:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbiF2TRk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 15:17:40 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFAD3C73B
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:17:39 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-101cdfddfacso22718692fac.7
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o/jwDiSinXrZOl+AEZjENE1aXxHwuHlOc6Yz74KbYe0=;
        b=JhdB2BWMAi71kcD+c+7SIRFoBiHS6KZWlMNs8nE2JqKY9mTy+LMUKNGK6hA37tCcur
         3ihy3S0zD4ttDFVRVGcRYlgpAQxEJacZYkJ/wx6wXApOJgnEySeGr+h4cHZq1fHfTvwn
         oQ15u7ydaB0/VrxUkP7JIrv4B6SQCIfxCOiySaf5MFNFaRUFUX2GWn5vcLfYfeCrJBG3
         cOcN2K6do9JMJkXPyGf5BCKo2Tdhhn6aTazrQ+981pV/Z1n8WKzmiw6Z2M9jtW06chIe
         Xo85QNzBDp4TE82AvhjeJAgjK0ukkf9kKJjpf/wQhLhRiOxOdIdoGie5zYZEDxV8OEzp
         LAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o/jwDiSinXrZOl+AEZjENE1aXxHwuHlOc6Yz74KbYe0=;
        b=c/mbEXBwRiGusm5265+4K3q2RNsjkaXlTf1eUFAv89zVu2w8oiZ7zpzkCLm4NqCKba
         nhSY8jNZD0bgMNv/1eK0Dk2Jtb64R/wLS4InwRaVJWyoNlBHtPVuAGKLYvx5lLDSVCiW
         8Jtt/e2OZ1Bb5bvC8zyE/al/1jBoPQAb+VTV47GMOj9ySJeVTvapMw4abMI2MS7+GUk/
         SRBIsfZsTk8OOzWPg7ccfN0rikh8j+t0qhbdOmfrbidWJRn9Z4dAzsqttoCVrCN3Ovdx
         V/ooccHp89N8k5YAIecvtlL9xPSfmgCTQ/Ct+08Fjveo7G571lI+C30aH8CxFSwVRztB
         Ce8w==
X-Gm-Message-State: AJIora9ilmoLH0LaMs6E5i/aQeJ6nYQ1csWdEf2yNuyDqEWEQ6gDqgwB
        U6E3H6lb/w1fE5dwXKRlGwCiqw==
X-Google-Smtp-Source: AGRyM1ud70v6ZQx2pnfpvswry6jTmrDjH3dXCQpTFuuOtuEaCYXzyLQ8lVwOmnjRqh/VOA9wD9nKyg==
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id i1-20020a056870c1c100b000ee5c837be7mr2968439oad.53.1656530258908;
        Wed, 29 Jun 2022 12:17:38 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id r10-20020a056808210a00b00325cda1ff8esm9021967oiw.13.2022.06.29.12.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 12:17:38 -0700 (PDT)
Date:   Wed, 29 Jun 2022 16:17:32 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     p.zabel@pengutronix.de, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com,
        nicolas.dufresne@collabora.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 6/7] media: hantro: Store VP9 bit depth in context
Message-ID: <YrylTP7c8q7vZGam@eze-laptop>
References: <20220616202513.351039-1-jernej.skrabec@gmail.com>
 <20220616202513.351039-7-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616202513.351039-7-jernej.skrabec@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Thu, Jun 16, 2022 at 10:25:12PM +0200, Jernej Skrabec wrote:
> Now that we have proper infrastructure for postprocessing 10-bit
> formats, store VP9 bit depth in context.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/hantro/hantro_drv.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 01d33dcb0467..afddf7ac0731 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -324,6 +324,24 @@ static int hantro_hevc_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int hantro_vp9_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hantro_ctx *ctx;
> +
> +	ctx = container_of(ctrl->handler,
> +			   struct hantro_ctx, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_STATELESS_VP9_FRAME:
> +		ctx->bit_depth = ctrl->p_new.p_vp9_frame->bit_depth;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ctrl_ops hantro_ctrl_ops = {
>  	.try_ctrl = hantro_try_ctrl,
>  };
> @@ -336,6 +354,10 @@ static const struct v4l2_ctrl_ops hantro_hevc_ctrl_ops = {
>  	.s_ctrl = hantro_hevc_s_ctrl,
>  };
>  
> +static const struct v4l2_ctrl_ops hantro_vp9_ctrl_ops = {
> +	.s_ctrl = hantro_vp9_s_ctrl,
> +};
> +
>  #define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
>  					 V4L2_JPEG_ACTIVE_MARKER_COM | \
>  					 V4L2_JPEG_ACTIVE_MARKER_DQT | \
> @@ -503,6 +525,7 @@ static const struct hantro_ctrl controls[] = {
>  		.codec = HANTRO_VP9_DECODER,
>  		.cfg = {
>  			.id = V4L2_CID_STATELESS_VP9_FRAME,
> +			.ops = &hantro_vp9_ctrl_ops,
>  		},
>  	}, {
>  		.codec = HANTRO_VP9_DECODER,
> -- 
> 2.36.1
> 
