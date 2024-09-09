Return-Path: <linux-media+bounces-18010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9694B971D3A
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5846E1F21100
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739981BBBFA;
	Mon,  9 Sep 2024 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qEVjieBn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA41AE039
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893700; cv=none; b=UOI7p7Qcg6mcjpYbQmFS3qhG2lvpqwioW/lsmiKoinmpnM4x1Uqe7QztRM4nOlyFUDHmElJbWX1+Ki08ll3t5SdM2HpoO1VVm2hCWc5Mv1SDUAZJkIU9OIhuW+m6rzYht/TzZH0RjnNBIsByg66tcdGb+XPiO7n6I0TVyw3GPsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893700; c=relaxed/simple;
	bh=HdKq02QukmNmdW54NIrJuslg3HS7Ba3263hVxa1XRRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRrHlEPqJjNPNXbtO8JGqfQ3Qv9nlEtijcdpB3KtJ1NiQoNt9vfTeMr//aaM/vV0+mVuiy4VvLVvafUD/TLEFXdgJrMpbRK0N3/o6mOLQprhsIWJ/254oNAm4aJZ4H8AREWB3WpQl/Jokz0jVV9vcoPwg/hSAc6xSkqh26/NW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qEVjieBn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF4625A4;
	Mon,  9 Sep 2024 16:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893622;
	bh=HdKq02QukmNmdW54NIrJuslg3HS7Ba3263hVxa1XRRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qEVjieBnpqnuetFeiz8uVKAJExT7Q3Bq5/nm3mH7JF+Lj8BW4JeZcNasOUy2FbGtB
	 a3m4VHQnXqvtNHVzHEF5WGYGypRU+d6XsK8NPcY7KWZu3BMb19YjHMUEHZgiR153nn
	 FjfMf968jxERqW9eS8aETtdJUXPFb2f7oeF3zAIU=
Date: Mon, 9 Sep 2024 17:54:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 4/9] media: hackrf: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145454.GF27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <82f2c2cc2bfb9f30a65869202785c01aec3f591f.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82f2c2cc2bfb9f30a65869202785c01aec3f591f.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:50PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/usb/hackrf/hackrf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
> index 9c0ecd5f056c..a1a7690a344a 100644
> --- a/drivers/media/usb/hackrf/hackrf.c
> +++ b/drivers/media/usb/hackrf/hackrf.c
> @@ -1398,6 +1398,7 @@ static int hackrf_probe(struct usb_interface *intf,
>  	dev->rx_vb2_queue.drv_priv = dev;
>  	dev->rx_vb2_queue.buf_struct_size = sizeof(struct hackrf_buffer);
>  	dev->rx_vb2_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	dev->rx_vb2_queue.lock = &dev->vb_queue_lock;
>  	ret = vb2_queue_init(&dev->rx_vb2_queue);
>  	if (ret) {
>  		dev_err(dev->dev, "Could not initialize rx vb2 queue\n");
> @@ -1413,6 +1414,7 @@ static int hackrf_probe(struct usb_interface *intf,
>  	dev->tx_vb2_queue.drv_priv = dev;
>  	dev->tx_vb2_queue.buf_struct_size = sizeof(struct hackrf_buffer);
>  	dev->tx_vb2_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	dev->tx_vb2_queue.lock = &dev->vb_queue_lock;

I'm not sure if setting the same lock for both video queues is desired,
but that's unrelated to this patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	ret = vb2_queue_init(&dev->tx_vb2_queue);
>  	if (ret) {
>  		dev_err(dev->dev, "Could not initialize tx vb2 queue\n");
> @@ -1474,7 +1476,6 @@ static int hackrf_probe(struct usb_interface *intf,
>  	/* Init video_device structure for receiver */
>  	dev->rx_vdev = hackrf_template;
>  	dev->rx_vdev.queue = &dev->rx_vb2_queue;
> -	dev->rx_vdev.queue->lock = &dev->vb_queue_lock;
>  	dev->rx_vdev.v4l2_dev = &dev->v4l2_dev;
>  	dev->rx_vdev.ctrl_handler = &dev->rx_ctrl_handler;
>  	dev->rx_vdev.lock = &dev->v4l2_lock;
> @@ -1494,7 +1495,6 @@ static int hackrf_probe(struct usb_interface *intf,
>  	/* Init video_device structure for transmitter */
>  	dev->tx_vdev = hackrf_template;
>  	dev->tx_vdev.queue = &dev->tx_vb2_queue;
> -	dev->tx_vdev.queue->lock = &dev->vb_queue_lock;
>  	dev->tx_vdev.v4l2_dev = &dev->v4l2_dev;
>  	dev->tx_vdev.ctrl_handler = &dev->tx_ctrl_handler;
>  	dev->tx_vdev.lock = &dev->v4l2_lock;

-- 
Regards,

Laurent Pinchart

