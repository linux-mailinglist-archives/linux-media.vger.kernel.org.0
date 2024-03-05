Return-Path: <linux-media+bounces-6458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0D87221E
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 15:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9D4280CC4
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 14:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA32126F0D;
	Tue,  5 Mar 2024 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="D1WYwF54"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA6585C52
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650611; cv=none; b=VSBhLiGVckDe8k3qVaJeuZ3gqRGolZnvd35yumybHFJQq7BBVdz6u2Oi5rww8/tK6yVQTZtUfOjrga0yddxDEdE2NI7SDAkJq3IgBbkGmYrgxvPkSTDe+uN8HVqkwIo+4SSWT1vnYjyo0AScqxJ34KFlvBrXOGmsf9TSV5jrxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650611; c=relaxed/simple;
	bh=0BLnMlS289L9I/FbsK/DycoqotLWphUDmBQYGrqbAvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYGTr6bxB1CVrPCyODGldkh2vtdHdT9bayxM6xpDV3x3SJdSBXESGNXm9C5g595cg94N3DbG9s0FolBOnUZ2dYMXjdtsJYaF97X/SfQdZdYH1BNOp/vYDa2EKtct8cT1cwRh9MwWIWRenn+d5CvnIPAIYKG2tPWz2grCgvfWpHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=D1WYwF54; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so5576952276.0
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709650606; x=1710255406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QK88LFU6d4t1JCWizGmXtGUXUraCe7bvokdPTzV9QjY=;
        b=D1WYwF5462e82qjtDoUBPQGVfMaazJgmvrIIM2R5rd6oMildxA999PjwwzCdKOkw5+
         jWMXoyvix/wL6gh6OkxE4EYSzkizlD7/qC07YjdLgY90YBdyOTjXmFH2vVk2PEsC38ae
         kk6tOF26pPHjDoZLUOcRIlTLYhVv8825jIZVl1T+D4gBVonx5UxYPPiEV3/DcM4MTxKz
         8dHEJKQclEHhZmwl6RVrxTQ/Ed8Lvoq2vF1bVtc9k/dydCyX92AopkF5iDWax2PlaFff
         YeUhcZ2tj5EdZk1ZyWFpQgzAeUHkwEhUsyI5JEEwKF4TOG97YWBK3fXP0807Xkq3A9gA
         WsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709650606; x=1710255406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK88LFU6d4t1JCWizGmXtGUXUraCe7bvokdPTzV9QjY=;
        b=AHHACrEDIMyNyBfHI3MTTKNZocQ1Leb2HNyXU6KKjI2q5+RVrnz0s/U5bYug7KXf3w
         wQ848GLRvj9/GeAssFv/bQHRSZ1sk+35cDtCYap2p4iei6HHiJtt6uo+vfvHn550qM98
         1oDuzZzKoRHk2F9JBbe1uJ85cVS1zsZGfE5e2RnQM9repJ+roVk/SgRZY7HhOfivGPKt
         ZQ03VjH+WrX0K0g9RqDg3xPp4hcLPLF7MIJJJe0Ylz6K/vgYdDwjQO1ZstDbdBEvOTAl
         v6h+ahM6lsj9vTJsyNRILBiO6eKo5d0il94mXzgYyVWOZ+j2Cs86kdCyMlj/XttqMrQs
         C8/g==
X-Forwarded-Encrypted: i=1; AJvYcCXfjlQeT29OofyDYoFP5/HiX/OxdpFM40DvRCoJzftUbgfsP1bFMBdPrJnnVLXMzqVRLFC9ssAkUApL0pwH4jo2EpVkvIusKFUurZY=
X-Gm-Message-State: AOJu0YxOW+HzQ490BHDCJw4J0CetxikM+2drWisoE83kkzczqka/NUsd
	PptGQRBgedhJm0OVtRyrGjc+KkzvixZfxRAXFYgWs7YNKBG3jymW8YL6GWLgU8PiVyMbDO6gE+5
	2NnKkFAE/WJrUQ00M0RfHyKhju3YOkphLfxfc8A==
X-Google-Smtp-Source: AGHT+IFIPkTQ0souRpS2hfJyh4AoRga7CQnVQVdJWezf9On7erpt8yfFFKC5hojgz70O21GGeHYO8UNqQMswicGuHGY=
X-Received: by 2002:a5b:704:0:b0:dc6:17d2:3b89 with SMTP id
 g4-20020a5b0704000000b00dc617d23b89mr8701539ybq.61.1709650606042; Tue, 05 Mar
 2024 06:56:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <pu6odo6wc35tidrtfhn25osuzmbit3v7zefu4avmrsohb5rgq2@6kcskamimlee> <20240304195131.GC9233@pendragon.ideasonboard.com>
In-Reply-To: <20240304195131.GC9233@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Mar 2024 14:56:29 +0000
Message-ID: <CAPY8ntC1d1z3QvLuvdLRy6+LuiO_4kB87DL0d_rkfjJzdvwtyg@mail.gmail.com>
Subject: Re: [PATCH v6 09/15] media: bcm2835-unicam: Add support for CCP2/CSI2
 camera interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Naushir Patuck <naush@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com, 
	linux-rpi-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 19:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Mon, Mar 04, 2024 at 06:12:21PM +0100, Jacopo Mondi wrote:
> > On Fri, Mar 01, 2024 at 11:32:24PM +0200, Laurent Pinchart wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > > It is represented as two video device nodes: unicam-image and
> > > unicam-embedded which are connected to an internal subdev (named
> > > unicam-subdev) in order to manage streams routing.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > Changes since v5:
> > >
> > > - Move to drivers/media/platform/broadcom/
> > > - Port to the upstream V4L2 streams API
> > > - Rebase on latest metadata API proposal
> > > - Add missing error message
> > > - Drop unneeded documentation block for unicam_isr()
> > > - Drop unneeded dev_dbg() and dev_err() messages
> > > - Drop unneeded streams_mask and fmt checks
> > > - Drop unused unicam_sd_pad_is_sink()
> > > - Drop unneeded includes
> > > - Drop v4l2_ctrl_subscribe_event() call
> > > - Use pm_runtime_resume_and_get()
> > > - Indentation and line wrap fixes
> > > - Let the framework set bus_info
> > > - Use v4l2_fwnode_endpoint_parse()
> > > - Fix media device cleanup
> > > - Drop lane reordering checks
> > > - Fix subdev state locking
> > > - Drop extra debug messages
> > > - Move clock handling to runtime PM handlers
> > > - Reorder functions
> > > - Rename init functions for more clarity
> > > - Initialize runtime PM earlier
> > > - Clarify error messages
> > > - Simplify subdev init with local variable
> > > - Fix subdev cleanup
> > > - Fix typos and indentation
> > > - Don't initialize local variables needlessly
> > > - Simplify num lanes check
> > > - Fix metadata handling in subdev set_fmt
> > > - Drop manual fallback to .s_stream()
> > > - Pass v4l2_pix_format to unicam_calc_format_size_bpl()
> > > - Simplify unicam_set_default_format()
> > > - Fix default format settings
> > > - Add busy check in unicam_s_fmt_meta()
> > > - Add missing \n at end of format strings
> > > - Fix metadata handling in subdev set_fmt
> > > - Fix locking when starting streaming
> > > - Return buffers from start streaming fails
> > > - Fix format validation for metadata node
> > > - Use video_device_pipeline_{start,stop}() helpers
> > > - Simplify format enumeration
> > > - Drop unset variable
> > > - Update MAINTAINERS entry
> > > - Update to the upstream v4l2_async_nf API
> > > - Update to the latest subdev routing API
> > > - Update to the latest subdev state API
> > > - Move from subdev .init_cfg() to .init_state()
> > > - Update to the latest videobuf2 API
> > > - Fix v4l2_subdev_enable_streams() error check
> > > - Use correct pad for the connected subdev
> > > - Return buffers to vb2 when start streaming fails
> > > - Improve debugging in start streaming handler
> > > - Simplify DMA address management
> > > - Drop comment about bcm2835-camera driver
> > > - Clarify comments that explain min/max sizes
> > > - Pass v4l2_pix_format to unicam_try_fmt()
> > > - Drop unneeded local variables
> > > - Rename image-related constants and functions
> > > - Turn unicam_fmt.metadata_fmt into bool
> > > - Rename unicam_fmt to unicam_format_info
> > > - Rename unicam_format_info variables to fmtinfo
> > > - Rename unicam_node.v_fmt to fmt
> > > - Add metadata formats for RAW10, RAW12 and RAW14
> > > - Make metadata formats line-based
> > > - Validate format on metadata video device
> > > - Add Co-devlopped-by tags
> > >
> > > Changes since v3:
> > >
> > > - Add the vendor prefix for DT name
> > > - Use the reg-names in DT parsing
> > > - Remove MAINTAINERS entry
> > >
> > > Changes since v2:
> > >
> > > - Change code organization
> > > - Remove unused variables
> > > - Correct the fmt_meta functions
> > > - Rewrite the start/stop streaming
> > >   - You can now start the image node alone, but not the metadata one
> > >   - The buffers are allocated per-node
> > >   - only the required stream is started, if the route exists and is
> > >     enabled
> > > - Prefix the macros with UNICAM_ to not have too generic names
> > > - Drop colorspace support
> > >
> > > Changes since v1:
> > >
> > > - Replace the unicam_{info,debug,error} macros with dev_*()
> > > ---
> > >  MAINTAINERS                                   |    1 +
> > >  drivers/media/platform/Kconfig                |    1 +
> > >  drivers/media/platform/Makefile               |    1 +
> > >  drivers/media/platform/broadcom/Kconfig       |   23 +
> > >  drivers/media/platform/broadcom/Makefile      |    3 +
> > >  .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
> > >  .../media/platform/broadcom/bcm2835-unicam.c  | 2607 +++++++++++++++++
> > >  7 files changed, 2891 insertions(+)
> > >  create mode 100644 drivers/media/platform/broadcom/Kconfig
> > >  create mode 100644 drivers/media/platform/broadcom/Makefile
> > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> > >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
>
> [snip]
>
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > new file mode 100644
> > > index 000000000000..716c89b8a217
> > > --- /dev/null
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -0,0 +1,2607 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * BCM283x / BCM271x Unicam Capture Driver
> > > + *
> > > + * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
> > > + *
> > > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > + *
> > > + * Based on TI am437x driver by
> > > + *   Benoit Parrot <bparrot@ti.com>
> > > + *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > + *
> > > + * and TI CAL camera interface driver by
> > > + *    Benoit Parrot <bparrot@ti.com>
> > > + *
> > > + *
> > > + * There are two camera drivers in the kernel for BCM283x - this one and
> > > + * bcm2835-camera (currently in staging).
> > > + *
> > > + * This driver directly controls the Unicam peripheral - there is no
> > > + * involvement with the VideoCore firmware. Unicam receives CSI-2 or CCP2 data
> > > + * and writes it into SDRAM. The only potential processing options are to
> > > + * repack Bayer data into an alternate format, and applying windowing. The
> > > + * repacking does not shift the data, so can repack V4L2_PIX_FMT_Sxxxx10P to
> > > + * V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_Sxxxx12, but
> > > + * not generically up to V4L2_PIX_FMT_Sxxxx16. The driver will add both formats
> > > + * where the relevant formats are defined, and will automatically configure the
> > > + * repacking as required. Support for windowing may be added later.
> >
> > Does this last paragraph applies ? I see all the supported packed raw
> > format having an 'unpacked_fourcc' associated (all but the 8 bit ones
> > ofc)
>
> Maybe I'm tired, but I'm not sure to understand why you think it may not
> apply.
>
> > > + *
> > > + * It should be possible to connect this driver to any sensor with a suitable
> > > + * output interface and V4L2 subdevice driver.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/err.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/videodev2.h>
> > > +
> > > +#include <media/v4l2-async.h>
> > > +#include <media/v4l2-common.h>
> > > +#include <media/v4l2-dev.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mc.h>
> > > +#include <media/videobuf2-dma-contig.h>
> > > +
> > > +#include "bcm2835-unicam-regs.h"
> > > +
> > > +#define UNICAM_MODULE_NAME         "unicam"
> > > +
> > > +/*
> > > + * Unicam must request a minimum of 250Mhz from the VPU clock.
> > > + * Otherwise the input FIFOs overrun and cause image corruption.
> > > + */
> > > +#define UNICAM_MIN_VPU_CLOCK_RATE  (250 * 1000 * 1000)
> >
> > Shouldn't this be set in DT ?
>
> With assigned-clock-rates ? Then the clock would always run at 250MHz
> (or higher, depending on the rate in the DT), while the driver ensures
> it runs at at least 250MHz only when the device is being used.
>
> > > +
> > > +/* Unicam has an internal DMA alignment constraint of 16 bytes for each line. */
> > > +#define UNICAM_DMA_BPL_ALIGNMENT   16
> > > +
> > > +/*
> > > + * The image stride is stored in a 16 bit register, and needs to be aligned to
> > > + * the DMA constraint. As the ISP in the same SoC has a 32 bytes alignment
> > > + * constraint on its input, set the image stride alignment to 32 bytes here as
> > > + * well to avoid incompatible configurations.
> > > + */
> > > +#define UNICAM_IMAGE_BPL_ALIGNMENT 32
> > > +#define UNICAM_IMAGE_MAX_BPL               ((1 << 16) - UNICAM_IMAGE_BPL_ALIGNMENT)
> > > +
> > > +/*
> > > + * Max width is therefore determined by the max stride divided by the number of
> > > + * bits per pixel. Take 32bpp as a worst case. No imposed limit on the height,
> > > + * so adopt a square image for want of anything better.
> > > + */
> > > +#define UNICAM_IMAGE_MIN_WIDTH             16
> > > +#define UNICAM_IMAGE_MIN_HEIGHT            16
> > > +#define UNICAM_IMAGE_MAX_WIDTH             (UNICAM_IMAGE_MAX_BPL / 4)
> > > +#define UNICAM_IMAGE_MAX_HEIGHT            UNICAM_IMAGE_MAX_WIDTH
> > > +
> > > +/*
> > > + * There's no intrinsic limits on the width and height for embedded dat. Use

s/dat/data

> > > + * the same maximum values as for the image, to avoid overflows in the image
> > > + * size computation.
> > > + */
> > > +#define UNICAM_META_MIN_WIDTH              1
> > > +#define UNICAM_META_MIN_HEIGHT             1
> > > +#define UNICAM_META_MAX_WIDTH              UNICAM_IMAGE_MAX_WIDTH
> > > +#define UNICAM_META_MAX_HEIGHT             UNICAM_IMAGE_MAX_HEIGHT
> > > +
> > > +/*
> > > + * Size of the dummy buffer. Can be any size really, but the DMA
> > > + * allocation works in units of page sizes.
> > > + */
> > > +#define UNICAM_DUMMY_BUF_SIZE              PAGE_SIZE
> > > +
> > > +#define UNICAM_SD_PAD_SINK         0
> > > +#define UNICAM_SD_PAD_SOURCE_IMAGE 1
> > > +#define UNICAM_SD_PAD_SOURCE_METADATA      2
> > > +#define UNICAM_SD_NUM_PADS         (1 + UNICAM_SD_PAD_SOURCE_METADATA)
> >
> > How about an enum then ?
>
> OK.
>
> > > +
> > > +enum unicam_node_type {
> > > +   UNICAM_IMAGE_NODE,
> > > +   UNICAM_METADATA_NODE,
> > > +   UNICAM_MAX_NODES
> > > +};
> > > +
> > > +/*
> > > + * struct unicam_format_info - Unicam media bus format information
> > > + * @fourcc: V4L2 pixel format FCC identifier. 0 if n/a.
> > > + * @unpacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
> > > + * out to 16bpp. 0 if n/a.
> > > + * @code: V4L2 media bus format code.
> > > + * @depth: Bits per pixel as delivered from the source.
> > > + * @csi_dt: CSI data type.
> > > + * @metadata_fmt: This format only applies to the metadata pad.
> > > + */
> > > +struct unicam_format_info {
> > > +   u32     fourcc;
> > > +   u32     unpacked_fourcc;
> > > +   u32     code;
> > > +   u8      depth;
> > > +   u8      csi_dt;
> > > +   bool    metadata_fmt;
> > > +};
> > > +
> > > +struct unicam_buffer {
> > > +   struct vb2_v4l2_buffer vb;
> > > +   struct list_head list;
> > > +   dma_addr_t dma_addr;
> > > +   unsigned int size;
> > > +};
> > > +
> > > +static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer *vb)
> > > +{
> > > +   return container_of(vb, struct unicam_buffer, vb.vb2_buf);
> > > +}
> > > +
> > > +struct unicam_node {
> > > +   bool registered;
> > > +   bool streaming;
> > > +   unsigned int id;
> > > +
> > > +   /* Pointer to the current v4l2_buffer */
> > > +   struct unicam_buffer *cur_frm;
> > > +   /* Pointer to the next v4l2_buffer */
> > > +   struct unicam_buffer *next_frm;
> > > +   /* video capture */
> > > +   const struct unicam_format_info *fmtinfo;
> > > +   /* Used to store current pixel format */
> > > +   struct v4l2_format fmt;
> > > +   /* Buffer queue used in video-buf */
> > > +   struct vb2_queue buffer_queue;
> > > +   /* Queue of filled frames */
> > > +   struct list_head dma_queue;
> > > +   /* IRQ lock for DMA queue */
> > > +   spinlock_t dma_queue_lock;
> > > +   /* lock used to access this structure */
> > > +   struct mutex lock;
> > > +   /* Identifies video device for this channel */
> > > +   struct video_device video_dev;
> > > +   /* Pointer to the parent handle */
> > > +   struct unicam_device *dev;
> > > +   struct media_pad pad;
> > > +   /*
> > > +    * Dummy buffer intended to be used by unicam
> > > +    * if we have no other queued buffers to swap to.
> > > +    */
> > > +   struct unicam_buffer dummy_buf;
> > > +   void *dummy_buf_cpu_addr;
> > > +};
> > > +
> > > +struct unicam_device {
> > > +   struct kref kref;
> > > +
> > > +   /* peripheral base address */
> > > +   void __iomem *base;
> > > +   /* clock gating base address */
> > > +   void __iomem *clk_gate_base;
> >
> > Is the clock gating part of unicam or should this be expressed as a
> > clock provide and be referenced in DT through a phandle ?
>
> No idea :-) Dave, Naush ?

Answered in my previous reply.

> > > +   /* lp clock handle */
> > > +   struct clk *clock;
> > > +   /* vpu clock handle */
> > > +   struct clk *vpu_clock;
> > > +   /* V4l2 device */
> > > +   struct v4l2_device v4l2_dev;
> > > +   struct media_device mdev;
> > > +
> > > +   /* parent device */
> > > +   struct device *dev;
> > > +   /* subdevice async Notifier */
> >
> > s/Notifier/notifier
> >
> > > +   struct v4l2_async_notifier notifier;
> > > +   unsigned int sequence;
> > > +
> > > +   /* Sensor node */
> > > +   struct {
> > > +           struct v4l2_subdev *subdev;
> > > +           struct media_pad *pad;
> > > +   } sensor;
> > > +
> > > +   /* Internal subdev */
> > > +   struct {
> > > +           struct v4l2_subdev sd;
> > > +           struct media_pad pads[UNICAM_SD_NUM_PADS];
> > > +           bool streaming;
> > > +   } subdev;
> > > +
> > > +   enum v4l2_mbus_type bus_type;
> > > +   /*
> > > +    * Stores bus.mipi_csi2.flags for CSI2 sensors, or
> > > +    * bus.mipi_csi1.strobe for CCP2.
> > > +    */
> > > +   unsigned int bus_flags;
> > > +   unsigned int max_data_lanes;
> > > +   unsigned int active_data_lanes;
> > > +
> > > +   struct media_pipeline pipe;
> > > +
> > > +   struct unicam_node node[UNICAM_MAX_NODES];
> > > +};
> > > +
> > > +static inline struct unicam_device *
> > > +notifier_to_unicam_device(struct v4l2_async_notifier *notifier)
> > > +{
> > > +   return container_of(notifier, struct unicam_device, notifier);
> > > +}
> > > +
> > > +static inline struct unicam_device *
> >
> > I thought using inline is disouraged as the compiler knows what to do
>
> For this kind of wrapper around container_of() the kernel usually has an
> explicit inline keyword. I can drop it if needed.
>
> > > +sd_to_unicam_device(struct v4l2_subdev *sd)
> > > +{
> > > +   return container_of(sd, struct unicam_device, subdev.sd);
> >
> > You can also use container_of_const() if you need it
>
> There's no const subdev anywhere.
>
> > > +}
> > > +
> > > +static void unicam_release(struct kref *kref)
> > > +{
> > > +   struct unicam_device *unicam =
> > > +           container_of(kref, struct unicam_device, kref);
> > > +
> > > +   if (unicam->mdev.dev)
> > > +           media_device_cleanup(&unicam->mdev);
> > > +
> > > +   kfree(unicam);
> > > +}
> > > +
> > > +static struct unicam_device *unicam_get(struct unicam_device *unicam)
> > > +{
> > > +   kref_get(&unicam->kref);
> > > +   return unicam;
> > > +}
> > > +
> > > +static void unicam_put(struct unicam_device *unicam)
> > > +{
> > > +   kref_put(&unicam->kref, unicam_release);
> > > +}
> > > +
> >
> > Does this handle a bit more gracefully the pesky lifetime management
> > issue in v4l2 ?
>
> That's supposed to be the idea :-)
>
> > > +/* -----------------------------------------------------------------------------
> > > + * Misc helper functions
> > > + */
> > > +
> > > +static inline bool unicam_sd_pad_is_source(u32 pad)
> > > +{
> > > +   /* Camera RX has 1 sink pad, and N source pads */
> > > +   return pad != UNICAM_SD_PAD_SINK;
> > > +}
> > > +
> > > +static inline bool is_metadata_node(struct unicam_node *node)
> > > +{
> > > +   return node->video_dev.device_caps & V4L2_CAP_META_CAPTURE;
> > > +}
> > > +
> > > +static inline bool is_image_node(struct unicam_node *node)
> > > +{
> > > +   return node->video_dev.device_caps & V4L2_CAP_VIDEO_CAPTURE;
> > > +}
>
> [snip]
>
> > > +/* -----------------------------------------------------------------------------
> > > + * Videobuf2 queue operations
> > > + */
> > > +
> > > +static int unicam_queue_setup(struct vb2_queue *vq,
> > > +                         unsigned int *nbuffers,
> > > +                         unsigned int *nplanes,
> > > +                         unsigned int sizes[],
> > > +                         struct device *alloc_devs[])
> > > +{
> > > +   struct unicam_node *node = vb2_get_drv_priv(vq);
> > > +   u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
> > > +            : node->fmt.fmt.meta.buffersize;
> > > +
> > > +   if (vq->num_buffers + *nbuffers < 3)
> >
> > Why 3 ? Are these dummies ?
>
> This may be a remnant of old code. Dave, Naush, any comment ?

I suspect this is legacy.
Originally the driver would only release the buffer at the frame end
when it had a new one to switch to. Naush updated with the dummy
buffer so in theory you can run with 1 buffer, but this min number of
buffers probably didn't get reduced.
Then again it may have been a misunderstanding of the framework, as
struct vb2_queue min_buffers_needed should set the minimum.

> > > +           *nbuffers = 3 - vq->num_buffers;
> > > +
> > > +   if (*nplanes) {
> > > +           if (sizes[0] < size) {
> > > +                   dev_dbg(node->dev->dev, "sizes[0] %i < size %u\n",
> > > +                           sizes[0], size);
> > > +                   return -EINVAL;
> > > +           }
> > > +           size = sizes[0];
> > > +   }
> > > +
> > > +   *nplanes = 1;
> > > +   sizes[0] = size;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_buffer_prepare(struct vb2_buffer *vb)
> > > +{
> > > +   struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > > +   struct unicam_buffer *buf = to_unicam_buffer(vb);
> > > +   u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
> > > +            : node->fmt.fmt.meta.buffersize;
> > > +
> > > +   if (vb2_plane_size(vb, 0) < size) {
> > > +           dev_dbg(node->dev->dev,
> > > +                   "data will not fit into plane (%lu < %u)\n",
> > > +                   vb2_plane_size(vb, 0), size);
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   buf->dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> > > +   buf->size = size;
> > > +
> > > +   vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static void unicam_return_buffers(struct unicam_node *node,
> > > +                             enum vb2_buffer_state state)
> > > +{
> > > +   struct unicam_buffer *buf, *tmp;
> > > +
> > > +   list_for_each_entry_safe(buf, tmp, &node->dma_queue, list) {
> > > +           list_del(&buf->list);
> > > +           vb2_buffer_done(&buf->vb.vb2_buf, state);
> > > +   }
> > > +
> > > +   if (node->cur_frm)
> > > +           vb2_buffer_done(&node->cur_frm->vb.vb2_buf,
> > > +                           state);
> > > +   if (node->next_frm && node->cur_frm != node->next_frm)
> > > +           vb2_buffer_done(&node->next_frm->vb.vb2_buf,
> > > +                           state);
> > > +
> > > +   node->cur_frm = NULL;
> > > +   node->next_frm = NULL;
> > > +}
> > > +
> > > +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> > > +{
> > > +   struct unicam_node *node = vb2_get_drv_priv(vq);
> > > +   struct unicam_device *unicam = node->dev;
> > > +   struct v4l2_subdev_state *state;
> > > +   struct unicam_buffer *buf;
> > > +   unsigned long flags;
> > > +   int ret;
> > > +   u32 pad, stream;
> > > +   u32 remote_pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > > +                                        : UNICAM_SD_PAD_SOURCE_METADATA;
> > > +
> > > +   /* Look for the route for the given pad and stream. */
> > > +   state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
> > > +   ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
> > > +                                               remote_pad, 0,
> > > +                                               &pad, &stream);
> > > +   v4l2_subdev_unlock_state(state);
> > > +
> > > +   if (ret)
> > > +           goto err_return_buffers;
> > > +
> > > +   dev_dbg(unicam->dev, "Starting stream on %s: %u/%u -> %u/%u (%s)\n",
> > > +           unicam->subdev.sd.name, pad, stream, remote_pad, 0,
> > > +           is_metadata_node(node) ? "metadata" : "image");
> > > +
> > > +   /* The metadata node can't be started alone. */
> > > +   if (is_metadata_node(node)) {
> > > +           if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
> >
> > Does it mean the metadata node has to be started second, or should
> > this be made a nop and the metadata node gets started once the image
> > node is started too ? I'm fine with the constraint of having the
> > metadata node being started second fwiw
>
> I think it would be nice to change this indeed. Dave, Naush, any
> objection ?

See previous email.

> > > +                   dev_err(unicam->dev,
> > > +                           "Can't start metadata without image\n");
> > > +                   ret = -EINVAL;
> > > +                   goto err_return_buffers;
> > > +           }
> > > +
> > > +           spin_lock_irqsave(&node->dma_queue_lock, flags);
> > > +           buf = list_first_entry(&node->dma_queue,
> > > +                                  struct unicam_buffer, list);
> > > +           dev_dbg(unicam->dev, "buffer %p\n", buf);
> >
> > Is this useful ?
>
> Probably not much. I'll drop it.
>
> > > +           node->cur_frm = buf;
> > > +           node->next_frm = buf;
> > > +           list_del(&buf->list);
> > > +           spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > > +
> > > +           unicam_start_metadata(unicam, buf);
> > > +           node->streaming = true;
> > > +           return 0;
> > > +   }
> > > +
> > > +   ret = pm_runtime_resume_and_get(unicam->dev);
> > > +   if (ret < 0) {
> > > +           dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
> > > +           goto err_return_buffers;
> > > +   }
> > > +
> > > +   ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe);
> > > +   if (ret < 0) {
> > > +           dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
> >
> > Isn't this an err ?
>
> The main cause of failure is a pipeline validation error, triggered by
> userspace, hence the debug level.
>
> > > +           goto err_pm_put;
> > > +   }
> > > +
> > > +   spin_lock_irqsave(&node->dma_queue_lock, flags);
> > > +   buf = list_first_entry(&node->dma_queue,
> > > +                          struct unicam_buffer, list);
> > > +   dev_dbg(unicam->dev, "buffer %p\n", buf);
> > > +   node->cur_frm = buf;
> > > +   node->next_frm = buf;
> > > +   list_del(&buf->list);
> > > +   spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > > +
> > > +   unicam_start_rx(unicam, buf);
> > > +
> > > +   ret = v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad, BIT(0));
> >
> > A bit confused by the API here, shouldn't we also do this for embedded
> > data ?
>
> Not here, as the two streams go over different pads, but likely above,
> as part of the change you proposed regarding stream start on the
> metadata device. I'll wait for Dave and Naush to reply, and I'll rework
> this function.

I haven't read enough on the streams API, or what this implementation
looks like.

There's no sensible way for a sensor to start embedded or other
metadata without image data, so starting the image node would seem to
be the main trigger for anything. I'm also assuming we don't support
enabling additional multiplexed streams once the pipeline is already
running, so that would seem to determine some of the sequencing.

  Dave

> > > +   if (ret < 0) {
> > > +           dev_err(unicam->dev, "stream on failed in subdev\n");
> > > +           goto error_pipeline;
> > > +   }
> > > +
> > > +   node->streaming = true;
> > > +
> > > +   return 0;
> > > +
> > > +error_pipeline:
> > > +   video_device_pipeline_stop(&node->video_dev);
> > > +err_pm_put:
> > > +   pm_runtime_put_sync(unicam->dev);
> > > +err_return_buffers:
> > > +   unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
> > > +   return ret;
> > > +}
> > > +
> > > +static void unicam_stop_streaming(struct vb2_queue *vq)
> > > +{
> > > +   struct unicam_node *node = vb2_get_drv_priv(vq);
> > > +   struct unicam_device *unicam = node->dev;
> > > +   u32 remote_pad_index = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > > +                                              : UNICAM_SD_PAD_SOURCE_METADATA;
> > > +
> > > +   node->streaming = false;
> > > +
> > > +   v4l2_subdev_disable_streams(&unicam->subdev.sd, remote_pad_index,
> > > +                               BIT(0));
> > > +
> > > +   /* We can stream only with the image node. */
> > > +   if (is_metadata_node(node)) {
> > > +           /*
> > > +            * Allow the hardware to spin in the dummy buffer.
> > > +            * This is only really needed if the embedded data pad is
> > > +            * disabled before the image pad.
> > > +            */
> > > +           unicam_wr_dma_addr(node, &node->dummy_buf);
> > > +           goto dequeue_buffers;
> > > +   }
> > > +
> > > +   unicam_disable(unicam);
> > > +
> > > +   video_device_pipeline_stop(&node->video_dev);
> > > +   pm_runtime_put(unicam->dev);
> > > +
> > > +dequeue_buffers:
> > > +   /* Clear all queued buffers for the node */
> > > +   unicam_return_buffers(node, VB2_BUF_STATE_ERROR);
> > > +}
> > > +
> > > +static void unicam_buffer_queue(struct vb2_buffer *vb)
> > > +{
> > > +   struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > > +   struct unicam_buffer *buf = to_unicam_buffer(vb);
> > > +
> > > +   spin_lock_irq(&node->dma_queue_lock);
> > > +   list_add_tail(&buf->list, &node->dma_queue);
> > > +   spin_unlock_irq(&node->dma_queue_lock);
> > > +}
> > > +
> > > +static const struct vb2_ops unicam_video_qops = {
> > > +   .queue_setup            = unicam_queue_setup,
> > > +   .wait_prepare           = vb2_ops_wait_prepare,
> > > +   .wait_finish            = vb2_ops_wait_finish,
> > > +   .buf_prepare            = unicam_buffer_prepare,
> > > +   .start_streaming        = unicam_start_streaming,
> > > +   .stop_streaming         = unicam_stop_streaming,
> > > +   .buf_queue              = unicam_buffer_queue,
> > > +};
> > > +
> > > +/* -----------------------------------------------------------------------------
> > > + *  V4L2 video device operations
> > > + */
> > > +
> > > +static int unicam_querycap(struct file *file, void *priv,
> > > +                      struct v4l2_capability *cap)
> > > +{
> > > +   strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
> > > +   strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
> > > +
> > > +   cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_enum_fmt_vid(struct file *file, void  *priv,
> > > +                          struct v4l2_fmtdesc *f)
> > > +{
> > > +   unsigned int index;
> > > +   unsigned int i;
> > > +
> > > +   for (i = 0, index = 0; i < ARRAY_SIZE(unicam_image_formats); i++) {
> > > +           if (f->mbus_code && unicam_image_formats[i].code != f->mbus_code)
> > > +                   continue;
> > > +
> > > +           if (index == f->index) {
> > > +                   f->pixelformat = unicam_image_formats[i].fourcc;
> > > +                   return 0;
> > > +           }
> > > +
> > > +           index++;
> > > +
> > > +           if (!unicam_image_formats[i].unpacked_fourcc)
> > > +                   continue;
> > > +
> > > +           if (index == f->index) {
> > > +                   f->pixelformat = unicam_image_formats[i].unpacked_fourcc;
> > > +                   return 0;
> > > +           }
> > > +
> > > +           index++;
> > > +   }
> > > +
> > > +   return -EINVAL;
> > > +}
> > > +
> > > +static int unicam_g_fmt_vid(struct file *file, void *priv,
> > > +                       struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   *f = node->fmt;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct unicam_format_info *
> > > +__unicam_try_fmt_vid(struct unicam_node *node, struct v4l2_pix_format *pix)
> > > +{
> > > +   const struct unicam_format_info *fmtinfo;
> > > +
> > > +   /*
> > > +    * Default to the first format if the requested pixel format code isn't
> > > +    * supported.
> > > +    */
> > > +   fmtinfo = unicam_find_format_by_fourcc(pix->pixelformat,
> > > +                                          UNICAM_SD_PAD_SOURCE_IMAGE);
> > > +   if (!fmtinfo) {
> > > +           fmtinfo = &unicam_image_formats[0];
> > > +           pix->pixelformat = fmtinfo->fourcc;
> > > +   }
> > > +
> > > +   unicam_calc_image_size_bpl(node->dev, fmtinfo, pix);
> > > +
> > > +   if (pix->field == V4L2_FIELD_ANY)
> > > +           pix->field = V4L2_FIELD_NONE;
> > > +
> > > +   return fmtinfo;
> > > +}
> > > +
> > > +static int unicam_try_fmt_vid(struct file *file, void *priv,
> > > +                         struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   __unicam_try_fmt_vid(node, &f->fmt.pix);
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_s_fmt_vid(struct file *file, void *priv,
> > > +                       struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   if (vb2_is_busy(&node->buffer_queue))
> > > +           return -EBUSY;
> > > +
> > > +   node->fmtinfo = __unicam_try_fmt_vid(node, &f->fmt.pix);
> > > +   node->fmt = *f;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_enum_fmt_meta(struct file *file, void *priv,
> > > +                           struct v4l2_fmtdesc *f)
> > > +{
> > > +   unsigned int i, index;
> > > +
> > > +   for (i = 0, index = 0; i < ARRAY_SIZE(unicam_meta_formats); i++) {
> > > +           if (f->mbus_code && unicam_meta_formats[i].code != f->mbus_code)
> >
> > Do we want to allow mbus_code filtering for metadata ? There's a
> > 1-to-1 relationship between mbus codes and pixel formats
>
> Is there a reason not to allow it ? I think it's good for the API to be
> consistent. Generally speaking, a CSI-2 receiver could receive
> META_CSI2_10 and convert it to the META_8 pixel format. Filtering as a
> concept thus make sense I think.
>
> > > +                   continue;
> > > +           if (!unicam_meta_formats[i].metadata_fmt)
> > > +                   continue;
> >
> > How can this be false if we're iterating on unicam_meta_formats[] ?
>
> True. I'll drop the metadata_fmt field.
>
> > > +
> > > +           if (index == f->index) {
> > > +                   f->pixelformat = unicam_meta_formats[i].fourcc;
> > > +                   f->type = V4L2_BUF_TYPE_META_CAPTURE;
> > > +                   return 0;
> > > +           }
> > > +           index++;
> > > +   }
> > > +
> > > +   return -EINVAL;
> > > +}
> > > +
> > > +static int unicam_g_fmt_meta(struct file *file, void *priv,
> > > +                        struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   f->fmt.meta = node->fmt.fmt.meta;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct unicam_format_info *
> > > +__unicam_try_fmt_meta(struct unicam_node *node, struct v4l2_meta_format *meta)
> > > +{
> > > +   const struct unicam_format_info *fmtinfo;
> > > +
> > > +   /*
> > > +    * Default to the first format if the requested pixel format code isn't
> > > +    * supported.
> > > +    */
> > > +   fmtinfo = unicam_find_format_by_fourcc(meta->dataformat,
> > > +                                          UNICAM_SD_PAD_SOURCE_METADATA);
> > > +   if (!fmtinfo) {
> > > +           fmtinfo = &unicam_meta_formats[0];
> > > +           meta->dataformat = fmtinfo->fourcc;
> > > +   }
> > > +
> > > +   unicam_calc_meta_size_bpl(node->dev, fmtinfo, meta);
> > > +
> > > +   return fmtinfo;
> > > +}
> > > +
> > > +static int unicam_try_fmt_meta(struct file *file, void *priv,
> > > +                          struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   __unicam_try_fmt_vid(node, &f->fmt.pix);
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_s_fmt_meta(struct file *file, void *priv,
> > > +                        struct v4l2_format *f)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +
> > > +   if (vb2_is_busy(&node->buffer_queue))
> > > +           return -EBUSY;
> > > +
> > > +   node->fmtinfo = __unicam_try_fmt_meta(node, &f->fmt.meta);
> > > +   node->fmt = *f;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int unicam_enum_framesizes(struct file *file, void *fh,
> > > +                             struct v4l2_frmsizeenum *fsize)
> > > +{
> > > +   struct unicam_node *node = video_drvdata(file);
> > > +   int ret = -EINVAL;
> > > +
> > > +   if (fsize->index > 0)
> > > +           return ret;
> > > +
> > > +   if (is_image_node(node)) {
> > > +           if (!unicam_find_format_by_fourcc(fsize->pixel_format,
> > > +                                             UNICAM_SD_PAD_SOURCE_IMAGE))
> > > +                   return ret;
> > > +
> > > +           fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > > +           fsize->stepwise.min_width = UNICAM_IMAGE_MIN_WIDTH;
> > > +           fsize->stepwise.max_width = UNICAM_IMAGE_MAX_WIDTH;
> > > +           fsize->stepwise.step_width = 1;
> > > +           fsize->stepwise.min_height = UNICAM_IMAGE_MIN_HEIGHT;
> > > +           fsize->stepwise.max_height = UNICAM_IMAGE_MAX_HEIGHT;
> > > +           fsize->stepwise.step_height = 1;
> > > +   } else {
> > > +           if (!unicam_find_format_by_fourcc(fsize->pixel_format,
> > > +                                             UNICAM_SD_PAD_SOURCE_METADATA))
> > > +                   return ret;
> > > +
> >
> > Isn't this V4L2_FRMSIZE_TYPE_STEPWISE as well ?
>
> Indeed, I'll fix that.
>
> > > +           fsize->stepwise.min_width = UNICAM_META_MIN_WIDTH;
> > > +           fsize->stepwise.max_width = UNICAM_META_MAX_WIDTH;
> > > +           fsize->stepwise.step_width = 1;
> > > +           fsize->stepwise.min_height = UNICAM_META_MIN_HEIGHT;
> > > +           fsize->stepwise.max_height = UNICAM_META_MAX_HEIGHT;
> > > +           fsize->stepwise.step_height = 1;
> > > +   }
> > > +
> > > +   return 0;
> > > +}
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart

