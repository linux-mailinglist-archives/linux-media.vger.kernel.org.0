Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA3D3B3C6D
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 08:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhFYGGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 02:06:17 -0400
Received: from ni.piap.pl ([195.187.100.5]:48626 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230097AbhFYGGQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 02:06:16 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 0D66B4A0019;
        Fri, 25 Jun 2021 08:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 0D66B4A0019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624601032; bh=yur7LR1eBJJryku+5ZrACaN/dEMqRoxPyn3VT0ZjikA=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=PeRXMUtxKBH0JtEHjR0iKwHj8hJW4AYktB2z4fCFxzEpmRAH7IUkFZFR+iawU6NY5
         B9UYsi1Yx2P38OYwlM4Ap984MpFVdlrihSn39F7MbdSk/bjb9iChxxMyh2RXqOOjVx
         XnOkkFWSWbKBzIzRWalWDr+6waSN5Aww+mWOD1YM=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2] MEDIA: Driver for ON Semi AR0521 camera sensor
References: <m3r1gt5hzm.fsf@t19.piap.pl>
        <YNK5FhAXSpI1oHJV@pendragon.ideasonboard.com>
        <m3mtrh5evo.fsf@t19.piap.pl>
        <YNM0cZFV7/LKKFBn@pendragon.ideasonboard.com>
        <42958029-5625-5f4d-a075-2f59a74e0fb5@ideasonboard.com>
        <m3bl7v6er0.fsf@t19.piap.pl>
        <YNR2OkXL+wUaKuy4@pendragon.ideasonboard.com>
        <YNR9CS/PfG7s1e71@kroah.com> <m3wnqj4ct3.fsf@t19.piap.pl>
        <YNSJzgJ5xu2j+U2p@pendragon.ideasonboard.com>
        <YNSZ4fbboJokxZSx@kroah.com>
Sender: khalasa@piap.pl
Date:   Fri, 25 Jun 2021 08:03:51 +0200
In-Reply-To: <YNSZ4fbboJokxZSx@kroah.com> (Greg KH's message of "Thu, 24 Jun
        2021 16:42:41 +0200")
Message-ID: <m3h7hm4h14.fsf@t19.piap.pl>
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

Greg KH <gregkh@linuxfoundation.org> writes:

> I would not waste my time on code that does not have a signed-off-by on
> it, otherwise the developer is obviously saying they do not want to
> merge this as-is.

I would want it be be merged as-is, and would happily supply a SOB, but
nobody would merge it at this point. This isn't a problem, though.

> And I think we all have plenty of code from
> developers that actually want to have their patches merged.

Oh well. I want to have *MY* patch merged. That's exactly why I did what
I did. I did state that I will sign if off when I get positive response,
when the patch is ready to be merged. Isn't it clear?

I almost always sign off my patches. However, this is a specific
situation. Few years ago I published a patch for the same subsystem.
Obviously signed it off etc. It was exactly my SOB that caused it to be
*NOT* merged. Not because it was really bad or something, but because
another developer modified it and the modified patch was given priority.

I didn't object to the modified driver, in fact. I only wanted it to go
through the same process as all other patches, on top of my original
code, to see if it had merit. Guess what.

After all I was told that I had abandoned the code, but it was summer,
I had vacations. I'm starting vacations in a couple of days as well,
will 3 weeks of my absence mean abandonment again?
drivers/media is a fast moving target, catching up will take some time
as well. Abandonment?

Should anyone be surprised that I don't want this story to repeat
itself?

Or, maybe, it's just me. Maybe such actions are good and welcome among
Linux developers? Please answer.

>> Why not? I can put such a text on a book (say, an e-book) as well.
>
> Where would that text be and what would it mean?

Does it matter?
It would be on something that is not a part of the kernel. That's the
point - the SPDX tags may have a lot of meaning in the kernel, and none
outside of it. I can write SPDX-* on a wall of my home and it doesn't
mean it's now a public house.

It was just said that drivers written specifically for Linux (but not
derived from GPLed code) are automatically under GPL. They don't, for
the same reason - the GPL can't define it's scope (nor it claims to);
the author/owner has to do it. At least, it works like that in my
country.

>> > S-o-b is a DIFFERENT thing entirely.   Please go read the DCO for what
>> > you are agreeing to there, it is a declaration for what you are doing.
>>=20
>> Well, that's my position.
>
> That's not what a signed-off-by means, please do not try to make it
> something it is not.

What do you mean?

Chris.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
