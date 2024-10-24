Return-Path: <linux-media+bounces-20198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4249AE4B9
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00064283C28
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8443B1D5AB2;
	Thu, 24 Oct 2024 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gDL3HDUp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA73A18784C;
	Thu, 24 Oct 2024 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772807; cv=none; b=kTsAQycdwaLv4f6Ugt9wyA7Iw4WVS8RiLMwT6td01SeFwA3xmPA+tW1jEXgTtP/o+gL88lRDzW1v1DDCaM5TjV4ZBRoIRB1xz/7N2WRMxgZ5BGl5/w15RUr4foXL7t8YnxaSgZTRiSGcJzq9sJLtLUnnjrmCrWTkZ5mQIV7Fg4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772807; c=relaxed/simple;
	bh=mKwfBFb98YUVWR1h6VvhXb0DPxsXbBhje3HQ1yKmQao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpPasKsWGqtFxyacfCG8GTDOdPtXif948qqld1XajAcu8TfxE7mk7zrdKHJswyqu8pvDkORTHLslVPmoaUyuaz0emkXzVynyZ7nzBchGo1VOdbxd1RN858WGY6txsvBobbUJR+SucwuJpPbCNPJVY2wMWzdoLm7SMvPVgzPDsOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gDL3HDUp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04F88353;
	Thu, 24 Oct 2024 14:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729772694;
	bh=mKwfBFb98YUVWR1h6VvhXb0DPxsXbBhje3HQ1yKmQao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDL3HDUpPkRR92j2GfhosDCpmJSQsM/mEpIgHA8BBH1ZVP8CJlcQuV63buX1um1n3
	 SxQaPXw4ubAJtL03L65MZ86FRA5JlmVGTQgA6pSQF/4Yz0oKUr3Tra84mfrfjFbJER
	 w2ShimPws51wWVig6E0+n5oYPF6fOi0tzff+yRGY=
Date: Thu, 24 Oct 2024 15:26:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v6 3/4] media: raspberrypi: Add support for RP1-CFE
Message-ID: <20241024122636.GB6081@pendragon.ideasonboard.com>
References: <20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com>
 <20241003-rp1-cfe-v6-3-d6762edd98a8@ideasonboard.com>
 <4d9e340e-2ae7-495b-8623-0d10398e1c3d@xs4all.nl>
 <b185e497-ad40-4fe3-9409-224993ed4924@ideasonboard.com>
 <af1456a3-3de8-4b11-9606-79b260bda47e@xs4all.nl>
 <20241024120507.GA6081@pendragon.ideasonboard.com>
 <3a5f7d52-fbe9-4592-ab24-50cd6de548c2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a5f7d52-fbe9-4592-ab24-50cd6de548c2@xs4all.nl>

On Thu, Oct 24, 2024 at 02:13:07PM +0200, Hans Verkuil wrote:
> On 24/10/2024 14:05, Laurent Pinchart wrote:
> > On Thu, Oct 24, 2024 at 01:21:43PM +0200, Hans Verkuil wrote:
> >> On 24/10/2024 13:08, Tomi Valkeinen wrote:
> >>> On 24/10/2024 11:20, Hans Verkuil wrote:
> >>>> Hi Tomi,
> >>>>
> >>>> I know this driver is already merged, but while checking for drivers that use
> >>>> q->max_num_buffers I stumbled on this cfe code:
> >>>>
> >>>> <snip>
> >>>>
> >>>>> +/*
> >>>>> + * vb2 ops
> >>>>> + */
> >>>>> +
> >>>>> +static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> >>>>> +               unsigned int *nplanes, unsigned int sizes[],
> >>>>> +               struct device *alloc_devs[])
> >>>>> +{
> >>>>> +    struct cfe_node *node = vb2_get_drv_priv(vq);
> >>>>> +    struct cfe_device *cfe = node->cfe;
> >>>>> +    unsigned int size = is_image_node(node) ?
> >>>>> +                    node->vid_fmt.fmt.pix.sizeimage :
> >>>>> +                    node->meta_fmt.fmt.meta.buffersize;
> >>>>> +
> >>>>> +    cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
> >>>>> +        node->buffer_queue.type);
> >>>>> +
> >>>>> +    if (vq->max_num_buffers + *nbuffers < 3)
> >>>>> +        *nbuffers = 3 - vq->max_num_buffers;
> >>>>
> >>>> This makes no sense: max_num_buffers is 32, unless explicitly set when vb2_queue_init
> >>>> is called. So 32 + *nbuffers is never < 3.
> >>>>
> >>>> If the idea is that at least 3 buffers should be allocated by REQBUFS, then set
> >>>> q->min_reqbufs_allocation = 3; before calling vb2_queue_init and vb2 will handle this
> >>>> for you.
> >>>>
> >>>> Drivers shouldn't modify *nbuffers, except in very rare circumstances, especially
> >>>> since the code is almost always wrong.
> >>>
> >>> Indeed, the code doesn't make sense. I have to say I don't know what
> >>> was the intent here, but I think "at least 3 buffers should be
> >>> allocated by REQBUFS" is the likely explanation.
> >>>
> >>> I think the hardware should work with even just a single buffer, so
> >>> is it then fine to not set either q->min_queued_buffers nor
> >>> q->min_reqbufs_allocation before calling vb2_queue_init()? This
> >>> seems to result in REQBUFS giving at least two buffers.
> >>
> >> min_queued_buffers is really HW dependent. If not set, then
> >> start_streaming can be called even if there are no buffers queued.
> > 
> > Having min_queued_buffers > 1 is bad for userspace, and it's much nicer
> > to have it set to 0. The main issue with a value of 1 is that validation
> > of the pipeline ends up being deferred to the first QBUF if it occurs
> > after STREAMON, and error handling is then complicated.
> 
> The validation can be done in the prepare_streaming callback instead of
> in start_streaming. prepare_streaming is called at STREAMON time.

True, we have that now, I keep forgetting about it. I've noticed the
annoying behaviour with drivers that predate .prepare_streaming(). It
should be a requirement to validate the pipeline in .prepare_streaming()
(or possibly earlier in some cases, not sure).

> > It's not just a property of the hardware, kernel drivers can decide to
> > work with scratch buffers if needed. In many cases, a scratch buffer
> > allocated by the kernel could be very small, either relying on the same
> > physical page being mapped through the IOMMU to a larger DMA space, or
> > using a 0 stride value to write all lines to the same location.
> 
> None of which is possible for some of the older drivers (e.g. TI davinci)
> that do not have an IOMMU and require two contiguous buffers before they can
> start streaming. But for modern devices you can solve it through a scratch
> buffer, that's true.

In the worst case kernel drivers could allocate a full scratch buffer.
That's not nice from a memory consumption point of view of course. The
stride hack may have worked with TI davinci, I haven't checked. It's
something that driver authors don't usually think about even if the
hardware can do it. Even if the device supports a 0 stride, it also
needs to support programming the stride and the buffer addresses in a
race-free way.

> > For drivers supported by libcamera, we will require min_queued_buffers
> > <= 1 and may tighten that to == 0. Tomi, if you submit a patch, please
> > try to target 0, and if that's too much work for now, set it to 1 at
> > most.
> 
> Regards,
> 
> 	Hans
> 
> >> If your hardware can handle that, then it's fine to not set it.
> >>
> >>>>> +
> >>>>> +    if (*nplanes) {
> >>>>> +        if (sizes[0] < size) {
> >>>>> +            cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
> >>>>> +            return -EINVAL;
> >>>>> +        }
> >>>>> +        size = sizes[0];
> >>>>> +    }
> >>>>> +
> >>>>> +    *nplanes = 1;
> >>>>> +    sizes[0] = size;
> >>>>> +
> >>>>> +    return 0;
> >>>>> +}

-- 
Regards,

Laurent Pinchart

