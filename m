Return-Path: <linux-media+bounces-20513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1C99B46DF
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 11:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69C951F22F05
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AD7204934;
	Tue, 29 Oct 2024 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MKcg4HRB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA81DEFFE
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197867; cv=none; b=nvYi2ydSmd0bmWiB4PjEXNoS0Cz23fE6itwDnNN8B7uQQ0GnWiiJLKmsXNTg+urhGfNJARF7mf5D/KhMZWenDCFgMBCF1+VbnMCwznNXg3/pnRRf+BB4GgRpg/CoCfmrkl0zLkNtN+hSCy9Zl1kQEi+yHUctaVU30m70Ez7c2j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197867; c=relaxed/simple;
	bh=mGAmYRyNZE40lZzqaFnNnjB8YttrGem8jkhbx/VcaK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twJF11ksEOiMVsG6Bngq2a0aXHMNYV6uiNV0hv/DFbQtDnPfTtaS5QMXHM4ed9PJTmekgOjbDQ3KT4wLpazoBRQN6NLzqbqti5mTn5JOqtBrXFOTSyfco9epmsDV99z57mLTb+0jgYutCsl28vUmuP1BEKmXcVmK5YRLAhLCv1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MKcg4HRB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B3A84D4;
	Tue, 29 Oct 2024 11:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730197857;
	bh=mGAmYRyNZE40lZzqaFnNnjB8YttrGem8jkhbx/VcaK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKcg4HRB/vKS8z0BnEj/Mw2GTR5X02N4KbRSbPloEFZBwxcmwA0LpwYrFszffM4q0
	 Fns5YWQtK1tDid/AtqXGH4VcH0nCDVpTjl6Tt2uXyBLK5jprJPoJnuT31KVomPS0TW
	 jx74mkx/qUMIUazS9batmdlH1ZXuYIrG79jsl+Jg=
Date: Tue, 29 Oct 2024 12:30:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
Message-ID: <20241029103053.GG22600@pendragon.ideasonboard.com>
References: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
 <20241028155244.GK24052@pendragon.ideasonboard.com>
 <e9ce9b42-ba66-4908-a528-b839272c2ab6@xs4all.nl>
 <b7b4bf34-ab4a-4676-a279-8c8a5cd3ff42@xs4all.nl>
 <41d74d3d-9e66-4a04-b9c7-d05ed773748b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41d74d3d-9e66-4a04-b9c7-d05ed773748b@xs4all.nl>

Hi Hans,

On Tue, Oct 29, 2024 at 11:04:43AM +0100, Hans Verkuil wrote:
> On 10/29/24 10:04, Hans Verkuil wrote:
> > On 29/10/2024 09:17, Hans Verkuil wrote:
> >> On 28/10/2024 16:52, Laurent Pinchart wrote:
> >>> On Mon, Oct 28, 2024 at 12:10:22PM +0100, Hans Verkuil wrote:
> >>>> Hi all,
> >>>>
> >>>> This mail thread uncovered some corner cases around how many buffers should be allocated
> >>>> if VIDIOC_REQBUFS with count = 1 is called:
> >>>>
> >>>> https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8
> >>>
> >>> I'll repeat below some comments I've made in that thread, as they're
> >>> better discussed in the context of this RFC.
> >>>
> >>>> When it comes to the minimum number of buffers there are a number of limitations:
> >>>>
> >>>> 1) The DMA engine needs at least N buffers to be queued before it can start. Typically
> >>>>    this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
> >>>>    So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
> >>>>    DMA to. Allocating just one buffer would mean the DMA engine can never return that
> >>>>    buffer to userspace (it would just keep recycling the same buffer over and over), so
> >>>>    the minimum must be min_queued_buffers + 1.
> >>>
> >>> I think you're mixing hardware and driver constraints here. Drivers can
> >>> use scratch buffers to relax the hardware requirements, and allow
> >>> userspace operation with less buffers than strictly required by the
> >>> hardware.
> >>>
> >>> The cost of allocating such scratch buffers vary depending on the
> >>> device. When an IOMMU is available, or when the device has a line stride
> >>> that can be set to 0 and supports race-free programming of the stride
> >>> and buffer addresses, the scratch buffer can be as small as a single
> >>> page or a single line. In other cases, a full-frame scratch buffer is
> >>> required, which is costly, and the decision on whether or not to
> >>> allocate such a scratch buffer should probably be taken with userspace
> >>> being involved.
> >>
> >> I honestly don't see why you would want to spend a lot of time on adding
> >> scratch buffer support just to save a bit of memory. Is the use-case of
> >> capturing just a single buffer so common? To me it seems that it only
> >> makes sense to spend effort on this if you only need to capture a single
> >> buffer and never need to stream more buffers.
> >>
> >> Can you describe the use-case of capturing just a single buffer? Is that
> >> just for testing libcamera? Or is it something that happens all the time
> >> during normal libcamera operation?
> >>
> >> Supporting scratch buffers is a lot of effort for something that is not
> >> needed for normal streaming.
> >>
> >>>
> >>> min_queued_buffers describes how the device operates from a userspace
> >>> point of view, so I don't think it should be considered or documented as
> >>> being a hardware requirement, but a driver requirement.
> >>
> >> It's a hardware and/or driver requirement. It is absolutely not a userspace
> >> requirement. Normal userspace applications that use VIDIOC_REQBUFS and just
> >> stream video will never notice this.
> >>
> >>>
> >>>> 2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
> >>>>    ensures the application can smoothly process the video stream. Typically this will
> >>>>    be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
> >>>>    one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
> >>>>    returns a filled buffer to userspace, and one buffer is processed by userspace.
> >>>>
> >>>>    This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
> >>>>    to the driver to increment it to a workable value.
> >>>
> >>> Do we know what those applications are ? I'm not disputing the fact that
> >>> this may need to be supported to avoid breaking old userspace, but I
> >>> also think this feature should be phased out for new drivers, especially
> >>> drivers that require a device-specific userspace and therefore won't
> >>> work out of the box with old applications.
> >>
> >> xawtv is one: it will call REQBUFS with count = 2 (so this would fail for
> >> any driver that sets min_queued_buffers to 2), and with count = 1 if it wants
> >> to capture just a single frame.
> >>
> >> 'git grep min_queued_buffers|grep -v videobuf|wc' gives me 83 places where it is
> >> set. Some of those are likely wrong (min_queued_buffers has been abused as a
> >> replacement for min_reqbufs_allocation), but still that's quite a lot.
> >>
> >> Mostly these are older drivers for hardware without an IOMMU and typically for
> >> SDTV capture. So memory is not a consideration for those drivers since a
> >> SDTV buffer is quite small.
> >>
> >>>
> >>>> 3) Stateful codecs in particular have additional requirements beyond the DMA engine
> >>>>    limits due to the fact that they have to keep track of reference buffers and other
> >>>>    codec limitations. As such more buffers are needed, and that number might also vary
> >>>>    based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
> >>>>    controls are used to report that. Support for this is required by the stateful codec
> >>>>    API.
> >>>>
> >>>>    The documentation of these controls suggest that these are generic controls, but
> >>>>    as of today they are only used by stateful codec drivers.
> >>>>
> >>>> 4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
> >>>>    3 or 4 buffers since the buffers arrive at a high frequency.
> >>>
> >>> High frame rates is an important feature, but it's also a can of worms.
> >>> V4L2 is lacking the ability to batch multiple frames, we will have to
> >>> address that. Hopefully it could be decoupled from this RFC.
> >>
> >> It's a separate issue indeed. I just mentioned it because I know SDR drivers
> >> use this. They are rarely used, though.
> >>
> >>>> Rather than have drivers try to correct the count value (typically incorrectly), the
> >>>> vb2_queue min_reqbufs_allocation field was added to set the minimum number of
> >>>> buffers that VIDIOC_REQBUFS should allocate if count is less than that.
> >>>
> >>> Even if I dislike this feature, I agree it's better implemented through
> >>> min_reqbufs_allocation than by manual calculations in drivers.
> >>>
> >>>> VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
> >>>> of how many buffers you want to create. It might create fewer buffers if you run out of
> >>>> memory, but never more than requested.
> >>>>
> >>>> But what is missing is that if you use CREATE_BUFS you need to know the value of
> >>>> min_queued_buffers + 1, and that is not exposed.
> >>>>
> >>>> I would propose to add a min_num_buffers field to struct v4l2_create_buffers
> >>>> and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
> >>>> that field. And vb2 can set it to min_queued_buffers + 1.
> >>>
> >>> This would require allocating a buffer first to get the value. Wouldn't
> >>> a read-only control be better ?
> >>
> >> No. You can call CREATE_BUFS with count = 0: in that case it does nothing,
> >> except filling in all those capabilities. It was designed with that in mind
> >> so you have an ioctl that can return all that information.
> >>
> >>> Furthermore, I would rather provide the min_queued_buffers value instead
> >>> of min_queued_buffers + 1. The V4L2 API should provide userspace with
> >>> information it needs to make informed decisions, but not make those
> >>> decisions in behalf of userspace. It's up to applications to add 1 or
> >>> more buffers depending on their use case.
> >>
> >> I would definitely want more opinions on this. What's the point of returning
> >> min_queued_buffers and then creating that many buffers and still not be able
> >> to stream?
> >>
> >> Can you think of a scenario (e.g. in libcamera or elsewhere) where that makes
> >> sense?
> >>
> >> Also, will the average V4L2 user have the knowledge to understand that? You
> >> have that knowledge, but I think for anyone else it would be really confusing.
> >>
> >>> I think we also need to discuss policies regarding scratch buffer
> >>> allocation in the context of this RFC. When the hardware supports small
> >>> scratch buffers, I would like to make it mandatory for drivers to do so
> >>> and support min_queued_buffers = 0.
> >>
> >> I would first like to know the use-case (as I mentioned above).
> >>
> >> For the type of drivers I mostly work with (video receivers), it would just
> >> be a lot of work for no gain. But perhaps for camera pipelines it does make
> >> sense?
> >>
> >>> When scratch buffers are expensive, do we want to still support them in
> >>> the kernel, perhaps in a way controlled by userspace ? A userspace that
> >>> can guarantee it will always provide min_queued_buffers + 1 buffers
> >>> could indicate so and avoid scratch buffer allocation, while a userspace
> >>> that can't provide that guarantee would get scratch buffers from the
> >>> kernel.
> >>
> >> That is really the difference between using VIDIOC_REQBUFS and VIDIOC_CREATE_BUFS.
> >> I.e., userspace can already choose this.
> >>
> >> Just to clarify the reason for this RFC: the current situation is messy. There
> >> is a lot of history and a lot of older drivers do not always do the right thing.
> >>
> >> With this RFC I would like to get a consensus of how it should work. After that
> >> I want to implement any missing bits and improve the documentation, and finally
> >> go through the drivers and at least try to make them behave consistently.
> >>
> >> Also I want to improve v4l2-compliance to test more corner cases, especially
> >> if you use CREATE_BUFS instead of REQBUFS (I already have a patch for that
> >> ready).
> >>
> >> The work Benjamin did on increasing the max number of supported buffers and the
> >> REMOVE_BUFS ioctl uncovered a lot of that messy history, and it is clear we need
> >> to try and clarify how it should work.
> >>
> >>>> The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
> >>>> are for stateful codec support only, at least for now.
> >>
> >> I just discovered that v4l2-compliance and v4l2-ctl do not honor these controls
> >> for stateful codecs. That's something that needs to be fixed.
> >>
> >> There is also one other item that I would like to discuss: the vb2 queue_setup
> >> callback is currently used for both REQBUFS and CREATE_BUFS, and it remains
> >> confusing for drivers how to use it exactly. I am inclined to redesign that
> >> part, most likely splitting it in two: either one callback for REQBUFS and one
> >> for CREATE_BUFS, or alternatively, one callback when allocating buffers for
> >> the first time (so REQBUFS and when CREATE_BUFS is called for the first time,
> >> i.e. when no buffers are allocated yet), and one callback when adding additional
> >> buffers. I would have to think about this, and probably experiment a bit.
> 
> What vb2 needs is information about the buffers based on the current pixel format:
> i.e. the number of planes and the size of each plane. Currently it relies on
> queue_setup to figure that out and either set or verify the sizes.
> 
> It might be much easier if there is a callback for drivers to provide that information,
> and let vb2 handle the actual REQBUFS/CREATE_BUFS handling. Every driver basically
> does the same tests (or is supposed to, at least). Moving that to vb2 should simplify
> drivers.

I like the sound of this.

> > Actually, this really has to be addressed since this is broken: you can call
> > CREATE_BUFS as a replacement for REQBUFS, but it will act like REQBUFS and
> > the requested sizes are not honored.
> > 
> > I added tests for this to v4l2-compliance (locally only), and it fails on
> > everything.

At least it's consistent :-D

> > It should not be news to anyone that I hate the CREATE_BUFS ioctl API. I posted
> > an RFC for a VIDIOC_ADD_BUFS replacement earlier this year:
> > 
> > https://lore.kernel.org/linux-media/243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl/
> > 
> > I wonder if we should restrict CREATE_BUFS to only be used after calling
> > REQBUFS, and to a proper job for ADD_BUFS. Because given the vb2 design flaw
> > I am not sure if it can be worked around. Or if we even want that.
> > 
> > What a mess.
> 
> I had a brainwave and I think this can be solved in the vb2 framework. This
> will require that a new V4L2_BUF_CAP_ flag is introduced to indicate that
> CREATE_BUFS does the right thing when called without calling REQBUFS first.
> 
> I don't dare restrict CREATE_BUFS as I suggested above: this ioctl has been
> around for over a decade and I have no idea how it is used 'in the field'.

We don't have to restrict it, we could consider it deprecated, avoid
touching it, and focus on a new VIDIOC_ADD_BUFS. Nothing would break if
we keep the current VIDIOC_CREATE_BUFS behaviour, even if it's badly
designed and/or implemented.

That being said, I don't oppose a flag, as long as there's a way for
userspace to determine if the flag is supported.

> I think I will work on the issues described in this RFC tomorrow and see if
> I can post an RFC patch series so we can continue the discussion based on
> actual code.

Thank you for working on this.

> > Looking at the kernel history, CREATE_BUFS was added back in 2011 and the first
> > very simple v4l2-compliance tests were added in 2012.
> > 
> > Moral: whenever a new uAPI is added, make sure it you make really good compliance
> > tests as well.

More than that, we should have real users, not just compliance or test
tools.

> >>>> If this is in place, then min_reqbufs_allocation should be set to a sane number of
> >>>> buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.

-- 
Regards,

Laurent Pinchart

