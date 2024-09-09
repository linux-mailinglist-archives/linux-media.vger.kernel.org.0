Return-Path: <linux-media+bounces-18005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E6971D2E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05FEB1C233EC
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12621BBBC3;
	Mon,  9 Sep 2024 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A3zu7HJY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644301BAEDE
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893513; cv=none; b=n5wCBWWLt3TMqzKLAeuFLmhXjsg1phdPOVglbU5tM4mqW2/uOqblxlJgT7IfNZms0vSNItAULAQ1H+1HemL3uoJz6cR9RGt5wjsvRdMF/O10zk0thhCyg3Al/kz/GVqCBEetZrWV9sWlcsXYuSDEphIoAyuzFvTNpQd2f7mOTT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893513; c=relaxed/simple;
	bh=Q+8HzJK/J6jn8LrufPUr1m3T2y1Dcz7LDOQ6HQR+4po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJDqrKtKUusM0EBKInaZ1GW5OMWeTOg41EjShXaUsvT8MsdEwddexpPBd4sGL5WDF3Pbr+A/P6A8PCed4/HostAVkTYZxdr6JJGm25JLNx4P+L4gaGcHrjh/I2Cbc61E3Y0ryZYi0x/y/8OZNvaOsDalwFdx1oQs0j9Hi6Tz0k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A3zu7HJY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65FD05A4;
	Mon,  9 Sep 2024 16:50:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893433;
	bh=Q+8HzJK/J6jn8LrufPUr1m3T2y1Dcz7LDOQ6HQR+4po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3zu7HJY8cIP/Ot2XJbpb/Y/fdZTd9iviOPXpNDB1h74znz3ZWsYnuk4fisdnnGel
	 Bcr960CKleBFZi4qi6WsoIHAiH/eNKN3uq0GD5TaB8h5RdVezCeMTVbzHlGd0TETpw
	 qphg+dJn7it6JtrtOJSHBwvax5WZ/mesjWFL1kpE=
Date: Mon, 9 Sep 2024 17:51:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 6/9] media: rcar_drif.c: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145146.GA27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <31085af170e3cc9b4fe115d53a556ccf477751d3.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31085af170e3cc9b4fe115d53a556ccf477751d3.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:52PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.

The commit message doesn't match the change below, you're moving the
lock down, not up.

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar_drif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index f21d05054341..5d3109940ded 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1071,7 +1071,6 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
>  	sdr->vdev->release = video_device_release;
>  	sdr->vdev->lock = &sdr->v4l2_mutex;
>  	sdr->vdev->queue = &sdr->vb_queue;
> -	sdr->vdev->queue->lock = &sdr->vb_queue_mutex;
>  	sdr->vdev->ctrl_handler = &sdr->ctrl_hdl;
>  	sdr->vdev->v4l2_dev = &sdr->v4l2_dev;
>  	sdr->vdev->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER |
> @@ -1316,6 +1315,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
>  	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
>  	sdr->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	sdr->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	sdr->vb_queue.lock = &sdr->vb_queue_mutex;
>  
>  	/* Init videobuf2 queue */
>  	ret = vb2_queue_init(&sdr->vb_queue);

-- 
Regards,

Laurent Pinchart

