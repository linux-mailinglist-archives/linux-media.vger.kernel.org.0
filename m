Return-Path: <linux-media+bounces-47598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD7C7B39A
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 19:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2493A1F82
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 18:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71469332909;
	Fri, 21 Nov 2025 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="wKFtvo1d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0642D77F5
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748461; cv=none; b=pA3uyouWV4il0V62/nxvVyNVtDvYwyqt+sD+hPCViNiuotxYWvagO5Z7ct+OBa4h4+//1thzXQylbWqFQXe4FL3oMQstnuEvNy8SBHLxGvUf27tqhx97/nDZ5/iQfBhoO08wxJPjDtd2mxkcb0d+hqmsZ/euP/vwOzgYUJtpdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748461; c=relaxed/simple;
	bh=Q1ZwELVabso4EkyDG2xMjJ4EyeFlxuL65Prpg3ujMaw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Okbg93Wzm2JpYGecc/hU+YJFAnq2nrVGJ0k/G5dxdwFXd3t46zON3gWYEFeVDvQW5c18GkmTQevHEKe3cPWq1SzyKx4KI8y5QXWgkyMBSgOprMLKvdDBsA9bRepXhWV4o/I+lIzvLGXYYmRikslE9JZY1tXfcTDtgK4e1yxyWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=wKFtvo1d; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-882390f7952so23912756d6.3
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1763748458; x=1764353258; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=wKFtvo1dIN7H6z1bleHrFmzrrXSc10UGGH4Oumx0Yt5xG5emiRczaotKIid3hBWq99
         A983IZfFndHC2qATsQWFkZl/+rzw/njCltrzR25GuW8Zv9vKsrNmQbusZDYMEEcVPSzA
         mKz5SEgWVub7VqrIUy83UdnyHTVNSiWaJzijTsO//qrYoFS04ZPdt2ZfSS/Nq6hDC2Bj
         O7CLElReR4qmWJwl/Gmntx+Zk+pNIOuSnD0IlPEUfjoAKmFyPFqLBfkoY0zOQ6PxhNUV
         zgIGMJVolrcN0BW1Fh3Q/Y/KWy1qnrlS5MjV4/Ok56ntDNkK0auoSbe/Barvfm8y5qOu
         ZIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763748458; x=1764353258;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3reEjUab7HQIYE8MwmDCD1KFRlukjdmGK/LzC0B9YJA=;
        b=KY6FZuyIz1dYsL5YXd8WbPhz3Vn/YbeaP4f2M5TLXw1PqVVxfaYF3hGSJ5mQ5ZFffW
         ZN/ipSw6f/MS4FwRBnwrj50rT5jQ3yRguwfcn95S/2sq2SvZAS2sh5LpofaGelpSMWTc
         SiMF7jflPt8wTTu+n+5qZ3Rr6EgjkwOVud1VBtSLNkkHQCVJvt90+HV6PcdM8Nw4/OoZ
         86PkasVmTSl35ggrRRsqUHsO7LzWvJW/BeWxy67Zzn7urcENZ1sFchctkeetnK9eoSIt
         Q4J2ag/kV29xpUiyxZzriTRMRk/QM2MdNyA3LmS1Yf3ZLZB4srq1k7BgSZQItNSTaZgV
         LOHw==
X-Forwarded-Encrypted: i=1; AJvYcCWc0ynmRSeTtNeOn4HvhYpXAf4htu5ZIksbo1AEPW7cT7R8MNkmAQ6WBZP9wjoRH1VVR3YF/IuUmqvyRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVm6RcDe44G9Qmpe+ZgHx10u+X6G9BkLJv4mgECI7tilvxGaf
	3gMju+YU9os2W5hqE0VLzepxy2DRkdjW8rkcGboneQhlG+trCpESfs0qzeAhkckbK8SeFTm0Dhj
	nebdJW/ifSA==
X-Gm-Gg: ASbGnctHkJD23ORuQ74ArLYX4TN2q5pYjKiM/zDjG9BGS89QGvUmhyibOFZwF29+mAW
	A1kv6FbMNKEOAdB/rcfKQeS+/VeRjMQL67Y/zqQ//7GTPHDlEOT4NgI71hoVtPxrOWSd03ce69v
	3N6NUpu43WXvp/IKnfARHSQZ2a2yYTdzx0jPCjP3km2D420Ws2HcoJUFCgOyatrHmPbBrl3uYvT
	etqkoVjgOJaCu/saEARwlMX8Frh0pyJIKuCzZUBYE9JBKIKtZEnwyeGujRnMReZLTM+CeVDAzZz
	Cmrsz2eEIUPQ/lxMbWn4cY0crRJGwL6IO9imXB84NAkTXo3U8amZGkTuxIkcbTjOG03Thb0Sn/c
	PzarEVUab42KWlIGIUADosNEmGQwNb/3GGxMkHRI5nzwarZKxMwtkyeWfjEaxRSMUu+h+rr/dUK
	lsxMcDhZDZ9egOHoMj
X-Google-Smtp-Source: AGHT+IGSn6lWVFdXMF2O7+16BxyboE+vLKmTO8u+vsDg8rBpHj7vHOjDlUdUHZhhn3mvBIHkM4SR0A==
X-Received: by 2002:a05:6214:f01:b0:882:4987:367 with SMTP id 6a1803df08f44-8847c546402mr35659826d6.65.1763748458256;
        Fri, 21 Nov 2025 10:07:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e599ac9sm44053446d6.49.2025.11.21.10.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:07:37 -0800 (PST)
Message-ID: <11354064b251d01f8a0f8974c451c91d515be1a4.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] pmdomain: imx8m-blk-ctrl: Remove separate rst and
 clk mask for 8mq vpu
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 peng.fan@nxp.com, eagle.zhou@nxp.com, 	imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 21 Nov 2025 13:07:35 -0500
In-Reply-To: <20251121081911.1682-1-ming.qian@oss.nxp.com>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CGluF/KiYEHV7bilRPFN"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-CGluF/KiYEHV7bilRPFN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks a lot for working on this.

Le vendredi 21 novembre 2025 =C3=A0 16:19 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The ADB in the VPUMIX domain has no separate reset and clock
> enable bits, but is ungated and reset together with the VPUs.
> So we can't reset G1 or G2 separately, it may led to the system hang.
> Remove rst_mask and clk_mask of imx8mq_vpu_blk_ctl_domain_data.
> Let imx8mq_vpu_power_notifier() do really vpu reset.
>=20
> Fixes: 608d7c325e85 ("soc: imx: imx8m-blk-ctrl: add i.MX8MQ VPU blk-ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 ----
> =C2=A01 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 5c83e5599f1e..1f07ff041295 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -852,16 +852,12 @@ static const struct imx8m_blk_ctrl_domain_data imx8=
mq_vpu_blk_ctl_domain_data[]
> =C2=A0		.clk_names =3D (const char *[]){ "g1", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g1",
> -		.rst_mask =3D BIT(1),
> -		.clk_mask =3D BIT(1),
> =C2=A0	},
> =C2=A0	[IMX8MQ_VPUBLK_PD_G2] =3D {
> =C2=A0		.name =3D "vpublk-g2",
> =C2=A0		.clk_names =3D (const char *[]){ "g2", },
> =C2=A0		.num_clks =3D 1,
> =C2=A0		.gpc_name =3D "g2",
> -		.rst_mask =3D BIT(0),
> -		.clk_mask =3D BIT(0),
> =C2=A0	},

That was also our impression, but we could not get information about this H=
W.
One question here, how do we ensure that we don't reset twice on power on ?

Nicolas

> =C2=A0};
> =C2=A0

--=-CGluF/KiYEHV7bilRPFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSCqZwAKCRDZQZRRKWBy
9A6ZAP90EgdxFgS1MNEpip8ViNpAOQ1t5ODnf13yvBhSJ87yTwD/W2WHO1JhMsym
rs/FdLqAmGCaIVG4rntDh6YMtk3p6gc=
=VrGj
-----END PGP SIGNATURE-----

--=-CGluF/KiYEHV7bilRPFN--

