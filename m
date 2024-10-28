Return-Path: <linux-media+bounces-20412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 111359B2E93
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 12:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 347351C20ECC
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 11:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4585B1DBB13;
	Mon, 28 Oct 2024 11:10:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09EA1D63E4
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113824; cv=none; b=blkwbPCnuM3PmdYVPODCiZ9zkO+grthF0uUavvO2AJ1xnv3YWWqi7PSh35FD/DKpZpL6r7FKZyjiJEvxh/qeqCfg5QOj4eOE6yZo+F7GLyKDv6lIbrgB7Di7Eh6EZK4OTEa4SqjRpu/xXAiDaPMvtGA+3M1jji311CsqTG5KEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113824; c=relaxed/simple;
	bh=bykZtZxLUw6+hTNPTameAXz6yCKpIKukukEdjuLNsPY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=ng0Ik4om0eo5Hz/0TnFYEPQQO8+GuU6im0BVFmTd9VvBXLdZGdOpz4SG9tadPGC/XwxCFrn3GJJIyak95Aw6dl1E5qfmj7cMkp8pD9SI9MysMOf6yfIFeSXATYRzIEleeC2FFxzhuAL9zIJAw5VYkcD2N+Xs7XB812YKTIsrx+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011F1C4CEC3
	for <linux-media@vger.kernel.org>; Mon, 28 Oct 2024 11:10:23 +0000 (UTC)
Message-ID: <126cd76a-6224-483b-a18d-a3cc89e5ff2d@xs4all.nl>
Date: Mon, 28 Oct 2024 12:10:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: RFC: add min_num_buffers and clarify
 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

This mail thread uncovered some corner cases around how many buffers should be allocated
if VIDIOC_REQBUFS with count = 1 is called:

https://lore.kernel.org/linux-media/20241003-rp1-cfe-v6-0-d6762edd98a8@ideasonboard.com/T/#mc2210597d92b5a0f09fabdac2f7307128aaa9bd8

When it comes to the minimum number of buffers there are a number of limitations:

1) The DMA engine needs at least N buffers to be queued before it can start. Typically
   this is 0, 1 or 2, and a driver sets this via the vb2_queue min_queued_buffers field.
   So if min_queued_buffers = 1, then the DMA engine needs one buffer at all times to
   DMA to. Allocating just one buffer would mean the DMA engine can never return that
   buffer to userspace (it would just keep recycling the same buffer over and over), so
   the minimum must be min_queued_buffers + 1.

2) Historically VIDIOC_REQBUFS is expected to increase the count value to a number that
   ensures the application can smoothly process the video stream. Typically this will
   be 3 or 4 (if min_queued_buffers == 2): min_queued_buffers are used by the DMA engine,
   one buffer is queued up in vb2, ready to be used by the DMA engine as soon as it
   returns a filled buffer to userspace, and one buffer is processed by userspace.

   This is to support applications that call VIDIOC_REQBUFS with count = 1 and leave it
   to the driver to increment it to a workable value.

3) Stateful codecs in particular have additional requirements beyond the DMA engine
   limits due to the fact that they have to keep track of reference buffers and other
   codec limitations. As such more buffers are needed, and that number might also vary
   based on the specific codec used. The V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
   controls are used to report that. Support for this is required by the stateful codec
   API.

   The documentation of these controls suggest that these are generic controls, but
   as of today they are only used by stateful codec drivers.

4) Some corner cases (mainly/only SDR, I think) where you need more than the usual
   3 or 4 buffers since the buffers arrive at a high frequency.

Rather than have drivers try to correct the count value (typically incorrectly), the
vb2_queue min_reqbufs_allocation field was added to set the minimum number of
buffers that VIDIOC_REQBUFS should allocate if count is less than that.

VIDIOC_CREATE_BUFS is not affected by that: if you use CREATE_BUFS you take full control
of how many buffers you want to create. It might create fewer buffers if you run out of
memory, but never more than requested.

But what is missing is that if you use CREATE_BUFS you need to know the value of
min_queued_buffers + 1, and that is not exposed.

I would propose to add a min_num_buffers field to struct v4l2_create_buffers
and add a V4L2_BUF_CAP_SUPPORTS_MIN_NUM_BUFFERS flag to signal the presence of
that field. And vb2 can set it to min_queued_buffers + 1.

The second proposal is to explicitly document that the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
are for stateful codec support only, at least for now.

If this is in place, then min_reqbufs_allocation should be set to a sane number of
buffers (i.e. typically 3 or 4), and if you want precise control, use VIDIOC_CREATE_BUFS.

Regards,

	Hans

