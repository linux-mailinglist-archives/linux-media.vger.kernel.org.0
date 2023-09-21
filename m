Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F3A7A9D2B
	for <lists+linux-media@lfdr.de>; Thu, 21 Sep 2023 21:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjIUT3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Sep 2023 15:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjIUT25 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Sep 2023 15:28:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CC8A9E6
        for <linux-media@vger.kernel.org>; Thu, 21 Sep 2023 10:07:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84308C43140;
        Thu, 21 Sep 2023 07:41:00 +0000 (UTC)
Message-ID: <b442fe1e-ac57-4cf5-9bae-ac59bdf7e778@xs4all.nl>
Date:   Thu, 21 Sep 2023 09:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] v4l2-compliance: Add a test for DELETE_BUF ioctl
Content-Language: en-US, nl
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, kernel@collabora.com
References: <20230914133615.199122-1-benjamin.gaignard@collabora.com>
 <48c845f8-6ba1-448f-ac72-f9b3b2c173ca@xs4all.nl>
In-Reply-To: <48c845f8-6ba1-448f-ac72-f9b3b2c173ca@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

A quick follow-up on this:

On 20/09/2023 10:40, Hans Verkuil wrote:
> Hi Benjamin,
> 
> On 14/09/2023 15:36, Benjamin Gaignard wrote:
>> Add new test for DELETE_BUFS ioctl.
>> It create buffers and check if they could be removed from queue.
>> It also check that removing non existing buffer or a queued
>> buffer failed.
> 
> The DELETE_BUFS patch series really adds two different features:
> 
> 1) Allow for more than 32 buffers,
> 2) Allow deleting buffers.
> 
> That means that I actually would like to see two v4l2-compliance patches:
> one for each item. This is especially important since I would like to see
> the first feature being merged first.
> 
> One of the interesting things about writing compliance tests is how to
> know what the driver supports. And right now there is no way to detect
> the maximum number of buffers without actually allocating them.
> 
> There are a number of ways of doing this. One is to use the top 16 bits
> of the capabilities field in v4l2_requestbuffers and v4l2_create_buffers
> to store the max number of buffers that can be used.
> 
> But that takes away 16 bits of that 32 bit field.
> 
> Another option is to use the reserved fields to store this, but for
> v4l2_requestbuffers that's awkward since it would end up looking like this:
> 
> 	__u8 flags;
> 	__u8 reserved[1];
> 	__u16 max_buffers;
> 
> (i.e. a reserved field in the middle of a struct)
> 
> Another option is to only report this in v4l2_create_buffers by using one
> of the __u32 reserved fields.
> 
> This might be the best option, but it requires that the driver supports
> this ioctl. But that is something that can be checked, certainly in
> v4l2-compliance and likely in the kernel itself.
> 
> My proposal would be to add a new buffer capability:
> 
> 	#define V4L2_BUF_CAP_SUPPORTS_OVER_32_BUFS 0x00000080
> 
> This signals that the driver supports more than 32 buffers. And in
> v4l2_create_buffers take one of the reserved fields and change it to
> 
> 	__u32 max_buffers;
> 
> Note that I really, really believe we need a replacement for both
> VIDIOC_REQBUFS and VIDIOC_CREATE_BUFFERS. Something for later, though.
> 
> This will require some extra work in the kernel patch series, but
> you don't want userspace to have to guess.
> 
> The v4l2-ctl and v4l2-compliance utils need to be adapted to support these
> extra fields/flags and v4l2-compliance needs to test this. Note that there
> are no tests at the moment checking support for more than 32 buffers.
> It is so hardwired into the kernel that I never bothered implementing tests
> for this.

I have some more thoughts about testing the maximum number of buffers: it is
fine to do that for V4L2_MEMORY_USERPTR/DMABUF, since those do not actually
allocate any buffer memory, just some internal structures. So it is perfectly
fine to test REQBUFS/CREATE_BUFS for that.

For MEMORY_MMAP it is trickier, since this really allocates memory, and
depending on the amount of available memory this might cause ENOMEM errors.

I think testing this for MMAP should be limited to the vivid driver (is_vivid)
and only for the swradio and vbi device nodes.

We know that the buffer sizes are small for those device nodes, so testing
for large number of buffers is fine, and this is very useful for regression
testing.

Regards,

	Hans
