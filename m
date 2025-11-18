Return-Path: <linux-media+bounces-47268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F246C69054
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AEEDD34BB59
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C23F34FF5D;
	Tue, 18 Nov 2025 11:14:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31D17D2;
	Tue, 18 Nov 2025 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464456; cv=none; b=tVhGKsuJMJDmviLvSORR4EcYDvre39t3pfq+3Y54pdGXzwxPiWSuqgHvt/Sk10Lt1xhtZuwsc2S3sUobhs7AvBZj7wLhjoI4KXRNm8f0uDUFtJRMihEYta3RN8W7+kzbQ5H3NtGJ7KlR/0YkHbIBJu2mQ2+U5/cJlkwUWRzWi5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464456; c=relaxed/simple;
	bh=vXfQItgmyyFnrJznSEPsN8gOiNqmJQb3rE4jZQaL/RA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUI+yOBNBmh0Loj/gd8IrefLQFxMx9XUgIk9bDjHgpI2xW1dQI4ni9hGsXbDulhwotRsW/G/xP+GH6vtOTN7UJepPSet+LeFUuGr4+TNjC5XRex9rAU3DPw6ucZCQZAHPfuNSO8FrEh0eANwIjdXcwH+mjXlrNRykc8Wuoe9EEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008310E.00000000691C5504.0032E5C3; Tue, 18 Nov 2025 12:14:12 +0100
Message-ID: <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Hans de Goede <hansg@kernel.org>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Tue, 18 Nov 2025 12:14:11 +0100
In-Reply-To: <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
	 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
	 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
	 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
	 <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Tue, 2025-11-18 at 10:25 +0100, Ricardo Ribalda wrote:
> Hi Gergo
>=20
> On Tue, 18 Nov 2025 at 09:48, Gergo Koteles <soyer@irl.hu> wrote:
> >=20
> > Hi Ricardo,
> >=20
> > On Tue, 2025-11-18 at 07:21 +0100, Ricardo Ribalda wrote:
> > >=20
> > > Most users expect that the led is always on when the camera is active=
.
> > > I think the usecases where the led should not be turned on are spooky
> > > or very limited.
> > >=20
> >=20
> > Or do most users expect that if a piece of hardware has a setting, they
> > can set it without module parameters?
>=20
> A piece of hardware that has a non-standard, undocumented setting.
>=20
> Do you have a compelling use-case for turning off the privacy LED?
>=20

As a pet camera, it is useful to be able to turn off the LED.
In some cases, it can also eliminate unwanted reflections.
Some cameras may have blue LED, and if someone hates blue LEDs..

> >=20
> > > Even if you use open-source software, when it parses user generated
> > > data, there is a risk for bugs. If there is a bug the only thing
> > > protecting the security of the camera is the membership of the video
> > > group which is a very low barrier. And once you manage to change the
> > > LED behaviour will persist in other unrelated apps.
> > >=20
> >=20
> > So this is about what if an attacker accessed my passwords, private
> > keys, OTP tokens, emails, pictures and then couldn't take a fresh
> > picture of me in the dark without an LED? I'm smart as hell and I use a
> > privacy tape anyway ;)
>=20
> My core goal is simple: if the camera is in use, the privacy LED must
> be ON. If the LED is ON unexpectedly, it serves as a clear indication
> that something unusual is happening.
>=20
> Gaining access to the video node does not automatically grant access
> to sensitive data like browser information; there are sandboxes in
> place for that. Also open source does not equate to secure or
> non-malicious code.
>=20

Applications that access a video node usually have multiple permissions
(at least on my system). But I understand there may be cases where they
only have access to a video node and then this can be useful.

> >=20
> > I think freedom is worth more than this kind of fear.
>=20
> No freedom is lost. This change simply increases the
> trustworthiness/reliability of your device.

It will decrease to the extent that fewer people will know that such an
option exists because they will not read the description of the
module's parameters.

And people won't even know that it can be turned off as root, and even
a curl | sudo... installation can take a picture of them without an
LED.

And it's not possible to be sure that there isn't another undocumented
option in the firmware to turn it off the LED.

A physical switch would be the best for this control, but that's not an
option :(



Gergo

