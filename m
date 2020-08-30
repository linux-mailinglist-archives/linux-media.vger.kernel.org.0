Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76E24256EBF
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 16:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgH3OnQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 10:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbgH3OnI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 10:43:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30313C061573
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 07:43:07 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so1271438wrn.0
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 07:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6e9V4ZhkJRpAJ7F/+y/Cut+plmBf1yw2+PGGc9hYG+Q=;
        b=N+aV4wLo5T34Oc3c2GG6llVJQnvo4r2n85Nzg/UE8oYIs186qq7aO3jFPIz81X/TWI
         2GgcqI6YsaDSlS4unZR2dcMikRuGG8fb3cRqtHw0GK7W+SNJYNz864xY6b5fbbYwPcmL
         jUzHPVDl3CUGiKIuhAOHijqhUJwfGRBWPKTUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6e9V4ZhkJRpAJ7F/+y/Cut+plmBf1yw2+PGGc9hYG+Q=;
        b=TGGoVrKIt9pCFoN/ROyeDUpCR3vgSClBr7l4rZq9q++yF/m8w658oI2I4uEE5us6iB
         1ABGhLdBGoin3/Sxe6dbiJpCJHUaZ4agO9naZg0TipYsSjTze0M/YT3o91XES0dpdYf9
         /z1fc46O1bJ/UhZeEXsZOY82M8w8GJkTrekcn6LySrNc9+L3j3ZaF7IXjdac1EMc9aZg
         2XHvQovuP7iWwnug9/ssFEfX5qzatDnriUztp2FQdMKxaNgHewZCs3c6DSJR+HLvWkPe
         4USTA2enAq/qDq7GGYxMvQ3vjyp5XkdgTh1RrM9wSbVA6evqEcdf5vrW01Aen5dcLxOY
         uTPQ==
X-Gm-Message-State: AOAM530SPm5aZYx40Bbvowtmn3zruNKlwbOytE4oasaEKJ/3P146k+jE
        KGAQT+YjibmJgRS/E+OfVrr0Uw==
X-Google-Smtp-Source: ABdhPJwXrNDHqPXflqwf856qXRYsYN6Bb1P2Tx+sae4RD32DhtOM7I7P/pHiRFnCqHeeuDFEude3Sw==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr8066946wrq.410.1598798584161;
        Sun, 30 Aug 2020 07:43:04 -0700 (PDT)
Received: from chromium.org (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id m125sm7283404wme.35.2020.08.30.07.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 07:43:03 -0700 (PDT)
Date:   Sun, 30 Aug 2020 14:43:02 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH v3 06/10] media: staging: rkisp1: add a helper function
 to enumerate supported mbus formats on capture
Message-ID: <20200830144302.GA3265406@chromium.org>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-7-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723132014.4597-7-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, Jul 23, 2020 at 03:20:10PM +0200, Dafna Hirschfeld wrote:
> Add a function 'rkisp1_cap_enum_mbus_codes' that receive
> a pointer to 'v4l2_subdev_mbus_code_enum' and returns the
> next supported mbus format of the capture. The function
> assumes that pixel formats with identical 'mbus' are grouped
> together in the hardcoded arrays, therefore the order of the
> entries in the array 'rkisp1_sp_fmts' are adjusted.
> This function is a helper for the media bus enumeration of
> the source pad of the resizer entity.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 77 ++++++++++++-------
>  drivers/staging/media/rkisp1/rkisp1-common.h  |  8 ++
>  2 files changed, 58 insertions(+), 27 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 5dd91b5f82a4..4dabd07a3da9 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -112,6 +112,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> +	/* yuv400 */
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.uv_swap = 0,
> +		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},
>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> @@ -144,13 +151,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  	/* raw */
>  	{
>  		.fourcc = V4L2_PIX_FMT_SRGGB8,
> @@ -236,6 +236,26 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>  	},
> +	/* yuv400 */
> +	{
> +		.fourcc = V4L2_PIX_FMT_GREY,
> +		.uv_swap = 0,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},
> +	/* rgb */
> +	{
> +		.fourcc = V4L2_PIX_FMT_XBGR32,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	}, {
> +		.fourcc = V4L2_PIX_FMT_RGB565,
> +		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> +		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> +		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> +	},

Is there any reason to move RGB formats here rather than keeping them at
the end of the list, after all YUV formats?

>  	/* yuv420 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
> @@ -274,26 +294,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
>  	},
> -	/* yuv400 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_GREY,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
> -	/* rgb */
> -	{
> -		.fourcc = V4L2_PIX_FMT_XBGR32,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_RGB565,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> -		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> -	},
>  };
>  
>  static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
> @@ -334,6 +334,29 @@ rkisp1_vdev_to_node(struct video_device *vdev)
>  	return container_of(vdev, struct rkisp1_vdev_node, vdev);
>  }
>  
> +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
> +			       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	const struct rkisp1_capture_fmt_cfg *fmts = cap->config->fmts;
> +	u32 curr_mbus = fmts[0].mbus;
> +	int i, n = 0;
> +
> +	if (code->index == 0) {
> +		code->code = fmts[0].mbus;
> +		return 0;
> +	}
> +
> +	for (i = 1; i < cap->config->fmt_size; i++)

How about just initializing curr_mbus to MEDIA_BUS_FMT_FIXED? This is not
supposed to be found in the array, so is a safe initial value, which would
allow removing the explicit handling of index == 0.

> +		if (fmts[i].mbus != curr_mbus) {

As Helen mentioned, we could use the continue keyword to skip the iteration
early and make it obvious that rest of the loop is entirely for the case
where mbus != curr_mbus, removing one level of nesting.

> +			curr_mbus = fmts[i].mbus;
> +			if (++n == code->index) {
> +				code->code = curr_mbus;
> +				return 0;
> +			}
> +		}

According to the kernel coding style guidelines [1], this for loop should
have braces.

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces

Best regards,
Tomasz
