Return-Path: <linux-media+bounces-2882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6E681BC30
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 17:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195BD1F2230E
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 16:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D1C539F8;
	Thu, 21 Dec 2023 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DDk3ybob"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADEA55E43
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C805F27C;
	Thu, 21 Dec 2023 17:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1703176800;
	bh=cFAaNKL3NWRHYVuPnj25gVGBdTn08029TlSYm5d9tJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DDk3ybobnfT0ree06o3CwR84pyM4QUZ/wSzeeyWUc0fzpCKSz274hTDTIDpe0zjKS
	 hd6uuBVnvvTiMBuoVAkAT/WtDC1mwjUnYrSEKEtio8NIxHGiIoXBHdwIfUjEjpr/dC
	 GqDRBZKv1aJCmc+vZ9N4deObxmFYfz52Fs8sowoM=
Date: Thu, 21 Dec 2023 18:40:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 3/3] media: mc: Drop useless debug print on file handle
 release
Message-ID: <20231221164056.GA10901@pendragon.ideasonboard.com>
References: <20231221135822.152448-1-sakari.ailus@linux.intel.com>
 <20231221135822.152448-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231221135822.152448-4-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Thu, Dec 21, 2023 at 03:58:22PM +0200, Sakari Ailus wrote:
> Drop a debug print in media_release(), which is a release callback for a
> file handle. Printing a debug message here is simply not necessary.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/mc/mc-devnode.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 680fbb3a9340..9c8fe9335dc1 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -190,7 +190,6 @@ static int media_release(struct inode *inode, struct file *filp)
>  	   return value is ignored. */
>  	put_device(&devnode->dev);
>  
> -	pr_debug("%s: Media Release\n", __func__);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

