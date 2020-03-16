Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5631C187547
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 23:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732726AbgCPWCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 18:02:23 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37545 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732652AbgCPWCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 18:02:23 -0400
Received: by mail-ed1-f67.google.com with SMTP id b23so23957054edx.4
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2020 15:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zE+9FtGfrcfcWYekQ0isUihgsL/+lesPHuKlo8al2yM=;
        b=MoTNnVm4Mdcohe8Kh4haFA+hxuAqxKY3G25f37K29wFz0ssPE4IiIYwvfJhkoENbGn
         pABRWRCOUWM+rIAbhJV6K9GV7upgS4aVuh+ZwerzNc02iR+JcD/dFsdsjN7A2klx7PkC
         ECCYJKJkxkKtOIrn91J+N7Ci9LtxZ3EwvyGVrq80vMt7LfSLG21TM29Aw6AD7vDldQXk
         ZP1JJVrBv0mrkF6hg1C1IDZskxLCkyX/0IFNOFtd7NI73CWTe3bPkRhW3cUcCrUdhB48
         4IUGW/gdP+BlzXA7HRX2rw8YAFmnBepCzbrHPURmGB9zRLV+67DG8eZi1f2MpgQmNwSq
         Oh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zE+9FtGfrcfcWYekQ0isUihgsL/+lesPHuKlo8al2yM=;
        b=Fux1A0u5m1rHzgDCSOP7vlTVds5SY89bkjTiQ2eZq/gIH0U6Ca96ZvL+okShO5nv10
         R8R1zthUGZC/Zwvvx7suQUbGRZgaDFPUlLnnu+StrTOE1deRuP2bFzYlUHvJJW1XDPSe
         urCPaQiV0Ld6/Eepltvj0KOQkUJjIOlwAqa00wWEUQxHBxGLP95gicR+YEQ6WSV1CMZy
         CyYxhHSpwpr3Itk7guP0vU68bEkEIeNumkCyB7W9tJXnUZoN/OR8b7Hcv3+cP8YmzaRI
         TTLTRGOYxNgfvH/Ls6f/dML8uMITEFtxAwHMvizxdpb9SPGMJBmpY/8yYIXylsGq7CTF
         +sNQ==
X-Gm-Message-State: ANhLgQ22bTDjoati7b5tZDNBC14c0khA9U5gnZu1vwYGDxArTgrJZVeS
        dxfPslmUkHL/uSqMNmtv9sZPy3vZLtxfCg15dwn3Ng==
X-Google-Smtp-Source: ADFU+vsJYmsnPE0kJSEtGVKP8wsUGtOWZlkyg48nk6XWdwP3BPcBdmiDxRUiDP8WAsMQ0pr7Wo3EnACe/XgPhi/LGAU=
X-Received: by 2002:a17:906:7a54:: with SMTP id i20mr1316801ejo.100.1584396138165;
 Mon, 16 Mar 2020 15:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com> <CAOFGe95JUUBCuE=dWKtZVXjTLqxyf2oybpqAZ7hZhpBEKQ=Y-Q@mail.gmail.com>
 <20200316211502.GW4732@pendragon.ideasonboard.com>
In-Reply-To: <20200316211502.GW4732@pendragon.ideasonboard.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Mon, 16 Mar 2020 17:02:06 -0500
Message-ID: <CAOFGe94QSK+aWt-AnqL+Y=jOQW5_CVX9azE+N8J0m3q-eWbOuw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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

On Mon, Mar 16, 2020 at 4:15 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jason,
>
> On Mon, Mar 16, 2020 at 10:06:07AM -0500, Jason Ekstrand wrote:
> > On Mon, Mar 16, 2020 at 5:20 AM Laurent Pinchart wrote:
> > > On Wed, Mar 11, 2020 at 04:18:55PM -0400, Nicolas Dufresne wrote:
> > >> (I know I'm going to be spammed by so many mailing list ...)
> > >>
> > >> Le mercredi 11 mars 2020 =C3=A0 14:21 -0500, Jason Ekstrand a =C3=A9=
crit :
> > >>> On Wed, Mar 11, 2020 at 12:31 PM Jason Ekstrand <jason@jlekstrand.n=
et> wrote:
> > >>>> All,
> > >>>>
> > >>>> Sorry for casting such a broad net with this one. I'm sure most pe=
ople
> > >>>> who reply will get at least one mailing list rejection.  However, =
this
> > >>>> is an issue that affects a LOT of components and that's why it's
> > >>>> thorny to begin with.  Please pardon the length of this e-mail as
> > >>>> well; I promise there's a concrete point/proposal at the end.
> > >>>>
> > >>>>
> > >>>> Explicit synchronization is the future of graphics and media.  At
> > >>>> least, that seems to be the consensus among all the graphics peopl=
e
> > >>>> I've talked to.  I had a chat with one of the lead Android graphic=
s
> > >>>> engineers recently who told me that doing explicit sync from the s=
tart
> > >>>> was one of the best engineering decisions Android ever made.  It's
> > >>>> also the direction being taken by more modern APIs such as Vulkan.
> > >>>>
> > >>>>
> > >>>> ## What are implicit and explicit synchronization?
> > >>>>
> > >>>> For those that aren't familiar with this space, GPUs, media encode=
rs,
> > >>>> etc. are massively parallel and synchronization of some form is
> > >>>> required to ensure that everything happens in the right order and
> > >>>> avoid data races.  Implicit synchronization is when bits of work (=
3D,
> > >>>> compute, video encode, etc.) are implicitly based on the absolute
> > >>>> CPU-time order in which API calls occur.  Explicit synchronization=
 is
> > >>>> when the client (whatever that means in any given context) provide=
s
> > >>>> the dependency graph explicitly via some sort of synchronization
> > >>>> primitives.  If you're still confused, consider the following
> > >>>> examples:
> > >>>>
> > >>>> With OpenGL and EGL, almost everything is implicit sync.  Say you =
have
> > >>>> two OpenGL contexts sharing an image where one writes to it and th=
e
> > >>>> other textures from it.  The way the OpenGL spec works, the client=
 has
> > >>>> to make the API calls to render to the image before (in CPU time) =
it
> > >>>> makes the API calls which texture from the image.  As long as it d=
oes
> > >>>> this (and maybe inserts a glFlush?), the driver will ensure that t=
he
> > >>>> rendering completes before the texturing happens and you get corre=
ct
> > >>>> contents.
> > >>>>
> > >>>> Implicit synchronization can also happen across processes.  Waylan=
d,
> > >>>> for instance, is currently built on implicit sync where the client
> > >>>> does their rendering and then does a hand-off (via wl_surface::com=
mit)
> > >>>> to tell the compositor it's done at which point the compositor can=
 now
> > >>>> texture from the surface.  The hand-off ensures that the client's
> > >>>> OpenGL API calls happen before the server's OpenGL API calls.
> > >>>>
> > >>>> A good example of explicit synchronization is the Vulkan API.  The=
re,
> > >>>> a client (or multiple clients) can simultaneously build command
> > >>>> buffers in different threads where one of those command buffers
> > >>>> renders to an image and the other textures from it and then submit
> > >>>> both of them at the same time with instructions to the driver for
> > >>>> which order to execute them in.  The execution order is described =
via
> > >>>> the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
> > >>>> extension, you can even submit the work which does the texturing
> > >>>> BEFORE the work which does the rendering and the driver will sort =
it
> > >>>> out.
> > >>>>
> > >>>> The #1 problem with implicit synchronization (which explicit solve=
s)
> > >>>> is that it leads to a lot of over-synchronization both in client s=
pace
> > >>>> and in driver/device space.  The client has to synchronize a lot m=
ore
> > >>>> because it has to ensure that the API calls happen in a particular
> > >>>> order.  The driver/device have to synchronize a lot more because t=
hey
> > >>>> never know what is going to end up being a synchronization point a=
s an
> > >>>> API call on another thread/process may occur at any time.  As we m=
ove
> > >>>> to more and more multi-threaded programming this synchronization (=
on
> > >>>> the client-side especially) becomes more and more painful.
> > >>>>
> > >>>>
> > >>>> ## Current status in Linux
> > >>>>
> > >>>> Implicit synchronization in Linux works via a the kernel's interna=
l
> > >>>> dma_buf and dma_fence data structures.  A dma_fence is a tiny obje=
ct
> > >>>> which represents the "done" status for some bit of work.  Typicall=
y,
> > >>>> dma_fences are created as a by-product of someone submitting some =
bit
> > >>>> of work (say, 3D rendering) to the kernel.  The dma_buf object has=
 a
> > >>>> set of dma_fences on it representing shared (read) and exclusive
> > >>>> (write) access to the object.  When work is submitted which, for
> > >>>> instance renders to the dma_buf, it's queued waiting on all the fe=
nces
> > >>>> on the dma_buf and and a dma_fence is created representing the end=
 of
> > >>>> said rendering work and it's installed as the dma_buf's exclusive
> > >>>> fence.  This way, the kernel can manage all its internal queues (3=
D
> > >>>> rendering, display, video encode, etc.) and know which things to
> > >>>> submit in what order.
> > >>>>
> > >>>> For the last few years, we've had sync_file in the kernel and it's
> > >>>> plumbed into some drivers.  A sync_file is just a wrapper around a
> > >>>> single dma_fence.  A sync_file is typically created as a by-produc=
t of
> > >>>> submitting work (3D, compute, etc.) to the kernel and is signaled =
when
> > >>>> that work completes.  When a sync_file is created, it is guarantee=
d by
> > >>>> the kernel that it will become signaled in finite time and, once i=
t's
> > >>>> signaled, it remains signaled for the rest of time.  A sync_file i=
s
> > >>>> represented in UAPIs as a file descriptor and can be used with nor=
mal
> > >>>> file APIs such as dup().  It can be passed into another UAPI which
> > >>>> does some bit of queue'd work and the submitted work will wait for=
 the
> > >>>> sync_file to be triggered before executing.  A sync_file also supp=
orts
> > >>>> poll() if  you want to wait on it manually.
> > >>>>
> > >>>> Unfortunately, sync_file is not broadly used and not all kernel GP=
U
> > >>>> drivers support it.  Here's a very quick overview of my understand=
ing
> > >>>> of the status of various components (I don't know the status of
> > >>>> anything in the media world):
> > >>>>
> > >>>>  - Vulkan: Explicit synchronization all the way but we have to go
> > >>>> implicit as soon as we interact with a window-system.  Vulkan has =
APIs
> > >>>> to import/export sync_files to/from it's VkSemaphore and VkFence
> > >>>> synchronization primitives.
> > >>>>  - OpenGL: Implicit all the way.  There are some EGL extensions to
> > >>>> enable some forms of explicit sync via sync_file but OpenGL itself=
 is
> > >>>> still implicit.
> > >>>>  - Wayland: Currently depends on implicit sync in the kernel (acce=
ssed
> > >>>> via EGL/OpenGL).  There is an unstable extension to allow passing
> > >>>> sync_files around but it's questionable how useful it is right now
> > >>>> (more on that later).
> > >>>>  - X11: With present, it has these "explicit" fence objects but
> > >>>> they're always a shmfence which lets the X server and client do a
> > >>>> userspace CPU-side hand-off without going over the socket (and
> > >>>> round-tripping through the kernel).  However, the only thing that
> > >>>> fence does is order the OpenGL API calls in the client and server =
and
> > >>>> the real synchronization is still implicit.
> > >>>>  - linux/i915/gem: Fully supports using sync_file or syncobj for e=
xplicit
> > >>>> sync.
> > >>>>  - linux/amdgpu: Supports sync_file and syncobj but it still
> > >>>> implicitly syncs sometimes due to it's internal memory residency
> > >>>> handling which can lead to over-synchronization.
> > >>>>  - KMS: Implicit sync all the way.  There are no KMS APIs which ta=
ke
> > >>>> explicit sync primitives.
> > >>>
> > >>> Correction:  Apparently, I missed some things.  If you use atomic, =
KMS
> > >>> does have explicit in- and out-fences.  Non-atomic users (e.g. X11)
> > >>> are still in trouble but most Wayland compositors use atomic these
> > >>> days
> > >>>
> > >>>>  - v4l: ???
> > >>>>  - gstreamer: ???
> > >>>>  - Media APIs such as vaapi etc.:  ???
> > >>
> > >> GStreamer is consumer for V4L2, VAAPI and other stuff. Using asynchr=
onous buffer
> > >> synchronisation is something we do already with GL (even if limited)=
. We place
> > >> GLSync object in the pipeline and attach that on related GstBuffer. =
We wait on
> > >> these GLSync as late as possible (or superseed the sync if we queue =
more work
> > >> into the same GL context). That requires a special mode of operation=
 of course.
> > >> We don't usually like making lazy blocking call implicit, as it tend=
s to cause
> > >> random issues. If we need to wait, we think it's better to wait int =
he module
> > >> that is responsible, so in general, we try to negotiate and fallback=
 locally
> > >> (it's plugin base, so this can be really messy otherwise).
> > >>
> > >> So basically this problem needs to be solved in V4L2, VAAPI and othe=
r lower
> > >> level APIs first. We need API that provides us these fence (in or ou=
t), and then
> > >> we can consider using them. For V4L2, there was an attempt, but it w=
as a bit of
> > >> a miss-fit. Your proposal could work, need to be tested I guess, but=
 it does not
> > >> solve some of other issues that was discussed. Notably for camera ca=
pture, were
> > >> the HW timestamp is capture about at the same time the frame is read=
y. But the
> > >> timestamp is not part of the paylaod, so you need an entire API asyn=
chronously
> > >> deliver that metadata. It's the biggest pain point I've found, such =
an API would
> > >> be quite invasive or if made really generic, might just never be ado=
pted widely
> > >> enough.
> > >
> > > Another issue is that V4L2 doesn't offer any guarantee on job orderin=
g.
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
>
> > I must admit that V4L is a bit of an odd case since the kernel driver
> > is the producer and not the consumer.
>
> Note that V4L2 can be a consumer too. Video output with V4L2 is less
> frequent than video capture (but it still exists), and codecs and other
> memory-to-memory processing devices (colorspace converters, scalers,
> ...) are both consumers and producers.

Yeah, I think I was aware of at least some of that.  I would expect
(though, again, I don't know) that the hardware which consumes images
generally shouldn't have those "packet loss" problems.  A video output
device might miss vblank but that's something we deal with in display
hardware all the time.  Codecs, I would hope, are reliable enough that
they should more-or-less always succeed.  Is this assumption correct?

> > > In the normal case buffers are processed in sequence, but if
> > > an error occurs during capture, they can be recycled internally and p=
ut
> > > to the back of the queue.
> >
> > Are those errors something that can happen at any time in the middle
> > of a frame capture?  If so, that does make things stickier.
>
> Yes it can. Think of packet loss when capturing from a USB webcam for
> instance.

Yeah, that makes sense.  In that case, there are likely going to be
some devices that either need to wait for the actual end-of-frame
before handing the buffer back to userspace or will need some sort of
out-of-band "ignore this frame, it's corrupted" error.  The later
sounds fairly painful for userspace to handle correctly.  Is this
"packet loss" something that all video devices experience or is it
mostly cheaper ones?

> > > Unless I'm mistaken, this problem also exists
> > > with stateful codecs. And if you don't know in advance which buffer y=
ou
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

Just to be clear, do you actually use the dma-buf implicit sync stuff
today or do all V4L capture devices wait until the full frame is
complete before returning anything to userspace?

> I think we need to analyse the use cases here, and figure out at least
> guidelines for userspace, otherwise applications will wonder what
> behaviour to implement, and we'll end up with a wide variety of them.

Yeah, there's some API design questions to be answered here.  It's
possible to have an image output API which always provides a sync_file
and, depending on the hardware, it may have one of two behaviors:

 1. Hand out images before the capture is done and trigger the sync
file once that frame's capture is completed
 2. Hand out images only after the full frame has been completed and
provide an already triggered sync_file

It would also be possible to make whether or not you get a sync_file
vs. implicit sync configurable from userspace (it kind-of has to be
opt-in since it would be a new UAPI) or to make it depend on the
underlying hardware.  This potentially makes userspace software more
complex which may make it harder to get right.  Lots of trade-offs
here.

> Even just on the kernel side, some V4L2 capture driver will pass
> erroneous frames to userspace (thus guaranteeing ordering, but without
> early notification of errors), some will require the frame
> automatically, and at least one (uvcvideo) has a module parameter to
> pick the desired behaviour.

Is passing erroneous frames to userspace current behavior?  Or are you
talking about what a sync_file future looks like?

--Jason


> > Trying to understand. :-)
>
> So am I :-)
>
> > >> There is other elements that would implement fencing, notably kmssin=
k, but no
> > >> one actually dared porting it to atomic KMS, so clearly there is ver=
y little
> > >> comunity interest. glimagsink could clearly benifit. Right now if we=
 import a
> > >> DMABuf, and that this DMAbuf is used for render, a implicit fence is=
 attached,
> > >> which we are unaware. Philippe Zabbel is working on a patch, so V4L2=
 QBUF would
> > >> wait, but waiting in QBUF is not allowed if O_NONBLOCK was set (whic=
h GStreamer
> > >> uses), so then the operation will just fail where it worked before (=
breaking
> > >> userspace). If it was an explcit fence, we could handle that in GStr=
eamer
> > >> cleanly as we do for new APIs.
> > >>
> > >>>> ## Chicken and egg problems
> > >>>>
> > >>>> Ok, this is where it starts getting depressing.  I made the claim
> > >>>> above that Wayland has an explicit synchronization protocol that's=
 of
> > >>>> questionable usefulness.  I would claim that basically any bit of
> > >>>> plumbing we do through window systems is currently of questionable
> > >>>> usefulness.  Why?
> > >>>>
> > >>>> From my perspective, as a Vulkan driver developer, I have to deal =
with
> > >>>> the fact that Vulkan is an explicit sync API but Wayland and X11
> > >>>> aren't.  Unfortunately, the Wayland extension solves zero problems=
 for
> > >>>> me because I can't really use it unless it's implemented in all of=
 the
> > >>>> compositors.  Until every Wayland compositor I care about my users
> > >>>> being able to use (which is basically all of them) supports the
> > >>>> extension, I have to continue carry around my pile of hacks to kee=
p
> > >>>> implicit sync and Vulkan working nicely together.
> > >>>>
> > >>>> From the perspective of a Wayland compositor (I used to play in th=
is
> > >>>> space), they'd love to implement the new explicit sync extension b=
ut
> > >>>> can't.  Sure, they could wire up the extension, but the moment the=
y go
> > >>>> to flip a client buffer to the screen directly, they discover that=
 KMS
> > >>>> doesn't support any explicit sync APIs.
> > >>>
> > >>> As per the above correction, Wayland compositors aren't nearly as b=
ad
> > >>> off as I initially thought.  There may still be weird screen captur=
e
> > >>> cases but the normal cases of compositing and displaying via
> > >>> KMS/atomic should be in reasonably good shape.
> > >>>
> > >>>> So, yes, they can technically
> > >>>> implement the extension assuming the EGL stack they're running on =
has
> > >>>> the sync_file extensions but any client buffers which come in usin=
g
> > >>>> the explicit sync Wayland extension have to be composited and can'=
t be
> > >>>> scanned out directly.  As a 3D driver developer, I absolutely don'=
t
> > >>>> want compositors doing that because my users will complain about
> > >>>> performance issues due to the extra blit.
> > >>>>
> > >>>> Ok, so let's say we get KMS wired up with implicit sync.  That sol=
ves
> > >>>> all our problems, right?  It does, right up until someone decides =
that
> > >>>> they wan to screen capture their Wayland session via some hardware
> > >>>> media encoder that doesn't support explicit sync.  Now we have to
> > >>>> plumb it all the way through the media stack, gstreamer, etc.  Gre=
at,
> > >>>> so let's do that!  Oh, but gstreamer won't want to plumb it throug=
h
> > >>>> until they're guaranteed that they can use explicit sync when
> > >>>> displaying on X11 or Wayland.  Are you seeing the problem?
> > >>>>
> > >>>> To make matters worse, since most things are doing implicit
> > >>>> synchronization today, it's really easy to get your explicit
> > >>>> synchronization wrong and never notice.  If you forget to pass a
> > >>>> sync_file into one place (say you never notice KMS doesn't support
> > >>>> them), it will probably work anyway thanks to all the implicit syn=
c
> > >>>> that's going on elsewhere.
> > >>>>
> > >>>> So, clearly, we all need to go write piles of code that we can't
> > >>>> actually properly test until everyone else has written their piece=
 and
> > >>>> then we use explicit sync if and only if all components support it=
.
> > >>>> Really?  We're going to do multiple years of development and then =
just
> > >>>> hope it works when we finally flip the switch?  That doesn't sound
> > >>>> like a good plan to me.
> > >>>>
> > >>>>
> > >>>> ## A proposal: Implicit and explicit sync together
> > >>>>
> > >>>> How to solve all these chicken-and-egg problems is something I've =
been
> > >>>> giving quite a bit of thought (and talking with many others about)=
 in
> > >>>> the last couple of years.  One motivation for this is that we have=
 to
> > >>>> deal with a mismatch in Vulkan.  Another motivation is that I'm
> > >>>> becoming increasingly unhappy with the way that synchronization,
> > >>>> memory residency, and command submission are inherently intertwine=
d in
> > >>>> i915 and would like to break things apart.  Towards that end, I ha=
ve
> > >>>> an actual proposal.
> > >>>>
> > >>>> A couple weeks ago, I sent a series of patches to the dri-devel
> > >>>> mailing list which adds a pair of new ioctls to dma-buf which allo=
w
> > >>>> userspace to manually import or export a sync_file from a dma-buf.
> > >>>> The idea is that something like a Wayland compositor can switch to
> > >>>> 100% explicit sync internally once the ioctl is available.  If it =
gets
> > >>>> buffers in from a client that doesn't use the explicit sync extens=
ion,
> > >>>> it can pull a sync_file from the dma-buf and use that exactly as i=
t
> > >>>> would a sync_file passed via the explicit sync extension.  When it
> > >>>> goes to scan out a user buffer and discovers that KMS doesn't acce=
pt
> > >>>> sync_files (or if it tries to use that pesky media encoder no one =
has
> > >>>> converted), it can take it's sync_file for display and stuff it in=
to
> > >>>> the dma-buf before handing it to KMS.
> > >>>>
> > >>>> Along with the kernel patches, I've also implemented support for t=
his
> > >>>> in the Vulkan WSI code used by ANV and RADV.  With those patches, =
the
> > >>>> only requirement on the Vulkan drivers is that you be able to expo=
rt
> > >>>> any VkSemaphore as a sync_file and temporarily import a sync_file =
into
> > >>>> any VkFence or VkSemaphore.  As long as that works, the core Vulka=
n
> > >>>> driver only ever sees explicit synchronization via sync_file.  The=
 WSI
> > >>>> code uses these new ioctls to translate the implicit sync of X11 a=
nd
> > >>>> Wayland to the explicit sync the Vulkan driver wants.
> > >>>>
> > >>>> I'm hoping (and here's where I want a sanity check) that a simple =
API
> > >>>> like this will allow us to finally start moving the Linux ecosyste=
m
> > >>>> over to explicit synchronization one piece at a time in a way that=
's
> > >>>> actually correct.  (No Wayland explicit sync with compositors hopi=
ng
> > >>>> KMS magically works even though it doesn't have a sync_file API.)
> > >>>> Once some pieces in the ecosystem start moving, there will be
> > >>>> motivation to start moving others and maybe we can actually build =
the
> > >>>> momentum to get most everything converted.
> > >>>>
> > >>>> For reference, you can find the kernel RFC patches and mesa MR her=
e:
> > >>>>
> > >>>> https://lists.freedesktop.org/archives/dri-devel/2020-March/258833=
.html
> > >>>>
> > >>>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
> > >>>>
> > >>>> At this point, I welcome your thoughts, comments, objections, and
> > >>>> maybe even help/review. :-)
>
> --
> Regards,
>
> Laurent Pinchart
