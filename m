Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D63FEB52
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 10:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfKPJTR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Nov 2019 04:19:17 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:36405 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727414AbfKPJTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Nov 2019 04:19:17 -0500
Received: from [IPv6:2001:983:e9a7:1:a4e1:babe:5472:a07]
 ([IPv6:2001:983:e9a7:1:a4e1:babe:5472:a07])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VuEaiUwJIecrtVuEbis9mR; Sat, 16 Nov 2019 10:19:14 +0100
Subject: Re: [PATCH v2 1/6] v4l2-dev/ioctl: Add default handlers for
 VIDIOC_{G,S}_{INPUT,OUTPUT}
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
 <20191115235559.806041-2-niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <735b12c7-845e-a285-074c-6db68c9aa7cd@xs4all.nl>
Date:   Sat, 16 Nov 2019 10:19:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115235559.806041-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOGzY6sqiybac39quPfiDDd67pwbUrVD8wFRXOD70/S9yomL9b+lr2BWghGc+C24ltWNiZ0ehqjS/QBOjTfmSB7hwXkQa1Jcb+PYdgjNGUwU5i7h83Lg
 Os2foxu/nbIXN8s7Mb8wwnDk0HnI7IY4f0IWHoFW1DWE1n8AaQOOWvEZVtpB1kjy4cs7FUWGe/6APeHRPEWrKL+ND5k0rDJ3hiecveplIY8NQ5hvxLR/Z39x
 8+ZZv7BfyCTuSKq39v68MY1GAVK2D+r3N8PP0v64WxENrme+xvRGQEGz3twU6AZm34iALkVulC8DxXOUqayHMe3iErjReHBH13NFeGcF/GcEPQL4fCHR92kt
 aCNu+tvQhMxX8SfKVsHNIApLNLS1mQAGmOQAueyr/y0H5GeDHqfx99MX3vKqKJ8c3VSdZ3nlMtbjYIss1hdVjapKUZyWnjn3NlJv8nv3Zus13Uo3oAnL7++b
 chX7J6i1PgI70YZx9oOU48czpAuK53yV+MV9Og==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/16/19 12:55 AM, Niklas Söderlund wrote:
> It is very common to have just one input/output, and many drivers
> implements the same trivial handlers. Add default handlers for
> VIDIOC_{G,S}_{INPUT,OUTPUT} that assumes a single input/output.
> 
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c   |  8 ++---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 44 +++++++++++++++++++++++++---
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index da42d172714adcb5..4293df8d664f70b3 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -726,8 +726,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		if (is_rx) {
>  			SET_VALID_IOCTL(ops, VIDIOC_QUERYSTD, vidioc_querystd);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> +			set_bit(_IOC_NR(VIDIOC_G_INPUT), valid_ioctls);
> +			set_bit(_IOC_NR(VIDIOC_S_INPUT), valid_ioctls);

This isn't right. VIDIOC_G/S_INPUT now depends on the presence of vidioc_enum_input
only. So this becomes:

			SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_enum_input);
			SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_enum_input);

Same elsewhere. Note that there are two places where G/S_INPUT is set: it's also
valid for touch devices.

>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDIO, vidioc_enumaudio);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDIO, vidioc_g_audio);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDIO, vidioc_s_audio);
> @@ -736,8 +736,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		}
>  		if (is_tx) {
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMOUTPUT, vidioc_enum_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_G_OUTPUT, vidioc_g_output);
> -			SET_VALID_IOCTL(ops, VIDIOC_S_OUTPUT, vidioc_s_output);
> +			set_bit(_IOC_NR(VIDIOC_G_OUTPUT), valid_ioctls);
> +			set_bit(_IOC_NR(VIDIOC_S_OUTPUT), valid_ioctls);
>  			SET_VALID_IOCTL(ops, VIDIOC_ENUMAUDOUT, vidioc_enumaudout);
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 4e700583659bac8c..4a461de28677c5a8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1085,6 +1085,37 @@ static int v4l_querycap(const struct v4l2_ioctl_ops *ops,
>  	return ret;
>  }
>  
> +static int v4l2_ioctl_g_single_input(struct file *file, void *priv, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +#define v4l2_ioctl_g_single_output v4l2_ioctl_g_single_input
> +
> +static int v4l2_ioctl_s_single_input(struct file *file, void *priv, unsigned int i)
> +{
> +	return i ? -EINVAL : 0;
> +}
> +#define v4l2_ioctl_s_single_output v4l2_ioctl_s_single_input

There is no point to add these static functions and defines, just incorporate this
code directly in the following functions. These are just one or two liners, after all.
And then there is no need for the defines either (they are a bit ugly).

> +
> +static int v4l_g_input(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	if (!ops->vidioc_g_input)
> +		return v4l2_ioctl_g_single_input(file, fh, arg);
> +
> +	return ops->vidioc_g_input(file, fh, arg);
> +}
> +
> +static int v4l_g_output(const struct v4l2_ioctl_ops *ops,
> +		       struct file *file, void *fh, void *arg)
> +{
> +	if (!ops->vidioc_g_output)
> +		return v4l2_ioctl_g_single_output(file, fh, arg);
> +
> +	return ops->vidioc_g_output(file, fh, arg);
> +}
> +
>  static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -1094,12 +1125,19 @@ static int v4l_s_input(const struct v4l2_ioctl_ops *ops,
>  	ret = v4l_enable_media_source(vfd);
>  	if (ret)
>  		return ret;
> +
> +	if (!ops->vidioc_s_input)
> +		return v4l2_ioctl_s_single_input(file, fh, *(unsigned int *)arg);
> +
>  	return ops->vidioc_s_input(file, fh, *(unsigned int *)arg);
>  }
>  
>  static int v4l_s_output(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	if (!ops->vidioc_s_output)
> +		return v4l2_ioctl_s_single_output(file, fh, *(unsigned int *)arg);
> +
>  	return ops->vidioc_s_output(file, fh, *(unsigned int *)arg);
>  }
>  
> @@ -2678,10 +2716,8 @@ DEFINE_V4L_STUB_FUNC(expbuf)
>  DEFINE_V4L_STUB_FUNC(g_std)
>  DEFINE_V4L_STUB_FUNC(g_audio)
>  DEFINE_V4L_STUB_FUNC(s_audio)
> -DEFINE_V4L_STUB_FUNC(g_input)
>  DEFINE_V4L_STUB_FUNC(g_edid)
>  DEFINE_V4L_STUB_FUNC(s_edid)
> -DEFINE_V4L_STUB_FUNC(g_output)
>  DEFINE_V4L_STUB_FUNC(g_audout)
>  DEFINE_V4L_STUB_FUNC(s_audout)
>  DEFINE_V4L_STUB_FUNC(g_jpegcomp)
> @@ -2730,11 +2766,11 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_S_AUDIO, v4l_stub_s_audio, v4l_print_audio, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_QUERYCTRL, v4l_queryctrl, v4l_print_queryctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_queryctrl, id)),
>  	IOCTL_INFO(VIDIOC_QUERYMENU, v4l_querymenu, v4l_print_querymenu, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_querymenu, index)),
> -	IOCTL_INFO(VIDIOC_G_INPUT, v4l_stub_g_input, v4l_print_u32, 0),
> +	IOCTL_INFO(VIDIOC_G_INPUT, v4l_g_input, v4l_print_u32, 0),
>  	IOCTL_INFO(VIDIOC_S_INPUT, v4l_s_input, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_G_EDID, v4l_stub_g_edid, v4l_print_edid, INFO_FL_ALWAYS_COPY),
>  	IOCTL_INFO(VIDIOC_S_EDID, v4l_stub_s_edid, v4l_print_edid, INFO_FL_PRIO | INFO_FL_ALWAYS_COPY),
> -	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_stub_g_output, v4l_print_u32, 0),
> +	IOCTL_INFO(VIDIOC_G_OUTPUT, v4l_g_output, v4l_print_u32, 0),
>  	IOCTL_INFO(VIDIOC_S_OUTPUT, v4l_s_output, v4l_print_u32, INFO_FL_PRIO),
>  	IOCTL_INFO(VIDIOC_ENUMOUTPUT, v4l_enumoutput, v4l_print_enumoutput, INFO_FL_CLEAR(v4l2_output, index)),
>  	IOCTL_INFO(VIDIOC_G_AUDOUT, v4l_stub_g_audout, v4l_print_audioout, 0),
> 

Regards,

	Hans
