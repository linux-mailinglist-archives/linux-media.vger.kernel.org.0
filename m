Return-Path: <linux-media+bounces-19144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AB992970
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 12:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F305C284987
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 10:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C271CACC0;
	Mon,  7 Oct 2024 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="VLAZG9TR"
X-Original-To: linux-media@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CCB1C7B95
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728297868; cv=none; b=rdiOIk4dPlDAicoH69z/902HC79hZgPaWVruNhEE7xabRcdx2I4H31bCgaDG2JZedc6V+Z0Grv1w2k3qVW4qvxRa3b01/NATrBYxkeIjYmPlWH62LDClDE63BDFh2MN7fSilyfCQj42IvRMheTIgadEz+0oZtOdvk1qMgsPgdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728297868; c=relaxed/simple;
	bh=GoULCJHgNMbB4CM738JmnUtJvcX4vG3ulM0Gd5w1b/8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHIZGGzXJBkeG0WXA1n/LDkreL+7iNUUoNaZUbAdmsgrSH8JeCtNjQpc49bmpD5/rZkSsb2mJo0/gi++DgRmoRSYHpSvywH+DdT8fBTIbicQXQWm2dUKN4u5/dzHBy8W/SBWdkstoVUusHzNUeZoc8DpwNj0dz0bfNb9+FMDJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=VLAZG9TR; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3D8ED24002A
	for <linux-media@vger.kernel.org>; Mon,  7 Oct 2024 12:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1728297859; bh=GoULCJHgNMbB4CM738JmnUtJvcX4vG3ulM0Gd5w1b/8=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=VLAZG9TR+EDAMfbLMuRjoh+ax5fGvDouehLuG1nV1bbovmeqFlZ2hz5VcyPJ8eru4
	 u/LUYKtAN0q/QJS2Q2GdXiIM2zyGaWwZSoaYwBCj+gfTj5d60D/mAkAqfeELI4jGmK
	 tZuUXPiehRHsOTUVs9tfRO06oZFltUAT5DxaGpA6B2bAooKa//SwQpGmvABfGrTEMB
	 cxcOhoQtVk+Gfqpre4olfhTQsjCf819ctBOKbhoW3eEE0IpU+S4wK8U6deP2ipUG3f
	 lfRJvTgJLsGWaAGBYsghYR0wlNG73DBkP498xJQhTR8kskNbzFPLEaICdd9KoCYLbZ
	 gl3ydyHp98miQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4XMbPC56J4z6tws;
	Mon,  7 Oct 2024 12:44:15 +0200 (CEST)
Message-ID: <f6109c4a7c2648157163bd8d92001dd4e88f6aab.camel@posteo.de>
Subject: Re: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
From: Martin Kepplinger <martink@posteo.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	 <guoniu.zhou@oss.nxp.com>
Cc: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "kernel@puri.sm"
 <kernel@puri.sm>,  "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,  "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Mon, 07 Oct 2024 10:44:15 +0000
In-Reply-To: <20240930072151.GC31662@pendragon.ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
	 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
	 <20240930072151.GC31662@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Montag, dem 30.09.2024 um 10:21 +0300 schrieb Laurent Pinchart:
> On Mon, Sep 30, 2024 at 07:08:09AM +0000, G.N. Zhou (OSS) wrote:
> > On Sunday, September 29, 2024 9:44 PM, Laurent Pinchart wrote:
> > >=20
> > > Hello,
> > >=20
> > > This small patch series is a reaction to "[PATCH] media: nxp:
> > > imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]).
> > > Instead of making
> > > the PM handling more complex, I think it can be greatly
> > > simplified.
> > >=20
> > > I have only compile-tested the patches. Guoniu, could you give
> > > this a try ?
> >=20
> > After applying the patches and test both on iMX8ULP.
> >=20
> > For iMX8ULP, it will cause kernel dump when access CSI registers
> > and
> > system hang during do suspend/resume while streaming
> > Need to add system suspend/resume handlers and call
> > pm_runtime_force_suspend/resume in the handlers.
> >=20
> > I tried to debug this issue and found pm runtime callback won't be
> > called when system resume. The state of power domain won't enabled.
>=20
> Thank you for testing.
>=20
> I wonder if this could be caused by the CSI bridge being resumed from
> system sleep before the CSI-2 receiver. Could you check if that's the
> case ? If so, does the following change fix the issue ?
>=20
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c
> b/drivers/media/platform/nxp/imx7-media-csi.c
> index 9566ff738818..c66b0621e395 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2057,9 +2057,22 @@ static int imx7_csi_notify_bound(struct
> v4l2_async_notifier *notifier,
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct imx7_csi *csi =3D =
imx7_csi_notifier_to_dev(notifier);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct media_pad *sink =
=3D &csi-
> >sd.entity.pads[IMX7_CSI_PAD_SINK];
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_link *link;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csi->src_sd =3D sd;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Enforce suspend/resume orde=
ring between the source
> (supplier) and
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the CSI (consumer). The sou=
rce will be suspended before
> and resume
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * after the CSI.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0link =3D device_link_add(csi->=
dev, sd->dev, DL_FLAG_STATELESS);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!link) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_err(csi->dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"Failed t=
o create device link to source
> %s\n", sd->name);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EINVAL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return v4l2_create_fwnode=
_links_to_pad(sd, sink,
> MEDIA_LNK_FL_ENABLED |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> MEDIA_LNK_FL_IMMUTABLE);
> =C2=A0}


hi Laurent,

I now tested your 3 patches, initially including this extra change, on
the imx8mq Librem 5 and indeed streaming continues after system resume
now. It works without this extra change too, even though it seems to
make sense.

so for the 3-patch series at least:

Tested-by: Martin Kepplinger-Novakovi=C4=87 <martink@posteo.de>

thanks. I seem to be able to drop a few patches now, but if anyone else
can test it too, please wait for that as well,

                              martin

