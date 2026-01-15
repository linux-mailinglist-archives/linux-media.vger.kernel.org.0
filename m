Return-Path: <linux-media+bounces-50800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A973FD24E8A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4FEF30198D1
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 14:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204EC399000;
	Thu, 15 Jan 2026 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mjUwElXj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F024DFF3;
	Thu, 15 Jan 2026 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486852; cv=none; b=kiGEvc4Ow3Og1j63wgQD4oZ5XmyRK5j/S7r0dz8aMQrFqUNx4Nckb8aZKlgTIsGVnuygNFaRfdMBj91CbmnHXdn/W+sHNoWYaKs5IVsg/C73OU/7sCyQmROdF1FVdoxZ7Mv+GVpJAWNKl9OXZR2G1qbXpW85TDF6loXdFovdMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486852; c=relaxed/simple;
	bh=IhbGfQgMs/mCIShaiVYb9eV9usy/UqgSmlOkRrnHmzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmka+r4eg7Y8/nqgPJLrf6UBGP+iaSv/nUJIjxPHrza8zTDOQoK9wv/lizhUJUHX3svMnmqaRO2+QcYwlXM8K4kvHMJaMx1QkJzO7jBk8bMOa+x1LxNtQV4STYdnBKXG3D29heJgsDvCBaqTc+xvnMqYboWN3luqYmfpq5PzAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mjUwElXj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [212.249.222.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47524465;
	Thu, 15 Jan 2026 15:20:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768486821;
	bh=IhbGfQgMs/mCIShaiVYb9eV9usy/UqgSmlOkRrnHmzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjUwElXjui+LKDX/K0VxzDBZyeb6JSuLIf7g2bZUwW0Yt4JH+S+e8zbEbCOjARULN
	 CHDYa44eR0lR/+2HvZIg92ZbI+n1dLi/KTlQWPvx8kYsovJky+pwKMg32WDeYpRmaa
	 V52PVcTQq2yHh3Vw2fJe3naLFASlcim2DmsuH+kQ=
Date: Thu, 15 Jan 2026 15:20:36 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: renesas: vsp1: Fix NULL pointer deref on module
 unload
Message-ID: <aWj3khkjRiOcDNoL@zed>
References: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com>

Hi Tomi

On Thu, Jan 15, 2026 at 11:22:35AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> When unloading the module on gen 4, we hit a NULL pointer dereference.
> This is caused by the cleanup code calling vsp1_drm_cleanup() where it
> should be calling vsp1_vspx_cleanup().
>
> Fix this by checking the IP version and calling the drm or vspx function
> accordingly, the same way as the init code does.
>
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thank you! This indeed was not correct

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 6c64657fc4f3..30df9b36642d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -240,8 +240,12 @@ static void vsp1_destroy_entities(struct vsp1_device *vsp1)
>  		media_device_unregister(&vsp1->media_dev);
>  	media_device_cleanup(&vsp1->media_dev);
>
> -	if (!vsp1->info->uapi)
> -		vsp1_drm_cleanup(vsp1);
> +	if (!vsp1->info->uapi) {
> +		if (vsp1->info->version == VI6_IP_VERSION_MODEL_VSPX_GEN4)
> +			vsp1_vspx_cleanup(vsp1);
> +		else
> +			vsp1_drm_cleanup(vsp1);
> +	}
>  }
>
>  static int vsp1_create_entities(struct vsp1_device *vsp1)
>
> ---
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> change-id: 20260115-rcar-vsp-crash-fix-8d4871f0f39e
>
> Best regards,
> --
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

