Return-Path: <linux-media+bounces-18015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB2971D6B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D326628492C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613C318C3B;
	Mon,  9 Sep 2024 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Urm0DRPD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42C1758F
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894174; cv=none; b=n2WxyaVERfALaRLr0cj8PI196dd++SYxIEEqouXIwtlH9wM80TrF3lpKmbSvs8dnTcef8uQIgvTC6xpjS6UIMC8zIObopZoJzQy9kCvXMcNp+3bWKJgIxWlrkdCKWNPQ2HioWbnn6aKIFjMfQVJes3/8Xh2/Ri/tmNy2OpZsxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894174; c=relaxed/simple;
	bh=CjdnynTxshVYMw0GkSY+m/nq8lz6n9CauvYw85QDdpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVGPwi2XMJneAM9GqHVfk2fJg3iPsNUmHx5+XV9Qcmu2dYRAcoyJKpHSW54ZZ+uXrYDuMB/W/4ZqpVWP2PfCUbYua0KhRJwNsRKVTvVxkN9UMK2O8GBOUMFYS6waBWKP/OHZ3cAb+wQcyMt+pTnsA0JfpJVf6MBvbJsGSrI8A4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Urm0DRPD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65AB73DA;
	Mon,  9 Sep 2024 17:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725894095;
	bh=CjdnynTxshVYMw0GkSY+m/nq8lz6n9CauvYw85QDdpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Urm0DRPDyug5fq2yR7+jXZS7EVXerR0QoDBwNzIvK9g8fj9d1d6kGXM1sh7cP5sRv
	 suPo5aOWhyh18LBDI7VaLWX1Lv/bCQtuQ5nOUQUOW2xgGqw5QcXphrTWzNi80/gQsV
	 K5SHhZxjOPj6Gou5uv8E6VSAzM03C6P+LwEhEoLU=
Date: Mon, 9 Sep 2024 18:02:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 6/9] media: rcar_drif.c: set lock before calling
 vb2_queue_init()
Message-ID: <20240909150248.GB9448@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <31085af170e3cc9b4fe115d53a556ccf477751d3.1725285495.git.hverkuil-cisco@xs4all.nl>
 <20240909145146.GA27525@pendragon.ideasonboard.com>
 <c95beba7-2506-4de2-9601-47348623dba0@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c95beba7-2506-4de2-9601-47348623dba0@xs4all.nl>

On Mon, Sep 09, 2024 at 04:55:32PM +0200, Hans Verkuil wrote:
> On 09/09/2024 16:51, Laurent Pinchart wrote:
> > On Mon, Sep 02, 2024 at 04:04:52PM +0200, Hans Verkuil wrote:
> >> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> >> the future. So for those drivers that set the lock later, move it up to
> >> before the vb2_queue_init() call.
> > 
> > The commit message doesn't match the change below, you're moving the
> > lock down, not up.
> 
> Actually, I am moving it up, as in 'set earlier', but in this case it is
> a bit confusing in the patch.

Oops indeed, I thought both changes were in the same function.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> >> Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> ---
> >>  drivers/media/platform/renesas/rcar_drif.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> >> index f21d05054341..5d3109940ded 100644
> >> --- a/drivers/media/platform/renesas/rcar_drif.c
> >> +++ b/drivers/media/platform/renesas/rcar_drif.c
> >> @@ -1071,7 +1071,6 @@ static int rcar_drif_sdr_register(struct rcar_drif_sdr *sdr)
> >>  	sdr->vdev->release = video_device_release;
> >>  	sdr->vdev->lock = &sdr->v4l2_mutex;
> >>  	sdr->vdev->queue = &sdr->vb_queue;
> >> -	sdr->vdev->queue->lock = &sdr->vb_queue_mutex;
> >>  	sdr->vdev->ctrl_handler = &sdr->ctrl_hdl;
> >>  	sdr->vdev->v4l2_dev = &sdr->v4l2_dev;
> >>  	sdr->vdev->device_caps = V4L2_CAP_SDR_CAPTURE | V4L2_CAP_TUNER |
> >> @@ -1316,6 +1315,7 @@ static int rcar_drif_sdr_probe(struct rcar_drif_sdr *sdr)
> >>  	sdr->vb_queue.ops = &rcar_drif_vb2_ops;
> >>  	sdr->vb_queue.mem_ops = &vb2_vmalloc_memops;
> >>  	sdr->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> >> +	sdr->vb_queue.lock = &sdr->vb_queue_mutex;
> >>  
> >>  	/* Init videobuf2 queue */
> >>  	ret = vb2_queue_init(&sdr->vb_queue);

-- 
Regards,

Laurent Pinchart

