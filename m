Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36391A9B4A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896459AbgDOKSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:18:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55244 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2896413AbgDOKR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:17:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id D6FEC2A0C93
Subject: Re: [PATCH v7 6/6] vimc: Make use of V4L2_CAP_IO_MC
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
 <20200413202351.1359754-7-niklas.soderlund+renesas@ragnatech.se>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a1a0bea6-d19f-4948-df0e-4477684f1082@collabora.com>
Date:   Wed, 15 Apr 2020 12:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413202351.1359754-7-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 13.04.20 22:23, Niklas Söderlund wrote:
> Set the V4L2_CAP_IO_MC capability flag to report this vimc
> inputs/outputs are controlled by the media graph.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Changes since v5:
> 
> - Wrap line longer than 80 characters
> - Implement mbus_code filtering for format enumeration
> ---
>   drivers/media/platform/vimc/vimc-capture.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index 747ea9cc1bd7cb12..dbc827fd1b9baebb 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -149,7 +149,12 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
>   static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
>   				     struct v4l2_fmtdesc *f)
>   {
> -	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
> +	const struct vimc_pix_map *vpix;
> +
> +	if (f->mbus_code)
> +		vpix = vimc_pix_map_by_code(f->mbus_code);
Hi, if I understand correctly, the f->index should still tell us we should return the i'th format
for the given mbus_code, right? if yes then since vimc support only one pixelformat for each mbus code
there should be a code added here:
if (f->index > 0)
	return -EINVAL;

Thanks,
Dafna

> +	else
> +		vpix = vimc_pix_map_by_index(f->index);
>   
>   	if (!vpix)
>   		return -EINVAL;
> @@ -450,7 +455,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
>   
>   	/* Initialize the video_device struct */
>   	vdev = &vcap->vdev;
> -	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
> +			  | V4L2_CAP_IO_MC;
>   	vdev->entity.ops = &vimc_cap_mops;
>   	vdev->release = video_device_release_empty;
>   	vdev->fops = &vimc_cap_fops;
> 
