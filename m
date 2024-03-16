Return-Path: <linux-media+bounces-7178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94E87DC08
	for <lists+linux-media@lfdr.de>; Sun, 17 Mar 2024 00:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 178A8281958
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 23:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC46446C8;
	Sat, 16 Mar 2024 23:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jKOs8s+L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CAD1BF40;
	Sat, 16 Mar 2024 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710633303; cv=none; b=In/ALhEoFawU5qcyr0qyvvyVi7D5DUrFmUoAYg4wQIPRiZrplAD1QbUkx8uQjW5JWuwWwQAwAN+BwIwGYY5rP0kfYTOMOlYMVFNcIycflb++oJjZvkdw05AWNKPIMuWyc3IbZNhmGY7LLY/PRjbhKuWdnt1blpEo4wxiHpmEkfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710633303; c=relaxed/simple;
	bh=lcGxklmCsKxZM51ZuYFToHx4iXT+BhCuD37HHiZFoi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ojnp6QkHl+QcEM62utCbqME8Vo/CE6ukzj8R1Fupr+Me0tkf/ezN7Z6zDE5rjkg9NTvAM+860yNMLQrTtdcaWMtCXWXgzvSIliZlOEnWpkzDvcKtQ5JO3yCKgBgiNmzbMuVqO5MPnIsHkIsXyIzV8+Ha2vJo5cmNAUCm7vzHWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jKOs8s+L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 954D9183;
	Sun, 17 Mar 2024 00:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710633273;
	bh=lcGxklmCsKxZM51ZuYFToHx4iXT+BhCuD37HHiZFoi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKOs8s+LiI1YNVcree1BeSeEexrdL4Kv6EujkMqImKaN9gw5YBWGR84tL45GXzmtZ
	 5Ibmu83k7QZ0M7Z3g2BkSCTPoWXDNIv3K3J3+aUePJABkAj7VCGhCBUPDtD5Y0tsLm
	 n8YQOEK1eII6eZNSwllqVXHHEFb5gUNE4LqYsH3Q=
Date: Sun, 17 Mar 2024 01:54:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
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
Message-ID: <20240316235456.GD9082@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <pu6odo6wc35tidrtfhn25osuzmbit3v7zefu4avmrsohb5rgq2@6kcskamimlee>
 <20240304195131.GC9233@pendragon.ideasonboard.com>
 <CAPY8ntC1d1z3QvLuvdLRy6+LuiO_4kB87DL0d_rkfjJzdvwtyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC1d1z3QvLuvdLRy6+LuiO_4kB87DL0d_rkfjJzdvwtyg@mail.gmail.com>

Hi Dave,

On Tue, Mar 05, 2024 at 02:56:29PM +0000, Dave Stevenson wrote:
> On Mon, 4 Mar 2024 at 19:51, Laurent Pinchart wrote:
> > On Mon, Mar 04, 2024 at 06:12:21PM +0100, Jacopo Mondi wrote:
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
> >
> > [snip]
> >
> > > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > new file mode 100644
> > > > index 000000000000..716c89b8a217
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > > @@ -0,0 +1,2607 @@

[snip]

> > > > +/* -----------------------------------------------------------------------------
> > > > + * Videobuf2 queue operations
> > > > + */
> > > > +
> > > > +static int unicam_queue_setup(struct vb2_queue *vq,
> > > > +                         unsigned int *nbuffers,
> > > > +                         unsigned int *nplanes,
> > > > +                         unsigned int sizes[],
> > > > +                         struct device *alloc_devs[])
> > > > +{
> > > > +   struct unicam_node *node = vb2_get_drv_priv(vq);
> > > > +   u32 size = is_image_node(node) ? node->fmt.fmt.pix.sizeimage
> > > > +            : node->fmt.fmt.meta.buffersize;
> > > > +
> > > > +   if (vq->num_buffers + *nbuffers < 3)
> > >
> > > Why 3 ? Are these dummies ?
> >
> > This may be a remnant of old code. Dave, Naush, any comment ?
> 
> I suspect this is legacy.
> Originally the driver would only release the buffer at the frame end
> when it had a new one to switch to. Naush updated with the dummy
> buffer so in theory you can run with 1 buffer, but this min number of
> buffers probably didn't get reduced.
> Then again it may have been a misunderstanding of the framework, as
> struct vb2_queue min_buffers_needed should set the minimum.

I'll drop this.

> > > > +           *nbuffers = 3 - vq->num_buffers;
> > > > +
> > > > +   if (*nplanes) {
> > > > +           if (sizes[0] < size) {
> > > > +                   dev_dbg(node->dev->dev, "sizes[0] %i < size %u\n",
> > > > +                           sizes[0], size);
> > > > +                   return -EINVAL;
> > > > +           }
> > > > +           size = sizes[0];
> > > > +   }
> > > > +
> > > > +   *nplanes = 1;
> > > > +   sizes[0] = size;
> > > > +
> > > > +   return 0;
> > > > +}

[snip]

> > > > +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> > > > +{
> > > > +   struct unicam_node *node = vb2_get_drv_priv(vq);
> > > > +   struct unicam_device *unicam = node->dev;
> > > > +   struct v4l2_subdev_state *state;
> > > > +   struct unicam_buffer *buf;
> > > > +   unsigned long flags;
> > > > +   int ret;
> > > > +   u32 pad, stream;
> > > > +   u32 remote_pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > > > +                                        : UNICAM_SD_PAD_SOURCE_METADATA;
> > > > +
> > > > +   /* Look for the route for the given pad and stream. */
> > > > +   state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
> > > > +   ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
> > > > +                                               remote_pad, 0,
> > > > +                                               &pad, &stream);
> > > > +   v4l2_subdev_unlock_state(state);
> > > > +
> > > > +   if (ret)
> > > > +           goto err_return_buffers;
> > > > +
> > > > +   dev_dbg(unicam->dev, "Starting stream on %s: %u/%u -> %u/%u (%s)\n",
> > > > +           unicam->subdev.sd.name, pad, stream, remote_pad, 0,
> > > > +           is_metadata_node(node) ? "metadata" : "image");
> > > > +
> > > > +   /* The metadata node can't be started alone. */
> > > > +   if (is_metadata_node(node)) {
> > > > +           if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
> > >
> > > Does it mean the metadata node has to be started second, or should
> > > this be made a nop and the metadata node gets started once the image
> > > node is started too ? I'm fine with the constraint of having the
> > > metadata node being started second fwiw
> >
> > I think it would be nice to change this indeed. Dave, Naush, any
> > objection ?
> 
> See previous email.
> 
> > > > +                   dev_err(unicam->dev,
> > > > +                           "Can't start metadata without image\n");
> > > > +                   ret = -EINVAL;
> > > > +                   goto err_return_buffers;
> > > > +           }
> > > > +
> > > > +           spin_lock_irqsave(&node->dma_queue_lock, flags);
> > > > +           buf = list_first_entry(&node->dma_queue,
> > > > +                                  struct unicam_buffer, list);
> > > > +           dev_dbg(unicam->dev, "buffer %p\n", buf);
> > >
> > > Is this useful ?
> >
> > Probably not much. I'll drop it.
> >
> > > > +           node->cur_frm = buf;
> > > > +           node->next_frm = buf;
> > > > +           list_del(&buf->list);
> > > > +           spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > > > +
> > > > +           unicam_start_metadata(unicam, buf);
> > > > +           node->streaming = true;
> > > > +           return 0;
> > > > +   }
> > > > +
> > > > +   ret = pm_runtime_resume_and_get(unicam->dev);
> > > > +   if (ret < 0) {
> > > > +           dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
> > > > +           goto err_return_buffers;
> > > > +   }
> > > > +
> > > > +   ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe);
> > > > +   if (ret < 0) {
> > > > +           dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
> > >
> > > Isn't this an err ?
> >
> > The main cause of failure is a pipeline validation error, triggered by
> > userspace, hence the debug level.
> >
> > > > +           goto err_pm_put;
> > > > +   }
> > > > +
> > > > +   spin_lock_irqsave(&node->dma_queue_lock, flags);
> > > > +   buf = list_first_entry(&node->dma_queue,
> > > > +                          struct unicam_buffer, list);
> > > > +   dev_dbg(unicam->dev, "buffer %p\n", buf);
> > > > +   node->cur_frm = buf;
> > > > +   node->next_frm = buf;
> > > > +   list_del(&buf->list);
> > > > +   spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > > > +
> > > > +   unicam_start_rx(unicam, buf);
> > > > +
> > > > +   ret = v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad, BIT(0));
> > >
> > > A bit confused by the API here, shouldn't we also do this for embedded
> > > data ?
> >
> > Not here, as the two streams go over different pads, but likely above,
> > as part of the change you proposed regarding stream start on the
> > metadata device. I'll wait for Dave and Naush to reply, and I'll rework
> > this function.
> 
> I haven't read enough on the streams API, or what this implementation
> looks like.
> 
> There's no sensible way for a sensor to start embedded or other
> metadata without image data, so starting the image node would seem to
> be the main trigger for anything. I'm also assuming we don't support
> enabling additional multiplexed streams once the pipeline is already
> running, so that would seem to determine some of the sequencing.

The API allows enabling and disabling streams independently, which is a
useful feature for instance when multiple cameras are multiplexed over a
single CSI-2 link with virtual channels. For image + embedded data, not
only is the sequencing fixed (as you mentioned, the sensor can't send
embedded data without image data), but synchronization is also
important.

> > > > +   if (ret < 0) {
> > > > +           dev_err(unicam->dev, "stream on failed in subdev\n");
> > > > +           goto error_pipeline;
> > > > +   }
> > > > +
> > > > +   node->streaming = true;
> > > > +
> > > > +   return 0;
> > > > +
> > > > +error_pipeline:
> > > > +   video_device_pipeline_stop(&node->video_dev);
> > > > +err_pm_put:
> > > > +   pm_runtime_put_sync(unicam->dev);
> > > > +err_return_buffers:
> > > > +   unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
> > > > +   return ret;
> > > > +}

[snip]

-- 
Regards,

Laurent Pinchart

