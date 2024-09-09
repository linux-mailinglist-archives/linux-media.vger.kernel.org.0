Return-Path: <linux-media+bounces-18007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC4971D34
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 16:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3AB283B50
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9241BBBED;
	Mon,  9 Sep 2024 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WsgUMfVn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4491BA87C
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893571; cv=none; b=ts5ie8t5nn4hCpNmp8ZEYx+r+cB9G1nTK3t5929XFfbu8Ip9ECzNKELNZfqdNt8HHRtGTkewQb1a1s7Cqjwtyvmt2K3g1BUE79Gnt/d/b8xL5e0lQinfGr4ACk53X/9pC3cIUouSCuqTjufe7l+WuZ1ME3dhO5mfVclzIiwFBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893571; c=relaxed/simple;
	bh=VQjMyNBWCnrHuX6aXMD1OhQZKTXGMFdare9+UZPUNiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxQ2eaywFwrG9Iv0M5qavjOoN7vqyg+0jo6/W4jO0dkfm8RoebJ3otbxOP0Mk2hs7xCq1dfmflkcN9psXcEkNAE/plmu042tcvzTdOekXTpAJEANnrapVpg3IGIYi3yBpTZWkTcYCEICDuPeIjtMwr25+sCVS/zH7oi7vpFbluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WsgUMfVn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA3295A4;
	Mon,  9 Sep 2024 16:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725893493;
	bh=VQjMyNBWCnrHuX6aXMD1OhQZKTXGMFdare9+UZPUNiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsgUMfVnkCaWdlrzH3KsRv0z7NYe7V4ITyKhO1sLGk707cg8L6weBCI5mSP98dLHo
	 pacREKwXoyv+Ws2fzFKC3qYLrFP2N5JGXSirDkvlolkHbkOIsp5LazAS50ZZiDMEeR
	 spS1MI3OosVUUlZLQFFTobyzGh/bLmUy20vMuTLk=
Date: Mon, 9 Sep 2024 17:52:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/9] media: staging: atomisp: set lock before calling
 vb2_queue_init()
Message-ID: <20240909145245.GC27525@pendragon.ideasonboard.com>
References: <cover.1725285495.git.hverkuil-cisco@xs4all.nl>
 <90b8e7a40c3ed306cbeb96c2f4dad97eb7e53bfd.1725285495.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90b8e7a40c3ed306cbeb96c2f4dad97eb7e53bfd.1725285495.git.hverkuil-cisco@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Mon, Sep 02, 2024 at 04:04:47PM +0200, Hans Verkuil wrote:
> The vb2_queue_init() will expect the vb2_queue lock pointer to be set in
> the future. So for those drivers that set the lock later, move it up to
> before the vb2_queue_init() call.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index 3a3e84a035e2..202497695e46 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -797,12 +797,12 @@ static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
>  	pipe->vb_queue.ops = &atomisp_vb2_ops;
>  	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
>  	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	pipe->vb_queue.lock = &pipe->vb_queue_mutex;
>  	ret = vb2_queue_init(&pipe->vb_queue);
>  	if (ret)
>  		return ret;
>  
>  	pipe->vdev.queue = &pipe->vb_queue;
> -	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
>  
>  	INIT_LIST_HEAD(&pipe->buffers_in_css);
>  	INIT_LIST_HEAD(&pipe->activeq);

-- 
Regards,

Laurent Pinchart

