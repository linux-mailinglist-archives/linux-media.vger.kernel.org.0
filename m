Return-Path: <linux-media+bounces-20436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F299B3566
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 16:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8121F24057
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 15:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502E51DE3D1;
	Mon, 28 Oct 2024 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TB/HUUqV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD6189913
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130775; cv=none; b=qC8t/5gJJUUr0iQXX0NG8RYZgvWyjEquCUnWpu82jKJe8y1yHbcpeT2j7wqY75NXmkDQcmT6bAMaTUpPtTVRjFOg7w1tHOeKrgqrArG6KU1w8MgBsGDDaMLnqw6BSk89TAnuHLbvTEcERfwWj/TQwTlZtUSYAAy1rCWiH5IUr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130775; c=relaxed/simple;
	bh=BF9QjCRP6VNqaQ+WvDY8YLCxKuMzTd9tnq4ihNt3pq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHofl8WGP2sr07XHTGGCc18NCb+B44jb0n/95mJv3PP39kCfNOdoynRJxHSBmwnZ3tZ6vvEeOBmJwYqAXNYSQu9YWGw/O3zrtNFnh9EGXo3otQZ3K8l5gf3cQo38LvsrxSr38vQrzbWp6CEqjCxgl4MGu3mKaVvGVJxrlNBLdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TB/HUUqV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFED6743;
	Mon, 28 Oct 2024 16:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730130770;
	bh=BF9QjCRP6VNqaQ+WvDY8YLCxKuMzTd9tnq4ihNt3pq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TB/HUUqVKJPpLi1ZfyVOoOMDCrgfXS1H2ohs2Oj6lEtXIlXFuvYC55d7Ix2zEwNZl
	 e+b8XGlKaHPpXa1eb9LvLwEEh+i9ki3wC0llPV3RY1X9zyTx1L116Ki/U35c1m2DPV
	 DynCMu9bMFvDfKurX2hzCuZWn+83LSfCOPBsNS+4=
Date: Mon, 28 Oct 2024 17:52:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
Message-ID: <20241028155244.GK24052@pendragon.ideasonboard.com>
References: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>

Hi Hans,

On Mon, Oct 28, 2024 at 12:10:22PM +0100, Hans Verkuil wrote:
> Hi all,
> 
> This mail thread uncovered some corner cases around how many buffers should be allocated
> if VIDIOC_REQBUFS with count = 1 is called:
> 
> https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8

I'll repeat below some comments I've made in that thread, as they're
better discussed in the context of this RFC.

> When it comes to the minimum number of buffers there are a number of limitations:
> 
> 1) The DMA engine needs at least N buffers to be queued before it can start. Typically
>    this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
>    So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
>    DMA to. Allocating just one buffer would mean the DMA engine can never return that
>    buffer to userspace (it would just keep recycling the same buffer over and over), so
>    the minimum must be min_queued_buffers + 1.

I think you're mixing hardware and driver constraints here. Drivers can
use scratch buffers to relax the hardware requirements, and allow
userspace operation with less buffers than strictly required by the
hardware.

The cost of allocating such scratch buffers vary depending on the
device. When an IOMMU is available, or when the device has a line stride
that can be set to 0 and supports race-free programming of the stride
and buffer addresses, the scratch buffer can be as small as a single
page or a single line. In other cases, a full-frame scratch buffer is
required, which is costly, and the decision on whether or not to
allocate such a scratch buffer should probably be taken with userspace
being involved.

min_queued_buffers describes how the device operates from a userspace
point of view, so I don't think it should be considered or documented as
being a hardware requirement, but a driver requirement.

> 2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
>    ensures the application can smoothly process the video stream. Typically this will
>    be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
>    one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
>    returns a filled buffer to userspace, and one buffer is processed by userspace.
> 
>    This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
>    to the driver to increment it to a workable value.

Do we know what those applications are ? I'm not disputing the fact that
this may need to be supported to avoid breaking old userspace, but I
also think this feature should be phased out for new drivers, especially
drivers that require a device-specific userspace and therefore won't
work out of the box with old applications.

> 3) Stateful codecs in particular have additional requirements beyond the DMA engine
>    limits due to the fact that they have to keep track of reference buffers and other
>    codec limitations. As such more buffers are needed, and that number might also vary
>    based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
>    controls are used to report that. Support for this is required by the stateful codec
>    API.
> 
>    The documentation of these controls suggest that these are generic controls, but
>    as of today they are only used by stateful codec drivers.
> 
> 4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
>    3 or 4 buffers since the buffers arrive at a high frequency.

High frame rates is an important feature, but it's also a can of worms.
V4L2 is lacking the ability to batch multiple frames, we will have to
address that. Hopefully it could be decoupled from this RFC.

> Rather than have drivers try to correct the count value (typically incorrectly), the
> vb2_queue min_reqbufs_allocation field was added to set the minimum number of
> buffers that VIDIOC_REQBUFS should allocate if count is less than that.

Even if I dislike this feature, I agree it's better implemented through
min_reqbufs_allocation than by manual calculations in drivers.

> VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
> of how many buffers you want to create. It might create fewer buffers if you run out of
> memory, but never more than requested.
> 
> But what is missing is that if you use CREATE_BUFS you need to know the value of
> min_queued_buffers + 1, and that is not exposed.
> 
> I would propose to add a min_num_buffers field to struct v4l2_create_buffers
> and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
> that field. And vb2 can set it to min_queued_buffers + 1.

This would require allocating a buffer first to get the value. Wouldn't
a read-only control be better ?

Furthermore, I would rather provide the min_queued_buffers value instead
of min_queued_buffers + 1. The V4L2 API should provide userspace with
information it needs to make informed decisions, but not make those
decisions in behalf of userspace. It's up to applications to add 1 or
more buffers depending on their use case.

I think we also need to discuss policies regarding scratch buffer
allocation in the context of this RFC. When the hardware supports small
scratch buffers, I would like to make it mandatory for drivers to do so
and support min_queued_buffers = 0.

When scratch buffers are expensive, do we want to still support them in
the kernel, perhaps in a way controlled by userspace ? A userspace that
can guarantee it will always provide min_queued_buffers + 1 buffers
could indicate so and avoid scratch buffer allocation, while a userspace
that can't provide that guarantee would get scratch buffers from the
kernel.

> The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
> are for stateful codec support only, at least for now.
> 
> If this is in place, then min_reqbufs_allocation should be set to a sane number of
> buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.

-- 
Regards,

Laurent Pinchart

