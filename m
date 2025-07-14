Return-Path: <linux-media+bounces-37718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1FB04976
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DA21A637A0
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA96422FE0E;
	Mon, 14 Jul 2025 21:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrCtW2o+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132882397BF;
	Mon, 14 Jul 2025 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528312; cv=none; b=S9FX7mxqMHpYqrv3kmz4+MnwbALGVRE6c2dDoEaV5s//EMqiqhKUsPUHCak1JnMTPjlw0rcWbqOhf20zmBi2aTGsp7csNmNMuiUXZYeBZiHwci/Q89iU00Nr2nJPxJj27YDVAIZMwlMElLC364NpcQLwOKX4d+wJ7lrnCBZiBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528312; c=relaxed/simple;
	bh=b9BS5SuhpnpfhpBqkFecFWoYS4AXrJnOWQBm51fbwPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXBYC/stsasS3GMZTReuQQEd3AEjZTjohwBZvT31vqCl558kgXLwwm+ELi8mqiGL2a+2ca/L4u06b9/L5S8j5KC3ZyRnLP9ECn4fQgmRUASAtr7JvYJ8YW6Lc4SU/Fd0tVy9MdrLOSFgJmuLLiSdpNfWUmz9w4xlLyWnT/hBysQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrCtW2o+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8367EC4CEED;
	Mon, 14 Jul 2025 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528311;
	bh=b9BS5SuhpnpfhpBqkFecFWoYS4AXrJnOWQBm51fbwPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DrCtW2o+Cg3AuKLuivXpz0UEOzfwogaMgn7S68rRCsQlX91c2avHcF1JrOgrv8K3u
	 7lIAEMPSBknsrpvrS7ekAEwSanvLX++uC6606gbo274AndqbjXFM8NXSvFlPFKZRgL
	 DfiVARwSFHEWyOadeF89Eb6DHAK1U2zl+fKVshYLjQhfXWXFd6zpKKHPHPryl061wg
	 WXzNDzDmSXlsv92BLtmZOM5a2R65b2MO17gC1clN6RdPPV2tZraahe7ueS+O+mL9A1
	 VvrcQJenJWeQvxFz6vkfmfcJsUyfe+81U0vokSzWuBIBmo0BKiGxdX4izDNJPUaRLA
	 2CFNOOIQTQXuQ==
Date: Mon, 14 Jul 2025 16:25:10 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 07/19] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250714212510.GA3193902-robh@kernel.org>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-7-bc20e460e42a@ideasonboard.com>

On Mon, Jul 14, 2025 at 04:06:33PM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v11:
> 
> 	- Dropped in arm,inline_mode property. This is now identical to the
> 	  reviewed version 8, so I have kept the tags on there.

[...]

> +  arm,inline_mode:
> +    description:
> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
> +      or driven through a DMA input device. This property declares the ISP as
> +      being electrically connected to the source of image data.
> +    type: boolean

Except you didn't drop it.

Rob


