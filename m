Return-Path: <linux-media+bounces-42542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD7FB574E8
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF1D37A5BFD
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B732F5331;
	Mon, 15 Sep 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SJBhiQjR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D282F4A04;
	Mon, 15 Sep 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928492; cv=none; b=OSJHrn634YsattcfV3lwYIRftAtXnnoRwxQhw2ZC4RtQRyVwZcFWyZZGg6edGhwEsO/8peQeqep7fLK+ZDh9gFU036x4w/H33dmo+etKhwCFt3KCkbN/lST/kh0qerSW/aR80pKyHY08ERYj4kvcD4ZBIL4X6GgLqdKg+SA7IOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928492; c=relaxed/simple;
	bh=ig9pnFV5Dffbtj//ovQm7EUb5gnxPa3r3vIlgcADr78=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EPEWEJA1qrOXjOpK2vi/QVDpszmziTxR4BE5/QsVOT3cGxs2GYUYwOx+ofvFrOyy+VOl4qa5TiJoacOg881tLgWTIDs9ML8dY8oUTtbtn8tNCnffUMRLyFxWP6/Skx3/MllK46HCBfy/tenJEFK7i9EW//WrE44Td/8+OBEQnzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SJBhiQjR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACA76DF;
	Mon, 15 Sep 2025 11:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757928411;
	bh=ig9pnFV5Dffbtj//ovQm7EUb5gnxPa3r3vIlgcADr78=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SJBhiQjRQwwdrf/m53fDFdEAhwTMcF6ydRgT2aAJrWv7I/EEb/4aIQi/TEq3dTG1H
	 PlsG5BMP4vEJSRWvoOLKMSIOEg3BgV1nfJmw39IFksEZawT8OaT63roL4Ac0XtWEvw
	 8g1TIQ4eBsHMhwtWAibihYd5bKfP04beAcmwBn9k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aLlRgRBztMEicEgM@kekkonen.localdomain>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com> <20250903102243.1563527-2-isaac.scott@ideasonboard.com> <aLlRgRBztMEicEgM@kekkonen.localdomain>
Subject: Re: [PATCH v2 1/3] media: v4l: Add helper to get number of active lanes via a pad
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil@kernel.org, nicolas.dufresne@collabora.com, tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com, mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 15 Sep 2025 10:28:05 +0100
Message-ID: <175792848509.11401.3410245547555092168@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10

Hi Sakari,

Thank you for the review!

Quoting Sakari Ailus (2025-09-04 09:44:49)
> Hi Isaac,
>=20
> Thanks for the update.
>=20
> On Wed, Sep 03, 2025 at 11:22:40AM +0100, Isaac Scott wrote:
> > Sometimes, users will not use all of the MIPI CSI 2 lanes available when
> > connecting to the MIPI CSI receiver of their device. Add a helper
> > function that checks the mbus_config for the device driver to allow
> > users to define the number of active data lanes through the
> > get_mbus_config op.
> >=20
> > If the driver does not implement this op, fall back to using the number
> > of data lanes specified in device tree.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-common.c | 25 +++++++++++++++++++++++++
> >  include/media/v4l2-common.h           |  1 +
> >  2 files changed, 26 insertions(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 6e585bc76367..8683107b3704 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -571,6 +571,31 @@ s64 __v4l2_get_link_freq_pad(struct media_pad *pad=
, unsigned int mul,
> >       return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
> >  }
> >  EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
> > +
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, u=
nsigned int dt_lanes)
>=20
> This line would benefit from being wrapped.

OK, I'll wrap it in v3.

>=20
> > +{
> > +     struct v4l2_mbus_config mbus_config =3D {};
> > +     struct v4l2_subdev *sd;
> > +     unsigned int lanes;
> > +     int ret;
> > +
> > +     sd =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     ret =3D v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
> > +                            &mbus_config);
> > +     if (ret < 0 && ret !=3D -ENOIOCTLCMD)
> > +             return ret;
> > +
> > +     if (!mbus_config.bus.mipi_csi2.num_data_lanes)
> > +             return dt_lanes;
> > +
> > +     lanes =3D mbus_config.bus.mipi_csi2.num_data_lanes;
> > +
> > +     if (lanes < 0 || lanes > dt_lanes)
>=20
> lanes is unsigned int so no need to check for less than 0.
>=20
> I might just not use a local variable for this, up to you.
>=20
> > +             return -EINVAL;
> > +
> > +     return lanes;
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_get_active_data_lanes);
> >  #endif /* CONFIG_MEDIA_CONTROLLER */
> > =20
> >  /*
> > diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> > index 0a43f56578bc..3f8937260c76 100644
> > --- a/include/media/v4l2-common.h
> > +++ b/include/media/v4l2-common.h
> > @@ -584,6 +584,7 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt, u32 pixelformat,
> >       (pad, mul, div)
> >  s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
> >                            unsigned int div);
>=20
> Some kernel-doc documentation would be nice.

Ah, of course, I'll include it in v3.

>=20
> > +unsigned int v4l2_get_active_data_lanes(const struct media_pad *pad, u=
nsigned int dt_lanes);
>=20
> Please wrap this, too.

Will do!

>=20
> >  #else
> >  #define v4l2_get_link_freq(handler, mul, div)                \
> >       __v4l2_get_link_freq_ctrl(handler, mul, div)
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

Best wishes,

Isaac

