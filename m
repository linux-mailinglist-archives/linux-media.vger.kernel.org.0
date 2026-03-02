Return-Path: <linux-media+bounces-54118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFEWC2nipWkvHgAAu9opvQ
	(envelope-from <linux-media+bounces-54118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 20:18:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3B1DEC1D
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 20:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9138E3064926
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 19:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0754314D07;
	Mon,  2 Mar 2026 19:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Wij0XEKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08524315A
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 19:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478936; cv=pass; b=bkwdbKfdmJgum2ApR1Sc2LrRiL9vsDupS5GbQWKdEP/0HCe8+toTCj257bGR7BtrO1M4VKJqx3D2M2oTpkfWsH2pA3CJMiqgLSL2cPf7bnL+2wXyStrYrerrTYWruvd386A0b+EmlFjpGesZ9ntFDjpGtRXDUYDuwliYZ3LaH4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478936; c=relaxed/simple;
	bh=w8Wpfty7Jf3tIDpK6eveux5dspUOmWlR5PUgfZYeFkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8t9twraQLZCFi9FDVpqdKI1J/KyPtbA0JJuzR87bzu1Pqj31ZtkqJqMbWuey47++Lniij4bk6KnPjlIIx6ZlVV0a8ybW7AgGgPaXHJ20/vL8sb88fmqQl7YUqBbIib5SbSLRyWA+FkaZtheY4oLYSZMXMzn+KnmlviAI8oWzP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Wij0XEKa; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ca9ec3ee7so4866332d50.3
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 11:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772478931; cv=none;
        d=google.com; s=arc-20240605;
        b=SYnmtX91R8BGTx8CqfQHdFjDc04um8JiMfkZ60xQbMPdBvij570T/BnF2JiHvOfjOI
         B9FoEhfiuEBXruFC9ogwVDIOoHfniIuT0Z1hIfZDuNxYcjiwHhLwBeomPWRp1W/ghC57
         /XmY+B8/aW8lJZjeUwf0g0bA9UCuuVhXTLEkzHPWIXhJe0RT6esknQoChWsji+M1BiUj
         QAjKFURq9LePN1dVPr0UWWF7qBBTaiPYTqui2zcd4GfhIPuycDjcjQ/LxDZRHhXXPtRI
         k4qNzMakD8eCTmENf2K0svwXco0UFpvx1jzJ3T0mOo7yo+QCUUf8SH+FS9BwU1N5OtRR
         IhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJK2tLWuo3dLRPC2uTRTD5w3BdABkooULHdyiRwOZi8=;
        fh=IH606NrfZKhEdbgd1EmI/LS7WyPkNrrA9MzMZPv7E3w=;
        b=MgJe6vA75u3coyv2uMA/muM+W1EWk3YW7DvPQ2tYbtLuIaoCDbD1jSR1J0tISNA/dm
         vFTKRCQ05oRO7n79lDDcLpL+bZtlkIJ6WCySwMriofwtP/RJ2H/2J2JvotR+bOybYEd9
         w5QYB1BhMfJBX/fw7G/yCPDIChX3W0y8xc9boWRINLFfjhA4gOYhhJkH6Gb2cghnsK26
         tDiqi4Y+DduOf5PZO2Pob/+woJ28NTS5OsQiVJ25bzhvbxiWuY1GlVP69vrp+zyNLBlN
         xJ8HnyfnmtuMRYLWdrzCVmUjpVmNeMl7dLLXXxPTcOcOB2vb1N7aZUtOwBQDgRlKc4KU
         su6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772478931; x=1773083731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJK2tLWuo3dLRPC2uTRTD5w3BdABkooULHdyiRwOZi8=;
        b=Wij0XEKaReof18pMULvpRU/ZJfch3ZS49iigjnau2gw5MiFEQeuhXkdvWgd9PmPmQg
         8bu/L66wqfmb6/WmBDt8YGV24ls3mtKoPWKBf1O8Bxm7LxHU76NFpt62nlnK3rtxS+mn
         Vpzp5BvCAc8GwOJ7yw+RkjDkmRG6F8vO5rUf4vJS45LyZ3QawsaZgnb4G2tOT/yIq8he
         yFBmSEW6PayhQ/2Z8NqN8TUlZDnxOp3saViZCAIl2oCluYna38vMWEW0HgTpg4U0cvTt
         oRZW/trET9EGOiyTuO5oDW8sLjXQw+VUdWwPnA90+o7yglE6AoMopvdRm3mAfQpflxJh
         b/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772478931; x=1773083731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJK2tLWuo3dLRPC2uTRTD5w3BdABkooULHdyiRwOZi8=;
        b=o42a8ZiatIWEFvmL9yq6nfvGDWb0qTbzcu1MuNIX5KcJoVDdrvHKgZbMxUEjkc6r5K
         85p5UdaAI7LugLUWq41f7QDeLzH3524xWxdZzzSZs0feHjVMsPmReDvTTW+IgfN7eOL/
         vfq+OoVkpVW+lhjyZW0wYthKqiJsTvsXQI0GLgESjhBHXVIkmSyfeLdsUwepYYZjifQL
         ZlMxTvJFEouPcoaxhbCQ4r+ZUTev8n7tTLbsbdKr89puSfRmbo6JTFATqGOCZE89SIPZ
         EQZpo/xqPDZAz3oA4rpWixnewOSQgtoUFI6i3Z6BdYrtYfD3fymKfZ6eXvFjAiWR62Hf
         6tkw==
X-Forwarded-Encrypted: i=1; AJvYcCWc+mfyhN6fOSnxSBIu1/8VhkVnH7ON6Js9lv5c74uPJLVe0tRE7L5sX3hbVHfUU5tN59SRWa6/tBbUzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5v/TFijtdgyEbgeRA9x5HoDfe1ZhHr9RqIKwJU1e7JVJxOMpW
	DAFb0JjxRyvjiEXaDXgDDWh3XwtJPhdtCNAjxd2PUkFMLpC/OJGUes+GAIotojr1r1fqnsMsAjP
	CI/4nGIgndVoNbQmwPaKC90rIsOsDoq6HcZ+ROa0dbg==
X-Gm-Gg: ATEYQzzOJZvJ5fnueTlxJeUaH3qu8zsDoXTFQmFNzy5f6+X76pQUZN/7zO8b2KXi8Kf
	48zE16IX2dAC3zD4gmB6Vc2rU77zaNm0Bm/YrxQeMNAPg66k4Kns+9o8QQQLQy3JSKRMoOHHDJu
	U3wumiBEbwUOCaFJo3gd51fOPNW/IKachvycrVSE+9yGK+MgCZeObFdVrAGR1N7Dgdwvli8KSV6
	lwRutSsUkFTnYqpO+BjUxrIBkVEsz3RnI4gJqTnGHjdifHeMysQ3tHdeq7gRdTxbqPP7t6+T9DR
	fEQLzYTm1LcdE+VOakhZofd/dcFeD0lVWhC2og==
X-Received: by 2002:a53:4c11:0:b0:64a:dafd:2d52 with SMTP id
 956f58d0204a3-64cc22c4107mr8623719d50.63.1772478930111; Mon, 02 Mar 2026
 11:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302165932.2408181-1-eagle.alexander923@gmail.com> <177247427736.4158949.14911192456280885035@t16>
In-Reply-To: <177247427736.4158949.14911192456280885035@t16>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 2 Mar 2026 19:15:13 +0000
X-Gm-Features: AaiRm509T5oHq5nShhu6v51V_sBhD5z8kEvf_7dR-ZEGRB_mOx-8gCJ0CkYIAh0
Message-ID: <CAPY8ntBjzkcSnQ2kVV+D+qsog1o-05vshn-uQxy+bh+TPc=UCw@mail.gmail.com>
Subject: Re: [PATCH RFC] media: i2c: Add AR0234 camera sensor driver
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	Dongcheng Yan <dongcheng.yan@intel.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7DB3B1DEC1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54118-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,intel.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,mail.gmail.com:mid,ideasonboard.com:email,bootlin.com:url,raspberrypi.com:dkim,raspberrypi.com:email]
X-Rspamd-Action: no action

Hi Alexander and Issac

On Mon, 2 Mar 2026 at 17:58, Isaac Scott <isaac.scott@ideasonboard.com> wro=
te:
>
> Hi Alexander,
>
> Thank you for the patch!
>
> Sounds like a cool sensor! Some replies inline :-)

It's not a bad little ~1080p global shutter sensor.

If looking for modules then avoid Arducam's one as it's one of their
Pivariety sensors where you don't have direct access to the sensor.
I picked up one of the DepthOakAI modules which I had running with the
Pi with minor mods. It only exposes 2 data lanes though.
Soho Enterprises were also looking to make a module, but I don't know
if that ever really launched.

> Quoting Alexander Shiyan (2026-03-02 16:59:32)
> > I would like to propose a driver for the ON Semiconductor AR0234 CMOS i=
mage sensor. This driver supports 10-bit raw Bayer output at 1920x1080 reso=
lution up to 120 fps (tested with 4-lane MIPI CSI-2). It has been developed=
 and tested on a platform with 27 MHz external clock.
> > The driver is based on the initial work by Dave Stevenson and Danius Ka=
lvaitis from the Raspberry Pi team, and later extended by UAB Kurokesu. It =
also incorporates ideas from an Intel-authored version (Yan Dongcheng, Hao =
Yao) that attempted to use the latest sensor framework features. Unfortunat=
ely, neither of those external versions worked on my hardware, so I decided=
 to create this consolidated version that does work for my setup.
> >
> > Key features:
> > - Supports 10-bit raw Bayer (SGRBG10) at 1920x1200 (120 fps).

Handling 8 bit readout should be fairly simple, but based on
Application Note AND9820 table 14 it will change the clock setup.

> > - PLL configuration using the common CCS PLL framework.
> > - V4L2 controls for exposure, analogue gain, digital gain, HBLANK, VBLA=
NK, test patterns, and flips.
> > - Runtime PM support.
> > - Device tree probing.
> >
> > However, there are a few areas where I would appreciate feedback and he=
lp:
> > - V4L2_CID_PIXEL_RATE handling: I am not entirely satisfied with the cu=
rrent implementation. The pixel rate depends on the number of lanes and the=
 link frequency. Ideally it should be updated automatically when the link f=
requency changes (and when the bpp changes, though the sensor only supports=
 10-bit for now). I would like to make it a read-only control that always r=
eflects the actual pixel rate, but I'm not sure about the best way to integ=
rate it with the PLL calculations and the link_freq menu. Any guidance woul=
d be welcome.

You've probably been pushed towards that conclusion by the CCS PLL
framework, but it's generally not true.
The AR0234 datasheet confirms it has separate dividers for pixel clock
and MIPI clock (AND9820 figure 13). On almost all sensors of that form
that I've encountered there is sufficient FIFO between pixel array and
MIPI to allow the pixel array to always run at max sampling rate, and
then use horizontal blanking to give the MIPI block enough time to
send each line of that data. I've always found handling it that way
easier than trying to recompute PLL settings for all permutations.

The V4L2 ctrl core makes it read only for you anyway -
https://elixir.bootlin.com/linux/v6.19.3/source/drivers/media/v4l2-core/v4l=
2-ctrls-defs.c#L1515-L1518

A quick reread of the datasheet is bringing some of this back to me,
and reminding me why I didn't get as far as I wanted with this driver.

It references setting LINE_LENGTH_PCK in units of "pixel clocks", with
a maximum pixel clock rate of 90MHz and a minimum LINE_LENGTH_PCK of
612 clocks for 1920x1200 @ 120fps.
But 612 is less than 1920 so there is a multiplier in there, and
1920x1200 * 120fps =3D 276.48MPix/s, so that's greater than 90MHz.

A multiplier of x4 may make all the numbers fall out as line length =3D
2448 pixels (1920 active and 528 hblank) at a pixel rate of 360MPix/s.

Figure 13 then confuses me again as it has an "mlanes / 4" block in
computing the pixel clock which is unusual. I'm expecting that you
will therefore have to compute PIXEL_RATE with that factored in, and
potentially have to compensate in the values programmed in
LINE_LENGTH_PCK and FRAME_LENGTH_LINES.

Seeing "#define AR0234_HBLANK_DEF (612)" in your driver tells me that
HBLANK is not being handled correctly at the moment - that is the
minimum line length register value.

> > - V4L2_CID_LINK_FREQ support: The driver currently includes a link freq=
uency control, but it is not fully dynamic. The PLL is calculated only at p=
robe and when the link frequency is changed via the control (which is curre=
ntly disabled). I'd like to make it fully functional: when the user selects=
 a different link frequency from the menu, the PLL should be recalculated a=
nd the sensor re-initialized accordingly. However, I'm unsure how to handle=
 this cleanly. Any advice on the proper way to manage this would be greatly=
 appreciated.

Configuration of link frequencies is generally a platform level choice
for EMC purposes, so normally read the link frequencies configured by
device tree (you're not currently supporting ACPI) and adopt any
frequencies that are valid.
I've never known an application actually change the link frequency.

> > The driver is functional for my use case (1920x1200 @ 120 fps with 4 la=
nes, 27 MHz XCLK), but I believe it could be improved with community input.=
 I am sending this as an RFC to gather feedback and hopefully move towards =
a mainline-ready driver.

Have you verified it over 1 and 2 data lanes? I note that the driver
has some handling for 1, 2, or 4 lanes, but has it been tested? Can I
ask what hardware you're using too?

I'll see if I can find a few minutes to give the patch a test and
review over the next couple of weeks.

  Dave

> >
> > Thank you for any suggestions.
> >
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  drivers/media/i2c/Kconfig  |   11 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/ar0234.c | 1083 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1095 insertions(+)
> >  create mode 100644 drivers/media/i2c/ar0234.c
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 0db8a0add289..1edc2db83f73 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -62,6 +62,17 @@ config VIDEO_AP1302
> >           This is a Video4Linux2 sensor-level driver for the external
> >           ISP AP1302.
> >
> > +config VIDEO_AR0234
> > +       tristate "ON Semiconductor AR0234 sensor support"
> > +       select V4L2_CCI_I2C
> > +       select VIDEO_CCS_PLL
> > +       help
> > +         This is a Video4Linux2 sensor driver for the ON Semiconductor

I believe the company name is just "onsemi" now? Wikipedia says that
happened in 2021.

> > +         AR0234 camera.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called ar0234.
> > +
> >  config VIDEO_AR0521
> >         tristate "ON Semiconductor AR0521 sensor support"
> >         help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 905ed0f675b8..35e6ccbe16d9 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -20,6 +20,7 @@ obj-$(CONFIG_VIDEO_AK881X) +=3D ak881x.o
> >  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) +=3D alvium-csi2.o
> >  obj-$(CONFIG_VIDEO_AP1302) +=3D ap1302.o
> >  obj-$(CONFIG_VIDEO_APTINA_PLL) +=3D aptina-pll.o
> > +obj-$(CONFIG_VIDEO_AR0234) +=3D ar0234.o
> >  obj-$(CONFIG_VIDEO_AR0521) +=3D ar0521.o
> >  obj-$(CONFIG_VIDEO_BT819) +=3D bt819.o
> >  obj-$(CONFIG_VIDEO_BT856) +=3D bt856.o
> > diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> > new file mode 100644
> > index 000000000000..99f3fbef33e5
> > --- /dev/null
> > +++ b/drivers/media/i2c/ar0234.c
> > @@ -0,0 +1,1083 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for the AR0234 camera sensor from ON Semiconductor
> > + *
> > + * Written by Alexander Shiyan <eagle.alexander923@gmail.com>

This should be a copyright notice.

> > + *
> > + * Some parts of code taken from ar0234.c by:
> > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > + * Danius Kalvaitis <danius@kurokesu.com>
> > + *
> > + * Some parts of code taken from imx290.c by:
> > + * Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#include "ccs-pll.h"
> > +
> > +#define AR0234_REG_CHIP_VERSION                                CCI_REG=
16(0x3000)
> > +#      define AR0234_CHIP_ID                           (0x0a56)
> > +#      define AR0234_CHIP_ID_MONO                      (0x1a56)
> > +#define AR0234_REG_Y_ADDR_START                                CCI_REG=
16(0x3002)
> > +#define AR0234_REG_X_ADDR_START                                CCI_REG=
16(0x3004)
> > +#define AR0234_REG_Y_ADDR_END                          CCI_REG16(0x300=
6)
> > +#define AR0234_REG_X_ADDR_END                          CCI_REG16(0x300=
8)
> > +#define AR0234_REG_FRAME_LENGTH_LINES                  CCI_REG16(0x300=
a)
> > +#      define AR0234_VBLANK_MIN                        (16)
> > +#      define AR0234_VBLANK_MAX                        (0xfff0)
> > +#define AR0234_REG_LINE_LENGTH_PCK                     CCI_REG16(0x300=
c)
> > +#      define AR0234_HBLANK_MIN                        (4)
> > +#      define AR0234_HBLANK_DEF                        (612)
> > +#      define AR0234_HBLANK_MAX                        (0xfff0)
> > +#define AR0234_REG_REVISION_NUMBER                     CCI_REG16(0x300=
e)
> > +#define AR0234_REG_LOCK_CONTROL                                CCI_REG=
16(0x3010)
> > +#      define LOCK_CONTROL_MAGIC                       (0xbeef)
> > +#define AR0234_REG_COARSE_INTEGRATION_TIME             CCI_REG16(0x301=
2)
> > +#      define AR0234_EXPOSURE_MIN                      (2)
> > +#      define AR0234_EXPOSURE_STEP                     (1)
> > +#define AR0234_REG_FINE_INTEGRATION_TIME               CCI_REG16(0x301=
4)
> > +#define AR0234_REG_RESET                               CCI_REG16(0x301=
a)
> > +#define AR0234_REG_MODE_SELECT                         CCI_REG8(0x301c=
)
> > +#define AR0234_REG_IMAGE_ORIENTATION                   CCI_REG8(0x301d=
)
> > +#define AR0234_REG_GROUPED_PARAMETER_HOLD              CCI_REG8(0x3022=
)
> > +#define AR0234_REG_VT_PIX_CLK_DIV                      CCI_REG16(0x302=
a)
> > +#define AR0234_REG_VT_SYS_CLK_DIV                      CCI_REG16(0x302=
c)
> > +#define AR0234_REG_PRE_PLL_CLK_DIV                     CCI_REG16(0x302=
e)
> > +#define AR0234_REG_PLL_MULTIPLIER                      CCI_REG16(0x303=
0)
> > +#define AR0234_REG_OP_PIX_CLK_DIV                      CCI_REG16(0x303=
6)
> > +#define AR0234_REG_OP_SYS_CLK_DIV                      CCI_REG16(0x303=
8)
> > +#define AR0234_REG_GLOBAL_GAIN                         CCI_REG16(0x305=
e)
> > +#      define AR0234_DGTL_GAIN_MIN                     (0x0080)
> > +#      define AR0234_DGTL_GAIN_MAX                     (0x07ff)
> > +#      define AR0234_DGTL_GAIN_DEFAULT                 (0x0080)
> > +#      define AR0234_DGTL_GAIN_STEP                    (1)
> > +#define AR0234_REG_ANALOG_GAIN                         CCI_REG16(0x306=
0)
> > +#      define AR0234_ANA_GAIN_BASE                     (64)
> > +#      define AR0234_ANA_GAIN_MIN                      (AR0234_ANA_GAI=
N_BASE)
> > +#      define AR0234_ANA_GAIN_MAX                      (16 * AR0234_AN=
A_GAIN_BASE)
> > +#      define AR0234_ANA_GAIN_STEP                     (1)
> > +#      define AR0234_ANA_GAIN_DEFAULT                  (AR0234_ANA_GAI=
N_BASE)
> > +#define AR0234_REG_TEST_PATTERN_MODE                   CCI_REG16(0x307=
0)
> > +#      define AR0234_TEST_PATTERN_DISABLED             (0)
> > +#      define AR0234_TEST_PATTERN_SOLID_COLOR          (1)
> > +#      define AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS  (2)
> > +#      define AR0234_TEST_PATTERN_FADE_TO_GREY         (3)
> > +#      define AR0234_TEST_PATTERN_WALKING_1S           (256)
> > +#define AR0234_REG_TEST_DATA_RED                       CCI_REG16(0x307=
2)
> > +#define AR0234_REG_TEST_DATA_GREENR                    CCI_REG16(0x307=
4)
> > +#define AR0234_REG_TEST_DATA_BLUE                      CCI_REG16(0x307=
6)
> > +#define AR0234_REG_TEST_DATA_GREENB                    CCI_REG16(0x307=
8)
> > +#      define AR0234_TESTP_COLOUR_MIN                  (0)
> > +#      define AR0234_TESTP_COLOUR_MAX                  (0x3ff)
> > +#      define AR0234_TESTP_COLOUR_STEP                 (1)
> > +#define AR0234_REG_MFR_30BA                            CCI_REG16(0x30b=
a)
> > +#      define AR0234_MFR_30BA_GAIN_BITS(x)             (0x7620 | (x))
> > +#define AR0234_REG_DATA_FORMAT_BITS                    CCI_REG16(0x31a=
c)
> > +#      define DATA_FORMAT_BITS(x)                      (((x) << 8) | (=
x))
> > +#define AR0234_REG_SERIAL_FORMAT                       CCI_REG16(0x31a=
e)
> > +#      define DATA_FORMAT_LINES(x)                     (0x200 | (x))
> > +
> > +#define AR0234_NATIVE_WIDTH                            (1940U)
> > +#define AR0234_NATIVE_HEIGHT                           (1220U)
> > +#define AR0234_PIXEL_ARRAY_WIDTH                       (1920U)
> > +#define AR0234_PIXEL_ARRAY_HEIGHT                      (1200U)
> > +
> > +struct reg_list {
> > +       u32 num_of_regs;
> > +       const struct cci_reg_sequence *regs;
> > +};
> > +
> > +struct ar0234_format {
> > +       unsigned int width;
> > +       unsigned int height;
> > +       struct reg_list reg_list;
> > +};
> > +
> > +static const struct cci_reg_sequence ar0234_common_init[] =3D {
> > +       { AR0234_REG_FINE_INTEGRATION_TIME, 0 },
> > +};
> > +
> > +static const struct cci_reg_sequence ar0234_1920x1200[] =3D {
> > +       { AR0234_REG_X_ADDR_START, 8 },
> > +       { AR0234_REG_Y_ADDR_START, 8 },
> > +       { AR0234_REG_X_ADDR_END, AR0234_PIXEL_ARRAY_WIDTH + 8 - 1 },
> > +       { AR0234_REG_Y_ADDR_END, AR0234_PIXEL_ARRAY_HEIGHT + 8 - 1 },
> > +};
> > +
> > +static const char *const ar0234_test_pattern_menu[] =3D {
> > +       "Disabled",
> > +       "Solid Color",
> > +       "Vertical Color Bars",
> > +       "Fade to Grey Vertical Color Bars",
> > +       "Walking 1s",
> > +};
> > +
> > +static const unsigned int ar0234_test_pattern_val[] =3D {
> > +       AR0234_TEST_PATTERN_DISABLED,
> > +       AR0234_TEST_PATTERN_SOLID_COLOR,
> > +       AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS,
> > +       AR0234_TEST_PATTERN_FADE_TO_GREY,
> > +       AR0234_TEST_PATTERN_WALKING_1S,
> > +};
> > +
> > +static const char *const ar0234_supply_names[] =3D {
> > +       "vana",
> > +       "vdig",
> > +       "vddl",
> > +};
> > +
> > +static const struct ar0234_format ar0234_formats[] =3D {
> > +       {
> > +               .width =3D 1920,
> > +               .height =3D 1200,
> > +               .reg_list =3D {
> > +                       .regs =3D ar0234_1920x1200,
> > +                       .num_of_regs =3D ARRAY_SIZE(ar0234_1920x1200),
> > +               },
> > +       },
> > +};
> > +
> > +enum ar0234_colour_variant {
> > +       AR0234_VARIANT_COLOUR,
> > +       AR0234_VARIANT_MONO,
> > +       AR0234_VARIANT_MAX
> > +};
> > +
> > +struct ar0234_mode {
> > +       u8 bpp;
> > +       u32 code[AR0234_VARIANT_MAX];
> > +};
> > +
> > +static const struct ar0234_mode ar0234_modes[] =3D {
> > +       {
> > +               .bpp =3D 10,
> > +               .code =3D {
> > +                       [AR0234_VARIANT_COLOUR] =3D MEDIA_BUS_FMT_SGRBG=
10_1X10,
> > +                       [AR0234_VARIANT_MONO] =3D MEDIA_BUS_FMT_Y10_1X1=
0,
> > +               },
> > +       },
> > +};
> > +
> > +static const s64 link_freqs[] =3D {
> > +       450000000LL,
> > +};
> > +
> > +struct ar0234 {
> > +       struct device *dev;
> > +       struct clk *clk;
> > +       struct regmap *regmap;
> > +
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +
> > +       struct regulator_bulk_data supplies[ARRAY_SIZE(ar0234_supply_na=
mes)];
> > +       struct gpio_desc *reset;
> > +
> > +       unsigned int num_data_lanes;
> > +
> > +       unsigned long link_freq_bitmap;
> > +
> > +       enum ar0234_colour_variant variant;
> > +
> > +       struct ccs_pll pll;
> > +
> > +       struct ar0234_mode const *mode;
> > +       struct ar0234_format const *format;
> > +
> > +       struct v4l2_ctrl_handler ctrls;
> > +
> > +       struct v4l2_ctrl *hblank;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *link_freq;
> > +       struct v4l2_ctrl *pixel_rate;
> > +       struct v4l2_ctrl *a_gain;
> > +       struct {
> > +               struct v4l2_ctrl *hflip;
> > +               struct v4l2_ctrl *vflip;
> > +       };
> > +};
> > +
> > +static inline struct ar0234 *to_ar0234(struct v4l2_subdev *_sd)
> > +{
> > +       return container_of(_sd, struct ar0234, sd);
> > +}
> > +
> > +static const struct ccs_pll_limits ar0234_pll_limits =3D {
> > +       .min_ext_clk_freq_hz =3D 6000000,
> > +       .max_ext_clk_freq_hz =3D 54000000,
> > +       .vt_fr =3D {
> > +               .min_pre_pll_clk_div =3D 1,
> > +               .max_pre_pll_clk_div =3D 63,
> > +               .min_pll_ip_clk_freq_hz =3D 1500000,
> > +               .max_pll_ip_clk_freq_hz =3D 12000000,
> > +               .min_pll_multiplier =3D 2,
> > +               .max_pll_multiplier =3D 254,
> > +               .min_pll_op_clk_freq_hz =3D 384000000,
> > +               .max_pll_op_clk_freq_hz =3D 768000000,
> > +       },
> > +       .vt_bk =3D {
> > +               .min_sys_clk_div =3D 1,
> > +               .max_sys_clk_div =3D 63,
> > +               .min_sys_clk_freq_hz =3D 45000000,
> > +               .max_sys_clk_freq_hz =3D 768000000,
> > +               .min_pix_clk_div =3D 1,
> > +               .max_pix_clk_div =3D 63,
> > +               .min_pix_clk_freq_hz =3D 45000000,
> > +               .max_pix_clk_freq_hz =3D 90000000,
> > +       },
> > +       .op_bk =3D {
> > +               .min_sys_clk_div =3D 1,
> > +               .max_sys_clk_div =3D 63,
> > +               .min_sys_clk_freq_hz =3D 45000000,
> > +               .max_sys_clk_freq_hz =3D 768000000,
> > +               .min_pix_clk_div =3D 1,
> > +               .max_pix_clk_div =3D 63,
> > +               .min_pix_clk_freq_hz =3D 45000000,
> > +               .max_pix_clk_freq_hz =3D 90000000,
> > +       },
> > +};
> > +
> > +static int ar0234_calculate_pll(struct ar0234 *ar0234)
> > +{
> > +       memset(&ar0234->pll, 0, sizeof(ar0234->pll));
> > +
> > +       ar0234->pll.bus_type =3D CCS_PLL_BUS_TYPE_CSI2_DPHY;
> > +       ar0234->pll.op_lanes =3D ar0234->num_data_lanes;
> > +       ar0234->pll.vt_lanes =3D 1;
> > +       ar0234->pll.csi2.lanes =3D ar0234->num_data_lanes;
> > +       ar0234->pll.binning_horizontal =3D 1;
> > +       ar0234->pll.binning_vertical =3D 1;
> > +       ar0234->pll.scale_m =3D 1;
> > +       ar0234->pll.scale_n =3D 1;
> > +       ar0234->pll.bits_per_pixel =3D ar0234->mode->bpp;
> > +       ar0234->pll.flags =3D CCS_PLL_FLAG_LANE_SPEED_MODEL |
> > +                           CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER |
> > +                           CCS_PLL_FLAG_FIFO_DERATING |
> > +                           CCS_PLL_FLAG_FIFO_OVERRATING |
> > +                           CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
> > +       ar0234->pll.link_freq =3D link_freqs[__ffs(ar0234->link_freq_bi=
tmap)];
> > +       ar0234->pll.link_freq /=3D 2;
> > +       ar0234->pll.ext_clk_freq_hz =3D clk_get_rate(ar0234->clk);
> > +
> > +       return ccs_pll_calculate(ar0234->dev, &ar0234_pll_limits, &ar02=
34->pll);
> > +}
> > +
> > +static u32 ar0234_calc_analog_gain(u32 req_gain_q6, u32 *reg_val)
> > +{
> > +       u32 s, t;
> > +       u32 best_gain =3D 0;
> > +       u32 best_reg =3D 0;
> > +       u32 min_diff =3D U32_MAX;
> > +       u32 coarse_mult, fine_gain_q6, total_gain_q6, diff;
> > +
> > +       for (s =3D 0; s <=3D 4; s++) {
> > +               coarse_mult =3D (1 << s) * AR0234_ANA_GAIN_BASE;
> > +
> > +               for (t =3D 0; t <=3D 15; t++) {
> > +                       if (s =3D=3D 0 || s =3D=3D 2) {
> > +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE =
* 32) / (32 - t);
> > +                       } else if (s =3D=3D 1 || s =3D=3D 3) {
> > +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE =
* 16) / (16 - (t / 2));
> > +                       } else {
> > +                               fine_gain_q6 =3D (AR0234_ANA_GAIN_BASE =
* 8) / (8 - (t / 4));
> > +                       }
> > +
> > +                       total_gain_q6 =3D (coarse_mult * fine_gain_q6) =
/ AR0234_ANA_GAIN_BASE;
> > +
> > +                       if (req_gain_q6 > total_gain_q6)
> > +                               diff =3D req_gain_q6 - total_gain_q6;
> > +                       else
> > +                               diff =3D total_gain_q6 - req_gain_q6;
> > +
> > +                       if (diff < min_diff) {
> > +                               min_diff =3D diff;
> > +                               best_gain =3D total_gain_q6;
> > +                               best_reg =3D (s << 4) | t;
> > +                       }
> > +               }
> > +       }
> > +
> > +       *reg_val =3D best_reg;
> > +
> > +       return best_gain;
> > +}
> > +
> > +static int ar0234_set_mfr_30ba(struct ar0234 *ar0234, u32 analog_reg_v=
al)
> > +{
> > +       u16 mfr_30ba_val;
> > +       u32 coarse_idx =3D (analog_reg_val >> 4) & 0x7;
> > +
> > +       if (ar0234->pll.pixel_rate_pixel_array <=3D 45000000) {
> > +               if (coarse_idx < 3)
> > +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(6);
> > +               else
> > +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(0);
> > +       } else {
> > +               if (coarse_idx =3D=3D 0)
> > +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(2);
> > +               else if (coarse_idx =3D=3D 1)
> > +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(1);
> > +               else
> > +                       mfr_30ba_val =3D AR0234_MFR_30BA_GAIN_BITS(0);
> > +       }
> > +
> > +       return cci_write(ar0234->regmap, AR0234_REG_MFR_30BA, mfr_30ba_=
val, NULL);
> > +}
> > +
> > +static int ar0234_set_analog_gain(struct ar0234 *ar0234, u64 val)
> > +{
> > +       u32 reg_val, actual_gain;
> > +       int ret;
> > +
> > +       actual_gain =3D ar0234_calc_analog_gain(val, &reg_val);
> > +
> > +       if (actual_gain !=3D val) {
> > +               __v4l2_ctrl_modify_range(ar0234->a_gain, AR0234_ANA_GAI=
N_MIN,
> > +                                        AR0234_ANA_GAIN_MAX,
> > +                                        AR0234_ANA_GAIN_STEP, actual_g=
ain);
> > +               __v4l2_ctrl_s_ctrl(ar0234->a_gain, actual_gain);
> > +       }
> > +
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_=
HOLD,
> > +                       1, NULL);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D ar0234_set_mfr_30ba(ar0234, reg_val);
> > +       if (!ret)
> > +               ret =3D cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAI=
N,
> > +                               reg_val, NULL);
>
> With cci_write(), it's possible most of the time to pass ret into the
> last parameter instead of NULL:
>
>         if (!ret)
>                 cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
>                           reg_val, &ret);
>
> You can then pass the same ret into other calls to cci_write, and if one
> of the writes fails, it will not attempt the next one.
>
> > +
> > +       cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD, 0,=
 NULL);
> > +
> > +       return ret;
> > +}
> > +
>
> <snip>
>
> > +{
> > +       return cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, !!on, =
 NULL);
> > +}
> > +
> > +static int ar0234_start_streaming(struct ar0234 *ar0234)
> > +{
> > +       int ret;
> > +
> > +       ret =3D pm_runtime_resume_and_get(ar0234->dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +//     pr_info("vt_fr.pre_pll_clk_div %i\n", ar0234->pll.vt_fr.pre_pll=
_clk_div);
> > +//     pr_info("vt_fr.pll_multiplier %i\n", ar0234->pll.vt_fr.pll_mult=
iplier);
> > +
> > +//     pr_info("vt_bk.sys_clk_div %i\n", ar0234->pll.vt_bk.sys_clk_div=
);
> > +//     pr_info("vt_bk.pix_clk_div %i\n", ar0234->pll.vt_bk.pix_clk_div=
);
> > +
> > +//     pr_info("op_bk.pix_clk_div %i\n", ar0234->pll.op_bk.pix_clk_div=
);
> > +//     pr_info("op_bk.sys_clk_div %i\n", ar0234->pll.op_bk.sys_clk_div=
);
> > +
> > +//     pr_info("pixel_rate_csi %u\n", ar0234->pll.pixel_rate_csi);
> > +//     pr_info("pixel_rate_pixel_array %u\n", ar0234->pll.pixel_rate_p=
ixel_array);
> > +
>
> Can we please drop these commented out pr_info's?
>
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
> > +                       ar0234->pll.vt_fr.pre_pll_clk_div, NULL);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
> > +                       ar0234->pll.vt_fr.pll_multiplier, &ret);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
> > +                       ar0234->pll.vt_bk.sys_clk_div, &ret);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
> > +                       ar0234->pll.vt_bk.pix_clk_div, &ret);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
> > +                       ar0234->pll.op_bk.sys_clk_div, &ret);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
> > +                       ar0234->pll.op_bk.pix_clk_div, &ret);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Failed to setup PLL\n");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D cci_multi_reg_write(ar0234->regmap, ar0234_common_init,
> > +                                 ARRAY_SIZE(ar0234_common_init), NULL)=
;
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_DATA_FORMAT_BITS,
> > +                       DATA_FORMAT_BITS(ar0234->mode->bpp), &ret);
> > +       ret =3D cci_write(ar0234->regmap, AR0234_REG_SERIAL_FORMAT,
> > +                       DATA_FORMAT_LINES(ar0234->num_data_lanes), &ret=
);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Failed to set common settings\n")=
;
> > +               return ret;
> > +       }
> > +
> > +       ret =3D cci_multi_reg_write(ar0234->regmap, ar0234->format->reg=
_list.regs,
> > +                                 ar0234->format->reg_list.num_of_regs,=
 NULL);
> > +
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Failed to set frame format\n");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return ar0234_set_stream(ar0234, true);
> > +}
>
> Best wishes,
>
> Isaac
>
> > +
> > +static void ar0234_stop_streaming(struct ar0234 *ar0234)
> > +{
> > +       if (ar0234_set_stream(ar0234, false))
> > +               dev_err(ar0234->dev, "Failed to set stream\n");
> > +
> > +       pm_runtime_put_autosuspend(ar0234->dev);
> > +}
> > +
> > +static int ar0234_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +       struct v4l2_subdev_state *state;
> > +       int ret =3D 0;
> > +
> > +       state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > +
> > +       if (enable)
> > +               ret =3D ar0234_start_streaming(ar0234);
> > +       else
> > +               ar0234_stop_streaming(ar0234);
> > +
> > +       v4l2_subdev_unlock_state(state);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ar0234_g_mbus_config(struct v4l2_subdev *sd, unsigned int p=
ad_id,
> > +                               struct v4l2_mbus_config *config)
> > +{
> > +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +
> > +       config->type =3D V4L2_MBUS_CSI2_DPHY;
> > +       config->bus.mipi_csi2.flags =3D V4L2_MBUS_CSI2_NONCONTINUOUS_CL=
OCK;
> > +       config->bus.mipi_csi2.num_data_lanes =3D ar0234->num_data_lanes=
;
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ar0234_video_ops =3D {
> > +       .s_stream =3D ar0234_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ar0234_pad_ops =3D {
> > +       .enum_mbus_code =3D ar0234_enum_mbus_code,
> > +       .enum_frame_size =3D ar0234_enum_frame_size,
> > +       .get_fmt =3D v4l2_subdev_get_fmt,
> > +       .set_fmt =3D ar0234_set_pad_format,
> > +       .get_selection =3D ar0234_get_selection,
> > +       .get_mbus_config =3D ar0234_g_mbus_config,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ar0234_subdev_ops =3D {
> > +       .video =3D &ar0234_video_ops,
> > +       .pad =3D &ar0234_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ar0234_internal_ops =3D {
> > +       .init_state =3D ar0234_init_state,
> > +};
> > +
> > +static int ar0234_ctrls_init(struct ar0234 *ar0234)
> > +{
> > +       struct v4l2_fwnode_device_properties props;
> > +       int i, ret;
> > +
> > +       ret =3D v4l2_fwnode_device_parse(ar0234->dev, &props);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D v4l2_ctrl_handler_init(&ar0234->ctrls, 14);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ar0234->hblank =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ct=
rl_ops,
> > +                                          V4L2_CID_HBLANK, 0,
> > +                                          AR0234_HBLANK_MAX, 2, 0);
> > +
> > +       ar0234->vblank =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ct=
rl_ops,
> > +                                          V4L2_CID_VBLANK, 0,
> > +                                          AR0234_VBLANK_MAX, 1, 0);
> > +
> > +       ar0234->exposure =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_=
ctrl_ops,
> > +                                            V4L2_CID_EXPOSURE,
> > +                                            AR0234_EXPOSURE_MIN, U16_M=
AX,
> > +                                            AR0234_EXPOSURE_STEP, 200)=
;
> > +
> > +       ar0234->pixel_rate =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar023=
4_ctrl_ops,
> > +                                              V4L2_CID_PIXEL_RATE, 1,
> > +                                              INT_MAX, 1, 1);
> > +
> > +       ar0234->a_gain =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ct=
rl_ops,
> > +                                          V4L2_CID_ANALOGUE_GAIN,
> > +                                          AR0234_ANA_GAIN_MIN,
> > +                                          AR0234_ANA_GAIN_MAX,
> > +                                          AR0234_ANA_GAIN_STEP,
> > +                                          AR0234_ANA_GAIN_DEFAULT);
> > +
> > +       v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> > +                         V4L2_CID_DIGITAL_GAIN, AR0234_DGTL_GAIN_MIN,
> > +                         AR0234_DGTL_GAIN_MAX, AR0234_DGTL_GAIN_STEP,
> > +                         AR0234_DGTL_GAIN_DEFAULT);
> > +
> > +       ar0234->hflip =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctr=
l_ops,
> > +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +       ar0234->vflip =3D v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctr=
l_ops,
> > +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +       v4l2_ctrl_cluster(2, &ar0234->hflip);
> > +
> > +       v4l2_ctrl_new_std_menu_items(&ar0234->ctrls, &ar0234_ctrl_ops,
> > +                                    V4L2_CID_TEST_PATTERN,
> > +                                    ARRAY_SIZE(ar0234_test_pattern_men=
u) - 1,
> > +                                    0, 0, ar0234_test_pattern_menu);
> > +
> > +       for (i =3D 0; i < 4; i++) {
> > +               v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> > +                                 V4L2_CID_TEST_PATTERN_RED + i,
> > +                                 AR0234_TESTP_COLOUR_MIN,
> > +                                 AR0234_TESTP_COLOUR_MAX,
> > +                                 AR0234_TESTP_COLOUR_STEP,
> > +                                 AR0234_TESTP_COLOUR_MAX);
> > +       }
> > +
> > +       ar0234->link_freq =3D v4l2_ctrl_new_int_menu(&ar0234->ctrls, &a=
r0234_ctrl_ops,
> > +                                                  V4L2_CID_LINK_FREQ,
> > +                                                  __fls(ar0234->link_f=
req_bitmap),
> > +                                                  __ffs(ar0234->link_f=
req_bitmap),
> > +                                                  link_freqs);
> > +       if (ar0234->link_freq)
> > +               ar0234->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +       v4l2_ctrl_new_fwnode_properties(&ar0234->ctrls, &ar0234_ctrl_op=
s,
> > +                                       &props);
> > +
> > +       if (ar0234->ctrls.error)
> > +               return dev_err_probe(ar0234->dev, ar0234->ctrls.error,
> > +                                    "Failed to add controls\n");
> > +
> > +       ar0234->sd.ctrl_handler =3D &ar0234->ctrls;
> > +
> > +       ar0234_set_framing_limits(ar0234);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ar0234_parse_hw_config(struct ar0234 *ar0234)
> > +{
> > +       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +       };
> > +       struct fwnode_handle *ep;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(ar0234->supplies); i++)
> > +               ar0234->supplies[i].supply =3D ar0234_supply_names[i];
> > +
> > +       ret =3D devm_regulator_bulk_get(ar0234->dev,
> > +                                     ARRAY_SIZE(ar0234->supplies),
> > +                                     ar0234->supplies);
> > +       if (ret)
> > +               return dev_err_probe(ar0234->dev, ret,
> > +                                    "Failed to get supplies\n");
> > +
> > +       ar0234->reset =3D devm_gpiod_get_optional(ar0234->dev, "reset",
> > +                                               GPIOD_OUT_HIGH);
> > +       if (IS_ERR(ar0234->reset))
> > +               return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->reset=
),
> > +                                    "Failed to get reset GPIO\n");
> > +
> > +       ar0234->clk =3D devm_clk_get(ar0234->dev, NULL);
> > +       if (IS_ERR(ar0234->clk))
> > +               return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->clk),
> > +                                    "Failed to get clock\n");
> > +
> > +       ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(ar0234->dev), =
NULL);
> > +       if (!ep)
> > +               return -ENXIO;
> > +
> > +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +       fwnode_handle_put(ep);
> > +       if (ret)
> > +               return ret;
> > +
> > +       switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> > +       case 1:
> > +       case 2:
> > +       case 4:
> > +               ar0234->num_data_lanes =3D bus_cfg.bus.mipi_csi2.num_da=
ta_lanes;
> > +               break;
> > +       default:
> > +               ret =3D dev_err_probe(ar0234->dev, -EINVAL,
> > +                                   "Invalid number of CSI2 data lanes =
%d\n",
> > +                     bus_cfg.bus.mipi_csi2.num_data_lanes);
> > +               goto done_endpoint_free;
> > +       }
> > +
> > +       ret =3D v4l2_link_freq_to_bitmap(ar0234->dev, bus_cfg.link_freq=
uencies,
> > +                                      bus_cfg.nr_of_link_frequencies,
> > +                                      link_freqs, ARRAY_SIZE(link_freq=
s),
> > +                                      &ar0234->link_freq_bitmap);
> > +       if (!ret && !ar0234->link_freq_bitmap)
> > +               ret =3D -EINVAL;
> > +
> > +done_endpoint_free:
> > +       v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ar0234_identify_module(struct ar0234 *ar0234)
> > +{
> > +       u64 id, rev;
> > +       int ret;
> > +
> > +       ret =3D cci_read(ar0234->regmap, AR0234_REG_CHIP_VERSION, &id, =
NULL);
> > +       ret =3D cci_read(ar0234->regmap, AR0234_REG_REVISION_NUMBER, &r=
ev, &ret);
> > +       if (ret)
> > +               return dev_err_probe(ar0234->dev, ret,
> > +                                    "Failed to read chip id\n");
> > +
> > +       if (id =3D=3D AR0234_CHIP_ID_MONO)
> > +               ar0234->variant =3D AR0234_VARIANT_MONO;
> > +       else if (id =3D=3D AR0234_CHIP_ID)
> > +               ar0234->variant =3D AR0234_VARIANT_COLOUR;
> > +       else
> > +               return dev_err_probe(ar0234->dev, -ENODEV,
> > +                                    "Invalid chip id: 0x%04x\n", (u16)=
id);
> > +
> > +       dev_info(ar0234->dev, "Success reading chip id: 0x%04x, Rev.%ll=
d\n",
> > +                (u16)id, (rev >> 12) & 0xf);
> > +
> > +       return ret;
> > +}
> > +
> > +static int ar0234_power_on(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +       int ret;
> > +
> > +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ar0234->supplies),
> > +                                   ar0234->supplies);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Failed to enable regulators\n");
> > +               return ret;
> > +       }
> > +
> > +       ret =3D clk_prepare_enable(ar0234->clk);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Failed to enable clock\n");
> > +               regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
> > +                                      ar0234->supplies);
> > +               return ret;
> > +       }
> > +
> > +       gpiod_set_value_cansleep(ar0234->reset, 1);
> > +       /* ~160000 EXTCLKs */
> > +       usleep_range(27000, 28000);
> > +
> > +       return 0;
> > +}
> > +
> > +static int ar0234_power_off(struct device *dev)
> > +{
> > +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +
> > +       gpiod_set_value_cansleep(ar0234->reset, 0);
> > +       regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->su=
pplies);
> > +       clk_disable_unprepare(ar0234->clk);
> > +       /* 100ms PwrDown until next PwrUp */
> > +       usleep_range(100000, 110000);
> > +
> > +       return 0;
> > +}
> > +
> > +static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
> > +{
> > +       media_entity_cleanup(&ar0234->sd.entity);
> > +       v4l2_ctrl_handler_free(&ar0234->ctrls);
> > +}
> > +
> > +static int ar0234_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev =3D &client->dev;
> > +       struct ar0234 *ar0234;
> > +       int ret;
> > +
> > +       ar0234 =3D devm_kzalloc(dev, sizeof(*ar0234), GFP_KERNEL);
> > +       if (!ar0234)
> > +               return -ENOMEM;
> > +
> > +       ar0234->dev =3D dev;
> > +
> > +       ar0234->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(ar0234->regmap))
> > +               return PTR_ERR(ar0234->regmap);
> > +
> > +       ret =3D ar0234_parse_hw_config(ar0234);
> > +       if (ret)
> > +               return ret;
> > +
> > +       v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
> > +
> > +       ret =3D ar0234_power_on(dev);
> > +       if (ret)
> > +               goto err_subdev;
> > +
> > +       pm_runtime_set_active(dev);
> > +       pm_runtime_get_noresume(dev);
> > +       pm_runtime_enable(dev);
> > +       pm_runtime_set_autosuspend_delay(dev, 1000);
> > +       pm_runtime_use_autosuspend(dev);
> > +
> > +       ret =3D ar0234_soft_reset(ar0234);
> > +       if (ret)
> > +               goto error_pm;
> > +
> > +       ret =3D ar0234_identify_module(ar0234);
> > +       if (ret)
> > +               goto error_pm;
> > +
> > +       ar0234->mode =3D &ar0234_modes[0];
> > +       ar0234->format =3D &ar0234_formats[0];
> > +
> > +       ret =3D ar0234_calculate_pll(ar0234);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "PLL calculations failed: %d\n", r=
et);
> > +               goto error_pm;
> > +       }
> > +
> > +       ret =3D ar0234_ctrls_init(ar0234);
> > +       if (ret)
> > +               goto error_pm;
> > +
> > +       ar0234->sd.internal_ops =3D &ar0234_internal_ops;
> > +       ar0234->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +       ar0234->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       ar0234->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +       ret =3D media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->=
pad);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to init entity pads: %d\n", ret);
> > +               goto error_pm;
> > +       }
> > +
> > +       ar0234->sd.state_lock =3D ar0234->ctrls.lock;
> > +
> > +       ret =3D v4l2_subdev_init_finalize(&ar0234->sd);
> > +       if (ret) {
> > +               dev_err(ar0234->dev, "Subdev init error\n");
> > +               goto error_media;
> > +       }
> > +
> > +       ret =3D v4l2_async_register_subdev_sensor(&ar0234->sd);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to register sensor sub-device: %d\=
n", ret);
> > +               goto error_media;
> > +       }
> > +
> > +       pm_runtime_put_autosuspend(dev);
> > +
> > +       return 0;
> > +
> > +error_media:
> > +       media_entity_cleanup(&ar0234->sd.entity);
> > +
> > +error_pm:
> > +       pm_runtime_disable(ar0234->dev);
> > +       pm_runtime_put_noidle(ar0234->dev);
> > +       ar0234_power_off(ar0234->dev);
> > +
> > +err_subdev:
> > +       ar0234_subdev_cleanup(ar0234);
> > +
> > +       return ret;
> > +}
> > +
> > +static void ar0234_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       ar0234_subdev_cleanup(ar0234);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               ar0234_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct of_device_id ar0234_dt_ids[] =3D {
> > +       { .compatible =3D "onnn,ar0234cs" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ar0234_dt_ids);
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(ar0234_pm_ops, ar0234_power_off,
> > +                                ar0234_power_on, NULL);
> > +
> > +static struct i2c_driver ar0234_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "ar0234",
> > +               .of_match_table =3D ar0234_dt_ids,
> > +               .pm =3D pm_ptr(&ar0234_pm_ops),
> > +       },
> > +       .probe =3D ar0234_probe,
> > +       .remove =3D ar0234_remove,
> > +};
> > +module_i2c_driver(ar0234_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Onsemi AR0234 Camera Sensor Driver");
> > +MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.52.0
> >
> >

