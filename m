Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1112751F19
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbjGMKjV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbjGMKjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:39:20 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227DC1BFB
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:39:18 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6687096c6ddso350737b3a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689244757; x=1691836757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1RMUdRrYgBqgRdaOkRVx+gnbgFUNeS+s8UkiVmpAYVw=;
        b=AMcR2tawYF7YHC3lExbXpSpIvXV7FEabeMgTGBRQhbvUaU8z8T3ybhrx+5IU2jSWja
         VbnD5H9UPRmICfffgdQL4r4K2ngA9Rf6CbopwpfiTC/xO3rGxn2DV1bgzc9lIKHD034i
         pGODfKic4v/r0oSrreLN4s3PbcS5q1dvIu32o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689244757; x=1691836757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RMUdRrYgBqgRdaOkRVx+gnbgFUNeS+s8UkiVmpAYVw=;
        b=MQS0gqlXWiRELHAwU818LdkI8u4tgp5aN3XnwQXIjP11NQFR8KnWg+uInZhIFqech8
         Z030fNrTvvNwwqM6AQIpV4aJt9zZJqORazy1ih0jybgFmJ7sWeZbF+NC6u3+pHJ+VJsc
         WP/00SUFW0QvHh6QCFx51Ka3iCSYfJ4ijcjgREykcDujvZsr52SqlMdzG2gwfayMe4Hn
         ruz8WOrg0346OlBL9JjF5Z/naXHBrdOLn+amhGVOO3zPCbyFZDk8oJfqjtlKva4oPtbO
         gqy7KiE/WsYJvUq40YxxGuA0KJpLvOxjy6ZGJVDFp8KLbMC5bFLiNMPB5VbNfoCVWVCn
         xSJw==
X-Gm-Message-State: ABy/qLYrGM5gX1cEHIhZhJCuAH27V52RoM92Bc/OeE6mU0nT4bvmhxgl
        U9otOQp5Cunoo5xo3GiCadVLug==
X-Google-Smtp-Source: APBJJlGfYB8jCZQ4kYstrs+JEJ8tsTxcaqIq9sCmzpr7ZDgXZaRgds32Y6fBxMHNTEbTdym0bmt6zg==
X-Received: by 2002:a05:6a00:189c:b0:63d:3339:e967 with SMTP id x28-20020a056a00189c00b0063d3339e967mr890139pfh.19.1689244757497;
        Thu, 13 Jul 2023 03:39:17 -0700 (PDT)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id bt19-20020a632913000000b0054ff075fb31sm5196261pgb.42.2023.07.13.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:39:16 -0700 (PDT)
Date:   Thu, 13 Jul 2023 10:39:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     ayaka <ayaka@soulik.info>
Cc:     linux-media@vger.kernel.org, randy.li@synaptics.com,
        Brian.Starkey@arm.com, boris.brezillon@collabora.com,
        frkoenig@chromium.org, hans.verkuil@cisco.com, hiroh@chromium.org,
        hverkuil@xs4all.nl, kernel@collabora.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, narmstrong@baylibre.com, nicolas@ndufresne.ca,
        sakari.ailus@iki.fi, stanimir.varbanov@linaro.org,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v7 2/9] media: vivid: Convert to v4l2_ext_pix_format
Message-ID: <20230713103912.favcnhqwjkzvsa6b@chromium.org>
References: <20230206043308.28365-1-ayaka@soulik.info>
 <20230206043308.28365-3-ayaka@soulik.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206043308.28365-3-ayaka@soulik.info>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 06, 2023 at 12:33:01PM +0800, ayaka wrote:
> From: Helen Koike <helen.koike@collabora.com>
> 
> Simplify Multi/Single planer API handling by converting to v4l2_ext_pix_format.
> 
> Duplicate v4l2_ioctl_ops for touch devices. This is done to force the
> framework to use the ext hooks when the classic Api is used from
> userspace in Vid devices, and to keep touch devices with classic hook.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v7:
> - Force the userspace using the new APIs to operate non-touch drivers.

The primary objective of Linux development is not to break the
userspace. We can't just remove the old API, especially not from
existing drivers.

[snip]
>  int vivid_try_fmt_vid_cap(struct file *file, void *priv,
> -			struct v4l2_format *f)
> +			  struct v4l2_ext_pix_format *f)
>  {
> -	struct v4l2_pix_format_mplane *mp = &f->fmt.pix_mp;
> -	struct v4l2_plane_pix_format *pfmt = mp->plane_fmt;
>  	struct vivid_dev *dev = video_drvdata(file);
> +	struct v4l2_plane_pix_format *pfmt = f->plane_fmt;
>  	const struct vivid_fmt *fmt;
>  	unsigned bytesperline, max_bpl;
>  	unsigned factor = 1;
>  	unsigned w, h;
>  	unsigned p;
> -	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);

Why is this condition being removed?

Best regards,
Tomasz

>  
> -	fmt = vivid_get_format(dev, mp->pixelformat);
> +	fmt = vivid_get_format(dev, f->pixelformat);
>  	if (!fmt) {
>  		dprintk(dev, 1, "Fourcc format (0x%08x) unknown.\n",
> -			mp->pixelformat);
> -		mp->pixelformat = V4L2_PIX_FMT_YUYV;
> -		fmt = vivid_get_format(dev, mp->pixelformat);
> +			f->pixelformat);
> +		f->pixelformat = V4L2_PIX_FMT_YUYV;
> +		fmt = vivid_get_format(dev, f->pixelformat);
>  	}
>  
> -	mp->field = vivid_field_cap(dev, mp->field);
> +	f->field = vivid_field_cap(dev, f->field);
>  	if (vivid_is_webcam(dev)) {
>  		const struct v4l2_frmsize_discrete *sz =
>  			v4l2_find_nearest_size(webcam_sizes,
>  					       VIVID_WEBCAM_SIZES, width,
> -					       height, mp->width, mp->height);
> +					       height, f->width, f->height);
>  
>  		w = sz->width;
>  		h = sz->height;
> @@ -604,14 +603,14 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>  		w = dev->src_rect.width;
>  		h = dev->src_rect.height;
>  	}
> -	if (V4L2_FIELD_HAS_T_OR_B(mp->field))
> +	if (V4L2_FIELD_HAS_T_OR_B(f->field))
>  		factor = 2;
>  	if (vivid_is_webcam(dev) ||
>  	    (!dev->has_scaler_cap && !dev->has_crop_cap && !dev->has_compose_cap)) {
> -		mp->width = w;
> -		mp->height = h / factor;
> +		f->width = w;
> +		f->height = h / factor;
>  	} else {
> -		struct v4l2_rect r = { 0, 0, mp->width, mp->height * factor };
> +		struct v4l2_rect r = { 0, 0, f->width, f->height * factor };
>  
>  		v4l2_rect_set_min_size(&r, &vivid_min_rect);
>  		v4l2_rect_set_max_size(&r, &vivid_max_rect);
> @@ -624,16 +623,15 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>  		} else if (!dev->has_scaler_cap && !dev->has_crop_cap) {
>  			v4l2_rect_set_min_size(&r, &dev->src_rect);
>  		}
> -		mp->width = r.width;
> -		mp->height = r.height / factor;
> +		f->width = r.width;
> +		f->height = r.height / factor;
>  	}
>  
>  	/* This driver supports custom bytesperline values */
>  
> -	mp->num_planes = fmt->buffers;
>  	for (p = 0; p < fmt->buffers; p++) {
>  		/* Calculate the minimum supported bytesperline value */
> -		bytesperline = (mp->width * fmt->bit_depth[p]) >> 3;
> +		bytesperline = (f->width * fmt->bit_depth[p]) >> 3;
>  		/* Calculate the maximum supported bytesperline value */
>  		max_bpl = (MAX_ZOOM * MAX_WIDTH * fmt->bit_depth[p]) >> 3;
>  
> @@ -642,48 +640,49 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
>  		if (pfmt[p].bytesperline < bytesperline)
>  			pfmt[p].bytesperline = bytesperline;
>  
> -		pfmt[p].sizeimage = (pfmt[p].bytesperline * mp->height) /
> +		pfmt[p].sizeimage = (pfmt[p].bytesperline * f->height) /
>  				fmt->vdownsampling[p] + fmt->data_offset[p];
> -
> -		memset(pfmt[p].reserved, 0, sizeof(pfmt[p].reserved));
>  	}
> +
> +	if (p < VIDEO_MAX_PLANES)
> +		pfmt[p].sizeimage = 0;
> +
>  	for (p = fmt->buffers; p < fmt->planes; p++)
> -		pfmt[0].sizeimage += (pfmt[0].bytesperline * mp->height *
> +		pfmt[0].sizeimage += (pfmt[0].bytesperline * f->height *
>  			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
>  			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
>  
> -	if (!user_set_csc || !v4l2_is_colorspace_valid(mp->colorspace))
> -		mp->colorspace = vivid_colorspace_cap(dev);
> +	if (!v4l2_is_colorspace_valid(f->colorspace))
> +		f->colorspace = vivid_colorspace_cap(dev);
>  
> -	if (!user_set_csc || !v4l2_is_xfer_func_valid(mp->xfer_func))
> -		mp->xfer_func = vivid_xfer_func_cap(dev);
> +	if (!v4l2_is_xfer_func_valid(f->xfer_func))
> +		f->xfer_func = vivid_xfer_func_cap(dev);
>  
>  	if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
> -		if (!user_set_csc || !v4l2_is_hsv_enc_valid(mp->hsv_enc))
> -			mp->hsv_enc = vivid_hsv_enc_cap(dev);
> +		if (!v4l2_is_hsv_enc_valid(f->hsv_enc))
> +			f->hsv_enc = vivid_hsv_enc_cap(dev);
>  	} else if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
> -		if (!user_set_csc || !v4l2_is_ycbcr_enc_valid(mp->ycbcr_enc))
> -			mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
> +		if (!v4l2_is_ycbcr_enc_valid(f->ycbcr_enc))
> +			f->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>  	} else {
> -		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
> +		f->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
>  	}
>  
>  	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR ||
>  	    fmt->color_enc == TGP_COLOR_ENC_RGB) {
> -		if (!user_set_csc || !v4l2_is_quant_valid(mp->quantization))
> -			mp->quantization = vivid_quantization_cap(dev);
> +		if (!v4l2_is_quant_valid(f->quantization))
> +			f->quantization = vivid_quantization_cap(dev);
>  	} else {
> -		mp->quantization = vivid_quantization_cap(dev);
> +		f->quantization = vivid_quantization_cap(dev);
>  	}
>  
> -	memset(mp->reserved, 0, sizeof(mp->reserved));
> +	memset(f->reserved, 0, sizeof(f->reserved));
>  	return 0;
>  }
[snip]
