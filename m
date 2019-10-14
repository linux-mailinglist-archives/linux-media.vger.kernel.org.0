Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D189ED6B51
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 23:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbfJNVjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 17:39:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48624 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfJNVjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 17:39:46 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13322324;
        Mon, 14 Oct 2019 23:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571089184;
        bh=GfWOqWzT968CrSlQyjkKS4jNJ58YqtkCmMrKUPM7SKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s1cBH48R1HSTZ45BQwkfwNaNvgK03NhPVahawhndGL6cDAXREH3Fmb+3l5ZIB4CqN
         e4VF8PfMa7xYBnHUJM4oYnp/xoGWIq2Y1liKSjtODNmBG0mSL3+fal/2fndRYPM4LH
         U9F8Fc0WhvI/mAa7/81omiuWK8uwu773lspx5aNw=
Date:   Tue, 15 Oct 2019 00:39:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv6 2/3] v4l2-dev: simplify the SDR checks
Message-ID: <20191014213941.GF23442@pendragon.ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014084021.54191-3-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Oct 14, 2019 at 10:40:20AM +0200, Hans Verkuil wrote:
> In determine_valid_ioctls() we can use SET_VALID_IOCTL to enable
> ioctls for SDR, simplifying the code.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 1bf543932e4f..27fb96a6c2a8 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -677,24 +677,16 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
>  	} else if (is_sdr && is_rx) {
>  		/* SDR receiver specific ioctls */
> -		if (ops->vidioc_enum_fmt_sdr_cap)
> -			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
> -		if (ops->vidioc_g_fmt_sdr_cap)
> -			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
> -		if (ops->vidioc_s_fmt_sdr_cap)
> -			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
> -		if (ops->vidioc_try_fmt_sdr_cap)
> -			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_cap);
>  	} else if (is_sdr && is_tx) {
>  		/* SDR transmitter specific ioctls */
> -		if (ops->vidioc_enum_fmt_sdr_out)
> -			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
> -		if (ops->vidioc_g_fmt_sdr_out)
> -			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
> -		if (ops->vidioc_s_fmt_sdr_out)
> -			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
> -		if (ops->vidioc_try_fmt_sdr_out)
> -			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
>  	}
>  
>  	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {

-- 
Regards,

Laurent Pinchart
