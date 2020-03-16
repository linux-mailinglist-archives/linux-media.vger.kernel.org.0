Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C66186BA8
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 14:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731069AbgCPNBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 09:01:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731062AbgCPNBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 09:01:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D796A3B;
        Mon, 16 Mar 2020 14:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584363690;
        bh=1V1sKsfdxrhZLhq7sVC0NonWtNyOzyBM3s3HfRmhCvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cXFzTWMZxFg/g9Y0jXJHkK1tDgLjh4IiWsYVysO1SnnrCEbAt7/e4OW5IfzeFL/Md
         ztuEz+KoJUEMpC46Ic5z7El5yC6ve8JpKk7zUuRV/HUT4IjeqbJBoZwDJ5uYq6twi6
         mFraoaRezdE50aUgAYrFP53SrmsJTI9ddqiiOfbs=
Date:   Mon, 16 Mar 2020 15:01:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomek Bury <tomek.bury@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Daniel Stone <daniel@fooishbar.org>,
        Dave Airlie <airlied@gmail.com>, linux-media@vger.kernel.org
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
Message-ID: <20200316130125.GK4732@pendragon.ideasonboard.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomek,

On Mon, Mar 16, 2020 at 12:55:27PM +0000, Tomek Bury wrote:
> Hi Jason,
> 
> I've been wrestling with the sync problems in Wayland some time ago, but only
> with regards to 3D drivers.
> 
> The guarantee given by the GL/GLES spec is limited to a single graphics
> context. If the same buffer is accessed by 2 contexts the outcome is
> unspecified. The cross-context and cross-process synchronisation is not
> guaranteed. It happens to work on Mesa, because the read/write locking is
> implemented in the kernel space, but it didn't work on Broadcom driver, which
> has read-write interlocks in user space.
> 
>  A Vulkan client makes it even worse because of conflicting requirements:
> Vulkan's vkQueuePresentKHR() passes in a number of semaphores but disallows
> waiting. Wayland WSI requires wl_surface_commit() to be called from
> vkQueuePresentKHR() which does require a wait, unless a synchronisation
> primitive representing Vulkan samaphores is passed between Vulkan client and
> the compositor.
> 
> The most troublesome part was Wayland buffer release mechanism, as it only
> involves a CPU signalling over Wayland IPC, without any 3D driver involvement.
> The choices were: explicit synchronisation extension or a buffer copy in the
> compositor (i.e. compositor textures from the copy, so the client can re-write
> the original), or some implicit synchronisation in kernel space (but that
> wasn't an option in Broadcom driver).
> 
> With regards to V4L2, I believe it could easily work the same way as 3D
> drivers, i.e. pass a buffer+fence pair to the next stage. The encode always
> succeeds, but for capture or decode, the main problem is the uncertain outcome,
> I believe? If we're fine with rendering or displaying an occasional broken
> frame, then buffer+fence pair would work too. The broken frame will go into the
> pipeline, but application can drain the pipeline and start over once the
> capture works again.
> 
> To answer some points raised by Laurent (although I'm unfamiliar with the
> camera drivers):
> 
> > you don't know until capture complete in which buffer the frame has
> > been captured
>
> Surely you do, you only don't know in advance if the capture will be successful

You do in kernelspace, but not in userspace at the moment, due to buffer
recycling.

> > but if an error occurs during capture, they can be recycled internally and
> > put to the back of the queue.
>
> That would have to change in order to use explicit synchronisation. Every
> started capture becomes immediately available as a buffer+fence pair. Fence is
> signalled once the capture is finished (successfully or otherwise). The buffer
> must not be reused until it's released, possibly with another fence - in that
> case the buffer must not be reused until the release fence is signalled.

We could certainly change this at least in some cases, but it would
break existing userspace that doesn't expect incorrect frames.

I'm however not sure we could change this behaviour in every case, there
may be hardware that can't provide a guarantee on the order in which
buffers will be used. I'm aware this wouldn't be compatible with
explicit synchronization, and that's my point: camera hardware may not
always support explicit synchronization. As long as we can fall back to
not using fences then we should be fine.

-- 
Regards,

Laurent Pinchart
