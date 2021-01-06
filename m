Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDC22EC2E2
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbhAFSAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:00:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbhAFSAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 13:00:38 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4580CC06134D
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:59:58 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q75so3383326wme.2
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 09:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=d/uQ96Nm7GkMDXpT9BEbzUxVz7QdosgU9iHmROHdTvY=;
        b=koPsECGzfl2MyIlNb2S954IUrog9ms88ACPq+2thHaK3hlzfMczEfBaeRJp5tBKAnX
         ID0G3q60Z3rAdjuvY7Phmmvkr+B25tgj7dc/OETThkkf18Ut8AxTUMmvDB7gPSdzgAKT
         E88Pfihjnyq8pMVRWrWP6b0oJcaxdYKOcNsImvD2dyqL5LFGAisrbqfB0RHyLfx/1Kcm
         0Yi5o0jiN+up5PvufZNHa/VMLW6XOTJQZZi0L7Q2UJbPbLDUCuL5pAuv1jaiUPS+8OxP
         pke0Ti97ilEk9BmPc6TheQvEptIrgM/nky48q6IIRy0L2fKO6QgQVIUSYATztuSyUInS
         nZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=d/uQ96Nm7GkMDXpT9BEbzUxVz7QdosgU9iHmROHdTvY=;
        b=UD5oZryfDNS/UHXLPXJOadz6bw5cRoKj6uCPjvjCkKMMf9haAPx/xf70EzzFNqGnpF
         90gV1+vE1DnEH5zV5eFeurfPAVTiVZzf6JPVFB4QyujXF+2qZkWEgl1u+sofsX3u0kwe
         4SYHfko022OMcloQipoGDUxP4pHgCwPxSMyGWHknSwDmF7EMNA3Ms1wgHNypNQhCDTs/
         +cooEgmCVPSHp4tdUmlOPJkITQagFE1dW/QsjZrG4/A1tIEUe5IDVNf84c4LNdKHGiqQ
         eBMf8wSW+GpiWf0JIqWaOpod85baQaHhDU9To0ukBHbl4PFYskGta1kBk8DMILlthxj4
         2d8A==
X-Gm-Message-State: AOAM532kQEouD1M+/rvkYBbH1pxxFN7HRAW4bIU53S6Af8f6UrwxIsAA
        yAngJIAvo+23wMZDqfSEs+rEcQVEevQ=
X-Google-Smtp-Source: ABdhPJx11TlS8Zzqffy9hAzmLrvzkksncXLxhVR4rpMhidtj7Zx5IqwOVfuB6H36LLf4O8G9KHNo0Q==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr4542259wmi.83.1609955996925;
        Wed, 06 Jan 2021 09:59:56 -0800 (PST)
Received: from [172.30.88.143] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id i11sm3871193wmd.47.2021.01.06.09.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:59:56 -0800 (PST)
Subject: Re: [PATCH 27/75] media: imx: capture: Simplify
 __capture_legacy_try_fmt()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-28-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <bf21ed8e-4cfe-513b-40fd-754ad196832a@gmail.com>
Date:   Wed, 6 Jan 2021 09:59:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105152852.5733-28-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/5/21 7:28 AM, Laurent Pinchart wrote:
> The __capture_legacy_try_fmt() function returns two values through
> pointer arguments. One is a compose rectangle, which duplicates
> informationr returned through the subdev format argument, and can thus
> be removed. The other is the imx_media_pixfmt, which can be returned
> by value instead.
>
> Simplify the implementation of __capture_legacy_try_fmt() by dropping
> the retcc and compose arguments, and returning the imx_media_pixfmt by
> value.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx-media-capture.c | 40 ++++++++-----------
>   1 file changed, 17 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 8f3c0da371d3..9a8e1a1400a2 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -251,17 +251,16 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
>   	return 0;
>   }
>   
> -static int __capture_legacy_try_fmt(struct capture_priv *priv,
> -				    struct v4l2_subdev_format *fmt_src,
> -				    struct v4l2_pix_format *pixfmt,
> -				    const struct imx_media_pixfmt **retcc,
> -				    struct v4l2_rect *compose)
> +static const struct imx_media_pixfmt *
> +__capture_legacy_try_fmt(struct capture_priv *priv,
> +			 struct v4l2_subdev_format *fmt_src,
> +			 struct v4l2_pix_format *pixfmt)
>   {
>   	const struct imx_media_pixfmt *cc;
>   
>   	cc = capture_find_format(fmt_src->format.code, pixfmt->pixelformat);
>   	if (WARN_ON(!cc))
> -		return -EINVAL;
> +		return NULL;
>   
>   	/* allow IDMAC interweave but enforce field order from source */
>   	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
> @@ -279,17 +278,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   
>   	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
>   
> -	if (retcc)
> -		*retcc = cc;
> -
> -	if (compose) {
> -		compose->left = 0;
> -		compose->top = 0;
> -		compose->width = fmt_src->format.width;
> -		compose->height = fmt_src->format.height;
> -	}
> -
> -	return 0;
> +	return cc;
>   }
>   
>   static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
> @@ -305,8 +294,10 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
>   	if (ret)
>   		return ret;
>   
> -	return __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix, NULL,
> -					NULL);
> +	if (!__capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix))
> +		return -EINVAL;
> +
> +	return 0;
>   }
>   
>   static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
> @@ -314,6 +305,7 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
>   {
>   	struct capture_priv *priv = video_drvdata(file);
>   	struct v4l2_subdev_format fmt_src;
> +	const struct imx_media_pixfmt *cc;
>   	int ret;
>   
>   	if (vb2_is_busy(&priv->q)) {
> @@ -327,12 +319,14 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
>   	if (ret)
>   		return ret;
>   
> -	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix,
> -				       &priv->vdev.cc, &priv->vdev.compose);
> -	if (ret)
> -		return ret;
> +	cc = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix);
> +	if (!cc)
> +		return -EINVAL;
>   
> +	priv->vdev.cc = cc;
>   	priv->vdev.fmt = f->fmt.pix;
> +	priv->vdev.compose.width = fmt_src.format.width;
> +	priv->vdev.compose.height = fmt_src.format.height;
>   
>   	return 0;
>   }

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>

