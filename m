Return-Path: <linux-media+bounces-47308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F1EC6A57D
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 16:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AB07834F1EB
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 15:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35DC364E81;
	Tue, 18 Nov 2025 15:37:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F71F30EF74;
	Tue, 18 Nov 2025 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480220; cv=none; b=BxuUMEMBQNhVACDKJ5A80Mb0EXV07KRC5/oPrMXjSFmzk6t/lcMV+v4IM9h/IQPlFjkBSppnIkdEkv1GzgkoFUDfV1QOzAalCGMFEZjpGLuWjidADQtPxkeFWupVewlN3/wgE+DRuuSA9QVbvkuHtJ7vRmHehL8ZT9xlwh0Gvic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480220; c=relaxed/simple;
	bh=G4kuYqptkqpHVSGupq6Bjg7E0UzV26GNA3qr2uS1D28=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G3q/fj5EuANNqCoD/8D+1PbqyVgNdQ6pHvp98dsZKISOB8yMEO89lROQjczUAYUr0ehscvYG8HFWA6JlPVZOTovbtjhGN0Nf07S+wAlndQi6DhPRx7ajbgJdbrDknxMkXLk1gne1BENl29g0Vp7gWAdVUm0pC7lejlSkinDcjro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b69b63.dsl.pool.telekom.hu [::ffff:81.182.155.99])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000083156.00000000691C9298.0032F093; Tue, 18 Nov 2025 16:36:56 +0100
Message-ID: <374afd7b45297979278d02f6b06abaed35c12eae.camel@irl.hu>
Subject: Re: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hansg@kernel.org>,
  Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org
Date: Tue, 18 Nov 2025 16:36:55 +0100
In-Reply-To: <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
	 <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
	 <f922a8271624a6ae765abbf9894867007a29c8e7.camel@irl.hu>
	 <CANiDSCs7mdMmCxho+u=DC53kCaUTq05htzpV2=_NEkvq0U0pOw@mail.gmail.com>
	 <fd65b83abc22587e592a565dd2b326e8eb63f34c.camel@irl.hu>
	 <CANiDSCudzTj0QZMWNnE0gUPFh5heQWRC8z8NOmDHnVXCdqi96A@mail.gmail.com>
	 <b55a513fb25c47411ab7289f3812187e3f67da43.camel@irl.hu>
	 <381cf376-72b0-4a5f-a99e-524f6d83a2d0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans,

On Tue, 2025-11-18 at 15:26 +0100, Hans de Goede wrote:

>=20
> > > Do you have a compelling use-case for turning off the privacy LED?
> > >=20
> >=20
> > As a pet camera, it is useful to be able to turn off the LED.
> > In some cases, it can also eliminate unwanted reflections.
> > Some cameras may have blue LED, and if someone hates blue LEDs..
>=20
> And almost all cameras already do not allow manually overriding the LED
> turning on while streaming. There is a very low-tech solution for this,
> put some black isolation tape over the LED :)
>=20

Yes, this is also a good and stable solution. :)

> > > My core goal is simple: if the camera is in use, the privacy LED must
> > > be ON. If the LED is ON unexpectedly, it serves as a clear indication
> > > that something unusual is happening.
>=20
> ...
>=20
> > > No freedom is lost. This change simply increases the
> > > trustworthiness/reliability of your device.
> >=20
> > It will decrease to the extent that fewer people will know that such an
> > option exists because they will not read the description of the
> > module's parameters.
>=20
> People currently already will not know that the option exists.
>=20
> Seeing the current LED controls on Logitech cams requires 2 manual steps:
>=20
> 1. Install uvcdynctrl which maps the custom GUIDs to the LED controls
>    Note distros do not install this be default
> 2. Use either a GUI v4l2-control app like qv4l2ucp or gtk-v4l, or
>    v4l-ctrl -l to list controls and then change the setting.
>=20
> So there already is close to 0 discoverability for this Logitech
> only feature.

This is not completely true.
The cameractrls uses these extensions and controls with
uvc_xu_control_query() and has over 140k downloads on Flathub alone.

>=20
> For the new MIPI cameras on laptops we have deliberately made it
> impossible to disable the privacy LED while streaming even though
> it is often controlled by a separate GPIO because of privacy reasons.
>=20
> For the same privacy reasons I fully agree with Ricardo that this should
> be behind a module option. Which replaces step 1. with creating
> a /etc/modprobe.d/uvc.conf file, so just about as much work.
>=20

I agree that this will be useful. The module parameter is also simpler
than per-V4L2 control permission management. And the latter is not
needed in other cases, I think.

However, if allow_privacy_override is enabled, would it be worth
mapping these controls by the kernel?
So uvcdynctrl or cameractrls would not be needed for this control.
>=20

Regards,
Gergo

