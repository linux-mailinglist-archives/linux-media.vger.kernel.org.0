Return-Path: <linux-media+bounces-18006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA3971D33
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDAC9B228F3
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE711BBBEC;
	Mon,  9 Sep 2024 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ljrZViS3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935781AE039
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893545; cv=none; b=heSr2HFbsg3gDlsHqzRrj5wpE20xKHei0zN8FaHvsDfjEygUUdgdysQdvIftCccMrnvsUExX1pliW5LSk9Fh4tQre8ALvkPe+kHtZ94KpcVnh8c03RpA3k1RmKr/6UODPhr73hmFzAffIA4v0mR/PUAn0AhccVErDqkYwFxteM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893545; c=relaxed/simple;
	bh=pm9Bi3jmsFkPJTLJ4ALno7QzrX4s9qGbOSjB27vwSHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBRyfltpOs5ahIfG4SpEQzSCFO98hiEEsv6xxvb1GHTj0WV5sZ1Y3l+m6VG1PaJWoF5WGzrbeDOnKtS4+hxw4cHh9qgOoQx12Aw9OOlMiXpB/WH2H+QJDTcg9vNxRd93bufpRkqg4ZzWSPRI930a+W9hU3cUtVTYef8l3XHRUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ljrZViS3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B2045A4;
	Mon,  9 Sep 2024 16:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893466;
	bh=pm9Bi3jmsFkPJTLJ4ALno7QzrX4s9qGbOSjB27vwSHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljrZViS3j3HyVrtmFNdl+KlArw2fLfvQV1FAXORWm+kjoOPH+cjVd/UZDPiZxMt/Z
	 IPCB3K4m1+PP07bE55SKN0boWcqOFXSwDaiD8D5zI+SV1CIQujj1gqsIu8s95RX/Uz
	 29sdEMn7yktRpc85muF+LVH5E1xBr2sSTGJdgVvA=
Date: Mon, 9 Sep 2024 17:52:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Matt Ranostay <matt@ranostay.sg>
Subject: Re: [PATCH 7/9] media: video-i2c: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145219.GB27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <42695db9edcf5e6b5ddebab59338eb88a5abcebe.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <42695db9edcf5e6b5ddebab59338eb88a5abcebe.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:53PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Matt Ranostay <matt@ranostay.sg>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/video-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 56dbe07a1c99..ffb3d9d61a74 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -798,13 +798,13 @@ static int video_i2c_probe(struct i2c_client *client)
>  	queue->min_queued_buffers = 1;
>  	queue->ops = &video_i2c_video_qops;
>  	queue->mem_ops = &vb2_vmalloc_memops;
> +	queue->lock = &data->queue_lock;
>  
>  	ret = vb2_queue_init(queue);
>  	if (ret < 0)
>  		goto error_unregister_device;
>  
>  	data->vdev.queue = queue;
> -	data->vdev.queue->lock = &data->queue_lock;
>  
>  	snprintf(data->vdev.name, sizeof(data->vdev.name),
>  				 "I2C %d-%d Transport Video",

-- 
Regards,

Laurent Pinchart

