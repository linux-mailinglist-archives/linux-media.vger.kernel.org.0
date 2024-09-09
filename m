Return-Path: <linux-media+bounces-18009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F7971D36
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE1811C2348E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137E61BBBF8;
	Mon,  9 Sep 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HyuDL5WU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75091AE039
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893628; cv=none; b=UF6h8/LeuSFkxoLDLq7NPl8mQX1gvOZQ+tKY2a8nE6N5r2Ks74dBSMbetargOmJYUWp4PONvpyyEDoa2xK9a6E27jLF5fPyEdvLfn2LfwYou/ei2I6WdEGya4Ks7hZHd/YnjmnmO53VLKeFbAqYIxTlR+NlJPannmwCUM+uKVQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893628; c=relaxed/simple;
	bh=RmZSdooPqAHqC7BS3R0zNkBWtZNUlRg9xEfBtMGf3Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vs2RJ9N8rSmwywaoXKGeIarsyZ15a1u/mt7sSN+Z5M2gParWylHwPMC6daA+Btbo7LX9UDzkmslIeFSnt5p4DnCRNtPQJgCuOzlif/g4z5bzFsq7bMITYoiYTA8gEoWNxD5INcHQnRWAVgXshPU1vG57oEeZyZrQhbJGguHYlmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HyuDL5WU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C3225A4;
	Mon,  9 Sep 2024 16:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893549;
	bh=RmZSdooPqAHqC7BS3R0zNkBWtZNUlRg9xEfBtMGf3Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyuDL5WUTq1vE4tBT1q/P7nNdqyX5xqNny1TE28cYSti6RfFsYhPJ5e3xwTxf9BlW
	 B/JACBfXwAj09l/oX8JDE8yRBKBJF3HN+W3zaWX2mcKu+IoX4OET09fC0rZtKn26sr
	 ToKzIYFxV0ybHtis3VfvSdS9R4Mynols2gmt/YCY=
Date: Mon, 9 Sep 2024 17:53:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 3/9] media: msi2500: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145342.GE27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <73b2b7bc2fb62415365a06ad413dea93c316cf92.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73b2b7bc2fb62415365a06ad413dea93c316cf92.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:49PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/usb/msi2500/msi2500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
> index 5138486abfa0..c42fad1e3204 100644
> --- a/drivers/media/usb/msi2500/msi2500.c
> +++ b/drivers/media/usb/msi2500/msi2500.c
> @@ -1199,6 +1199,7 @@ static int msi2500_probe(struct usb_interface *intf,
>  	dev->vb_queue.ops = &msi2500_vb2_ops;
>  	dev->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	dev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	dev->vb_queue.lock = &dev->vb_queue_lock;
>  	ret = vb2_queue_init(&dev->vb_queue);
>  	if (ret) {
>  		dev_err(dev->dev, "Could not initialize vb2 queue\n");
> @@ -1208,7 +1209,6 @@ static int msi2500_probe(struct usb_interface *intf,
>  	/* Init video_device structure */
>  	dev->vdev = msi2500_template;
>  	dev->vdev.queue = &dev->vb_queue;
> -	dev->vdev.queue->lock = &dev->vb_queue_lock;
>  	video_set_drvdata(&dev->vdev, dev);
>  
>  	/* Register the v4l2_device structure */

-- 
Regards,

Laurent Pinchart

