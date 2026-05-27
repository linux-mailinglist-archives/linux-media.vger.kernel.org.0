Return-Path: <linux-media+bounces-62851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDkfDKSkFmoOoAcAu9opvQ
	(envelope-from <linux-media+bounces-62851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:00:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3D5E0C45
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C43B4301B1CA
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 07:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953A63CF673;
	Wed, 27 May 2026 07:59:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E03CF02C;
	Wed, 27 May 2026 07:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868785; cv=none; b=iM0u8oHRH8yEo3CCnub4Jf8n6dwskgA3ujhdrROiuAKOezNNSaRpQhUj1+Xk2DbHKTe0yP9/oOqI/6/QReN8rrvuBuBVbFss/6r9zCOlSFKNw8cvQiIYqm7Pb6sszhkiYVSlfw5SBv0jywCXO60w7Ftpz/6iVBrXHqGUV3sYrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868785; c=relaxed/simple;
	bh=6ORNqX2NMd5fVTpHcNgCVdvQ6w0xBlVFFOjuVNOx+0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH8r9aXz39HQToaQervYRRAjkK7dBR6hQMiUfGuMxpIeI/WDnvw2pvOJXjnXA2jUwLagoYXzIOT3LK1tnirdVQPSHzebtr/5y7gWt6rCXpy0gOX9Bit7N6xMKn9pxqy7RuOeqcUAS3RAnW+Zfw6E55mBhWpJty28R22FkEZFjVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 6C78337002EA;
	Wed, 27 May 2026 07:59:34 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 5E59CB40916; Wed, 27 May 2026 07:59:32 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [37.167.96.158])
	by laika.paulk.fr (Postfix) with ESMTPSA id A8A93B4090D;
	Wed, 27 May 2026 07:59:29 +0000 (UTC)
Date: Wed, 27 May 2026 09:59:18 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: arash golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric
 format enumeration
Message-ID: <ahakVq7Fv78ODicG@shepard>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-11-paulk@sys-base.io>
 <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VM0xxLJ6muTXhGz3"
Content-Disposition: inline
In-Reply-To: <CAMxPZkiKBFsPA5x6KpBajGqO5xqxD5AOd26j3uwqnQko1VzknQ@mail.gmail.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62851-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,ideasonboard.com,collabora.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.891];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,paulk.fr:url]
X-Rspamd-Queue-Id: 1AE3D5E0C45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--VM0xxLJ6muTXhGz3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 27 May 26, 09:20, arash golgol wrote:
> On Mon, May 18, 2026 at 2:00=E2=80=AFPM Paul Kocialkowski <paulk@sys-base=
=2Eio> wrote:
> >
> > Use the dedicated helper to check possible pixelformats against the
> > provided mbus code in order to support MC-centric format enumeration.
> >
> > Note that multiple pixelformats may be returned for a given mbus code.
> >
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
> >  1 file changed, 34 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c=
 b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index a836fa7f081a..409c28621093 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file=
 *file, void *priv,
> >  static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
> >                                       struct v4l2_fmtdesc *fmtdesc)
> >  {
> > +       const struct sun6i_csi_capture_format *capture_format;
> > +       const struct sun6i_csi_bridge_format *bridge_format;
> > +       u32 mbus_code =3D fmtdesc->mbus_code;
> >         u32 index =3D fmtdesc->index;
> > +       unsigned int index_valid =3D 0;
> > +       unsigned int i;
> > +
> > +       /* Video-node-centric enumeration. */
> > +       if (!mbus_code) {
> > +               if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +                       return -EINVAL;
> > +
> > +               fmtdesc->pixelformat =3D
> > +                       sun6i_csi_capture_formats[index].pixelformat;
> > +               return 0;
> > +       }
> >
> > -       if (index >=3D ARRAY_SIZE(sun6i_csi_capture_formats))
> > +       bridge_format =3D sun6i_csi_bridge_format_find(mbus_code);
> > +       if (!bridge_format)
> >                 return -EINVAL;
> >
> > -       fmtdesc->pixelformat =3D sun6i_csi_capture_formats[index].pixel=
format;
> > +       for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > +               capture_format =3D &sun6i_csi_capture_formats[i];
> >
> > -       return 0;
> > +               if (!sun6i_csi_capture_format_check(capture_format,
> > +                                                   bridge_format))
> > +                       continue;
> > +
> > +               if (index_valid =3D=3D index) {
> > +                       fmtdesc->pixelformat =3D capture_format->pixelf=
ormat;
> > +                       return 0;
> > +               }
> > +
> > +               index_valid++;
> > +       }
> > +
> > +       return -EINVAL;
> >  }
> >
> >  static int sun6i_csi_capture_enum_framesize(struct file *file, void *f=
h,
> > @@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_devi=
ce *csi_dev)
> >
> >         strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> >                 sizeof(video_dev->name));
> > -       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING;
> > +       video_dev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING |
> > +                                V4L2_CAP_IO_MC;
> >         video_dev->vfl_dir =3D VFL_DIR_RX;
> >         video_dev->release =3D video_device_release_empty;
> >         video_dev->fops =3D &sun6i_csi_capture_fops;
> > --
> > 2.54.0
> >
>=20
> Tested on a LicheePi Zero Dock (V3s) with the following pipeline:
>=20
> ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
>=20
> I verified that mbus-code-based format enumeration works correctly
> from userspace and that the reported capture formats change according
> to the selected media bus format.
>=20
> I could also successfully start streaming with several of the
> enumerated capture formats (e.g. YUYV and BA81)

Excellent, thank-you very much for testing this!

> However, I could not fully validate actual format conversion behavior
> (e.g. MEDIA_BUS_FMT_YUYV8_2X8 to NV12) because my OV7670 setup
> currently has non-functional test patterns except for 'shifting-1'
> mode.

That's fine. I don't think I have tested it recently either.

> Tested-by: Arash Golgol <arash.golgol@gmail.com>
>=20
> PS:
>=20
> While testing this patch I also noticed that
> VIDIOC_SUBDEV_ENUM_MBUS_CODE reports duplicate entries for:
>  - MEDIA_BUS_FMT_UYVY8_2X8
>  - MEDIA_BUS_FMT_UYVY8_1X16
> on sun6i-csi-bridge.

I just had a look and you are definitely right, the entries are clearly
duplicates and at the same time all the relevant formats are included, so t=
hey
are not taking the place of another format that was forgotten.

You're welcome to submit a patch to remove these entries if you'd like,
or I could do it otherwise.

By the way would you be interested in testing the H.264 encoder support for
V3/V3s once I send a first version for it? I had written initial support for
it a while ago (did not send it to the list) and now that my work on the V4=
L2
stateless uAPI has reached a point of usability I will probably try to upda=
te
my rework of the cedrus driver to use it.

All the best,

Paul

> This appears to come from duplicate format entries being exposed by
> the bridge driver.
>=20
> --=20
> Regards,
> Arash Golgol

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VM0xxLJ6muTXhGz3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoWpFYACgkQhP3B6o/u
lQxhLQ//UIWt6mBSslymh22RIUaC6Ssr3TIPM+Sa5Ik1yWHnmejqqtwsxJB+oAnr
jY32nQFq3RCmrrYqTmPGnKT5GwzKfkLXpdmrCGfE5GWIMKUVGaDvUwGLs+NCdaHZ
RR7Yye5eWXPnFuReDK94PJobjvM2SAfedOatfBdL9e4QWU3Oy2d43spUe1uvjtrY
CbMsddSpG5CJt/QtfiaTf850AJIkzqIaSrRNhuspnNrVIGy6V/w+HUSODSJmivGt
m1+s1MowdYEboSN1U6eFfT+Icg5pKtU81lNgY+YZBtZlmAQmumDnq1KZSj4RUhAI
YHIuK8A+8nro002WFKuepuT7TTj6V49sNt6GG6Muko+BhSXMm9SRF43w6aTY7de0
TW+JX5fzd0tDPMqV+DRiiRUEkIiKwb4FvX+601aTRlYTXcRbOdtL/jGoIVyvVmet
B2tXadzbZ4bxhsSqfrLwLmwuMgoT7gZboI6kqk3ztei4v2ZTcE5j2iT7RU6HRRWl
MHsq2GeRqpnH2Y/anQDRXIq0U5S1xkG4syfG+uA8PweftAqO/tusvUVRqODdPfAL
X9wfdXCS0usJyCfNB4lTyiAJnEcs3/s35plcFIsQsAJDdqj2Gnb3N5bTMSMfgS9s
FN5U8zy9gSslrokVVy6IsQ/+K5/K2PGuvqE0gVwDDMKeS0UQOs8=
=Li0w
-----END PGP SIGNATURE-----

--VM0xxLJ6muTXhGz3--

