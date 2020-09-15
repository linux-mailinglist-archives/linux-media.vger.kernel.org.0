Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1B2269A13
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 02:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgIOAEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 20:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgIOAEd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 20:04:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C438CC06178A
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 17:04:31 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so1185227ljk.8
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2020 17:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jgCGWOK0Qefy5Fhi4KKTahno9HKUpTYwmUl0eHwt2L4=;
        b=gSjbKBzMm+N312I84x+Yj8GcAMzjKnYipMN8Z/bEgnQrQsTs+OmwU4b3LVEPLwC6aK
         ocIMM+heLgZ3vEwHp0OOlrn+cAx5nyV2M5teZHYHfh3fUcu5feP6Luzod1oRkx8I3457
         71eZxcygUILlB5ftrtFttXWHouoHT6IlUuBmrFxSyn7h36CJ7rMgXqThgCKjCltPJO7/
         5dXJ7pcibiBU8q64WFIsHQjS0tmzWulQO9EAq4FIaXKpCbBfpP37anhWWRP5pdiKqNz3
         xaBkajrABn+SP7BCmkJwqx9zX2i0hh8HFQA0JsfgSSzT2EJGkd7gM9X3l3qsyjxyPBjY
         QpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jgCGWOK0Qefy5Fhi4KKTahno9HKUpTYwmUl0eHwt2L4=;
        b=cHU5rU7sRg7Xo2t2AkfmxUVaVOdod9wZBHNReEQvvxx338m7LA1YiteAh8TOMuGerq
         pC/ojFOYrOy8qnRamkAmCufJ5YdY6GN8eEWE5F7/pABCsIPuspsilBU7dTzLTc4qouft
         /J+G28gyGbLb8k2KMm9RR5jU+buISKQE4iOiuYiRCv0WQI1nXABX5RVCxWw3DYB0vn6P
         T1NAjXG+IqEJ5adrJdloOz6uMTJK9FETUlXmMxnFpzG1zIknjxLhuL386UIsH7zSACsO
         v7sK95f9DDXGRU7ALhdgYxG0X5cT0IVkAS0gz3yisRnUngfz0XOZm9DNPDMYA5vSPOML
         xD9w==
X-Gm-Message-State: AOAM530evxABH5l6wg1a234IientB2OHiARty74cwAqB0B2cgTa8Zmmq
        ky73igxqAdYx7u4vdCEbq6MS6g==
X-Google-Smtp-Source: ABdhPJzoz6S0ZlL4vXr8oV8PcsKi+cx6YzmVIaJoGSB90g6XRePDfA1/s4dIcen7byBgEvfkByEpvg==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr6189916ljc.128.1600128269031;
        Mon, 14 Sep 2020 17:04:29 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 69sm4007618lfm.83.2020.09.14.17.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 17:04:28 -0700 (PDT)
Date:   Tue, 15 Sep 2020 02:04:28 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200915000428.GA1695481@oden.dyn.berto.se>
References: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-09-13 19:21:40 +0100, Lad Prabhakar wrote:
> The crop and compose settings for VIN in non mc mode werent updated
> in s_fmt call this resulted in captured images being clipped.
> 
> With the below sequence on the third capture where size is set to
> 640x480 resulted in clipped image of size 320x240.
> 
> high(640x480) -> low (320x240) -> high (640x480)
> 
> This patch makes sure the VIN crop and compose settings are updated.

With this change I get failures with v4l2-compliance I don't have 
before. I think we need to align this the other way around, copy the 
non-MC behavior to the MC S_FTM implementation.

# v4l2-compliance -d /dev/video28
v4l2-compliance SHA: c7f03287bbd64c168975e7ff3192e6fd3b507686, 32 bits, 32-bit time_t

Compliance test for rcar_vin device /dev/video28:

Driver Info:
	Driver name      : rcar_vin
	Card type        : R_Car_VIN
	Bus info         : platform:e6ef1000.video
	Driver version   : 5.9.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video28 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 1

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		fail: v4l2-test-formats.cpp(1544): !rect_is_inside(&sel_crop.r, &sel_bounds.r)
		fail: v4l2-test-formats.cpp(1649): testBasicCrop(node, V4L2_BUF_TYPE_VIDEO_CAPTURE)
	test Cropping: FAIL
	test Composing: OK
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for rcar_vin device /dev/video28: 45, Succeeded: 44, Failed: 1, Warnings: 0

Without this patch all test pass.

> 
> Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes for v2:
> * Dropped redundant code mapping crop and compose rects
> 
> v1 - https://lkml.org/lkml/2020/7/31/364
> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 0e066bba747e..1bd59a8453b4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -305,7 +305,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  			      struct v4l2_format *f)
>  {
>  	struct rvin_dev *vin = video_drvdata(file);
> -	struct v4l2_rect fmt_rect, src_rect;
> +	struct v4l2_rect src_rect;
>  	int ret;
>  
>  	if (vb2_is_busy(&vin->queue))
> @@ -317,14 +317,11 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>  		return ret;
>  
>  	vin->format = f->fmt.pix;
> -
> -	fmt_rect.top = 0;
> -	fmt_rect.left = 0;
> -	fmt_rect.width = vin->format.width;
> -	fmt_rect.height = vin->format.height;
> -
> -	v4l2_rect_map_inside(&vin->crop, &src_rect);
> -	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
> +	vin->crop.top = 0;
> +	vin->crop.left = 0;
> +	vin->crop.width = vin->format.width;
> +	vin->crop.height = vin->format.height;
> +	vin->compose = vin->crop;
>  	vin->src_rect = src_rect;
>  
>  	return 0;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
