Return-Path: <linux-media+bounces-50747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7C0D22952
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439513094027
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 06:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1602C21EB;
	Thu, 15 Jan 2026 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f7OS1GDz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338D86250;
	Thu, 15 Jan 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459013; cv=none; b=nqF/Sf0qVZhrc7n8P8Dmt9/KQ3iuVdvWIH+SsDZpCYYj9SUGB+jNhUYs227h12/atjgj7WRRRIe1x4l5P76ORYVd8+E+tbJuGFQ5KKR9yRY8npmkbchDhpIULLUJeu9i50fsnpKI4W/m0zEXOrdPA8GnxH7PUQD0RplzbW4HtAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459013; c=relaxed/simple;
	bh=xVcBRqEBOF+2w5uCGKFR3PmPPf/ALxrXuAO/HZn5MJU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=h/JI9EpcW48ZkDFcHoLZpk0cO9quZig/pQQ4JIRFclRli2IxcTQrPV633ARBf+UzLAs6xMivUL2vYSk7QfGNHXipw8utoKkM5DJEWyi3+AgCbm2X24ZEIeEl6Y+O8aYQdLRZtDDdcjAa9tGbYR2nuzaV5wYZJZjgAdfJmXytobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f7OS1GDz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC754E1;
	Thu, 15 Jan 2026 07:36:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768458975;
	bh=xVcBRqEBOF+2w5uCGKFR3PmPPf/ALxrXuAO/HZn5MJU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=f7OS1GDzRQn9si5P+u02yXEVrWA2z/B6BVMwXOVsKAeGgVV7QEQP+GjnrnCVBhdw0
	 Ic8kNEEOedGORN250yt7t2MC5KrTitFIqQPo2//w7eCa26aeYgeUGYDh5VsLPaQ2Cv
	 xaRVtbG0oRlYD6v01uwmaYsh6uPdvMUnc3dx9dFM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-7-r-donadkar@ti.com> <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the core device
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, jai.luthra@linux.dev, mripard@kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 15 Jan 2026 12:06:38 +0530
Message-ID: <176845899846.9154.18009615769864845946@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Tomi,

+Sakari, Laurent

Quoting Tomi Valkeinen (2026-01-14 20:51:49)
> Hi,
>=20
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > From: Jai Luthra <j-luthra@ti.com>
> >=20
> > With single stream capture, it was simpler to use the video device as
> > the media entity representing the main TI CSI2RX device. Now with multi
> > stream capture coming into the picture, the model has shifted to each
> > video device having a link to the main device's subdev. The routing
> > would then be set on this subdev.
> >=20
> > Add this subdev, link each context to this subdev's entity and link the
> > subdev's entity to the source. Also add an array of media pads. It will
> > have one sink pad and source pads equal to the number of contexts.
> >=20
> > Support the new enable_stream()/disable_stream() APIs in the subdev
> > instead of s_stream() hook.
> >=20
> > Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > ---

[...]

> > @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_=
link *link)
> >       struct ti_csi2rx_ctx *ctx =3D container_of(vdev, struct ti_csi2rx=
_ctx, vdev);
> >       struct ti_csi2rx_dev *csi =3D ctx->csi;
> >       struct v4l2_pix_format *csi_fmt =3D &ctx->v_fmt.fmt.pix;
> > -     struct v4l2_subdev_format source_fmt =3D {
> > -             .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > -             .pad    =3D link->source->index,
> > -     };
> > +     struct v4l2_mbus_framefmt *format;
> > +     struct v4l2_subdev_state *state;
> >       const struct ti_csi2rx_fmt *ti_fmt;
> > -     int ret;
> > =20
> > -     ret =3D v4l2_subdev_call_state_active(csi->source, pad,
> > -                                         get_fmt, &source_fmt);
> > -     if (ret)
> > -             return ret;
> > +     state =3D v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> > +     format =3D v4l2_subdev_state_get_format(state, link->source->inde=
x, 0);
> > +     v4l2_subdev_unlock_state(state);
> > =20
> > -     if (source_fmt.format.width !=3D csi_fmt->width) {
> > +     if (!format) {
> > +             dev_dbg(csi->dev,
> > +                     "Skipping validation as no format present on \"%s=
\":%u:0\n",
> > +                     link->source->entity->name, link->source->index);
> > +             return 0;
>=20
> Isn't this an error?

Well, the j7 shim subdev introduced here has immutable and active links to
all the video nodes, for each DMA channel (taken from DT), many of which
may be unused for certain setups, and thus there might not be any valid
format on the subdev source pad corresponding to an unused video node.

Jacopo had a similar comment on v2, see this discussion (grep for Mali):
https://lore.kernel.org/linux-media/4mnlnsj4co3agvln4qsasmgvgwiyoo7yu2h5wyh=
4rmzzafhm5u@avhnbw7iknms/

I know other drivers use a different approach with mutable links, so it
would be good if you/Laurent/Sakari can give your opinions on if only one
of these two approaches should be taken for multi-stream pipelines.

>=20
>  Tomi
>=20

Thanks,
    Jai

[...]

