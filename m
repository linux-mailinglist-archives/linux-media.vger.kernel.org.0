Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E147D6B56
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 23:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730225AbfJNVnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 17:43:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48680 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729054AbfJNVnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 17:43:35 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 357B6324;
        Mon, 14 Oct 2019 23:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571089414;
        bh=6YwfXWo7ZTyiql55Rb+HkoNzwG0zNCq+Pmf2fE1o9LI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UcFU0HnHt443VN6wYQwKgrc5moIjYsRsYiZuSJ0j4GgBxIfvKbvGPl1QH8EGZK0Q+
         aILM8BN9uuTCZUriSzBE2nByUZllAZlXZ0BqJt2KCZ0iu1CrwgrOAg27Q6MeByS+hF
         qSOdFaG+2oMby3AMrY1uTMiP+4/1MIaOPCZYBApE=
Date:   Tue, 15 Oct 2019 00:43:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCHv6 4/3] v4l2-dev: disable frequency and tuner ioctls for
 touch
Message-ID: <20191014214331.GH23442@pendragon.ideasonboard.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
 <44ce4b09-9452-37d5-f7c4-26a26b4adfd7@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44ce4b09-9452-37d5-f7c4-26a26b4adfd7@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Mon, Oct 14, 2019 at 02:01:05PM +0200, Hans Verkuil wrote:
> Touch devices have obviously no tuner, so don't attempt to enable those ioctls
> for such devices.

Shouldn't this be disabled for pure metadata devices (is_meta &&
!is_vid) too ?

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index cec588b04711..da42d172714a 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -581,8 +581,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
>  	if (vdev->ctrl_handler || ops->vidioc_querymenu)
>  		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
> -	SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
> -	SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
> +	if (!is_tch) {
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
> +	}
>  	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>  	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
> @@ -754,7 +756,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
>  	}
> -	if (is_rx) {
> +	if (is_rx && !is_tch) {
>  		/* receiver only ioctls */
>  		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
>  		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
> 

-- 
Regards,

Laurent Pinchart
