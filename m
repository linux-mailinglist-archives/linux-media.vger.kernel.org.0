Return-Path: <linux-media+bounces-6377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B6870B01
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 20:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFCB1C21CA2
	for <lists+linux-media@lfdr.de>; Mon,  4 Mar 2024 19:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C26C79DD8;
	Mon,  4 Mar 2024 19:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lLDKFPNC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E91E4AA;
	Mon,  4 Mar 2024 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709581895; cv=none; b=pABGgfa8fStKFr3UVQajo+DlXShFAojEJXEHL0LBooLHqYLlIlm5a0dVQv1cOWlcdVPxc6JqW8yS2ZKtWSwl83Pbnqqs6M6/Q0v3YskZFfwaqnM7xsGrTRMAFvCbXhMAsUMrbpQNWvIO6trsU39b0UpstTWl/JfJbXJS02ezHmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709581895; c=relaxed/simple;
	bh=MNx6AacZ5sky67px/Uf4ORa0RjxPB7ya3c+IbREjsfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ri94qj7uUmbldr9DGs9ADaC/8LxKz7hT1l1opCAGSGwcClZ8YB1pJDzi5lC/ng6OzAXluq3gGj8wfzVCIfUPVYB97mQLbUSHLThwdUVhR/TCXA4So2G/kynmelxW3uKdZJoDqJGzzwC8L//XoxaDgBkGHNDU9Npn4IkmvLaasnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lLDKFPNC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 599C41FB2;
	Mon,  4 Mar 2024 20:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709581873;
	bh=MNx6AacZ5sky67px/Uf4ORa0RjxPB7ya3c+IbREjsfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLDKFPNCaqu0CKNVeSe+Dc5/c1GxGxD3/brCi+ffNlb6NJEHmUuBlPA5AIMtFOFtj
	 Ktg54jibum6QmSadzfn++fkdCVXePReKLC5/ZkY+25XWONEW4JTWeT+PBvnLhaQZXz
	 6FHAvP+940EEFb4A1Yc56Q+wfThjri50T/mPdp40=
Date: Mon, 4 Mar 2024 21:51:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 09/15] media: bcm2835-unicam: Add support for
 CCP2/CSI2 camera interface
Message-ID: <20240304195131.GC9233@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <pu6odo6wc35tidrtfhn25osuzmbit3v7zefu4avmrsohb5rgq2@6kcskamimlee>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pu6odo6wc35tidrtfhn25osuzmbit3v7zefu4avmrsohb5rgq2@6kcskamimlee>

Hi Jacopo,

On Mon, Mar 04, 2024 at 06:12:21PM +0100, Jacopo Mondi wrote:
> On Fri, Mar 01, 2024 at 11:32:24PM +0200, Laurent Pinchart wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > Add a driver for the Unicam camera receiver block on BCM283x processors.
> > It is represented as two video device nodes: unicam-image and
> > unicam-embedded which are connected to an internal subdev (named
> > unicam-subdev) in order to manage streams routing.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v5:
> >
> > - Move to drivers/media/platform/broadcom/
> > - Port to the upstream V4L2 streams API
> > - Rebase on latest metadata API proposal
> > - Add missing error message
> > - Drop unneeded documentation block for unicam_isr()
> > - Drop unneeded dev_dbg() and dev_err() messages
> > - Drop unneeded streams_mask and fmt checks
> > - Drop unused unicam_sd_pad_is_sink()
> > - Drop unneeded includes
> > - Drop v4l2_ctrl_subscribe_event() call
> > - Use pm_runtime_resume_and_get()
> > - Indentation and line wrap fixes
> > - Let the framework set bus_info
> > - Use v4l2_fwnode_endpoint_parse()
> > - Fix media device cleanup
> > - Drop lane reordering checks
> > - Fix subdev state locking
> > - Drop extra debug messages
> > - Move clock handling to runtime PM handlers
> > - Reorder functions
> > - Rename init functions for more clarity
> > - Initialize runtime PM earlier
> > - Clarify error messages
> > - Simplify subdev init with local variable
> > - Fix subdev cleanup
> > - Fix typos and indentation
> > - Don't initialize local variables needlessly
> > - Simplify num lanes check
> > - Fix metadata handling in subdev set_fmt
> > - Drop manual fallback to .s_stream()
> > - Pass v4l2_pix_format to unicam_calc_format_size_bpl()
> > - Simplify unicam_set_default_format()
> > - Fix default format settings
> > - Add busy check in unicam_s_fmt_meta()
> > - Add missing \n at end of format strings
> > - Fix metadata handling in subdev set_fmt
> > - Fix locking when starting streaming
> > - Return buffers from start streaming fails
> > - Fix format validation for metadata node
> > - Use video_device_pipeline_{start,stop}() helpers
> > - Simplify format enumeration
> > - Drop unset variable
> > - Update MAINTAINERS entry
> > - Update to the upstream v4l2_async_nf API
> > - Update to the latest subdev routing API
> > - Update to the latest subdev state API
> > - Move from subdev .init_cfg() to .init_state()
> > - Update to the latest videobuf2 API
> > - Fix v4l2_subdev_enable_streams() error check
> > - Use correct pad for the connected subdev
> > - Return buffers to vb2 when start streaming fails
> > - Improve debugging in start streaming handler
> > - Simplify DMA address management
> > - Drop comment about bcm2835-camera driver
> > - Clarify comments that explain min/max sizes
> > - Pass v4l2_pix_format to unicam_try_fmt()
> > - Drop unneeded local variables
> > - Rename image-related constants and functions
> > - Turn unicam_fmt.metadata_fmt into bool
> > - Rename unicam_fmt to unicam_format_info
> > - Rename unicam_format_info variables to fmtinfo
> > - Rename unicam_node.v_fmt to fmt
> > - Add metadata formats for RAW10, RAW12 and RAW14
> > - Make metadata formats line-based
> > - Validate format on metadata video device
> > - Add Co-devlopped-by tags
> >
> > Changes since v3:
> >
> > - Add the vendor prefix for DT name
> > - Use the reg-names in DT parsing
> > - Remove MAINTAINERS entry
> >
> > Changes since v2:
> >
> > - Change code organization
> > - Remove unused variables
> > - Correct the fmt_meta functions
> > - Rewrite the start/stop streaming
> >   - You can now start the image node alone, but not the metadata one
> >   - The buffers are allocated per-node
> >   - only the required stream is started, if the route exists and is
> >     enabled
> > - Prefix the macros with UNICAM_ to not have too generic names
> > - Drop colorspace support
> >
> > Changes since v1:
> >
> > - Replace the unicam_{info,debug,error} macros with dev_*()
> > ---
> >  MAINTAINERS                                   |    1 +
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    1 +
> >  drivers/media/platform/broadcom/Kconfig       |   23 +
> >  drivers/media/platform/broadcom/Makefile      |    3 +
> >  .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
> >  .../media/platform/broadcom/bcm2835-unicam.c  | 2607 +++++++++++++++++
> >  7 files changed, 2891 insertions(+)
> >  create mode 100644 drivers/media/platform/broadcom/Kconfig
> >  create mode 100644 drivers/media/platform/broadcom/Makefile
> >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> >  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c

[snip]

> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > new file mode 100644
> > index 000000000000..716c89b8a217
> > --- /dev/null
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -0,0 +1,2607 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * BCM283x / BCM271x Unicam Capture Driver
> > + *
> > + * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
> > + *
> > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > + *
> > + * Based on TI am437x driver by
> > + *   Benoit Parrot <bparrot@ti.com>
> > + *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > + *
> > + * and TI CAL camera interface driver by
> > + *    Benoit Parrot <bparrot@ti.com>
> > + *
> > + *
> > + * There are two camera drivers in the kernel for BCM283x - this one and
> > + * bcm2835-camera (currently in staging).
> > + *
> > + * This driver directly controls the Unicam peripheral - there is no
> > + * involvement with the VideoCore firmware. Unicam receives CSI-2 or CCP2 data
> > + * and writes it into SDRAM. The only potential processing options are to
> > + * repack Bayer data into an alternate format, and applying windowing. The
> > + * repacking does not shift the data, so can repack V4L2_PIX_FMT_Sxxxx10P to
> > + * V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_Sxxxx12, but
> > + * not generically up to V4L2_PIX_FMT_Sxxxx16. The driver will add both formats
> > + * where the relevant formats are defined, and will automatically configure the
> > + * repacking as required. Support for windowing may be added later.
> 
> Does this last paragraph applies ? I see all the supported packed raw
> format having an 'unpacked_fourcc' associated (all but the 8 bit ones
> ofc)

Maybe I'm tired, but I'm not sure to understand why you think it may not
apply.

> > + *
> > + * It should be possible to connect this driver to any sensor with a suitable
> > + * output interface and V4L2 subdevice driver.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mc.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "bcm2835-unicam-regs.h"
> > +
> > +#define UNICAM_MODULE_NAME		"unicam"
> > +
> > +/*
> > + * Unicam must request a minimum of 250Mhz from the VPU clock.
> > + * Otherwise the input FIFOs overrun and cause image corruption.
> > + */
> > +#define UNICAM_MIN_VPU_CLOCK_RATE	(250 * 1000 * 1000)
> 
> Shouldn't this be set in DT ?

With assigned-clock-rates ? Then the clock would always run at 250MHz
(or higher, depending on the rate in the DT), while the driver ensures
it runs at at least 250MHz only when the device is being used.

> > +
> > +/* Unicam has an internal DMA alignment constraint of 16 bytes for each line. */
> > +#define UNICAM_DMA_BPL_ALIGNMENT	16
> > +
> > +/*
> > + * The image stride is stored in a 16 bit register, and needs to be aligned to
> > + * the DMA constraint. As the ISP in the same SoC has a 32 bytes alignment
> > + * constraint on its input, set the image stride alignment to 32 bytes here as
> > + * well to avoid incompatible configurations.
> > + */
> > +#define UNICAM_IMAGE_BPL_ALIGNMENT	32
> > +#define UNICAM_IMAGE_MAX_BPL		((1 << 16) - UNICAM_IMAGE_BPL_ALIGNMENT)
> > +
> > +/*
> > + * Max width is therefore determined by the max stride divided by the number of
> > + * bits per pixel. Take 32bpp as a worst case. No imposed limit on the height,
> > + * so adopt a square image for want of anything better.
> > + */
> > +#define UNICAM_IMAGE_MIN_WIDTH		16
> > +#define UNICAM_IMAGE_MIN_HEIGHT		16
> > +#define UNICAM_IMAGE_MAX_WIDTH		(UNICAM_IMAGE_MAX_BPL / 4)
> > +#define UNICAM_IMAGE_MAX_HEIGHT		UNICAM_IMAGE_MAX_WIDTH
> > +
> > +/*
> > + * There's no intrinsic limits on the width and height for embedded dat. Use
> > + * the same maximum values as for the image, to avoid overflows in the image
> > + * size computation.
> > + */
> > +#define UNICAM_META_MIN_WIDTH		1
> > +#define UNICAM_META_MIN_HEIGHT		1
> > +#define UNICAM_META_MAX_WIDTH		UNICAM_IMAGE_MAX_WIDTH
> > +#define UNICAM_META_MAX_HEIGHT		UNICAM_IMAGE_MAX_HEIGHT
> > +
> > +/*
> > + * Size of the dummy buffer. Can be any size really, but the DMA
> > + * allocation works in units of page sizes.
> > + */
> > +#define UNICAM_DUMMY_BUF_SIZE		PAGE_SIZE
> > +
> > +#define UNICAM_SD_PAD_SINK		0
> > +#define UNICAM_SD_PAD_SOURCE_IMAGE	1
> > +#define UNICAM_SD_PAD_SOURCE_METADATA	2
> > +#define UNICAM_SD_NUM_PADS		(1 + UNICAM_SD_PAD_SOURCE_METADATA)
> 
> How about an enum then ?

OK.

> > +
> > +enum unicam_node_type {
> > +	UNICAM_IMAGE_NODE,
> > +	UNICAM_METADATA_NODE,
> > +	UNICAM_MAX_NODES
> > +};
> > +
> > +/*
> > + * struct unicam_format_info - Unicam media bus format information
> > + * @fourcc: V4L2 pixel format FCC identifier. 0 if n/a.
> > + * @unpacked_fourcc: V4L2 pixel format FCC identifier if the data is expanded
> > + * out to 16bpp. 0 if n/a.
> > + * @code: V4L2 media bus format code.
> > + * @depth: Bits per pixel as delivered from the source.
> > + * @csi_dt: CSI data type.
> > + * @metadata_fmt: This format only applies to the metadata pad.
> > + */
> > +struct unicam_format_info {
> > +	u32	fourcc;
> > +	u32	unpacked_fourcc;
> > +	u32	code;
> > +	u8	depth;
> > +	u8	csi_dt;
> > +	bool	metadata_fmt;
> > +};
> > +
> > +struct unicam_buffer {
> > +	struct vb2_v4l2_buffer vb;
> > +	struct list_head list;
> > +	dma_addr_t dma_addr;
> > +	unsigned int size;
> > +};
> > +
> > +static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer *vb)
> > +{
> > +	return container_of(vb, struct unicam_buffer, vb.vb2_buf);
> > +}
> > +
> > +struct unicam_node {
> > +	bool registered;
> > +	bool streaming;
> > +	unsigned int id;
> > +
> > +	/* Pointer to the current v4l2_buffer */
> > +	struct unicam_buffer *cur_frm;
> > +	/* Pointer to the next v4l2_buffer */
> > +	struct unicam_buffer *next_frm;
> > +	/* video capture */
> > +	const struct unicam_format_info *fmtinfo;
> > +	/* Used to store current pixel format */
> > +	struct v4l2_format fmt;
> > +	/* Buffer queue used in video-buf */
> > +	struct vb2_queue buffer_queue;
> > +	/* Queue of filled frames */
> > +	struct list_head dma_queue;
> > +	/* IRQ lock for DMA queue */
> > +	spinlock_t dma_queue_lock;
> > +	/* lock used to access this structure */
> > +	struct mutex lock;
> > +	/* Identifies video device for this channel */
> > +	struct video_device video_dev;
> > +	/* Pointer to the parent handle */
> > +	struct unicam_device *dev;
> > +	struct media_pad pad;
> > +	/*
> > +	 * Dummy buffer intended to be used by unicam
> > +	 * if we have no other queued buffers to swap to.
> > +	 */
> > +	struct unicam_buffer dummy_buf;
> > +	void *dummy_buf_cpu_addr;
> > +};
> > +
> > +struct unicam_device {
> > +	struct kref kref;
> > +
> > +	/* peripheral base address */
> > +	void __iomem *base;
> > +	/* clock gating base address */
> > +	void __iomem *clk_gate_base;
> 
> Is the clock gating part of unicam or should this be expressed as a
> clock provide and be referenced in DT through a phandle ?

No idea :-) Dave, Naush ?

> > +	/* lp clock handle */
> > +	struct clk *clock;
> > +	/* vpu clock handle */
> > +	struct clk *vpu_clock;
> > +	/* V4l2 device */
> > +	struct v4l2_device v4l2_dev;
> > +	struct media_device mdev;
> > +
> > +	/* parent device */
> > +	struct device *dev;
> > +	/* subdevice async Notifier */
> 
> s/Notifier/notifier
> 
> > +	struct v4l2_async_notifier notifier;
> > +	unsigned int sequence;
> > +
> > +	/* Sensor node */
> > +	struct {
> > +		struct v4l2_subdev *subdev;
> > +		struct media_pad *pad;
> > +	} sensor;
> > +
> > +	/* Internal subdev */
> > +	struct {
> > +		struct v4l2_subdev sd;
> > +		struct media_pad pads[UNICAM_SD_NUM_PADS];
> > +		bool streaming;
> > +	} subdev;
> > +
> > +	enum v4l2_mbus_type bus_type;
> > +	/*
> > +	 * Stores bus.mipi_csi2.flags for CSI2 sensors, or
> > +	 * bus.mipi_csi1.strobe for CCP2.
> > +	 */
> > +	unsigned int bus_flags;
> > +	unsigned int max_data_lanes;
> > +	unsigned int active_data_lanes;
> > +
> > +	struct media_pipeline pipe;
> > +
> > +	struct unicam_node node[UNICAM_MAX_NODES];
> > +};
> > +
> > +static inline struct unicam_device *
> > +notifier_to_unicam_device(struct v4l2_async_notifier *notifier)
> > +{
> > +	return container_of(notifier, struct unicam_device, notifier);
> > +}
> > +
> > +static inline struct unicam_device *
> 
> I thought using inline is disouraged as the compiler knows what to do

For this kind of wrapper around container_of() the kernel usually has an
explicit inline keyword. I can drop it if needed.

> > +sd_to_unicam_device(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct unicam_device, subdev.sd);
> 
> You can also use container_of_const() if you need it

There's no const subdev anywhere.

> > +}
> > +
> > +static void unicam_release(struct kref *kref)
> > +{
> > +	struct unicam_device *unicam =
> > +		container_of(kref, struct unicam_device, kref);
> > +
> > +	if (unicam->mdev.dev)
> > +		media_device_cleanup(&unicam->mdev);
> > +
> > +	kfree(unicam);
> > +}
> > +
> > +static struct unicam_device *unicam_get(struct unicam_device *unicam)
> > +{
> > +	kref_get(&unicam->kref);
> > +	return unicam;
> > +}
> > +
> > +static void unicam_put(struct unicam_device *unicam)
> > +{
> > +	kref_put(&unicam->kref, unicam_release);
> > +}
> > +
> 
> Does this handle a bit more gracefully the pesky lifetime management
> issue in v4l2 ?

That's supposed to be the idea :-)

> > +/* -----------------------------------------------------------------------------
> > + * Misc helper functions
> > + */
> > +
> > +static inline bool unicam_sd_pad_is_source(u32 pad)
> > +{
> > +	/* Camera RX has 1 sink pad, and N source pads */
> > +	return pad != UNICAM_SD_PAD_SINK;
> > +}
> > +
> > +static inline bool is_metadata_node(struct unicam_node *node)
> > +{
> > +	return node->video_dev.device_caps & V4L2_CAP_META_CAPTURE;
> > +}
> > +
> > +static inline bool is_image_node(struct unicam_node *node)
> > +{
> > +	return node->video_dev.device_caps & V4L2_CAP_VIDEO_CAPTURE;
> > +}

[snip]

> > +/* -----------------------------------------------------------------------------
> > + * Videobuf2 queue operations
> > + */
> > +
> > +static int unicam_queue_setup(struct vb2_queue *vq,
> > +			      unsigned int *nbuffers,
> > +			      unsigned int *nplanes,
> > +			      unsigned int sizes[],
> > +			      struct device *alloc_devs[])
> > +{
> > +	struct unicam_node *node = vb2_get_drv_priv(vq);
> > +	u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
> > +		 : node->fmt.fmt.meta.buffersize;
> > +
> > +	if (vq->num_buffers + *nbuffers < 3)
> 
> Why 3 ? Are these dummies ?

This may be a remnant of old code. Dave, Naush, any comment ?

> > +		*nbuffers = 3 - vq->num_buffers;
> > +
> > +	if (*nplanes) {
> > +		if (sizes[0] < size) {
> > +			dev_dbg(node->dev->dev, "sizes[0] %i < size %u\n",
> > +				sizes[0], size);
> > +			return -EINVAL;
> > +		}
> > +		size = sizes[0];
> > +	}
> > +
> > +	*nplanes = 1;
> > +	sizes[0] = size;
> > +
> > +	return 0;
> > +}
> > +
> > +static int unicam_buffer_prepare(struct vb2_buffer *vb)
> > +{
> > +	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct unicam_buffer *buf = to_unicam_buffer(vb);
> > +	u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
> > +		 : node->fmt.fmt.meta.buffersize;
> > +
> > +	if (vb2_plane_size(vb, 0) < size) {
> > +		dev_dbg(node->dev->dev,
> > +			"data will not fit into plane (%lu < %u)\n",
> > +			vb2_plane_size(vb, 0), size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	buf->dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> > +	buf->size = size;
> > +
> > +	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, size);
> > +
> > +	return 0;
> > +}
> > +
> > +static void unicam_return_buffers(struct unicam_node *node,
> > +				  enum vb2_buffer_state state)
> > +{
> > +	struct unicam_buffer *buf, *tmp;
> > +
> > +	list_for_each_entry_safe(buf, tmp, &node->dma_queue, list) {
> > +		list_del(&buf->list);
> > +		vb2_buffer_done(&buf->vb.vb2_buf, state);
> > +	}
> > +
> > +	if (node->cur_frm)
> > +		vb2_buffer_done(&node->cur_frm->vb.vb2_buf,
> > +				state);
> > +	if (node->next_frm && node->cur_frm != node->next_frm)
> > +		vb2_buffer_done(&node->next_frm->vb.vb2_buf,
> > +				state);
> > +
> > +	node->cur_frm = NULL;
> > +	node->next_frm = NULL;
> > +}
> > +
> > +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> > +{
> > +	struct unicam_node *node = vb2_get_drv_priv(vq);
> > +	struct unicam_device *unicam = node->dev;
> > +	struct v4l2_subdev_state *state;
> > +	struct unicam_buffer *buf;
> > +	unsigned long flags;
> > +	int ret;
> > +	u32 pad, stream;
> > +	u32 remote_pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > +					     : UNICAM_SD_PAD_SOURCE_METADATA;
> > +
> > +	/* Look for the route for the given pad and stream. */
> > +	state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
> > +	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
> > +						    remote_pad, 0,
> > +						    &pad, &stream);
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	if (ret)
> > +		goto err_return_buffers;
> > +
> > +	dev_dbg(unicam->dev, "Starting stream on %s: %u/%u -> %u/%u (%s)\n",
> > +		unicam->subdev.sd.name, pad, stream, remote_pad, 0,
> > +		is_metadata_node(node) ? "metadata" : "image");
> > +
> > +	/* The metadata node can't be started alone. */
> > +	if (is_metadata_node(node)) {
> > +		if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
> 
> Does it mean the metadata node has to be started second, or should
> this be made a nop and the metadata node gets started once the image
> node is started too ? I'm fine with the constraint of having the
> metadata node being started second fwiw

I think it would be nice to change this indeed. Dave, Naush, any
objection ?

> > +			dev_err(unicam->dev,
> > +				"Can't start metadata without image\n");
> > +			ret = -EINVAL;
> > +			goto err_return_buffers;
> > +		}
> > +
> > +		spin_lock_irqsave(&node->dma_queue_lock, flags);
> > +		buf = list_first_entry(&node->dma_queue,
> > +				       struct unicam_buffer, list);
> > +		dev_dbg(unicam->dev, "buffer %p\n", buf);
> 
> Is this useful ?

Probably not much. I'll drop it.

> > +		node->cur_frm = buf;
> > +		node->next_frm = buf;
> > +		list_del(&buf->list);
> > +		spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > +
> > +		unicam_start_metadata(unicam, buf);
> > +		node->streaming = true;
> > +		return 0;
> > +	}
> > +
> > +	ret = pm_runtime_resume_and_get(unicam->dev);
> > +	if (ret < 0) {
> > +		dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
> > +		goto err_return_buffers;
> > +	}
> > +
> > +	ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe);
> > +	if (ret < 0) {
> > +		dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
> 
> Isn't this an err ?

The main cause of failure is a pipeline validation error, triggered by
userspace, hence the debug level.

> > +		goto err_pm_put;
> > +	}
> > +
> > +	spin_lock_irqsave(&node->dma_queue_lock, flags);
> > +	buf = list_first_entry(&node->dma_queue,
> > +			       struct unicam_buffer, list);
> > +	dev_dbg(unicam->dev, "buffer %p\n", buf);
> > +	node->cur_frm = buf;
> > +	node->next_frm = buf;
> > +	list_del(&buf->list);
> > +	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > +
> > +	unicam_start_rx(unicam, buf);
> > +
> > +	ret = v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad, BIT(0));
> 
> A bit confused by the API here, shouldn't we also do this for embedded
> data ?

Not here, as the two streams go over different pads, but likely above,
as part of the change you proposed regarding stream start on the
metadata device. I'll wait for Dave and Naush to reply, and I'll rework
this function.

> > +	if (ret < 0) {
> > +		dev_err(unicam->dev, "stream on failed in subdev\n");
> > +		goto error_pipeline;
> > +	}
> > +
> > +	node->streaming = true;
> > +
> > +	return 0;
> > +
> > +error_pipeline:
> > +	video_device_pipeline_stop(&node->video_dev);
> > +err_pm_put:
> > +	pm_runtime_put_sync(unicam->dev);
> > +err_return_buffers:
> > +	unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
> > +	return ret;
> > +}
> > +
> > +static void unicam_stop_streaming(struct vb2_queue *vq)
> > +{
> > +	struct unicam_node *node = vb2_get_drv_priv(vq);
> > +	struct unicam_device *unicam = node->dev;
> > +	u32 remote_pad_index = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > +						   : UNICAM_SD_PAD_SOURCE_METADATA;
> > +
> > +	node->streaming = false;
> > +
> > +	v4l2_subdev_disable_streams(&unicam->subdev.sd, remote_pad_index,
> > +				    BIT(0));
> > +
> > +	/* We can stream only with the image node. */
> > +	if (is_metadata_node(node)) {
> > +		/*
> > +		 * Allow the hardware to spin in the dummy buffer.
> > +		 * This is only really needed if the embedded data pad is
> > +		 * disabled before the image pad.
> > +		 */
> > +		unicam_wr_dma_addr(node, &node->dummy_buf);
> > +		goto dequeue_buffers;
> > +	}
> > +
> > +	unicam_disable(unicam);
> > +
> > +	video_device_pipeline_stop(&node->video_dev);
> > +	pm_runtime_put(unicam->dev);
> > +
> > +dequeue_buffers:
> > +	/* Clear all queued buffers for the node */
> > +	unicam_return_buffers(node, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static void unicam_buffer_queue(struct vb2_buffer *vb)
> > +{
> > +	struct unicam_node *node = vb2_get_drv_priv(vb->vb2_queue);
> > +	struct unicam_buffer *buf = to_unicam_buffer(vb);
> > +
> > +	spin_lock_irq(&node->dma_queue_lock);
> > +	list_add_tail(&buf->list, &node->dma_queue);
> > +	spin_unlock_irq(&node->dma_queue_lock);
> > +}
> > +
> > +static const struct vb2_ops unicam_video_qops = {
> > +	.queue_setup		= unicam_queue_setup,
> > +	.wait_prepare		= vb2_ops_wait_prepare,
> > +	.wait_finish		= vb2_ops_wait_finish,
> > +	.buf_prepare		= unicam_buffer_prepare,
> > +	.start_streaming	= unicam_start_streaming,
> > +	.stop_streaming		= unicam_stop_streaming,
> > +	.buf_queue		= unicam_buffer_queue,
> > +};
> > +
> > +/* -----------------------------------------------------------------------------
> > + *  V4L2 video device operations
> > + */
> > +
> > +static int unicam_querycap(struct file *file, void *priv,
> > +			   struct v4l2_capability *cap)
> > +{
> > +	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
> > +	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
> > +
> > +	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
> > +
> > +	return 0;
> > +}
> > +
> > +static int unicam_enum_fmt_vid(struct file *file, void  *priv,
> > +			       struct v4l2_fmtdesc *f)
> > +{
> > +	unsigned int index;
> > +	unsigned int i;
> > +
> > +	for (i = 0, index = 0; i < ARRAY_SIZE(unicam_image_formats); i++) {
> > +		if (f->mbus_code && unicam_image_formats[i].code != f->mbus_code)
> > +			continue;
> > +
> > +		if (index == f->index) {
> > +			f->pixelformat = unicam_image_formats[i].fourcc;
> > +			return 0;
> > +		}
> > +
> > +		index++;
> > +
> > +		if (!unicam_image_formats[i].unpacked_fourcc)
> > +			continue;
> > +
> > +		if (index == f->index) {
> > +			f->pixelformat = unicam_image_formats[i].unpacked_fourcc;
> > +			return 0;
> > +		}
> > +
> > +		index++;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int unicam_g_fmt_vid(struct file *file, void *priv,
> > +			    struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	*f = node->fmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct unicam_format_info *
> > +__unicam_try_fmt_vid(struct unicam_node *node, struct v4l2_pix_format *pix)
> > +{
> > +	const struct unicam_format_info *fmtinfo;
> > +
> > +	/*
> > +	 * Default to the first format if the requested pixel format code isn't
> > +	 * supported.
> > +	 */
> > +	fmtinfo = unicam_find_format_by_fourcc(pix->pixelformat,
> > +					       UNICAM_SD_PAD_SOURCE_IMAGE);
> > +	if (!fmtinfo) {
> > +		fmtinfo = &unicam_image_formats[0];
> > +		pix->pixelformat = fmtinfo->fourcc;
> > +	}
> > +
> > +	unicam_calc_image_size_bpl(node->dev, fmtinfo, pix);
> > +
> > +	if (pix->field == V4L2_FIELD_ANY)
> > +		pix->field = V4L2_FIELD_NONE;
> > +
> > +	return fmtinfo;
> > +}
> > +
> > +static int unicam_try_fmt_vid(struct file *file, void *priv,
> > +			      struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	__unicam_try_fmt_vid(node, &f->fmt.pix);
> > +	return 0;
> > +}
> > +
> > +static int unicam_s_fmt_vid(struct file *file, void *priv,
> > +			    struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	if (vb2_is_busy(&node->buffer_queue))
> > +		return -EBUSY;
> > +
> > +	node->fmtinfo = __unicam_try_fmt_vid(node, &f->fmt.pix);
> > +	node->fmt = *f;
> > +
> > +	return 0;
> > +}
> > +
> > +static int unicam_enum_fmt_meta(struct file *file, void *priv,
> > +				struct v4l2_fmtdesc *f)
> > +{
> > +	unsigned int i, index;
> > +
> > +	for (i = 0, index = 0; i < ARRAY_SIZE(unicam_meta_formats); i++) {
> > +		if (f->mbus_code && unicam_meta_formats[i].code != f->mbus_code)
> 
> Do we want to allow mbus_code filtering for metadata ? There's a
> 1-to-1 relationship between mbus codes and pixel formats

Is there a reason not to allow it ? I think it's good for the API to be
consistent. Generally speaking, a CSI-2 receiver could receive
META_CSI2_10 and convert it to the META_8 pixel format. Filtering as a
concept thus make sense I think.

> > +			continue;
> > +		if (!unicam_meta_formats[i].metadata_fmt)
> > +			continue;
> 
> How can this be false if we're iterating on unicam_meta_formats[] ?

True. I'll drop the metadata_fmt field.

> > +
> > +		if (index == f->index) {
> > +			f->pixelformat = unicam_meta_formats[i].fourcc;
> > +			f->type = V4L2_BUF_TYPE_META_CAPTURE;
> > +			return 0;
> > +		}
> > +		index++;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int unicam_g_fmt_meta(struct file *file, void *priv,
> > +			     struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	f->fmt.meta = node->fmt.fmt.meta;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct unicam_format_info *
> > +__unicam_try_fmt_meta(struct unicam_node *node, struct v4l2_meta_format *meta)
> > +{
> > +	const struct unicam_format_info *fmtinfo;
> > +
> > +	/*
> > +	 * Default to the first format if the requested pixel format code isn't
> > +	 * supported.
> > +	 */
> > +	fmtinfo = unicam_find_format_by_fourcc(meta->dataformat,
> > +					       UNICAM_SD_PAD_SOURCE_METADATA);
> > +	if (!fmtinfo) {
> > +		fmtinfo = &unicam_meta_formats[0];
> > +		meta->dataformat = fmtinfo->fourcc;
> > +	}
> > +
> > +	unicam_calc_meta_size_bpl(node->dev, fmtinfo, meta);
> > +
> > +	return fmtinfo;
> > +}
> > +
> > +static int unicam_try_fmt_meta(struct file *file, void *priv,
> > +			       struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	__unicam_try_fmt_vid(node, &f->fmt.pix);
> > +	return 0;
> > +}
> > +
> > +static int unicam_s_fmt_meta(struct file *file, void *priv,
> > +			     struct v4l2_format *f)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +
> > +	if (vb2_is_busy(&node->buffer_queue))
> > +		return -EBUSY;
> > +
> > +	node->fmtinfo = __unicam_try_fmt_meta(node, &f->fmt.meta);
> > +	node->fmt = *f;
> > +
> > +	return 0;
> > +}
> > +
> > +static int unicam_enum_framesizes(struct file *file, void *fh,
> > +				  struct v4l2_frmsizeenum *fsize)
> > +{
> > +	struct unicam_node *node = video_drvdata(file);
> > +	int ret = -EINVAL;
> > +
> > +	if (fsize->index > 0)
> > +		return ret;
> > +
> > +	if (is_image_node(node)) {
> > +		if (!unicam_find_format_by_fourcc(fsize->pixel_format,
> > +						  UNICAM_SD_PAD_SOURCE_IMAGE))
> > +			return ret;
> > +
> > +		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > +		fsize->stepwise.min_width = UNICAM_IMAGE_MIN_WIDTH;
> > +		fsize->stepwise.max_width = UNICAM_IMAGE_MAX_WIDTH;
> > +		fsize->stepwise.step_width = 1;
> > +		fsize->stepwise.min_height = UNICAM_IMAGE_MIN_HEIGHT;
> > +		fsize->stepwise.max_height = UNICAM_IMAGE_MAX_HEIGHT;
> > +		fsize->stepwise.step_height = 1;
> > +	} else {
> > +		if (!unicam_find_format_by_fourcc(fsize->pixel_format,
> > +						  UNICAM_SD_PAD_SOURCE_METADATA))
> > +			return ret;
> > +
>
> Isn't this V4L2_FRMSIZE_TYPE_STEPWISE as well ?

Indeed, I'll fix that.

> > +		fsize->stepwise.min_width = UNICAM_META_MIN_WIDTH;
> > +		fsize->stepwise.max_width = UNICAM_META_MAX_WIDTH;
> > +		fsize->stepwise.step_width = 1;
> > +		fsize->stepwise.min_height = UNICAM_META_MIN_HEIGHT;
> > +		fsize->stepwise.max_height = UNICAM_META_MAX_HEIGHT;
> > +		fsize->stepwise.step_height = 1;
> > +	}
> > +
> > +	return 0;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart

