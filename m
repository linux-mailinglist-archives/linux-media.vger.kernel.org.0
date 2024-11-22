Return-Path: <linux-media+bounces-21831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D87129D5DDE
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1DF2836C9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6C41DE4EE;
	Fri, 22 Nov 2024 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MSZC2h6V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176FA1D7E4A;
	Fri, 22 Nov 2024 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274199; cv=none; b=AIH3nFp2yc5hMeo1PtFm2wtE4fG2Id4UCffcJedCpkiARnTLNPpu2ZHKhZo99ENiz7k0so/rIVVLqicyx729R7xWp66nwjF3K6M88JMroybZ2c8pcnhEn+M18vy5SfBWBq5amkOjQ3Cfak5gZ9H4oKg1Z9PHJEbaqaraAsvFmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274199; c=relaxed/simple;
	bh=2UYjvw0kbuWH2STaQqc+3/rJxEjJ0oADODBPB38m5Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+QBfQ/5S4nBZGecolshe4eFnZZKR4Qz3eq9KU0khrBZiCK0HApRwKnT77HrGAOkziq8wZsK5v0vP5c2WiwZLtUZvbYaoZ2o2iOrCzRij3OTnGbW/ZxSwDzlR/rUkGA6cdCE00FL6eBVW0szQYqc5kYLiUfUFamj8i4qcK4uiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MSZC2h6V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 898F8514;
	Fri, 22 Nov 2024 12:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732274175;
	bh=2UYjvw0kbuWH2STaQqc+3/rJxEjJ0oADODBPB38m5Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSZC2h6VaO50/ceI9fbm/2ILQ7Mi8txsCYjesn2nubaSA5k4Gd/1/y7rZWk1S8/yM
	 wkT/JOMVis6f5+/8mIcE1aWVG04ubol/qp+ijkIzTAq6AgHn+aT0/QxsFtvLqW4vwc
	 AHAl6GKQX6YuUd4ajDLpQAgO6rdno4hnjE4/FU70=
Date: Fri, 22 Nov 2024 12:16:32 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jacopo.mondi@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v1 5/5] drivers: media: bcm2835-unicam: Correctly handle
 FS + FE ISR condition
Message-ID: <xy44zndazbw7ehpzbc6hexgptjymevvupjhuy2x6zxp54qtepm@vlbb6js62cq4>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
 <20241122084152.1841419-6-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122084152.1841419-6-naush@raspberrypi.com>

Hi Naush

On Fri, Nov 22, 2024 at 08:41:52AM +0000, Naushir Patuck wrote:
> This change aligns the FS/FE interrupt handling with the Raspberry Pi
> kernel downstream Unicam driver.
>
> If we get a simultaneous FS + FE interrupt for the same frame, it cannot
> be marked as completed and returned to userland as the framebuffer will
> be refilled by Unicam on the next sensor frame. Additionally, the
> timestamp will be set to 0 as the FS interrupt handling code will not
> have run yet.
>
> To avoid these problems, the frame is considered dropped in the FE
> handler, and will be returned to userland on the subsequent sensor frame.
>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> ---
>  .../media/platform/broadcom/bcm2835-unicam.c  | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index f10064107d54..0d2aa25d483f 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -773,10 +773,26 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  			 * as complete, as the HW will reuse that buffer.
>  			 */
>  			if (node->cur_frm && node->cur_frm != node->next_frm) {
> +				/*
> +				 * This condition checks if FE + FS for the same
> +				 * frame has occurred. In such cases, we cannot
> +				 * return out the frame, as no buffer handling
> +				 * or timestamping has yet been done as part of
> +				 * the FS handler.
> +				 */
> +				if (!node->cur_frm->vb.vb2_buf.timestamp) {
> +					dev_dbg(unicam->v4l2_dev.dev,
> +						"ISR: FE without FS, dropping frame\n");
> +					continue;
> +				}
> +
>  				unicam_process_buffer_complete(node, sequence);
> +				node->cur_frm = node->next_frm;
> +				node->next_frm = NULL;
>  				inc_seq = true;
> +			} else {
> +				node->cur_frm = node->next_frm;
>  			}
> -			node->cur_frm = node->next_frm;
>  		}
>
>  		/*
> @@ -812,10 +828,25 @@ static irqreturn_t unicam_isr(int irq, void *dev)
>  					i);
>  			/*
>  			 * Set the next frame output to go to a dummy frame
> -			 * if we have not managed to obtain another frame
> -			 * from the queue.
> +			 * if no buffer currently queued.
>  			 */
> -			unicam_schedule_dummy_buffer(node);
> +			if (!node->next_frm ||
> +			    node->next_frm == node->cur_frm) {
> +				unicam_schedule_dummy_buffer(node);
> +			} else if (unicam->node[i].cur_frm) {
> +				/*
> +				 * Repeated FS without FE. Hardware will have
> +				 * swapped buffers, but the cur_frm doesn't
> +				 * contain valid data. Return cur_frm to the
> +				 * queue.

So the buffer gets silently recycled ? Or should it be returned with
errors to userspace ?

> +				 */
> +				spin_lock(&node->dma_queue_lock);
> +				list_add_tail(&node->cur_frm->list,
> +					      &node->dma_queue);
> +				spin_unlock(&node->dma_queue_lock);
> +				node->cur_frm = node->next_frm;
> +				node->next_frm = NULL;
> +			}
>  		}
>
>  		unicam_queue_event_sof(unicam);
> --
> 2.34.1
>
>

