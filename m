Return-Path: <linux-media+bounces-33604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D00AC79EA
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 09:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 625DC4A56C2
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 07:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E0321884B;
	Thu, 29 May 2025 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bW4B88eq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1321770B;
	Thu, 29 May 2025 07:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504414; cv=none; b=unaS9sSAlrpJ9Gl5KpMbcvewTZy78wsx3vF0PmudqjSmchlsGVdEBpVS6t3FYCVqx5ypEd7pzG3pq2UxaC5anih/SP510cOswnCJ+MEtfyOSQ3AU0pLin1yja+1ih8G08KnWB/ZOJTwhulgnAcE/gtKar0pxXCQKuhKeQoQirXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504414; c=relaxed/simple;
	bh=qlYd0gywXE2OP+og16GrBR2/+U3Zh+9J2jpLRQbOc00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lI1tT8CT2brTrn9HdnOIeWk6nySwCAfsq5MTtku2MRSI2jQiiOgwIPYA1VtATUbEqRbyBrNP5xwteMkA3xv266Snwo1etpVttwp/BJVajddUr33fiDu1b/Fbzn8H1Arxgj18eX+F1KrvsBDNaJOsXWMb8XhcxSkrhvrxnIQ3ioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bW4B88eq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A51276D5;
	Thu, 29 May 2025 09:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748504382;
	bh=qlYd0gywXE2OP+og16GrBR2/+U3Zh+9J2jpLRQbOc00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bW4B88eqcih1SJOd6rQUa9qXGUf8vRqrb8fYaA608Bxfs/xPLK6FS7NQcJrcp98fw
	 F94FtnxEQYFv4kPBjcD+WtjeGXxt/ZcjpLCXpiw5OQKzw3rkN7x2tgk7UQB42adKZg
	 9F3Fsc3OlTFLGZf/8hCzProRUd9RMQVYeQxQZIKU=
Date: Thu, 29 May 2025 09:40:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com
Subject: Re: [PATCH 2/3] media: platform: Add Renesas Input Video Control
 block driver
Message-ID: <hmkrcqqhrd5ntbzdw3pqeu5dkk7p47snyyt5e3wxn7kp3qf23t@dqouoruqmbsg>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
 <20250519145754.454005-3-dan.scally@ideasonboard.com>
 <hz5yboj7ey6vefebsn5lzb4myuybrg2c3tnkkfgdfladc6xym3@uqamdopvwiyo>
 <8ecc5af9-3901-4827-89e5-7bf01c82e8ab@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ecc5af9-3901-4827-89e5-7bf01c82e8ab@ideasonboard.com>

Hi Dan

On Wed, May 28, 2025 at 04:06:35PM +0100, Dan Scally wrote:
> Hi Jacopo - thanks for the review!
>
> On 28/05/2025 14:26, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Mon, May 19, 2025 at 03:57:53PM +0100, Daniel Scally wrote:
> > > Add a driver for the Input Video Control block in an RZ/V2H SoC which
> > > feeds data into the Arm Mali-C55 ISP.
> > >
> > > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > > ---
> > >   drivers/media/platform/renesas/Kconfig        |   2 +
> > >   drivers/media/platform/renesas/Makefile       |   1 +
> > >   .../media/platform/renesas/rzv2h-ivc/Kconfig  |  11 +
> > >   .../media/platform/renesas/rzv2h-ivc/Makefile |   7 +
> > >   .../renesas/rzv2h-ivc/rzv2h-ivc-dev.c         | 239 ++++++
> > >   .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      | 376 ++++++++++
> > >   .../renesas/rzv2h-ivc/rzv2h-ivc-video.c       | 703 ++++++++++++++++++
> > >   .../platform/renesas/rzv2h-ivc/rzv2h-ivc.h    | 141 ++++
> > >   8 files changed, 1480 insertions(+)
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Makefile
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > >   create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> > >
> > > diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
> > > index c7fc718a30a5..b09c026c129e 100644
> > > --- a/drivers/media/platform/renesas/Kconfig
> > > +++ b/drivers/media/platform/renesas/Kconfig
> > > @@ -58,6 +58,8 @@ config VIDEO_SH_VOU
> > >
> > >   source "drivers/media/platform/renesas/rcar-vin/Kconfig"
> > >   source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
> > > +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
> > > +
> > >
> > >   # Mem2mem drivers
> > >
> > > diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
> > > index 50774a20330c..f29c8ade0e4e 100644
> > > --- a/drivers/media/platform/renesas/Makefile
> > > +++ b/drivers/media/platform/renesas/Makefile
> > > @@ -5,6 +5,7 @@
> > >
> > >   obj-y += rcar-vin/
> > >   obj-y += rzg2l-cru/
> > > +obj-y += rzv2h-ivc/
> > >   obj-y += vsp1/
> > >
> > >   obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
> > > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> > > new file mode 100644
> > > index 000000000000..0702f9fbf699
> > > --- /dev/null
> > > +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> > > @@ -0,0 +1,11 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +config VIDEO_RZV2H_IVC
> > > +	tristate "Renesas RZ/V2H Input Video Control block driver"
> > > +	depends on V4L_PLATFORM_DRIVERS
> > > +	depends on VIDEO_DEV
> > depends on ARCH_RENESAS || COMPILE_TEST
> > depends on OF
> >
> > ?
> Yes to all
> >
> > > +	select VIDEOBUF2_DMA_CONTIG
> > Do you need to
> >
> >         	select MEDIA_CONTROLLER
> > 	select VIDEO_V4L2_SUBDEV_API
> >
> > ?
> >
> > Also the driver uses the common clock framework and reset controller.
> > None of the renesas media driver select HAVE_CLK or COMMON_CLK but
> > many do select RESET_CONTROLLER so you probably need to do the same.
> OK, will do. Thank you.
> > > +	help
> > > +	  Support for the Video Input Block found in the RZ/V2H SoC. Enable this
> > > +	  to support the block, and by extension the Arm Mali-C55 ISP to which
> > Should we actually say
> >
> >          "Enable this to support the block and by extension the ISP"
> >
> > given that this Kconfig option doesn't enable the ISP ?
>
>
> Er, I don't understand the difference sorry.
>

I was just suggesting to remove the above statement about the Mali C55.

	help
	  Support for the Video Input Block found in the RZ/V2H SoC.

	  To compile this driver as a module, choose M here: the
	  module will be called rzv2h-ivc.


> >
> > > +	  it feeds data.

> >
> >
> > > +	  it feeds data.
> > > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Makefile b/drivers/media/platform/renesas/rzv2h-ivc/Makefile
> > > new file mode 100644
> > > index 000000000000..17dfd3a165bc

[snip]

> > > +static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
> > > +{
> > > +	struct device *dev = context;
> > > +	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
> > > +
> > > +	guard(spinlock)(&ivc->spinlock);
> > > +	--ivc->vvalid_ifp;
> > You could simply decrement vvalid_ifp until it reaches 0,
> > re-initialize it to 2, and then call
> > wake_up(). The waiter could wait_even_..(.., true);
> >
> > I'm not sure that's better though.
>
>
> You mean wait_event(..., true)? Is it guaranteed to enter the wait then? I

Yes, it suspends unconditionally

> assumed if the condition was already true it wouldn't wait for a wake_up()
> at all

My point was that you wouldn't need to check for vvalid_ifp in the
other .c file if you only decrement and count here

>
> >
> > > +	wake_up_all(&ivc->buffers.wq);
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int rzv2h_ivc_runtime_resume(struct device *dev)
> > > +{
> > > +	struct rzv2h_ivc *ivc = dev_get_drvdata(dev);
> > > +	int ret;
> > > +
> > > +	ret = request_threaded_irq(ivc->irqnum, NULL, rzv2h_ivc_isr,
> > > +				   IRQF_ONESHOT, dev_driver_string(dev), dev);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to request irq\n");
> > > +		return ret;
> > > +	}
> > Why are you requesting/free the interrupt every suspend/resume ?
>
>
> I'm under the possibly mistaken impression that that's best practice...I
> think based on the Linux Device Drivers book's advice on the issue (which I
> may have misunderstood), the rationale behind to avoid tying up interrupt
> lines by holding it from probe.
>

Ah ok, didn't consider that. A quick grep for request\.*irq in
drivers/media/platform shows that most drivers request irqs in their
probe() routines... Not sure... maybe let's see what others think

>
> https://www.oreilly.com/library/view/linux-device-drivers/0596000081/ch09s03.html
>
> >
> > > +

`[snip]

> > > +};
> > > +
> > > +static u32 rzv2h_ivc_get_mbus_output_from_input(u32 mbus_code)
> > > +{
> > > +	unsigned int i, j;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(rzv2h_ivc_formats); i++) {
> > > +		for (j = 0; j < RZV2H_IVC_N_INPUTS_PER_OUTPUT; j++) {
> > > +			if (rzv2h_ivc_formats[i].inputs[j] == mbus_code)
> > > +				return rzv2h_ivc_formats[i].output;
> > > +		}
> > > +	}
> > You could save a few loops by
> >
> >          switch (mbus_code) {
> >          case MEDIA_BUS_FMT_SBGGR8_1X8:
> >          case MEDIA_BUS_FMT_SBGGR10_1X10:
> >          case MEDIA_BUS_FMT_SBGGR12_1X12:
> >          case MEDIA_BUS_FMT_SBGGR14_1X14:
> >          case MEDIA_BUS_FMT_SBGGR16_1X16:
> >          case MEDIA_BUS_FMT_SBGGR20_1X20:
> >                  return MEDIA_BUS_FMT_SBGGR20_1X20;
> >
> >
> > etc
> >
> > up to you, it might not be worth it as you need rzv2h_ivc_formats[]
> > anyhow, so doing what I suggested would actually duplicate the same
> > information
>
>
>Mmm, I think keeping one source of truth there is probably slightly more maintainable

Probably true, I agree

>
> >
> > > +
> > > +	return 0;
> > > +}
> > > +

[snip]

> > > +static int rzv2h_ivc_init_state(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *state)
> > > +{
> > > +	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> > > +
> > > +	sink_fmt = v4l2_subdev_state_get_format(state,
> > > +						RZV2H_IVC_SUBDEV_SINK_PAD);
> > > +	sink_fmt->width = RZV2H_IVC_DEFAULT_WIDTH;
> > > +	sink_fmt->height = RZV2H_IVC_DEFAULT_HEIGHT;
> > > +	sink_fmt->field = V4L2_FIELD_NONE;
> > > +	sink_fmt->code = MEDIA_BUS_FMT_SRGGB16_1X16;
> > > +	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
> > > +	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
> > > +	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
> > > +	sink_fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
> > > +							  sink_fmt->colorspace,
> > > +							  sink_fmt->ycbcr_enc);
> > Does this give you FULL or LIMITED ?
>
>
> Not sure off the top of my head - I'll double check
>

reading the macro I suspect it will give you V4L2_QUANTIZATION_LIM_RANGE
while I would expect RAW to be FULL_RANGE.

Maybe we need to ajust that macro ?

> >
> > > +
> > > +	src_fmt = v4l2_subdev_state_get_format(state,
> > > +					       RZV2H_IVC_SUBDEV_SOURCE_PAD);
> > > +

[snip]

> > > +	if (mf->width != pix->width || mf->height != pix->height) {
> > > +		dev_dbg(ivc->dev,
> > > +			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
> > > +			link->source->entity->name, link->source->index,
> > > +			link->sink->entity->name, link->sink->index,
> > > +			mf->width, mf->height,
> > > +			pix->width, pix->height);
> > > +		ret = -EPIPE;
> > do you need to continue validation or can you return here ?
> > Ah maybe this is just to fall on unlock_state()
>
>
> It's for that indeed, but I can add the usual goto to skip the rest of the function
>

Up to you, what you like the most really

> >
> > > +	}
> > > +

[snip]

> > > +	{
> > > +		.fourcc = V4L2_PIX_FMT_CRU_RAW14,
> > > +		.mbus_codes = {
> > > +			MEDIA_BUS_FMT_SBGGR14_1X14,
> > > +			MEDIA_BUS_FMT_SGBRG14_1X14,
> > > +			MEDIA_BUS_FMT_SGRBG14_1X14,
> > > +			MEDIA_BUS_FMT_SRGGB14_1X14
> > > +		},
> > > +		.dtype = MIPI_CSI2_DT_RAW14,
> > > +	},
> > Interesting, so all formats > 8 and < 16 get compressed to a
> > bayer-agnostic CRU formats, while 8 and 16 are not modified...
>
>
> The rational here is that the CRU's format for those bitwidths is identical
> to standard RAW8/16...so it didn't really seem worth adding a new format.
> Perhaps consistency is better and a new pixel format that duplicates those
> is better?
>

No no, I wasn't suggesting it, just wanted to make sure I got it
right.

> >
> > > +
> > > +static int rzv2h_ivc_pipeline_started(struct media_entity *entity)
> > > +{
> > > +	struct video_device *vdev = media_entity_to_video_device(entity);
> > > +	struct rzv2h_ivc *ivc = video_get_drvdata(vdev);
> > > +
> > > +	/*
> > > +	 * With min_queued_buffers set to 1, we know that we must have at least
> > > +	 * a single buffer to start feeding, so we can fetch that now and fire
> > > +	 * it off to the ISP.
> > > +	 */
> > > +	ivc->buffers.sequence = 0;
> > > +	rzv2h_ivc_send_next_buffer(ivc);
> > > +
> > Uh, why can't we do that at pipeline_start ?
>
>
> The direction I got from Sakari and Laurent was that _actual_ streaming
> shouldn't start anywhere in the pipeline until all of the video devices have
> been started. That came in the earlier version where the ISP was working
> alone, but to extend it to a situation in which we have the two drivers
> working together meeting that requirement meant adding these new entity
> operations.
>

ack, I've seen below and it makes sense!

> >
> > > +	return 0;
> > > +}
> > > +

[snip]

> > > +	/*
> > > +	 * The ISP has minimum vertical blanking requirements that must be
> > > +	 * adhered to by the IVC. The minimum is a function of the Iridix blocks
> > > +	 * clocking requirements and the width of the image and horizontal
> > > +	 * blanking, but if we assume the worst case then it boils down to the
> > > +	 * below (plus one to the numerator to ensure the answer is rounded up)
> > > +	 */
> > > +
> > > +	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
> > > +	min_vblank = 15 + (120501 / hts);
> > This is the actual vblank or the min_vblank ?
> Well, min according to the calculated width which gets clamped to the
> hardware minimum and then set as the actual vblank.
> >

Yeah, sorry for not being clear, I was wondering if min_vblank is the
correct name, but it apparently is

> > > +	vblank = max(min_vblank, RZV2H_IVC_MIN_VBLANK);
> > > +

[snip]

> > > +	if (buf)
> > > +		list_del(&buf->queue);
> > > +	else
> > > +		return;
> > What happens in this case ? Will the HW keep overwriting the same
> > memory buffer even if it has been just returned to userspace ? Will it
> > discard frames ? Do you need a scratch buffer where to dump frames
> > into ?
>
>
> This is an output device, so the hardware is reading from the buffer rather
> than writing to it...but if there's no buffer here then the function returns
> instead of writing to the trigger register to tell HW to do that read, and
> so the feed will just hang. When userspace eventually queues a new buffer
> the media jobs framework will pick up that that's happened and run the
> workqueue and this check should then pass...but really it oughtn't ever get
> to that state since the media jobs shouldn't have run this function without
> a buffer being queued.
>

Sorry, I was -really- confused and I was thinking about capture
devices.

Scratch my suggestions about .. scratch buffers


> >
> > > +
> > > +	ivc->buffers.curr = buf;
> > > +	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_SADDL_P0, buf->addr);
> > > +}
> > > +

[snip]

> > > +static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
> > > +{
> > > +	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
> > > +	struct media_pipeline *pipe;
> > > +
> > > +	pipe = video_device_pipeline(&ivc->vdev.dev);
> > > +	if (rzv2h_ivc_pipeline_ready(pipe)) {
> > How is this possible that this returns true if we have just been
> > stopped ?
>
>
> Because the call to video_device_pipeline_stop() is below this check, so
> even if this is the first video device in the pipeline to have
> .stop_streaming() called it would flag as active at this point.

Ah right, so this is to check if we're the first to be stopped

>
> >
> > > +		media_pipeline_stopped(pipe);
> > > +		media_jobs_cancel_jobs(ivc->sched);
> > > +	}
> > > +

[snip]

> > > +
> > > +static void rzv2h_ivc_set_format(struct rzv2h_ivc *ivc,
> > > +				 struct v4l2_pix_format *pix)
> > > +{
> > > +	rzv2h_ivc_try_fmt(pix);
> > > +	ivc->format.pix = *pix;
> > > +	ivc->format.fmt = rzv2h_ivc_format_from_pixelformat(pix->pixelformat);
> > try_fmt calls this function, maybe you could pass it as parameter as
> > well ?(however you should allocate one in rzv2h_ivc_try_fmt_vid_out()
>
>
> Sorry, I don't think I understand the suggestion here...could you explain a bit please?
>

Yeah sorry.

My point was that rzv2h_ivc_try_fmt_vid_out() calls
rzv2h_ivc_format_from_pixelformat() again, and we could avoid this
passing a struct rzv2h_ivc_format * to rzv2h_ivc_try_fmt(), but as
noticed then you need to declare a const struct rzv2h_ivc_format fmt;
in rzv2h_ivc_try_fmt_vid_out().

> >
> > > +}
> > > +

[snip]

> > > +	vb2q->min_queued_buffers = 1;
> > Ideally, we want this to be 0. You would need a scratch buffer for
> > this
> Ah yes I remember that conversation actually; I'll take a look at that

As this is an output device, and you don't need scratch buffers, I
think you can just remove the min_queued_buffers initialization.

> > > +	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > > +	vb2q->lock = &ivc->lock;
> > > +	vb2q->dev = ivc->dev;
> > > +

