Return-Path: <linux-media+bounces-23825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB8F9F8292
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 130057A373B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA2E1AC8A2;
	Thu, 19 Dec 2024 17:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ANiAZRbm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CCB197A8F;
	Thu, 19 Dec 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630614; cv=none; b=dNR/llJYt0wULvIIBDs7ne+5X5Bnikhdhcvba5xuz9nJ7VHocIskIamQzeDUrXqzFInxGSMveFnYC56MLTPvQcO6hDp2Cp5q6I4wBXmiXYny/5PFKiTZdjfuaBm6YwyxZa93BNyUX+/EgJ05jpSx8sEaaZ+C6F+uDidExpWhnZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630614; c=relaxed/simple;
	bh=4A1IXb+QmLqRn/GU2I1KovWBw9XxRfP87IZfom+s3GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daw1wRo5JJ/czganIxbI5t0rUBVmgxtj7fmVJyxCIRrUsd23n+Trf63YcJbKunOxj/8FqXoI0K6w4slDUyoJZMQRAmVqrCqNUhkxKL278uzYZvjS8pcvAM8pWYHujhsTxh0fbvOJqDas38hgW/7ELIu9WMoyDbUIUHUZ8fAh2WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ANiAZRbm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65A36163;
	Thu, 19 Dec 2024 18:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734630571;
	bh=4A1IXb+QmLqRn/GU2I1KovWBw9XxRfP87IZfom+s3GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANiAZRbmp8Kw2jyCoKj5l/ARMv8wZyS/sUmhzrBCE88d3L4Yq/6j316Bv+DB/DwTG
	 addefiEqatZF75ytlRwRNfSa5tgff1B8eEXqv7rfHKyt+0iIJobiCh/E46Kkn7osu6
	 AbOLG8lubOk5cAF+v8IwCmBki4/KoD+oC7R+duz0=
Date: Thu, 19 Dec 2024 19:50:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Add support for VSPX
Message-ID: <20241219175006.GI19884@pendragon.ideasonboard.com>
References: <20241219-v4-vspx-id-v1-1-e45225b02bf3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219-v4-vspx-id-v1-1-e45225b02bf3@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, Dec 19, 2024 at 06:40:13PM +0100, Jacopo Mondi wrote:
> Add support for VSPX to the vsp1 driver.
> 
> VSPX is an instance of Renesas VSP2 IP found on R-Car gen4 SoCs
> that performs external memory access on behalf of the ISP.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

That's missing a +renesas suffix (same in the From: address). With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Add an vsp1_device_info entry for Gen4 VSPX.
> 
> VSPX will likely need custom features, hence do no set any feature
> for the time being to prepare to expand later on.
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

