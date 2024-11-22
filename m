Return-Path: <linux-media+bounces-21844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5C9D60B5
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 15:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C03FB255BE
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 14:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8E3763F8;
	Fri, 22 Nov 2024 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tn58/XiY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63C230995;
	Fri, 22 Nov 2024 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286761; cv=none; b=Dt8wB5QPvr67AkUkqDLU4yQgjNxTG11zvddI5M7los79EHCF0JM/OOo3Z7PsbaikudHzMNsubDIbNJ+2HGqKJtHHSGLG85ih1/EDe8KbyNDAMgOEPyDIu9RM4WEnjgApJEqWlEld/BYGIyiwjSrKNLG42jbV/kmFS8+HmDrHz/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286761; c=relaxed/simple;
	bh=7Ay/3r+wW0JDRN5wnHDl+VfBwqOAMEjjkxIuQW5QdEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/vfZu6UbmeX4iqGi8SVcCuxfzhws4pOVjFNvTUKpHfHqA4ykRgZS9LfH8tdE89Css74/hyBVWsqoxY1z6GuW+VB333nFaiKT566P59eI6O+2Hemf3fpfhYrQoXkmIBSVTT9tC3vKYcExVVmFrPsoOEqgsX9+WMZ/O9EV4orgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Tn58/XiY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 852DB514;
	Fri, 22 Nov 2024 15:45:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732286738;
	bh=7Ay/3r+wW0JDRN5wnHDl+VfBwqOAMEjjkxIuQW5QdEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tn58/XiYKHc2bN3o5vJLZbbYGiGYg6GTxEPKhNaf63ycPKV3N6CiVULhi5dvmQaKQ
	 lq6VAp0MKLn/yB0NelV2MaP6ZJ4GnLY4QvzJv0J10bFbDoM2TBLF5BGdj3F2ei3v1j
	 AGq47shVfRQS4ChCYQ9fPASgUE2Sh/sLZhJWBgBs=
Date: Fri, 22 Nov 2024 15:45:55 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 1/5] drivers: media: bcm2835-unicam: Improve frame
 sequence count handling
Message-ID: <gl7qb2rqmqzd6tw7pei3ldbu6m4l3qiwld3ddhvn4pemdpgfjz@bvaf5prvmz3c>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-2-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-2-naush@raspberrypi.com>

Hi Naush

On Fri, Nov 22, 2024 at 08:41:48AM +0000, Naushir Patuck wrote:
> Ensure that the frame sequence counter is incremented only if a previous
> frame start interrupt has occurred, or a frame start + frame end has
> occurred simultaneously.
>
> This corresponds the sequence number with the actual number of frames
> produced by the sensor, not the number of frame buffers dequeued back
> to userland.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>


Thanks, looks good to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 3aed0e493c81..36fb186a0421 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -199,6 +199,7 @@ struct unicam_device {
>  	/* subdevice async notifier */
>  	struct v4l2_async_notifier notifier;
>  	unsigned int sequence;
> +	bool frame_started;
>
>  	/* Sensor node */
>  	struct {
> @@ -742,6 +743,8 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  	 * buffer forever.
>  	 */
>  	if (fe) {
> +		bool inc_seq = unicam->frame_started;
> +
>  		/*
>  		 * Ensure we have swapped buffers already as we can't
>  		 * stop the peripheral. If no buffer is available, use a
> @@ -761,11 +764,24 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  			 * + FS + LS). In this case, we cannot signal the buffer
>  			 * as complete, as the HW will reuse that buffer.
>  			 */
> -			if (node->cur_frm && node->cur_frm != node->next_frm)
> +			if (node->cur_frm && node->cur_frm != node->next_frm) {
>  				unicam_process_buffer_complete(node, sequence);
> +				inc_seq = true;
> +			}
>  			node->cur_frm = node->next_frm;
>  		}
> -		unicam->sequence++;
> +
> +		/*
> +		 * Increment the sequence number conditionally on either a FS
> +		 * having already occurred, or in the FE + FS condition as
> +		 * caught in the FE handler above. This ensures the sequence
> +		 * number corresponds to the frames generated by the sensor, not
> +		 * the frames dequeued to userland.
> +		 */
> +		if (inc_seq) {
> +			unicam->sequence++;
> +			unicam->frame_started = false;
> +		}
>  	}
>
>  	if (ista & UNICAM_FSI) {
> @@ -795,6 +811,7 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  		}
>
>  		unicam_queue_event_sof(unicam);
> +		unicam->frame_started = true;
>  	}
>
>  	/*
> @@ -1413,6 +1430,7 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
>  		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
>  			unicam_start_metadata(unicam);
>
> +		unicam->frame_started = false;
>  		unicam_start_rx(unicam, state);
>  	}
>
> --
> 2.34.1
>
>

