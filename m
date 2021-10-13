Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC44D42C0AD
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 14:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233955AbhJMM6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 08:58:03 -0400
Received: from ni.piap.pl ([195.187.100.5]:50132 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233859AbhJMM6C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 08:58:02 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 6F607C36955D;
        Wed, 13 Oct 2021 14:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6F607C36955D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1634129755; bh=sIcUI8mTmZIydzUXeyZ3J5UffwR7mSdChbwCl8LylUM=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=lXXv7SrHezO9kprc+RtdzBI7iBhj783hV76a5IuI0UjebTi7qPoMsjvMvZ1LIEBpv
         lsfDkcZGq/ysQQoIpP/FujsUF5sfGzuXPru4qkl9xt2f19YN93QkgcbF8zMVLBrUg/
         a62IU7oigYVV8vbcZFm+RIeTquM1vnYH/wp2GgM4=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
        <m3mtnflpna.fsf@t19.piap.pl>
        <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
        <m3a6jel9ce.fsf@t19.piap.pl>
        <20211013082634.53zh5j26gucddome@uno.localdomain>
Sender: khalasa@piap.pl
Date:   Wed, 13 Oct 2021 14:55:54 +0200
In-Reply-To: <20211013082634.53zh5j26gucddome@uno.localdomain> (Jacopo Mondi's
        message of "Wed, 13 Oct 2021 10:26:34 +0200")
Message-ID: <m3y26xjd7p.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 3
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

> You have never been told before, while submitting code to Linux, not
> to use C++ comments ? Are you surprised someone contests that ?

Surprised, far from it. Linus has decided C++ comments are ok.
I simply follow his advice (C++ comments are, after all, technically
a little bit better).

> No driver in media (which I'm aware of) uses C++ comments.
> Your one is entirely commented with C++ comments.
>
> They all try to stay in the 80-cols limit.
> Yours have lines that span to 140 cols and goes regularly over 100.

Linus has already (in 2016 IIRC) said 80 cols are BS. This is BTW what
several people (me included) postulated long before. Would it make sense
to use this limit now?

If the above constitutes being "alien", well, don't worry about it.

> Ok, I give up then, feels like a waste of time reviewing a driver
> (for the only sake of code consistency) and have every single comment
> contested.

Please note a didn't contest your every comment. Actually, I have
contested only those... which I contested, by definition. I have
(perhaps too silently) accepted the rest.

> Documentation/driver-api/media/maintainer-entry-profile.rst
>
> and has there suggested have the patch go through
> ./scripts/checkpatch.pl --strict --max-line-length=3D80

You suggest I'm to fix this (.rst) file first? I think I can at least
try.

>> I'd love to get rid of the be(), though. What do you propose instead?
>
> Mode based sensor drivers usually rely on long register tables, whose
> writing is an expensive operation to be done at streamon time. Power
> up is usually done at devnode open time but you relay on the legacy
> s_power() here,

It's been suggested I get rid of it, and I'm going to do exactly this.

> so it's in control of the receiver driver which
> depending on the implemenation might call it at open() time or stream
> on. Sorry, I didn't notice that, has you register a devnode I assumed
> you had an open() function, which you don't.

Should I have one? Why? Are other drivers expected to have an open()?
Shouldn't I register a devnode?

> The efficiency argument holds as long as we are in an hot path and I
> understand writing 216 registers in pairs has an overhead which to
> me, at open devnode open time is marginal, but if done at streamon time
> should be avoided.

It *may*be* marginal in some cases, but it you have a single I^2 bus for
a bunch of devices, some of them e.g. MEMS, it may be as well critical.

>> Just tested it and it works for me in 1920x1080p30 without any changes.
>> Would it be possible it's the gain/exposure settings? If not, what exact
>> clock frequency (for the chip) do you use?
>
> 24Mhz

I will try to use that.
What SoC (or MIPI receiver) are you using?

> The difference is that the 0x3xxx ones are frame synchronized and
> apply to 'bad frames' too.

Is it stated in the docs?

>> I don't think so. I think, in proprietary development, nobody cares
>> about what does the chip send while not streaming.
>>
>
> afaict only imx6 has this check enforced (but I might be wrong)

Possibly only in the official tree (not the FSL/NXP).

>> How would you do that?
>> If you disable streaming, LP-11 is gone.
>> You need STREAMING to actually "stream" LP-11.
>
> Even for test mode ? So for you streamoff is:
> - Enable test mode (programmed to be LP-11)
> - Start stream
> ?

That's correct. LP-11 here *is* a test mode.

> Anyway, should the AR0521_REG_RESET_RESTART bit be dropped ?

Not sure. Why do you think so?

> I don't have a way to test LP-11 state,

On i.MX6 you can read a MIPI RX status register. IIRC the results may be
a bit unclear, though - using an oscilloscope removes any doubt.

>> But it doesn't say EBUSY MUST BE returned when the sensor is streaming,
>> only that it MAY BE returned. Looking at the code, I can see nothing
>> forcing the EBUSY (subdev_do_ioctl(VIDIOC_SUBDEV_S_FMT) ->
>
> There's nothing in the core that has the notion of 'active streaming'

Come on. It appears Linux (from top to the bottom) will accept set_fmt
while streaming. With certain (most?) drivers only, that's it. Not that
I actually tested it, but the v4l2 core code suggests it.
So I'm either to return -EBUSY, or - as others, probably most drivers -
update the registers. I can't just drop it on the floor, and let the
driver apply it on the next s_stream(1)... can I?

> I hardly see a case where changing format on the sensor through an
> operation on the subdev while streaming, is a good idea.

I'm not in control of this.

> Also, your s_fmt() and s_frame_interval() call write_mode() which
> stops the streaming and it doesn't get restarted. I think that's
> wrong and it's an undesired side effect.

That would be wrong indeed, but I can't see it in the code.
write_mode() stop streaming only momentarily, I can't avoid this.
s_frame_interval() returns -EBUSY if streaming (which I guess I should
remove). If not for the return, it wouldn't stop streaming either.

I will do some experiments, though.

> (Also had a chat with Hans about this, the takeaway is that it's a
> really bad idea and you need very strong reasons to allow that. It
> could be considered for extreme cases like changing the color spaces of
> reducing the image size as the allocated buffers are big enough but
> again, you need very strong reasons to do so)

Ah, buffers are a different story. You can't, for example, request
buffers which streaming etc. This is a completely different territory.

Now... I don't have buffers :-)

It's a MIPI sensor, the output is a bunch of LVDS lines.
Certain devices (like THC63LVD104C, an LVDS -> parallel receiver) simply
always stream (well, not in powerdown and not without incoming clock).
They don't even notice that some format has maybe changed.
A MIPI sensor is a bit smarter than that, but buffers - it's the
receiver's problem.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
