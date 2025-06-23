Return-Path: <linux-media+bounces-35710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6BAE5794
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 00:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EEA47AB5CC
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 22:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A179E227EA4;
	Mon, 23 Jun 2025 22:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q3XYhwpu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C108219301;
	Mon, 23 Jun 2025 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718845; cv=none; b=rDAx3CA9H3/kUqqLXUoEfCa+PxuKP97i1vg5JDLQAqD0jc4l/IZ1vbKEWNSCByuC6A/G4vyIKnLxR1UGJMsziCkvjsLw82JLm/z0HYuLq9QgHcOyk/bCKRuHf2xR+dR6HNf0kXXQZ/+ia7pQWpF7IDLDdLDmVwSULiZWOhk+n9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718845; c=relaxed/simple;
	bh=F0Eful+LsC18qHuUWUpPOReAr7tTH2VPyfj+njae52A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WanKwQ/Z10z2ddhln1ECLV5uHHjZMKFBPVBDSZoru7n3MzRle7iK20YTkW9saWbSur2olmZJ4moG2t4NQ9cNqyNdoSAKDTWp0he9U/YCG+rSIYTsbkx5AvHmImnAYZcJANz/aPNV7iayT7rolhvXx2Tqj2vzt0ZgkfDCAx+tHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q3XYhwpu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6739FD77;
	Tue, 24 Jun 2025 00:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750718824;
	bh=F0Eful+LsC18qHuUWUpPOReAr7tTH2VPyfj+njae52A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3XYhwpuqK0L+qXf1fWK9gwowy4XCVUHuCVlFzCmRdfy2X0UvLLwlc0AYCc8hKp2o
	 bZNJ/0p65erJO9q7Rig5OR+oqdTlGtgAsmSzo0Jx0MDPpqmFAw5BxjjeIqwigHRFbe
	 k/bvmAhvpIzZPtDbOS36WYcNcxOHOHVMIILyyMkM=
Date: Tue, 24 Jun 2025 01:47:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar M <anil.mamidala@xilinx.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, "Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Stefan Hladnik <stefan.hladnik@gmail.com>,
	Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v3 2/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <20250623224701.GE15951@pendragon.ideasonboard.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> 
> The AP1302 is a standalone ISP for ON Semiconductor sensors.
> AP1302 ISP supports single and dual sensor inputs. The driver
> code supports AR1335, AR0144 and AR0330 sensors with single and
> dual mode by loading the corresponding firmware.
> 
> Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change in v3:
> - add extra empty line between difference register define
> - add bits.h
> - use GEN_MASK and align regiser bit define from 31 to 0.
> - add ap1302_sensor_supply
> - add enable gpio
> - update firmware header format

One of the main issues with this driver is that we need to standardize
the header format. The standardized format will need to be approved by
onsemi as we will need to provide not just a driver, but also a
toolchain that will produce firmwares in the right format. Furthermore,
some time ago the AP1302 firmware was extended with the ability to
dynamically compute PLL parameters IIRC. This needs to be taken into
account.

I want to resuscitate this driver and get it merged. There's more work
to do, in collaboration with onsemi, and I haven't had time to tackle
it. If you want to propose a proper design for firmware handling I would
be happy to participate in the discussion.

> - update raw sensor supply delay time
> - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> - update use latest v4l2 api
> - use ctrl_to_sd() helper function
> - add ap1302_g_volatile_ctrl()
> - remove ap1302_get_fmt()
> - use guard for mutex.
> - use dev_err_probe
> - use devm_add_action_or_reset to simple error handle at probe.
> - use read_poll_timeout() simple dma idle polling.
> 
> previous upstream:
> https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |    9 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 2849 insertions(+)

[snip]

-- 
Regards,

Laurent Pinchart

