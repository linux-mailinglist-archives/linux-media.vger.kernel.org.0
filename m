Return-Path: <linux-media+bounces-53851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM4OCJVco2nW/AQAu9opvQ
	(envelope-from <linux-media+bounces-53851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 22:22:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFB1C8F41
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 22:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33C033209D7
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 19:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8E14A2E30;
	Sat, 28 Feb 2026 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KcK/87jo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA775355049;
	Sat, 28 Feb 2026 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300981; cv=none; b=MIP4Vv3NXo0YlMjVuNRQDYKbX8emNDx3UsWH6RTrVdv3r+dNyz9tukxjUgxjfitLAmF0DZ4OshqG9AX6ZhKXz2kIytlGbwnIVACIbNxK4raAghZuGa74yunPNndUdsCGmgg7OEIvYCpV2DEbX7iiIjhqmFMZRTvqi+JkpJ1HMuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300981; c=relaxed/simple;
	bh=Nj4t1bqJGwHOl+uPHiBVtLOrr5MgH4gBdosWwkNc2z4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VJpuolo4WhOKoZJVB2bEW9OOlr0wHf2TXYcpi7Hqu8dMyx5yuCI7PiK5dInbi4MIR+s7uTVmG2VbwKjtRDTfx25nHgszMAaxdx0D+shYV9HmshYmhuPGmgAL9qyOyfeK4Wr9kreq1TudIm//osmhJ30QNAUkRRat0M+fjdjN4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KcK/87jo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 281892D7;
	Sat, 28 Feb 2026 18:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772300910;
	bh=Nj4t1bqJGwHOl+uPHiBVtLOrr5MgH4gBdosWwkNc2z4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KcK/87jo7vc12uDZbUh0xkspuDNWkp04IiK6DP+HOaXyRQHaVMPKSQxPiEgZF4tgQ
	 n1gJx5DiS3GaJz5cjPePtptyaTxvP9GS2wfHBNWaRRim/Dl6J1jKuLqkzdqicjmi9e
	 d+2lzHUwzxcmnV47NkULNjNzZdoPzGG3FVW6XiOI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260122095308.GF209830@killaraus>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-7-r-donadkar@ti.com> <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com> <176845899846.9154.18009615769864845946@freya> <d9f3335a-d8f4-40cc-b4c4-a93b797a89fd@ideasonboard.com> <20260120232521.GE173080@killaraus> <8b8e603f-5d04-44ce-91ab-85df8fe0ae94@ideasonboard.com> <20260121105232.GD382676@killaraus> <176906483058.9154.2619844247504630480@freya> <20260122095308.GF209830@killaraus>
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the core device
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, jai.luthra@linux.dev, mripard@kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Rishikesh Donadkar <r-donadkar@ti.com>
Date: Sat, 28 Feb 2026 23:19:23 +0530
Message-ID: <177230096349.14753.15918424997579751616@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53851-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,ti.com,kernel.org,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org,linux.dev];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 62AFB1C8F41
X-Rspamd-Action: no action

Quoting Laurent Pinchart (2026-01-22 15:23:08)
> On Thu, Jan 22, 2026 at 12:23:50PM +0530, Jai Luthra wrote:
> > Quoting Laurent Pinchart (2026-01-21 16:22:32)
> > > On Wed, Jan 21, 2026 at 09:38:29AM +0200, Tomi Valkeinen wrote:
> > > > On 21/01/2026 01:25, Laurent Pinchart wrote:
> > > > > On Thu, Jan 15, 2026 at 02:56:21PM +0200, Tomi Valkeinen wrote:
> > > > >> On 15/01/2026 08:36, Jai Luthra wrote:
> > > > >>> Quoting Tomi Valkeinen (2026-01-14 20:51:49)
> > > > >>>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > > > >>>>> From: Jai Luthra <j-luthra@ti.com>
> > > > >>>>>
> > > > >>>>> With single stream capture, it was simpler to use the video d=
evice as
> > > > >>>>> the media entity representing the main TI CSI2RX device. Now =
with multi
> > > > >>>>> stream capture coming into the picture, the model has shifted=
 to each
> > > > >>>>> video device having a link to the main device's subdev. The r=
outing
> > > > >>>>> would then be set on this subdev.
> > > > >>>>>
> > > > >>>>> Add this subdev, link each context to this subdev's entity an=
d link the
> > > > >>>>> subdev's entity to the source. Also add an array of media pad=
s. It will
> > > > >>>>> have one sink pad and source pads equal to the number of cont=
exts.
> > > > >>>>>
> > > > >>>>> Support the new enable_stream()/disable_stream() APIs in the =
subdev
> > > > >>>>> instead of s_stream() hook.
> > > > >>>>>
> > > > >>>>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.co=
m>
> > > > >>>>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > > > >>>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > > >>>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > > > >>>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > > > >>>>> ---
> > > > >>>
> > > > >>> [...]
> > > > >>>
> > > > >>>>> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(str=
uct media_link *link)
> > > > >>>>>       struct ti_csi2rx_ctx *ctx =3D container_of(vdev, struct=
 ti_csi2rx_ctx, vdev);
> > > > >>>>>       struct ti_csi2rx_dev *csi =3D ctx->csi;
> > > > >>>>>       struct v4l2_pix_format *csi_fmt =3D &ctx->v_fmt.fmt.pix;
> > > > >>>>> -     struct v4l2_subdev_format source_fmt =3D {
> > > > >>>>> -             .which  =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > >>>>> -             .pad    =3D link->source->index,
> > > > >>>>> -     };
> > > > >>>>> +     struct v4l2_mbus_framefmt *format;
> > > > >>>>> +     struct v4l2_subdev_state *state;
> > > > >>>>>       const struct ti_csi2rx_fmt *ti_fmt;
> > > > >>>>> -     int ret;
> > > > >>>>> =20
> > > > >>>>> -     ret =3D v4l2_subdev_call_state_active(csi->source, pad,
> > > > >>>>> -                                         get_fmt, &source_fm=
t);
> > > > >>>>> -     if (ret)
> > > > >>>>> -             return ret;
> > > > >>>>> +     state =3D v4l2_subdev_lock_and_get_active_state(&csi->s=
ubdev);
> > > > >>>>> +     format =3D v4l2_subdev_state_get_format(state, link->so=
urce->index, 0);
> > > > >>>>> +     v4l2_subdev_unlock_state(state);
> > > > >>>>> =20
> > > > >>>>> -     if (source_fmt.format.width !=3D csi_fmt->width) {
> > > > >>>>> +     if (!format) {
> > > > >>>>> +             dev_dbg(csi->dev,
> > > > >>>>> +                     "Skipping validation as no format prese=
nt on \"%s\":%u:0\n",
> > > > >>>>> +                     link->source->entity->name, link->sourc=
e->index);
> > > > >>>>> +             return 0;
> > > > >>>>
> > > > >>>> Isn't this an error?
> > > > >>>
> > > > >>> Well, the j7 shim subdev introduced here has immutable and acti=
ve links to
> > > > >>> all the video nodes, for each DMA channel (taken from DT), many=
 of which
> > > > >>> may be unused for certain setups, and thus there might not be a=
ny valid
> > > > >>> format on the subdev source pad corresponding to an unused vide=
o node.
> > > > >>>
> > > > >>> Jacopo had a similar comment on v2, see this discussion (grep f=
or Mali):
> > > > >>> https://lore.kernel.org/linux-media/4mnlnsj4co3agvln4qsasmgvgwi=
yoo7yu2h5wyh4rmzzafhm5u@avhnbw7iknms/
> > > > >>>
> > > > >>> I know other drivers use a different approach with mutable link=
s, so it
> > > > >>> would be good if you/Laurent/Sakari can give your opinions on i=
f only one
> > > > >>> of these two approaches should be taken for multi-stream pipeli=
nes.
> > > > >>
> > > > >> I see.
> > > > >>
> > > > >> Well, I don't have a definite answer. With some thinking both op=
tions
> > > > >> make certain sense. It makes sense to keep the links immutable a=
nd
> > > > >> always enabled, as there's no configuration that can be done. On=
 the
> > > > >> other hand, it makes sense to require the unused links to be dis=
abled,
> > > > >> as, well, they are not used.
> > > > >=20
> > > > > I'm not familiar with the implications this would have on this dr=
iver,
> > > > > but generally speaking, if a stream is added to the media pipelin=
e by
> > > > > the pipeline build algorithm, then it is expected that applicatio=
ns
> > > > > would have configured it correctly. Streams that are not used are
> > > > > expected to be disabled if they would otherwise be added to the
> > > > > pipeline.
> > > >=20
> > > > I think the thing here is that the driver creates immutable
> > > > always-enabled media links between the videodevs and the first subd=
ev.
> > > > Then, say, if only one stream is being used, only one of those link=
s is
> > > > actually used, and for every other link the above check fails as th=
ere's
> > > > no stream, so no format.
> > > >=20
> > > > In TI CAL driver the links were mutable, and unused links had to be
> > > > disabled. There it made sense as the links had to be configurable (=
there
> > > > were two PHYs). Here, there's no configuration needed, so immutable
> > > > links make sense, but then they're enabled even when actually not u=
sed.
> > >=20
> > > If the routing table in the subdev does not contain any route that go=
es
> > > towards a video node, then that video node should not be added to the
> > > pipeline by the validation code, and no validation will be attempted.=
 At
> > > least that's the theory.
> >=20
> > Okay that sounds reasonable. I can take a look into the media pipeline
> > validation code next week. @Rishikesh, given you already have a working
> > setup, feel free to test if the link_validate callback is triggered on
> > video nodes that don't have any streams/routes pointing to them.

I finally got time to check this out, and yes, the subdev pads with no
route going to them are added in the pipeline currently, as the subdev is
missing the .has_pad_interdep operation. Using the framework helper, which
marks two pads as interdependent only if they have an active route, fixes i=
t.

Rishikesh, can you please apply the following before you post v12 of your
series:

---------
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driver=
s/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f126649ba36c..42da8bd6b53c 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1340,10 +1340,10 @@ static int ti_csi2rx_link_validate(struct media_lin=
k *link)
        v4l2_subdev_unlock_state(state);

        if (!format) {
-               dev_dbg(csi->dev,
-                       "Skipping validation as no format present on \"%s\"=
:%u:0\n",
+               dev_err(csi->dev,
+                       "No format present on \"%s\":%u:0\n",
                        link->source->entity->name, link->source->index);
-               return 0;
+               return -EPIPE;
        }

        if (format->width !=3D csi_fmt->width) {
@@ -1389,6 +1389,7 @@ static const struct media_entity_operations ti_csi2rx=
_video_entity_ops =3D {

 static const struct media_entity_operations ti_csi2rx_subdev_entity_ops =
=3D {
        .link_validate =3D v4l2_subdev_link_validate,
+       .has_pad_interdep =3D v4l2_subdev_has_pad_interdep,
 };

 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
---------

And while above alone fixes this issue, I saw cdns-csi2rx pads that are unu=
sed
also get added to the pipeline, which seems wrong even if it doesn't break
anything. So please apply the below in the patch that adds multistream supp=
ort
for cdns-csi2rx:

---------
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/p=
latform/cadence/cdns-csi2rx.c
index 7164a7d6f4a1..18737d00a7d7 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -803,6 +803,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_int=
ernal_ops =3D {
 static const struct media_entity_operations csi2rx_media_ops =3D {
        .link_validate =3D v4l2_subdev_link_validate,
        .get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
+       .has_pad_interdep =3D v4l2_subdev_has_pad_interdep,
 };

 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,
---------

Thanks,
Jai

> >=20
> > > I see that this driver implements .link_validate() as a
> > > media_entity_operations, not a subdev operation. I wonder if that cou=
ld
> > > explain the issue.
> >=20
> > Well earlier I was partially confused, now I'm fully confused :-)
> >=20
> > How is v4l2_subdev_pad_ops.link_validate different from
> > media_entity_operations.link_validate?
>=20
> media_entity_operations.link_validate() is the entry point, called by
> the media pipeline validation code that is agnostic to entity types. It
> is called on the sink entity of each link.
>=20
> When the sink is a subdev, the common practice is to implement
> media_entity_operations.link_validate() using
> v4l2_subdev_link_validate(), which iterates over streams and validate
> them individually with v4l2_subdev_pad_ops.link_validate(). That
> operation can be left out if the default implementation
> v4l2_subdev_link_validate_default() is enough, or a custom
> .link_validate() operation can be provided that calls
> v4l2_subdev_link_validate_default() and performs additional checks (or
> implements all checks manually without calling
> v4l2_subdev_link_validate_default() for very uncommon cases).
>=20
> In this case, though, the sink is a video device, so
> v4l2_subdev_link_validate() can't be used. I overlooked that in my
> previous reply, sorry about it. As a link to a video node can only carry
> a single stream, it seems that the issue here is caused by the link
> being included in the media pipeline in the first place.
> drivers/media/mc/mc-entity.c contains detailed debug messages that
> explain how a pipeline is constructed, I would start by enabling them
> and investigating what happens.
>=20
> > I see mc-core.rst and v4l2-subdev.rst both talk about their own variant,
> > without making it clear which should be used for a subdev.
> >=20
> > Anyway, I'll try to dig through the framework code to understand what's
> > going wrong.
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

