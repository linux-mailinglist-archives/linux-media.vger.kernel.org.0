Return-Path: <linux-media+bounces-27300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0837A4B206
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 15:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7AD1890694
	for <lists+linux-media@lfdr.de>; Sun,  2 Mar 2025 14:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46611E7C09;
	Sun,  2 Mar 2025 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YEiDu79Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE081E0B9C;
	Sun,  2 Mar 2025 14:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740924476; cv=none; b=ZdAu0CKyM6j6pgWfbcYTIDhcwwJsz1X4tcWgmuXmcpZKrLwmwwSTljS7tfXU+i1Dnu51a9yx2wOm3CIvwZHTMp8oeAanQQiM7gSI8BOszTrKwXO4/HapIKbFY48HcNOxQ+LBg+wWDwR/s2mKlGWvmoRlgt52k9JO9X30qGgS67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740924476; c=relaxed/simple;
	bh=xRi/VtBmjy7VGAxEHebrRxUL6EARF7T0KosgVwz4ubU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd01dWlQJTrKStWT0Hg3oey+pky5BaEjgQukDGNBMt4jYFWPUtXKff5EnKVNKpzc44li4fid1Y7YnAWlMOhP8CLamvuFOe/XAv8mqidS50vHzaV/VUNqnd/5QvFzUOnhE/MmKq6BZZdfxamYHR15Rrsci7rahNdrsg0MfvHCwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YEiDu79Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F4712D5;
	Sun,  2 Mar 2025 15:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740924382;
	bh=xRi/VtBmjy7VGAxEHebrRxUL6EARF7T0KosgVwz4ubU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEiDu79Q0f12zm1UxwsJP8JTuUfg4hi9BHPxUZo5DuGlSHny4RwXsLcXwhwoZy9ad
	 u8iKNNIzzxrtCfETVcPGbXhcY1euvKj+RnCiRyVCnsCIkpKIBZoKa79ekk7sJ9eDi4
	 GQOFhnPrpHH6ulg8tVjN9htAgY/BwFYFWYJfpF48=
Date: Sun, 2 Mar 2025 16:07:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: renesas: vsp1: Add support for VSPX
Message-ID: <20250302140734.GA27177@pendragon.ideasonboard.com>
References: <20241220-v4-vspx-id-v2-1-5cf05c7352df@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-v4-vspx-id-v2-1-5cf05c7352df@ideasonboard.com>

Hi Jacopo,

On Fri, Dec 20, 2024 at 10:22:01AM +0100, Jacopo Mondi wrote:
> Add support for VSPX to the vsp1 driver.
> 
> VSPX is an instance of Renesas VSP2 IP found on R-Car gen4 SoCs
> that performs external memory access on behalf of the ISP.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
> Add an vsp1_device_info entry for Gen4 VSPX.
> 
> VSPX will likely need custom features, hence do no set any feature
> for the time being to prepare to expand later on.

Now that you've posted "[PATCH v2 0/6] media: renesas: vsp1: Add support
for IIF", this patch should be rebased on top, and set the VSP1_HAS_IIF
feature. You can include it in v3 of the IIF support series.

> ---
> Changes in v2:
> - Changed the patch authorship to my +renesas address
> - Collect tags
> - Link to v1: https://lore.kernel.org/r/20241219-v4-vspx-id-v1-1-e45225b02bf3@ideasonboard.com
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 10 ++++++++++
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 9fc6bf624a520ae38e9c5f30dfa4dfa412eec38e..4dfc5e1640264f23772964f2b48c66d76599cb70 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -835,6 +835,16 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  		.uif_count = 2,
>  		.wpf_count = 1,
>  		.num_bru_inputs = 5,
> +	}, {
> +		.version = VI6_IP_VERSION_MODEL_VSPX_GEN4,
> +		.model = "VSP2-X",
> +		.gen = 4,
> +		.features = 0,
> +		.lif_count = 0,
> +		.rpf_count = 2,
> +		.uif_count = 0,
> +		.wpf_count = 0,
> +		.num_bru_inputs = 2,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index 7eca82e0ba7ec5e02a5f3b9a30ccdcb48db39ed2..75e064429f4e231ecd2e291a10c09931e8096a97 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -791,6 +791,7 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_GEN4	(0x1c << 8)
> +#define VI6_IP_VERSION_MODEL_VSPX_GEN4	(0x1d << 8)
>  /* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
>  #define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
>  
> 
> ---
> base-commit: 50d451b19cc58cf374160e30cbf72a5ed5b1b129
> change-id: 20241219-v4-vspx-id-1dd2bb4aedfd

-- 
Regards,

Laurent Pinchart

