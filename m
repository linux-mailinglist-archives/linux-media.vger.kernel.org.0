Return-Path: <linux-media+bounces-36051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D7AEAAE3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 203581C42E65
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 23:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C6A2264D9;
	Thu, 26 Jun 2025 23:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQIWuhfn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31501459FA;
	Thu, 26 Jun 2025 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981960; cv=none; b=oVLpudsIj4Vb29dYik6/V0SlfP8CKAt1AGKPnZsrwv7NHhOp9+/X9MSBm5BUoeKnzk4fLjTDdnrbYRFwSayeLJJ/SfRYXQQ/m3StTha+OxA+ZaNKLOSq26+JW+fImsrVXcy6QjbNsqmVG6LP/TUPp4cNlShXenUTlP3EoblOCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981960; c=relaxed/simple;
	bh=ZxLV4G+O95ARoc1/TgcY2HO2AQAHxbGnjaq4NCjrnDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAlQVNbhxHewLXPaLfvk37otqOEAruG8feOQcee9XDvl6QMIm5Tu7JfJv8nG4NjNw2xStfkX361QCHDHygvL6zeCcYJ++eX+9Riq+9Y/T/Xdk7+vmX4kme1X3i8UCOdVFqW1DMwpDnN/OTtN0XFT10FOEUuyb17B9DrE5NXowAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQIWuhfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA6FC4CEEB;
	Thu, 26 Jun 2025 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981959;
	bh=ZxLV4G+O95ARoc1/TgcY2HO2AQAHxbGnjaq4NCjrnDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQIWuhfnQlq2cbRNwq3T3MiRpgtFpVMcnzdWlb/Mu0S92pVYhHhYEPTMNQn9Iv/MU
	 HYyes57/+l+9h8Qz9ttZ0ulwG7GThEK/CTczLAvziB9YLu5TCbAEFjQbZP5D36YDS5
	 l+xZ0H7nJq7C+n8pGIdzVJ6OniCEWTfmuKqR73RlEmQmIyyWRHPrXdwCGBPGI3QMds
	 2SWRTlCDmepTIDZLV084HUcXoq5urx7EC/EffrZSxNv1UjoPh8h5lvoDQBeyCStWfr
	 rmw7yaZPQ6wSCh0ElzkZiQ7jwL7Fx7Bdvv41RLZ386VsnQeNUoNOS6THUxGxe4rtVa
	 VYy2eU6Zz0/KQ==
Date: Thu, 26 Jun 2025 18:52:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, Dafna Hirschfeld <dafna@fastmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/6] dt-bindings: media: rkisp1: Require pclk clock on
 i.MX8MP variant
Message-ID: <175098195754.1429208.8834973456125690890.robh@kernel.org>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-2-laurent.pinchart@ideasonboard.com>


On Mon, 16 Jun 2025 04:11:10 +0300, Laurent Pinchart wrote:
> The ISP integrated in the NXP i.MX8MP requires the pclk clock to access
> the HDR stitching registers. Make it mandatory in the DT binding.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


