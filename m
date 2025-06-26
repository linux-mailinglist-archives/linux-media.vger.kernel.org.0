Return-Path: <linux-media+bounces-35926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE072AE9591
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 08:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F35AA7AABD5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 06:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451F02222AC;
	Thu, 26 Jun 2025 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDUWdzJA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2362B1A0BF1;
	Thu, 26 Jun 2025 06:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917768; cv=none; b=bAIsQsMnR5N4jbxcoCmMdG3aqGbVpVOe/4MERk/FWFOLQZcvQ+6lAkawsUNQZAwxI+vHjySnE8rKaKTcG/2QA/hrD71U9+0WkCfyDlk1S7UNVZchwFcbnZ0n7v4LTMsgPvEBFgYcUiZuN7NfhXyjPPKjmvIibLiimKSy2l9Q2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917768; c=relaxed/simple;
	bh=CsenkKlokXJTud0BpIjQPSJm8Cd41IelU7DxRhuZOh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejX9D8TCidX7Ny+UTdXJk3kSUZngYBruqwE0b1ZIyla6pWTu8ugSm9tKsmqXjPZ2qbZkk0R9mUr48+61GIv4AT6uoYh5yoj4aJAtE7UKraX7C/yDmBx0/jwzfNQA2Mp22YTRu3jgBqQG2HXKTWqjvHSrJhEuLsnpMPZZil1E69s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDUWdzJA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750917767; x=1782453767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CsenkKlokXJTud0BpIjQPSJm8Cd41IelU7DxRhuZOh0=;
  b=YDUWdzJASJ0dSosvaX6mOI+ipXpMhyqhzmn/tsqpfhAT6NqRVi99NQgV
   pTuesMwtNcDmaJ3xlTV4mrHAmy5IGGuxxlf7XFVsXK+XxZwBcFT6ZahKc
   ZYwL1OoK7Y2sBG2Nez/18MPd+zN7okLTCjG9JxpslDWHlzW7VY+ZDgICC
   UUjGuFPtOp6PocKZo5K/ALyVwaZ/VaB6jTPHdgVxVwx57awqr2BIHHM4M
   MNF7Ez2rexf0VRcE0fn9L9+zdkwKt/bfKdzmShnZjIR7i0iO7kPRikY6N
   Ccm6SOrpGb1Ov2wUdjGkFm4IA9jSi9EdQQHWMB2ADZ+cx1wshKcr86JJt
   g==;
X-CSE-ConnectionGUID: P/wwox4rTt2UZ0BH8LYR1w==
X-CSE-MsgGUID: bKlKQpTwRLKwV2b0jKHfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53138908"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53138908"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:02:45 -0700
X-CSE-ConnectionGUID: 3hv6Xl6XR3qLyx6aGfr4zw==
X-CSE-MsgGUID: ideqBmC+SxOBU4THttvNCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152720171"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.122])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 23:02:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 04B8011FB5F;
	Thu, 26 Jun 2025 09:02:40 +0300 (EEST)
Date: Thu, 26 Jun 2025 06:02:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Devarsh Thakkar <devarsht@ti.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: ti: j721e-csi2rx: Support multiple pixels
 per clock
Message-ID: <aFzif59lHvNz-p-0@kekkonen.localdomain>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
 <20250410-probe_fixes-v2-6-801bc6eebdea@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-probe_fixes-v2-6-801bc6eebdea@ideasonboard.com>

Hi Jai,

On Thu, Apr 10, 2025 at 12:19:04PM +0530, Jai Luthra wrote:
> Add support for negotiating the highest possible pixel mode (from
> single, dual, quad) with the Cadence CSI2RX bridge. This is required to
> drain the Cadence stream FIFOs without overflowing when the source is
> operating at a high link-frequency [1].
> 
> Also, update the Kconfig as this introduces a hard build-time dependency
> on the Cadence CSI2RX driver, even for a COMPILE_TEST.
> 
> [1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM
> 
> Link: https://www.ti.com/lit/pdf/spruj16
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

This creates a dependency between the two drivers.

Can you confirm that the TI device only exists in conjunction with the
cadence HW block?

> ---
>  drivers/media/platform/ti/Kconfig                  |  3 +-
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 38 ++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
> index bab998c4179aca3b07372782b9be7de340cb8d45..3bc4aa35887e6edc9fa8749d9956a67714c59001 100644
> --- a/drivers/media/platform/ti/Kconfig
> +++ b/drivers/media/platform/ti/Kconfig
> @@ -67,7 +67,8 @@ config VIDEO_TI_J721E_CSI2RX
>  	tristate "TI J721E CSI2RX wrapper layer driver"
>  	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>  	depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
> -	depends on (PHY_CADENCE_DPHY_RX && VIDEO_CADENCE_CSI2RX) || COMPILE_TEST
> +	depends on VIDEO_CADENCE_CSI2RX
> +	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
>  	depends on ARCH_K3 || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_FWNODE
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index ad51d033b6725426550578bdac1bae8443458f13..425324c3d6802cfda79d116d3967b61a2e7a015a 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -21,6 +21,8 @@
>  #include <media/v4l2-mc.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> +#include "../../cadence/cdns-csi2rx.h"
> +
>  #define TI_CSI2RX_MODULE_NAME		"j721e-csi2rx"
>  
>  #define SHIM_CNTL			0x10
> @@ -29,6 +31,7 @@
>  #define SHIM_DMACNTX			0x20
>  #define SHIM_DMACNTX_EN			BIT(31)
>  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
> +#define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
>  #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>  #define SHIM_DMACNTX_YUV422_MODE_11	3
> @@ -40,6 +43,7 @@
>  #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
>  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
>  
> +#define TI_CSI2RX_MAX_PIX_PER_CLK	4
>  #define PSIL_WORD_SIZE_BYTES		16
>  /*
>   * There are no hard limits on the width or height. The DMA engine can handle
> @@ -110,6 +114,7 @@ struct ti_csi2rx_dev {
>  	struct v4l2_format		v_fmt;
>  	struct ti_csi2rx_dma		dma;
>  	u32				sequence;
> +	u8				pix_per_clk;
>  };
>  
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
> @@ -485,6 +490,26 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>  	return 0;
>  }
>  
> +/* Request maximum possible pixels per clock from the bridge */
> +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
> +{
> +	struct media_pad *pad;
> +	int ret;
> +	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;

Could you make this look like a reverse Christmas tree?

> +
> +	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
> +	if (!pad)
> +		return;
> +
> +	ret = cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
> +	if (ret) {
> +		dev_warn(csi->dev, "NUM_PIXELS negotiation failed: %d\n", ret);
> +		csi->pix_per_clk = 1;
> +	} else {
> +		csi->pix_per_clk = ppc;
> +	}
> +}
> +
>  static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
>  {
>  	const struct ti_csi2rx_fmt *fmt;
> @@ -496,6 +521,9 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
>  	reg = SHIM_CNTL_PIX_RST;
>  	writel(reg, csi->shim + SHIM_CNTL);
>  
> +	/* Negotiate pixel count from the source */
> +	ti_csi2rx_request_max_ppc(csi);
> +
>  	reg = SHIM_DMACNTX_EN;
>  	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>  
> @@ -524,14 +552,18 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
>  	case V4L2_PIX_FMT_YVYU:
>  		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
>  				  SHIM_DMACNTX_YUV422_MODE_11);
> +		/* Multiple pixels are handled differently for packed YUV */
> +		if (csi->pix_per_clk == 2)
> +			reg |= SHIM_DMACNTX_DUAL_PCK_CFG;
> +		reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>  		break;
>  	default:
> -		/* Ignore if not YUV 4:2:2 */
> +		/* By default we change the shift size for multiple pixels */
> +		reg |= FIELD_PREP(SHIM_DMACNTX_SIZE,
> +				  fmt->size + (csi->pix_per_clk >> 1));
>  		break;
>  	}
>  
> -	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> -
>  	writel(reg, csi->shim + SHIM_DMACNTX);
>  
>  	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
> 

-- 
Regards,

Sakari Ailus

