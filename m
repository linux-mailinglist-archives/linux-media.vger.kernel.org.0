Return-Path: <linux-media+bounces-7859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84488CA04
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 18:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9581C29A9D
	for <lists+linux-media@lfdr.de>; Tue, 26 Mar 2024 17:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7084B13D510;
	Tue, 26 Mar 2024 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pPc216qc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047A13D508
	for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 17:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472485; cv=none; b=KV9zMwaqRUQCScEnAyQHgXRDt10uo8h3lKhHc3woZKp111Y/9dDrA1vEPpmmKjPTU4JFlGr9IVvhCiQTh1ZwgFrC73WDrcJR7bg1XjXV++HSQiTDbNrJofj2BwAh2JetI7XLzcQDc6j3i2QQPkSx5YDdkcCTAbzL6hc+DLVHGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472485; c=relaxed/simple;
	bh=WCStSasfGwCi/TEmeHpxR0Uu2h4Ospgi1MMgVboFzIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRQ60XvQKqwvWWXGpYzTqgcXCymruyDRml6ESIW5FPZjsLkdX8Cgopl5j6L3cMJMdOIKHmmJERkVQxhO7Sc0qnH4luZc+m8QlQUIa3rtMrFajnr4Pw2XNubt96DBpQdKi7BLYDgadNSOG/xMDoK2VyxBA99Kyl0B81ZlbAtdMkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pPc216qc; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc745927098so5393815276.3
        for <linux-media@vger.kernel.org>; Tue, 26 Mar 2024 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1711472481; x=1712077281; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rn6b32jy9L1Q1CcsHFyQ93QIJPAnE2SZFJWdx80EvW0=;
        b=pPc216qc4juBH7uCSoDBTRlNJ2gaAfKWu9wjJhZx7p2btWGq9NbXRL9IQrBi1Pmd7v
         v4+3mQAqGpzzD1oe+Wa1qufBo4Dx9Aj3ortOlRA87cbn+hAECdwIqRFoU2BJnwe0Bt98
         8kAONV3NEpJ3nAwM0jrnfPaWEDFjQpW/XRHV0Ki6O6+ua12texfp2JnPzaZblCUCq3lN
         KZ7IGY8IDsstBQj+zdT10ZKu7GJ5MUmCK/Ob4P4taJacxpdSmmzWbbFng7Wu935PAV9n
         hrQ7rEjWuVOHkiKCurQcLBELzUBYDV6vO795s/Lt11wGwc+SDlE4pPhFwToLd+PiRex0
         kqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472481; x=1712077281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn6b32jy9L1Q1CcsHFyQ93QIJPAnE2SZFJWdx80EvW0=;
        b=qe4dLnf9oDLO9ttE2DM6RCcvDBwkbmlW2CdG9XeM9aZu8OdU9D8Icpl7elFvhXF9Td
         jS9wF9Z1hVMLyOwu2Sb0vre+ONrXAcgK1HSuJ/ENMgE2BoEUcDj2k/x5eZDyWa2Hd9HU
         WyUUobBkJGICQRhdGRuy+Z2PvlAMDuJ9KhHr/08U7byqKnT21O8oK4xaEbi8wx2alWNI
         +bM6/V28+kjHsWftJUe5G8trePszCFJPs8eMTUTzqnxPrUVujL7Xgy9wcLNsoNziFmgl
         0FrMeiG5XtXntHuPaEcTFeY2lVfFXznpHZd37iQvMnhHWjwlaF1VAXzuZPOth90ksJVB
         e//w==
X-Forwarded-Encrypted: i=1; AJvYcCXBi1mzPiofTOwacyVQBJFWb8wpZiYL1SvxEDct1lh3WvJWaVR1Ibjpx8fxrBRo4jklzBDr+MehoSGYOujzeIvwFuwQgnMDz6Itu+o=
X-Gm-Message-State: AOJu0YxiA34V7TDk3GzopBzoAw1kHYOKCJ5gguBY5zrrttME/aaIvOgC
	x+lqwbjODchLzkPDnrEvbmbh+Gmgw9LMwclZLvaa/kjIxREdWxo+fnQe9uHJTPLwAJgHep/eZ/l
	Jyjs4rxT7PIUWU7WQPChcuBnHstZyfrWKl42lew==
X-Google-Smtp-Source: AGHT+IFF+qsN3HddrYNocQUw5qs1Uglxid7wFNdqg5vj1dWSwcfBHFhwuhElG2CYDWpKvlzLGb2l21UfCSZKq2f2K9I=
X-Received: by 2002:a25:8447:0:b0:dcc:ec02:38b0 with SMTP id
 r7-20020a258447000000b00dccec0238b0mr239762ybm.64.1711472480652; Tue, 26 Mar
 2024 10:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <ZgHEQTHZlRr_Rz6K@kekkonen.localdomain> <20240326013708.GA31396@pendragon.ideasonboard.com>
 <CAPY8ntAbw33-4TG3ZyNHZTsJNRa_yxQ=pAdn0meQbeVK95x1Eg@mail.gmail.com> <20240326164250.GA28895@pendragon.ideasonboard.com>
In-Reply-To: <20240326164250.GA28895@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 26 Mar 2024 17:01:05 +0000
Message-ID: <CAPY8ntAqgaTnp5mRScUc6OjSaHBdvDWPKu==cD-EzPC5-p8nqg@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] media: bcm2835-unicam: Add support for CCP2/CSI2
 camera interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Naushir Patuck <naush@raspberrypi.com>, 
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Tue, Mar 26, 2024 at 03:23:42PM +0000, Dave Stevenson wrote:
> > On Tue, 26 Mar 2024 at 01:37, Laurent Pinchart wrote:
> > > On Mon, Mar 25, 2024 at 06:36:49PM +0000, Sakari Ailus wrote:
> > > > On Fri, Mar 01, 2024 at 11:32:24PM +0200, Laurent Pinchart wrote:
> > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > >
> > > > > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > > > > It is represented as two video device nodes: unicam-image and
> > > > > unicam-embedded which are connected to an internal subdev (named
> > > > > unicam-subdev) in order to manage streams routing.
> > > > >
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > > > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >
> > > > Thanks for submitting this, it's the cleanest and neatest Unicom driver
> > >
> > > Unicam, or if you insist Unicorn, but not Unicom :-)
> > >
> > > > I've ever seen!
> > > >
> > > > Some mostly unimportant comments below, however the bus-type issue needs to
> > > > be addressed.
> > > >
> > > > > ---
> > > > > Changes since v5:
> > > > >
> > > > > - Move to drivers/media/platform/broadcom/
> > > > > - Port to the upstream V4L2 streams API
> > > > > - Rebase on latest metadata API proposal
> > > > > - Add missing error message
> > > > > - Drop unneeded documentation block for unicam_isr()
> > > > > - Drop unneeded dev_dbg() and dev_err() messages
> > > > > - Drop unneeded streams_mask and fmt checks
> > > > > - Drop unused unicam_sd_pad_is_sink()
> > > > > - Drop unneeded includes
> > > > > - Drop v4l2_ctrl_subscribe_event() call
> > > > > - Use pm_runtime_resume_and_get()
> > > > > - Indentation and line wrap fixes
> > > > > - Let the framework set bus_info
> > > > > - Use v4l2_fwnode_endpoint_parse()
> > > > > - Fix media device cleanup
> > > > > - Drop lane reordering checks
> > > > > - Fix subdev state locking
> > > > > - Drop extra debug messages
> > > > > - Move clock handling to runtime PM handlers
> > > > > - Reorder functions
> > > > > - Rename init functions for more clarity
> > > > > - Initialize runtime PM earlier
> > > > > - Clarify error messages
> > > > > - Simplify subdev init with local variable
> > > > > - Fix subdev cleanup
> > > > > - Fix typos and indentation
> > > > > - Don't initialize local variables needlessly
> > > > > - Simplify num lanes check
> > > > > - Fix metadata handling in subdev set_fmt
> > > > > - Drop manual fallback to .s_stream()
> > > > > - Pass v4l2_pix_format to unicam_calc_format_size_bpl()
> > > > > - Simplify unicam_set_default_format()
> > > > > - Fix default format settings
> > > > > - Add busy check in unicam_s_fmt_meta()
> > > > > - Add missing \n at end of format strings
> > > > > - Fix metadata handling in subdev set_fmt
> > > > > - Fix locking when starting streaming
> > > > > - Return buffers from start streaming fails
> > > > > - Fix format validation for metadata node
> > > > > - Use video_device_pipeline_{start,stop}() helpers
> > > > > - Simplify format enumeration
> > > > > - Drop unset variable
> > > > > - Update MAINTAINERS entry
> > > > > - Update to the upstream v4l2_async_nf API
> > > > > - Update to the latest subdev routing API
> > > > > - Update to the latest subdev state API
> > > > > - Move from subdev .init_cfg() to .init_state()
> > > > > - Update to the latest videobuf2 API
> > > > > - Fix v4l2_subdev_enable_streams() error check
> > > > > - Use correct pad for the connected subdev
> > > > > - Return buffers to vb2 when start streaming fails
> > > > > - Improve debugging in start streaming handler
> > > > > - Simplify DMA address management
> > > > > - Drop comment about bcm2835-camera driver
> > > > > - Clarify comments that explain min/max sizes
> > > > > - Pass v4l2_pix_format to unicam_try_fmt()
> > > > > - Drop unneeded local variables
> > > > > - Rename image-related constants and functions
> > > > > - Turn unicam_fmt.metadata_fmt into bool
> > > > > - Rename unicam_fmt to unicam_format_info
> > > > > - Rename unicam_format_info variables to fmtinfo
> > > > > - Rename unicam_node.v_fmt to fmt
> > > > > - Add metadata formats for RAW10, RAW12 and RAW14
> > > > > - Make metadata formats line-based
> > > > > - Validate format on metadata video device
> > > > > - Add Co-devlopped-by tags
> > > > >
> > > > > Changes since v3:
> > > > >
> > > > > - Add the vendor prefix for DT name
> > > > > - Use the reg-names in DT parsing
> > > > > - Remove MAINTAINERS entry
> > > > >
> > > > > Changes since v2:
> > > > >
> > > > > - Change code organization
> > > > > - Remove unused variables
> > > > > - Correct the fmt_meta functions
> > > > > - Rewrite the start/stop streaming
> > > > >   - You can now start the image node alone, but not the metadata one
> > > > >   - The buffers are allocated per-node
> > > > >   - only the required stream is started, if the route exists and is
> > > > >     enabled
> > > > > - Prefix the macros with UNICAM_ to not have too generic names
> > > > > - Drop colorspace support
> > > > >
> > > > > Changes since v1:
> > > > >
> > > > > - Replace the unicam_{info,debug,error} macros with dev_*()
> > > > > ---
> > > > >  MAINTAINERS                                   |    1 +
> > > > >  drivers/media/platform/Kconfig                |    1 +
> > > > >  drivers/media/platform/Makefile               |    1 +
> > > > >  drivers/media/platform/broadcom/Kconfig       |   23 +
> > > > >  drivers/media/platform/broadcom/Makefile      |    3 +
> > > > >  .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
> > > > >  .../media/platform/broadcom/bcm2835-unicam.c  | 2607 +++++++++++++++++
> > > > >  7 files changed, 2891 insertions(+)
> > > > >  create mode 100644 drivers/media/platform/broadcom/Kconfig
> > > > >  create mode 100644 drivers/media/platform/broadcom/Makefile
> > > > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index e50a59654e6e..cc350729f467 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -4002,6 +4002,7 @@ M:    Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > > > >  L: linux-media@vger.kernel.org
> > > > >  S: Maintained
> > > > >  F: Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > > > > +F: drivers/media/platform/bcm2835/
> > > > >
> > > > >  BROADCOM BCM47XX MIPS ARCHITECTURE
> > > > >  M: Hauke Mehrtens <hauke@hauke-m.de>
> > > > > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > > > > index 91e54215de3a..2d79bfc68c15 100644
> > > > > --- a/drivers/media/platform/Kconfig
> > > > > +++ b/drivers/media/platform/Kconfig
> > > > > @@ -67,6 +67,7 @@ source "drivers/media/platform/amlogic/Kconfig"
> > > > >  source "drivers/media/platform/amphion/Kconfig"
> > > > >  source "drivers/media/platform/aspeed/Kconfig"
> > > > >  source "drivers/media/platform/atmel/Kconfig"
> > > > > +source "drivers/media/platform/broadcom/Kconfig"
> > > > >  source "drivers/media/platform/cadence/Kconfig"
> > > > >  source "drivers/media/platform/chips-media/Kconfig"
> > > > >  source "drivers/media/platform/intel/Kconfig"
> > > > > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> > > > > index 3296ec1ebe16..da17301f7439 100644
> > > > > --- a/drivers/media/platform/Makefile
> > > > > +++ b/drivers/media/platform/Makefile
> > > > > @@ -10,6 +10,7 @@ obj-y += amlogic/
> > > > >  obj-y += amphion/
> > > > >  obj-y += aspeed/
> > > > >  obj-y += atmel/
> > > > > +obj-y += broadcom/
> > > > >  obj-y += cadence/
> > > > >  obj-y += chips-media/
> > > > >  obj-y += intel/
> > > > > diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
> > > > > new file mode 100644
> > > > > index 000000000000..cc2c9afcc948
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/broadcom/Kconfig
> > > > > @@ -0,0 +1,23 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +config VIDEO_BCM2835_UNICAM
> > > > > +   tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> > > > > +   depends on ARCH_BCM2835 || COMPILE_TEST
> > > > > +   depends on PM
> > > > > +   depends on VIDEO_DEV
> > > > > +   select MEDIA_CONTROLLER
> > > > > +   select V4L2_FWNODE
> > > > > +   select VIDEO_V4L2_SUBDEV_API
> > > > > +   select VIDEOBUF2_DMA_CONTIG
> > > > > +   help
> > > > > +     Say Y here to enable support for the BCM283x/BCM271x CSI-2 receiver.
> > > > > +     This is a V4L2 driver that controls the CSI-2 receiver directly,
> > > > > +     independently from the VC4 firmware.
> > > > > +
> > > > > +     This driver is mutually exclusive with the use of bcm2835-camera. The
> > > > > +     firmware will disable all access to the peripheral from within the
> > > > > +     firmware if it finds a DT node using it, and bcm2835-camera will
> > > > > +     therefore fail to probe.
> > > > > +
> > > > > +     To compile this driver as a module, choose M here. The module will be
> > > > > +     called bcm2835-unicam.
> > > > > diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
> > > > > new file mode 100644
> > > > > index 000000000000..03d2045aba2e
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/broadcom/Makefile
> > > > > @@ -0,0 +1,3 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) += bcm2835-unicam.o
> > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam-regs.h b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > > > new file mode 100644
> > > > > index 000000000000..84775fd2fac5
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > > > > @@ -0,0 +1,255 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > +
> > > > > +/*
> > > > > + * Copyright (C) 2017-2020 Raspberry Pi Trading.
> > > >
> > > > Anything up to 2024?
> > >
> > > Not really. The registers haven't really changed :-) I'll update the
> > > copyright in the .c file though.
> > >
> > > > > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > + */
> > >
> > > [snip]
> > >
> > > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > new file mode 100644
> > > > > index 000000000000..716c89b8a217
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > > @@ -0,0 +1,2607 @@
> > >
> > > [snip]
> > >
> > > > > +static irqreturn_t unicam_isr(int irq, void *dev)
> > > > > +{
> > > > > +   struct unicam_device *unicam = dev;
> > > > > +   unsigned int lines_done = unicam_get_lines_done(dev);
> > > > > +   unsigned int sequence = unicam->sequence;
> > > > > +   unsigned int i;
> > > > > +   u32 ista, sta;
> > > > > +   bool fe;
> > > > > +   u64 ts;
> > > > > +
> > > > > +   sta = unicam_reg_read(unicam, UNICAM_STA);
> > > > > +   /* Write value back to clear the interrupts */
> > > > > +   unicam_reg_write(unicam, UNICAM_STA, sta);
> > > > > +
> > > > > +   ista = unicam_reg_read(unicam, UNICAM_ISTA);
> > > > > +   /* Write value back to clear the interrupts */
> > > > > +   unicam_reg_write(unicam, UNICAM_ISTA, ista);
> > > > > +
> > > > > +   dev_dbg(unicam->dev, "ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, lines done %d\n",
> > > > > +           ista, sta, sequence, lines_done);
> > > > > +
> > > > > +   if (!(sta & (UNICAM_IS | UNICAM_PI0)))
> > > > > +           return IRQ_HANDLED;
> > > > > +
> > > > > +   /*
> > > > > +    * Look for either the Frame End interrupt or the Packet Capture status
> > > > > +    * to signal a frame end.
> > > > > +    */
> > > > > +   fe = ista & UNICAM_FEI || sta & UNICAM_PI0;
> > > > > +
> > > > > +   /*
> > > > > +    * We must run the frame end handler first. If we have a valid next_frm
> > > > > +    * and we get a simultaneout FE + FS interrupt, running the FS handler
> > > > > +    * first would null out the next_frm ptr and we would have lost the
> > > > > +    * buffer forever.
> > > > > +    */
> > > > > +   if (fe) {
> > > > > +           /*
> > > > > +            * Ensure we have swapped buffers already as we can't
> > > > > +            * stop the peripheral. If no buffer is available, use a
> > > > > +            * dummy buffer to dump out frames until we get a new buffer
> > > > > +            * to use.
> > > > > +            */
> > > > > +           for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > > +                   if (!unicam->node[i].streaming)
> > > > > +                           continue;
> > > > > +
> > > > > +                   /*
> > > > > +                    * If cur_frm == next_frm, it means we have not had
> > > > > +                    * a chance to swap buffers, likely due to having
> > > > > +                    * multiple interrupts occurring simultaneously (like FE
> > > > > +                    * + FS + LS). In this case, we cannot signal the buffer
> > > > > +                    * as complete, as the HW will reuse that buffer.
> > > > > +                    */
> > > > > +                   if (unicam->node[i].cur_frm &&
> > > > > +                       unicam->node[i].cur_frm != unicam->node[i].next_frm)
> > > > > +                           unicam_process_buffer_complete(&unicam->node[i],
> > > > > +                                                          sequence);
> > > > > +                   unicam->node[i].cur_frm = unicam->node[i].next_frm;
> > > > > +           }
> > > > > +           unicam->sequence++;
> > > >
> > > > Does access to this data need to be serialised somehow.
> > >
> > > Given that it's only accessed from the interrupt handler (beside
> > > start_streaming time, before starting the hardware), I don't think so.
> > >
> > > > > +   }
> > > > > +
> > > > > +   if (ista & UNICAM_FSI) {
> > > > > +           /*
> > > > > +            * Timestamp is to be when the first data byte was captured,
> > > > > +            * aka frame start.
> > > > > +            */
> > > > > +           ts = ktime_get_ns();
> > > > > +           for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > > +                   if (!unicam->node[i].streaming)
> > > > > +                           continue;
> > > > > +
> > > > > +                   if (unicam->node[i].cur_frm)
> > > > > +                           unicam->node[i].cur_frm->vb.vb2_buf.timestamp =
> > > > > +                                                           ts;
> > > > > +                   else
> > > > > +                           dev_dbg(unicam->v4l2_dev.dev,
> > > > > +                                   "ISR: [%d] Dropping frame, buffer not available at FS\n",
> > > > > +                                   i);
> > > > > +                   /*
> > > > > +                    * Set the next frame output to go to a dummy frame
> > > > > +                    * if we have not managed to obtain another frame
> > > > > +                    * from the queue.
> > > > > +                    */
> > > > > +                   unicam_schedule_dummy_buffer(&unicam->node[i]);
> > > > > +           }
> > > > > +
> > > > > +           unicam_queue_event_sof(unicam);
> > > > > +   }
> > > > > +
> > > > > +   /*
> > > > > +    * Cannot swap buffer at frame end, there may be a race condition
> > > > > +    * where the HW does not actually swap it if the new frame has
> > > > > +    * already started.
> > > > > +    */
> > > > > +   if (ista & (UNICAM_FSI | UNICAM_LCI) && !fe) {
> > > > > +           for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> > > > > +                   if (!unicam->node[i].streaming)
> > > > > +                           continue;
> > > > > +
> > > > > +                   spin_lock(&unicam->node[i].dma_queue_lock);
> > > > > +                   if (!list_empty(&unicam->node[i].dma_queue) &&
> > > > > +                       !unicam->node[i].next_frm)
> > > > > +                           unicam_schedule_next_buffer(&unicam->node[i]);
> > > > > +                   spin_unlock(&unicam->node[i].dma_queue_lock);
> > > > > +           }
> > > > > +   }
> > > > > +
> > > > > +   if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> > > > > +           /* Switch out of trigger mode if selected */
> > > > > +           unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> > > > > +           unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> > > > > +   }
> > > > > +   return IRQ_HANDLED;
> > > > > +}
> > > > > +
> > > > > +static void unicam_set_packing_config(struct unicam_device *unicam)
> > > > > +{
> > > > > +   struct unicam_node *node = &unicam->node[UNICAM_IMAGE_NODE];
> > > > > +   u32 pack, unpack;
> > > > > +   u32 val;
> > > > > +
> > > > > +   if (node->fmt.fmt.pix.pixelformat == node->fmtinfo->fourcc) {
> > > > > +           unpack = UNICAM_PUM_NONE;
> > > > > +           pack = UNICAM_PPM_NONE;
> > > > > +   } else {
> > > > > +           switch (node->fmtinfo->depth) {
> > > > > +           case 8:
> > > > > +                   unpack = UNICAM_PUM_UNPACK8;
> > > > > +                   break;
> > > > > +           case 10:
> > > > > +                   unpack = UNICAM_PUM_UNPACK10;
> > > > > +                   break;
> > > > > +           case 12:
> > > > > +                   unpack = UNICAM_PUM_UNPACK12;
> > > > > +                   break;
> > > > > +           case 14:
> > > > > +                   unpack = UNICAM_PUM_UNPACK14;
> > > > > +                   break;
> > > > > +           case 16:
> > > > > +                   unpack = UNICAM_PUM_UNPACK16;
> > > > > +                   break;
> > > > > +           default:
> > > > > +                   unpack = UNICAM_PUM_NONE;
> > > > > +                   break;
> > > > > +           }
> > > > > +
> > > > > +           /* Repacking is always to 16bpp */
> > > > > +           pack = UNICAM_PPM_PACK16;
> > > >
> > > > Also 8-bit data?
> > >
> > > Not that I know of. The 8-bit entries in unicam_image_formats have no
> > > .unpacked_fourcc field, so the condition in the if above will always be
> > > true for those as they can only be selected by setting the pixel format
> > > to fmtinfo->fourcc.
> >
> > Correct.
> > The unpacking / packing doesn't bit shift, hence 10P can be unpacked
> > to 10, 12P to 12, and 14P to 14, but there is no 8bit unpacked into
> > the LSBs of 16 bit words defined as a V4L2 format.
> >
> > You can configure packing to produce 10P, 12P, etc, but without the
> > bitshift it has no real use.
> >
> > MSBs get dropped if you try packing to a smaller bit depth than the
> > source, so packing to 8 bit from any other depth results in unusable
> > output.
> >
> > If being really critical, then there is no point in having the case 8
> > and case 16 in this switch as they will never be selected.
>
> As we have space to spare in the unicam_format_info structure due to
> padding, I'll move the unpack value there and drop the switch.

As it ends up being a 1:1 mapping, that would work.

Originally I believed unicam did the bit-shifting which made offering
the flexibility useful, but that proved to be wrong.

  Dave

> > > > > +   }
> >
> > <snip>
>
> --
> Regards,
>
> Laurent Pinchart

