Return-Path: <linux-media+bounces-40302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92288B2C9F6
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C867D3B3547
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923BA1DED77;
	Tue, 19 Aug 2025 16:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyCEA3rR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67944283C87;
	Tue, 19 Aug 2025 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622005; cv=none; b=LLAlkNwO4K57bEhBKaqS3TqogPC4mHE99le/XdR1NlsN+gJazP7nwMRAGQzexHpblrWqdmhJVrBQSCBiiAA5kpy74FD0/k4wcZm+lXt1QS9106I1Gyc3bz+IlbEZ2gVdvm4s95A6nAIRJiYbdxx5ZA8hRNzDqOBhsFAlyTubIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622005; c=relaxed/simple;
	bh=gJlCbtML3/hYLPe1GeD4TuTAglGALBUIYnsjaTlV7b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMzt8ukFTna0pb+uTj5NYofBXHymQkJDdhqlB7mg4O9MrQcKnD+rajQdSJ1/PoP5u0arBm7/ET0upqFaNnVpy3jgun5eCDgYTlOAnPXPNsnK0jLw1/7ngqW8j4CLNKV9iMmrhK96X2tAf6ag2TBbul8X3UtWLE9x0oElmfouhDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyCEA3rR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755622004; x=1787158004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gJlCbtML3/hYLPe1GeD4TuTAglGALBUIYnsjaTlV7b4=;
  b=eyCEA3rROmmN2FsjLM69oXtYtuEa7rmGSieeFwpNawu1bCjWyE8bOqoT
   ggEyDrLsqm5jt9HibkXFccAgeggype/5wusCgQCQnxcKHLf2SlkROgXC6
   uf4fJiHaH/7doYL6PZclK8I8sfyqoYa9Xq30ze1AkIbEgtGkZ+zvkbGkd
   zX07Al66wNDdm6P1L67WrMzZijVx8O65qT68voJkI4ksQsApBd6M/ScT+
   IJbAvrhVEHjseFC3AmMCtzxklOOtcUgllo8zDZ1AE4sXEtOcSFUyzBCh6
   qt6kuNkuCOzmx7otflbqLq/ofTpgmow0EI8Y8SN/991H5ATfAtnnNl/Ul
   g==;
X-CSE-ConnectionGUID: zBNFfusJT8KG3/muG3iBUQ==
X-CSE-MsgGUID: GhhwPI3cSXqyI3gnH+qCqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61706165"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="61706165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 09:46:43 -0700
X-CSE-ConnectionGUID: R+JSMxuVTImX1WWpIWSi/A==
X-CSE-MsgGUID: hNi8ogtaSYuLdJCpLMDC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="205044336"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 09:46:37 -0700
Date: Tue, 19 Aug 2025 18:46:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 08/13] media: rockchip: rkcif: add support for mipi
 csi-2 capture
Message-ID: <rpaa2jspgmw3do5y367kq4pvvtpboeu7gjd4chmh6pgztmj6ar@ckh7jxvfuhlg>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
 <20240220-rk3568-vicap-v10-8-62d8a7b209b4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v10-8-62d8a7b209b4@collabora.com>

Hi Michael,

I am seeing IOMMU page faults: See below.

On Tue, Aug 19, 2025 at 01:26:00AM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
> interface that can receive video data and write it into system memory
> using the ping-pong scheme. Add support for it.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[..]

>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  {
> +	struct device *dev = ctx;
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
>  	irqreturn_t ret = IRQ_NONE;
> +	u32 intstat;
> +
> +	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
> +		struct rkcif_interface *interface = &rkcif->interfaces[index];
> +
> +		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
> +
> +		for (unsigned int j = 0; j < interface->streams_num; j++) {
> +			struct rkcif_stream *stream = &interface->streams[j];

In the TRM you can see in the MIPI_INTSTAT interrupts to detect
overflows: why not activate them ?

something like this:

#define RKCIF_MIPI_INT_Y_OVERFLOW(id)          BIT(16)
#define RKCIF_MIPI_INT_UV_OVERFLOW(id)         BIT(17)
#define RKCIF_MIPI_INT_FIFO_OVERFLOW(id)       BIT(18)
#define RKCIF_MIPI_INT_CSI2RX_FIFO_OVERFLOW(id)        BIT(20)

and then OR them with the int_mask in rkcif_mipi_start_streaming()

and then you can log the err if something happened ?

> +
> +			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
> +			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
> +				ret = IRQ_HANDLED;
> +
> +				if (stream->stopping) {
> +					rkcif_mipi_stop_streaming(stream);
> +					wake_up(&stream->wq_stopped);
> +					continue;
> +				}
> +
> +				rkcif_stream_pingpong(stream);
> +			}
> +		}
> +	}
>  
>  	return ret;
>  }

Now to the IOMMU page faults:

Camera Sensor: IMX219
Frame Size: 1920x1080
Format: SRGGB10P

Packed SRGGB10
--> Every four consecutive samples are packed into 5 bytes
--> Stride = 2400 bytes (1920 * 5/4)

So the imagesize = 1080 * 2400 = 2 592 000

in __vb2_buf_mem_alloc() the size of the buf will be PAGE_ALIGNED in:
PAGE_ALIGN(vb->planes[plane].length);

So we allocate a buffer with the size: 2 592 768 -> hex = 0x297000

In rkcif_mipi_queue_buffer():
We will queue a total of two buffers to the HW (2 because of pingpong)
The first buffer will have the address: 0x00000000ffc00000

We start to capture and then this happens:

rk_iommu fdfe0800.iommu: Page fault at 0x00000000ffe79000 of type write
rk_iommu fdfe0800.iommu: iova = 0x00000000ffe79000: dte_index: 0x3ff pte_index: 0x279 page_offset: 0x0
rk_iommu fdfe0800.iommu: mmu_dte_addr: 0x0000000012cc8000 dte@0x0000000012cc8ffc: 0x11a0d001 valid: 1 pte@0x0000000011a0d9e4: 0x31b79006 valid: 0 page@0x0000000000000000 flags: 0x0

With:
0xffe79000 = 0xffc00000 (buffer address) + 0x297000 (buffersize)

--> So the VICAP is overflowing the buffer even though everything was
correctly configured ?! (If I understood everything correctly ofc.)

I also see the same problem with the SRGGB8 format. It also happens in
the downstream Radxa/Rockchip Kernel.

Do you see the same problem ?

--
Kind Regards
Mehdi Djait

