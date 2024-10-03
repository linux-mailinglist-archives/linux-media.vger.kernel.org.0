Return-Path: <linux-media+bounces-19055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93698F196
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 16:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3C641C20E0B
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 14:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0732A19F412;
	Thu,  3 Oct 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c+ichrSL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C450919E98A;
	Thu,  3 Oct 2024 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966220; cv=none; b=sGOMXIGhLL8QBpI4JEKvbuDg2WPmIywldcPETH2BtjM2QkrfSTZcK4yNUdjDwAKeOkIN36/eG6otkAKTgir5iwTa1jhBUtHmtrjY/JTnmXzMlBtOFnYS2VKZfViE4bfiHXacDuqCzvgPllZTQ5rDH7oMZlWZtnzIclDdDUqQ/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966220; c=relaxed/simple;
	bh=cKNQ3L5yUjnSGzASytlF0O8JYKsU+IRUf57hyyg7m90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaBxxU6JMymE5Lf+4cKZ5uKdchoew1RKliX6kVMfYPBZCl26ly95SLxVEnmGAxmynLtCo1fb3vQiFfo0Vh/tdUSYfVCR/sp8zAAYVhvNm6xz28lQX/5IyacqDJ3rZuT50ZBNqrn4I50Z/Rje71qy2h5HBUNlQhsYMyyzyXQ8dFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c+ichrSL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE0C618D;
	Thu,  3 Oct 2024 16:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727966124;
	bh=cKNQ3L5yUjnSGzASytlF0O8JYKsU+IRUf57hyyg7m90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+ichrSLoJ/twKshDJx52sJBZan4xcIbIq9zo2vQIYdnqRBLJwgusJIR4kaPTkR5m
	 bYyf5hafOijCsSWSMwIX7xzafrYLaMcfL9zRv/CdMaL3LamWLG9hZrdsTmxqr7MI51
	 PxoNIW4+P17E2PWxER1sKWAsEQ+cE4ZDOQxYzPFY=
Date: Thu, 3 Oct 2024 17:36:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 17/17] media: rzg2l-cru: Move register definitions to
 a separate file
Message-ID: <20241003143653.GB5484@pendragon.ideasonboard.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241001140919.206139-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001140919.206139-18-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Oct 01, 2024 at 03:09:19PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Move the RZ/G2L CRU register definitions from `rzg2l-video.c` to a
> dedicated header file, `rzg2l-cru-regs.h`. Separating these definitions
> into their own file improves the readability of the code.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - New patch
> ---
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 79 +++++++++++++++++++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 +---------------
>  2 files changed, 80 insertions(+), 68 deletions(-)
>  create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> new file mode 100644
> index 000000000000..458f7452e5d3
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * rzg2l-cru-regs.h--RZ/G2L (and alike SoCs) CRU Registers Definitions
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __RZG2L_CRU_REGS_H__
> +#define __RZG2L_CRU_REGS_H__
> +
> +/* HW CRU Registers Definition */
> +
> +/* CRU Control Register */
> +#define CRUnCTRL			0x0
> +#define CRUnCTRL_VINSEL(x)		((x) << 0)
> +
> +/* CRU Interrupt Enable Register */
> +#define CRUnIE				0x4
> +#define CRUnIE_EFE			BIT(17)
> +
> +/* CRU Interrupt Status Register */
> +#define CRUnINTS			0x8
> +#define CRUnINTS_SFS			BIT(16)
> +
> +/* CRU Reset Register */
> +#define CRUnRST				0xc
> +#define CRUnRST_VRESETN			BIT(0)
> +
> +/* Memory Bank Base Address (Lower) Register for CRU Image Data */
> +#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> +
> +/* Memory Bank Base Address (Higher) Register for CRU Image Data */
> +#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> +
> +/* Memory Bank Enable Register for CRU Image Data */
> +#define AMnMBVALID			0x148
> +#define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> +
> +/* Memory Bank Status Register for CRU Image Data */
> +#define AMnMBS				0x14c
> +#define AMnMBS_MBSTS			0x7
> +
> +/* AXI Master Transfer Setting Register for CRU Image Data */
> +#define AMnAXIATTR			0x158
> +#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> +#define AMnAXIATTR_AXILEN		(0xf)
> +
> +/* AXI Master FIFO Pointer Register for CRU Image Data */
> +#define AMnFIFOPNTR			0x168
> +#define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> +#define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> +
> +/* AXI Master Transfer Stop Register for CRU Image Data */
> +#define AMnAXISTP			0x174
> +#define AMnAXISTP_AXI_STOP		BIT(0)
> +
> +/* AXI Master Transfer Stop Status Register for CRU Image Data */
> +#define AMnAXISTPACK			0x178
> +#define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> +
> +/* CRU Image Processing Enable Register */
> +#define ICnEN				0x200
> +#define ICnEN_ICEN			BIT(0)
> +
> +/* CRU Image Processing Main Control Register */
> +#define ICnMC				0x208
> +#define ICnMC_CSCTHR			BIT(5)
> +#define ICnMC_INF(x)			((x) << 16)
> +#define ICnMC_VCSEL(x)			((x) << 22)
> +#define ICnMC_INF_MASK			GENMASK(21, 16)
> +
> +/* CRU Module Status Register */
> +#define ICnMS				0x254
> +#define ICnMS_IA			BIT(2)
> +
> +/* CRU Data Output Mode Register */
> +#define ICnDMR				0x26c

The ICnDMR_YCMODE_UYVY macro from
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h should also be
moved here. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +#endif /* __RZG2L_CRU_REGS_H__ */
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index c3d10b001b7c..d7c82c7b9044 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -20,74 +20,7 @@
>  #include <media/videobuf2-dma-contig.h>
>  
>  #include "rzg2l-cru.h"
> -
> -/* HW CRU Registers Definition */
> -
> -/* CRU Control Register */
> -#define CRUnCTRL			0x0
> -#define CRUnCTRL_VINSEL(x)		((x) << 0)
> -
> -/* CRU Interrupt Enable Register */
> -#define CRUnIE				0x4
> -#define CRUnIE_EFE			BIT(17)
> -
> -/* CRU Interrupt Status Register */
> -#define CRUnINTS			0x8
> -#define CRUnINTS_SFS			BIT(16)
> -
> -/* CRU Reset Register */
> -#define CRUnRST				0xc
> -#define CRUnRST_VRESETN			BIT(0)
> -
> -/* Memory Bank Base Address (Lower) Register for CRU Image Data */
> -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> -
> -/* Memory Bank Base Address (Higher) Register for CRU Image Data */
> -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> -
> -/* Memory Bank Enable Register for CRU Image Data */
> -#define AMnMBVALID			0x148
> -#define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
> -
> -/* Memory Bank Status Register for CRU Image Data */
> -#define AMnMBS				0x14c
> -#define AMnMBS_MBSTS			0x7
> -
> -/* AXI Master Transfer Setting Register for CRU Image Data */
> -#define AMnAXIATTR			0x158
> -#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> -#define AMnAXIATTR_AXILEN		(0xf)
> -
> -/* AXI Master FIFO Pointer Register for CRU Image Data */
> -#define AMnFIFOPNTR			0x168
> -#define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> -#define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> -
> -/* AXI Master Transfer Stop Register for CRU Image Data */
> -#define AMnAXISTP			0x174
> -#define AMnAXISTP_AXI_STOP		BIT(0)
> -
> -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> -#define AMnAXISTPACK			0x178
> -#define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
> -
> -/* CRU Image Processing Enable Register */
> -#define ICnEN				0x200
> -#define ICnEN_ICEN			BIT(0)
> -
> -/* CRU Image Processing Main Control Register */
> -#define ICnMC				0x208
> -#define ICnMC_CSCTHR			BIT(5)
> -#define ICnMC_INF(x)			((x) << 16)
> -#define ICnMC_VCSEL(x)			((x) << 22)
> -#define ICnMC_INF_MASK			GENMASK(21, 16)
> -
> -/* CRU Module Status Register */
> -#define ICnMS				0x254
> -#define ICnMS_IA			BIT(2)
> -
> -/* CRU Data Output Mode Register */
> -#define ICnDMR				0x26c
> +#include "rzg2l-cru-regs.h"
>  
>  #define RZG2L_TIMEOUT_MS		100
>  #define RZG2L_RETRIES			10

-- 
Regards,

Laurent Pinchart

