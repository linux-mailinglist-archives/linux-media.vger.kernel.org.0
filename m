Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B16594153C2
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 01:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238408AbhIVXMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 19:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238293AbhIVXMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 19:12:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8EEC061574;
        Wed, 22 Sep 2021 16:11:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02248E52;
        Thu, 23 Sep 2021 01:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632352268;
        bh=RiQ6yH/snIthq4tsMzqBMMW7hJxm+8kM0BoXHApaBP0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IiqrUSOaB+trOpnK6OoJhU5h4UVe2KwqDT1PlLiD3nnTIPnnjVi2f0x+jKr7XWW3h
         bXHgjx8LluEtcisDgQtI4R4OO+DebglVtRyv3bb69XyddlNo2Au8FSsniyjtKoF+BB
         CeGCNzKc3lpG+YeRUDEJdTepg/imc4ScCYEntXmY=
Date:   Thu, 23 Sep 2021 02:11:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] [RFC]: media: vsp1: Add support for the V3U VSPX
Message-ID: <YUu4CtwSQ6FlyaEz@pendragon.ideasonboard.com>
References: <20201217171349.1030753-1-kieran.bingham+renesas@ideasonboard.com>
 <20201217171349.1030753-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217171349.1030753-3-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

I've just realized I've never replied to this.

On Thu, Dec 17, 2020 at 05:13:49PM +0000, Kieran Bingham wrote:
> The V3U provides four VSPX instances. This module brings in the IIF, to
> process images through the ISP.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> 
> We need to set the VI6_DPR_ROUTE_IIFSEL bit on the VI6_DPR_BRU_ROUTE to
> enable output on the IIF.
> 
> At the moment I'm envisaging adding a new entity to keep our existing
> model, and map the IIF in the media graph, but it might be that we only
> need to set this one bit to output on the IIF - so there might not be a
> need for such over engineering.
> 
> In this patch I've provisionally added a VSP1_HAS_IIF feature, thinking
> it would be needed, but as I've moved on - I don't actually see that it
> would be required, so this likely gets dropped.
> 
> We will have some Bayer specific formats to handle, but they can be
> flagged based on the SoC type or a HAS_BAYER formats rather than the IIF
> if needed.

The hardware seems to map raw formats to RGB formats, for instance using
RGB332 for RAW8. I wonder if this means that a RAW8 byte gets split to
the internal 32-bit ARGB bus, with the bits then extracted by the ISP.
We'll have to figure out how to handle that.

> Furthermore, table 32.39 (Registers VSPX supports) indicates that the
> VSPX still needs to configure the WPF0 when used (and that the BRU must
> be connected, which we can handle in the routing tables).

Hmmmm... It's not entirely clear. We certainly have to set the IIFSEL
bit, but I wonder if the mention of the RT[5:0] field being set to 56
(WPF0) wouldn't be about the WPF output use case only.

Another question is how to model the connection to the ISP in the media
graph, and whether the VPSX and ISP need to be part of the same graph.
That would be interesting, and would need to be taken into account in
the DT bindings. As a first step, an IIF entity to model the path
towards the ISP (with a sink pad but no source pad) could be a way to
configure the routing to either the ISP or the WPF.

> So we may have to instantiate an instance of WPF specifically to handle
> the IIF, even though the IIF is actually a function of the BRU ...
> 
> Still seems a bit too early to tell - so I think this patch really is
> just for potential discussions - and not destined at all for
> integration.

I think we need to experiment :-) Now that Niklas has submitted a driver
for the ISP routing, maybe we'll be able to test this ?

> ---
>  drivers/media/platform/vsp1/vsp1.h      | 2 ++
>  drivers/media/platform/vsp1/vsp1_drv.c  | 8 ++++++++
>  drivers/media/platform/vsp1/vsp1_regs.h | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
> index 37cf33c7e6ca..a2fecd9392fd 100644
> --- a/drivers/media/platform/vsp1/vsp1.h
> +++ b/drivers/media/platform/vsp1/vsp1.h
> @@ -54,12 +54,14 @@ struct vsp1_uif;
>  #define VSP1_HAS_HGT		BIT(8)
>  #define VSP1_HAS_BRS		BIT(9)
>  #define VSP1_HAS_EXT_DL		BIT(10)
> +#define VSP1_HAS_IIF		BIT(11)
>  
>  struct vsp1_device_info {
>  	u32 version;
>  	const char *model;
>  	unsigned int gen;
>  	unsigned int features;
> +	unsigned int iif_count;
>  	unsigned int lif_count;
>  	unsigned int rpf_count;
>  	unsigned int uds_count;
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
> index c59e865dfef2..15e327516828 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -795,6 +795,14 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>  		.uif_count = 2,
>  		.wpf_count = 1,
>  		.num_bru_inputs = 5,
> +	}, {
> +		.version = VI6_IP_VERSION_MODEL_VSPX_V3U,
> +		.model = "VSP2-X",
> +		.gen = 3,
> +		.features = VSP1_HAS_IIF | VSP1_HAS_BRU | VSP1_HAS_EXT_DL,
> +		.iif_count = 1,
> +		.rpf_count = 4,
> +		.num_bru_inputs = 4,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> index b378ea4451ce..700ede1241e0 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -364,6 +364,7 @@
>  #define VI6_DPR_HST_ROUTE		0x2044
>  #define VI6_DPR_HSI_ROUTE		0x2048
>  #define VI6_DPR_BRU_ROUTE		0x204c
> +#define VI6_DPR_ROUTE_IIFSEL		BIT(28)
>  #define VI6_DPR_ILV_BRS_ROUTE		0x2050
>  #define VI6_DPR_ROUTE_BRSSEL		BIT(28)
>  #define VI6_DPR_ROUTE_FXA_MASK		(0xff << 16)
> @@ -767,6 +768,7 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> +#define VI6_IP_VERSION_MODEL_VSPX_V3U	(0x1d << 8)
>  
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
>  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)

-- 
Regards,

Laurent Pinchart
