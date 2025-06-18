Return-Path: <linux-media+bounces-35200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59521ADF20B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED4487A2B51
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574E12F0C53;
	Wed, 18 Jun 2025 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uegyf41u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2302EE617;
	Wed, 18 Jun 2025 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262353; cv=none; b=jn2ljTdt6fMsaiuJCqqQmqCUDCG7OnK1dQ5LmcSnnvw0wMVoIrygIa6fvWFPbCL67Kp/dnztJllpmS9btTXxTwY+bw3KHcxDfBMQ4fITmwxI7fmbra8J/vy5NFaLvYcmed9tOnf4HHWxWzI2HgnbykOXesVtuedwfMI5h0p1fwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262353; c=relaxed/simple;
	bh=fCqVENc9CZO81zr//o/oiav5RoS2SRTDMugbmxl0dz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JecLD810hketKarMUk+Py6bnvwbBL3zI7Efi9998INlWes67nOJRQte2joX4TE2tnc+0hGpwnzm1u5/bMJJiVDfDEa62Ca1PCm7qRuayBEmB66nGn/vaUs69KXsFi3ncd2wY24X1apP+UkNS0N2ccAOpQGWgYGTLFC1vide0ETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uegyf41u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8C7B2B3;
	Wed, 18 Jun 2025 17:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750262335;
	bh=fCqVENc9CZO81zr//o/oiav5RoS2SRTDMugbmxl0dz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uegyf41u42ocjfi/GtLPISMxFPKc1Qw72qSZ4heQWO8OfbdbCxPKRizK7aEPuEcf3
	 Ytr+BH7fSd4YDP0nxzzse9yAKLp5Wy+O+4Tl3LrfIFxOAAf9isfqOUyh1HSQw7gD+5
	 CX9GizDZC8iDvAOXzXmAAqkPLLykmriYj/Z6scpc=
Date: Wed, 18 Jun 2025 18:58:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: vsp1: Add missing export.h
Message-ID: <20250618155851.GA31351@pendragon.ideasonboard.com>
References: <20250618-vspx-include-export-v1-1-95a2da4ec465@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-vspx-include-export-v1-1-95a2da4ec465@ideasonboard.com>

Hi Jacopo,

On Wed, Jun 18, 2025 at 05:42:47PM +0200, Jacopo Mondi wrote:
> As reported by the Kernel Test Robot, the newly merged vspx driver
> exports a few symbols but doesn't include the export.h header.
> 
> While at it, include the header file in vsp1_drm.c which exports
> symbols as well.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506181950.r9PRdV59-lkp@intel.com/
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Add missing export.h header as reported by kernel test robot <lkp@intel.com>
> 
> Can this patch be fast-tracked to ensure it lands with the one that
> introduces the vspx driver ?

I'll include it in my next pull request for Renesas media drivers,
either this week or the next.

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c  | 1 +
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index fe55e8747b05aa351c1547469f9cbbe2b6d25408..15d266439564e2317dbc380ef04d2b15ae899852 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/export.h>
>  #include <linux/slab.h>
>  
>  #include <media/media-entity.h>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> index 6551d63ba387a05c932d2e557bd0ae5f8810acc7..a754b92232bd57f1b4cd3f9e7903f0b5da5c5c57 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -13,6 +13,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/export.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> 
> ---
> base-commit: 642b70d526ab8daa8f256dfc1eb6bf27c3290cc6
> change-id: 20250618-vspx-include-export-84379a99bf59

-- 
Regards,

Laurent Pinchart

