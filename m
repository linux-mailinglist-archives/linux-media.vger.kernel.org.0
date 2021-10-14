Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B1242D464
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 09:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhJNIBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 04:01:16 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:60163 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhJNIBO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 04:01:14 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6BEAD100009;
        Thu, 14 Oct 2021 07:59:07 +0000 (UTC)
Date:   Thu, 14 Oct 2021 09:59:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <20211014075955.xxbv2bzrx73v45bo@uno.localdomain>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <m3a6jel9ce.fsf@t19.piap.pl>
 <20211013082634.53zh5j26gucddome@uno.localdomain>
 <m3y26xjd7p.fsf@t19.piap.pl>
 <20211013151400.i2s3gcshb3xvuy2e@uno.localdomain>
 <m3tuhkjh5l.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3tuhkjh5l.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On Thu, Oct 14, 2021 at 07:43:02AM +0200, Krzysztof Hałasa wrote:
> Jacopo,
>
> > To each open file handled is associated a try format, which should be
> > initialized to some meaningful default.
>
> I will look at it then.
>
> > If you operate with a legacy implementation where everything goes
> > through the video device node, you don't care about the subdev
> > devnode.
>
> This can't be done in case of a sensor driver, right? Output from the
> sensor is MIPI CSI, there is no connection to the memory bus.
>
> BTW: What SoC (or MIPI receiver etc.) are you using?
>
> >> > The difference is that the 0x3xxx ones are frame synchronized and
> >> > apply to 'bad frames' too.
> >>
> >> Is it stated in the docs?
> >
> > Yes, in the right-most columns of the register tables.
>
> Right.
> Interesting - they are marked both "frame sync'd" and "bad frame" (not
> all of them), where the 0x340 ones are both "N". I will try some tests,
> but such a combination looks a bit suspicious.
> (I guess I already tested it, but don't remember the results).
>
> > Because it's documented as:
> >
> > Setting this bit causes the sensor to truncate the current frame at
> > the end of the current row and start resetting (integrating) the first
> > row. The delay before the first valid frame is read out is equal to
> > the integration time.
> >
> > and since you're moving from test mode to stream mode, there's no
> > frame integration going on.
>
> But there is :-)
> Remember we're streaming, the whole sensor is working. It's just the
> LP-11 on the output lines.
>
> > What do you mean with "Linux from top to the bottom" ?
>
> Userspace + ioctl on top, the driver/hw on the bottom.
>
> > What I meant is that the core cannot prevent ioctls and subdev
> > operations to be called on the sensor while streaming, as the 'is
> > streaming' state is only kept in the driver and there's no state
> > keeping in the V4L2 core.
>
> Exactly, that's what I thought.
>
> >> while streaming. With certain (most?) drivers only, that's it. Not that
> >> I actually tested it, but the v4l2 core code suggests it.
> >
> > spec says no.
>
> I'm not aware of it. The specs say a driver *is*allowed* to return
> EBUSY, if it can't handle the condition.
>
> > reviewers say no.
>
> Haven't seen this either. The existing code (other drivers) suggests
> otherwise.
>
> > maintainers say no.
>
> Ditto.
> Buffers are a completely different thing.
>
> >> So I'm either to return -EBUSY, or - as others, probably most drivers -
> >
> > maybe they just assume they knew better when they got being told
> > not to do so during review.
>
> All of the others are wrong?
> Maybe nobody told them otherwise - because there was no reason?
>
> >> > I hardly see a case where changing format on the sensor through an
> >> > operation on the subdev while streaming, is a good idea.
> >>
> >> I'm not in control of this.
> >
> > As you're not in control of how your driver will be used once merged
>
> Exactly, it's the very same thing.
>
> > That's why there are specs, reviews and collective knowledge that
> > helps enforce a consistent behavior.
>
> That's correct. Now you tell me I'm not to write to the hw in set_fmt(),
> while I can clearly see other drivers do exactly that, and nobody else
> suggests they (I) shouldn't.
>
> > There's a potential point of failure in every single part of the
> > capture pipeline, from the on-going transfer in the SoC's DMA engines
> > to the CSI-2 receiver port.
>
> I'm not in control of this, why should I set a policy for them? I don't
> even know if there is a SoC and DMA engines - maybe this goes straight
> to the antenna or *SDI transmitter? :-)
>
> > Even without the stop/restart sequence, what happens if you increase
> > the frame size which is output from the sensor without re-negotiating
> > buffers or image formats ?
>
> *I* don't change frame sizes. It's the upper levels which are making
> such decisions. My code can only comply or return an error.
> Perhaps the upper levels know what they're doing?
>
> If they are wrong after all, well - a misprogrammed i.MX6 will corrupt
> the frames, the output stream will lose sync, and the userspace can get
> I/O errors on ioctls. The userspace will get what it asked for.
>
> This is BTW completely orthogonal to the -EBUSY on set_fmt(). The
> effects will be exactly the same if the e.g. geometry changes come when
> the sensor is not streaming.
>

No, this isn't true. Your s_fmt() implementation stops then restart the
stream. It has an undocumented side effect and will cause undefined
behaviour.

> > There's no single valid reason to allow such a use case, if not making
> > out of it a matter of principle like you're doing.
>
> Then why other drivers do exactly that? Eg. all imx*.
> Including the newest one imx412, merged 2021-08-04, and:
>     Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
>     Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>     Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
>     Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> Are they really all wrong? Really?
>
> BTW principles are important to me, yes. One of them is "allow unless
> required otherwise".

And that's how you will end up accepting the fact a s_fmt() has the
slightly disruptive side effect of stopping/restarting the stream
behind the back of the other components of the capture pipeline.

If your s_fmt() has to stop and restart streaming to take effect,
it means userspace should instead stop the stream, change
the format where opportune in the pipeline, and then restart the stream.
This allows the pipeline validation to take place, it allows buffers
to be negotiated correctly, it makes it impossible to write
application that rely on a side effect.

There's a lot going on about correctness and avoiding undefined
behaviours in the kernel these days. This is an example why I think a
language change won't solve much, not when it comes to correctness
towards user space. Allowing drivers to implement side-effects and
what clearly is an example of undefined behaviour is the recipe to
allow userspace to shot in their foot and makes it impossible to write
portable software with a predictable behaviour.

I still haven't heard a single reason why you want this, if not again,
for a matter of principles, which is by the way the less possible
productive way to carry on a converstation that should be based on
facts and reasons, not a fight to impose your mindset no
matter what.

Anyway, since we're not going anywhere here, I'll let this upscale to
anyone that will pick this driver up.

Thanks again for the contribution, I hope to see this driver in soon.
Cheers
   j

> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
