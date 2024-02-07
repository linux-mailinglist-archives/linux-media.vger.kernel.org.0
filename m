Return-Path: <linux-media+bounces-4823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D784CC94
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 15:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 126F1B2302F
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 14:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399287C0BB;
	Wed,  7 Feb 2024 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DR50weJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491B7C088
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315876; cv=none; b=kWDiaKnSgnVgqHE9isbaY9BlxoN5pnRlU7ZYXG76Le8wYKxN5QHiVB6tRDuOgnwmN3d4348olqshUwLfnMcEaiaZY8DpxigXoZTJXGPSiq0tATlMyATeM/ldf6J9fk38aYgr0bdCZc4tyBAYLFzmjmP0HDJa3/69xBwx6hubC5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315876; c=relaxed/simple;
	bh=D0S+xyBkRg2vkFUABs4BPHBZcQkBsScsKjOXcn8nplM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjsfSFHDxQO3kovXH5O0O4CSUxlfj+efpkvlbGaDPn1wasK8GPCGR9iD0mq5677aftFUx1LDEO/qH+OTFEL4EB0xXtMRZwqC7Rul+Fj5JPQTYYOlBZdgWj+iuArFvINg1W+IV8uC6FiAoxzM0ykZKZx5qO5WnbMjUCIhUZBXL8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DR50weJ6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96D99975;
	Wed,  7 Feb 2024 15:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707315789;
	bh=D0S+xyBkRg2vkFUABs4BPHBZcQkBsScsKjOXcn8nplM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DR50weJ6MYgDipdgE5SXnrzRLXck/a1dfw/FG40o3TZ454Ec/mm0malesiRt85p58
	 8YJWXyHPft4M34Qka9fgAU7rixWkeuXFsLTfAHfCPfO2bm8z9PLXlmTTHy6A6UZ9md
	 V1QmLnMrlSha5b3MGvQe76b6umEro82GeCcRvkHI=
Date: Wed, 7 Feb 2024 16:24:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 20/29] media: ipu3-cio2: Call v4l2_device_unregister()
 earlier
Message-ID: <20240207142435.GR23702@pendragon.ideasonboard.com>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-21-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231220103713.113386-21-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Dec 20, 2023 at 12:37:04PM +0200, Sakari Ailus wrote:
> v4l2_device_unregister() unregisters V4L2 sub-device nodes among other
> things. Call it before releasing memory and other resources.

Please expand the commit message, it's not immediately clear why this is
needed and what the consequences are.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 5d3b0ffd3d08..da82d09b46ab 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1827,11 +1827,11 @@ static void cio2_pci_remove(struct pci_dev *pci_dev)
>  	struct cio2_device *cio2 = pci_get_drvdata(pci_dev);
>  
>  	media_device_unregister(&cio2->media_dev);
> +	v4l2_device_unregister(&cio2->v4l2_dev);
>  	v4l2_async_nf_unregister(&cio2->notifier);
>  	v4l2_async_nf_cleanup(&cio2->notifier);
>  	cio2_queues_exit(cio2);
>  	cio2_fbpt_exit_dummy(cio2);
> -	v4l2_device_unregister(&cio2->v4l2_dev);
>  	media_device_cleanup(&cio2->media_dev);
>  	mutex_destroy(&cio2->lock);
>  

-- 
Regards,

Laurent Pinchart

