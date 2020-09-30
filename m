Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AEA27F229
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 21:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgI3TA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 15:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728270AbgI3TA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 15:00:28 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F734C061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 12:00:28 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b22so3427935lfs.13
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tpch0HuGxQ4hJf3MyUCHFMD3IGaCixlPFv0CwfDrP3Q=;
        b=km975ICQULHNI4i7XkhW2/hnw95IjC7FBNJi8seg+amNEm9vWwHVFZ+bQm6lBA9gkc
         lwQjjvdxVKEf5i9HCHW28Wxe3tGXFp760hUKLhankvDW0+dAfVHlVZBvVna5i9XhZVWh
         /nZW+ybvqauBv6Pzq02NYkar7zwmOXVw1JEUuKbHjSAAVkSc6whBmG7DVVblcvjEdTh9
         +7cj5otkBBpVik2227csiNW6upKJ48i3VXgSPNIvoVXKsvJPJ92Q/QJcSQY7QuGUuj86
         H2QZVRzu9NQbvDebp5Y0T0il5yWOfm+6aYFpEQ5wR6KklVg33TgBc2qPNETw5mHgf514
         2tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tpch0HuGxQ4hJf3MyUCHFMD3IGaCixlPFv0CwfDrP3Q=;
        b=eaL61vpUHY0aqn3qVORq55fU/hqc1BJfUD5AoTs5tTHwuYv90WUIdTB6Ja1wi2M1a2
         9XM0he4fYV2SP+2QBTjtK0AAyHvgETdX4fsVJYNn+8ZfU3dq8a9d5Q223ogps6QRLPY5
         4TcbShqt6PK4ANwyhHzPa9wREPWsbLbHIsTTY/LoDe5v+XXEuXmmG7VBLKnXuCRzoeS8
         7eUXVPd/aljUP6PVuGsLtaBVPkr+3fr3kzBAqqFR1gG901c7wPaFH2vozQRbkBwxr/xB
         AVbWyawQsr6Oc/eAyD1XEnWn+tuTcsatmHFt/kg85yqPAWD97ttvf3pXz0DQTobQFmoK
         0yCw==
X-Gm-Message-State: AOAM533dy5BFBeHTN6bOQXpxs8c6mnsxKo8EeejR5aQ4syWplzk2/8Ys
        M7bUAhIbFJJCQwm/cLrwIavHXg==
X-Google-Smtp-Source: ABdhPJwp2mMQOdQUBP+f4gn4rO1RrCbu0j3qOHYld96vTvOsjlXuFUuzAwiIoSeokLeDLyYNAuioJA==
X-Received: by 2002:a19:6b17:: with SMTP id d23mr1470644lfa.190.1601492426616;
        Wed, 30 Sep 2020 12:00:26 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id 82sm283459lfo.173.2020.09.30.12.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 12:00:25 -0700 (PDT)
Date:   Wed, 30 Sep 2020 21:00:25 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v3 09/10] media: rkisp1: cap: simplify the link
 validation by compering the media bus code
Message-ID: <20200930190025.GH1516931@oden.dyn.berto.se>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

This commit is not just a simplification but a change of behavior.  The 
change is for the better but it broke capture of NV12 and NV21 formats 
in libcamera unexpectedly.

The issue at hand is that libcamera when configuring the pipeline 
retrieves the mbus code for the ISP (rkisp1_isp) source pad (2) and then 
propagates it to the resizer (rkisp_resizer_{main,self}path) sink pad 
(0) and then to the resizers source pad (1). Effectively propagating 
MEDIA_BUS_FMT_YUYV8_2X8 for all formats.

At this point if the video node (main or self) is configured with a 
YUV420 format (NV12, NV21, etc) and with this change applied the link 
validation will fail as MEDIA_BUS_FMT_YUYV8_1_5X8 !=  
MEDIA_BUS_FMT_YUYV8_2X8. Given the nature of how link validation is 
implemented it's VIDIOC_QBUF that returns a -EPIPE when it fails and 
libcamera lockup the capture session.

I will submit a fix for this to libcamera to bring it in sync with this 
change.

Would it be possible to ask that future changes to the rkisp1 driver be 
tested with libcamera so we can track and update both the kernel and 
user-space components of this driver at the same time and avoid nasty 
surprises? :-)

On 2020-07-23 15:20:13 +0200, Dafna Hirschfeld wrote:
> The capture has a mapping of the mbus code needed for each pixelformat.
> This can be used to simplify the link validation by comparing the mbus
> code in the capture with the code in the resizer.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 4dabd07a3da9..a5e2521577dd 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1255,22 +1255,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  	struct v4l2_subdev *sd =
>  		media_entity_to_v4l2_subdev(link->source->entity);
>  	struct rkisp1_capture *cap = video_get_drvdata(vdev);
> -	struct rkisp1_isp *isp = &cap->rkisp1->isp;
> -	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
> -	u8 cap_pix_enc = cap->pix.info->pixel_enc;
> +	const struct rkisp1_capture_fmt_cfg *fmt =
> +		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
>  	struct v4l2_subdev_format sd_fmt;
>  	int ret;
>  
> -	if (cap_pix_enc != isp_pix_enc &&
> -	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
> -	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
> -		dev_err(cap->rkisp1->dev,
> -			"format type mismatch in link '%s:%d->%s:%d'\n",
> -			link->source->entity->name, link->source->index,
> -			link->sink->entity->name, link->sink->index);
> -		return -EPIPE;
> -	}
> -
>  	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  	sd_fmt.pad = link->source->index;
>  	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
> @@ -1278,7 +1267,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
>  		return ret;
>  
>  	if (sd_fmt.format.height != cap->pix.fmt.height ||
> -	    sd_fmt.format.width != cap->pix.fmt.width)
> +	    sd_fmt.format.width != cap->pix.fmt.width ||
> +	    sd_fmt.format.code != fmt->mbus)
>  		return -EPIPE;
>  
>  	return 0;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
