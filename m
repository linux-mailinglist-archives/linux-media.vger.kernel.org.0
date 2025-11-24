Return-Path: <linux-media+bounces-47669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7BC81BA9
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 17:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58470344F83
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 16:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C053168F7;
	Mon, 24 Nov 2025 16:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FEQuj+oQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1E314B70
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003344; cv=none; b=eJsKQ5/IlqL8JRDWq3RS4ThtzQgqTIkWJD4Ujz8kvR7F8wk6Mfhd1EGxP09zfIoWjK+pUXVcRmEyJYWOi43K8ErBbXuvpy0bH5messQwmTD2XgB2M2Sy2RNi+ixC4RScQ8ymSPAAYqSlNGyDLIduRj6dXMcZruhKikOSx8oh91o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003344; c=relaxed/simple;
	bh=bxmKGsJTJisCtns+15qvoCzCCx6vK1+GxtJxYfeFUCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EqCYCj0A3F0f3U2Mob+SjO5pWZ28EeaaL2Z+SnK7H/j8z0XP2pYMvnzHWMvA83wBIoV6RVCPgMsoDJnvca4aDyovQ/lJlD+J4yMe4gDhaog8ukJwwk9GWpaT8wdvl2oyYqJRiN7iWnpypIbJ7RW+u3LJC9/NpzNK23sjCfPnV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FEQuj+oQ; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8823dfa84c5so52137626d6.3
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764003340; x=1764608140; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=FEQuj+oQJj30wumfJKzfSySoreyTT8o/zYsYWyX2b4CLTr9OYGtJAKx8/1HAHPzpVC
         0VWk9OH14+Qf8b8LJ4YlzV26G+BC6JwjkveNrDwO0oSZHzrcQhxFQV2wxABD4kijzfrZ
         XqBzW+ek0tFY9kNTNrVliGIjACPPKFmnlzn1EhhcL6jLNvwXctyCuzCKgW48L/CkbHUe
         f88pjqRCqQyC/IxU5yF4Toat1e0nB5farnWrXjfcRPk6JqcOrANVyuzB5rC6Mhzrr317
         nexUN2QNymWHVH22SLPgpI/e0Fkujtuyl3cmY2BjoteIMuYPwEkmcdug68kXrCWW5LQ0
         bFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003340; x=1764608140;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=Rvg8h7e5lzKVlT+hfLFBWBfzMFCJW/HPxS5nBMIgJ/ISbJJEX5BNbZQHbcOs4IE8Xa
         UQTRaVGrTj9zvftynZWS6J2VXYaiyaU1a6N4K+QtgVKoGzDYoKaJT5PhTLYtl6Qu3vVt
         gnG3CY5BaE3447DPIwijFTN954JIcqt594wy4rt+1FU8IJhsaHQ8CtqoFu0qxO2tVDhI
         As7TCjwD1g4vmR7J7v9Qkbc0hm0HYwFSo+k6OuSJWBcIGffCjHt2TvNQDZ9oJk6lErWm
         eHosxV2T3pE0oeSs4ZPHy1Q8/K7RKm9PhB1KlIk9i7bY4oGTQ4KLVhSPTEZZYCU67/ug
         W2ZQ==
X-Gm-Message-State: AOJu0Yx+wialLWvALRzGM74WkAwaLvlAH27OFC18l4AVyD2UgaW+3kIB
	B/fNB2h+v53IavJUxnZJlYRAGT65h4hxBfLMZ80xDUfG2IF/bejBPJy7TQxt8GQvS1I=
X-Gm-Gg: ASbGnctWjgNY3j3zxq66pLZZ558USaNC0cyXY+CgtgWG7z1jPz0LvwK9UNbDWGD4xmU
	m+FipHHOXbPQYlu3Sypu3WK+A7CxxeCMZERe3l0U8fiuSSq6bxuFJ4CYTpYdvvM8cYfTY+LbzVe
	8UWnlUAqTAvPXkcskoeyg560jPvxL2Ks/2TuJNq/1MjpOv2z21yAo0eFdmdgtQgeT1Up4VSanI+
	HjRjMcRTOUjEDm+o1dTohawmgMoyZw9YvXvvSeHFLOY5dSI/bviKAZ6vW/dZZQcz4qlk7t6g8ke
	N1H5ER0r4ayfV7gxvTVc+I6Fpfn9Ml0e0ksAITZuGP8dd/AMKNi/rtoughn11zt4+AKO3UGIcgN
	ozuvr0jqBHWhRs3STnOX/0OMMwoJhtwtw6+ZmGB2AyFpkwHuuUHjp0+7u13OAqVGWOuk9CQNKqF
	MqYrUZnNeZxYrWQv24
X-Google-Smtp-Source: AGHT+IGvb6OSfhjD96Tta1mqwKgxzHProLkPjajJethJLmJaGb1/+UkSU3wc6V+DVMtcPYYdbjPJmQ==
X-Received: by 2002:ad4:5b8f:0:b0:882:4be6:9ad2 with SMTP id 6a1803df08f44-8847c511566mr194501866d6.33.1764003339847;
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54c84esm100992886d6.30.2025.11.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Message-ID: <020d1263315b8a5ff3fdfb46d61d0108cdfa5bb3.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 24 Nov 2025 11:55:37 -0500
In-Reply-To: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
		 <20251121081911.1682-2-ming.qian@oss.nxp.com>
		 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
		 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
		 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
	 <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ljeP6A7MDSCCnSfU19m1"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-ljeP6A7MDSCCnSfU19m1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 24 novembre 2025 =C3=A0 11:39 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0=
:
> > On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > > Hi Frank,
> > >=20
> > > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=
=A0wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >=20
> > > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 =
VPU and
> > > > > g2 VPU cannot decode simultaneously; otherwise, it will cause bel=
ow bus
> > > > > error and produce corrupted pictures, even led to system hang.
> > > > >=20
> > > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode=
 timed out.
> > > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error de=
tected.
> > > > >=20
> > > > > Therefore, it is necessary to ensure that g1 and g2 operate alter=
nately.
> > > > > Then this allows for successful multi-instance decoding of H.264 =
and
> > > > > HEVC.
> > > > >=20
> > > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | =
26 +++++++++++++++++++
> > > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 ++=
+
> > > > > =C2=A0 3 files changed, 31 insertions(+)
> > > > >=20
> > > > ...
> > > > > =C2=A0 #include <linux/workqueue.h>
> > > > > +#include <linux/iopoll.h>
> > > > > =C2=A0 #include <media/v4l2-event.h>
> > > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev=
 *vpu,
> > > > >=20
> > > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->cloc=
ks);
> > > > >=20
> > > > > +	if (vpu->variant->shared_resource)
> > > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > > +
> > > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > > =C2=A0 }
> > > > >=20
> > > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_c=
tx
> > > > > *ctx)
> > > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(20=
00));
> > > > > =C2=A0 }
> > > > >=20
> > > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > > +{
> > > > > +	u32 data;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!vpu->variant->shared_resource)
> > > > > +		return 0;
> > > > > +
> > > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > > NSEC_PER_MSEC, false,
> > > > > +				vpu->variant->shared_resource, 1, 0);
> > > > > +	if (ret) {
> > > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >=20
> > > > why not use a mutex?
> > > >=20
> > > > mutex() lock here, unlock at hantro_job_finish(), if second instanc=
e
> > > > run to here, mutex() will block thread, until previous hantro_job_f=
inish()
> > > > finish.
> > > >=20
> > > > Frank
> > >=20
> > > G1 and G2 are two different devices. If I were to use a mutex, I woul=
d
> > > need to define a global mutex. Therefore, to avoid using a global mut=
ex,
> > > I only define a static atomic variable.
> >=20
> > static atomic varible also is global.=C2=A0 Global mutex is allowed if =
it is
> > really needed.
> >=20
> > >=20
> > > If a static mutex is acceptable, I think I can change it to a mutex.
> >=20
> > ref to
> > https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L=
43
>=20
> My main concern with either of these approaches is that it kills the abil=
ity to
> rmmod the driver forever. The only working approach would be that both dr=
ivers
> depends on a third driver that provide the synchronization services.

I do realize after the fact that my answer is a little off considering its =
a
drivers against itself (not cross-driver, that would be a huge pain if it w=
as
the case).

Checking further, the ref to the counter (or mutex) should cleanly be gone =
by
the time the driver is removed, so perhaps its fine, though best to test it=
.
Though, in both cases, I'm not happy to see code that will wait for multipl=
e
milliseconds on either home made mutex or a real mutex. Adding another arbi=
trary
timeout is also not very nice either. The current software watchdog already=
 get
in the way when testing simulated IP.

I know its work, but what about a recounted singleton, with a notifier so w=
e can
schedule work when the resource is free ?

Nicolas

>=20
> Nicolas
>=20
> >=20
> > Frank
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > =C2=A0 static void device_run(void *priv)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > > =C2=A0=C2=A0	int ret;
> > > > >=20
> > > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > > +	if (ret < 0)
> > > > > +		goto err_cancel_job;
> > > > > +
> > > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > > ...
> > > >=20
> > > > >=20
> > > > > --
> > > > > 2.34.1
> > > > >=20

--=-ljeP6A7MDSCCnSfU19m1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSOCQAKCRDZQZRRKWBy
9HqhAQCHP5ZntFVjhc+JmmT18XRzd/2qvwhx74x5R7o/qW0ZEAEAvh2YL6yFIWqk
/QfAZZ+Z2oYT9qGwQPIYvYmogZK8tQ8=
=gS+Q
-----END PGP SIGNATURE-----

--=-ljeP6A7MDSCCnSfU19m1--

