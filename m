Return-Path: <linux-media+bounces-47667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91125C81A0E
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 17:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5637B3A7FF6
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 16:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A4029BD94;
	Mon, 24 Nov 2025 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZV62hm9Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D229AB11
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002388; cv=none; b=sXOKBHgfCtHx34H3lfhVTfDoMMNLcmLEtniwy2UjzkIlCRL81S2zgtloWkd90V9+xy4ODi8NIpnvxSGuLcx9f7mD0eN1zVEM4TOAlDLeBEzFTMbKr09yIvyhQgcV2i6A/ejQYTAOOeoyTffddasCyDP6Dltskdygspdvmw9pWRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002388; c=relaxed/simple;
	bh=5l6CRo/azRe1VajN8G2idPGnbGPFBO48LaAcHce2FcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QfyyIvqWZmPG8viRl9wzfkwPhZil2wyC49b7FF+rdwHD/jJxz3+xC+5a00DNbBWCJ+mbdf+IG90T/kZ5IsUrGndHrpXBNWmSvr9C5OZxse75/cF3wu6JM7PRGXPLa/uDh4ofzNS1xVI89MjkwMIgNH6y8ElKXqsakqbucOSU7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZV62hm9Q; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2f2c5ec36so527015585a.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764002386; x=1764607186; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=ZV62hm9QbldjmUh8nHqmSop9v8gq1Lm/ijAwu3EgylNz2dqLO/I7iGUbWJ7OPlAc9S
         nN3PXrXbIzGnpAmce2820pNGh4+IFYKN+Pt/SE3dLp4B6OmFeP5K2AQ+ySuFjWbgHg7h
         LLCI9PMlUo4+zb71YD4EPqhLPWH0B3mAbOal2EnbDFvIuUHIy6HVyXKB0tNot0/YBS2k
         M1S30GnjMoAKrYDEQek7x1mGhSQUBS/tCNj+6OOjKD7kD6CGrXF8+F5G78I+vzHZbtkL
         JMmRWwVvE9oGLrokIOLP61UY+DTVyfruVFaJf7e9eV8N4RNCXcK71Y3tic2voYnNGImd
         3jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764002386; x=1764607186;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=YuyCWSngXOjML0ExonhQbJEPbBglSSHBiD9Rh/3U2FuPXXWBQPjmcliG0Z00swYE57
         +JBSfg/FmCl5J38hExDCi28QJbeD+noCLjjMefHIFDoXJHHSPHhfBvEGOahlP89GDcZO
         IYxYm7oDd5L8lfpuRFgYS6ISFI7rxCIp7d1tLnL9ItQApU40uryP16lEsprOccRsab6V
         xQtUPMT5Kbn7eHgmvdjQoluMpgkJz8rpZPvWaCgjmMTE1Mk3tWuTpBYTJPCG4o5CTxA8
         mwfmDCjxEJIc/ywnjH5AkYvfWQDSB3VZOcVyuCFFdcxMlAdY9iKeVCcR8qywuHa0ji9L
         gvXw==
X-Gm-Message-State: AOJu0Yz7vC8e9QisZexneQlQtqWg9rS//y86tY2Fu7CiklkesXsNhtxk
	saiuLt2QZ/RXA0ypPcsdW32FUGjjmTjZfL8qS/yI0ZlX5HPdsTH1PSn4o/iF2SJ0I7g=
X-Gm-Gg: ASbGnculViE4HTnXmdhQGVekd/0tSAMQ/sWrrYJj9KXkRobL22zOgTiP/4UDXxkRnQu
	CKuLZV7ORqcVjrVZAYc7aGtY70rayJ9C2Z6ncAyrpjhe7wx+RcMgkYtM3OwHeqbYtp7Qkd2S63u
	z03w9LF2xKFuHbF0CtYfN5vvngqt4AL8l66FqFYsx07ETocDcevLTycY/JwV/zjM4/xcOs51nAb
	pKbJ/bUXYaulTIFvk9149udHDxBIGb2QMZs1W+3V6vIHn+wqGIJl+Jgmmxrd8y6g2Wyn+RJN1sG
	5kNDP9Hb2JbB7fiW6yTUR5pUw+JIY8iues+7QluSekvBhZNC6Xh5iiEWlq5lp23YCQp3vuivI6o
	DbmD5Q37lHibPYpi2wf/Ic6vHg2cXE4mDtegVe5vgt2GtT20YbEDSmh5+vb885126bc36ylasrY
	+my+vcuGwQeVqgPI2A
X-Google-Smtp-Source: AGHT+IEhf7zBXg2obuM0Wvyx3W1baR9UChFOPX2BoB/TIpveKMriV0p5s5SimoGLInp8YO2+ZvsNlQ==
X-Received: by 2002:a05:620a:701a:b0:8b2:1568:82ce with SMTP id af79cd13be357-8b33d4680b0mr1458433285a.37.1764002385770;
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db58fsm979338885a.37.2025.11.24.08.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Message-ID: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
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
Date: Mon, 24 Nov 2025 11:39:43 -0500
In-Reply-To: <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
	 <20251121081911.1682-2-ming.qian@oss.nxp.com>
	 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
	 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
	 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9MfzEt4m6odi0eUBy2qY"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-9MfzEt4m6odi0eUBy2qY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0:
> On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > Hi Frank,
> >=20
> > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=A0=
wrote:
> > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 VP=
U and
> > > > g2 VPU cannot decode simultaneously; otherwise, it will cause below=
 bus
> > > > error and produce corrupted pictures, even led to system hang.
> > > >=20
> > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode t=
imed out.
> > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error dete=
cted.
> > > >=20
> > > > Therefore, it is necessary to ensure that g1 and g2 operate alterna=
tely.
> > > > Then this allows for successful multi-instance decoding of H.264 an=
d
> > > > HEVC.
> > > >=20
> > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > ---
> > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=
=A0 1 +
> > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 26=
 +++++++++++++++++++
> > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 +++
> > > > =C2=A0 3 files changed, 31 insertions(+)
> > > >=20
> > > ...
> > > > =C2=A0 #include <linux/workqueue.h>
> > > > +#include <linux/iopoll.h>
> > > > =C2=A0 #include <media/v4l2-event.h>
> > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev *=
vpu,
> > > >=20
> > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks=
);
> > > >=20
> > > > +	if (vpu->variant->shared_resource)
> > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > +
> > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > =C2=A0 }
> > > >=20
> > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx
> > > > *ctx)
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(2000=
));
> > > > =C2=A0 }
> > > >=20
> > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > +{
> > > > +	u32 data;
> > > > +	int ret;
> > > > +
> > > > +	if (!vpu->variant->shared_resource)
> > > > +		return 0;
> > > > +
> > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > NSEC_PER_MSEC, false,
> > > > +				vpu->variant->shared_resource, 1, 0);
> > > > +	if (ret) {
> > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > +		return -EINVAL;
> > > > +	}
> > >=20
> > > why not use a mutex?
> > >=20
> > > mutex() lock here, unlock at hantro_job_finish(), if second instance
> > > run to here, mutex() will block thread, until previous hantro_job_fin=
ish()
> > > finish.
> > >=20
> > > Frank
> >=20
> > G1 and G2 are two different devices. If I were to use a mutex, I would
> > need to define a global mutex. Therefore, to avoid using a global mutex=
,
> > I only define a static atomic variable.
>=20
> static atomic varible also is global.=C2=A0 Global mutex is allowed if it=
 is
> really needed.
>=20
> >=20
> > If a static mutex is acceptable, I think I can change it to a mutex.
>=20
> ref to
> https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L43

My main concern with either of these approaches is that it kills the abilit=
y to
rmmod the driver forever. The only working approach would be that both driv=
ers
depends on a third driver that provide the synchronization services.

Nicolas

>=20
> Frank
> >=20
> > Regards,
> > Ming
> >=20
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > =C2=A0 static void device_run(void *priv)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > =C2=A0=C2=A0	int ret;
> > > >=20
> > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > +	if (ret < 0)
> > > > +		goto err_cancel_job;
> > > > +
> > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > ...
> > >=20
> > > >=20
> > > > --
> > > > 2.34.1
> > > >=20

--=-9MfzEt4m6odi0eUBy2qY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSKTwAKCRDZQZRRKWBy
9I6lAQChTt9rXsTyp+alYyrA7Oe8CReteB0yVGS6rHYuqIhe1wEAiasfKosen86t
jj/9bnBTj+RVfWUI5e4CEn7uH8QRMQM=
=aSTR
-----END PGP SIGNATURE-----

--=-9MfzEt4m6odi0eUBy2qY--

