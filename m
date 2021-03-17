Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6220133E97F
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 07:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhCQGEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 02:04:55 -0400
Received: from ni.piap.pl ([195.187.100.5]:46980 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229487AbhCQGEu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 02:04:50 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 8B0354439A5;
        Wed, 17 Mar 2021 07:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8B0354439A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1615961088; bh=0Z5IPGz9cvjV8sZVii0MLg/lpPvIGo80jQWyw1dZyN0=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=J1ZV7c0U6OCjum943Taf5eWLh5CGfLaGhXz3CvKBBiSkzU3T5jTX9NcIthsxeKLZN
         49bpJiwiG76IzO57i7g4Dj1sYOvTkeXIduu/Bix12u2l4KomGw77hUL+JFr74Yz5GJ
         hExfzH55XDQt8vSwwDUwd70cdroNjxuTtWi8OhfU=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: RFC: MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3mtv3s01z.fsf@t19.piap.pl>
        <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Wed, 17 Mar 2021 07:04:48 +0100
In-Reply-To: <YFEE3WYdECCQRYxl@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 16 Mar 2021 21:19:57 +0200")
Message-ID: <m35z1qs4cf.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> Is there a reliable way to include national unicode characters in the
>> kernel sources?
>
> It depends where. In comments it shouldn't be a problem. In C code, I
> don't think the compiler will be too happy.

I meant in comments, sure. And in stuff like MODULE_AUTHOR.
I know gcc will handle it correctly, but the problem is getting
the unicode characters right through mail.

> Signed-off-by means that you have the right to submit the code for
> upstreaming, so it should be included in patches under review too.
> Otherwise it's a waste of time for reviewers to review something that
> may never be resubmitted with an SoB line.

I know. I obviously have rights to upstream this code. The problem is
when I publish a patch with a SOB line, anyone can take it, "make
a derivative work" (so to speak), and submit as his own. The new patch
doesn't need to be an improvement, the changes from the original are not
even looked upon. Been there BTW.

>> +#define AR0521_WIDTH_MIN	       8u
>
> We usually use an uppercase U suffix.
>> +#define AR0521_REG_RESET			0x301A
>
> But lowercase hex values. I know, lots of tribal (and sometimes
> arbitrary) knowledge :-S

Right. Is there a consensus about it?
I use lowercase U because it contrasts with "uppercase" digits, and
uppercase hex letter for consistency with (decimal) digits, but I can
change it if it's only me.

>> +	regs[0] =3D AR0521_REG_GREEN1_GAIN;
>> +	regs[1] =3D green << 7 | analog;
>> +	regs[2] =3D blue  << 7 | analog;
>> +	regs[3] =3D red   << 7 | analog;
>> +	regs[4] =3D green << 7 | analog;
>> +
>> +	return ar0521_write_regs(sensor, regs, ARRAY_SIZE(regs));
>
> Passing the values in an array, with the first entry being a register
> address, is a really weird API. I'd recommend either using regmap (may
> be overkill here), or use a write function that takes the register
> address and value as separate arguments. If we want to avoid sending the
> register address for each write as a performance improvement, we'll have
> to figure out what a good API would be to do so, but more importantly,
> it would be good to have numbers to justify why this would be needed.

It's a slow I^2C device. Doing a single write transfer is faster than
a series of transfers, especially on a busy bus. Do I really have to
justify why I like a faster and more efficient code?
And it's not a big API, it's just a small internal driver subroutine.
Would splitting it to several ar0521_write_reg() be better, e.g. more
readable?

>> +static int ar0521_set_mode(struct ar0521_dev *sensor)
>> +{
>> +	unsigned int speed_mod =3D 4 / lanes(sensor); /* 1 with 4 DDR lanes */
>> +	u64 pix_clk;
>> +	u32 pixels, pll2, num, denom, new_total_height, new_pixels;
>> +	u16 total_width, total_height, x, y, pre, mult, pre2, mult2, extra_del=
ay;
>> +	u16 regs[9];
>> +	int ret;
>> +
>> +	/* stop streaming first */
>> +	ret =3D ar0521_write_reg(sensor, AR0521_REG_RESET, AR0521_REG_RESET_DE=
FAULTS);
>
> set_format isn't supposed to stop streaming implicitly. It should
> instead return -EBUSY if the stream if running.

It doesn't stop permanently, it's restarted after the registers are
updated. No need for -EBUSY here.

>> +static int ar0521_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ar0521_dev *sensor =3D to_ar0521_dev(sd);
>> +	int ret;
>> +
>> +	mutex_lock(&sensor->lock);
>
> Could you please use runtime PM for power management, enabling the clock
> and regulators when starting streaming ?
>
> I forgot to mention in the review of the DT bindings that regulators
> should be specified in DT.

Why? The hw using this driver doesn't have capability to disable
regulators. If someone produces hw with means to control power, the sw
support can be trivially added. When I last checked, we didn't add
driver code for functionality for which no hw support exists, did we?
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
