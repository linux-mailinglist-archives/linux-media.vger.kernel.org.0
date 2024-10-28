Return-Path: <linux-media+bounces-20429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0C9B3497
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491DE1C21E80
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDD61DE4FE;
	Mon, 28 Oct 2024 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K4GdptCM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018761DE4E4;
	Mon, 28 Oct 2024 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128657; cv=none; b=rZ1Zw8yRUB6Prse2ic7cgDLVE/kbDKoWXCUsrDN+F6uUr8k4WmTUHQFKk6xbSMcdzsOHAPGFDFeh+1XkrFyudIudvIcUOpgVl4HnXFyjWkErs2snqrmo2merk7DnCH2iC14rjh6xtifKu9JKx57Y5tOwOkcOOQws+wTx1Q3Bhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128657; c=relaxed/simple;
	bh=yYxrrxNDqZORz7yT6Jph9ERuNkQw4h4v3G14JotVmmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNRLv2vL0EP3tbemP1HHXmGbCgKHR9GnKA5sA+carkne4sEMYa0FsXEm5NOCuCqhJVXKUJFf6TdaABYr7oaFQ4SMeyhsLwFhxUpqmU0nKCx06entlfEP3mZ1YYSMIoAkyet/zJiNt6F3FFTTD6LglKnLhQXts8VdD/5/g1dL0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K4GdptCM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74351AFB;
	Mon, 28 Oct 2024 16:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730128642;
	bh=yYxrrxNDqZORz7yT6Jph9ERuNkQw4h4v3G14JotVmmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4GdptCM/TunBzQMs84myRbDidtT1kc9obvfNlcy/fZKmjZMWhbAcHCjxXNudEw1z
	 ic0WGqVLI/gp8wFgvzwjdTK73sDRulz5VmNt6WwPAkP8nfmh8fExXbRuUn8gSqREvh
	 FEOb45RyZoAo/kRLxNTIArFXH67gPXfBf0Sa1Ocg=
Date: Mon, 28 Oct 2024 17:17:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20241028151713.GI24052@pendragon.ideasonboard.com>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <02f05b61-08e7-45f8-8d59-f79bc20d076f@ideasonboard.com>
 <74286a86-51b9-4742-bb0c-583d70b1b0a7@xs4all.nl>
 <505c502e-b67a-4dca-8420-eb87eae4e170@ideasonboard.com>
 <59cf95be-fb53-4a94-bc6e-f9dca322749d@xs4all.nl>
 <5832a2f9-c908-4f5a-a3ee-9cb7d23ddab4@ideasonboard.com>
 <563347aa-4155-47e1-b71a-0107aed83eb6@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <563347aa-4155-47e1-b71a-0107aed83eb6@xs4all.nl>

On Mon, Oct 28, 2024 at 12:30:45PM +0100, Hans Verkuil wrote:
> On 28/10/2024 12:25, Tomi Valkeinen wrote:
> > On 28/10/2024 13:13, Hans Verkuil wrote:
> >> On 28/10/2024 12:05, Tomi Valkeinen wrote:
> >>> On 28/10/2024 12:11, Hans Verkuil wrote:
> >>>> On 28/10/2024 10:21, Tomi Valkeinen wrote:
> >>>>> On 24/10/2024 11:20, Hans Verkuil wrote:
> >>>>>> Hi Tomi,
> >>>>>>
> >>>>>> I know this driver is already merged, but while checking for drivers that use
> >>>>>> q->max_num_buffers I stumbled on this cfe code:
> >>>>>>
> >>>>>> <snip>
> >>>>>>
> >>>>>>> +/*
> >>>>>>> + * vb2 ops
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> >>>>>>> +               unsigned int *nplanes, unsigned int sizes[],
> >>>>>>> +               struct device *alloc_devs[])
> >>>>>>> +{
> >>>>>>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
> >>>>>>> +    struct cfe_device *cfe = node->cfe;
> >>>>>>> +    unsigned int size = is_image_node(node) ?
> >>>>>>> +                    node->vid_fmt.fmt.pix.sizeimage :
> >>>>>>> +                    node->meta_fmt.fmt.meta.buffersize;
> >>>>>>> +
> >>>>>>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
> >>>>>>> +        node->buffer_queue.type);
> >>>>>>> +
> >>>>>>> +    if (vq->max_num_buffers + *nbuffers < 3)
> >>>>>>> +        *nbuffers = 3 - vq->max_num_buffers;
> >>>>>>
> >>>>>> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
> >>>>>> is called. So 32 + *nbuffers is never < 3.
> >>>>>>
> >>>>>> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
> >>>>>> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
> >>>>>> for you.
> >>>>>>
> >>>>>> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
> >>>>>> since the code is almost always wrong.
> >>>>>
> >>>>> Looking at this, the original code in the old BSP tree was, which somehow, along the long way, got turned into the above:
> >>>>>
> >>>>> if (vq->num_buffers + *nbuffers < 3)
> >>>>>           *nbuffers = 3 - vq->num_buffers;
> >>>>>
> >>>>> So... I think that is the same as "q->min_reqbufs_allocation = 3"?
> >>>>>
> >>>>> The distinction between min_queued_buffers and
> >>>>> min_reqbufs_allocation, or rather the need for the latter, still
> >>>>> escapes me. If the HW/SW requires N buffers to be queued, why
> >>>>> would we require allocating more than N buffers?
> >>>>
> >>>> min_queued_buffers is easiest to explain: that represents the requirements of the DMA
> >>>> engine, i.e. how many buffers much be queued before the DMA engine can be started.
> >>>> Typically it is 0, 1 or 2.

That's partly true only. Even if the hardware requires 2 buffers, a
driver can allocate scratch buffers to lower the requirement for
userspace. Setting min_queued_buffers to 1 is usually fine, as there are
few use cases for userspace to start the hardware before a buffer is
available to capture a frame to. A value of 2 is much more problematic,
as it prevents operating with a single buffer. I know using a single
buffer results in frame drops, but there are resource-constrained
systems where application don't always need all the frames (such as the
Raspberry Pi Zero for instance). I very strongly encourage drivers to
never set a min_queued_buffers value higher than 1.

> >>>>
> >>>> min_reqbufs_allocation is the minimum number of buffers that will be allocated when
> >>>> calling VIDIOC_REQBUFS in order for userspace to be able to stream without blocking
> >>>> or dropping frames.
> >>>>
> >>>> Typically this is 3 for video capture: one buffer is being DMAed, another is queued up
> >>>> and the third is being processed by userspace. But sometimes drivers have other
> >>>> requirements.

This is exactly why I dislike min_reqbufs_allocation when set based on
this logic, it encodes assumption on userspace use cases that a capture
driver really shouldn't make.

> >>>>
> >>>> The reason is that some applications will just call VIDIOC_REQBUFS with count=1 and
> >>>> expect it to be rounded up to whatever makes sense. See the VIDIOC_REQBUFS doc in
> >>>> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/vidioc-reqbufs.html
> >>>>
> >>>> "It can be smaller than the number requested, even zero, when the driver runs out of
> >>>>    free memory. A larger number is also possible when the driver requires more buffers
> >>>>    to function correctly."
> >>>>
> >>>> How drivers implement this is a mess, and usually the code in the driver is wrong as
> >>>> well. In particular they often did not take VIDIOC_CREATE_BUFS into account, i.e.
> >>>> instead of 'if (vq->num_buffers + *nbuffers < 3)' they would do 'if (*nbuffers < 3)'.
> >>>
> >>> Thanks, this was educational!
> >>>
> >>> So. If I have a driver that has min_queued_buffers = 1, I can use
> >>> VIDIOC_CREATE_BUFS to allocate a single buffer, and then capture
> >>> just one buffer, right? Whereas VIDIOC_REQBUFS would give me
> >>> (probably) three (or two, if the driver does not set
> >>> min_reqbufs_allocation). Three buffers makes sense for full
> >>> streaming, of course.
> >>>
> >>>> When we worked on the support for more than 32 buffers we added min_reqbufs_allocation
> >>>> to let the core take care of this. In addition, this only applies to VIDIOC_REQBUFS,

I agree it's better to handle it in the core than in drivers, even if I
dislike the feature in the first place.

> >>>> if you want full control over the number of allocated buffers, then use VIDIOC_CREATE_BUFS,
> >>>> with this ioctl the number of buffers will never be more than requested, although it
> >>>> may be less if you run out of memory.

On a side note, we should transition libcamera to use VIDIOC_CREATE_BUFS
unconditionally.

> >>>>
> >>>> I really should go through all existing drivers and fix them up if they try to
> >>>> handle this in the queue_setup function, I suspect a lot of them are quite messy.
> >>>>
> >>>> One thing that is missing in the V4L2 uAPI is a way to report the minimum number of
> >>>> buffers that need to be allocated, i.e. min_queued_buffers + 1. Since if you want
> >>>
> >>> Hmm, so what I wrote above is not correct? One needs min_queued_buffers + 1? Why is that?
> >>
> >> The DMA engine always uses min_queued_buffers, so if there are only that many buffers,
> >> then it can never return a buffer to userspace! So you need one more. That's the absolute
> >> minimum. For smooth capture you need two more to allow time for userspace to process the
> >> buffer.
> > 
> > Hmm, ok, I see. Well, I guess my "I want to capture just a single frame" is not a very common case.

It's not that uncommon, see above.

> > 
> > Can I queue one buffer, start streaming, stop streaming, and get the
> > filled buffer? But then I guess I don't when the buffer has been
> > filled, i.e. when to call stop streaming.
> 
> Exactly. If you really want that, then the driver has to be adapted in the way that Laurent
> suggested, i.e. with one or more scratch buffers. But that is not always possible, esp. with
> older hardware without an IOMMU.

Drivers can always allocate a full-frame scratch buffer in the worst
case. That can waste memory though, which is less than ideal.

> > So, never mind, I don't actually have any use case for this, just wondering.
> > 
> >>>
> >>>> to use CREATE_BUFS you need that information so you know that you have to create
> >>>> at least that number of buffers. We have the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control,
> >>>> but it is effectively codec specific. This probably should be clarified.
> >>>>
> >>>> I wonder if it wouldn't be better to add a min_num_buffers field to
> >>>> struct v4l2_create_buffers and set it to min_queued_buffers + 1.

Don't add the +1. We should give userspace the information it needs to
make informed decisions, not make decisions on its behalf.

> >>>
> >>> I think this makes sense (although I still don't get the +1).
> >>>
> >>> However, based on the experiences from adding the streams features
> >>> to various ioctls, let's be very careful =). The new
> >>> 'min_num_buffers' can be filled with garbage by the userspace. If
> >>> we define the 'min_num_buffers' field to be always filled by the
> >>> kernel, and any value provided from the userspace to be ignored, I
> >>> think it should work.
> >>
> >> I've posted an RFC for this.
> > 
> > Thanks, I'll check it out.
> > 
> > For the original issue in this thread, I think the correct fix is to
> > remove the lines from cfe_queue_setup(), and add
> > "q->min_reqbufs_allocation = 3".

Or just don't set min_reqbufs_allocation ? This is a new driver, and it
requires a device-specific userspace to operate the ISP. I don't think
we need to care about applications blindly calling VIDIOC_REQBUFS(1) and
expecting to get more buffers.

> > 
> > I'll send a patch for that.

-- 
Regards,

Laurent Pinchart

