Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C890842D1FE
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 07:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhJNFpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 01:45:10 -0400
Received: from ni.piap.pl ([195.187.100.5]:57758 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhJNFpJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 01:45:09 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id BEE88C36955E;
        Thu, 14 Oct 2021 07:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl BEE88C36955E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1634190183; bh=gNxzoBhyekpDiI2tjxKi398V3oczutXqWeJX5U1VbRg=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=c4DjuV8kxYurSXnXqWFadMh2rb6EJ1JvzlnRuWG4qSq8LJIHdJTXSNhNhBuCbb0qQ
         lBirQcyS+uqJK0SGCmCI5RKZ//K4dJk8gH0pgNMnC9W1+UdHTSO4JgZ1mzKMcqX7Uf
         iRemHt3kFGLcNDajMPsOGQIiwTct6CaAIcWG2Onk=
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
        <m3y26xjd7p.fsf@t19.piap.pl>
        <20211013151400.i2s3gcshb3xvuy2e@uno.localdomain>
Sender: khalasa@piap.pl
Date:   Thu, 14 Oct 2021 07:43:02 +0200
In-Reply-To: <20211013151400.i2s3gcshb3xvuy2e@uno.localdomain> (Jacopo Mondi's
        message of "Wed, 13 Oct 2021 17:14:00 +0200")
Message-ID: <m3tuhkjh5l.fsf@t19.piap.pl>
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

Jacopo,

> To each open file handled is associated a try format, which should be
> initialized to some meaningful default.

I will look at it then.

> If you operate with a legacy implementation where everything goes
> through the video device node, you don't care about the subdev
> devnode.

This can't be done in case of a sensor driver, right? Output from the
sensor is MIPI CSI, there is no connection to the memory bus.

BTW: What SoC (or MIPI receiver etc.) are you using?

>> > The difference is that the 0x3xxx ones are frame synchronized and
>> > apply to 'bad frames' too.
>>
>> Is it stated in the docs?
>
> Yes, in the right-most columns of the register tables.

Right.
Interesting - they are marked both "frame sync'd" and "bad frame" (not
all of them), where the 0x340 ones are both "N". I will try some tests,
but such a combination looks a bit suspicious.
(I guess I already tested it, but don't remember the results).

> Because it's documented as:
>
> Setting this bit causes the sensor to truncate the current frame at
> the end of the current row and start resetting (integrating) the first
> row. The delay before the first valid frame is read out is equal to
> the integration time.
>
> and since you're moving from test mode to stream mode, there's no
> frame integration going on.

But there is :-)
Remember we're streaming, the whole sensor is working. It's just the
LP-11 on the output lines.

> What do you mean with "Linux from top to the bottom" ?

Userspace + ioctl on top, the driver/hw on the bottom.

> What I meant is that the core cannot prevent ioctls and subdev
> operations to be called on the sensor while streaming, as the 'is
> streaming' state is only kept in the driver and there's no state
> keeping in the V4L2 core.

Exactly, that's what I thought.

>> while streaming. With certain (most?) drivers only, that's it. Not that
>> I actually tested it, but the v4l2 core code suggests it.
>
> spec says no.

I'm not aware of it. The specs say a driver *is*allowed* to return
EBUSY, if it can't handle the condition.

> reviewers say no.

Haven't seen this either. The existing code (other drivers) suggests
otherwise.

> maintainers say no.

Ditto.
Buffers are a completely different thing.

>> So I'm either to return -EBUSY, or - as others, probably most drivers -
>
> maybe they just assume they knew better when they got being told
> not to do so during review.

All of the others are wrong?
Maybe nobody told them otherwise - because there was no reason?

>> > I hardly see a case where changing format on the sensor through an
>> > operation on the subdev while streaming, is a good idea.
>>
>> I'm not in control of this.
>
> As you're not in control of how your driver will be used once merged

Exactly, it's the very same thing.

> That's why there are specs, reviews and collective knowledge that
> helps enforce a consistent behavior.

That's correct. Now you tell me I'm not to write to the hw in set_fmt(),
while I can clearly see other drivers do exactly that, and nobody else
suggests they (I) shouldn't.

> There's a potential point of failure in every single part of the
> capture pipeline, from the on-going transfer in the SoC's DMA engines
> to the CSI-2 receiver port.

I'm not in control of this, why should I set a policy for them? I don't
even know if there is a SoC and DMA engines - maybe this goes straight
to the antenna or *SDI transmitter? :-)

> Even without the stop/restart sequence, what happens if you increase
> the frame size which is output from the sensor without re-negotiating
> buffers or image formats ?

*I* don't change frame sizes. It's the upper levels which are making
such decisions. My code can only comply or return an error.
Perhaps the upper levels know what they're doing?

If they are wrong after all, well - a misprogrammed i.MX6 will corrupt
the frames, the output stream will lose sync, and the userspace can get
I/O errors on ioctls. The userspace will get what it asked for.

This is BTW completely orthogonal to the -EBUSY on set_fmt(). The
effects will be exactly the same if the e.g. geometry changes come when
the sensor is not streaming.

> There's no single valid reason to allow such a use case, if not making
> out of it a matter of principle like you're doing.

Then why other drivers do exactly that? Eg. all imx*.
Including the newest one imx412, merged 2021-08-04, and:
    Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
    Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
    Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Are they really all wrong? Really?

BTW principles are important to me, yes. One of them is "allow unless
required otherwise".
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
