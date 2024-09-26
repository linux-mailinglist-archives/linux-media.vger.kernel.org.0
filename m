Return-Path: <linux-media+bounces-18604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3D986F87
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B33B31F25063
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6CD1A7ADF;
	Thu, 26 Sep 2024 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bM3gB8nU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C7208CA;
	Thu, 26 Sep 2024 09:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727341483; cv=none; b=b5BrNKUd46bNnyA6IoGJ2xKnXyWyC/6t2FiCcOAOCZRTqEb6GyyHJGFM3FIVXNAbEghDXaBTAXsJDppR6opEDcBlmCKLsO5ITAQ02X/Lk0yRbNJh8jkK6qqvchNlU8yQoCAtKQIu6mjreuPkxB3OxMoopyN7iNfmwbGUkUAI8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727341483; c=relaxed/simple;
	bh=di2rL5GeXYpO0V4uTOsJz4GFmNmDIN3da4xmQ9fk8GI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UegS8ruHt0xyx+In24Y1JQI/38tzHFBo3/qlXpibfs+QxjKzsQPa7zjheCX8ylNfU6KVXOFDvZPXFMj+KiSS0g+aWlus5pJwwT0MnMRj4cm4AwU43XQZcHc4zgVVWrEaurhPI2tTd7EKfQT2lSkYFZIarQPjZRivObNXG6L/M5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bM3gB8nU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-229.net.vodafone.it [5.90.51.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 883DC8D4;
	Thu, 26 Sep 2024 11:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727341391;
	bh=di2rL5GeXYpO0V4uTOsJz4GFmNmDIN3da4xmQ9fk8GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bM3gB8nUyh5eV5Z5HCch6mMxBZW+JATtWYP/hiQrjV6uKPtjAA20hFUHLJdIEwRfH
	 Wowr807WRIAsu7i21zsc6UZu/uIozBxjh994yA4RTk/yKXEceSMiXCMHfKW4+vZ7hQ
	 uYYX4Rva+2K2pKzj+BBJUPtF2bBLKycYm6SASsDc=
Date: Thu, 26 Sep 2024 11:04:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v5 0/4] media: raspberrypi: Support RPi5's CFE
Message-ID: <yj5zt4a275pjedrxvs4ys2wgp5heblisihal6jrqdryoq3ydph@6rriiytwpkpq>
References: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
 <fe968dc7-67a5-40be-871e-fe682dc60d70@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fe968dc7-67a5-40be-871e-fe682dc60d70@ideasonboard.com>

Hi Tomi

On Thu, Sep 26, 2024 at 10:13:29AM GMT, Tomi Valkeinen wrote:
> Hi,
>
> On 10/09/2024 11:07, Tomi Valkeinen wrote:
> > This series adds support to the CFE hardware block on RaspberryPi 5. The
> > CFE (Camera Front End) contains a CSI-2 receiver and Front End, a small
> > ISP.
> >
> > To run this, you need the basic RPi5 kernel support plus relevant dts
> > changes to enable the cfe and camera. My work branch with everything
> > needed to run CFE can be found from:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git rp1-cfe
> >
> > A few notes about the patches:
> >
> > - The original work was done by RaspberryPi, mostly by Naushir Patuck.
> > - The second video node only sets V4L2_CAP_META_CAPTURE instead of both
> >    V4L2_CAP_META_CAPTURE and V4L2_CAP_META_CAPTURE like the other nodes.
> >    This is a temporary workaround for userspace (libcamera), and
> >    hopefully can be removed soon.
> >
> > I have tested this with:
> > - A single IMX219 sensor connected to the RPi5's CSI-2 port
> > - Arducam's UB960 FPD-Link board with four imx219 sensors connected
> >
> >   Tomi
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> > Changes in v5:
> > - Add "depends on PM". The platforms that use CFE will always have PM in
> >    practice, and it's not worth supporting both the PM and !PM cases as
> >    it adds complexity to the driver.
> > - Link to v4: https://lore.kernel.org/r/20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com
>
> Is this solution to the PM issue ok for everyone? It feels most sensible to
> me. Any other comments?

There was consensus at the media summit that platform drivers are
allowed to depend on PM.

I'll do the same for my latest PiSP BE series.

>
>  Tomi
>
> > Changes in v4:
> > - Drop unnecessary clock-lanes from the DT bindings
> > - Drop unnecessary linux-media from MAINTAINERS entry
> > - Drop unnecessary conversion to bool with !!
> > - Don't set cap->bus_info in cfe_querycap()
> > - Make debugfs files not readable by the world
> > - Check the return value of v4l2_fwnode_endpoint_parse()
> > - Remove the code dealing with remote_ep_fwnode. Instead use
> >    v4l2_create_fwnode_links_to_pad() and media_pad_remote_pad_unique() to
> >    create the link and get the pad index.
> > - Add cfe/csi2/fe/dphy argument to the respective dbg/info/err print
> >    macros.
> > - Drop some debug prints and add a few, clarifying the prints for
> >    enabling and disabling the streams.
> > - Some cosmetic changes (linefeed, drop unnecessary assignment, move a
> >    define)
> > - Link to v3: https://lore.kernel.org/r/20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com
> >
> > Changes in v3:
> > - Based on v6.11-rc3. The PiSP BE series is now in upstream so no extra
> >    dependencies are needed.
> > - Fixed cfe_remove() return value, as the .remove hook has changed
> > - Added Krzysztof's Rb.
> > - Link to v2: https://lore.kernel.org/r/20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com
> >
> > Changes in v2:
> > - Change the compatible string back to raspberrypi,rp1-cfe from raspberrypi,rpi5-rp1-cfe
> > - Drop the references to rp1 headers in the DT binding example. This
> >    allows compiling the example without the rp1 support.
> > - Fix missing remap lines for mono formats
> > - Fix csi2_pad_set_fmt() so that the format can be changed back to the
> >    sink's format from 16-bit or compressed format.
> > - Link to v1: https://lore.kernel.org/r/20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com
> >
> > ---
> > Tomi Valkeinen (4):
> >        media: uapi: Add meta formats for PiSP FE config and stats
> >        dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
> >        media: raspberrypi: Add support for RP1-CFE
> >        media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)
> >
> >   .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
> >   .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
> >   Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
> >   .../bindings/media/raspberrypi,rp1-cfe.yaml        |   93 +
> >   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
> >   .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
> >   MAINTAINERS                                        |    7 +
> >   drivers/media/platform/raspberrypi/Kconfig         |    1 +
> >   drivers/media/platform/raspberrypi/Makefile        |    1 +
> >   drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   15 +
> >   .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
> >   .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
> >   .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
> >   drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2487 ++++++++++++++++++++
> >   drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
> >   drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
> >   drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
> >   drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  180 ++
> >   drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
> >   .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
> >   .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
> >   drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> >   .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
> >   .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
> >   include/uapi/linux/videodev2.h                     |    2 +
> >   25 files changed, 5181 insertions(+)
> > ---
> > base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
> > change-id: 20240314-rp1-cfe-142b628b7214
> >
> > Best regards,
>
>

