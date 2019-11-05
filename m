Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5411DEFCA0
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 12:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbfKELpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 06:45:54 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:34906 "EHLO
        mail1.hostfission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbfKELpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Nov 2019 06:45:54 -0500
X-Greylist: delayed 598 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Nov 2019 06:45:52 EST
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
        by mail1.hostfission.com (Postfix) with ESMTP id 69CC54BB2F;
        Tue,  5 Nov 2019 22:35:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
        s=mail; t=1572953751;
        bh=Zw56D+Lu/znhm5oRa5VDkM2uIIC+CjFGlW6S6Nwj2xU=;
        h=To:Subject:Date:From:Cc:In-Reply-To:References:From;
        b=aobnrcRsS6jkl3xwZG4yR7bumrBzyFPRJoL665omQGm7cmFj+DA3fvkDb6bnNfWLl
         jvdoo3jvXEQpOAh4l0GrjFFmX2uLzYbbClHQdjrHE1ceIXrQq5Atj1Y7RlPkEa/5jJ
         pBd6whBh3TdfkSDYRHauteDATsAGzQW7Rhxj1/PU=
Received: by www1.hostfission.com (Postfix, from userid 1000)
        id 60AC9804E7; Tue,  5 Nov 2019 22:35:51 +1100 (AEDT)
To:     Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: guest / host buffer sharing ...
X-PHP-Originating-Script: 0:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Nov 2019 22:35:51 +1100
From:   Geoffrey McRae <geoff@hostfission.com>
Cc:     Keiichi Watanabe <keiichiw@chromium.org>,
        David Stevens <stevensd@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dmitry Morozov <dmitry.morozov@opensynergy.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Daniel Vetter <daniel@ffwll.ch>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
In-Reply-To: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
Message-ID: <7255d3ca5f10bbf14b1a3fcb6ac34a19@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.2.3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gerd.

On 2019-11-05 21:54, Gerd Hoffmann wrote:
> Hi folks,
> 
> The issue of sharing buffers between guests and hosts keeps poping
> up again and again in different contexts.  Most recently here:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg656685.html
> 
> So, I'm grabbing the recipient list of the virtio-vdec thread and some
> more people I know might be interested in this, hoping to have everyone
> included.
> 
> Reason is:  Meanwhile I'm wondering whenever "just use virtio-gpu
> resources" is really a good answer for all the different use cases
> we have collected over time.  Maybe it is better to have a dedicated
> buffer sharing virtio device?  Here is the rough idea:
> 

This would be the ultimate solution to this, it would also make it the 
defacto device, possibly even leading to the deprecation of the IVSHMEM 
device.

> 
> (1) The virtio device
> =====================
> 
> Has a single virtio queue, so the guest can send commands to register
> and unregister buffers.  Buffers are allocated in guest ram.  Each 
> buffer
> has a list of memory ranges for the data.  Each buffer also has some
> properties to carry metadata, some fixed (id, size, application), but
> also allow free form (name = value, framebuffers would have
> width/height/stride/format for example).
> 

Perfect, however since it's to be a generic device there also needs to 
be a
method in the guest to identify which device is the one the application 
is
interested in without opening the device. Since windows makes the
subsystem vendor ID and device ID available to the userspace 
application,
I suggest these be used for this purpose.

To avoid clashes a simple text file to track reservations of subsystem 
IDs
for applications/protocols would be recommended.

The device should also support a reset feature allowing the guest to
notify the host application that all buffers have become invalid such as
on abnormal termination of the guest application that is using the 
device.

Conversely, qemu on unix socket disconnect should notify the guest of 
this
event also, allowing each end to properly syncronize.

> 
> (2) The linux guest implementation
> ==================================
> 
> I guess I'd try to make it a drm driver, so we can re-use drm
> infrastructure (shmem helpers for example).  Buffers are dumb drm
> buffers.  dma-buf import and export is supported (shmem helpers
> get us that for free).  Some device-specific ioctls to get/set
> properties and to register/unregister the buffers on the host.
> 

I would be happy to do what I can to implement the windows driver for 
this
if nobody else is interested in doing so, however, my abilities in this
field is rather limited and the results may not be that great :)

> 
> (3) The qemu host implementation
> ================================
> 
> qemu (likewise other vmms) can use the udmabuf driver to create
> host-side dma-bufs for the buffers.  The dma-bufs can be passed to
> anyone interested, inside and outside qemu.  We'll need some protocol
> for communication between qemu and external users interested in those
> buffers, to receive dma-bufs (via unix file descriptor passing) and
> update notifications.  Dispatching updates could be done based on the
> application property, which could be "virtio-vdec" or "wayland-proxy"
> for example.

I don't know enough about udmabuf to really comment on this except to 
ask
a question. Would this make guest to guest transfers without an
intermediate buffer possible?

-Geoff

> 
> 
> commments?
> 
> cheers,
>   Gerd
