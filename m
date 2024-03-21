Return-Path: <linux-media+bounces-7538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847D88615E
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 20:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0901F223DD
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 19:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F49134431;
	Thu, 21 Mar 2024 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hFdkSsON"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3E979F0;
	Thu, 21 Mar 2024 19:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711051076; cv=none; b=ayYPLaYMucnWKwgxLE4XVxOuVUsj/aw8A7CdbdMKPmbDyUSklEuf/iXaa1XsLHaMOxjjG+MtCXDPqKuYuOTR9e1QNnm78gRgLrAfk4JlTIn6Tr4VZQh9dks2QX86s4GLWLqUkJhXZS2mqSAILCC34Gw51sdWzJVlq6tpcCe9ZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711051076; c=relaxed/simple;
	bh=o9Y3w5cecuIp0kCib8OIXk7mGz8FxiOO9/PPik6zBlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/8K8/0WF6P5/SYZA0IaGfGHLIDAMCL9t0VUyi7OyTPSuyxWe6bdYY3cckBAI4WcmiGWPs9rKTxivsw6icvS0nun0vKnHktxzPvMUEW24brPz9U19cJa8mX+gISUNaTDqZcTkCTfYJlfynrvpBNJYt/jnzLCFIqSkn2bvK4LJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hFdkSsON; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D9D42B3;
	Thu, 21 Mar 2024 20:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711051044;
	bh=o9Y3w5cecuIp0kCib8OIXk7mGz8FxiOO9/PPik6zBlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFdkSsON4YDxCyLKmhiOYtMMEEB7VZuXiyU++yOv/so8GqZNKk1XX9j8rEABz2xHK
	 b4Pz0bA5yJ9qKPCkrF9DcX3VnX+3xqe+K8RUrZhTkcSWheHXkoQAbfDEcrJqZvtUJq
	 16lkrWdN9LuXiQPA9s4qZxWu5p2K5Tmq8oN9cpYE=
Date: Thu, 21 Mar 2024 21:57:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
Message-ID: <20240321195749.GZ9582@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-10-laurent.pinchart@ideasonboard.com>
 <CAEmqJPqdfaND6vFoZgNALfzPf9-VM1XU0AyLs3V6OJe3WkDEng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPqdfaND6vFoZgNALfzPf9-VM1XU0AyLs3V6OJe3WkDEng@mail.gmail.com>

Hi Naush,

On Wed, Mar 20, 2024 at 12:30:36PM +0000, Naushir Patuck wrote:
> On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart wrote:
> >
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

[snip]

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

[snip]

> > +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> > +{
> > +       struct unicam_node *node = vb2_get_drv_priv(vq);
> > +       struct unicam_device *unicam = node->dev;
> > +       struct v4l2_subdev_state *state;
> > +       struct unicam_buffer *buf;
> > +       unsigned long flags;
> > +       int ret;
> > +       u32 pad, stream;
> > +       u32 remote_pad = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
> > +                                            : UNICAM_SD_PAD_SOURCE_METADATA;
> > +
> > +       /* Look for the route for the given pad and stream. */
> > +       state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
> > +       ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
> > +                                                   remote_pad, 0,
> > +                                                   &pad, &stream);
> > +       v4l2_subdev_unlock_state(state);
> > +
> > +       if (ret)
> > +               goto err_return_buffers;
> > +
> > +       dev_dbg(unicam->dev, "Starting stream on %s: %u/%u -> %u/%u (%s)\n",
> > +               unicam->subdev.sd.name, pad, stream, remote_pad, 0,
> > +               is_metadata_node(node) ? "metadata" : "image");
> > +
> > +       /* The metadata node can't be started alone. */
> > +       if (is_metadata_node(node)) {
> > +               if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
> > +                       dev_err(unicam->dev,
> > +                               "Can't start metadata without image\n");
> > +                       ret = -EINVAL;
> > +                       goto err_return_buffers;
> > +               }
> 
> There's a slight change of behaviour in this function when compared to
> the downstream/BSP non-streams enabled driver.
> 
> In the BSP driver, if the embedded data node has been enabled, we wait
> for both image and embedded data nodes to have start_streaming()
> called before starting the sensor (see
> https://github.com/raspberrypi/linux/blob/c04af98514c26014a4f29ec87b3ece95626059bd/drivers/media/platform/bcm2835/bcm2835-unicam.c#L2559).
> This is also the same for the Pi 5 CFE driver.
> 
> With the logic in this function, we only wait for start_streaming() on
> the image node then start the sensor streaming immediately.  When
> start_streaming() for the embedded data node is subsequently called,
> we end up with the first N buffers missing and/or invalid as the HW
> channel is enabled while the sensor is streaming.  I noticed this when
> using libcamera where we start image then embedded node.  If I flip
> things around (start embedded first then image), everything works as
> expected.
> 
> Could we add back the test to ensure all nodes are streaming before
> starting the sensor?

Yes, I don't think the current implementation is good. I'm not sure why
the logic got changed, but I'll address it in the next version.

> > +
> > +               spin_lock_irqsave(&node->dma_queue_lock, flags);
> > +               buf = list_first_entry(&node->dma_queue,
> > +                                      struct unicam_buffer, list);
> > +               dev_dbg(unicam->dev, "buffer %p\n", buf);
> > +               node->cur_frm = buf;
> > +               node->next_frm = buf;
> > +               list_del(&buf->list);
> > +               spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > +
> > +               unicam_start_metadata(unicam, buf);
> > +               node->streaming = true;
> > +               return 0;
> > +       }
> > +
> > +       ret = pm_runtime_resume_and_get(unicam->dev);
> > +       if (ret < 0) {
> > +               dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
> > +               goto err_return_buffers;
> > +       }
> > +
> > +       ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe);
> > +       if (ret < 0) {
> > +               dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
> > +               goto err_pm_put;
> > +       }
> > +
> > +       spin_lock_irqsave(&node->dma_queue_lock, flags);
> > +       buf = list_first_entry(&node->dma_queue,
> > +                              struct unicam_buffer, list);
> > +       dev_dbg(unicam->dev, "buffer %p\n", buf);
> > +       node->cur_frm = buf;
> > +       node->next_frm = buf;
> > +       list_del(&buf->list);
> > +       spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> > +
> > +       unicam_start_rx(unicam, buf);
> > +
> > +       ret = v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad, BIT(0));
> > +       if (ret < 0) {
> > +               dev_err(unicam->dev, "stream on failed in subdev\n");
> > +               goto error_pipeline;
> > +       }
> > +
> > +       node->streaming = true;
> > +
> > +       return 0;
> > +
> > +error_pipeline:
> > +       video_device_pipeline_stop(&node->video_dev);
> > +err_pm_put:
> > +       pm_runtime_put_sync(unicam->dev);
> > +err_return_buffers:
> > +       unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
> > +       return ret;
> > +}

[snip]

-- 
Regards,

Laurent Pinchart

