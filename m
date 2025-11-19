Return-Path: <linux-media+bounces-47416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E66ABC71284
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 418A14E16D1
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF635301719;
	Wed, 19 Nov 2025 21:34:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415C25C6EE;
	Wed, 19 Nov 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588065; cv=none; b=dxRX5aYMUyMOUW//jxf6dRcxwQGnWpm2ezO8jVZp7FThyfRh0NtZCfFXiVgDFhmTLEgvCvgeixRuJX0i5yjGksde62rjKwlgNMewSiLjI0NQrNdkqwKH073IHBN71Tx2Ho7u/SfeyzlJw+ouBq6j7Yr5yDGsI/D2DMJNeynNkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588065; c=relaxed/simple;
	bh=tzyI353zPw0oTHCwBIoGwoz9g1Q6uRnGS/4E3QVGeZ4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2S+EnBhQT2lUSRf0n8Djc25K87xxFpjYl9Mn12LBYjjnh47sTRzNDjLZdgS31tGiR9MhbJxNtys0/iql+mUvc25jKazcM5JlnDVxlHwxK0eeG5kDahzcfNpwoiAXHQDYokxEXD91vZHdayF10qgWyNsfdrbaDZNJr4oPsaMmSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008323A.00000000691E37D6.00331C1C; Wed, 19 Nov 2025 22:34:14 +0100
Message-ID: <1759ba1149a599cda0672228d92834b307937368.camel@irl.hu>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Wed, 19 Nov 2025 22:34:13 +0100
In-Reply-To: <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
	 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
	 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
	 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
	 <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
	 <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu>
	 <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
	 <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
	 <CANiDSCtZw48bHc7m7aVPX8jFubkPYc-NKXtcWg1_rdiCMVXLnw@mail.gmail.com>
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

On Tue, 2025-11-18 at 19:30 +0100, Ricardo Ribalda wrote:


...

> >=20
> > >=20
> > > For the new MIPI cameras on laptops we have deliberately made it
> > > impossible to disable the privacy LED while streaming even though
> > > it is often controlled by a separate GPIO because of privacy reasons.
> > >=20
> > > For the same privacy reasons I fully agree with Ricardo that this sho=
uld
> > > be behind a module option. Which replaces step 1. with creating
> > > a /etc/modprobe.d/uvc.conf file, so just about as much work.
> > >=20
> >=20
> > I agree that this will be useful. The module parameter is also simpler
> > than per-V4L2 control permission management. And the latter is not
> > needed in other cases, I think.
> >=20
> > However, if allow_privacy_override is enabled, would it be worth
> > mapping these controls by the kernel?
> > So uvcdynctrl or cameractrls would not be needed for this control.
>=20
> If allow_privacy_override is enabled and there is a standard control
> in include/uapi/linux/v4l2-controls.h that supports such control: I
> have no issue adding the mapping for it.
>=20

I was misled by V4L2_CID_LED1_MODE in uvcdynctrl's logitech.xml.
That is not in v4l-controls.h.

> Right now we only have V4L2_CID_PRIVACY which is a boolean and has
> usually been used to tell if the privacy shutter is on or off, not to
> configure the LED.
>=20
> In any case, the default value of allow_privacy_override should be
> false. I would even argue that the best approach is to block all the
> known LED config controls after a deprecation period.
> Check: https://lore.kernel.org/linux-media/CANiDSCuv8UG6TMx6pK348okK+NYzA=
orPEgPYzoRCEZiBDgPP=3DA@mail.gmail.com/
>=20

I use these controls now and would use them in 1-2-3 years, so I don't
think removing them completely is a good idea :)

Almost no one compiles their own kernel anymore, so the usefulness of
putting them behind a kernel configuration is questionable.

I also saw these being used in the users of motion project. If someone
is using it as a surveillance camera, there is no need for it to light
up.

The c920 has LEDs like this, that are not easy to cover up with tape
and definitely not aesthetic.
https://www.nikktech.com/main/images/pics/reviews/logitech/c920_webcam/logi=
tech_c920_015.JPG


Regards,
Gergo

