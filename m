Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FAF188937
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 16:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgCQPdI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 11:33:08 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]:42544 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgCQPdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 11:33:08 -0400
Received: by mail-qk1-f173.google.com with SMTP id e11so33110696qkg.9
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bPcYx2rdGR+ol8FL3w87POUGiq/fvmUV+IZg4sqGG0E=;
        b=1jRi95zMA3vkdh+b9w4qLCCj3Hk7Ngd7AQKEWfgtXY817tozJKp/IXTdYB1XiSDYJA
         tcPsFNs6Efuc4fjrLxQpnqauis1mA8UOmg8eNYuwSjiut+PYtyIaaaWYisnnxYbvo8P4
         Y6U08SpkJWNNfOy5icSKkJpHoIYQWaLUUv7Ye1QLITEyAxSf5VyP1hvFEpeDWagssH6F
         l3dCUeuJOwSG9toLF7Jn0HBWwIsv6Iwm8IvHqJp7oEab2fNmiL0Ce3BKY70DwcFYz20G
         xOBWrdLBy72ycrClu6S5PGF11OuMn/+e8V2rq57n/iNOYESzyihBNRjr5fJ+6JOprG5L
         sm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bPcYx2rdGR+ol8FL3w87POUGiq/fvmUV+IZg4sqGG0E=;
        b=rMzClvXb77m1bR9wyYfJdGeSGLmH33x5RRl49RKc2b6DwgzZDwTnL0RMpIEXgFK6Qs
         xW8kztfU2jOGkfWLRqTmFCHFkLIyT//KFr30GSwvr6tvNkq3wAFbm4AdgggKiuPEt+9F
         7Dii+QN4I+/ipcWV+e9mElbrB3rmqo+7oV422nG22gW5braDPvi6vkZBi4T/4YfbjtDN
         YBsiQBGUAvTd8d4Xdbz6swt1PUabMI0g+15RiezWdzqEYlF9523tWsq1JFxSJLYpAeUi
         smm3bl6B2FnTRPb3685E2hV8Mds6GAkzXMx/HLqIb6ojA1mOKLLd4fk4uB25RuKRr9G+
         eZEw==
X-Gm-Message-State: ANhLgQ0+Qpr0Nnev63HXJyEDpUmT6h9ZWw7JNvUjncp3IQ4D4T0+6k1k
        HLHVeZFuAb4cjr8IO94T9aQXCw==
X-Google-Smtp-Source: ADFU+vss//9tdFlQdztUzgeL0cib/SpTsudGzFY5PztQL6UlCy3gyKTDzk2wOB/AdS1ywy0EqOzCEA==
X-Received: by 2002:a05:620a:529:: with SMTP id h9mr5669144qkh.142.1584459185147;
        Tue, 17 Mar 2020 08:33:05 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id x1sm2103927qkl.128.2020.03.17.08.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 08:33:04 -0700 (PDT)
Message-ID: <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jason Ekstrand <jason@jlekstrand.net>
Cc:     ML mesa-dev <mesa-dev@lists.freedesktop.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>,
        "wayland-devel @ lists . freedesktop . org" 
        <wayland-devel@lists.freedesktop.org>,
        xorg-devel <xorg-devel@lists.x.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-media@vger.kernel.org,
        Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Daniel Stone <daniel@fooishbar.org>
Date:   Tue, 17 Mar 2020 11:33:02 -0400
In-Reply-To: <20200316211502.GW4732@pendragon.ideasonboard.com>
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
         <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
         <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
         <20200316102034.GA30883@pendragon.ideasonboard.com>
         <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
         <20200316211502.GW4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 16 mars 2020 à 23:15 +0200, Laurent Pinchart a écrit :
> Hi Jason,
> 
> On Mon, Mar 16, 2020 at 10:06:07AM -0500, Jason Ekstrand wrote:
> > On Mon, Mar 16, 2020 at 5:20 AM Laurent Pinchart wrote:
> > > On Wed, Mar 11, 2020 at 04:18:55PM -0400, Nicolas Dufresne wrote:
> > > > (I know I'm going to be spammed by so many mailing list ...)
> > > > 
> > > > Le mercredi 11 mars 2020 à 14:21 -0500, Jason Ekstrand a écrit :
> > > > > On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > All,
> > > > > > 
> > > > > > Sorry for casting such a broad net with this one. I'm sure most people
> > > > > > who reply will get at least one mailing list rejection.  However, this
> > > > > > is an issue that affects a LOT of components and that's why it's
> > > > > > thorny to begin with.  Please pardon the length of this e-mail as
> > > > > > well; I promise there's a concrete point/proposal at the end.
> > > > > > 
> > > > > > 
> > > > > > Explicit synchronization is the future of graphics and media.  At
> > > > > > least, that seems to be the consensus among all the graphics people
> > > > > > I've talked to.  I had a chat with one of the lead Android graphics
> > > > > > engineers recently who told me that doing explicit sync from the start
> > > > > > was one of the best engineering decisions Android ever made.  It's
> > > > > > also the direction being taken by more modern APIs such as Vulkan.
> > > > > > 
> > > > > > 
> > > > > > ## What are implicit and explicit synchronization?
> > > > > > 
> > > > > > For those that aren't familiar with this space, GPUs, media encoders,
> > > > > > etc. are massively parallel and synchronization of some form is
> > > > > > required to ensure that everything happens in the right order and
> > > > > > avoid data races.  Implicit synchronization is when bits of work (3D,
> > > > > > compute, video encode, etc.) are implicitly based on the absolute
> > > > > > CPU-time order in which API calls occur.  Explicit synchronization is
> > > > > > when the client (whatever that means in any given context) provides
> > > > > > the dependency graph explicitly via some sort of synchronization
> > > > > > primitives.  If you're still confused, consider the following
> > > > > > examples:
> > > > > > 
> > > > > > With OpenGL and EGL, almost everything is implicit sync.  Say you have
> > > > > > two OpenGL contexts sharing an image where one writes to it and the
> > > > > > other textures from it.  The way the OpenGL spec works, the client has
> > > > > > to make the API calls to render to the image before (in CPU time) it
> > > > > > makes the API calls which texture from the image.  As long as it does
> > > > > > this (and maybe inserts a glFlush?), the driver will ensure that the
> > > > > > rendering completes before the texturing happens and you get correct
> > > > > > contents.
> > > > > > 
> > > > > > Implicit synchronization can also happen across processes.  Wayland,
> > > > > > for instance, is currently built on implicit sync where the client
> > > > > > does their rendering and then does a hand-off (via wl_surface::commit)
> > > > > > to tell the compositor it's done at which point the compositor can now
> > > > > > texture from the surface.  The hand-off ensures that the client's
> > > > > > OpenGL API calls happen before the server's OpenGL API calls.
> > > > > > 
> > > > > > A good example of explicit synchronization is the Vulkan API.  There,
> > > > > > a client (or multiple clients) can simultaneously build command
> > > > > > buffers in different threads where one of those command buffers
> > > > > > renders to an image and the other textures from it and then submit
> > > > > > both of them at the same time with instructions to the driver for
> > > > > > which order to execute them in.  The execution order is described via
> > > > > > the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> > > > > > extension, you can even submit the work which does the texturing
> > > > > > BEFORE the work which does the rendering and the driver will sort it
> > > > > > out.
> > > > > > 
> > > > > > The #1 problem with implicit synchronization (which explicit solves)
> > > > > > is that it leads to a lot of over-synchronization both in client space
> > > > > > and in driver/device space.  The client has to synchronize a lot more
> > > > > > because it has to ensure that the API calls happen in a particular
> > > > > > order.  The driver/device have to synchronize a lot more because they
> > > > > > never know what is going to end up being a synchronization point as an
> > > > > > API call on another thread/process may occur at any time.  As we move
> > > > > > to more and more multi-threaded programming this synchronization (on
> > > > > > the client-side especially) becomes more and more painful.
> > > > > > 
> > > > > > 
> > > > > > ## Current status in Linux
> > > > > > 
> > > > > > Implicit synchronization in Linux works via a the kernel's internal
> > > > > > dma_buf and dma_fence data structures.  A dma_fence is a tiny object
> > > > > > which represents the "done" status for some bit of work.  Typically,
> > > > > > dma_fences are created as a by-product of someone submitting some bit
> > > > > > of work (say, 3D rendering) to the kernel.  The dma_buf object has a
> > > > > > set of dma_fences on it representing shared (read) and exclusive
> > > > > > (write) access to the object.  When work is submitted which, for
> > > > > > instance renders to the dma_buf, it's queued waiting on all the fences
> > > > > > on the dma_buf and and a dma_fence is created representing the end of
> > > > > > said rendering work and it's installed as the dma_buf's exclusive
> > > > > > fence.  This way, the kernel can manage all its internal queues (3D
> > > > > > rendering, display, video encode, etc.) and know which things to
> > > > > > submit in what order.
> > > > > > 
> > > > > > For the last few years, we've had sync_file in the kernel and it's
> > > > > > plumbed into some drivers.  A sync_file is just a wrapper around a
> > > > > > single dma_fence.  A sync_file is typically created as a by-product of
> > > > > > submitting work (3D, compute, etc.) to the kernel and is signaled when
> > > > > > that work completes.  When a sync_file is created, it is guaranteed by
> > > > > > the kernel that it will become signaled in finite time and, once it's
> > > > > > signaled, it remains signaled for the rest of time.  A sync_file is
> > > > > > represented in UAPIs as a file descriptor and can be used with normal
> > > > > > file APIs such as dup().  It can be passed into another UAPI which
> > > > > > does some bit of queue'd work and the submitted work will wait for the
> > > > > > sync_file to be triggered before executing.  A sync_file also supports
> > > > > > poll() if  you want to wait on it manually.
> > > > > > 
> > > > > > Unfortunately, sync_file is not broadly used and not all kernel GPU
> > > > > > drivers support it.  Here's a very quick overview of my understanding
> > > > > > of the status of various components (I don't know the status of
> > > > > > anything in the media world):
> > > > > > 
> > > > > >  - Vulkan: Explicit synchronization all the way but we have to go
> > > > > > implicit as soon as we interact with a window-system.  Vulkan has APIs
> > > > > > to import/export sync_files to/from it's VkSemaphore and VkFence
> > > > > > synchronization primitives.
> > > > > >  - OpenGL: Implicit all the way.  There are some EGL extensions to
> > > > > > enable some forms of explicit sync via sync_file but OpenGL itself is
> > > > > > still implicit.
> > > > > >  - Wayland: Currently depends on implicit sync in the kernel (accessed
> > > > > > via EGL/OpenGL).  There is an unstable extension to allow passing
> > > > > > sync_files around but it's questionable how useful it is right now
> > > > > > (more on that later).
> > > > > >  - X11: With present, it has these "explicit" fence objects but
> > > > > > they're always a shmfence which lets the X server and client do a
> > > > > > userspace CPU-side hand-off without going over the socket (and
> > > > > > round-tripping through the kernel).  However, the only thing that
> > > > > > fence does is order the OpenGL API calls in the client and server and
> > > > > > the real synchronization is still implicit.
> > > > > >  - linux/i915/gem: Fully supports using sync_file or syncobj for explicit
> > > > > > sync.
> > > > > >  - linux/amdgpu: Supports sync_file and syncobj but it still
> > > > > > implicitly syncs sometimes due to it's internal memory residency
> > > > > > handling which can lead to over-synchronization.
> > > > > >  - KMS: Implicit sync all the way.  There are no KMS APIs which take
> > > > > > explicit sync primitives.
> > > > > 
> > > > > Correction:  Apparently, I missed some things.  If you use atomic, KMS
> > > > > does have explicit in- and out-fences.  Non-atomic users (e.g. X11)
> > > > > are still in trouble but most Wayland compositors use atomic these
> > > > > days
> > > > > 
> > > > > >  - v4l: ???
> > > > > >  - gstreamer: ???
> > > > > >  - Media APIs such as vaapi etc.:  ???
> > > > 
> > > > GStreamer is consumer for V4L2, VAAPI and other stuff. Using asynchronous buffer
> > > > synchronisation is something we do already with GL (even if limited). We place
> > > > GLSync object in the pipeline and attach that on related GstBuffer. We wait on
> > > > these GLSync as late as possible (or superseed the sync if we queue more work
> > > > into the same GL context). That requires a special mode of operation of course.
> > > > We don't usually like making lazy blocking call implicit, as it tends to cause
> > > > random issues. If we need to wait, we think it's better to wait int he module
> > > > that is responsible, so in general, we try to negotiate and fallback locally
> > > > (it's plugin base, so this can be really messy otherwise).
> > > > 
> > > > So basically this problem needs to be solved in V4L2, VAAPI and other lower
> > > > level APIs first. We need API that provides us these fence (in or out), and then
> > > > we can consider using them. For V4L2, there was an attempt, but it was a bit of
> > > > a miss-fit. Your proposal could work, need to be tested I guess, but it does not
> > > > solve some of other issues that was discussed. Notably for camera capture, were
> > > > the HW timestamp is capture about at the same time the frame is ready. But the
> > > > timestamp is not part of the paylaod, so you need an entire API asynchronously
> > > > deliver that metadata. It's the biggest pain point I've found, such an API would
> > > > be quite invasive or if made really generic, might just never be adopted widely
> > > > enough.
> > > 
> > > Another issue is that V4L2 doesn't offer any guarantee on job ordering.
> > > When you queue multiple buffers for camera capture for instance, you
> > > don't know until capture complete in which buffer the frame has been
> > > captured.
> > 
> > Is this a Kernel UAPI issue?  Surely the kernel driver knows at the
> > start of frame capture which buffer it's getting written into.  I
> > would think that the kernel APIs could be adjusted (if we find good
> > reason to do so!) such that they return earlier and return a (buffer,
> > fence) pair.  Am I missing something fundamental about video here?
> 
> For cameras I believe we could do that, yes. I was pointing out the
> issues caused by the current API. For video decoders I'll let Nicolas
> answer the question, he's way more knowledgeable that I am on that
> topic.

Right now, there is simply no uAPI for supporting asynchronous errors
reporting when fences are invovled. That is true for both camera's and
CODEC. It's likely what all the attempt was missing, I don't know
enough myself to suggest something.

Now, why Stateless video decoders are special is another subject. In
CODECs, the decoding and the presentation order may differ. For
Stateless kind of CODEC, a bitstream is passed to the HW. We don't know
if this bitstream is fully valid, since the it is being parsed and
validated by the firmware. It's also firmware job to decide which
buffer should be presented first.

In most firmware interface, that information is communicated back all
at once when the frame is ready to be presented (which may be quite
some time after it was decoded). So indeed, a fence model is not really
easy to add, unless the firmware was designed with that model in mind.

Nothing of course would prevent V4L2 framework to generically handle
out_fence from other producers. It does not even handle implicit fences
at the moment, which is already quite problematic (I've seen glitches
on i.MX6/8 and Raspberry Pi 4).

In that specific case, if the fences from etnaviv, vc graphic drivers
was exposed, we could solve this issue in userspace. Right now it's
implicit, so we rely on all DMABuf driver to have proper support, which
is not the case. There is V4L2 support for that coming, but the wait is
done synchronously in userspace call that was normally non-blocking. So
that is unlikely to fly.

Small note, stateless video decoders don't have this issue. The
bitstream is validated by userspace, and userspace controls the
"decode" operation. This one would be a good case for bidirectional
fencing.

> 
> > I must admit that V4L is a bit of an odd case since the kernel driver
> > is the producer and not the consumer.
> 
> Note that V4L2 can be a consumer too. Video output with V4L2 is less
> frequent than video capture (but it still exists), and codecs and other
> memory-to-memory processing devices (colorspace converters, scalers,
> ...) are both consumers and producers.
> 
> > > In the normal case buffers are processed in sequence, but if
> > > an error occurs during capture, they can be recycled internally and put
> > > to the back of the queue.
> > 
> > Are those errors something that can happen at any time in the middle
> > of a frame capture?  If so, that does make things stickier.
> 
> Yes it can. Think of packet loss when capturing from a USB webcam for
> instance. 
> 
> > > Unless I'm mistaken, this problem also exists
> > > with stateful codecs. And if you don't know in advance which buffer you
> > > will receive from the device, the usefulness of fences becomes very
> > > questionable :-)
> > 
> > Yeah, if you really are in a situation where there's no way to know
> > until the full frame capture has been completed which buffer is next,
> > then fences are useless.  You aren't in an implicit synchronization
> > setting either; you're in a "full flush" setting.  It's arguably worse
> > for performance but perhaps unavoidable?
> 
> Probably unavoidable in some cases, but nothing that should get in the
> way for the discussion at hand: there's no need to migrate away from
> implicit sync when there's implicit sync in the first place :-)
> 
> I think we need to analyse the use cases here, and figure out at least
> guidelines for userspace, otherwise applications will wonder what
> behaviour to implement, and we'll end up with a wide variety of them.
> Even just on the kernel side, some V4L2 capture driver will pass
> erroneous frames to userspace (thus guaranteeing ordering, but without
> early notification of errors), some will require the frame
> automatically, and at least one (uvcvideo) has a module parameter to
> pick the desired behaviour.

Also, from a userspace point of view, the synchronization with the
"next frame" in V4L2 isn't implicit. We can poll() the device, just
like we'd do with a fence FD. What the explicit fence gives, is a
unified object we can pass to another driver, or other userspace, so we
can delegate the wait.

You refer to performance in few places. In streaming, this is often
measure as real-time throughput. Implicit/explicit fences don't really
play any role for us in this regard. V4L2 drivers, like m2m drivers,
works with buffer queues. So you can queue in advance many buffers on
the OUTPUT device side (which is the input of the m2m), and userspace
will queue in advance pretty much all free buffers available on the
CAPTURE side. The driver is never starved in that model, at the cost of
very large memory consumption of course. Maybe a more visual
representation would be:

  [pending job] -> [M2M Worker] -> [pending results]

So as long as userspace keep the pending job queue non-empty, and that 
it consumes and give back buffers back to write the results into, the
driver will keep running un-interrupted. Performance remains optimal.
What isn't optimal is the latency. And what bugs right now is when a
DMAbuf implicit out fence is put back into the pending results queue,
since the fence is ignored.

> 
> > Trying to understand. :-)
> 
> So am I :-)

Hehe, same here.

> 
> > > > There is other elements that would implement fencing, notably kmssink, but no
> > > > one actually dared porting it to atomic KMS, so clearly there is very little
> > > > comunity interest. glimagsink could clearly benifit. Right now if we import a
> > > > DMABuf, and that this DMAbuf is used for render, a implicit fence is attached,
> > > > which we are unaware. Philippe Zabbel is working on a patch, so V4L2 QBUF would
> > > > wait, but waiting in QBUF is not allowed if O_NONBLOCK was set (which GStreamer
> > > > uses), so then the operation will just fail where it worked before (breaking
> > > > userspace). If it was an explcit fence, we could handle that in GStreamer
> > > > cleanly as we do for new APIs.
> > > > 
> > > > > > ## Chicken and egg problems
> > > > > > 
> > > > > > Ok, this is where it starts getting depressing.  I made the claim
> > > > > > above that Wayland has an explicit synchronization protocol that's of
> > > > > > questionable usefulness.  I would claim that basically any bit of
> > > > > > plumbing we do through window systems is currently of questionable
> > > > > > usefulness.  Why?
> > > > > > 
> > > > > > From my perspective, as a Vulkan driver developer, I have to deal with
> > > > > > the fact that Vulkan is an explicit sync API but Wayland and X11
> > > > > > aren't.  Unfortunately, the Wayland extension solves zero problems for
> > > > > > me because I can't really use it unless it's implemented in all of the
> > > > > > compositors.  Until every Wayland compositor I care about my users
> > > > > > being able to use (which is basically all of them) supports the
> > > > > > extension, I have to continue carry around my pile of hacks to keep
> > > > > > implicit sync and Vulkan working nicely together.
> > > > > > 
> > > > > > From the perspective of a Wayland compositor (I used to play in this
> > > > > > space), they'd love to implement the new explicit sync extension but
> > > > > > can't.  Sure, they could wire up the extension, but the moment they go
> > > > > > to flip a client buffer to the screen directly, they discover that KMS
> > > > > > doesn't support any explicit sync APIs.
> > > > > 
> > > > > As per the above correction, Wayland compositors aren't nearly as bad
> > > > > off as I initially thought.  There may still be weird screen capture
> > > > > cases but the normal cases of compositing and displaying via
> > > > > KMS/atomic should be in reasonably good shape.
> > > > > 
> > > > > > So, yes, they can technically
> > > > > > implement the extension assuming the EGL stack they're running on has
> > > > > > the sync_file extensions but any client buffers which come in using
> > > > > > the explicit sync Wayland extension have to be composited and can't be
> > > > > > scanned out directly.  As a 3D driver developer, I absolutely don't
> > > > > > want compositors doing that because my users will complain about
> > > > > > performance issues due to the extra blit.
> > > > > > 
> > > > > > Ok, so let's say we get KMS wired up with implicit sync.  That solves
> > > > > > all our problems, right?  It does, right up until someone decides that
> > > > > > they wan to screen capture their Wayland session via some hardware
> > > > > > media encoder that doesn't support explicit sync.  Now we have to
> > > > > > plumb it all the way through the media stack, gstreamer, etc.  Great,
> > > > > > so let's do that!  Oh, but gstreamer won't want to plumb it through
> > > > > > until they're guaranteed that they can use explicit sync when
> > > > > > displaying on X11 or Wayland.  Are you seeing the problem?
> > > > > > 
> > > > > > To make matters worse, since most things are doing implicit
> > > > > > synchronization today, it's really easy to get your explicit
> > > > > > synchronization wrong and never notice.  If you forget to pass a
> > > > > > sync_file into one place (say you never notice KMS doesn't support
> > > > > > them), it will probably work anyway thanks to all the implicit sync
> > > > > > that's going on elsewhere.
> > > > > > 
> > > > > > So, clearly, we all need to go write piles of code that we can't
> > > > > > actually properly test until everyone else has written their piece and
> > > > > > then we use explicit sync if and only if all components support it.
> > > > > > Really?  We're going to do multiple years of development and then just
> > > > > > hope it works when we finally flip the switch?  That doesn't sound
> > > > > > like a good plan to me.
> > > > > > 
> > > > > > 
> > > > > > ## A proposal: Implicit and explicit sync together
> > > > > > 
> > > > > > How to solve all these chicken-and-egg problems is something I've been
> > > > > > giving quite a bit of thought (and talking with many others about) in
> > > > > > the last couple of years.  One motivation for this is that we have to
> > > > > > deal with a mismatch in Vulkan.  Another motivation is that I'm
> > > > > > becoming increasingly unhappy with the way that synchronization,
> > > > > > memory residency, and command submission are inherently intertwined in
> > > > > > i915 and would like to break things apart.  Towards that end, I have
> > > > > > an actual proposal.
> > > > > > 
> > > > > > A couple weeks ago, I sent a series of patches to the dri-devel
> > > > > > mailing list which adds a pair of new ioctls to dma-buf which allow
> > > > > > userspace to manually import or export a sync_file from a dma-buf.
> > > > > > The idea is that something like a Wayland compositor can switch to
> > > > > > 100% explicit sync internally once the ioctl is available.  If it gets
> > > > > > buffers in from a client that doesn't use the explicit sync extension,
> > > > > > it can pull a sync_file from the dma-buf and use that exactly as it
> > > > > > would a sync_file passed via the explicit sync extension.  When it
> > > > > > goes to scan out a user buffer and discovers that KMS doesn't accept
> > > > > > sync_files (or if it tries to use that pesky media encoder no one has
> > > > > > converted), it can take it's sync_file for display and stuff it into
> > > > > > the dma-buf before handing it to KMS.
> > > > > > 
> > > > > > Along with the kernel patches, I've also implemented support for this
> > > > > > in the Vulkan WSI code used by ANV and RADV.  With those patches, the
> > > > > > only requirement on the Vulkan drivers is that you be able to export
> > > > > > any VkSemaphore as a sync_file and temporarily import a sync_file into
> > > > > > any VkFence or VkSemaphore.  As long as that works, the core Vulkan
> > > > > > driver only ever sees explicit synchronization via sync_file.  The WSI
> > > > > > code uses these new ioctls to translate the implicit sync of X11 and
> > > > > > Wayland to the explicit sync the Vulkan driver wants.
> > > > > > 
> > > > > > I'm hoping (and here's where I want a sanity check) that a simple API
> > > > > > like this will allow us to finally start moving the Linux ecosystem
> > > > > > over to explicit synchronization one piece at a time in a way that's
> > > > > > actually correct.  (No Wayland explicit sync with compositors hoping
> > > > > > KMS magically works even though it doesn't have a sync_file API.)
> > > > > > Once some pieces in the ecosystem start moving, there will be
> > > > > > motivation to start moving others and maybe we can actually build the
> > > > > > momentum to get most everything converted.
> > > > > > 
> > > > > > For reference, you can find the kernel RFC patches and mesa MR here:
> > > > > > 
> > > > > > https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html
> > > > > > 
> > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> > > > > > 
> > > > > > At this point, I welcome your thoughts, comments, objections, and
> > > > > > maybe even help/review. :-)

