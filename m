Return-Path: <linux-media+bounces-32714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1A0ABAF07
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 11:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65273ADA75
	for <lists+linux-media@lfdr.de>; Sun, 18 May 2025 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5BB204F8B;
	Sun, 18 May 2025 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gB1fiA97"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B071FFC7B
	for <linux-media@vger.kernel.org>; Sun, 18 May 2025 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561383; cv=none; b=W4+p/lHbIXTXqKY/zAcidWf6EYfIdBKqlgrqSo6z0zNcAI3FwOL4F49fTFGHsFkCz4cg5s++RY808FL1GelEPS+Up2eU+F956dno44rOiyGr6pLuIs6qVg7HwQAb+wwZdxFIA/L6nZLaoCqNwv7IJFm2TkDIxEcnmUUkBynS8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561383; c=relaxed/simple;
	bh=dQx+VK2t5QfjEV4PLgl2iYD1EibqMNVvFXCD7DmZEyU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=cwiDR126Pemq4yKwQvVBALLUzI5vTKhPGUOQ2GmmI6HoKlEF3vHg8UXnTBZfjsqwhPK/GumPVU80hHqrf1fEhzh43b9WDcbqiql6fhM3VEzUYp5VFE1O+pO94du/1MwiIHnOwxk6xJo8sJ/HVeHO+v671890Nz9xBmRpS7rdNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gB1fiA97; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 52782475;
	Sun, 18 May 2025 11:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747561360;
	bh=dQx+VK2t5QfjEV4PLgl2iYD1EibqMNVvFXCD7DmZEyU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=gB1fiA97PUdgNe2aM6zMQ29fbT06I+3CLNsI1nUakP6ZM0Kst6lWK9YAhZQQ0aeLR
	 2XAhQ9PdDwlx7ys2NrBWO+w3K4PznhKzf+OSCvjgX6KZLyyifPG4wHhQDY/iHTA9qa
	 rkfnZWX2D3lK+ADkl//ElohmMwjs58Qfi6dMNYTY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
References: <20250517114106.43494-1-hdegoede@redhat.com> <20250517114106.43494-6-hdegoede@redhat.com> <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 05/23] media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, libcamera-devel@lists.libcamera.org,
Date: Sun, 18 May 2025 10:42:56 +0100
Message-ID: <174756137675.4012029.11818241234579920414@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Hans,

+Cc: libcamera-devel

Digging in here I found this part interesting (i.e. perhaps we need to
clarify the expected behavours better)



Quoting Kieran Bingham (2025-05-17 22:09:13)
> Quoting Hans de Goede (2025-05-17 12:40:48)
> > Use V4L2_CID_ANALOGUE_GAIN for gain control, as expected by userspace.
> >=20
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drive=
rs/staging/media/atomisp/i2c/atomisp-gc0310.c
> > index ee039f3be4da..756e56f639b7 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> > @@ -289,7 +289,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
> >                 ret =3D cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_RE=
G,
> >                                 ctrl->val, NULL);
> >                 break;
> > -       case V4L2_CID_GAIN:
> > +       case V4L2_CID_ANALOGUE_GAIN:
> >                 ret =3D gc0310_gain_set(sensor, ctrl->val);
> >                 break;
> >         default:
> > @@ -533,7 +533,7 @@ static int gc0310_init_controls(struct gc0310_devic=
e *sensor)
> > =20
> >         /* 32 steps at base gain 1 + 64 half steps at base gain 2 */
>=20
> sounds like a curious gain model...
>=20
> Will be interesting when we get the sensor calibration tools up and
> running to plot this. (Or is there already a public datasheet
> documenting this?)
>=20
> Is there a split here between analogue gain and digital gain ? Or is it
> all expected to be 'analogue gain' ?

I looked deeper, and this does seem to be a split between analogue and
digital gain. It also seems like this control might be doing additional
calculations which would then have to be accounted for as part of the
gain model in libcamera, so then instead of 'sensor specific' it would
be 'this linux sensor driver specific' - so maybe the gain functions
should be simplified more.

Adding in libcamera-devel - because I think we need to figure out what's
best for handling this (overall for all sensors with A+D gain)

There are some sensors I've seen where the digital gain can only be
applied 'on top' of the analogue gain, and so it does act like a single
control ...

But we probably want to be able to distinguish between analogue gain and
digital gain in libcamera / userspace.

However, even if we distinguish ... I suspect there are cases where if
we need more gain than just the analogue gain can provide - adding the
large steps at the sensor - and then only applying very small amounts of
fine-grain digital gain on an ISP would make things simpler or easier
overall.

So somehow I think we need to figure out and correctly document and
manage the splits between analogue and digital gains, and that will
likely have to have a corresponding mapping in either the camera sensor
helpers or the tuning files in some part.

--
Kieran


>=20
>=20
> >         sensor->ctrls.gain =3D
> > -               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95,=
 1, 31);
> > +               v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_ANALOGUE_GAI=
N, 0, 95, 1, 31);
> > =20
> >         return hdl->error;
> >  }
> > --=20
> > 2.49.0
> >

