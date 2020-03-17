Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2749188C30
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 18:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgCQReh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 13:34:37 -0400
Received: from ns.lynxeye.de ([87.118.118.114]:33118 "EHLO lynxeye.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726130AbgCQReh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 13:34:37 -0400
Received: by lynxeye.de (Postfix, from userid 501)
        id 0F681E74222; Tue, 17 Mar 2020 18:34:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham version=3.3.1
Received: from antimon.fritz.box (a89-183-68-130.net-htp.de [89.183.68.130])
        by lynxeye.de (Postfix) with ESMTPSA id 8A1E9E741C4;
        Tue, 17 Mar 2020 18:34:30 +0100 (CET)
Message-ID: <4ac70925e08c1d66236094311a7f4eaa89dd0fba.camel@lynxeye.de>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
From:   Lucas Stach <dev@lynxeye.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        linux-media@vger.kernel.org
Date:   Tue, 17 Mar 2020 18:34:30 +0100
In-Reply-To: <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
         <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
         <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
         <20200316102034.GA30883@pendragon.ideasonboard.com>
         <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
         <20200316211502.GW4732@pendragon.ideasonboard.com>
         <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, den 17.03.2020, 11:33 -0400 schrieb Nicolas Dufresne:
> Le lundi 16 mars 2020 à 23:15 +0200, Laurent Pinchart a écrit :
> > Hi Jason,
> > 
> > On Mon, Mar 16, 2020 at 10:06:07AM -0500, Jason Ekstrand wrote:
> > > On Mon, Mar 16, 2020 at 5:20 AM Laurent Pinchart wrote:
> > > > On Wed, Mar 11, 2020 at 04:18:55PM -0400, Nicolas Dufresne wrote:
> > > > > (I know I'm going to be spammed by so many mailing list ...)
> > > > > 
> > > > > Le mercredi 11 mars 2020 à 14:21 -0500, Jason Ekstrand a écrit :
> > > > > > On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > All,
> > > > > > > 
> > > > > > > Sorry for casting such a broad net with this one. I'm sure most people
> > > > > > > who reply will get at least one mailing list rejection.  However, this
> > > > > > > is an issue that affects a LOT of components and that's why it's
> > > > > > > thorny to begin with.  Please pardon the length of this e-mail as
> > > > > > > well; I promise there's a concrete point/proposal at the end.
> > > > > > > 
> > > > > > > 
> > > > > > > Explicit synchronization is the future of graphics and media.  At
> > > > > > > least, that seems to be the consensus among all the graphics people
> > > > > > > I've talked to.  I had a chat with one of the lead Android graphics
> > > > > > > engineers recently who told me that doing explicit sync from the start
> > > > > > > was one of the best engineering decisions Android ever made.  It's
> > > > > > > also the direction being taken by more modern APIs such as Vulkan.
> > > > > > > 
> > > > > > > 
> > > > > > > ## What are implicit and explicit synchronization?
> > > > > > > 
> > > > > > > For those that aren't familiar with this space, GPUs, media encoders,
> > > > > > > etc. are massively parallel and synchronization of some form is
> > > > > > > required to ensure that everything happens in the right order and
> > > > > > > avoid data races.  Implicit synchronization is when bits of work (3D,
> > > > > > > compute, video encode, etc.) are implicitly based on the absolute
> > > > > > > CPU-time order in which API calls occur.  Explicit synchronization is
> > > > > > > when the client (whatever that means in any given context) provides
> > > > > > > the dependency graph explicitly via some sort of synchronization
> > > > > > > primitives.  If you're still confused, consider the following
> > > > > > > examples:
> > > > > > > 
> > > > > > > With OpenGL and EGL, almost everything is implicit sync.  Say you have
> > > > > > > two OpenGL contexts sharing an image where one writes to it and the
> > > > > > > other textures from it.  The way the OpenGL spec works, the client has
> > > > > > > to make the API calls to render to the image before (in CPU time) it
> > > > > > > makes the API calls which texture from the image.  As long as it does
> > > > > > > this (and maybe inserts a glFlush?), the driver will ensure that the
> > > > > > > rendering completes before the texturing happens and you get correct
> > > > > > > contents.
> > > > > > > 
> > > > > > > Implicit synchronization can also happen across processes.  Wayland,
> > > > > > > for instance, is currently built on implicit sync where the client
> > > > > > > does their rendering and then does a hand-off (via wl_surface::commit)
> > > > > > > to tell the compositor it's done at which point the compositor can now
> > > > > > > texture from the surface.  The hand-off ensures that the client's
> > > > > > > OpenGL API calls happen before the server's OpenGL API calls.
> > > > > > > 
> > > > > > > A good example of explicit synchronization is the Vulkan API.  There,
> > > > > > > a client (or multiple clients) can simultaneously build command
> > > > > > > buffers in different threads where one of those command buffers
> > > > > > > renders to an image and the other textures from it and then submit
> > > > > > > both of them at the same time with instructions to the driver for
> > > > > > > which order to execute them in.  The execution order is described via
> > > > > > > the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> > > > > > > extension, you can even submit the work which does the texturing
> > > > > > > BEFORE the work which does the rendering and the driver will sort it
> > > > > > > out.
> > > > > > > 
> > > > > > > The #1 problem with implicit synchronization (which explicit solves)
> > > > > > > is that it leads to a lot of over-synchronization both in client space
> > > > > > > and in driver/device space.  The client has to synchronize a lot more
> > > > > > > because it has to ensure that the API calls happen in a particular
> > > > > > > order.  The driver/device have to synchronize a lot more because they
> > > > > > > never know what is going to end up being a synchronization point as an
> > > > > > > API call on another thread/process may occur at any time.  As we move
> > > > > > > to more and more multi-threaded programming this synchronization (on
> > > > > > > the client-side especially) becomes more and more painful.
> > > > > > > 
> > > > > > > 
> > > > > > > ## Current status in Linux
> > > > > > > 
> > > > > > > Implicit synchronization in Linux works via a the kernel's internal
> > > > > > > dma_buf and dma_fence data structures.  A dma_fence is a tiny object
> > > > > > > which represents the "done" status for some bit of work.  Typically,
> > > > > > > dma_fences are created as a by-product of someone submitting some bit
> > > > > > > of work (say, 3D rendering) to the kernel.  The dma_buf object has a
> > > > > > > set of dma_fences on it representing shared (read) and exclusive
> > > > > > > (write) access to the object.  When work is submitted which, for
> > > > > > > instance renders to the dma_buf, it's queued waiting on all the fences
> > > > > > > on the dma_buf and and a dma_fence is created representing the end of
> > > > > > > said rendering work and it's installed as the dma_buf's exclusive
> > > > > > > fence.  This way, the kernel can manage all its internal queues (3D
> > > > > > > rendering, display, video encode, etc.) and know which things to
> > > > > > > submit in what order.
> > > > > > > 
> > > > > > > For the last few years, we've had sync_file in the kernel and it's
> > > > > > > plumbed into some drivers.  A sync_file is just a wrapper around a
> > > > > > > single dma_fence.  A sync_file is typically created as a by-product of
> > > > > > > submitting work (3D, compute, etc.) to the kernel and is signaled when
> > > > > > > that work completes.  When a sync_file is created, it is guaranteed by
> > > > > > > the kernel that it will become signaled in finite time and, once it's
> > > > > > > signaled, it remains signaled for the rest of time.  A sync_file is
> > > > > > > represented in UAPIs as a file descriptor and can be used with normal
> > > > > > > file APIs such as dup().  It can be passed into another UAPI which
> > > > > > > does some bit of queue'd work and the submitted work will wait for the
> > > > > > > sync_file to be triggered before executing.  A sync_file also supports
> > > > > > > poll() if  you want to wait on it manually.
> > > > > > > 
> > > > > > > Unfortunately, sync_file is not broadly used and not all kernel GPU
> > > > > > > drivers support it.  Here's a very quick overview of my understanding
> > > > > > > of the status of various components (I don't know the status of
> > > > > > > anything in the media world):
> > > > > > > 
> > > > > > >  - Vulkan: Explicit synchronization all the way but we have to go
> > > > > > > implicit as soon as we interact with a window-system.  Vulkan has APIs
> > > > > > > to import/export sync_files to/from it's VkSemaphore and VkFence
> > > > > > > synchronization primitives.
> > > > > > >  - OpenGL: Implicit all the way.  There are some EGL extensions to
> > > > > > > enable some forms of explicit sync via sync_file but OpenGL itself is
> > > > > > > still implicit.
> > > > > > >  - Wayland: Currently depends on implicit sync in the kernel (accessed
> > > > > > > via EGL/OpenGL).  There is an unstable extension to allow passing
> > > > > > > sync_files around but it's questionable how useful it is right now
> > > > > > > (more on that later).
> > > > > > >  - X11: With present, it has these "explicit" fence objects but
> > > > > > > they're always a shmfence which lets the X server and client do a
> > > > > > > userspace CPU-side hand-off without going over the socket (and
> > > > > > > round-tripping through the kernel).  However, the only thing that
> > > > > > > fence does is order the OpenGL API calls in the client and server and
> > > > > > > the real synchronization is still implicit.
> > > > > > >  - linux/i915/gem: Fully supports using sync_file or syncobj for explicit
> > > > > > > sync.
> > > > > > >  - linux/amdgpu: Supports sync_file and syncobj but it still
> > > > > > > implicitly syncs sometimes due to it's internal memory residency
> > > > > > > handling which can lead to over-synchronization.
> > > > > > >  - KMS: Implicit sync all the way.  There are no KMS APIs which take
> > > > > > > explicit sync primitives.
> > > > > > 
> > > > > > Correction:  Apparently, I missed some things.  If you use atomic, KMS
> > > > > > does have explicit in- and out-fences.  Non-atomic users (e.g. X11)
> > > > > > are still in trouble but most Wayland compositors use atomic these
> > > > > > days
> > > > > > 
> > > > > > >  - v4l: ???
> > > > > > >  - gstreamer: ???
> > > > > > >  - Media APIs such as vaapi etc.:  ???
> > > > > 
> > > > > GStreamer is consumer for V4L2, VAAPI and other stuff. Using asynchronous buffer
> > > > > synchronisation is something we do already with GL (even if limited). We place
> > > > > GLSync object in the pipeline and attach that on related GstBuffer. We wait on
> > > > > these GLSync as late as possible (or superseed the sync if we queue more work
> > > > > into the same GL context). That requires a special mode of operation of course.
> > > > > We don't usually like making lazy blocking call implicit, as it tends to cause
> > > > > random issues. If we need to wait, we think it's better to wait int he module
> > > > > that is responsible, so in general, we try to negotiate and fallback locally
> > > > > (it's plugin base, so this can be really messy otherwise).
> > > > > 
> > > > > So basically this problem needs to be solved in V4L2, VAAPI and other lower
> > > > > level APIs first. We need API that provides us these fence (in or out), and then
> > > > > we can consider using them. For V4L2, there was an attempt, but it was a bit of
> > > > > a miss-fit. Your proposal could work, need to be tested I guess, but it does not
> > > > > solve some of other issues that was discussed. Notably for camera capture, were
> > > > > the HW timestamp is capture about at the same time the frame is ready. But the
> > > > > timestamp is not part of the paylaod, so you need an entire API asynchronously
> > > > > deliver that metadata. It's the biggest pain point I've found, such an API would
> > > > > be quite invasive or if made really generic, might just never be adopted widely
> > > > > enough.
> > > > 
> > > > Another issue is that V4L2 doesn't offer any guarantee on job ordering.
> > > > When you queue multiple buffers for camera capture for instance, you
> > > > don't know until capture complete in which buffer the frame has been
> > > > captured.
> > > 
> > > Is this a Kernel UAPI issue?  Surely the kernel driver knows at the
> > > start of frame capture which buffer it's getting written into.  I
> > > would think that the kernel APIs could be adjusted (if we find good
> > > reason to do so!) such that they return earlier and return a (buffer,
> > > fence) pair.  Am I missing something fundamental about video here?
> > 
> > For cameras I believe we could do that, yes. I was pointing out the
> > issues caused by the current API. For video decoders I'll let Nicolas
> > answer the question, he's way more knowledgeable that I am on that
> > topic.
> 
> Right now, there is simply no uAPI for supporting asynchronous errors
> reporting when fences are invovled. That is true for both camera's and
> CODEC. It's likely what all the attempt was missing, I don't know
> enough myself to suggest something.
> 
> Now, why Stateless video decoders are special is another subject. In
> CODECs, the decoding and the presentation order may differ. For
> Stateless kind of CODEC, a bitstream is passed to the HW. We don't know
> if this bitstream is fully valid, since the it is being parsed and
> validated by the firmware. It's also firmware job to decide which
> buffer should be presented first.
> 
> In most firmware interface, that information is communicated back all
> at once when the frame is ready to be presented (which may be quite
> some time after it was decoded). So indeed, a fence model is not really
> easy to add, unless the firmware was designed with that model in mind.
> 
> Nothing of course would prevent V4L2 framework to generically handle
> out_fence from other producers. It does not even handle implicit fences
> at the moment, which is already quite problematic (I've seen glitches
> on i.MX6/8 and Raspberry Pi 4).
> 
> In that specific case, if the fences from etnaviv, vc graphic drivers
> was exposed, we could solve this issue in userspace. Right now it's
> implicit, so we rely on all DMABuf driver to have proper support, which
> is not the case. There is V4L2 support for that coming, but the wait is
> done synchronously in userspace call that was normally non-blocking. So
> that is unlikely to fly.

If it helps to settle this part of the discussion I happily volunteer
to fix the V4L2 side to wait for the fences without the need for a
synchronous wait in qbuf.

> Small note, stateless video decoders don't have this issue. The
> bitstream is validated by userspace, and userspace controls the
> "decode" operation. This one would be a good case for bidirectional
> fencing.
> 
> > > I must admit that V4L is a bit of an odd case since the kernel driver
> > > is the producer and not the consumer.
> > 
> > Note that V4L2 can be a consumer too. Video output with V4L2 is less
> > frequent than video capture (but it still exists), and codecs and other
> > memory-to-memory processing devices (colorspace converters, scalers,
> > ...) are both consumers and producers.
> > 
> > > > In the normal case buffers are processed in sequence, but if
> > > > an error occurs during capture, they can be recycled internally and put
> > > > to the back of the queue.
> > > 
> > > Are those errors something that can happen at any time in the middle
> > > of a frame capture?  If so, that does make things stickier.
> > 
> > Yes it can. Think of packet loss when capturing from a USB webcam for
> > instance. 
> > 
> > > > Unless I'm mistaken, this problem also exists
> > > > with stateful codecs. And if you don't know in advance which buffer you
> > > > will receive from the device, the usefulness of fences becomes very
> > > > questionable :-)
> > > 
> > > Yeah, if you really are in a situation where there's no way to know
> > > until the full frame capture has been completed which buffer is next,
> > > then fences are useless.  You aren't in an implicit synchronization
> > > setting either; you're in a "full flush" setting.  It's arguably worse
> > > for performance but perhaps unavoidable?
> > 
> > Probably unavoidable in some cases, but nothing that should get in the
> > way for the discussion at hand: there's no need to migrate away from
> > implicit sync when there's implicit sync in the first place :-)
> > 
> > I think we need to analyse the use cases here, and figure out at least
> > guidelines for userspace, otherwise applications will wonder what
> > behaviour to implement, and we'll end up with a wide variety of them.
> > Even just on the kernel side, some V4L2 capture driver will pass
> > erroneous frames to userspace (thus guaranteeing ordering, but without
> > early notification of errors), some will require the frame
> > automatically, and at least one (uvcvideo) has a module parameter to
> > pick the desired behaviour.
> 
> Also, from a userspace point of view, the synchronization with the
> "next frame" in V4L2 isn't implicit. We can poll() the device, just
> like we'd do with a fence FD. What the explicit fence gives, is a
> unified object we can pass to another driver, or other userspace, so we
> can delegate the wait.
> 
> You refer to performance in few places. In streaming, this is often
> measure as real-time throughput. Implicit/explicit fences don't really
> play any role for us in this regard. V4L2 drivers, like m2m drivers,
> works with buffer queues. So you can queue in advance many buffers on
> the OUTPUT device side (which is the input of the m2m), and userspace
> will queue in advance pretty much all free buffers available on the
> CAPTURE side. The driver is never starved in that model, at the cost of
> very large memory consumption of course. Maybe a more visual
> representation would be:
> 
>   [pending job] -> [M2M Worker] -> [pending results]
> 
> So as long as userspace keep the pending job queue non-empty, and that 
> it consumes and give back buffers back to write the results into, the
> driver will keep running un-interrupted. Performance remains optimal.
> What isn't optimal is the latency. And what bugs right now is when a
> DMAbuf implicit out fence is put back into the pending results queue,
> since the fence is ignored.

> > > Trying to understand. :-)
> > 
> > So am I :-)
> 
> Hehe, same here.

V4L2 just has no notion of something being done asynchronously, which
would require fence. The current protocol is that you only queue
buffers into the kernel when they are idle and can be consumed by the
HW, so there is no need to wait for anything. This requirement is hard
to meet with buffers that are shared with DRM today, as all DRM
userspace relies on the kernel attached fences to be respected until
explicitly told otherwise.

Also V4L2 only allows to dequeue buffers from the kernel into
userspace, which are done from the HW perspective. So the V4L2
userspace interface already has an implicit CPU sync on the buffer.

Regards,
Lucas


