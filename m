Return-Path: <linux-media+bounces-18012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29952971D47
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF72840AD
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BC31BC06C;
	Mon,  9 Sep 2024 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mX8uQ5sW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE821BBBF2
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893756; cv=none; b=Djy5+KPZZ/aLrx0ItyM4V9lp5IxZd48A4y8wrC+hqxWmKThTMsqP7nIl3a1GB7ic52JWEQ7Ll/Qq6pcGTCF3y3kmVjIQwVB9j99m0PrsTPyoQnC7/PdR2vCAB7sj/svt+J7Dvv9a4wHRFi1+XH0C3FHZHolKFtHNRHL8lgOkEG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893756; c=relaxed/simple;
	bh=Tv003R9RNXbmr+xUecPfCt+gj3d5GtCcZz20xUfpaHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMu+wPPrT8XI11gKWms796dCCjR2rEIvlVW+p/JthKgHrr6zEiU1DvAhObcSlBmgOofoboxHws5O0nhGhqtLaAPFKrCpEg5Y+5H2dUFNc8lRDalmYDhbgUIWpRW8glPe3A8jAFrszy6bpTaq1rd+DSHxKUuxRcXgqYARiwCfzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mX8uQ5sW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1898E5A4;
	Mon,  9 Sep 2024 16:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893677;
	bh=Tv003R9RNXbmr+xUecPfCt+gj3d5GtCcZz20xUfpaHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mX8uQ5sWLpF2mx33bk1kLJO8QbCx96gJ9XOzllbivmo5OTmc8/hl5RfO68tZ9pwHn
	 kR42Srtwnak8In9JsYjDJzgvl50OKgNHHjeX8fjrW7q4Vnm9y7/MryGweTBMxzb820
	 pJag9TWnFQWzExu1ITSS27Kv+aYzdEK87UsnqQY0=
Date: Mon, 9 Sep 2024 17:55:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 5/9] media: airspy: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145550.GG27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <50a4adc0487018bb51328142c05d636e7663ef55.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50a4adc0487018bb51328142c05d636e7663ef55.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:51PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/usb/airspy/airspy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
> index e24e655fb1db..3e2a3099a8fe 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -1017,6 +1017,7 @@ static int airspy_probe(struct usb_interface *intf,
>  	s->vb_queue.ops = &airspy_vb2_ops;
>  	s->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	s->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	s->vb_queue.lock = &s->vb_queue_lock;
>  	ret = vb2_queue_init(&s->vb_queue);
>  	if (ret) {
>  		dev_err(s->dev, "Could not initialize vb2 queue\n");
> @@ -1026,7 +1027,6 @@ static int airspy_probe(struct usb_interface *intf,
>  	/* Init video_device structure */
>  	s->vdev = airspy_template;
>  	s->vdev.queue = &s->vb_queue;
> -	s->vdev.queue->lock = &s->vb_queue_lock;
>  	video_set_drvdata(&s->vdev, s);
>  
>  	/* Register the v4l2_device structure */

-- 
Regards,

Laurent Pinchart

