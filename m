Return-Path: <linux-media+bounces-36036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF4AEA61F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FF7B3A3D73
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1612EF676;
	Thu, 26 Jun 2025 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D8BCQ7oP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398C2F1FDA;
	Thu, 26 Jun 2025 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964988; cv=none; b=E39XEO9vKq4EXRXnyVbyRUo9fbI8kt9f6c4QSClz7Hf1HTiqzL8CQWqkpuLghz6O2VX6JWQi23Ow8bV3rjVhQ93weRSr62kX2eYLOf3b8gBxVW/q2Wn0EF8W2C3oDOS4j5q6v1wMlGcQtaptXvMaIgcEjG5Rw3utv5DzDw/ibxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964988; c=relaxed/simple;
	bh=l7EDQVT0SJKGylYNXzHGYLXTLSFmgtku9oGrEbj3J/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfW4+jaFp7d0A3ncPueaU/rFb3XJ5+WQkfbz7vdJ2bk/sEZn9n5JtUEJGN0Bd6//1xNC29I7IjF1VX26LCF8h6y4cqa3IOFdszXsl3+nde95IMsY8NAQkQCZlmNlvmp3ezFa7tawtglUwhSmA3tXP50OW1CD4+eKaNqDZRCuptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D8BCQ7oP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 610A56A6;
	Thu, 26 Jun 2025 21:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750964966;
	bh=l7EDQVT0SJKGylYNXzHGYLXTLSFmgtku9oGrEbj3J/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8BCQ7oPvhWGMEE+DLalhWjT4PAF38zvbm9wDGwjy92h3r3IVVZdbyauAJ2uq7YXU
	 o5msoQe4aKbZ3RoWZqnzD8xxAB3GTwXS0Rzd3wUaOCQZRnb+HTB2lt+aEAVR4CiZ/e
	 V4ywWmhqYbLZ3l+dlGMOkKUicE+FBgSyx8lw9Bcg=
Date: Thu, 26 Jun 2025 22:09:22 +0300
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
Message-ID: <20250626190922.GC30016@pendragon.ideasonboard.com>
References: <20250623-ap1302-v3-0-c9ca5b791494@nxp.com>
 <20250623-ap1302-v3-2-c9ca5b791494@nxp.com>
 <20250623224701.GE15951@pendragon.ideasonboard.com>
 <aFryrpyDByI6wu5b@lizhi-Precision-Tower-5810>
 <20250624185643.GE20757@pendragon.ideasonboard.com>
 <aFr6Ehpl5Kk+nt7m@lizhi-Precision-Tower-5810>
 <20250626124224.GK8738@pendragon.ideasonboard.com>
 <aF1gKGjpbEPZYBr2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aF1gKGjpbEPZYBr2@lizhi-Precision-Tower-5810>

On Thu, Jun 26, 2025 at 10:58:48AM -0400, Frank Li wrote:
> On Thu, Jun 26, 2025 at 03:42:24PM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 24, 2025 at 03:18:42PM -0400, Frank Li wrote:
> > > On Tue, Jun 24, 2025 at 09:56:43PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Jun 24, 2025 at 02:47:10PM -0400, Frank Li wrote:
> > > > > On Tue, Jun 24, 2025 at 01:47:01AM +0300, Laurent Pinchart wrote:
> > > > > > On Mon, Jun 23, 2025 at 03:17:38PM -0400, Frank Li wrote:
> > > > > > > From: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > >
> > > > > > > The AP1302 is a standalone ISP for ON Semiconductor sensors.
> > > > > > > AP1302 ISP supports single and dual sensor inputs. The driver
> > > > > > > code supports AR1335, AR0144 and AR0330 sensors with single and
> > > > > > > dual mode by loading the corresponding firmware.
> > > > > > >
> > > > > > > Signed-off-by: Anil Kumar Mamidala <anil.mamidala@xilinx.com>
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > > > Signed-off-by: Stefan Hladnik <stefan.hladnik@gmail.com>
> > > > > > > Signed-off-by: Florian Rebaudo <frebaudo@witekio.com>
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > > Change in v3:
> > > > > > > - add extra empty line between difference register define
> > > > > > > - add bits.h
> > > > > > > - use GEN_MASK and align regiser bit define from 31 to 0.
> > > > > > > - add ap1302_sensor_supply
> > > > > > > - add enable gpio
> > > > > > > - update firmware header format
> > > > > >
> > > > > > One of the main issues with this driver is that we need to standardize
> > > > > > the header format. The standardized format will need to be approved by
> > > > > > onsemi as we will need to provide not just a driver, but also a
> > > > > > toolchain that will produce firmwares in the right format. Furthermore,
> > > > > > some time ago the AP1302 firmware was extended with the ability to
> > > > > > dynamically compute PLL parameters IIRC. This needs to be taken into
> > > > > > account.
> > > > >
> > > > > It is quite common when work with firmwares. Generally, it need version
> > > > > information at header.
> > > > >
> > > > > The driver need check firmware's API version, if miss match or incompatible,
> > > > > just return and report error.
> > > > >
> > > > > we can't assume firmware always align driver code because many user just
> > > > > update kernel without update rootfs or firmware package.
> > > >
> > > > Sure, but that's not the point. The point is that there are multiple
> > > > out-of-tree ap1302 driver versions, developed or adapted by different
> > > > SoC vendors. Those variants use firmware files produced by those SoC
> > > > vendors, and they not standard.
> > >
> > > I am not sure if firwmare is open source. Most like not.
> >
> > The firmware is not open-source, but I don't think that's relevant.
> >
> > > We need create
> > > difference compatible string for difference Soc vendor.
> >
> > No, that we must absolutely not do :-) If it's the same AP1302 and same
> > camera sensor, we must not have different compatible strings when the
> > AP1302 is connected to an NXP SoC or a MediaTek SoC.
> 
> After read code, firwmare header only used for sanity checks. can remove
> it for initialization version?

No, quite the contrary. We need to standardize a firmware header that
will give us forward compatibility. Versioning of the firmware is a
missing feature for that, and we also need to consider the issue of the
AP1302 clock tree configuration.

> > > > We need to standardize on a firmware
> > > > format to upstream a driver, and that standardization needs to involve
> > > > the device manufacturer.
> > >
> > > we need workable version (easy extend) firstly, when let other vendor follow.
> > >
> > > Frank Li
> > > >
> > > > > > I want to resuscitate this driver and get it merged. There's more work
> > > > > > to do, in collaboration with onsemi, and I haven't had time to tackle
> > > > > > it. If you want to propose a proper design for firmware handling I would
> > > > > > be happy to participate in the discussion.
> > > > >
> > > > > who is onsemi contact windows.
> > > > >
> > > > > > > - update raw sensor supply delay time
> > > > > > > - use gpiod_set_value_cansleep() insteand gpiod_set_value()
> > > > > > > - update use latest v4l2 api
> > > > > > > - use ctrl_to_sd() helper function
> > > > > > > - add ap1302_g_volatile_ctrl()
> > > > > > > - remove ap1302_get_fmt()
> > > > > > > - use guard for mutex.
> > > > > > > - use dev_err_probe
> > > > > > > - use devm_add_action_or_reset to simple error handle at probe.
> > > > > > > - use read_poll_timeout() simple dma idle polling.
> > > > > > >
> > > > > > > previous upstream:
> > > > > > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> > > > > > > ---
> > > > > > >  MAINTAINERS                |    1 +
> > > > > > >  drivers/media/i2c/Kconfig  |    9 +
> > > > > > >  drivers/media/i2c/Makefile |    1 +
> > > > > > >  drivers/media/i2c/ap1302.c | 2838 ++++++++++++++++++++++++++++++++++++++++++++
> > > > > > >  4 files changed, 2849 insertions(+)
> > > > > >
> > > > > > [snip]

-- 
Regards,

Laurent Pinchart

