Return-Path: <linux-media+bounces-7872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4688D0B8
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 23:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9761F37D6D
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 22:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0142013DBB3;
	Tue, 26 Mar 2024 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIGJNFF8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38531CAAE;
	Tue, 26 Mar 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711491801; cv=none; b=fzcL5cRPiykmW+2uV/i6/ZAMXUpu8M0CmZ3lvNmweXsK8T+NrgUfdwWr/oZBircDRuLlD1xOcd29baeqXG74Eoe2uYWB0LjNWMiqgrKbKfMqLCTCYYVCFtC+Jp4P6KwQLGkE9qVTmm3dXpKiLX0fFnbdiBcDxUUnrFquKu3U9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711491801; c=relaxed/simple;
	bh=5BHbrvxhcFzpUND/n27sdrI746sUxVj73bYLaNp8Vfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owd/miLcMFQZlw6Ut3tQEbC6uo6VUYvOizMoJQe6l1mZ0OQVEacRSc3FljUt5e+LgU6lXGGLKKIcHUB4ZGCagEF/OJlwm0/jn0SpwZNWyQpwtPLOxyuyFFml3A677PVuleQzFOa+V3pfe5KrHchFPgo+dvhKQnqdbpp0kcULuDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIGJNFF8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711491799; x=1743027799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5BHbrvxhcFzpUND/n27sdrI746sUxVj73bYLaNp8Vfk=;
  b=dIGJNFF8RUu+Vji7Gqg1iXaLl5HZi+8IyhK72YX798h4lL1BJgzhxTfp
   23ECcs1t3Ax9sl5fvPbx/rQtV57lrRD8Jbj7aDzCjdTjhsol5czfhBCVx
   cb2FPNvnJvb3LeoTK2w3LTeHxRjGJRv1ExnBVjg6hy3kI7x/B5edd6eKD
   8ZROerRW19m05NkeGThjDhUFcExA2cyJUbdS7MBWl1wp/DAcZvc/YhuWf
   rA16iMrFTe3/pJ79IJLaANcH5Gk6QT6oTuXXz8zUf6BieWYkWHTwUrWHZ
   s5ZvKLgGUgLvA8LOtMyJIwk5dsYc2DC1MAFYScF1ILT7DXXzy7zQMTqLv
   g==;
X-CSE-ConnectionGUID: kzpOlJIGSg++aWzDhrTBfQ==
X-CSE-MsgGUID: co9xIlLHSfKEBr8S20U8sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6432647"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6432647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16487522"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 15:23:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C97F611F8B1;
	Wed, 27 Mar 2024 00:23:10 +0200 (EET)
Date: Tue, 26 Mar 2024 22:23:10 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>, kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/15] media: bcm2835-unicam: Add support for
 CCP2/CSI2 camera interface
Message-ID: <ZgNKzkExXEXyh2Hd@kekkonen.localdomain>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <ZgHEQTHZlRr_Rz6K@kekkonen.localdomain>
 <20240326013708.GA31396@pendragon.ideasonboard.com>
 <20240326015028.GB31396@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326015028.GB31396@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Mar 26, 2024 at 03:50:28AM +0200, Laurent Pinchart wrote:
> On Tue, Mar 26, 2024 at 03:37:09AM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > On Mon, Mar 25, 2024 at 06:36:49PM +0000, Sakari Ailus wrote:
> > > On Fri, Mar 01, 2024 at 11:32:24PM +0200, Laurent Pinchart wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > 
> > > > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > > > It is represented as two video device nodes: unicam-image and
> > > > unicam-embedded which are connected to an internal subdev (named
> > > > unicam-subdev) in order to manage streams routing.
> > > > 
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > Thanks for submitting this, it's the cleanest and neatest Unicom driver
> > 
> > Unicam, or if you insist Unicorn, but not Unicom :-)

A Unicorn driver? Hmm. Maybe Unicam is indeed the best choice here?

> > 
> > > I've ever seen!
> > > 
> > > Some mostly unimportant comments below, however the bus-type issue needs to
> > > be addressed.
> > > 
> > > > ---
> > > > Changes since v5:
> > > > 
> > > > - Move to drivers/media/platform/broadcom/
> > > > - Port to the upstream V4L2 streams API
> > > > - Rebase on latest metadata API proposal
> > > > - Add missing error message
> > > > - Drop unneeded documentation block for unicam_isr()
> > > > - Drop unneeded dev_dbg() and dev_err() messages
> > > > - Drop unneeded streams_mask and fmt checks
> > > > - Drop unused unicam_sd_pad_is_sink()
> > > > - Drop unneeded includes
> > > > - Drop v4l2_ctrl_subscribe_event() call
> > > > - Use pm_runtime_resume_and_get()
> > > > - Indentation and line wrap fixes
> > > > - Let the framework set bus_info
> > > > - Use v4l2_fwnode_endpoint_parse()
> > > > - Fix media device cleanup
> > > > - Drop lane reordering checks
> > > > - Fix subdev state locking
> > > > - Drop extra debug messages
> > > > - Move clock handling to runtime PM handlers
> > > > - Reorder functions
> > > > - Rename init functions for more clarity
> > > > - Initialize runtime PM earlier
> > > > - Clarify error messages
> > > > - Simplify subdev init with local variable
> > > > - Fix subdev cleanup
> > > > - Fix typos and indentation
> > > > - Don't initialize local variables needlessly
> > > > - Simplify num lanes check
> > > > - Fix metadata handling in subdev set_fmt
> > > > - Drop manual fallback to .s_stream()
> > > > - Pass v4l2_pix_format to unicam_calc_format_size_bpl()
> > > > - Simplify unicam_set_default_format()
> > > > - Fix default format settings
> > > > - Add busy check in unicam_s_fmt_meta()
> > > > - Add missing \n at end of format strings
> > > > - Fix metadata handling in subdev set_fmt
> > > > - Fix locking when starting streaming
> > > > - Return buffers from start streaming fails
> > > > - Fix format validation for metadata node
> > > > - Use video_device_pipeline_{start,stop}() helpers
> > > > - Simplify format enumeration
> > > > - Drop unset variable
> > > > - Update MAINTAINERS entry
> > > > - Update to the upstream v4l2_async_nf API
> > > > - Update to the latest subdev routing API
> > > > - Update to the latest subdev state API
> > > > - Move from subdev .init_cfg() to .init_state()
> > > > - Update to the latest videobuf2 API
> > > > - Fix v4l2_subdev_enable_streams() error check
> > > > - Use correct pad for the connected subdev
> > > > - Return buffers to vb2 when start streaming fails
> > > > - Improve debugging in start streaming handler
> > > > - Simplify DMA address management
> > > > - Drop comment about bcm2835-camera driver
> > > > - Clarify comments that explain min/max sizes
> > > > - Pass v4l2_pix_format to unicam_try_fmt()
> > > > - Drop unneeded local variables
> > > > - Rename image-related constants and functions
> > > > - Turn unicam_fmt.metadata_fmt into bool
> > > > - Rename unicam_fmt to unicam_format_info
> > > > - Rename unicam_format_info variables to fmtinfo
> > > > - Rename unicam_node.v_fmt to fmt
> > > > - Add metadata formats for RAW10, RAW12 and RAW14
> > > > - Make metadata formats line-based
> > > > - Validate format on metadata video device
> > > > - Add Co-devlopped-by tags
> > > > 
> > > > Changes since v3:
> > > > 
> > > > - Add the vendor prefix for DT name
> > > > - Use the reg-names in DT parsing
> > > > - Remove MAINTAINERS entry
> > > > 
> > > > Changes since v2:
> > > > 
> > > > - Change code organization
> > > > - Remove unused variables
> > > > - Correct the fmt_meta functions
> > > > - Rewrite the start/stop streaming
> > > >   - You can now start the image node alone, but not the metadata one
> > > >   - The buffers are allocated per-node
> > > >   - only the required stream is started, if the route exists and is
> > > >     enabled
> > > > - Prefix the macros with UNICAM_ to not have too generic names
> > > > - Drop colorspace support
> > > > 
> > > > Changes since v1:
> > > > 
> > > > - Replace the unicam_{info,debug,error} macros with dev_*()
> > > > ---
> > > >  MAINTAINERS                                   |    1 +
> > > >  drivers/media/platform/Kconfig                |    1 +
> > > >  drivers/media/platform/Makefile               |    1 +
> > > >  drivers/media/platform/broadcom/Kconfig       |   23 +
> > > >  drivers/media/platform/broadcom/Makefile      |    3 +
> > > >  .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
> > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 2607 +++++++++++++++++
> > > >  7 files changed, 2891 insertions(+)
> > > >  create mode 100644 drivers/media/platform/broadcom/Kconfig
> > > >  create mode 100644 drivers/media/platform/broadcom/Makefile
> > > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > 
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e50a59654e6e..cc350729f467 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -4002,6 +4002,7 @@ M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > >  L:	linux-media@vger.kernel.org
> > > >  S:	Maintained
> > > >  F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > > +F:	drivers/media/platform/bcm2835/
> > > >  
> > > >  BROADCOM BCM47XX MIPS ARCHITECTURE
> > > >  M:	Hauke Mehrtens <hauke@hauke-m.de>
> > > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > > index 91e54215de3a..2d79bfc68c15 100644
> > > > --- a/drivers/media/platform/Kconfig
> > > > +++ b/drivers/media/platform/Kconfig
> > > > @@ -67,6 +67,7 @@ source "drivers/media/platform/amlogic/Kconfig"
> > > >  source "drivers/media/platform/amphion/Kconfig"
> > > >  source "drivers/media/platform/aspeed/Kconfig"
> > > >  source "drivers/media/platform/atmel/Kconfig"
> > > > +source "drivers/media/platform/broadcom/Kconfig"
> > > >  source "drivers/media/platform/cadence/Kconfig"
> > > >  source "drivers/media/platform/chips-media/Kconfig"
> > > >  source "drivers/media/platform/intel/Kconfig"
> > > > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > > > index 3296ec1ebe16..da17301f7439 100644
> > > > --- a/drivers/media/platform/Makefile
> > > > +++ b/drivers/media/platform/Makefile
> > > > @@ -10,6 +10,7 @@ obj-y += amlogic/
> > > >  obj-y += amphion/
> > > >  obj-y += aspeed/
> > > >  obj-y += atmel/
> > > > +obj-y += broadcom/
> > > >  obj-y += cadence/
> > > >  obj-y += chips-media/
> > > >  obj-y += intel/
> > > > diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
> > > > new file mode 100644
> > > > index 000000000000..cc2c9afcc948
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/broadcom/Kconfig
> > > > @@ -0,0 +1,23 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +config VIDEO_BCM2835_UNICAM
> > > > +	tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> > > > +	depends on ARCH_BCM2835 || COMPILE_TEST
> > > > +	depends on PM
> > > > +	depends on VIDEO_DEV
> > > > +	select MEDIA_CONTROLLER
> > > > +	select V4L2_FWNODE
> > > > +	select VIDEO_V4L2_SUBDEV_API
> > > > +	select VIDEOBUF2_DMA_CONTIG
> > > > +	help
> > > > +	  Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
> > > > +	  This is a V4L2 driver that controls the CSI-2 receiver directly,
> > > > +	  independently from the VC4 firmware.
> > > > +
> > > > +	  This driver is mutually exclusive with the use of bcm2835-camera. The
> > > > +	  firmware will disable all access to the peripheral from within the
> > > > +	  firmware if it finds a DT node using it, and bcm2835-camera will
> > > > +	  therefore fail to probe.
> > > > +
> > > > +	  To compile this driver as a module, choose M here. The module will be
> > > > +	  called bcm2835-unicam.
> > > > diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
> > > > new file mode 100644
> > > > index 000000000000..03d2045aba2e
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/broadcom/Makefile
> > > > @@ -0,0 +1,3 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > > new file mode 100644
> > > > index 000000000000..84775fd2fac5
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > > @@ -0,0 +1,255 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +
> > > > +/*
> > > > + * Copyright (C) 2017-2020 Raspberry Pi Trading.
> > > 
> > > Anything up to 2024?
> > 
> > Not really. The registers haven't really changed :-) I'll update the
> > copyright in the .c file though.
> > 
> > > > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > + */
> > 
> > [snip]
> > 
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > new file mode 100644
> > > > index 000000000000..716c89b8a217
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -0,0 +1,2607 @@
> > 
> > [snip]
> > 
> > > > +static irqreturn_t unicam_isr(int irq, void *dev)
> > > > +{
> > > > +	struct unicam_device *unicam = dev;
> > > > +	unsigned int lines_done = unicam_get_lines_done(dev);
> > > > +	unsigned int sequence = unicam->sequence;
> > > > +	unsigned int i;
> > > > +	u32 ista, sta;
> > > > +	bool fe;
> > > > +	u64 ts;
> > > > +
> > > > +	sta = unicam_reg_read(unicam, UNICAM_STA);
> > > > +	/* Write value back to clear the interrupts */
> > > > +	unicam_reg_write(unicam, UNICAM_STA, sta);
> > > > +
> > > > +	ista = unicam_reg_read(unicam, UNICAM_ISTA);
> > > > +	/* Write value back to clear the interrupts */
> > > > +	unicam_reg_write(unicam, UNICAM_ISTA, ista);
> > > > +
> > > > +	dev_dbg(unicam->dev, "ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, lines done %d\n",
> > > > +		ista, sta, sequence, lines_done);
> > > > +
> > > > +	if (!(sta & (UNICAM_IS | UNICAM_PI0)))
> > > > +		return IRQ_HANDLED;
> > > > +
> > > > +	/*
> > > > +	 * Look for either the Frame End interrupt or the Packet Capture status
> > > > +	 * to signal a frame end.
> > > > +	 */
> > > > +	fe = ista & UNICAM_FEI || sta & UNICAM_PI0;
> > > > +
> > > > +	/*
> > > > +	 * We must run the frame end handler first. If we have a valid next_frm
> > > > +	 * and we get a simultaneout FE + FS interrupt, running the FS handler
> > > > +	 * first would null out the next_frm ptr and we would have lost the
> > > > +	 * buffer forever.
> > > > +	 */
> > > > +	if (fe) {
> > > > +		/*
> > > > +		 * Ensure we have swapped buffers already as we can't
> > > > +		 * stop the peripheral. If no buffer is available, use a
> > > > +		 * dummy buffer to dump out frames until we get a new buffer
> > > > +		 * to use.
> > > > +		 */
> > > > +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > +			if (!unicam->node[i].streaming)
> > > > +				continue;
> > > > +
> > > > +			/*
> > > > +			 * If cur_frm == next_frm, it means we have not had
> > > > +			 * a chance to swap buffers, likely due to having
> > > > +			 * multiple interrupts occurring simultaneously (like FE
> > > > +			 * + FS + LS). In this case, we cannot signal the buffer
> > > > +			 * as complete, as the HW will reuse that buffer.
> > > > +			 */
> > > > +			if (unicam->node[i].cur_frm &&
> > > > +			    unicam->node[i].cur_frm != unicam->node[i].next_frm)
> > > > +				unicam_process_buffer_complete(&unicam->node[i],
> > > > +							       sequence);
> > > > +			unicam->node[i].cur_frm = unicam->node[i].next_frm;
> > > > +		}
> > > > +		unicam->sequence++;
> > > 
> > > Does access to this data need to be serialised somehow.
> > 
> > Given that it's only accessed from the interrupt handler (beside
> > start_streaming time, before starting the hardware), I don't think so.

Ack. I guess a memory barrier would be theoretically needed although in
practice other locks will be taken so you might not have issues.

> > 
> > > > +	}
> > > > +
> > > > +	if (ista & UNICAM_FSI) {
> > > > +		/*
> > > > +		 * Timestamp is to be when the first data byte was captured,
> > > > +		 * aka frame start.
> > > > +		 */
> > > > +		ts = ktime_get_ns();
> > > > +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > +			if (!unicam->node[i].streaming)
> > > > +				continue;
> > > > +
> > > > +			if (unicam->node[i].cur_frm)
> > > > +				unicam->node[i].cur_frm->vb.vb2_buf.timestamp =
> > > > +								ts;
> > > > +			else
> > > > +				dev_dbg(unicam->v4l2_dev.dev,
> > > > +					"ISR: [%d] Dropping frame, buffer not available at FS\n",
> > > > +					i);
> > > > +			/*
> > > > +			 * Set the next frame output to go to a dummy frame
> > > > +			 * if we have not managed to obtain another frame
> > > > +			 * from the queue.
> > > > +			 */
> > > > +			unicam_schedule_dummy_buffer(&unicam->node[i]);
> > > > +		}
> > > > +
> > > > +		unicam_queue_event_sof(unicam);
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Cannot swap buffer at frame end, there may be a race condition
> > > > +	 * where the HW does not actually swap it if the new frame has
> > > > +	 * already started.
> > > > +	 */
> > > > +	if (ista & (UNICAM_FSI | UNICAM_LCI) && !fe) {
> > > > +		for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > +			if (!unicam->node[i].streaming)
> > > > +				continue;
> > > > +
> > > > +			spin_lock(&unicam->node[i].dma_queue_lock);
> > > > +			if (!list_empty(&unicam->node[i].dma_queue) &&
> > > > +			    !unicam->node[i].next_frm)
> > > > +				unicam_schedule_next_buffer(&unicam->node[i]);
> > > > +			spin_unlock(&unicam->node[i].dma_queue_lock);
> > > > +		}
> > > > +	}
> > > > +
> > > > +	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> > > > +		/* Switch out of trigger mode if selected */
> > > > +		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> > > > +		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> > > > +	}
> > > > +	return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static void unicam_set_packing_config(struct unicam_device *unicam)
> > > > +{
> > > > +	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
> > > > +	u32 pack, unpack;
> > > > +	u32 val;
> > > > +
> > > > +	if (node->fmt.fmt.pix.pixelformat == node->fmtinfo->fourcc) {
> > > > +		unpack = UNICAM_PUM_NONE;
> > > > +		pack = UNICAM_PPM_NONE;
> > > > +	} else {
> > > > +		switch (node->fmtinfo->depth) {
> > > > +		case 8:
> > > > +			unpack = UNICAM_PUM_UNPACK8;
> > > > +			break;
> > > > +		case 10:
> > > > +			unpack = UNICAM_PUM_UNPACK10;
> > > > +			break;
> > > > +		case 12:
> > > > +			unpack = UNICAM_PUM_UNPACK12;
> > > > +			break;
> > > > +		case 14:
> > > > +			unpack = UNICAM_PUM_UNPACK14;
> > > > +			break;
> > > > +		case 16:
> > > > +			unpack = UNICAM_PUM_UNPACK16;
> > > > +			break;
> > > > +		default:
> > > > +			unpack = UNICAM_PUM_NONE;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		/* Repacking is always to 16bpp */
> > > > +		pack = UNICAM_PPM_PACK16;
> > > 
> > > Also 8-bit data?
> > 
> > Not that I know of. The 8-bit entries in unicam_image_formats have no
> > .unpacked_fourcc field, so the condition in the if above will always be
> > true for those as they can only be selected by setting the pixel format
> > to fmtinfo->fourcc.

Ok.

> > 
> > > > +	}
> > > > +
> > > > +	val = 0;
> > > 
> > > You could do initialisation in declaration.
> > 
> > Yes, but I think it's more readable to keep all the code that affects
> > the 'val' variable together.

If wal was a bit more descriptive name this would be a non-issue. Up to
you.

> > 
> > > > +	unicam_set_field(&val, unpack, UNICAM_PUM_MASK);
> > > > +	unicam_set_field(&val, pack, UNICAM_PPM_MASK);
> > > > +	unicam_reg_write(unicam, UNICAM_IPIPE, val);
> > > > +}
> > > > +
> > > > +static void unicam_cfg_image_id(struct unicam_device *unicam)
> > > > +{
> > > > +	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
> > > > +
> > > > +	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > +		/* CSI2 mode, hardcode VC 0 for now. */
> > > > +		unicam_reg_write(unicam, UNICAM_IDI0,
> > > > +				 (0 << 6) | node->fmtinfo->csi_dt);
> > > > +	} else {
> > > > +		/* CCP2 mode */
> > > > +		unicam_reg_write(unicam, UNICAM_IDI0,
> > > > +				 0x80 | node->fmtinfo->csi_dt);
> > > > +	}
> > > > +}
> > > > +
> > > > +static void unicam_enable_ed(struct unicam_device *unicam)
> > > > +{
> > > > +	u32 val = unicam_reg_read(unicam, UNICAM_DCS);
> > > > +
> > > > +	unicam_set_field(&val, 2, UNICAM_EDL_MASK);
> > > > +	/* Do not wrap at the end of the embedded data buffer */
> > > > +	unicam_set_field(&val, 0, UNICAM_DBOB);
> > > > +
> > > > +	unicam_reg_write(unicam, UNICAM_DCS, val);
> > > > +}
> > > > +
> > > > +static void unicam_start_rx(struct unicam_device *unicam,
> > > > +			    struct unicam_buffer *buf)
> > > > +{
> > > > +	struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
> > > > +	int line_int_freq = node->fmt.fmt.pix.height >> 2;
> > > > +	unsigned int i;
> > > > +	u32 val;
> > > > +
> > > > +	if (line_int_freq < 128)
> > > > +		line_int_freq = 128;
> > > 
> > > 	line_int_freq = max(line_int_freq, 128);
> > Ack.
> > 
> > > > +
> > > > +	/* Enable lane clocks */
> > > > +	val = 1;
> > > 
> > > Initialise in the loop initialisation below, I'd say.
> > 
> > How about
> > 
> > 	val = 0x55 & GENMASK(unicam->pipe.num_data_lanes * 2 - 1, 0);
> 
> I meant
> 
>  	val = 0x155 & GENMASK(unicam->pipe.num_data_lanes * 2 + 1, 0);
> 
> Maybe a comment would be useful ?
> 
> 	/*
> 	 * Enable lane clocks. The register is structured as follows:
> 	 *
> 	 * [9:8] - DAT3
> 	 * [7:6] - DAT2
> 	 * [5:4] - DAT1
> 	 * [3:2] - DAT0
> 	 * [1:0] - CLK
> 	 *
> 	 * Enabled lane must be set to b01, and disabled lanes to b00. The clock
> 	 * lane is always enabled.
> 	 */
> 	val = 0x155 & GENMASK(unicam->pipe.num_data_lanes * 2 + 1, 0);

Seems good to me.

> 
> > > > +	for (i = 0; i < unicam->active_data_lanes; i++)
> > > > +		val = val << 2 | 1;
> > > > +	unicam_clk_write(unicam, val);
> > > > +
> > > > +	/* Basic init */
> > > > +	unicam_reg_write(unicam, UNICAM_CTRL, UNICAM_MEM);
> > > > +
> > > > +	/* Enable analogue control, and leave in reset. */
> > > > +	val = UNICAM_AR;
> > > > +	unicam_set_field(&val, 7, UNICAM_CTATADJ_MASK);
> > > > +	unicam_set_field(&val, 7, UNICAM_PTATADJ_MASK);
> > > > +	unicam_reg_write(unicam, UNICAM_ANA, val);
> > > > +	usleep_range(1000, 2000);
> > > > +
> > > > +	/* Come out of reset */
> > > > +	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_AR);
> > > > +
> > > > +	/* Peripheral reset */
> > > > +	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_CPR);
> > > > +	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPR);
> > > > +
> > > > +	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_CPE);
> > > > +
> > > > +	/* Enable Rx control. */
> > > > +	val = unicam_reg_read(unicam, UNICAM_CTRL);
> > > > +	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > +		unicam_set_field(&val, UNICAM_CPM_CSI2, UNICAM_CPM_MASK);
> > > > +		unicam_set_field(&val, UNICAM_DCM_STROBE, UNICAM_DCM_MASK);
> > > > +	} else {
> > > > +		unicam_set_field(&val, UNICAM_CPM_CCP2, UNICAM_CPM_MASK);
> > > > +		unicam_set_field(&val, unicam->bus_flags, UNICAM_DCM_MASK);
> > > > +	}
> > > > +	/* Packet framer timeout */
> > > > +	unicam_set_field(&val, 0xf, UNICAM_PFT_MASK);
> > > > +	unicam_set_field(&val, 128, UNICAM_OET_MASK);
> > > > +	unicam_reg_write(unicam, UNICAM_CTRL, val);
> > > > +
> > > > +	unicam_reg_write(unicam, UNICAM_IHWIN, 0);
> > > > +	unicam_reg_write(unicam, UNICAM_IVWIN, 0);
> > > > +
> > > > +	/* AXI bus access QoS setup */
> > > > +	val = unicam_reg_read(unicam, UNICAM_PRI);
> > > > +	unicam_set_field(&val, 0, UNICAM_BL_MASK);
> > > > +	unicam_set_field(&val, 0, UNICAM_BS_MASK);
> > > > +	unicam_set_field(&val, 0xe, UNICAM_PP_MASK);
> > > > +	unicam_set_field(&val, 8, UNICAM_NP_MASK);
> > > > +	unicam_set_field(&val, 2, UNICAM_PT_MASK);
> > > > +	unicam_set_field(&val, 1, UNICAM_PE);
> > > > +	unicam_reg_write(unicam, UNICAM_PRI, val);
> > > > +
> > > > +	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
> > > > +
> > > > +	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
> > > > +	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
> > > > +	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
> > > > +	unicam_reg_write(unicam, UNICAM_ICTL, val);
> > > > +	unicam_reg_write(unicam, UNICAM_STA, UNICAM_STA_MASK_ALL);
> > > > +	unicam_reg_write(unicam, UNICAM_ISTA, UNICAM_ISTA_MASK_ALL);
> > > > +
> > > > +	/* tclk_term_en */
> > > > +	unicam_reg_write_field(unicam, UNICAM_CLT, 2, UNICAM_CLT1_MASK);
> > > > +	/* tclk_settle */
> > > > +	unicam_reg_write_field(unicam, UNICAM_CLT, 6, UNICAM_CLT2_MASK);
> > > > +	/* td_term_en */
> > > > +	unicam_reg_write_field(unicam, UNICAM_DLT, 2, UNICAM_DLT1_MASK);
> > > > +	/* ths_settle */
> > > > +	unicam_reg_write_field(unicam, UNICAM_DLT, 6, UNICAM_DLT2_MASK);
> > > > +	/* trx_enable */
> > > > +	unicam_reg_write_field(unicam, UNICAM_DLT, 0, UNICAM_DLT3_MASK);
> > > > +
> > > > +	unicam_reg_write_field(unicam, UNICAM_CTRL, 0, UNICAM_SOE);
> > > > +
> > > > +	/* Packet compare setup - required to avoid missing frame ends */
> > > > +	val = 0;
> > > > +	unicam_set_field(&val, 1, UNICAM_PCE);
> > > > +	unicam_set_field(&val, 1, UNICAM_GI);
> > > > +	unicam_set_field(&val, 1, UNICAM_CPH);
> > > > +	unicam_set_field(&val, 0, UNICAM_PCVC_MASK);
> > > > +	unicam_set_field(&val, 1, UNICAM_PCDT_MASK);
> > > > +	unicam_reg_write(unicam, UNICAM_CMP0, val);
> > > > +
> > > > +	/* Enable clock lane and set up terminations */
> > > > +	val = 0;
> > > > +	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > +		/* CSI2 */
> > > > +		unicam_set_field(&val, 1, UNICAM_CLE);
> > > > +		unicam_set_field(&val, 1, UNICAM_CLLPE);
> > > > +		if (!(unicam->bus_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > +			unicam_set_field(&val, 1, UNICAM_CLTRE);
> > > > +			unicam_set_field(&val, 1, UNICAM_CLHSE);
> > > > +		}
> > > > +	} else {
> > > > +		/* CCP2 */
> > > > +		unicam_set_field(&val, 1, UNICAM_CLE);
> > > > +		unicam_set_field(&val, 1, UNICAM_CLHSE);
> > > > +		unicam_set_field(&val, 1, UNICAM_CLTRE);
> > > > +	}
> > > > +	unicam_reg_write(unicam, UNICAM_CLK, val);
> > > > +
> > > > +	/*
> > > > +	 * Enable required data lanes with appropriate terminations.
> > > > +	 * The same value needs to be written to UNICAM_DATn registers for
> > > > +	 * the active lanes, and 0 for inactive ones.
> > > > +	 */
> > > > +	val = 0;
> > > > +	if (unicam->bus_type == V4L2_MBUS_CSI2_DPHY) {
> > > > +		/* CSI2 */
> > > > +		unicam_set_field(&val, 1, UNICAM_DLE);
> > > > +		unicam_set_field(&val, 1, UNICAM_DLLPE);
> > > > +		if (!(unicam->bus_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > +			unicam_set_field(&val, 1, UNICAM_DLTRE);
> > > > +			unicam_set_field(&val, 1, UNICAM_DLHSE);
> > > > +		}
> > > > +	} else {
> > > > +		/* CCP2 */
> > > > +		unicam_set_field(&val, 1, UNICAM_DLE);
> > > > +		unicam_set_field(&val, 1, UNICAM_DLHSE);
> > > > +		unicam_set_field(&val, 1, UNICAM_DLTRE);
> > > > +	}
> > > > +	unicam_reg_write(unicam, UNICAM_DAT0, val);
> > > > +
> > > > +	if (unicam->active_data_lanes == 1)
> > > > +		val = 0;
> > > > +	unicam_reg_write(unicam, UNICAM_DAT1, val);
> > > > +
> > > > +	if (unicam->max_data_lanes > 2) {
> > > > +		/*
> > > > +		 * Registers UNICAM_DAT2 and UNICAM_DAT3 only valid if the
> > > > +		 * instance supports more than 2 data lanes.
> > > > +		 */
> > > > +		if (unicam->active_data_lanes == 2)
> > > > +			val = 0;
> > > > +		unicam_reg_write(unicam, UNICAM_DAT2, val);
> > > > +
> > > > +		if (unicam->active_data_lanes == 3)
> > > > +			val = 0;
> > > > +		unicam_reg_write(unicam, UNICAM_DAT3, val);
> > > > +	}
> > > > +
> > > > +	unicam_reg_write(unicam, UNICAM_IBLS,
> > > > +			 node->fmt.fmt.pix.bytesperline);
> > > > +	unicam_wr_dma_addr(&unicam->node[UNICAM_IMAGE_NODE], buf);
> > > > +	unicam_set_packing_config(unicam);
> > > > +	unicam_cfg_image_id(unicam);
> > > > +
> > > > +	val = unicam_reg_read(unicam, UNICAM_MISC);
> > > > +	unicam_set_field(&val, 1, UNICAM_FL0);
> > > > +	unicam_set_field(&val, 1, UNICAM_FL1);
> > > > +	unicam_reg_write(unicam, UNICAM_MISC, val);
> > > > +
> > > > +	/* Enable peripheral */
> > > > +	unicam_reg_write_field(unicam, UNICAM_CTRL, 1, UNICAM_CPE);
> > > > +
> > > > +	/* Load image pointers */
> > > > +	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_LIP_MASK);
> > > > +
> > > > +	/*
> > > > +	 * Enable trigger only for the first frame to
> > > > +	 * sync correctly to the FS from the source.
> > > > +	 */
> > > > +	unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> > > > +}
> > 
> > [snip]
> > 
> > > > +static int unicam_async_nf_init(struct unicam_device *unicam)
> > > > +{
> > > > +	struct v4l2_fwnode_endpoint ep = { };
> > > 
> > > If the bus-type property is mandatory and you have no stated defaults
> > > anywhere, this is fine. I.e. all the relevant properties would need to be

Actually this is a non-issue nowadays: bus in struct v4l2_fwnode_endpoint
is no longer a union.

> > > mandatory.
> > 
> > They are, as far as I can tell (well, the clock-noncontinuous property
> > is not mandatory, but that's expected as it's a flag).
> > 
> > > > +	struct fwnode_handle *ep_handle;
> > > > +	struct v4l2_async_connection *asc;
> > > > +	int ret;
> > > > +
> > > > +	ret = of_property_read_u32(unicam->dev->of_node, "brcm,num-data-lanes",
> > > > +				   &unicam->max_data_lanes);
> > > > +	if (ret < 0) {
> > > > +		dev_err(unicam->dev, "Missing %s DT property\n",
> > > > +			"brcm,num-data-lanes");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	/* Get and parse the local endpoint. */
> > > > +	ep_handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(unicam->dev), 0, 0,
> > > > +						    FWNODE_GRAPH_ENDPOINT_NEXT);
> > > > +	if (!ep_handle) {
> > > > +		dev_err(unicam->dev, "No endpoint found\n");
> > > > +		return -ENODEV;
> > > > +	}
> > > > +
> > > > +	ret = v4l2_fwnode_endpoint_parse(ep_handle, &ep);
> > > > +	if (ret) {
> > > > +		dev_err(unicam->dev, "Failed to parse endpoint: %d\n", ret);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	unicam->bus_type = ep.bus_type;
> > > > +
> > > > +	switch (ep.bus_type) {
> > > > +	case V4L2_MBUS_CSI2_DPHY: {
> > > > +		unsigned int num_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
> > > > +
> > > > +		if (num_data_lanes != 1 && num_data_lanes != 2 &&
> > > > +		    num_data_lanes != 4) {
> > > > +			dev_err(unicam->dev, "%u data lanes not supported\n",
> > > > +				num_data_lanes);
> > > > +			goto error;
> > > > +		}
> > > > +
> > > > +		if (num_data_lanes > unicam->max_data_lanes) {
> > > > +			dev_err(unicam->dev,
> > > > +				"Endpoint uses %u data lanes when %u are supported\n",
> > > > +				num_data_lanes, unicam->max_data_lanes);
> > > > +			goto error;
> > > > +		}
> > > > +
> > > > +		unicam->active_data_lanes = num_data_lanes;
> > > > +		unicam->bus_flags = ep.bus.mipi_csi2.flags;
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	case V4L2_MBUS_CCP2:
> > > > +		unicam->max_data_lanes = 1;
> > > > +		unicam->active_data_lanes = 1;
> > > > +		unicam->bus_flags = ep.bus.mipi_csi1.strobe;
> > > > +		break;
> > > > +
> > > > +	default:
> > > > +		/* Unsupported bus type */
> > > > +		dev_err(unicam->dev, "Unsupported bus type %u\n", ep.bus_type);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	/* Initialize and register the async notifier. */
> > > > +	v4l2_async_nf_init(&unicam->notifier, &unicam->v4l2_dev);
> > > > +
> > > > +	asc = v4l2_async_nf_add_fwnode_remote(&unicam->notifier, ep_handle,
> > > > +					      struct v4l2_async_connection);
> > > > +	fwnode_handle_put(ep_handle);
> > > > +	ep_handle = NULL;
> > > > +
> > > > +	if (IS_ERR(asc)) {
> > > > +		ret = PTR_ERR(asc);
> > > > +		dev_err(unicam->dev, "Failed to add entry to notifier: %d\n",
> > > > +			ret);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	unicam->notifier.ops = &unicam_async_ops;
> > > > +
> > > > +	ret = v4l2_async_nf_register(&unicam->notifier);
> > > > +	if (ret) {
> > > > +		dev_err(unicam->dev, "Error registering device notifier: %d\n",
> > > > +			ret);
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +error:
> > > > +	fwnode_handle_put(ep_handle);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/* -----------------------------------------------------------------------------
> > > > + * Probe & remove
> > > > + */
> > > > +
> > > > +static int unicam_media_init(struct unicam_device *unicam)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	unicam->mdev.dev = unicam->dev;
> > > > +	strscpy(unicam->mdev.model, UNICAM_MODULE_NAME,
> > > > +		sizeof(unicam->mdev.model));
> > > > +	strscpy(unicam->mdev.serial, "", sizeof(unicam->mdev.serial));
> > > 
> > > Isn't the field already zeroed?
> > 
> > Indeed. I'll drop this.
> > 
> > > 
> > > > +	unicam->mdev.hw_revision = 0;
> > > > +
> > > > +	media_device_init(&unicam->mdev);
> > > > +
> > > > +	unicam->v4l2_dev.mdev = &unicam->mdev;
> > > > +
> > > > +	ret = v4l2_device_register(unicam->dev, &unicam->v4l2_dev);
> > > > +	if (ret < 0) {
> > > > +		dev_err(unicam->dev, "Unable to register v4l2 device\n");
> > > > +		goto err_media_cleanup;
> > > > +	}
> > > > +
> > > > +	ret = media_device_register(&unicam->mdev);
> > > > +	if (ret < 0) {
> > > > +		dev_err(unicam->dev,
> > > > +			"Unable to register media-controller device\n");
> > > > +		goto err_v4l2_unregister;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_v4l2_unregister:
> > > > +	v4l2_device_unregister(&unicam->v4l2_dev);
> > > > +err_media_cleanup:
> > > > +	media_device_cleanup(&unicam->mdev);
> > > > +	return ret;
> > > > +}
> > 
> > [snip]
> 

-- 
Kind regards,

Sakari Ailus

