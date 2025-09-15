Return-Path: <linux-media+bounces-42541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0AB574E3
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 11:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D03DF3AC694
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E412F4A1F;
	Mon, 15 Sep 2025 09:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I0prLoYl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D72EA484;
	Mon, 15 Sep 2025 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928380; cv=none; b=NiRkcTV6qOG2JO4JVNyQepT8/GYNc1yqvxLPECL9+z62W/AfsqJrRv6LCGH/DKWLBCEjRoK+5V1QAnRBW3ntZun9PuEgFz+rLZeBCJk7YEwKWtGvQVcgczqMO/tP7/gZraMkLzAs3iq2CQeJSbNqeH7dT54Qp9QjdUhH4pPvM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928380; c=relaxed/simple;
	bh=RXgOH1ZqN+gAwFqxR0p6/Oe1YMnjPq6e68rQXfXoDnE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jxyoIeopFRZY07sPf/kC/U37298tzOqJ50o3oi3nvxMHUgY8gRDIKmOpBUGXtfN4lHq+WqnbwlatCwAW+aNGyKKkkNahY7cHJOy+sww2GLT7ZcMNsAIf7Vp21Tfk95Fh7P1Rr2nvroZQo0n7o24wn90nWdk5WLZf4R4qZtiE6Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I0prLoYl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from thinkpad.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00F396DF;
	Mon, 15 Sep 2025 11:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757928300;
	bh=RXgOH1ZqN+gAwFqxR0p6/Oe1YMnjPq6e68rQXfXoDnE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I0prLoYlTTjxBdwfZo5Tp3rWZuXItvjUYWsgz9fzNvEoalSnLOHaex8wBgRPHgCkl
	 DJagsPt9DzAqfHFfJo+mYQioIDJ+5lHp60N1hr1/v/XYoxYvermjdp9voDLTF/+7d8
	 YuxZxAI15KoC8mKZUrhhT2fTlXl5k6MgmYgQD+0Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aLhgNP0UMAj3Cpzi@lizhi-Precision-Tower-5810>
References: <20250903102243.1563527-1-isaac.scott@ideasonboard.com> <20250903102243.1563527-4-isaac.scott@ideasonboard.com> <aLhgNP0UMAj3Cpzi@lizhi-Precision-Tower-5810>
Subject: Re: [PATCH v2 3/3] media: imx-mipi-csis: Get number of active lanes via mbus_config
From: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hverkuil@kernel.org, nicolas.dufresne@collabora.com, sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com, jonas@kwiboo.se, dan.scally+renesas@ideasonboard.com, m.szyprowski@samsung.com, mehdi.djait@linux.intel.com, niklas.soderlund+renesas@ragnatech.se
To: Frank Li <Frank.li@nxp.com>
Date: Mon, 15 Sep 2025 10:26:15 +0100
Message-ID: <175792837500.11401.10747878334767148751@isaac-ThinkPad-T16-Gen-2>
User-Agent: alot/0.10

Hi Frank,

Thank you for the review!

Quoting Frank Li (2025-09-03 16:35:16)
> On Wed, Sep 03, 2025 at 11:22:42AM +0100, Isaac Scott wrote:
> > The number of lanes actively used by a MIPI CSI transmitter may differ
> > from that which is defined in device tree. As such, call on
> > v4l2_get_active_data_lanes to check if the driver reports a
>=20
> function need (), v4l2_get_active_data_lanes()
>=20
> > differing number of lanes to device tree, and use that number of active
> > lanes.
> >
> > If the number of active data lanes is invalid, or the op is not
> > supported, it will use the number of lanes defined in device tree.
>=20
> remove "it will" to keep simple.

Thanks, I'll change this in v3.

>=20
> Frank

Best wishes,

Isaac

> >
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media=
/platform/nxp/imx-mipi-csis.c
> > index fc89325f2f94..985be511bcd0 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -967,6 +967,9 @@ static int mipi_csis_s_stream(struct v4l2_subdev *s=
d, int enable)
> >       format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> >       csis_fmt =3D find_csis_format(format->code);
> >
> > +     csis->bus.num_data_lanes =3D v4l2_get_active_data_lanes(csis->sou=
rce.pad,
> > +                                                           csis->max_d=
ata_lanes);
> > +
> >       ret =3D mipi_csis_calculate_params(csis, csis_fmt);
> >       if (ret < 0)
> >               goto err_unlock;
> > --
> > 2.43.0
> >

