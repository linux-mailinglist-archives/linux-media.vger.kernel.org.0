Return-Path: <linux-media+bounces-28878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FEEA73E4A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 20:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E34423BAD6D
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30E11B87CF;
	Thu, 27 Mar 2025 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fs347zSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF016133987;
	Thu, 27 Mar 2025 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102063; cv=none; b=nsRGI0HWJPoNWoHDGFa0UiRcGbjxruidQl1RRDuFXirB2EVEKkwgHXpyb0VybIHXrHxCqzwa+ZbkbAFlgxnfvOc8j8nIeKlxdDzopWG/QDVPmx2ObBRWvJy87zcV9p9mn3k1b0QasKErQmsiRIc0P5C5RQKNPaYmj3opMTFjLj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102063; c=relaxed/simple;
	bh=jHiI8/2owluTBB3WHQQN9xYP11FWsCemYmAsZhjPNCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTsXaMFbuDZbcCWQHcAPYz6bftZfaksiUec56uqFcgtCwBBTy8J3TJlCVil7k6YJ8FZR6Qinr7tqX/cYr3l84qd7hVPKo5qQfaf3eI6s+3lR6nvovQvJ18W7jnc9FYiTbmdEdOHj+TUU5+c62duKyACQUZe/kEW5BkJfRNO635k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fs347zSJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F829F6;
	Thu, 27 Mar 2025 19:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743101951;
	bh=jHiI8/2owluTBB3WHQQN9xYP11FWsCemYmAsZhjPNCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs347zSJVHQzT8CTrlNNTSh/teH6wTkT6xwdknDyYuy5XZCaAJBKDNSvV+J+ezU3u
	 7F5MZ3bII+Dde7y26fecQDxXrgWoYagTBqIpLU8RiUOqvJGaR2uixUbzi6pvfLq60Z
	 6WxFtXQYvJO1eXmGyIB7xs8vBiTxwTTAv1lKs6AI=
Date: Thu, 27 Mar 2025 21:00:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <20250327190037.GB22659@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-11-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:30PM -0500, Frank Li wrote:
> Add linux,cma node because some devices, such as camera, need big continue
> physical memory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 9 +++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 50fd3370f7dce..61ef00f4259e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -113,6 +113,15 @@ dsp_vdev0buffer: memory@94300000 {
>  			reg = <0 0x94300000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};

This is system memory. Why is it reserved here, hardcoding a specific
use case in a board DT, instead of specifying an overall CMA size in the
kernel configuration or through the kernel command line ?

>  	};
>  
>  	lvds_backlight0: backlight-lvds0 {
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index be79c793213a5..89c6516c5ba90 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -56,6 +56,14 @@ dsp_vdev0buffer: memory@94300000 {
>  			reg = <0 0x94300000 0 0x100000>;
>  			no-map;
>  		};
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
>  	};
>  
>  	reg_usdhc2_vmmc: usdhc2-vmmc {

-- 
Regards,

Laurent Pinchart

