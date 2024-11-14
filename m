Return-Path: <linux-media+bounces-21436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D89C9315
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 21:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4851B27C45
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AEE1AC435;
	Thu, 14 Nov 2024 20:16:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01779198A0E;
	Thu, 14 Nov 2024 20:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731615377; cv=none; b=Z+/OmOn75v0W6YKHN7fxg3zhguBo5RhHeAJYeLTMYRTbp5PX9C3RmFM6iLWZTf3/wpCDl5PifiJaII30WjlQBgKPiaarnXUoH4uFmipT6pCd8U89hXoD4K1uqOtChYkz9Yfmngn3+CeEEa+kHaydMGdv84/nsNgd6Z+MeHPmUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731615377; c=relaxed/simple;
	bh=M+cCxyed7FKeBFbhC6afQsE3Uk3o30Av9gvG/PgXleU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OqMCQmBepp6v3koV03exPqlkY95/eAqM4BIUH/g118qtCJritI770l9jG0N3g6rIrT2GD0UsSpHV0xD+HhjJdxsr7yfN2J/p6ky3wXDar/zfWKku17RazY1pF/0h+Fz+/ESms72SWPv60MEM2574O4LirPQUo0nP6jLG9YntsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b684a3.dsl.pool.telekom.hu [::ffff:81.182.132.163])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000074686.0000000067365A8E.0029846F; Thu, 14 Nov 2024 21:16:14 +0100
Message-ID: <5ffafb0d059f09c814692e7c33a7ce35ce9b0169.camel@irl.hu>
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
Date: Thu, 14 Nov 2024 21:16:13 +0100
In-Reply-To: <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
	 <20241114-uvc-roi-v15-18-64cfeb56b6f8@chromium.org>
	 <ac8ea4ed606cbc7dfb15057babc29e49a152ef01.camel@irl.hu>
	 <CANiDSCuZTYDsQ3yCpFV_rhbQ+vFGJnsuU-jXwOacxZVbbzEPfw@mail.gmail.com>
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

On Thu, 2024-11-14 at 21:03 +0100, Ricardo Ribalda wrote:
> Hi Gergo
>=20
> Sorry, I forgot to reply to your comment in v14.
>=20
> On Thu, 14 Nov 2024 at 20:53, Gergo Koteles <soyer@irl.hu> wrote:
> >=20
> > Hi Ricardo,
> >=20
> > On Thu, 2024-11-14 at 19:10 +0000, Ricardo Ribalda wrote:
> > >=20
> > > +     },
> > > +     {
> > > +             .id             =3D V4L2_CID_UVC_REGION_OF_INTEREST_AUT=
O,
> > > +             .entity         =3D UVC_GUID_UVC_CAMERA,
> > > +             .selector       =3D UVC_CT_REGION_OF_INTEREST_CONTROL,
> > > +             .size           =3D 16,
> > > +             .offset         =3D 64,
> > > +             .v4l2_type      =3D V4L2_CTRL_TYPE_BITMASK,
> > > +             .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > > +             .name           =3D "Region Of Interest Auto Controls",
> > > +     },
> > >  };
> > >=20
> >=20
> > Wouldn't be better to use 8 V4L2_CTRL_TYPE_BOOLEAN controls for this?
>=20
> If I create 8 Booleans, they will always be shown in the device. And
> the user will not have a way to know which values are available and
> which are not.
>=20
> We will also fail the v4l2-compliance test, because there will be up
> to 7 boolean controls that will not be able to be set to 1, eventhough
> they are writable.
>=20

And can't it be that only those returned by GET_MAX be added?

```
The bmAutoControls bitmask determines which, if any, on board features
should track to the region of interest. To detect if a device supports
a particular Auto Control, use GET_MAX which returns a mask indicating
all supported Auto Controls.
```

Sorry for the misunderstanding, I just don't quite understand.

Thanks,

Gergo

