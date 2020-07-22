Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6188E229909
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgGVNMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGVNMp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:12:45 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A2CC0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:12:45 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so1873128wrh.3
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=njWt3nzF/X/O0oEpICYtw6krZLqf7kzIeyw98YxsCKE=;
        b=k0zaTzRtomA8ai2owOfeRL6VAr25e2HkEqv++b9P3e29p+U1kOvduDnVBwhgNQSkQQ
         FHGZbn4keS5+XxbzZ+tZLuBFiGqCpsyk+7u6vd3dyHDAAmxwIHdxzcgVCo2O5fz2wR3l
         9JXXwKXNmCpgX/SWIc2uRkUIfkKSZeoTp3ZE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=njWt3nzF/X/O0oEpICYtw6krZLqf7kzIeyw98YxsCKE=;
        b=KCn81a2idQLnTQKHM6L/Dgir4vEMVyXGnZd8f5oHEl6La0JFfs0SjFel9aqLt/zZcp
         3dy8E937+qGKDLzRZ3fD69bb+D7GyT4xheOhVbH/DPUVD+ExCZ5LuuLf2kM89OKa4ZHK
         OUpK9JNmRtZ6SBFskmXkfajGq6k/OGF1gNh46awne01xeYTcyPB+U+UDYKi+LQUVZoF6
         r4atXWSF3MduGcWofwK11gL2CqKJebY/ZYCb3OY/UtjO2+qaOrBC6ZucPSNZPGABrkzV
         +Bu6YZsL38ksGvNYvikNoijbM3qBgsjvKTs2SX8F73ns27HBEOWb8jlDsJvdOwH+PmFD
         SnPQ==
X-Gm-Message-State: AOAM533eKAT1/1+JqFYFL5Escc+u/kHoLcBsAzLpS4eUu8dTvjgxIU7M
        d1lUCm3dNkM2beuAQKFvcsmhMA==
X-Google-Smtp-Source: ABdhPJyByzL8HHqarKbc0nsT1ASRLA6ahMrL2DwaTczMl2q7wV/xBKrY6FXsEnfcfOwyaTAR877tZA==
X-Received: by 2002:a5d:62cd:: with SMTP id o13mr30528797wrv.272.1595423563861;
        Wed, 22 Jul 2020 06:12:43 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j145sm7955091wmj.7.2020.07.22.06.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 06:12:43 -0700 (PDT)
Date:   Wed, 22 Jul 2020 13:12:42 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH v5 6/7] media: staging: rkisp1: allow quantization
 setting by userspace on the isp source pad
Message-ID: <20200722131242.GB1828171@chromium.org>
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
 <20200703171019.19270-7-dafna.hirschfeld@collabora.com>
 <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4d0a929-8e54-a72f-0940-1657987c8522@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 03, 2020 at 05:00:40PM -0300, Helen Koike wrote:
> Hi Dafna,
> 
> Thanks for your patch.
> 
> On 7/3/20 2:10 PM, Dafna Hirschfeld wrote:
> > The isp entity has a hardware support to force full range quantization
> > for YUV formats. Use the subdev CSC API to allow userspace to set the
> > quantization for YUV formats on the isp entity.
> > 
> > - The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
> > YUV formats during enumeration of the isp formats on the source pad.
> > - The full quantization is set on YUV formats if userspace ask it
> > on the isp entity using the flag V4L2_MBUS_FRAMEFMT_SET_CSC.
> > 
> > On the capture and the resizer, the quantization is read-only
> > and always set to the default quantization.
> > 
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/staging/media/rkisp1/TODO             |  2 +-
> >  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ----------
> >  drivers/staging/media/rkisp1/rkisp1-isp.c     | 18 ++++++++++++++----
> >  3 files changed, 15 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
> > index c0cbec0a164d..db05288949bd 100644
> > --- a/drivers/staging/media/rkisp1/TODO
> > +++ b/drivers/staging/media/rkisp1/TODO
> > @@ -2,7 +2,7 @@
> >  * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
> >  * Fix checkpatch errors.
> >  * Review and comment every lock
> > -* Handle quantization
> > +* Add uapi docs. Remeber to add documentation of how quantization is handled.
> >  * Document rkisp1-common.h
> >  * streaming paths (mainpath and selfpath) check if the other path is streaming
> >  in several places of the code, review this, specially that it doesn't seem it
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index f69235f82c45..93d6846886f2 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >  			   const struct v4l2_format_info **fmt_info)
> >  {
> >  	const struct rkisp1_capture_config *config = cap->config;
> > -	struct rkisp1_capture *other_cap =
> > -			&cap->rkisp1->capture_devs[cap->id ^ 1];
> >  	const struct rkisp1_capture_fmt_cfg *fmt;
> >  	const struct v4l2_format_info *info;
> >  	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> > @@ -1111,14 +1109,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >  
> >  	info = rkisp1_fill_pixfmt(pixm, cap->id);
> >  
> > -	/* can not change quantization when stream-on */
> > -	if (other_cap->is_streaming)
> > -		pixm->quantization = other_cap->pix.fmt.quantization;
> > -	/* output full range by default, take effect in params */
> > -	else if (!pixm->quantization ||
> > -		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
> > -		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > -
> >  	if (fmt_cfg)
> >  		*fmt_cfg = fmt;
> >  	if (fmt_info)
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> > index 58c90c67594d..d575c1e4dc4b 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> > @@ -589,6 +589,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
> >  
> >  		if (code->index == pos - 1) {
> >  			code->code = fmt->mbus_code;
> > +			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> > +			    dir == RKISP1_ISP_SD_SRC)
> > +				code->flags =
> > +					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
> >  			return 0;
> >  		}
> >  	}
> > @@ -620,7 +624,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
> >  					     RKISP1_ISP_PAD_SOURCE_VIDEO);
> >  	*src_fmt = *sink_fmt;
> >  	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> > -	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >  
> >  	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
> >  					    RKISP1_ISP_PAD_SOURCE_VIDEO);
> > @@ -663,10 +666,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> >  		isp->src_fmt = mbus_info;
> >  	src_fmt->width  = src_crop->width;
> >  	src_fmt->height = src_crop->height;
> > -	src_fmt->quantization = format->quantization;
> > -	/* full range by default */
> > -	if (!src_fmt->quantization)
> > +
> > +	/*
> > +	 * The CSC API is used to allow userspace to force full
> > +	 * quantization on YUV formats.
> > +	 */
> > +	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
> > +	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
> > +	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
> >  		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > +	else
> > +		src_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
> 
> According to the docs [1]:
> 
> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html?highlight=quantization
> 
> "The default colorspace. This can be used by applications to let the driver fill in the colorspace."
> 
> So, in my understanding, the driver should never return V4L2_QUANTIZATION_DEFAULT to userspace.
> 

The part of the documentation you quoted comes from the description of
V4L2_COLORSPACE_DEFAULT and not V4L2_QUANTIZATION_DEFAULT.

For the latter it says:

"Use the default quantization encoding as defined by the colorspace.
 This is always full range for R’G’B’ (except for the BT.2020 colorspace)
 and HSV. It is usually limited range for Y’CbCr."

Which, in my understanding, doesn't suggest in any way that it shouldn't
be returned by the driver. There is also a valid case when the driver
simply doesn't know or care what quantization the captured signal uses.

However, in this case, I don't see why we would return DEFAULT here
indeed, as the driver has the full knowledge, RGB is full range and YUV
is limited range unless full range was requested.

> We have the same issue in the resizer.
> 
> I also see an issue in the capture that allows userspace to change quantization, and this should be fixed.
> 
> In my understanding, since you are leaving all the other pads and video nodes with read-only quantization,
> changing quantization in the ISP source pad should change the readings in all the other pads and video nodes.
> So, if all pads are reporting V4L2_QUANTIZATION_LIM_RANGE (which is the default for sRGB colorspace), and userspace sets
> V4L2_QUANTIZATION_FULL_RANGE to the isp source pad, then all the other pads and video nodes should also report
> V4L2_QUANTIZATION_FULL_RANGE, since this will be the actual quantization used by the driver.

This was extensively discussed at v3:
https://patchwork.kernel.org/patch/11493105/

The conclusion is that there is no value from both the kernel and the userspace point of
view in propagating this to the end of the pipeline, because the
hardware components later in the pipeline don't care and the userspace,
given the DEFAULT quantization value, can infer the exact quantziation from the
pipeline - here from what it configured at the ISP entity.

Best regards,
Tomasz
