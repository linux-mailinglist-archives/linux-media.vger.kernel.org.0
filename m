Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5CB677D21
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 14:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbjAWNzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 08:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAWNzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 08:55:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D48728F
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 05:55:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C5472B3;
        Mon, 23 Jan 2023 14:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674482147;
        bh=6OMfBS4zGHxl1yc7Z1SfyOLfxUIVyVOKAzsjZUlbwBg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MFHru+S3ErLB/7W0Tpb/SZiqW9yw68qfr6PBEiiaSQXAgKr0x/qXMpAiFBDag+pTa
         1+E1k4SkfIv3bi4zgVrIiujdlyvWcwGTwGSyuhGD3mEjcO99PXUWJmLtlJcMQNA3iB
         sL1nG+YZm4EgklN4+7UbL6rIb5mYlIb8WvQ6AFtk=
Date:   Mon, 23 Jan 2023 15:55:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Cc:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, mchehab@kernel.org,
        James Jones <jajones@nvidia.com>
Subject: Re: DMA-heap driver hints
Message-ID: <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christian,

CC'ing James as I think this is related to his work on the unix device
memory allocator ([1]).

[1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/

On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
> Hi guys,
> 
> this is just an RFC! The last time we discussed the DMA-buf coherency
> problem [1] we concluded that DMA-heap first needs a better way to
> communicate to userspace which heap to use for a certain device.
> 
> As far as I know userspace currently just hard codes that information
> which is certainly not desirable considering that we should have this
> inside the kernel as well.
> 
> So what those two patches here do is to first add some
> dma_heap_create_device_link() and  dma_heap_remove_device_link()
> function and then demonstrating the functionality with uvcvideo
> driver.
> 
> The preferred DMA-heap is represented with a symlink in sysfs between
> the device and the virtual DMA-heap device node.

I'll start with a few high-level comments/questions:

- Instead of tying drivers to heaps, have you considered a system where
  a driver would expose constraints, and a heap would then be selected
  based on those constraints ? A tight coupling between heaps and
  drivers means downstream patches to drivers in order to use
  vendor-specific heaps, that sounds painful.

  A constraint-based system would also, I think, be easier to extend
  with additional constraints in the future.

- I assume some drivers will be able to support multiple heaps. How do
  you envision this being implemented ?

- Devices could have different constraints based on particular
  configurations. For instance, a device may require specific memory
  layout for multi-planar YUV formats only (as in allocating the Y and C
  planes of NV12 from different memory banks). A dynamic API may thus be
  needed (but may also be very painful to use from userspace).

> What's still missing is certainly matching userspace for this since I
> wanted to discuss the initial kernel approach first.

https://git.libcamera.org/libcamera/libcamera.git/ would be a good place
to prototype userspace support :-)

> Please take a look and comment.
> 
> Thanks,
> Christian.
> 
> [1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/

-- 
Regards,

Laurent Pinchart
