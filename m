Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A542EC2D9
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbhAFR5s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbhAFR5r (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 12:57:47 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBD3C06134D
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:57:07 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c124so3101033wma.5
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 09:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/wLrGEJcxRIQirkxA+5EUJnsTJ6OxXCF28Xx4nX8cqs=;
        b=RgusIlh+bjj5EByHfm4ujUPzAZsnAoZ3Hw81yfZ7P+HexiX6PZQ+NSmp3v4ODlall0
         y53V4IbwnKUQb+LAyTa9/i/JdcxcbxCjsH7rv6Bt4c3XAx4YIHnjJ/mdUgNfhmB6vRZb
         zH6UPxlSYgS17nYZxac+GdTHc3sbQR9O/KlatCDutZ6yKwtinLsboIjiEihU8ousB33f
         7zxUROAJl1qpFEEQm4g8SSTH3iuSc+wytVUWz65EgOCRcnTqpRbJWEpOUaOjBUI+kXVx
         c+PLOnqvyEjLIBFYmXU0Mmsw4e+BKlp2qzlSc1cRljeNQFLfMgR8IcN9gWKxY0TEePeY
         w6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/wLrGEJcxRIQirkxA+5EUJnsTJ6OxXCF28Xx4nX8cqs=;
        b=pwQBTqLKh4v1cc0mpUlPgf2UiucUkmm5lyA6+XBjhrW0aZcNZa4WB5R1ww0B4cmJkx
         shkbo+maVQqQJpb9vK0u1WnWyBlNfG6BARLDCV7EvBNzdrBZYaryE2Illvqq64EWOZft
         RPbzvagZ0Q4P8QBle6Tfo6ZB5BRb+bmTlnPOKWW3Q8hcWTcy5xawLywacaLxTHrKUsgp
         xjNxBeMc1/9kUuB3b3kvCeoJnPgJrRDbnmV9bfMEJjjR9hxyyKiCXGYyOruEi49SdTb5
         rFjmxmB3WDJkkK4UtRW9by2Q/xPbcFLPmP8NKpysQapHKaouSHpomNQA4WsadcJmlFoN
         aPlQ==
X-Gm-Message-State: AOAM531k4iv/6ZW17XfaoiIMZJJpVuOkdnWxIokXpdXuPgY9jhWkIu86
        rje50UgbXlXCrSaN0i0gFSvNo/Ev1EI=
X-Google-Smtp-Source: ABdhPJxm9pHpwF3KJKsXPL4B+jMhkyKVB82mXhLSLh4yJNY3PMK0YRv3x0qgANSDSKEHdk/o65hVWw==
X-Received: by 2002:a1c:1f94:: with SMTP id f142mr4542286wmf.124.1609955826137;
        Wed, 06 Jan 2021 09:57:06 -0800 (PST)
Received: from [172.30.88.143] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id h9sm3925291wre.24.2021.01.06.09.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:57:05 -0800 (PST)
Subject: Re: [PATCH 23/75] media: imx: capture: Pass v4l2_pix_format to
 __capture_legacy_try_fmt()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-24-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <90ffebbd-f131-6f95-b057-c0011b1f29c8@gmail.com>
Date:   Wed, 6 Jan 2021 09:57:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105152852.5733-24-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/5/21 7:28 AM, Laurent Pinchart wrote:
> The __capture_legacy_try_fmt() function only needs the v4l2_pix_format
> embedded in the v4l2_format argument it receives. Pass it the
> v4l2_pix_format directly, allowing on caller to allocate a smaller
> structure on the stack.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx-media-capture.c | 25 ++++++++++---------
>   1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 7932b7f0f4f2..d34cbf0a0fa1 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -232,7 +232,7 @@ static int capture_legacy_enum_fmt_vid_cap(struct file *file, void *fh,
>   
>   static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   				    struct v4l2_subdev_format *fmt_src,
> -				    struct v4l2_format *f,
> +				    struct v4l2_pix_format *pixfmt,
>   				    const struct imx_media_pixfmt **retcc,
>   				    struct v4l2_rect *compose)
>   {
> @@ -246,7 +246,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   
>   		fmt_sel = (cc->cs == IPUV3_COLORSPACE_YUV)
>   			? PIXFMT_SEL_YUV : PIXFMT_SEL_RGB;
> -		fourcc = f->fmt.pix.pixelformat;
> +		fourcc = pixfmt->pixelformat;
>   
>   		cc = imx_media_find_pixel_format(fourcc, fmt_sel);
>   		if (!cc) {
> @@ -261,7 +261,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   	}
>   
>   	/* allow IDMAC interweave but enforce field order from source */
> -	if (V4L2_FIELD_IS_INTERLACED(f->fmt.pix.field)) {
> +	if (V4L2_FIELD_IS_INTERLACED(pixfmt->field)) {
>   		switch (fmt_src->format.field) {
>   		case V4L2_FIELD_SEQ_TB:
>   			fmt_src->format.field = V4L2_FIELD_INTERLACED_TB;
> @@ -274,7 +274,7 @@ static int __capture_legacy_try_fmt(struct capture_priv *priv,
>   		}
>   	}
>   
> -	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, &fmt_src->format, cc);
> +	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
>   
>   	if (retcc)
>   		*retcc = cc;
> @@ -302,7 +302,8 @@ static int capture_legacy_try_fmt_vid_cap(struct file *file, void *fh,
>   	if (ret)
>   		return ret;
>   
> -	return __capture_legacy_try_fmt(priv, &fmt_src, f, NULL, NULL);
> +	return __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix, NULL,
> +					NULL);
>   }
>   
>   static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
> @@ -323,8 +324,8 @@ static int capture_legacy_s_fmt_vid_cap(struct file *file, void *fh,
>   	if (ret)
>   		return ret;
>   
> -	ret = __capture_legacy_try_fmt(priv, &fmt_src, f, &priv->vdev.cc,
> -				       &priv->vdev.compose);
> +	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f->fmt.pix,
> +				       &priv->vdev.cc, &priv->vdev.compose);
>   	if (ret)
>   		return ret;
>   
> @@ -534,7 +535,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
>   	struct v4l2_subdev_format fmt_src;
>   	const struct imx_media_pixfmt *cc;
>   	struct v4l2_rect compose;
> -	struct v4l2_format f;
> +	struct v4l2_pix_format pixfmt;
>   	int ret;
>   
>   	fmt_src.pad = priv->src_sd_pad;
> @@ -543,14 +544,14 @@ static int capture_validate_fmt(struct capture_priv *priv)
>   	if (ret)
>   		return ret;
>   
> -	v4l2_fill_pix_format(&f.fmt.pix, &fmt_src.format);
> +	v4l2_fill_pix_format(&pixfmt, &fmt_src.format);
>   
> -	ret = __capture_legacy_try_fmt(priv, &fmt_src, &f, &cc, &compose);
> +	ret = __capture_legacy_try_fmt(priv, &fmt_src, &pixfmt, &cc, &compose);
>   	if (ret)
>   		return ret;
>   
> -	return (priv->vdev.fmt.width != f.fmt.pix.width ||
> -		priv->vdev.fmt.height != f.fmt.pix.height ||
> +	return (priv->vdev.fmt.width != pixfmt.width ||
> +		priv->vdev.fmt.height != pixfmt.height ||
>   		priv->vdev.cc->cs != cc->cs ||
>   		priv->vdev.compose.width != compose.width ||
>   		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
