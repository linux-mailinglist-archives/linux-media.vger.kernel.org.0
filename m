Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5E127E576
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 11:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgI3JpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 05:45:02 -0400
Received: from mail.netline.ch ([148.251.143.178]:48930 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3JpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 05:45:02 -0400
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 05:45:00 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id 4C1A92A6042;
        Wed, 30 Sep 2020 11:39:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id uXVtVzCDHncF; Wed, 30 Sep 2020 11:39:07 +0200 (CEST)
Received: from thor (212.174.63.188.dynamic.wline.res.cust.swisscom.ch [188.63.174.212])
        by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7000B2A6016;
        Wed, 30 Sep 2020 11:39:07 +0200 (CEST)
Received: from [::1]
        by thor with esmtp (Exim 4.94)
        (envelope-from <michel@daenzer.net>)
        id 1kNYZq-000pFt-Ja; Wed, 30 Sep 2020 11:39:06 +0200
To:     Jason Ekstrand <jason@jlekstrand.net>
Cc:     Chenbo Feng <fengc@google.com>, daniels@collabora.com,
        daniel.vetter@ffwll.ch, jajones@nvidia.com,
        linux-kernel@vger.kernel.org, Greg Hackmann <ghackmann@google.com>,
        linaro-mm-sig@lists.linaro.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org, jessehall@google.com,
        airlied@redhat.com, christian.koenig@amd.com,
        linux-media@vger.kernel.org
References: <20200311034351.1275197-3-jason@jlekstrand.net>
 <20200317212115.419358-1-jason@jlekstrand.net>
From:   =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH 3/3] RFC: dma-buf: Add an API for importing and exporting
 sync files (v5)
Message-ID: <64eed158-22a8-10a7-7686-c972f8542649@daenzer.net>
Date:   Wed, 30 Sep 2020 11:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200317212115.419358-1-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-03-17 10:21 p.m., Jason Ekstrand wrote:
> Explicit synchronization is the future.  At least, that seems to be what
> most userspace APIs are agreeing on at this point.  However, most of our
> Linux APIs (both userspace and kernel UAPI) are currently built around
> implicit synchronization with dma-buf.  While work is ongoing to change
> many of the userspace APIs and protocols to an explicit synchronization
> model, switching over piecemeal is difficult due to the number of
> potential components involved.  On the kernel side, many drivers use
> dma-buf including GPU (3D/compute), display, v4l, and others.  In
> userspace, we have X11, several Wayland compositors, 3D drivers, compute
> drivers (OpenCL etc.), media encode/decode, and the list goes on.
> 
> This patch provides a path forward by allowing userspace to manually
> manage the fences attached to a dma-buf.  Alternatively, one can think
> of this as making dma-buf's implicit synchronization simply a carrier
> for an explicit fence.  This is accomplished by adding two IOCTLs to
> dma-buf for importing and exporting a sync file to/from the dma-buf.
> This way a userspace component which is uses explicit synchronization,
> such as a Vulkan driver, can manually set the write fence on a buffer
> before handing it off to an implicitly synchronized component such as a
> Wayland compositor or video encoder.  In this way, each of the different
> components can be upgraded to an explicit synchronization model one at a
> time as long as the userspace pieces connecting them are aware of it and
> import/export fences at the right times.
> 
> There is a potential race condition with this API if userspace is not
> careful.  A typical use case for implicit synchronization is to wait for
> the dma-buf to be ready, use it, and then signal it for some other
> component.  Because a sync_file cannot be created until it is guaranteed
> to complete in finite time, userspace can only signal the dma-buf after
> it has already submitted the work which uses it to the kernel and has
> received a sync_file back.  There is no way to atomically submit a
> wait-use-signal operation.  This is not, however, really a problem with
> this API so much as it is a problem with explicit synchronization
> itself.  The way this is typically handled is to have very explicit
> ownership transfer points in the API or protocol which ensure that only
> one component is using it at any given time.  Both X11 (via the PRESENT
> extension) and Wayland provide such ownership transfer points via
> explicit present and idle messages.
> 
> The decision was intentionally made in this patch to make the import and
> export operations IOCTLs on the dma-buf itself rather than as a DRM
> IOCTL.  This makes it the import/export operation universal across all
> components which use dma-buf including GPU, display, v4l, and others.
> It also means that a userspace component can do the import/export
> without access to the DRM fd which may be tricky to get in cases where
> the client communicates with DRM via a userspace API such as OpenGL or
> Vulkan.  At a future date we may choose to add direct import/export APIs
> to components such as drm_syncobj to avoid allocating a file descriptor
> and going through two ioctls.  However, that seems to be something of a
> micro-optimization as import/export operations are likely to happen at a
> rate of a few per frame of rendered or decoded video.
> 
> v2 (Jason Ekstrand):
>   - Use a wrapper dma_fence_array of all fences including the new one
>     when importing an exclusive fence.
> 
> v3 (Jason Ekstrand):
>   - Lock around setting shared fences as well as exclusive
>   - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
>   - Initialize ret to 0 in dma_buf_wait_sync_file
> 
> v4 (Jason Ekstrand):
>   - Use the new dma_resv_get_singleton helper
> 
> v5 (Jason Ekstrand):
>   - Rename the IOCTLs to import/export rather than wait/signal
>   - Drop the WRITE flag and always get/set the exclusive fence
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

What's the status of this? DMA_BUF_IOCTL_EXPORT_SYNC_FILE would be 
useful for Wayland compositors to wait for client buffers to become 
ready without being prone to getting delayed by later HW access to them, 
so it would be nice to merge that at least (if 
DMA_BUF_IOCTL_IMPORT_SYNC_FILE is still controversial).


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
