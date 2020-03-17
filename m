Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DEB4188A38
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 17:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgCQQ1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 12:27:46 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:32828 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgCQQ1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 12:27:45 -0400
Received: by mail-ed1-f67.google.com with SMTP id z65so27368592ede.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2020 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HUPKV4+Kf144UdNKQ8Y+ieLIvEnWEqNaxzcD43nihv8=;
        b=Edxk/Ot4V5Z1ROGGMfj2YII8Z2rlBeuPVgy9li2X0pfzyH+ie9lW2cDfxEIQ8rHABo
         XW7YcmTrEmCCzWYYcqcpc73KAkey8BbgwUSJXjQC5gpiSh+KRKDJWg6OpSGpnJS7Ue8Q
         UqqztpILNtTwloPLARUrGl0Rtd4obJElkdtqwuE8TEZ/CPMRwP9c5fmDPr2eCuP10Hua
         R4sP8Q+Om6oPkPJPIqxvkYmx+/WNZIoKhZ4POcxx+VUT6o1YHLbkkWrLYiZLaajzPqKV
         2UszuznL1n665dOOuzKx/QqHCh7RP6r/gdXI3JQ13CHecKfix8KwUqqSbk5Yqik1a9bP
         4AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HUPKV4+Kf144UdNKQ8Y+ieLIvEnWEqNaxzcD43nihv8=;
        b=HTfOqDig68mERASJD0BKNRlLwhugSHex8OnkwKpJeeKV9VfsDumyfO4fGBabRAH2DE
         NWTKzYQM9X82mXSSjOtSYmO/B3RntePkY7pFkQPN/xMsyCLU2OFuFg+77LOZ8iDPyxkv
         5MRNo5qbnkhXU+yMe2qZ9f/HsDSr88b8LTc/owh3n/h5NLXKme7/riQOqJXCXrxmUXzm
         jpU9eyX5kE6IUGwqIop4qM82Rv2P3uFZqmp/W+WOjBunhsQObnY64dA7rThWbnC9NnR1
         hiZc3s/E0AU4nUztpAycqi5RYvWKHJqAIFKASyvze3CBV/InAWrbs0QbuetV12Hrgiii
         2KIg==
X-Gm-Message-State: ANhLgQ1YBP8PXdRR49mEyR8hsiCt1/4FCilOjauWxCn6OhFhQ+CzxDrv
        2gdzVKxsQ04t56ilEhs8DtDMl50clxMRH1hdK5WrFA==
X-Google-Smtp-Source: ADFU+vuMJstDHOULQ8NlqVA4Il/Q63VfxnL0J+Gx8d/Vox0fO7jCI1JleOmVZop2UI/d1Jinv9U8J8/ke20jn/0ERPs=
X-Received: by 2002:aa7:d585:: with SMTP id r5mr5883302edq.241.1584462459917;
 Tue, 17 Mar 2020 09:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com> <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
In-Reply-To: <74477a20fa78758dd6cf8c32d7a77d1cccf2646f.camel@ndufresne.ca>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Tue, 17 Mar 2020 11:27:28 -0500
Message-ID: <CAOFGe963WUB+rkA=FURuXEk6BVjsP18yk4sJ3y_7VxKmscShrA@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML mesa-dev <mesa-dev@lists.freedesktop.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 17, 2020 at 10:33 AM Nicolas Dufresne <nicolas@ndufresne.ca> wr=
ote:
>
> Le lundi 16 mars 2020 =C3=A0 23:15 +0200, Laurent Pinchart a =C3=A9crit :
> > Hi Jason,
> >
> > On Mon, Mar 16, 2020 at 10:06:07AM -0500, Jason Ekstrand wrote:
> > > On Mon, Mar 16, 2020 at 5:20 AM Laurent Pinchart wrote:
> > > > On Wed, Mar 11, 2020 at 04:18:55PM -0400, Nicolas Dufresne wrote:
> > > > > (I know I'm going to be spammed by so many mailing list ...)
> > > > >
> > > > > Le mercredi 11 mars 2020 =C3=A0 14:21 -0500, Jason Ekstrand a =C3=
=A9crit :
> > > > > > On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstra=
nd.net> wrote:
> > > > > > > All,
> > > > > > >
> > > > > > > Sorry for casting such a broad net with this one. I'm sure mo=
st people
> > > > > > > who reply will get at least one mailing list rejection.  Howe=
ver, this
> > > > > > > is an issue that affects a LOT of components and that's why i=
t's
> > > > > > > thorny to begin with.  Please pardon the length of this e-mai=
l as
> > > > > > > well; I promise there's a concrete point/proposal at the end.
> > > > > > >
> > > > > > >
> > > > > > > Explicit synchronization is the future of graphics and media.=
  At
> > > > > > > least, that seems to be the consensus among all the graphics =
people
> > > > > > > I've talked to.  I had a chat with one of the lead Android gr=
aphics
> > > > > > > engineers recently who told me that doing explicit sync from =
the start
> > > > > > > was one of the best engineering decisions Android ever made. =
 It's
> > > > > > > also the direction being taken by more modern APIs such as Vu=
lkan.
> > > > > > >
> > > > > > >
> > > > > > > ## What are implicit and explicit synchronization?
> > > > > > >
> > > > > > > For those that aren't familiar with this space, GPUs, media e=
ncoders,
> > > > > > > etc. are massively parallel and synchronization of some form =
is
> > > > > > > required to ensure that everything happens in the right order=
 and
> > > > > > > avoid data races.  Implicit synchronization is when bits of w=
ork (3D,
> > > > > > > compute, video encode, etc.) are implicitly based on the abso=
lute
> > > > > > > CPU-time order in which API calls occur.  Explicit synchroniz=
ation is
> > > > > > > when the client (whatever that means in any given context) pr=
ovides
> > > > > > > the dependency graph explicitly via some sort of synchronizat=
ion
> > > > > > > primitives.  If you're still confused, consider the following
> > > > > > > examples:
> > > > > > >
> > > > > > > With OpenGL and EGL, almost everything is implicit sync.  Say=
 you have
> > > > > > > two OpenGL contexts sharing an image where one writes to it a=
nd the
> > > > > > > other textures from it.  The way the OpenGL spec works, the c=
lient has
> > > > > > > to make the API calls to render to the image before (in CPU t=
ime) it
> > > > > > > makes the API calls which texture from the image.  As long as=
 it does
> > > > > > > this (and maybe inserts a glFlush?), the driver will ensure t=
hat the
> > > > > > > rendering completes before the texturing happens and you get =
correct
> > > > > > > contents.
> > > > > > >
> > > > > > > Implicit synchronization can also happen across processes.  W=
ayland,
> > > > > > > for instance, is currently built on implicit sync where the c=
lient
> > > > > > > does their rendering and then does a hand-off (via wl_surface=
::commit)
> > > > > > > to tell the compositor it's done at which point the composito=
r can now
> > > > > > > texture from the surface.  The hand-off ensures that the clie=
nt's
> > > > > > > OpenGL API calls happen before the server's OpenGL API calls.
> > > > > > >
> > > > > > > A good example of explicit synchronization is the Vulkan API.=
  There,
> > > > > > > a client (or multiple clients) can simultaneously build comma=
nd
> > > > > > > buffers in different threads where one of those command buffe=
rs
> > > > > > > renders to an image and the other textures from it and then s=
ubmit
> > > > > > > both of them at the same time with instructions to the driver=
 for
> > > > > > > which order to execute them in.  The execution order is descr=
ibed via
> > > > > > > the VkSemaphore primitive.  With the new VK_KHR_timeline_sema=
phore
> > > > > > > extension, you can even submit the work which does the textur=
ing
> > > > > > > BEFORE the work which does the rendering and the driver will =
sort it
> > > > > > > out.
> > > > > > >
> > > > > > > The #1 problem with implicit synchronization (which explicit =
solves)
> > > > > > > is that it leads to a lot of over-synchronization both in cli=
ent space
> > > > > > > and in driver/device space.  The client has to synchronize a =
lot more
> > > > > > > because it has to ensure that the API calls happen in a parti=
cular
> > > > > > > order.  The driver/device have to synchronize a lot more beca=
use they
> > > > > > > never know what is going to end up being a synchronization po=
int as an
> > > > > > > API call on another thread/process may occur at any time.  As=
 we move
> > > > > > > to more and more multi-threaded programming this synchronizat=
ion (on
> > > > > > > the client-side especially) becomes more and more painful.
> > > > > > >
> > > > > > >
> > > > > > > ## Current status in Linux
> > > > > > >
> > > > > > > Implicit synchronization in Linux works via a the kernel's in=
ternal
> > > > > > > dma_buf and dma_fence data structures.  A dma_fence is a tiny=
 object
> > > > > > > which represents the "done" status for some bit of work.  Typ=
ically,
> > > > > > > dma_fences are created as a by-product of someone submitting =
some bit
> > > > > > > of work (say, 3D rendering) to the kernel.  The dma_buf objec=
t has a
> > > > > > > set of dma_fences on it representing shared (read) and exclus=
ive
> > > > > > > (write) access to the object.  When work is submitted which, =
for
> > > > > > > instance renders to the dma_buf, it's queued waiting on all t=
he fences
> > > > > > > on the dma_buf and and a dma_fence is created representing th=
e end of
> > > > > > > said rendering work and it's installed as the dma_buf's exclu=
sive
> > > > > > > fence.  This way, the kernel can manage all its internal queu=
es (3D
> > > > > > > rendering, display, video encode, etc.) and know which things=
 to
> > > > > > > submit in what order.
> > > > > > >
> > > > > > > For the last few years, we've had sync_file in the kernel and=
 it's
> > > > > > > plumbed into some drivers.  A sync_file is just a wrapper aro=
und a
> > > > > > > single dma_fence.  A sync_file is typically created as a by-p=
roduct of
> > > > > > > submitting work (3D, compute, etc.) to the kernel and is sign=
aled when
> > > > > > > that work completes.  When a sync_file is created, it is guar=
anteed by
> > > > > > > the kernel that it will become signaled in finite time and, o=
nce it's
> > > > > > > signaled, it remains signaled for the rest of time.  A sync_f=
ile is
> > > > > > > represented in UAPIs as a file descriptor and can be used wit=
h normal
> > > > > > > file APIs such as dup().  It can be passed into another UAPI =
which
> > > > > > > does some bit of queue'd work and the submitted work will wai=
t for the
> > > > > > > sync_file to be triggered before executing.  A sync_file also=
 supports
> > > > > > > poll() if  you want to wait on it manually.
> > > > > > >
> > > > > > > Unfortunately, sync_file is not broadly used and not all kern=
el GPU
> > > > > > > drivers support it.  Here's a very quick overview of my under=
standing
> > > > > > > of the status of various components (I don't know the status =
of
> > > > > > > anything in the media world):
> > > > > > >
> > > > > > >  - Vulkan: Explicit synchronization all the way but we have t=
o go
> > > > > > > implicit as soon as we interact with a window-system.  Vulkan=
 has APIs
> > > > > > > to import/export sync_files to/from it's VkSemaphore and VkFe=
nce
> > > > > > > synchronization primitives.
> > > > > > >  - OpenGL: Implicit all the way.  There are some EGL extensio=
ns to
> > > > > > > enable some forms of explicit sync via sync_file but OpenGL i=
tself is
> > > > > > > still implicit.
> > > > > > >  - Wayland: Currently depends on implicit sync in the kernel =
(accessed
> > > > > > > via EGL/OpenGL).  There is an unstable extension to allow pas=
sing
> > > > > > > sync_files around but it's questionable how useful it is righ=
t now
> > > > > > > (more on that later).
> > > > > > >  - X11: With present, it has these "explicit" fence objects b=
ut
> > > > > > > they're always a shmfence which lets the X server and client =
do a
> > > > > > > userspace CPU-side hand-off without going over the socket (an=
d
> > > > > > > round-tripping through the kernel).  However, the only thing =
that
> > > > > > > fence does is order the OpenGL API calls in the client and se=
rver and
> > > > > > > the real synchronization is still implicit.
> > > > > > >  - linux/i915/gem: Fully supports using sync_file or syncobj =
for explicit
> > > > > > > sync.
> > > > > > >  - linux/amdgpu: Supports sync_file and syncobj but it still
> > > > > > > implicitly syncs sometimes due to it's internal memory reside=
ncy
> > > > > > > handling which can lead to over-synchronization.
> > > > > > >  - KMS: Implicit sync all the way.  There are no KMS APIs whi=
ch take
> > > > > > > explicit sync primitives.
> > > > > >
> > > > > > Correction:  Apparently, I missed some things.  If you use atom=
ic, KMS
> > > > > > does have explicit in- and out-fences.  Non-atomic users (e.g. =
X11)
> > > > > > are still in trouble but most Wayland compositors use atomic th=
ese
> > > > > > days
> > > > > >
> > > > > > >  - v4l: ???
> > > > > > >  - gstreamer: ???
> > > > > > >  - Media APIs such as vaapi etc.:  ???
> > > > >
> > > > > GStreamer is consumer for V4L2, VAAPI and other stuff. Using asyn=
chronous buffer
> > > > > synchronisation is something we do already with GL (even if limit=
ed). We place
> > > > > GLSync object in the pipeline and attach that on related GstBuffe=
r. We wait on
> > > > > these GLSync as late as possible (or superseed the sync if we que=
ue more work
> > > > > into the same GL context). That requires a special mode of operat=
ion of course.
> > > > > We don't usually like making lazy blocking call implicit, as it t=
ends to cause
> > > > > random issues. If we need to wait, we think it's better to wait i=
nt he module
> > > > > that is responsible, so in general, we try to negotiate and fallb=
ack locally
> > > > > (it's plugin base, so this can be really messy otherwise).
> > > > >
> > > > > So basically this problem needs to be solved in V4L2, VAAPI and o=
ther lower
> > > > > level APIs first. We need API that provides us these fence (in or=
 out), and then
> > > > > we can consider using them. For V4L2, there was an attempt, but i=
t was a bit of
> > > > > a miss-fit. Your proposal could work, need to be tested I guess, =
but it does not
> > > > > solve some of other issues that was discussed. Notably for camera=
 capture, were
> > > > > the HW timestamp is capture about at the same time the frame is r=
eady. But the
> > > > > timestamp is not part of the paylaod, so you need an entire API a=
synchronously
> > > > > deliver that metadata. It's the biggest pain point I've found, su=
ch an API would
> > > > > be quite invasive or if made really generic, might just never be =
adopted widely
> > > > > enough.
> > > >
> > > > Another issue is that V4L2 doesn't offer any guarantee on job order=
ing.
> > > > When you queue multiple buffers for camera capture for instance, yo=
u
> > > > don't know until capture complete in which buffer the frame has bee=
n
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

Just to be clear, I think we should do whatever makes sense here and
not try to slam sync_file in when it doesn't make sense just because
we have it.  The more I read on this thread, the less out-fences from
video decode sound like they make sense unless we have a really solid
plan for async error reporting.  It's possible, depending on how many
processes are involved in the pipeline, that async error reporting
could help reduce latency a bit if it let the kernel report the error
directly to the last process in the chain.  However, I'm not convinced
the potential for userspace programmer error is worth it..  That said,
I'm happy to leave that up to the actual video experts. (I just do 3D)

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

Yeah... waits in userspace aren't what anyone wants.

> Small note, stateless video decoders don't have this issue. The
> bitstream is validated by userspace, and userspace controls the
> "decode" operation. This one would be a good case for bidirectional
> fencing.

Good to know.

> >
> > > I must admit that V4L is a bit of an odd case since the kernel driver
> > > is the producer and not the consumer.
> >
> > Note that V4L2 can be a consumer too. Video output with V4L2 is less
> > frequent than video capture (but it still exists), and codecs and other
> > memory-to-memory processing devices (colorspace converters, scalers,
> > ...) are both consumers and producers.
> >
> > > > In the normal case buffers are processed in sequence, but if
> > > > an error occurs during capture, they can be recycled internally and=
 put
> > > > to the back of the queue.
> > >
> > > Are those errors something that can happen at any time in the middle
> > > of a frame capture?  If so, that does make things stickier.
> >
> > Yes it can. Think of packet loss when capturing from a USB webcam for
> > instance.
> >
> > > > Unless I'm mistaken, this problem also exists
> > > > with stateful codecs. And if you don't know in advance which buffer=
 you
> > > > will receive from the device, the usefulness of fences becomes very
> > > > questionable :-)
> > >
> > > Yeah, if you really are in a situation where there's no way to know
> > > until the full frame capture has been completed which buffer is next,
> > > then fences are useless.  You aren't in an implicit synchronization
> > > setting either; you're in a "full flush" setting.  It's arguably wors=
e
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

Yes, that makes sense.  In 3D land, we're very concerned about
latency.  Any time anyone has to stall for anything, it's a potential
hitch in someone's game.  Being delayed by a single extra frame can be
problematic; 2-3 frames puts the gamer at a significant disadvantage.
In video, as long as audio and video are in sync and you aren't
dropping frames, no one really cares about latency as long as hitting
the pause button doesn't take too long.

What concerns me the most, I think is actually the interop issues.
You mentioned issues with the raspberry pi.  Right now, if someone is
rendering frames using a Vulkan driver and trying to pass those on to
V4L for encode or to some other api such as VA-API, we don't really
have a plan for synchronization.  Thanks to dma-buf extensions we at
least have most of a plan for sharing the memory and negotiating image
layouts (strides, tiling, etc.) but no plan for synchronization at
all.  The only thing you can do today is to use a VkFence to CPU wait
for the 3D rendering to be 100% done and then pass the image on to the
encoder.

The more I look over the various hacks we've done over the course of
the last 4 years to make window systems work, the less confident I am
that I want to expose ANY of them as an official Vulkan extension that
we support long-term.  The one we do have which I'm reasonably happy
to be stuck with is sync_file import/export.  That said, it's sounding
like V4L doesn't support dma-buf implicit sync at all so maybe CPU
waiting with a VkFence is the current state-of-the-art?

--Jason


> >
> > > Trying to understand. :-)
> >
> > So am I :-)
>
> Hehe, same here.
>
> >
> > > > > There is other elements that would implement fencing, notably kms=
sink, but no
> > > > > one actually dared porting it to atomic KMS, so clearly there is =
very little
> > > > > comunity interest. glimagsink could clearly benifit. Right now if=
 we import a
> > > > > DMABuf, and that this DMAbuf is used for render, a implicit fence=
 is attached,
> > > > > which we are unaware. Philippe Zabbel is working on a patch, so V=
4L2 QBUF would
> > > > > wait, but waiting in QBUF is not allowed if O_NONBLOCK was set (w=
hich GStreamer
> > > > > uses), so then the operation will just fail where it worked befor=
e (breaking
> > > > > userspace). If it was an explcit fence, we could handle that in G=
Streamer
> > > > > cleanly as we do for new APIs.
> > > > >
> > > > > > > ## Chicken and egg problems
> > > > > > >
> > > > > > > Ok, this is where it starts getting depressing.  I made the c=
laim
> > > > > > > above that Wayland has an explicit synchronization protocol t=
hat's of
> > > > > > > questionable usefulness.  I would claim that basically any bi=
t of
> > > > > > > plumbing we do through window systems is currently of questio=
nable
> > > > > > > usefulness.  Why?
> > > > > > >
> > > > > > > From my perspective, as a Vulkan driver developer, I have to =
deal with
> > > > > > > the fact that Vulkan is an explicit sync API but Wayland and =
X11
> > > > > > > aren't.  Unfortunately, the Wayland extension solves zero pro=
blems for
> > > > > > > me because I can't really use it unless it's implemented in a=
ll of the
> > > > > > > compositors.  Until every Wayland compositor I care about my =
users
> > > > > > > being able to use (which is basically all of them) supports t=
he
> > > > > > > extension, I have to continue carry around my pile of hacks t=
o keep
> > > > > > > implicit sync and Vulkan working nicely together.
> > > > > > >
> > > > > > > From the perspective of a Wayland compositor (I used to play =
in this
> > > > > > > space), they'd love to implement the new explicit sync extens=
ion but
> > > > > > > can't.  Sure, they could wire up the extension, but the momen=
t they go
> > > > > > > to flip a client buffer to the screen directly, they discover=
 that KMS
> > > > > > > doesn't support any explicit sync APIs.
> > > > > >
> > > > > > As per the above correction, Wayland compositors aren't nearly =
as bad
> > > > > > off as I initially thought.  There may still be weird screen ca=
pture
> > > > > > cases but the normal cases of compositing and displaying via
> > > > > > KMS/atomic should be in reasonably good shape.
> > > > > >
> > > > > > > So, yes, they can technically
> > > > > > > implement the extension assuming the EGL stack they're runnin=
g on has
> > > > > > > the sync_file extensions but any client buffers which come in=
 using
> > > > > > > the explicit sync Wayland extension have to be composited and=
 can't be
> > > > > > > scanned out directly.  As a 3D driver developer, I absolutely=
 don't
> > > > > > > want compositors doing that because my users will complain ab=
out
> > > > > > > performance issues due to the extra blit.
> > > > > > >
> > > > > > > Ok, so let's say we get KMS wired up with implicit sync.  Tha=
t solves
> > > > > > > all our problems, right?  It does, right up until someone dec=
ides that
> > > > > > > they wan to screen capture their Wayland session via some har=
dware
> > > > > > > media encoder that doesn't support explicit sync.  Now we hav=
e to
> > > > > > > plumb it all the way through the media stack, gstreamer, etc.=
  Great,
> > > > > > > so let's do that!  Oh, but gstreamer won't want to plumb it t=
hrough
> > > > > > > until they're guaranteed that they can use explicit sync when
> > > > > > > displaying on X11 or Wayland.  Are you seeing the problem?
> > > > > > >
> > > > > > > To make matters worse, since most things are doing implicit
> > > > > > > synchronization today, it's really easy to get your explicit
> > > > > > > synchronization wrong and never notice.  If you forget to pas=
s a
> > > > > > > sync_file into one place (say you never notice KMS doesn't su=
pport
> > > > > > > them), it will probably work anyway thanks to all the implici=
t sync
> > > > > > > that's going on elsewhere.
> > > > > > >
> > > > > > > So, clearly, we all need to go write piles of code that we ca=
n't
> > > > > > > actually properly test until everyone else has written their =
piece and
> > > > > > > then we use explicit sync if and only if all components suppo=
rt it.
> > > > > > > Really?  We're going to do multiple years of development and =
then just
> > > > > > > hope it works when we finally flip the switch?  That doesn't =
sound
> > > > > > > like a good plan to me.
> > > > > > >
> > > > > > >
> > > > > > > ## A proposal: Implicit and explicit sync together
> > > > > > >
> > > > > > > How to solve all these chicken-and-egg problems is something =
I've been
> > > > > > > giving quite a bit of thought (and talking with many others a=
bout) in
> > > > > > > the last couple of years.  One motivation for this is that we=
 have to
> > > > > > > deal with a mismatch in Vulkan.  Another motivation is that I=
'm
> > > > > > > becoming increasingly unhappy with the way that synchronizati=
on,
> > > > > > > memory residency, and command submission are inherently inter=
twined in
> > > > > > > i915 and would like to break things apart.  Towards that end,=
 I have
> > > > > > > an actual proposal.
> > > > > > >
> > > > > > > A couple weeks ago, I sent a series of patches to the dri-dev=
el
> > > > > > > mailing list which adds a pair of new ioctls to dma-buf which=
 allow
> > > > > > > userspace to manually import or export a sync_file from a dma=
-buf.
> > > > > > > The idea is that something like a Wayland compositor can swit=
ch to
> > > > > > > 100% explicit sync internally once the ioctl is available.  I=
f it gets
> > > > > > > buffers in from a client that doesn't use the explicit sync e=
xtension,
> > > > > > > it can pull a sync_file from the dma-buf and use that exactly=
 as it
> > > > > > > would a sync_file passed via the explicit sync extension.  Wh=
en it
> > > > > > > goes to scan out a user buffer and discovers that KMS doesn't=
 accept
> > > > > > > sync_files (or if it tries to use that pesky media encoder no=
 one has
> > > > > > > converted), it can take it's sync_file for display and stuff =
it into
> > > > > > > the dma-buf before handing it to KMS.
> > > > > > >
> > > > > > > Along with the kernel patches, I've also implemented support =
for this
> > > > > > > in the Vulkan WSI code used by ANV and RADV.  With those patc=
hes, the
> > > > > > > only requirement on the Vulkan drivers is that you be able to=
 export
> > > > > > > any VkSemaphore as a sync_file and temporarily import a sync_=
file into
> > > > > > > any VkFence or VkSemaphore.  As long as that works, the core =
Vulkan
> > > > > > > driver only ever sees explicit synchronization via sync_file.=
  The WSI
> > > > > > > code uses these new ioctls to translate the implicit sync of =
X11 and
> > > > > > > Wayland to the explicit sync the Vulkan driver wants.
> > > > > > >
> > > > > > > I'm hoping (and here's where I want a sanity check) that a si=
mple API
> > > > > > > like this will allow us to finally start moving the Linux eco=
system
> > > > > > > over to explicit synchronization one piece at a time in a way=
 that's
> > > > > > > actually correct.  (No Wayland explicit sync with compositors=
 hoping
> > > > > > > KMS magically works even though it doesn't have a sync_file A=
PI.)
> > > > > > > Once some pieces in the ecosystem start moving, there will be
> > > > > > > motivation to start moving others and maybe we can actually b=
uild the
> > > > > > > momentum to get most everything converted.
> > > > > > >
> > > > > > > For reference, you can find the kernel RFC patches and mesa M=
R here:
> > > > > > >
> > > > > > > https://lists.freedesktop.org/archives/dri-devel/2020-March/2=
58833.html
> > > > > > >
> > > > > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/403=
7
> > > > > > >
> > > > > > > At this point, I welcome your thoughts, comments, objections,=
 and
> > > > > > > maybe even help/review. :-)
>
