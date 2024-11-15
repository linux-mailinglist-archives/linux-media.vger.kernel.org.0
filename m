Return-Path: <linux-media+bounces-21443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD159C9687
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 01:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC7DE1F22828
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2024 00:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2B410E4;
	Fri, 15 Nov 2024 00:04:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970D5646;
	Fri, 15 Nov 2024 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731629093; cv=none; b=AvDKDCauk8UQ0kDNhDA2zZDzt0Q8jOJ0YduCe5zUC00GS51LoDZzApi8pESzFJycePQdego9vtKNWsCXGHA3b5cwRvU6Xy5hBZ5ehtFL2tSIz9433F0+HBThbWDc6iFXXp6KxywKcZaEJ8shKlpLMa32u7OFch881UpMwXz9rjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731629093; c=relaxed/simple;
	bh=MLcnAjfPFcZgTnebh9EnDCqrLcmlfT0Kf4jrmd6XgJM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqdTvVFpqdLPRj55a4tEs+h/PXm2Kobjm9jJgfBt9FZ2raBEYm11x2h2lriplD/M+DRvVgqq2rT+NS3y4Vpe7GFJm0s7bQAuJXYt3TJeEPmVYkCqFCZu1d58fPrn3+Mxg7IkND/dc/gDolfBrG5cOJLJRuHOvWIKdiKSddtB3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b684a3.dsl.pool.telekom.hu [::ffff:81.182.132.163])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007368A.000000006736900F.002989B1; Fri, 15 Nov 2024 01:04:23 +0100
Message-ID: <c4c6e3a2e5313a9bafec31343407e60b2ea9ff44.camel@irl.hu>
Subject: Re: [PATCH v15 18/19] media: uvcvideo: implement UVC v1.5 ROI
From: Gergo Koteles <soyer@irl.hu>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Hans de Goede <hdegoede@redhat.com>,
  Ricardo Ribalda <ribalda@kernel.org>,
  Sakari Ailus <sakari.ailus@linux.intel.com>,
  Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@chromium.org>,
  linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
  Yunke Cao <yunkec@google.com>
Date: Fri, 15 Nov 2024 01:04:19 +0100
In-Reply-To: <CANiDSCvP5eVuSGMi3R4eAkY2-ou=nqrTS1dnAv0Odbcq5UHa+w@mail.gmail.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
	 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
	 <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
	 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
	 <5ffafb0d059f09c814692e7c33a7ce35ce9b0169.camel@irl.hu>
	 <CANiDSCvP5eVuSGMi3R4eAkY2-ou=nqrTS1dnAv0Odbcq5UHa+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

On Thu, 2024-11-14 at 21:28 +0100, Ricardo Ribalda wrote:
> Hi
>=20
> On Thu, 14 Nov 2024 at 21:16, Gergo Koteles <soyer@irl.hu> wrote:
> >=20
> > Hi Ricardo,
> >=20
> > On Thu, 2024-11-14 at 21:03 +0100, Ricardo Ribalda wrote:
> > > Hi Gergo
> > >=20
> > > Sorry, I forgot to reply to your comment in v14.
> > >=20
> > > On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
> > > >=20
> > > > Hi Ricardo,
> > > >=20
> > > > On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> > > > >=20
> > > > > +     },
> > > > > +     {
> > > > > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST=
_AUTO,
> > > > > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > > > > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTR=
OL,
> > > > > +             .size           =3D 16,
> > > > > +             .offset         =3D 64,
> > > > > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > > > > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > > > > +             .name           =3D "Region Of Interest Auto Contro=
ls",
> > > > > +     },
> > > > >  };
> > > > >=20
> > > >=20
> > > > Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for thi=
s?
> > >=20
> > > If I create 8 Booleans, they will always be shown in the device. And
> > > the user will not have a way to know which values are available and
> > > which are not.
> > >=20
> > > We will also fail the v4l2-compliance test, because there will be up
> > > to 7 boolean controls that will not be able to be set to 1, eventhoug=
h
> > > they are writable.
> > >=20
> >=20
> > And can't it be that only those returned by GET_MAX be added?
> >=20
> > ```
> > The bmAutoControls bitmask determines which, if any, on board features
> > should track to the region of interest. To detect if a device supports
> > a particular Auto Control, use GET_MAX which returns a mask indicating
> > all supported Auto Controls.
> > ```
> >=20
> > Sorry for the misunderstanding, I just don't quite understand.
>=20
> I guess we could, but we would have to make a big change in the way
> the controls are probed today. uvc does not use the control framework.
>=20
> What will be the benefit of using 8 controls?
> - Applications still have to know what those controls do, they should
> not rely on the control name.

Applications like v4l2-ctl are not aware of every controls, work by
control type, and let the user decide what to do, based on the name.

To avoid having to know each bitmask type control, they need to be able
to query which bit means what and what to display to the user.

Could VIDIOC_QUERYMENU be supplemented with this?


> - Changing from lets say AUTO_EXPOSURE to AUTO_FOCUS, will require to
> send at least 2 controls via v4l2_s_ext_control... I think it is more
> practical and less prone to errrors to send just one control
>=20

Yes, that could be a good reason.

Thanks,
Gergo



