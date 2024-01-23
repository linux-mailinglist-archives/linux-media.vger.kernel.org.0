Return-Path: <linux-media+bounces-4087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D6838E8C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 13:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820251F259EC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904C55D917;
	Tue, 23 Jan 2024 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB1k92L1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE71210E0;
	Tue, 23 Jan 2024 12:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706013042; cv=none; b=N6eMvnuSB6M9+xa0mbGUE5FBzPp0XpI9uUcv5+97uK3JlNoNBgWMp6fntjWdPCdnDJBEWkjIi3UbJNNmC14aNGqkCabns+ht4d/KDdQvt2zd5Oa5nSGxSWKIGBN1FyDTExX8xqlY0VJJJFuBbljiB2ksKMDJDQCvFef60anvDlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706013042; c=relaxed/simple;
	bh=uz0038rx2LAK85LDl9b2xmv0MILynVQSt1GlOE+mjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKPN68xWsPKVmxwOPTKY4hG7GIL5Ch6h77l8vfruXItzAQtKuFsantFB1UrQREI6CaQR1MN3RRIBeIE8H59OK02dw4bop7F3yS6NFFowVg53RCZ2gsXX+J0jRI2gNL4AG3kz5Xmt1WmxZwhT8ut7CZehLkWv+5vGtlgnkUFaZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB1k92L1; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706013040; x=1737549040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uz0038rx2LAK85LDl9b2xmv0MILynVQSt1GlOE+mjZE=;
  b=YB1k92L1oODCLTatII64AfvA9qBqmUkckBCTnt2x1ImlTFs3awGBPP2A
   kDL/7mxHxKVD4h4Asibw1QYCXTzqq0u6cYQvcFvjiWI8+HoNhniYuztKV
   SCJLRCaE0s7bRCO67WdYVeK+/lAw+EyUypo4QjRU7pYmoOmwKpPF8xGar
   Evq106k/DLf8TXdSj0MssIFmp8862AqsmygTCfx8uT0AvbMPiklK1G62c
   M9n1LA2aCwOj3eaR92/OwQBq0O2nOBPj0Ug/UQvbWkj/x6/GuIygCJ+Z8
   cHCEpfA4KIptjjoOWPmWElHXDnex1OTj/gWAwPg2JF+1POBKWGibyo3SN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400361412"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="400361412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 04:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909280684"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="909280684"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 04:30:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5DE8911FAD4;
	Tue, 23 Jan 2024 14:20:05 +0200 (EET)
Date: Tue, 23 Jan 2024 12:20:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Message-ID: <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123115821.292787-5-biju.das.jz@bp.renesas.com>

Hi Biju,

Thanks for the patch.

On Tue, Jan 23, 2024 at 11:58:21AM +0000, Biju Das wrote:
> As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on the
> latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned that
> we need to supply all CRU clks and  we need to disable the vclk before
> enabling the LINK reception and enable the vclk after enabling the link
> Reception. So restructure clk handling as per the HW manual.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 55 ++++++++++++---
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 +---
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 ++++++++-----------
>  4 files changed, 74 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 811603f18af0..a5a99b004322 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
>  	struct v4l2_pix_format format;
>  };
>  
> -void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru);
> -int rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
> -
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index c4609da9bf1a..f4c5cbb30bc9 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -108,6 +109,7 @@ struct rzg2l_csi2 {
>  	struct reset_control *presetn;
>  	struct reset_control *cmn_rstb;
>  	struct clk *sysclk;
> +	struct clk *vclk;
>  	unsigned long vclk_rate;
>  
>  	struct v4l2_subdev subdev;
> @@ -361,10 +363,11 @@ static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
>  	return rzg2l_csi2_dphy_disable(csi2);
>  }
>  
> -static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> +static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
>  {
>  	unsigned long vclk_rate = csi2->vclk_rate / HZ_PER_MHZ;
>  	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
> +	int ret, count;
>  
>  	/* Select data lanes */
>  	rzg2l_csi2_write(csi2, CSI2nMCT0, CSI2nMCT0_VDLN(csi2->lanes));
> @@ -386,11 +389,40 @@ static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
>  	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
>  	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
>  
> +	clk_disable_unprepare(csi2->vclk);
> +	for (count = 0; count < 5; count++) {
> +		if (!(__clk_is_enabled(csi2->vclk)))
> +			break;
> +		usleep_range(10, 20);
> +	}
> +
> +	if (count == 5) {
> +		dev_err(csi2->dev, "Timeout, not able to turn OFF vclk\n");
> +		return -ETIMEDOUT;
> +	}

It'd be nice to have a CCF function to do this. Either way, you can use
read_poll_timeout().

> +
>  	/* Enable LINK reception */
>  	rzg2l_csi2_write(csi2, CSI2nMCT3, CSI2nMCT3_RXEN);
> +
> +	ret = clk_prepare_enable(csi2->vclk);
> +	if (ret)
> +		return ret;
> +
> +	for (count = 0; count < 5; count++) {
> +		if (__clk_is_enabled(csi2->vclk))
> +			break;
> +		usleep_range(10, 20);
> +	}
> +
> +	if (count == 5) {
> +		dev_err(csi2->dev, "Timeout, not able to turn ON vclk\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus

