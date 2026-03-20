Return-Path: <linux-media+bounces-56567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hq+H1KRvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:26:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1812DF5E6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDFAE31A086C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BAE3E4C70;
	Fri, 20 Mar 2026 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EmwgaOf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD83E3C42
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774030523; cv=none; b=DAlkw97IQXswooo8PRlC2O/s+2/881CzI2kXzrPtMj5UtpnQIVVw34e+YOIBjhcVAgl1hjEdK00nsiHatZUy8HJh16BzNVmUUxb3r3qUIWAze672vO45EvQevwZ2RTBaB6rp4Wh1v7dpCwT4evolhfCyUv8rehIDdEKqRemJIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774030523; c=relaxed/simple;
	bh=705491vQG6mAukyM3ZCgh5EYOkpPMr6adr6fn1nkw0o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGqCLw8jG0irSEZiPxC1YgHYi0gCsWRBJgnPFwxYJcwZiUsRI5nyOiOSMTHM8IzGjDghUoa8da/B0kTnIYAU4e2maNLpbjiFlB4eosA0UwdNHH5U8tcVpQj/1hWtDDYJ+VQnbTTtY6Fb6YDWKp5c5EonqLfKlKjRwT4QYsGku60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EmwgaOf7; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89c4feaaeb4so24300216d6.2
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774030521; x=1774635321; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TNtWoywhtCaqax/SX3aYBQWP55sIgtAc6Qsui+MU2Nk=;
        b=EmwgaOf7omxUupbCWRpz2BEv/69svgJiwLJQfQ3H4RvwXxUZoB0+ui+FL4Y6ee1n2g
         PyTwsi26p60dXVTOvoC9BDRfUBGY4vHUd9nyfPnlstAkjcokMXULWmuXJYyohr2GjUMf
         9YISTZZGUUCDbsBUDufUrrcnVXbojO9TKeJU6VBZgpBG1KaTkvIyS9swSkAQz293kKnt
         q/ctmSKkJxKY3j1gPUhaNgITP0e4/DuADM2Mv5To5FCjQE8pZICkbroxWrZYkp/Mi1Lu
         R3LRCfAg7C1TURwq9NACr1Nx2LDJscxrFNawWQWz/glmlAxHDOwW9vDU9ukzb524JQRA
         9HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030521; x=1774635321;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNtWoywhtCaqax/SX3aYBQWP55sIgtAc6Qsui+MU2Nk=;
        b=T5bwgZ7D/6/xcP3fCeXw2lsAsreGLjFz0NzZSYZc8bo53BgI27fbeClvFo5juGQslN
         NhCUE73GmbfXwZS0xHMCRNBg/nAmQKs+nzNzUqn6VxY4AEVVNOBgcEznLMyPrJM9hvEk
         VKlcHDOI2AZhFHYshdgZc2arSrxGqx829tZUc/vHEpZ+BMMCs1Ttb50+vG4leuxeOdr9
         a7NnOS5Zbd1cCAsNBHzdlll9eg0ZC08Mi/BF/Vc0mryHPX3gVmTbe5K/oddq11gb/FFA
         n4a03dIov8V9HdeW53b8uI8qpd8JXNvYMaCo3ZIEUDouKeEb4yaL0DFzHi9nET4UgQBq
         JRfw==
X-Gm-Message-State: AOJu0YxDYYjjsU+0qD4ydyWppDvKjTf1a62vPhTl7aX+nfkXHl3m3iGF
	qS1E3gFHX3UIU9AO2+nN3EV5b9YpEE1G4y8xNwl56E1BubrnyzbGxa1BgBvZwrWcsdM=
X-Gm-Gg: ATEYQzwUI2fduJ1UYwmLhXXrgbWCzvRQtpSsW6QN5FsxbD9pENCnmJPjHADEW6lPV/+
	pgOH3tvwFaTPu4naTCd/WSD1K8QrUtWJp+JV0La5V5SDlwaJw7gSFmsi9kN/jMHJM6oDTirnsp+
	FIhO4S9UBAfEgrY9tByun0iDd81JPuXVocAXB2fFFIJreUi2/52kOwWRIjUdmuo1Ya1Fwm6u7sx
	y0eyrdIJ+vOzOPVrGZr1ocoL69OVl3/WiLPKiGYicdr/PYWfp/yEXJENi8ZBxyfRG5UOH8dv16F
	tUvKAtYTyod8n/fGJLthHqToydDuOqq31aA9XLhKxbwfbom9yutpq8KHXpkUecLyXfdHjpbAIib
	704264VzgWSGILnVRT+pQn9WKG5U0Gp47ZNxayafQggPFZ9agi6GE7SF+mu7y0VX6ZP8bBfA/Gb
	Y96ajQevotxVTevfrpCN0zjT0KPabF
X-Received: by 2002:a05:6214:411a:b0:89c:55c1:4234 with SMTP id 6a1803df08f44-89c859cb38dmr62852066d6.2.1774030519860;
        Fri, 20 Mar 2026 11:15:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85257c9bsm27152706d6.20.2026.03.20.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:15:19 -0700 (PDT)
Message-ID: <a3f116c4077fb32d7fce757c2013719ed34165b7.camel@ndufresne.ca>
Subject: Re: [PATCH v3 11/27] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 14:15:16 -0400
In-Reply-To: <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-t3BfNkZ1XvbTv4YhgNLe"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56567-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 1C1812DF5E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-t3BfNkZ1XvbTv4YhgNLe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
>=20
> This requirement is documented explicitly for the RGA3 in=C2=A0 section 5=
.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.

Note that this patch does not apply cleanly anymore on media tree.

Nicolas

>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv,
> struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize =3D {
> +		.min_width =3D hw->min_width,
> +		.max_width =3D hw->max_width,
> +		.min_height =3D hw->min_height,
> +		.max_height =3D hw->max_height,
> +		.step_width =3D 1,
> +		.step_height =3D 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width =3D 2;
> +		frmsize.step_height =3D 2;
> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv,
> struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height,
> &frmsize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-
> >height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-t3BfNkZ1XvbTv4YhgNLe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2OtAAKCRDZQZRRKWBy
9MmQAQCrq5Bi/y1zl0zHwVIxfCHjsZqGNHwbHIIvV4A/z7/XcAD9G0Q42e3zcsrV
sPuu16CRCrqR+Iovo2HHd2w2m9G1xQc=
=mCI6
-----END PGP SIGNATURE-----

--=-t3BfNkZ1XvbTv4YhgNLe--

