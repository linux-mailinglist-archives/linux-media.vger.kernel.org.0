Return-Path: <linux-media+bounces-44919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553FFBE974F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 17:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFD83BE0F6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 14:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817A2F12A7;
	Fri, 17 Oct 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UDt5ITYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CF20A5E5;
	Fri, 17 Oct 2025 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713174; cv=none; b=YqXlGIcknBmcScIYZAi1LPSPztCD/vlRumSNBNoizsTMy+mMzssX6ZXFp3aVzeAyizely2ogM/G55hDlR9L6U57Vu2N3tcGrqgQITUqW6sJ5RBn4u2RA9YLMLMtK7pW9MhVR8SIjCcl0/F1ZXmiNUKEDv6xZWy9DfmKxGcE3znE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713174; c=relaxed/simple;
	bh=wCwdoqCpwUBfmspipDYUeh37Nqgj8V/mgqQAYD6ESY8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gcUhUhqOY1dMHg7RqOiB2YnLVxUsXnZeuniK4cC3zxuuo1MwE1emBqAy1345jQ4WBSdbp44ncl/YR/yhQmcj9FM9JN17M7kcqmqVMXQbSSy50xlstbz/HtwEIKR2ZnaGnZZoywZhrFcSW6mw9KbDk7EMxFZKVzh8SvJtjKh3B1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UDt5ITYQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:2112:eb18:6ce9:5a39:76a2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E0041E2F;
	Fri, 17 Oct 2025 16:57:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760713068;
	bh=wCwdoqCpwUBfmspipDYUeh37Nqgj8V/mgqQAYD6ESY8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UDt5ITYQwqCSv1cwF3AD4/sySP3ESQK+uSNC/dmib9VoTE+J4d8PX2DGc8DRW8q0P
	 BR5vNAxSpYlxx6jvpn4yMVGsK9ewuezy4VJ0lIADI8s1ullODuutNQIB85sLBIIL1w
	 JvlIQMjGzfBKHDEJ1ezecbH1TMbf6CeCD6efbLKM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <r3xhpxaxtibzqipzf6hyv3j6mzws3nr76wh24xccaqrm5folye@6f3cpexbd4or>
References: <20251017-imx219-1080p-v1-0-9173d5a47a0c@ideasonboard.com> <20251017-imx219-1080p-v1-2-9173d5a47a0c@ideasonboard.com> <r3xhpxaxtibzqipzf6hyv3j6mzws3nr76wh24xccaqrm5folye@6f3cpexbd4or>
Subject: Re: [PATCH 2/2] media: i2c: imx219: Simplify imx219_get_binning() function
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 17 Oct 2025 20:29:23 +0530
Message-ID: <176071316343.36451.9727221351195694024@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Jacopo

Thanks for the review,

Quoting Jacopo Mondi (2025-10-17 15:19:37)
> On Fri, Oct 17, 2025 at 01:43:50PM +0530, Jai Luthra wrote:
> > In imx219_set_pad_format() there is now a constraint to enforce hbin =
=3D=3D
> > vbin. So, simplify the logic in imx219_get_binning() function by
> > removing dead code that handles the case where hbin !=3D vbin.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 16 +++-------------
> >  1 file changed, 3 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 300935b1ef2497050fe2808e4ceedda389a75b50..48efdcd2a8f96b678f98192=
23e0f9895fb4025ea 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -409,24 +409,14 @@ static void imx219_get_binning(struct v4l2_subdev=
_state *state, u8 *bin_h,
> >       u32 hbin =3D crop->width / format->width;
> >       u32 vbin =3D crop->height / format->height;
> >
> > -     *bin_h =3D IMX219_BINNING_NONE;
> > -     *bin_v =3D IMX219_BINNING_NONE;
> > -
> > -     /*
> > -      * Use analog binning only if both dimensions are binned, as it c=
rops
> > -      * the other dimension.
> > -      */
> >       if (hbin =3D=3D 2 && vbin =3D=3D 2) {
> >               *bin_h =3D IMX219_BINNING_X2_ANALOG;
> >               *bin_v =3D IMX219_BINNING_X2_ANALOG;
>=20
> So we're always going for BINNING_ANALOG_X2 whenever we bin now
>=20
> I tested the binned mode 1640x1232 and 640x480 (which should bin then
> crop) and both works fine.
>=20
> I was wondering if we should then just rename ANALOG_X2 to X2 but the
> datasheet actually defines that mode as "x2 analog (special) binning"
> so I would keep the current name.
>=20
> I didn't know, but the sensor can also x4 bin!

I actually tested the x4 binning with 640x480 sometime ago, it's available
here:
https://github.com/jailuthra/linux/tree/imx219_binning_4x

Will hopefully be upstream support for both x4 and x2 modes once Sakari's
series with binning controls is merged :-)

>=20
> Anyway, for this patch, I would keep a comment around that says we
> always use the special analog binning mode which is now the default.
>=20

Indeed, will add this in v2.

> This little nit apart
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
> Thanks
>   j
>=20
> > -
> > -             return;
> > +     } else {
> > +             *bin_h =3D IMX219_BINNING_NONE;
> > +             *bin_v =3D IMX219_BINNING_NONE;
> >       }
> >
> > -     if (hbin =3D=3D 2)
> > -             *bin_h =3D IMX219_BINNING_X2;
> > -     if (vbin =3D=3D 2)
> > -             *bin_v =3D IMX219_BINNING_X2;
> >  }
> >
> >  static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *sta=
te)
> >
> > --
> > 2.51.0
> >

Thanks,
    Jai

