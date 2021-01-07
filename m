Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC5D2ECF46
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 12:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728153AbhAGL4T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 06:56:19 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38317 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728034AbhAGL4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 06:56:18 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xTt7kmWDtbMeAxTtAkTWgF; Thu, 07 Jan 2021 12:55:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610020536; bh=evM0mIHPeuqvuoZ+cVdXex8tjstjzODH1ubed7rKKII=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JbGi1KI3pM7BbTA1qYS2R4Sd0iEoC2RDwJpHxoC9V6UgarXnwkB6/RS9R5qRVZ1d2
         SuICP4yfDipbkirlgyZFz9hXRJ3WqX6x9L086kcWTwoIiPOSnS/QthvSV6Sqg+/nEZ
         tqY78qMiS0xG2AE9pbAx0uzAbF36er5OgIscnMQanPUgeIBD3pHk0oyICvgC5DNjmQ
         A49tcyXmf2zmK8cULSHeJpgEWOR5ZLipAdPTTG4Kk74C6M9hrGwPJipEPWEQ6IK/wP
         3Cl7xJNgfTQEDuhuEW40Fg4ylb1e5k2WVEVTUsdDXA7/HYnEBSV6P+3PrOB754Sbn3
         CLDyTZq6XYkgQ==
Subject: Re: [PATCH 04/18] media: allegro: implement S_FMT for CAPTURE
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, mchehab@kernel.org
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
 <20201203110106.2939463-5-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d05eaf25-d935-d9a8-bb6e-8b2a0656fb9c@xs4all.nl>
Date:   Thu, 7 Jan 2021 12:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201203110106.2939463-5-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIabIc6jzFCPFyzEArdYzCDsmCWdioVGJUi/3QDzz1U1QgiT0bSI1YEE24Mw9qOGdE4O/PU3dXf+bq71+opuxZDbDHqlB3arTviltDjJmMh5XzUmTpP7
 fcR6FNC42PnE9wbLV8EV7MZ2LhXAtecLTaOC7dCgc4YsRifbcwUqEp/cacopd3F1Su4MvnJ7LogyxJc9X5LHDwLD3WyIlYP9zUdYCoj32OsMSbLprauE09bl
 ScwZ+3n67mSgbemS5E8gXeo6A6+1PE1Cds0HyMLKWeU68MZft5Solllm9CHDdzAK+bmdCpHBgG9s51k3YDkHHA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2020 12:00, Michael Tretter wrote:
> In order to support different codecs, the driver must support changing
> the format on CAPTURE. Therefore, the driver needs to handle S_FMT on
> CAPTURE.
> 
> As the driver will have a different number of formats for OUTPUT and
> CAPTURE, split the check for the format index in ENUM_FMT into CAPTURE
> and OUTPUT.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  .../media/platform/allegro-dvt/allegro-core.c | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 6b5cbee05040..a733049c8727 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -2503,13 +2503,15 @@ static int allegro_querycap(struct file *file, void *fh,
>  static int allegro_enum_fmt_vid(struct file *file, void *fh,
>  				struct v4l2_fmtdesc *f)
>  {
> -	if (f->index)
> -		return -EINVAL;
>  	switch (f->type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +		if (f->index >= 1)
> +			return -EINVAL;
>  		f->pixelformat = V4L2_PIX_FMT_NV12;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +		if (f->index >= 1)
> +			return -EINVAL;
>  		f->pixelformat = V4L2_PIX_FMT_H264;
>  		break;
>  	default:
> @@ -2557,6 +2559,21 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
> +				 struct v4l2_format *f)
> +{
> +	struct allegro_channel *channel = fh_to_channel(fh);
> +	int err;
> +
> +	err = allegro_try_fmt_vid_cap(file, fh, f);
> +	if (err)
> +		return err;

This needs an additional check:

	struct v4l2_m2m_ctx *m2m_ctx = channel->fh.m2m_ctx;
	struct vb2_queue vq = v4l2_m2m_get_vq(m2m_ctx, f->type);
	if (vb2_is_busy(vq))
		return -EBUSY;

This wasn't necessary before since there was only one possible pixelformat,
but now there are two (H264 and HEVC), so you need to prevent switching
codec while the queue is busy.

Regards,

	Hans

> +
> +	channel->codec = f->fmt.pix.pixelformat;
> +
> +	return 0;
> +}
> +
>  static int allegro_g_fmt_vid_out(struct file *file, void *fh,
>  				 struct v4l2_format *f)
>  {
> @@ -2769,7 +2786,7 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
>  	.vidioc_enum_fmt_vid_out = allegro_enum_fmt_vid,
>  	.vidioc_g_fmt_vid_cap = allegro_g_fmt_vid_cap,
>  	.vidioc_try_fmt_vid_cap = allegro_try_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_cap = allegro_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap = allegro_s_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_out = allegro_g_fmt_vid_out,
>  	.vidioc_try_fmt_vid_out = allegro_try_fmt_vid_out,
>  	.vidioc_s_fmt_vid_out = allegro_s_fmt_vid_out,
> 

