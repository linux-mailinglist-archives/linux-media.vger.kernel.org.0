Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1746D186D5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 10:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfEIIce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 04:32:34 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50375 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfEIIce (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 04:32:34 -0400
X-Originating-IP: 90.88.28.253
Received: from aptenodytes (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr [90.88.28.253])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A02711C000E;
        Thu,  9 May 2019 08:32:29 +0000 (UTC)
Message-ID: <6ffb32e804a27557ca49216c4d8f117837c78f4e.camel@bootlin.com>
Subject: Re: Support for 2D engines/blitters in V4L2 and DRM
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Dave Airlie <airlied@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Date:   Thu, 09 May 2019 10:32:14 +0200
In-Reply-To: <20190506112835.6d4ecf29@eldfell.localdomain>
References: <0df3d4b5178d8a37b67b275e0771741c6c268de3.camel@bootlin.com>
         <20190506112835.6d4ecf29@eldfell.localdomain>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pekka,

Le lundi 06 mai 2019 à 11:28 +0300, Pekka Paalanen a écrit :
> On Wed, 17 Apr 2019 20:10:15 +0200
> Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:
> 
> > There's also the possibility of writing up a drm-render DDX to handle
> > these 2D blitters that can make things a lot faster when running a
> > desktop environment. As for wayland, well, I don't really know what to
> > think. I was under the impression that it relies on GL for 2D
> > operations, but am really not sure how true that actually is.
> 
> Hi Paul,
> 
> Wayland does not rely on anything really, it does not even have any
> rendering commands, and is completely agnostic to how applications or
> display servers might be drawing things. Wayland (protocol) does care
> about buffer types and fences though, since those are the things passed
> between applications and servers.
> 
> In a Wayland architecture, each display server (called a Wayland
> compositor, corresponding to Xorg + window manager + compositing
> manager) uses whatever they want to use for putting the screen contents
> together. OpenGL is a popular choice, yes, but they may also use Vulkan,
> Pixman, Cairo, Skia, DRM KMS planes, and whatnot or a mix of any.
> Sometimes it may so happen that the display server does not need to
> render at all, the display hardware can realize the screen contents
> through e.g. KMS planes.

Right, I looked some more at wayland and had some discussions over IRC
(come to think of it, I'm pretty sure you were in the discussions too)
to get a clearer understanding of the architecture. The fact that the
wayland protocol is render-agnostic and does not alloc buffers on its
own feels very sane to me.

> Writing a hardware specific driver (like a DDX for Xorg) for one
> display server (or a display server library like wlroots or libweston)
> is no longer reasonable. You would have to do it on so many display
> server projects. What really makes it infeasible is the
> hardware-specific aspect. People would have to write a driver for every
> display server project for every hardware model. That's just not
> feasible today.

Yes, this is why I am suggesting implementing a DRM helper library for
that, which would handle common drivers. Basically what mesa does for
3D, but which a DRM-specific-but-device-agnostic userspace interface.
So the overhead for integration in display servers would be minimal.

> Some display server projects even refuse to take hardware-specific code
> upstream, because keeping it working has a high cost and only very few
> people can test it.

Right, maintainance aspects are quite importance and I think it's
definitely best to centralize per-device support in a common library.

> The only way as I see that you could have Wayland compositors at large
> take advantage of 2D hardware units is to come up with the common
> userspace API in the sense similar to Vulkan or OpenGL, so that each
> display server would only need to support the API, and the API
> implementation would handle the hardware-specific parts. OpenWF by
> Khronos may have been the most serious effort in that, good luck
> finding any users or implementations today. Although maybe Android's
> hwcomposer could be the next one.

I would be very cautious regarding the approach of designing a
"standardized" API across systems. Most of the time, this does not work
well and ends up involving a glue layer of crap that is not always a
good fit for the system. Things more or less worked out with GL (with
significant effort put into it), but there are countless other examples
where it didn't (things like OpenMAX, OpenVG, etc).

In addition, this would mostly only be used in compositors, not in
final applications, so the need to have a common API across systems is
much reduced. There's also the fact that 2D is much less complicated
than 3D.

So I am not very interested in this form of standardization and I think
a DRM-specific userspace API for this is not only sufficient, but
probably also the best fit for the job. Maybe the library implementing
this API and device support could later be extended to support a
standardized API across systems too if one shows up (a bit like mesa
supports different state trackers). That's definitely not a personal
priority though and I firmly believe it should not be a blocker to get
2D blitters support with DRM.

> However, if someone is doing a special Wayland compositor to be used on
> specific hardware, they can of course use whatever to put the screen
> contents together in a downstream fork. Wayland does not restrict that
> in any way, not even by buffer or fence types because you can extend
> Wayland to deal with anything you need, as long as you also modify the
> apps or toolkits to do it too. The limitations are really more
> political and practical if you aim for upstream and wide-spread use of
> 2D hardware blocks.

Yes I understand that the issue is not so much on the technical side,
but rather on governance and politics.

Cheers,

Paul

-- 
Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Bootlin

