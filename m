Return-Path: <linux-media+bounces-50032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C7CF8C86
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 083F6300B9FA
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 14:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253B63128BA;
	Tue,  6 Jan 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WrueaeCe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FDF309EF5;
	Tue,  6 Jan 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709777; cv=none; b=ahk6uRLaJdeTPQSwNPlRq0oQg2jaQpaDsyaUZGPteEuL6yGINlTAVReeepwxnNQz2I+t3DplO5xDCKrXwGKmy0zsusUq3h3FkqCec6z4zZYAxqt8DUjsW2YPjApZDdmcJu5kyr30C2b/AhO+UARpZpFwg2NZtt4cLfoHyQ9j9sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709777; c=relaxed/simple;
	bh=Xey4HgxTlOR3c58sZv8yRrSGsEqzKn0D+tUwZfCM3Co=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=TAbd+fbXoYlp36licyUtQKbnylyxYFzkZKasiZi8vIhEb0i6AUx0whUW86JzWYAODpp2WOuVhMPmlCyLXva55QRqzTOCiSJpzBoUOIW1HAL6DtZo0cVJnegdxUNGHgP1Cyrz3oGYir6VbXrw78e4r8gyxcI2ZLPgmiJGSmCqtbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WrueaeCe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:8c3f:64f1:feb8:928b])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 969E0129;
	Tue,  6 Jan 2026 15:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767709752;
	bh=Xey4HgxTlOR3c58sZv8yRrSGsEqzKn0D+tUwZfCM3Co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WrueaeCerldplzbYGqb2Rb36M0iy1yBGB2nu2QptSAElUyMsAbOG/8Bins2z6Ybmd
	 /PhOvcFoab3LSsVXRy+k5J+2K8HvGFZD5Mv+fpgk3+tDFEfFOf5USZstSFFExtRDDY
	 O+2pMLIgBawkWBUzhI4AgNzY9mu1ArrxDyfHEPjU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com> <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-2-65af34d04fd8@ideasonboard.com> <f4e0b1f13ee54d88d1035828af548f5cf3a25c16.camel@ndufresne.ca> <20260106004206.GK10026@pendragon.ideasonboard.com> <2dbb2c41422cb4dbc8c3692646aeaf70c4d87df0.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: dw100: Implement dynamic vertex map update
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne <nicolas@ndufresne.ca>
Date: Tue, 06 Jan 2026 15:29:30 +0100
Message-ID: <176770977089.12184.13455944501335843394@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi,

Quoting Nicolas Dufresne (2026-01-06 14:47:59)
> Hi,
>=20
> Le mardi 06 janvier 2026 =C3=A0 02:42 +0200, Laurent Pinchart a =C3=A9cri=
t=C2=A0:
> > On Mon, Jan 05, 2026 at 01:58:25PM -0500, Nicolas Dufresne wrote:
> > > Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=
=C2=A0:
> > > > Implement dynamic vertex map updates by handling the
> > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP control during streaming.=
 This
> > > > allows to implement features like dynamic zoom, pan, rotate and dew=
arp.
> > > >=20
> > > > To stay compatible with the old version, updates of
> > > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP are ignored during stream=
ing
> > > > when requests are not used. Print a corresponding warning once.
> > > >=20
> > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > ---
> > > > =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 27 +++++++++++++++=
++++++------
> > > >=20
>=20
> [...]
>=20
> > > > =C2=A0 dev_dbg(&ctx->dw_dev->pdev->dev,
> > > > =C2=A0         "%ux%u %s mapping created (d:%pad-c:%p) for stream %=
ux%u->%ux%u\n",
> > > > @@ -351,6 +355,7 @@ static int dw100_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > =C2=A0 switch (ctrl->id) {
> > > > =C2=A0 case V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP:
> > > > =C2=A0         ctx->user_map_is_set =3D true;
> > > > +         ctx->user_map_needs_update =3D true;
> > >=20
> > > This will be called before the new mapping is applied by
> > > v4l2_ctrl_request_complete(), and then may be cleared too soon if you=
 queue
> > > depth is high enough.
> >=20
> > v4l2_ctrl_request_complete() does not apply a mapping, what am I missing
> > ?
>=20
> Sorry for my confusion, after reading back, you are correct, this is call=
ed
> v4l2_ctrl_request_setup() inside the device_run() function. You can dismi=
ss the
> bit about user_map_needs_update in my review (the paragraph below).
>=20

That means nothing has to change here, right?

> >=20
> > > Instead, you should check in the request for the presence of
> > > V4L2_CID_DW100_DEWARPING_16x16_VERTEX_MAP to optimize the updates. Yo=
 may still
> > > set this to true if if there is no request, in the case you also want=
ed to
> > > change the original behaviour of only updating that vertex on streamo=
n, but I
> > > don't see much point though.
> > >=20
> > > > =C2=A0         break;
> > > > =C2=A0 }
> > > > =C2=A0
> > > > @@ -405,6 +410,7 @@ static void dw100_ctrl_dewarping_map_init(const=
 struct v4l2_ctrl *ctrl,
> > > > =C2=A0 }
> > > > =C2=A0
> > > > =C2=A0 ctx->user_map_is_set =3D false;
> > > > + ctx->user_map_needs_update =3D true;
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static const struct v4l2_ctrl_type_ops dw100_ctrl_type_ops =
=3D {
> > > > @@ -1482,6 +1488,15 @@ static void dw100_device_run(void *priv)
> > > > =C2=A0 v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > > =C2=A0                         &ctx->hdl);
> > > > =C2=A0
> > > > + if (src_buf->vb2_buf.req_obj.req) {
> > > > +         dw100_update_mapping(ctx);
> > > > + } else if (ctx->user_map_needs_update && !ctx->warned_dynamic_upd=
ate) {
> > > > +         ctx->warned_dynamic_update =3D true;
> > > > +         dev_warn(&ctx->dw_dev->pdev->dev,
> > > > +                 "V4L2 requests are required to update the vertex =
map dynamically"
> > >=20
> > > Do you know about dev_warn_once() ? That being said, the driver is us=
able
> > > without requests and a static vertex (and must stay this way to not b=
reak the
> > > ABI). I don't think you should warn here at all.

My idea was that I'd like to see the warning once per context and not
once per boot. Afaik I can't use dev_warn_once() for that.

> >=20
> > Applications should move to using requests. We'll do so in libcamera
> > unconditionally. I don't expect many other direct users, so warning that
> > the mapping won't be applied when an application sets the corresponding
> > control during streaming without using requests seems fair to me. It
> > will help debugging issues.
>=20
> It is also a miss-use of dev_warn which is meant to indicate a problem wi=
th the
> driver or the hardware. The V4L2 core uses dev_dbg() or customer log leve=
l for
> that in general. Also, don't re-implement _once() variants with
> warned_dynamic_update please. Personally, I would just let the out-of req=
uest
> change the control on the next device_run(), even if that means its out o=
f sync.

But then you end up with potentially difficult to debug issues, because
users would not know that they should use requests. Not warning (or
dev_dbg) has the same effect from my point of view, because users just
see a device not working as expected. Is a customer log level the
solution?

Best regards,
Stefan

>=20
> Nicolas
>=20
> >=20
> > > > +         );
> > > > + }
> > > > +
> > > > =C2=A0 v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req,
> > > > =C2=A0                         =C2=A0=C2=A0 &ctx->hdl);
> > > >

