Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1400CD6B53
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 23:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730004AbfJNVm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 17:42:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48646 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbfJNVm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 17:42:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71AAA324;
        Mon, 14 Oct 2019 23:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571089344;
        bh=DBcRz/IeL1ARsr0F9eQCTbsqs2hqTCRpj1gBAvUKHlg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KRDiCg8hE1f+jRXwUpHlm14e1ZOia6F1D7SuJExthL5iLmZLSC/8Cz7SK7pxVNlSb
         uw6TSSn92qkhvZLakSuUuQzOHSTj6OG8drP984mGHP9zDXeyH3nSPKeOAI7Fb1g+DN
         NVp4BOMV+r6OJH/bPeUF3FV8JQs/AZiSs/WzElAg=
Date:   Tue, 15 Oct 2019 00:42:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv6 3/3] v4l2-dev: fix is_tch checks
Message-ID: <20191014214221.GG23442@pendragon.ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Oct 14, 2019 at 10:40:21AM +0200, Hans Verkuil wrote:
> Touch devices mark too many ioctls as valid. Restrict the list of
> valid ioctls for touch devices.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 27fb96a6c2a8..cec588b04711 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -596,8 +596,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	if (ops->vidioc_enum_freq_bands || ops->vidioc_g_tuner || ops->vidioc_g_modulator)
>  		set_bit(_IOC_NR(VIDIOC_ENUM_FREQ_BANDS), valid_ioctls);
>  
> -	if (is_vid || is_tch) {
> -		/* video and touch specific ioctls */
> +	if (is_vid) {
> +		/* video specific ioctls */
>  		if ((is_rx && (ops->vidioc_enum_fmt_vid_cap ||
>  			       ops->vidioc_enum_fmt_vid_overlay)) ||
>  		    (is_tx && ops->vidioc_enum_fmt_vid_out))
> @@ -675,6 +675,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			       ops->vidioc_try_fmt_sliced_vbi_out)))
>  			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
>  		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
> +	} else if (is_tch) {
> +		/* touch specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_vid_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMESIZES, vidioc_enum_framesizes);
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FRAMEINTERVALS, vidioc_enum_frameintervals);
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUMINPUT, vidioc_enum_input);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_INPUT, vidioc_g_input);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_INPUT, vidioc_s_input);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_PARM, vidioc_g_parm);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
>  	} else if (is_sdr && is_rx) {
>  		/* SDR receiver specific ioctls */
>  		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
> @@ -702,8 +715,8 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>  	}
>  
> -	if (is_vid || is_vbi || is_tch || is_meta) {
> -		/* ioctls valid for video, vbi, touch and metadata */
> +	if (is_vid || is_vbi || is_meta) {
> +		/* ioctls valid for video, vbi and metadata */
>  		if (ops->vidioc_s_std)
>  			set_bit(_IOC_NR(VIDIOC_ENUMSTD), valid_ioctls);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_STD, vidioc_s_std);
> @@ -727,8 +740,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  			SET_VALID_IOCTL(ops, VIDIOC_G_AUDOUT, vidioc_g_audout);
>  			SET_VALID_IOCTL(ops, VIDIOC_S_AUDOUT, vidioc_s_audout);
>  		}
> -		if (ops->vidioc_g_parm || (vdev->vfl_type == VFL_TYPE_GRABBER &&
> -					ops->vidioc_g_std))
> +		if (ops->vidioc_g_parm || ops->vidioc_g_std)
>  			set_bit(_IOC_NR(VIDIOC_G_PARM), valid_ioctls);

This will become potentially valid for VBI devices, is it intended ?

>  		SET_VALID_IOCTL(ops, VIDIOC_S_PARM, vidioc_s_parm);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_DV_TIMINGS, vidioc_s_dv_timings);

-- 
Regards,

Laurent Pinchart
