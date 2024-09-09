Return-Path: <linux-media+bounces-18008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852E971D35
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4092028384C
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F4E1BBBF2;
	Mon,  9 Sep 2024 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g1CduYZz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAD1AE039
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893607; cv=none; b=OEOdGBR43HD+4NI3PcLBIeGcTCaqBzKg2O4QM7HYjBbJm8dJrakK1bVcpVB3FSlmrRSdRNB+cPxM18pKTOwPxltcQabjtbNcUga/LHNeZ0MSGHpvGxDw03MsgBVUt534R0pj7vIWaCuFRG0MUrEG/7OWvEV86UURpofLcSUfkZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893607; c=relaxed/simple;
	bh=/M5XhqzSSWcWvrx8irzrFA2ud1T6q6cQCuR2hzgWqiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCJlDSH25hv6d9mYanQrYMYnBHqMh8VYFR/JKK+8aRjQGjtBXPzPMSi9xeu6UeRxcscWYshnhRqdwnpXX7s+SjtSikzrqzzVt5WxcfyQlU7vcUo9bD6kGVdQDcwV754fmz19d1P9bAgdl4Zadhcx0rqljeZvkBs3ZLZwwYIUTu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g1CduYZz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDE815A4;
	Mon,  9 Sep 2024 16:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893528;
	bh=/M5XhqzSSWcWvrx8irzrFA2ud1T6q6cQCuR2hzgWqiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g1CduYZzGvk+N0vb5bNX5oGSj/fOvA0EHNt1U4tGIFTpWlYoiZErGp7rdFR65OuVE
	 fNYyEp0+MNhOS1P/kaUjE4gjCkGiP4itfEt75CW5x8TVSweziSZvzbStmEgCQ3A5gh
	 shHgnxN95dAuuHWKOyEQcMVulc31SrQt9bHKoRX0=
Date: Mon, 9 Sep 2024 17:53:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 2/9] media: pwc: set lock before calling vb2_queue_init()
Message-ID: <20240909145321.GD27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <91ca5c3db14df7b8d8dc4189aa73ed38ca97975e.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91ca5c3db14df7b8d8dc4189aa73ed38ca97975e.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:48PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/usb/pwc/pwc-if.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
> index e342199711d3..4a8485ea0c81 100644
> --- a/drivers/media/usb/pwc/pwc-if.c
> +++ b/drivers/media/usb/pwc/pwc-if.c
> @@ -1054,6 +1054,7 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
>  	pdev->vb_queue.ops = &pwc_vb_queue_ops;
>  	pdev->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	pdev->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	pdev->vb_queue.lock = &pdev->vb_queue_lock;
>  	rc = vb2_queue_init(&pdev->vb_queue);
>  	if (rc < 0) {
>  		PWC_ERROR("Oops, could not initialize vb2 queue.\n");
> @@ -1064,7 +1065,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
>  	pdev->vdev = pwc_template;
>  	strscpy(pdev->vdev.name, name, sizeof(pdev->vdev.name));
>  	pdev->vdev.queue = &pdev->vb_queue;
> -	pdev->vdev.queue->lock = &pdev->vb_queue_lock;
>  	video_set_drvdata(&pdev->vdev, pdev);
>  
>  	pdev->release = le16_to_cpu(udev->descriptor.bcdDevice);

-- 
Regards,

Laurent Pinchart

