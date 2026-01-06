Return-Path: <linux-media+bounces-50034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9ECF8CF5
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 065CB30239C5
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 14:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DB0313539;
	Tue,  6 Jan 2026 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kNe+40DL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534930F95B
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710125; cv=none; b=A6K8tzzT9VPW7vdWpavdQ74nUZoDqLu8+HZ7jcwEC39fjYgIZw/id1NJMmeBpnFdM/wY0FHWvIzEjMlFny/B+44va0QHGh7F3PRqnUJiScyP2BzsOPI2IInrV23yBGLisafB2R3uOcBR9TIhjEgn3NvE+ubAMfaol8d57AI74X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710125; c=relaxed/simple;
	bh=h39ke5y9f92AbzBI2RDb47yNXk0tfTSItxjwn8ZJRUE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nxY9FTkXNlInjovAqt0u4PngUcB6qaQtXIeTOCvxFSiT7KiWPoE2VvCOUwAbGXPMhoUU4sN6jgWGDfuuU05+cQDWcnOk/HgO++6jU7uxJK1iBcOgWmdyTlajjyZ3vEuWQqAclVedoj56mZvDqBrOpMF3A2Q1j5fnhjJUu6txml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=kNe+40DL; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88888c41a13so11505706d6.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 06:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767710122; x=1768314922; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h39ke5y9f92AbzBI2RDb47yNXk0tfTSItxjwn8ZJRUE=;
        b=kNe+40DLgfUIlhiZcU5LYUzO1tW85a9roDOMcO1k0ltImOHcTvfq+YgIe+Ncu9Segn
         NHNBNzCmaeEPFM8/7mY6Z9aPTG5EFEZkgE1pfirwvn9k0rKZ0+vmmsdJx7f1OKJoy8EF
         cA9DdNRjM9hcp6mXPltJ4pMC/iHiF/3fU8/Vm3mUpB1X7l6eoPVfL5WiedrQ5jQBDU3M
         5qUFGSPPyng1vCDCE0+fMC7CoA7lGnNDhCFFEchglP6R3u+3bARgD371/H1DBnB4ekT3
         jsXF1caU9AtGF7BXJbKzm/x7UryUQU6lcn/272RWXTN2z7F72v9xv9+KraSmu5Lzl1wc
         S+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710122; x=1768314922;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h39ke5y9f92AbzBI2RDb47yNXk0tfTSItxjwn8ZJRUE=;
        b=TWavX9NNvVMtMHg8C4gZGwXgIOWJAKExo5Z8Ov7awjnIoN+fjoWSAnz79WyQD9wwWQ
         8iq2pAwtCP/9Wq4/Y+Z+CEh8W3H9fpa3zFDPJL6mI7owimTThekHg/s64XVhE/HgqOyn
         hnOhufqSECx7n1vbwJMQr1aF+ugDD0SOgR+FH9+BGT1xuaXPfHqphz6GssLyiC2ZD5cJ
         RSm55BotSThZKC8twdH7sD3xnYCGDurVCZTA6LWKlhh3ua2YZOK9vyb7JKyE6Xl0zsjh
         pV5VCXjd2WO/UtmRvGaoyfKLpN+eDILfh4ejPVNKria4+1DB14xxciMoB97tPlhLxARb
         tBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS1VhTvqd356/RI2hG0K3sYRs3I4jfQQ6VBIrtqIOR3jSq2srxPJ9qIDZ5gFByV4Ew/u0U54pM6wrLcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgImDBEx3QNCQvGX4dRFq/OPHSldSgwnAsS6ZEvyVFAWb+Qtrc
	W7O8GALxp7XS0F/pdZ9gEDwydUKY/vHdAVLtqhv8bNZgy5CEW4GxyMtDY4Fns1ZzXc8=
X-Gm-Gg: AY/fxX58MOMcqZS4C6TLRtioQTzl4ECE+3EQS8WlIB6JcM75je14QUjh+1GLaWKTdgW
	4HjmqKZoqyLGMyj5SXC/j0C+t2ca/LtMPnY/BgH5ECD/LKjOstTmvnRpYgICqi/myBzOKNKduwK
	chIfck215ZF6zq0niiMrsHf0SwNc6oK0UxD1ugLKzv4jm5nSBZ4Zn5LuKZ2lQ8p4/n4azVRAQg2
	9UQJZkqJtxcFIWWR05i0AryI8TFkdtLWGORDGSMkdNx/e5ki0haW6QM16VZCWkNx8ZBhNUvl+gc
	j+rwAjMR4SG3mSJJRSmMnaPR3OgtGce2nYjPXZo3vQ59N2luYsj/FNkZ4nkScOo8/30KTfNf/mD
	HiUnq7+mO0z89Pn59Xj3dBhAfSB57+JL9kvJFAx8CHsynFhclV0X8mkcReCYIv4VbzkQ002Odtq
	w0mFqL1WzwaLKIssBH
X-Google-Smtp-Source: AGHT+IF+FZylM/r3oYsQSJvqqbGM5TwMEFuIMFSWCueH63ZefAjpoXo0SzyB/LJZbXcRuONdROAdxw==
X-Received: by 2002:a05:6214:f2b:b0:87c:2360:d404 with SMTP id 6a1803df08f44-89075d17393mr48106976d6.7.1767710121916;
        Tue, 06 Jan 2026 06:35:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2aa5sm14514676d6.19.2026.01.06.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:35:20 -0800 (PST)
Message-ID: <7c514e1165f49c2e043b7f4ab5fcbd1003c517ae.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Stefan Klug <stefan.klug@ideasonboard.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Date: Tue, 06 Jan 2026 09:35:19 -0500
In-Reply-To: <176770897731.12184.12302111059048415045@localhost>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
	 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
	 <20260106003302.GJ10026@pendragon.ideasonboard.com>
	 <176770897731.12184.12302111059048415045@localhost>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2CUpOHeKO6W6wYQ05w18"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-2CUpOHeKO6W6wYQ05w18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 06 janvier 2026 =C3=A0 15:16 +0100, Stefan Klug a =C3=A9crit=C2=A0=
:
> Hi Nicolas, hi Laurent,
>=20
> Thank you for the review.
>=20
> Quoting Laurent Pinchart (2026-01-06 01:33:02)
> > On Mon, Jan 05, 2026 at 01:46:46PM -0500, Nicolas Dufresne wrote:
> > > Le lundi 05 janvier 2026 =C3=A0 12:35 +0100, Stefan Klug a =C3=A9crit=
=C2=A0:
> > > > The dw100 dewarper hardware present on the NXP i.MX8MP allows very
> > > > flexible dewarping using a freely configurable vertex map. Aside fr=
om
> > > > lens dewarping the vertex map can be used to implement things like
> > > > arbitrary zoom, pan and rotation. The current driver supports setti=
ng
> > > > that vertex map before calling VIDIOC_STREAMON.
> > > >=20
> > > > To control above mentioned features during streaming it is necessar=
y to
> > > > update the vertex map dynamically. To do that in a race free manner=
 V4L2
> > > > requests support is required. This patch adds V4L2 requests support=
 to
> > > > prepare for dynamic vertex map updates.
> > > >=20
> > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > >=20
> > > > ---
> > > >=20
> > > > Changes in v1:
> > > > - Moved v4l2_ctrl_request_complete into dw100_device_run
> > > > ---
> > > > =C2=A0drivers/media/platform/nxp/dw100/dw100.c | 41
> > > > ++++++++++++++++++++++++++++----
> > > > =C2=A01 file changed, 36 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> > > > b/drivers/media/platform/nxp/dw100/dw100.c
> > > > index
> > > > 4aaf9c3fff5397f0441944ee926f2c8ba6fc864a..7f14b82c15a071605c124dbb8=
68f80
> > > > 03856c4fc0 100644
> > > > --- a/drivers/media/platform/nxp/dw100/dw100.c
> > > > +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > > > @@ -459,6 +459,15 @@ static int dw100_queue_setup(struct vb2_queue =
*vq,
> > > > =C2=A0=C2=A0=C2=A0 return 0;
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static int dw100_buf_out_validate(struct vb2_buffer *vb)
> > > > +{
> > > > +=C2=A0=C2=A0 struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(v=
b);
> > > > +
> > > > +=C2=A0=C2=A0 vbuf->field =3D V4L2_FIELD_NONE;
> > > > +
> > > > +=C2=A0=C2=A0 return 0;
> > > > +}
> >=20
> > Stefan, how is this related to requests support ?
>=20
> vb2_queue_or_prepare_buf() errors out if this is not implemented and the
> buffer uses requests. This was the implementation I saw on most drivers.
> And as I don't expect anyone to try to use the dewarper with interleaved
> data I didn't bother to add a warning.

I'm stumbled on this one too, but I completely forgot what this callback wa=
s
about and assume something like this. I suspect it might be some left over =
from
when we required all request to hold all the controls, we should find a way=
 to
make that optional, and sort out this field thing, but I'd say its not a pr=
oblem
for this serie.

>=20
> >=20
> > > > +
> > > > =C2=A0static int dw100_buf_prepare(struct vb2_buffer *vb)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0 unsigned int i;
> > > > @@ -500,6 +509,13 @@ static void dw100_buf_queue(struct vb2_buffer =
*vb)
> > > > =C2=A0=C2=A0=C2=A0 v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> > > > =C2=A0}
> > > > =C2=A0
> > > > +static void dw100_buf_request_complete(struct vb2_buffer *vb)
> > > > +{
> > > > +=C2=A0=C2=A0 struct dw100_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_qu=
eue);
> > > > +
> > > > +=C2=A0=C2=A0 v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl=
);
> >=20
> > Unless I'm missing something, this will call
> > v4l2_ctrl_request_complete() twice, once on each of the source and
> > destination buffers, for the same request and control handler. Is that
> > desired ?
>=20
> The docs say "a buffer that was never queued to the driver but is
> associated with a queued request was canceled..." So to my understanding
> the only purpose of this function is to mark all controls in the request
> as being handled, so that the request can be finished.
>=20
> All the implementations I found in the kernel are exactly the same and
> are to my understanding only necessary to map from a vb2_buffer to a
> v4l2_ctrl_handler (which is then passed to v4l2_ctrl_request_complete())

vb2 does not have access to the control handler, so it cannot call
v4l2_ctrl_request_complete() when the request is never passed to the driver=
.
This is only called if the request is being discarded in the background. Th=
ere
is certainly room for improvement here.

>=20
> >=20
> > > > +}
> > > > +
> > > > =C2=A0static void dw100_return_all_buffers(struct vb2_queue *q,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state state)
> > > > =C2=A0{
> > > > @@ -553,11 +569,13 @@ static void dw100_stop_streaming(struct vb2_q=
ueue
> > > > *q)
> > > > =C2=A0}
> > > > =C2=A0
> > > > =C2=A0static const struct vb2_ops dw100_qops =3D {
> > > > -=C2=A0=C2=A0 .queue_setup=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_queue_=
setup,
> > > > -=C2=A0=C2=A0 .buf_prepare=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_buf_pr=
epare,
> > > > -=C2=A0=C2=A0 .buf_queue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw=
100_buf_queue,
> > > > -=C2=A0=C2=A0 .start_streaming =3D dw100_start_streaming,
> > > > -=C2=A0=C2=A0 .stop_streaming=C2=A0 =3D dw100_stop_streaming,
> > > > +=C2=A0=C2=A0 .queue_setup=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D dw100_queue_setup,
> > > > +=C2=A0=C2=A0 .buf_out_validate=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_b=
uf_out_validate,
> > > > +=C2=A0=C2=A0 .buf_prepare=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D dw100_buf_prepare,
> > > > +=C2=A0=C2=A0 .buf_queue=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D dw100_buf_queue,
> > > > +=C2=A0=C2=A0 .start_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw=
100_start_streaming,
> > > > +=C2=A0=C2=A0 .stop_streaming=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D dw100_stop_streaming,
> > > > +=C2=A0=C2=A0 .buf_request_complete =3D dw100_buf_request_complete,
> > > > =C2=A0};
> > > > =C2=A0
> > > > =C2=A0static int dw100_m2m_queue_init(void *priv, struct vb2_queue =
*src_vq,
> > > > @@ -575,6 +593,7 @@ static int dw100_m2m_queue_init(void *priv, str=
uct
> > > > vb2_queue *src_vq,
> > > > =C2=A0=C2=A0=C2=A0 src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMEST=
AMP_COPY;
> > > > =C2=A0=C2=A0=C2=A0 src_vq->lock =3D &ctx->vq_mutex;
> > > > =C2=A0=C2=A0=C2=A0 src_vq->dev =3D ctx->dw_dev->v4l2_dev.dev;
> > > > +=C2=A0=C2=A0 src_vq->supports_requests =3D true;
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0 ret =3D vb2_queue_init(src_vq);
> > > > =C2=A0=C2=A0=C2=A0 if (ret)
> > > > @@ -1460,6 +1479,12 @@ static void dw100_device_run(void *priv)
> > > > =C2=A0=C2=A0=C2=A0 src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ct=
x);
> > > > =C2=A0=C2=A0=C2=A0 dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ct=
x);
> > > > =C2=A0
> > > > +=C2=A0=C2=A0 v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &ctx->hdl);
> > > > +
> > > > +=C2=A0=C2=A0 v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.r=
eq,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0 &ctx->hdl);
> > >=20
> > > The request should always be signalled last, so nothing wrong with
> > > applying the
> > > controls as soon as possible in this case. Complete is a bit of a mis=
s-
> > > leading
> > > name, this function actually changes the global controls value (apply=
) and
> > > removes its participation in request completion. Since the OUTPUT buf=
fer
> > > for
> > > that request is still queued, the request is not signalled yet.
> >=20
> > I'm very confused here. As far as I can tell,
> > v4l2_ctrl_request_complete() doesn't apply controls (i.e. cause
> > .s_ctrl() to be called), it copies the value of controls back to the
> > request to report them to the application. Am I missing something ?
> >=20
> > As there's nothing to report back to the application (no volatile
> > control whose value will come from the hardware), calling
> > v4l2_ctrl_request_complete() here seems fine to me. Is that what you
> > were trying to explain ?
>=20
> I think that was meant, yes (see next comment)
>=20
> >=20
> > > But you have to flip over the order to buffer signalling in
> > > dw100_job_finish()
> > > though. My recommendation is to use the helper
> > > v4l2_m2m_buf_done_and_job_finish(). Something like this (not tested):
> > >=20
> > > =C2=A0=C2=A0 diff --git a/drivers/media/platform/nxp/dw100/dw100.c
> > > b/drivers/media/platform/nxp/dw100/dw100.c
> > > =C2=A0=C2=A0 index 4aaf9c3fff53..c5f9ee238345 100644
> > > =C2=A0=C2=A0 --- a/drivers/media/platform/nxp/dw100/dw100.c
> > > =C2=A0=C2=A0 +++ b/drivers/media/platform/nxp/dw100/dw100.c
> > > =C2=A0=C2=A0 @@ -1058,7 +1058,6 @@ static const struct v4l2_ioctl_ops
> > > dw100_ioctl_ops =3D {
> > > =C2=A0=C2=A0=C2=A0 static void dw100_job_finish(struct dw100_device *=
dw_dev, bool
> > > with_error)
> > > =C2=A0=C2=A0=C2=A0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct d=
w100_ctx *curr_ctx;
> > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vb2_v4l2_bu=
ffer *src_vb, *dst_vb;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum vb2=
_buffer_state buf_state;
> > > =C2=A0=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 curr_ctx=
 =3D v4l2_m2m_get_curr_priv(dw_dev->m2m_dev);
> > > =C2=A0=C2=A0 @@ -1069,16 +1068,12 @@ static void dw100_job_finish(str=
uct
> > > dw100_device *dw_dev, bool with_error)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_vb =3D v4l2_m2=
m_src_buf_remove(curr_ctx->fh.m2m_ctx);
> > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dst_vb =3D v4l2_m2=
m_dst_buf_remove(curr_ctx->fh.m2m_ctx);
> > > =C2=A0=C2=A0 -
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (like=
ly(!with_error))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf_state =3D VB2_BUF_STATE_DONE;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf_state =3D VB2_BUF_STATE_ERROR;
> > > =C2=A0=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_buf_done(=
src_vb, buf_state);
> > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_buf_done(=
dst_vb, buf_state);
> > > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_buf_done_=
and_job_finish(dw_dev->m2m_dev, buf_state);
> > > =C2=A0=C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(=
&dw_dev->pdev->dev, "Finishing transaction with%s
> > > error(s)\n",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with_error ? "" : "out");
> > > =C2=A0=C2=A0=20
> > > You might be tempted to keep the logical order, and move the
> > > v4l2_ctrl_request_complete() call into dw100_job_finish(), unfortunat=
ely
> > > this
> > > does not work, since nothing mandate that any control was included in=
 this
> > > request, and that will lead to calling v4l2_ctrl_request_complete() o=
n an
> > > already completed request. Since its a single function HW, I don't se=
e why
> > > you'd
> > > want this, but it would require the manual request completion.
> > >=20
>=20
> Nicolas, if I go you right you mean that one might be tempted to do
>=20
> v4l2_ctrl_request_setup()
> v4l2_m2m_buf_done(src)
> v4l2_m2m_buf_done(dst)
> v4l2_ctrl_request_complete()
>=20
> which feels natural from the names of the functions, but the
> v4l2_m2m_buf_done(src) might complete the request if it has no
> associated controls and therefore the later v4l2_ctrl_request_complete()
> would fail...
>=20
> I see that the usage of v4l2_m2m_buf_done_and_job_finish() is more
> compact and will use that in v2. For the sake of understanding: The only
> functional issue with my code is that v4l2_m2m_buf_done(src_buf) is
> called before v4l2_m2m_buf_done(dest_buf), right?

Correct, swapping these two would work too, but as you said, I proposed
v4l2_m2m_buf_done_and_job_finish() simply because it is more compact and fi=
ts
your use case. The extra code in the helper is for capture buffer holding, =
which
at least for now does not apply to you.

>=20
> > > > +
> > > > =C2=A0=C2=A0=C2=A0 dw100_start(ctx, src_buf, dst_buf);
> > >=20
> > > nit: I really don't see why this is a separate function ...
>=20
> I wondered that also, but didn't want to mess too much with existing
> code. Maybe as a fixup on top?

Feel free to do so.

Nicolas

>=20
> Best regards,
> Stefan
>=20
> > >=20
> > > > =C2=A0}
> > > > =C2=A0
> > > > @@ -1467,6 +1492,11 @@ static const struct v4l2_m2m_ops dw100_m2m_o=
ps =3D
> > > > {
> > > > =C2=A0=C2=A0=C2=A0 .device_run=C2=A0=C2=A0=C2=A0=C2=A0 =3D dw100_de=
vice_run,
> > > > =C2=A0};
> > > > =C2=A0
> > > > +static const struct media_device_ops dw100_m2m_media_ops =3D {
> > > > +=C2=A0=C2=A0 .req_validate =3D vb2_request_validate,
> > > > +=C2=A0=C2=A0 .req_queue =3D v4l2_m2m_request_queue,
> > > > +};
> > > > +
> > > > =C2=A0static struct video_device *dw100_init_video_device(struct dw=
100_device
> > > > *dw_dev)
> > > > =C2=A0{
> > > > =C2=A0=C2=A0=C2=A0 struct video_device *vfd =3D &dw_dev->vfd;
> > > > @@ -1578,6 +1608,7 @@ static int dw100_probe(struct platform_device
> > > > *pdev)
> > > > =C2=A0=C2=A0=C2=A0 dw_dev->mdev.dev =3D &pdev->dev;
> > > > =C2=A0=C2=A0=C2=A0 strscpy(dw_dev->mdev.model, "dw100", sizeof(dw_d=
ev->mdev.model));
> > > > =C2=A0=C2=A0=C2=A0 media_device_init(&dw_dev->mdev);
> > > > +=C2=A0=C2=A0 dw_dev->mdev.ops =3D &dw100_m2m_media_ops;
> > > > =C2=A0=C2=A0=C2=A0 dw_dev->v4l2_dev.mdev =3D &dw_dev->mdev;
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0 ret =3D video_register_device(vfd, VFL_TYPE_VIDE=
O, -1);
> >=20
> > --=20
> > Regards,
> >=20
> > Laurent Pinchart

--=-2CUpOHeKO6W6wYQ05w18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0dpwAKCRDZQZRRKWBy
9I38AQD5puf4F/s5OB+QaY8CPkUKJpSnUjUCwRCaNoLxLcm8gwEA+YlfTbMqNr2N
+gRRtiiA361YHfouIByR0bIJ/+JkDAU=
=um3x
-----END PGP SIGNATURE-----

--=-2CUpOHeKO6W6wYQ05w18--

