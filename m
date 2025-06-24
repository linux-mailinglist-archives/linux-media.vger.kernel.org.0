Return-Path: <linux-media+bounces-35824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8EAE6EFB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A12B217ED4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B892E7631;
	Tue, 24 Jun 2025 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TFQb859B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2B26CE3E;
	Tue, 24 Jun 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791426; cv=none; b=m8kAh8dbfSyashy4J724AgdtFMdqcmV24zMUHy+DUczkHGEuiLbFtkXpipw9BYxDrlN2hUwfksa6irYIH9IeYPAPlix0JFG+C/nTyDLwuACNfHtmUaSWWdq+NP7/2Bn8TJ8e3PI7OxpiC8gbionJc52QRSEz5qsVWH7c0V5WYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791426; c=relaxed/simple;
	bh=Wj1BVQK4pHNQLQ0sMBbbYrIKkTxSc9PFKwokZoPHlXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl9uD+sJftKABcSLKxs1PAVC8I0hZljERq94QA7F6G3Qy5ckN0vcXg9xx5EotiHo9eqB08KSnbSWvMFKVilivFFWTm5lr+tSJkDJNKDNbdET6yS8BgRUOqIoab/H4FeKMv9+H9ofJQU8OB0J0QeAtgHzkiPXPg2SN76If1kc8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TFQb859B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CB68F6F3;
	Tue, 24 Jun 2025 20:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750791406;
	bh=Wj1BVQK4pHNQLQ0sMBbbYrIKkTxSc9PFKwokZoPHlXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFQb859B027xRHDYUGWO+lbI9pismOo1t9AZDi6IrXt6n/HL/2r0kQfQZXnsPfrDZ
	 cLzxg6MgXfTkO4snHwWus+L9ei6IhUTwAfMsunrdo+DfZR/QplxFevAGOyqrZQbYKL
	 pBbfZiUGOze2K+GgWf8gyf/FweiSdpn1dsYsoTqw=
Date: Tue, 24 Jun 2025 21:56:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20250624185643.GE20757@pendragon.ideasonboard.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
 <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>

On Tue, Jun 24, 2025 at 02:47:10PM -0400, Frank Li wrote:
> On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > >
> > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > AP1302 ISP supports single and dual sensor inputs. The driver
> > > code supports AR1335, AR0144 and AR0330 sensors with single and
> > > dual mode by loading the corresponding firmware.
> > >
> > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v3:
> > > - add extra empty line between difference register define
> > > - add bits.h
> > > - use GEN_MASK and align regiser bit define from 31 to 0.
> > > - add ap1302_sensor_supply
> > > - add enable gpio
> > > - update firmware header format
> >
> > One of the main issues with this driver is that we need to standardize
> > the header format. The standardized format will need to be approved by
> > onsemi as we will need to provide not just a driver, but also a
> > toolchain that will produce firmwares in the right format. Furthermore,
> > some time ago the AP1302 firmware was extended with the ability to
> > dynamically compute PLL parameters IIRC. This needs to be taken into
> > account.
> 
> It is quite common when work with firmwares. Generally, it need version
> information at header.
> 
> The driver need check firmware's API version, if miss match or incompatible,
> just return and report error.
> 
> we can't assume firmware always align driver code because many user just
> update kernel without update rootfs or firmware package.

Sure, but that's not the point. The point is that there are multiple
out-of-tree ap1302 driver versions, developed or adapted by different
SoC vendors. Those variants use firmware files produced by those SoC
vendors, and they not standard. We need to standardize on a firmware
format to upstream a driver, and that standardization needs to involve
the device manufacturer.

> > I want to resuscitate this driver and get it merged. There's more work
> > to do, in collaboration with onsemi, and I haven't had time to tackle
> > it. If you want to propose a proper design for firmware handling I would
> > be happy to participate in the discussion.
> 
> who is onsemi contact windows.
> 
> > > - update raw sensor supply delay time
> > > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > > - update use latest v4l2 api
> > > - use ctrl_to_sd() helper function
> > > - add ap1302_g_volatile_ctrl()
> > > - remove ap1302_get_fmt()
> > > - use guard for mutex.
> > > - use dev_err_probe
> > > - use devm_add_action_or_reset to simple error handle at probe.
> > > - use read_poll_timeout() simple dma idle polling.
> > >
> > > previous upstream:
> > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > ---
> > >  MAINTAINERS                |    1 +
> > >  drivers/media/i2c/Kconfig  |    9 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 2849 insertions(+)
> >
> > [snip]

-- 
Regards,

Laurent Pinchart

