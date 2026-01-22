Return-Path: <linux-media+bounces-51317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JqSOK7JcWlBMQAAu9opvQ
	(envelope-from <linux-media+bounces-51317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:54:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B9625A1
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1281367848
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 06:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8553E31B81C;
	Thu, 22 Jan 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HPljRIDc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A53469E4;
	Thu, 22 Jan 2026 06:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769064846; cv=none; b=G43cNL/QK05cqNp1Lomet7if43n+UIeTQIhnUPYE0phjpsGpA5wzC4Yag8EDyBZVqDXWzq4pxjl1PC1YFtVX/f8yO+gLGLCC0LK2cohP5egTxzHZg9gTY627AZG7KABxG/OjlP+FCTVOTj16/tFjKoi2bvsptPcU8NtjDGDIeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769064846; c=relaxed/simple;
	bh=db7aoSPMOdaAxKR2GkeLzT3tSNPa5SqmM9lF8NleXV0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GyAPgOWuxwmO1DsRZKcmuC+R9BUQ2eN8fDWZrLkiewzfjiTTLUfSHRTNw3OtrynAG1G7Kzn3NCx9KYJi4dF7rb0OEveJn01ya9JD89vQatl5pVajc9NldD0qErV0DtLhAhFkof29T/ecZTwfZnH7v7MlylOlfI3fiSNOlIgxM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HPljRIDc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:59ca:af14:f475:ddf6:11d2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B6818324;
	Thu, 22 Jan 2026 07:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769064803;
	bh=db7aoSPMOdaAxKR2GkeLzT3tSNPa5SqmM9lF8NleXV0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HPljRIDc10KQK3rq4rmZ7HSzXylDHxmqDXqWjygTikcwYWIDLnN2KUz+rU2xrqwap
	 Pcsyiw3IqPeMtkgNa65Bo9G49iueKTeGHlWKsCQdCOrCIPgufmeu8uIM66y8YF1Mxk
	 VH0NtDdca51kkbGLolZn54rHew0CWkSk/bsCnsPU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260121105232.GD382676@killaraus>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-7-r-donadkar@ti.com> <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com> <176845899846.9154.18009615769864845946@freya> <d9f3335a-d8f4-40cc-b4c4-a93b797a89fd@ideasonboard.com> <20260120232521.GE173080@killaraus> <8b8e603f-5d04-44ce-91ab-85df8fe0ae94@ideasonboard.com> <20260121105232.GD382676@killaraus>
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the core device
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, jai.luthra@linux.dev, mripard@kernel.org, Rishikesh Donadkar <r-donadkar@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 22 Jan 2026 12:23:50 +0530
Message-ID: <176906483058.9154.2619844247504630480@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51317-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[linux.intel.com,ti.com,kernel.org,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ideasonboard.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 778B9625A1
X-Rspamd-Action: no action

Hi Laurent,

Quoting Laurent Pinchart (2026-01-21 16:22:32)
> On Wed, Jan 21, 2026 at 09:38:29AM +0200, Tomi Valkeinen wrote:
> > On 21/01/2026 01:25, Laurent Pinchart wrote:
> > > On Thu, Jan 15, 2026 at 02:56:21PM +0200, Tomi Valkeinen wrote:
> > >> On 15/01/2026 08:36, Jai Luthra wrote:
> > >>> Quoting Tomi Valkeinen (2026-01-14 20:51:49)
> > >>>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > >>>>> From: Jai Luthra <j-luthra@ti.com>
> > >>>>>
> > >>>>> With single stream capture, it was simpler to use the video devic=
e as
> > >>>>> the media entity representing the main TI CSI2RX device. Now with=
 multi
> > >>>>> stream capture coming into the picture, the model has shifted to =
each
> > >>>>> video device having a link to the main device's subdev. The routi=
ng
> > >>>>> would then be set on this subdev.
> > >>>>>
> > >>>>> Add this subdev, link each context to this subdev's entity and li=
nk the
> > >>>>> subdev's entity to the source. Also add an array of media pads. I=
t will
> > >>>>> have one sink pad and source pads equal to the number of contexts.
> > >>>>>
> > >>>>> Support the new enable_stream()/disable_stream() APIs in the subd=
ev
> > >>>>> instead of s_stream() hook.
> > >>>>>
> > >>>>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > >>>>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > >>>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > >>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > >>>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > >>>>> ---
> > >>>
> > >>> [...]
> > >>>
> > >>>>> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct =
media_link *link)
> > >>>>>       struct ti_csi2rx_ctx *ctx =3D container_of(vdev, struct ti_=
csi2rx_ctx, vdev);
> > >>>>>       struct ti_csi2rx_dev *csi =3D ctx->csi;
> > >>>>>       struct v4l2_pix_format *csi_fmt =3D &ctx->v_fmt.fmt.pix;
> > >>>>> -     struct v4l2_subdev_format source_fmt =3D {
> > >>>>> -             .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > >>>>> -             .pad    =3D link->source->index,
> > >>>>> -     };
> > >>>>> +     struct v4l2_mbus_framefmt *format;
> > >>>>> +     struct v4l2_subdev_state *state;
> > >>>>>       const struct ti_csi2rx_fmt *ti_fmt;
> > >>>>> -     int ret;
> > >>>>> =20
> > >>>>> -     ret =3D v4l2_subdev_call_state_active(csi->source, pad,
> > >>>>> -                                         get_fmt, &source_fmt);
> > >>>>> -     if (ret)
> > >>>>> -             return ret;
> > >>>>> +     state =3D v4l2_subdev_lock_and_get_active_state(&csi->subde=
v);
> > >>>>> +     format =3D v4l2_subdev_state_get_format(state, link->source=
->index, 0);
> > >>>>> +     v4l2_subdev_unlock_state(state);
> > >>>>> =20
> > >>>>> -     if (source_fmt.format.width !=3D csi_fmt->width) {
> > >>>>> +     if (!format) {
> > >>>>> +             dev_dbg(csi->dev,
> > >>>>> +                     "Skipping validation as no format present o=
n \"%s\":%u:0\n",
> > >>>>> +                     link->source->entity->name, link->source->i=
ndex);
> > >>>>> +             return 0;
> > >>>>
> > >>>> Isn't this an error?
> > >>>
> > >>> Well, the j7 shim subdev introduced here has immutable and active l=
inks to
> > >>> all the video nodes, for each DMA channel (taken from DT), many of =
which
> > >>> may be unused for certain setups, and thus there might not be any v=
alid
> > >>> format on the subdev source pad corresponding to an unused video no=
de.
> > >>>
> > >>> Jacopo had a similar comment on v2, see this discussion (grep for M=
ali):
> > >>> https://lore.kernel.org/linux-media/4mnlnsj4co3agvln4qsasmgvgwiyoo7=
yu2h5wyh4rmzzafhm5u@avhnbw7iknms/
> > >>>
> > >>> I know other drivers use a different approach with mutable links, s=
o it
> > >>> would be good if you/Laurent/Sakari can give your opinions on if on=
ly one
> > >>> of these two approaches should be taken for multi-stream pipelines.
> > >>
> > >> I see.
> > >>
> > >> Well, I don't have a definite answer. With some thinking both options
> > >> make certain sense. It makes sense to keep the links immutable and
> > >> always enabled, as there's no configuration that can be done. On the
> > >> other hand, it makes sense to require the unused links to be disable=
d,
> > >> as, well, they are not used.
> > >=20
> > > I'm not familiar with the implications this would have on this driver,
> > > but generally speaking, if a stream is added to the media pipeline by
> > > the pipeline build algorithm, then it is expected that applications
> > > would have configured it correctly. Streams that are not used are
> > > expected to be disabled if they would otherwise be added to the
> > > pipeline.
> >=20
> > I think the thing here is that the driver creates immutable
> > always-enabled media links between the videodevs and the first subdev.
> > Then, say, if only one stream is being used, only one of those links is
> > actually used, and for every other link the above check fails as there's
> > no stream, so no format.
> >=20
> > In TI CAL driver the links were mutable, and unused links had to be
> > disabled. There it made sense as the links had to be configurable (there
> > were two PHYs). Here, there's no configuration needed, so immutable
> > links make sense, but then they're enabled even when actually not used.
>=20
> If the routing table in the subdev does not contain any route that goes
> towards a video node, then that video node should not be added to the
> pipeline by the validation code, and no validation will be attempted. At
> least that's the theory.

Okay that sounds reasonable. I can take a look into the media pipeline
validation code next week. @Rishikesh, given you already have a working
setup, feel free to test if the link_validate callback is triggered on
video nodes that don't have any streams/routes pointing to them.

>=20
> I see that this driver implements .link_validate() as a
> media_entity_operations, not a subdev operation. I wonder if that could
> explain the issue.
>=20

Well earlier I was partially confused, now I'm fully confused :-)

How is v4l2_subdev_pad_ops.link_validate different from
media_entity_operations.link_validate?

I see mc-core.rst and v4l2-subdev.rst both talk about their own variant,
without making it clear which should be used for a subdev.

Anyway, I'll try to dig through the framework code to understand what's
going wrong.

> --=20
> Regards,
>=20
> Laurent Pinchart

Thanks,
Jai

