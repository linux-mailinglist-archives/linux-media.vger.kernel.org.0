Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B4542C49A
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 17:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhJMPPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 11:15:19 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48175 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbhJMPPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 11:15:19 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A3EF11BF205;
        Wed, 13 Oct 2021 15:13:11 +0000 (UTC)
Date:   Wed, 13 Oct 2021 17:14:00 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <20211013151400.i2s3gcshb3xvuy2e@uno.localdomain>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <m3a6jel9ce.fsf@t19.piap.pl>
 <20211013082634.53zh5j26gucddome@uno.localdomain>
 <m3y26xjd7p.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3y26xjd7p.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Krzysztof

On Wed, Oct 13, 2021 at 02:55:54PM +0200, Krzysztof Hałasa wrote:
> Jacopo Mondi <jacopo@jmondi.org> writes:
>
> > You have never been told before, while submitting code to Linux, not
> > to use C++ comments ? Are you surprised someone contests that ?
>
> Surprised, far from it. Linus has decided C++ comments are ok.
> I simply follow his advice (C++ comments are, after all, technically
> a little bit better).
>
> > No driver in media (which I'm aware of) uses C++ comments.
> > Your one is entirely commented with C++ comments.
> >
> > They all try to stay in the 80-cols limit.
> > Yours have lines that span to 140 cols and goes regularly over 100.
>
> Linus has already (in 2016 IIRC) said 80 cols are BS. This is BTW what
> several people (me included) postulated long before. Would it make sense
> to use this limit now?
>

Apparently, for the subsystem maintainers, yes.

> If the above constitutes being "alien", well, don't worry about it.
>
> > Ok, I give up then, feels like a waste of time reviewing a driver
> > (for the only sake of code consistency) and have every single comment
> > contested.
>
> Please note a didn't contest your every comment. Actually, I have
> contested only those... which I contested, by definition. I have
> (perhaps too silently) accepted the rest.
>
> > Documentation/driver-api/media/maintainer-entry-profile.rst
> >
> > and has there suggested have the patch go through
> > ./scripts/checkpatch.pl --strict --max-line-length=80
>
> You suggest I'm to fix this (.rst) file first? I think I can at least
> try.

No, I suggest you stick to what has been there recorded not longer
than 2 years ago.

If you prefer to go the other way around and change the subsystem
profile first, please go ahead.

>
> >> I'd love to get rid of the be(), though. What do you propose instead?
> >
> > Mode based sensor drivers usually rely on long register tables, whose
> > writing is an expensive operation to be done at streamon time. Power
> > up is usually done at devnode open time but you relay on the legacy
> > s_power() here,
>
> It's been suggested I get rid of it, and I'm going to do exactly this.
>
> > so it's in control of the receiver driver which
> > depending on the implemenation might call it at open() time or stream
> > on. Sorry, I didn't notice that, has you register a devnode I assumed
> > you had an open() function, which you don't.
>
> Should I have one? Why? Are other drivers expected to have an open()?

If you register a devnode, userspace can open it.

To each open file handled is associated a try format, which should be
initialized to some meaningful default.

The same format should (or could) be used for your active format.

Userspace that makes use of the V4L2 subdev API won't be able to fully
operate on this driver in its current state.

> Shouldn't I register a devnode?
>

Depends on your use case and how much you care about supporting
complex use cases.

If you operate with a legacy implementation where everything goes
through the video device node, you don't care about the subdev
devnode.

If you operate in a media-controller environment, where userspace is
in control of configuring each component on the pipeline, you should
register a devnode.

> > The efficiency argument holds as long as we are in an hot path and I
> > understand writing 216 registers in pairs has an overhead which to
> > me, at open devnode open time is marginal, but if done at streamon time
> > should be avoided.
>
> It *may*be* marginal in some cases, but it you have a single I^2 bus for
> a bunch of devices, some of them e.g. MEMS, it may be as well critical.
>
> >> Just tested it and it works for me in 1920x1080p30 without any changes.
> >> Would it be possible it's the gain/exposure settings? If not, what exact
> >> clock frequency (for the chip) do you use?
> >
> > 24Mhz
>
> I will try to use that.
> What SoC (or MIPI receiver) are you using?
>
> > The difference is that the 0x3xxx ones are frame synchronized and
> > apply to 'bad frames' too.
>
> Is it stated in the docs?
>

Yes, in the right-most columns of the register tables.

> >> I don't think so. I think, in proprietary development, nobody cares
> >> about what does the chip send while not streaming.
> >>
> >
> > afaict only imx6 has this check enforced (but I might be wrong)
>
> Possibly only in the official tree (not the FSL/NXP).
>
> >> How would you do that?
> >> If you disable streaming, LP-11 is gone.
> >> You need STREAMING to actually "stream" LP-11.
> >
> > Even for test mode ? So for you streamoff is:
> > - Enable test mode (programmed to be LP-11)
> > - Start stream
> > ?
>
> That's correct. LP-11 here *is* a test mode.
>
> > Anyway, should the AR0521_REG_RESET_RESTART bit be dropped ?
>
> Not sure. Why do you think so?
>

Because it's documented as:

Setting this bit causes the sensor to truncate the current frame at
the end of the current row and start resetting (integrating) the first
row. The delay before the first valid frame is read out is equal to
the integration time.

and since you're moving from test mode to stream mode, there's no
frame integration going on.

> > I don't have a way to test LP-11 state,
>
> On i.MX6 you can read a MIPI RX status register. IIRC the results may be
> a bit unclear, though - using an oscilloscope removes any doubt.
>
> >> But it doesn't say EBUSY MUST BE returned when the sensor is streaming,
> >> only that it MAY BE returned. Looking at the code, I can see nothing
> >> forcing the EBUSY (subdev_do_ioctl(VIDIOC_SUBDEV_S_FMT) ->
> >
> > There's nothing in the core that has the notion of 'active streaming'
>
> Come on. It appears Linux (from top to the bottom) will accept set_fmt

What do you mean with "Linux from top to the bottom" ?

What I meant is that the core cannot prevent ioctls and subdev
operations to be called on the sensor while streaming, as the 'is
streaming' state is only kept in the driver and there's no state
keeping in the V4L2 core.

> while streaming. With certain (most?) drivers only, that's it. Not that
> I actually tested it, but the v4l2 core code suggests it.

spec says no.
reviewers say no.
maintainers say no.

But if you think you're right, please go ahead.

> So I'm either to return -EBUSY, or - as others, probably most drivers -

maybe they just assume they knew better when they got being told
not to do so during review.

> update the registers. I can't just drop it on the floor, and let the
> driver apply it on the next s_stream(1)... can I?
>
> > I hardly see a case where changing format on the sensor through an
> > operation on the subdev while streaming, is a good idea.
>
> I'm not in control of this.
>

As you're not in control of how your driver will be used once merged

That's why there are specs, reviews and collective knowledge that
helps enforce a consistent behavior.

> > Also, your s_fmt() and s_frame_interval() call write_mode() which
> > stops the streaming and it doesn't get restarted. I think that's
> > wrong and it's an undesired side effect.
>
> That would be wrong indeed, but I can't see it in the code.
> write_mode() stop streaming only momentarily, I can't avoid this.

Yes you can, by not allowing s_fmt while streaming.

Stopping and restarting stream in the sensor, through a subdev ioctl
behind the back of the rest of the capture pipeline is just calling
for troubles.

There's a potential point of failure in every single part of the
capture pipeline, from the on-going transfer in the SoC's DMA engines
to the CSI-2 receiver port.

Even without the stop/restart sequence, what happens if you increase
the frame size which is output from the sensor without re-negotiating
buffers or image formats ?

There's no single valid reason to allow such a use case, if not making
out of it a matter of principle like you're doing.

> s_frame_interval() returns -EBUSY if streaming (which I guess I should
> remove). If not for the return, it wouldn't stop streaming either.
>
> I will do some experiments, though.
>
> > (Also had a chat with Hans about this, the takeaway is that it's a
> > really bad idea and you need very strong reasons to allow that. It
> > could be considered for extreme cases like changing the color spaces of
> > reducing the image size as the allocated buffers are big enough but
> > again, you need very strong reasons to do so)
>
> Ah, buffers are a different story. You can't, for example, request
> buffers which streaming etc. This is a completely different territory.
>
> Now... I don't have buffers :-)
>
> It's a MIPI sensor, the output is a bunch of LVDS lines.
> Certain devices (like THC63LVD104C, an LVDS -> parallel receiver) simply
> always stream (well, not in powerdown and not without incoming clock).
> They don't even notice that some format has maybe changed.
> A MIPI sensor is a bit smarter than that, but buffers - it's the
> receiver's problem.
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
