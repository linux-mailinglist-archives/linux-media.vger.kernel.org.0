Return-Path: <linux-media+bounces-34909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72843ADB0C4
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80C9E3A0654
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F39292B47;
	Mon, 16 Jun 2025 12:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WZrlNy+8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DD8285C91;
	Mon, 16 Jun 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078749; cv=none; b=XRSFVujvTTsL3Qt0bUC/obLpuf7VoxMg+vcE6RGRTG39FFBE2kmB5F8KHukHMaoU2Cl5l+fdjqUse5l3+PEcpSZO70jKyZH8xHIyeq043FPEvOGUwiPljrfJmqGaAv+PlOQhhGljqQd4CKzeGqnWyFviK6OmT5XkTcnwqdK43tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078749; c=relaxed/simple;
	bh=xtFysCyyswz78+T3v4m2bq8knc6uWtBd1XZ07DX2xa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2vtSI8rf+rM67MlqjPzDSAMynnyHCDYPRmcFe4i7F1L8nUpxTU/HY+QaCbgBdHngv374hNDwVUWB+8IfTJ1tgTWG83G3a4Vr0CmyiL8h8A7n4FP0znGw2Aw6w4FvUZEQNL8GAeKSbDBJA1XQvf6Nk8ukdCS8Nbg95Coj6dU5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WZrlNy+8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F5FA752;
	Mon, 16 Jun 2025 14:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750078734;
	bh=xtFysCyyswz78+T3v4m2bq8knc6uWtBd1XZ07DX2xa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZrlNy+8wV9C9tyk9u8HfJe09NVLedeR/WcGi82d4MCCRwxkEYgCOVMOA1qxdNvRX
	 6bhclKkXcHT9BLHEhO/e+DD3NvBii0f3r/W7PLfYV0M+QvYeRQoyWSW8ypgMZYUy31
	 0e1eOoyWNVM1leZbqxFGkI6Z0mvFGG6Eid1RGl14=
Date: Mon, 16 Jun 2025 15:58:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH v2 2/2] media: vsp1: Reset FCP after VSPD
Message-ID: <20250616125850.GZ10542@pendragon.ideasonboard.com>
References: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
 <20250616-vspx-reset-v2-2-6cc12ed7e9bb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-vspx-reset-v2-2-6cc12ed7e9bb@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, Jun 16, 2025 at 02:14:25PM +0200, Jacopo Mondi wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> According to the R-Car Gen3 H/W manual v2.40, and R-Car Gen4 H/W manual
> v1.20, the FCP must be reset after resetting the VSPD, except for the
> VSPDL. Do so.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 8270a9d207cb19c3a08911a408f5039d7d2924b6..49ac3104291a63ca0a47947baaff78ac7ecce3ea 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -33,6 +33,7 @@
>  #include "vsp1_lif.h"
>  #include "vsp1_lut.h"
>  #include "vsp1_pipe.h"
> +#include "vsp1_regs.h"
>  #include "vsp1_rwpf.h"
>  #include "vsp1_sru.h"
>  #include "vsp1_uds.h"
> @@ -502,7 +503,9 @@ static int vsp1_create_entities(struct vsp1_device *vsp1)
>  
>  int vsp1_reset_wpf(struct vsp1_device *vsp1, unsigned int index)
>  {
> +	u32 version = vsp1->version & VI6_IP_VERSION_MODEL_MASK;
>  	unsigned int timeout;
> +	int ret = 0;
>  	u32 status;
>  
>  	status = vsp1_read(vsp1, VI6_STATUS);
> @@ -523,7 +526,11 @@ int vsp1_reset_wpf(struct vsp1_device *vsp1, unsigned int index)
>  		return -ETIMEDOUT;
>  	}
>  
> -	return 0;
> +	if (version == VI6_IP_VERSION_MODEL_VSPD_GEN3 ||
> +	    version == VI6_IP_VERSION_MODEL_VSPD_GEN4)
> +		ret = rcar_fcp_soft_reset(vsp1->fcp);
> +
> +	return ret;
>  }
>  
>  static int vsp1_device_init(struct vsp1_device *vsp1)

-- 
Regards,

Laurent Pinchart

