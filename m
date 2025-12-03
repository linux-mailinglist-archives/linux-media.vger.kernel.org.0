Return-Path: <linux-media+bounces-48187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A430CA0DE3
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 19:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 633FB3006591
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 18:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AAB315772;
	Wed,  3 Dec 2025 18:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EoCIpISM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F512571DD
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 18:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785870; cv=none; b=XqGIgs5G9UdY33BDmbhWQE3IOUyxclqkp1Ed+ewzIAZwUCiRHLwj5zXRaMmO55xfHyBK6nAi4vxassShspRa4xC2Px0yoZb0jjgGV8CoPlgsTfQB1m3Sa5E0TXOvAce88nVF6UAwJRM5cN+/pT7N3N2358pTFkmJqxQHWlW0294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785870; c=relaxed/simple;
	bh=TrZtDwJIdg1DEsXrP5AjnYYbB0IzHOZ372jsP/zEKbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f4f5vRfjuPLZrfnZ5jqR9s/0tqayOdgEbqi1IVmd+wYgQO+qR5jzBWytAEtYuP+X5fts83yymIvV9mWtVmJW2TMgxKn3S93L4xKNaGzPU8MacUSXL8hrLK9V1VA7HK2TvOVSqUDgJLTw7ppJSFJ+zcQtJFibZPRxeiGIpN1esV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EoCIpISM; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b2d32b9777so1114085a.2
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764785867; x=1765390667; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WO7+BfFMbhtTQ5calPjfM/nfUWHGIG/6W+9CTiI6Usg=;
        b=EoCIpISMBoxCiWy/PnuVaynNDSku8VhybY9GOkvbruu0Rm2zBhCfQ/o8QkMoy4+IFI
         E7ti00qp/psONZYhoXbz1+b4hCqJcnqsjnVh5RRunP3QTG8zk6OUH/U3znW0urRQ1gXR
         aM1C3HPCHnTOxg9aMuq8u7VaqEl21W5OdQfUijj5n8U39nkn7jRNjP7S0otfWwWys/Dt
         qjPGauDrzBs3kHX4L4ya8DqdNre85TDbpAc6VyzJsWA9LlbuJ/n2ZETKXO9Sio/vWK63
         T/0z4cuj37TEj08bKAkiriFWeqJFGUHM8M7SY4Nfk4X0n5uf3EE2j43TyrLzNW7Cvv7N
         BKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785867; x=1765390667;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO7+BfFMbhtTQ5calPjfM/nfUWHGIG/6W+9CTiI6Usg=;
        b=wKQajgPiRsV6w7s8AIxMJAy3i50Sao+zYpuv2pdMHZy5kD+h9/FvqiCeVUgWBnm/iS
         MgroHzoLp9bgXI4RrFnIPUtEcUptK45ph5UoytQzV3ELxZZSxgmGYGazQSsVTC83M6qG
         pKAczCG3AZEaDSdVAVslJwbJo8GGT55GWmPhbCUC+xtv9zoVdqFivJgioHyY98hGTnen
         msRyxLhf/HHKfPAp5QCCy3wAN6+a16UGp9hZDr8sCjjTw+tPwjCcN2GqFkWEMbOfN62W
         oci68zgMnaVjdgtX7lzBiWTamb01u1UFKu+UZbmnQ/zPNnfUt+JTe+Crq35pCy+po5Sx
         ZmcA==
X-Forwarded-Encrypted: i=1; AJvYcCWxzurYDJgN47OE/r2piYjUMhTO+c1h7XdUSapc3kTyDIkmzCvCecG7RFr6CM8bukgadRvmrU4KKLXOSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0UdFB/iWXQYzJLPCfyESePPAt+Bo5102G1BOYL/hjhTY1k4Q
	tXq5yohPHCsFtblwgMsvEl5L/g5eTJKMl4rMRQ4RBxAwqYXLXDSDdbQfg3iNKxVZo4I=
X-Gm-Gg: ASbGncucqCt/wde16qCNv+XuWmaW9FnlamoSrNlRL8/Hs5dLgj26nX8GVL94qSDJORa
	afXCvRjjtYAOrSeP3h8tDvnCNVesP25mM0lOWTwy+AiS0yjZV1Y4mSTI2y2Ng00uK5w5cqfcv61
	ahNO2bNZA/jyS/ypwntMavV/q3pe78qac2zK5zABSMHV6sKeh+WN1hBO2qC2ySH0iEJ52jvPwUH
	FEUsZYDei2RouHGUtDlCDrf+/HJgy7mFfe2iQGvKBBcONnU4//eXAys6cL+fp6cWgljlvrDH27+
	ipS+mCmVTfIx04tSBa/mVYi8MqByX0az5IQaDptjX0a1snyoQMsPeCpVYcz6CdY2SAAk9FiEeQn
	2uIfvhLV2KPigO3cO443vupGb6rEvD5L6jjIO/m+P5Fo57Adv8+0I99bpF77CbNK9UT5MxuqzkN
	g/hl8bIQyhW84JGZP6
X-Google-Smtp-Source: AGHT+IEhv40xL383ENCwnfqVp2ktNmuefqqTYkr/UJMCMGa9G76Ic4Btltlz1SuLx7uvnnfNFOeUrA==
X-Received: by 2002:a05:620a:c54:b0:8b2:6a47:f5ff with SMTP id af79cd13be357-8b5e7453f59mr421706785a.86.1764785866599;
        Wed, 03 Dec 2025 10:17:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1dd3b6sm1352235885a.50.2025.12.03.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:17:45 -0800 (PST)
Message-ID: <f1938e17e04cfd1768f90b757813f9187b424505.camel@ndufresne.ca>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Date: Wed, 03 Dec 2025 13:17:44 -0500
In-Reply-To: <ccdcf1c3-4afd-45b7-92d0-c35a31be2188@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
	 <cfe8d17416184f11a93e56872c30a6bcaf017ef5.camel@ndufresne.ca>
	 <ccdcf1c3-4afd-45b7-92d0-c35a31be2188@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-O46nnlDAIF/qqFenTBb5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-O46nnlDAIF/qqFenTBb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 10:49 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On 10/7/25 9:41 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9=
crit=C2=A0:
> >=20
> > > +}
> > > +
> > > +static void rga3_cmd_enable_win0(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	unsigned int reg;
> > > +
> > > +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_ENABLE, 1);
> > > +}
> > > +
> > > +static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	const struct rga3_fmt *out =3D ctx->out.fmt;
> > > +	u8 wr_format;
> > > +	unsigned int reg;
> > > +
> > > +	if (out->semi_planar)
> > > +		wr_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> > > +	else
> > > +		wr_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> > > +
> > > +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_YC_SWAP,=
 out->yc_swap)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_RBUV_SWA=
P, out->rbuv_swap)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_FORMAT, =
wr_format);
> > > +}
> > > +
> > > +static void rga3_cmd_disable_wr_limitation(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	unsigned int reg;
> > > +
> > > +	/* Use the max value to avoid limiting the write speed */
> > > +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX, 63);
> > No issue with the code, but quite an interesting feature. We did discus=
sed in
> > pas about using the target framerate (well frame duration in v4l2) to a=
void
> > bursting the memory.
>=20
> Do you have any links to these discussions or some actual implementation?

That likely happened during a media summit. Philippe Zabel might remember m=
ore.
I know for stateful encoders, you can already have two timing information, =
but
its all vague in my memory.

>=20
> =C2=A0From the API perspective I didn't really find the desired API to=
=20
> support this feature. While VIDIOC_S_PARM would allow setting an frame=
=20
> interval, the documentation doesn't really encompass this use case (as=
=20
> we won't configure the RGA3 depending on this nor drop frames if the=20
> RGA3 is too slow).
>=20
> Also limiting the potential burst size only seems practical, when it=20
> causes latency issues. Otherwise it should be more efficient to have big=
=20
> bursts (bandwidth and potentially even power consumption wise).

I have no issue with letting it to its maximum. The comment here simply
highlights it, but pretty much all other drivers will hardcore the maximum
working size and move on. In a second thought, if you multi-plex the RGA3 a=
 lot,
you don't want any slower use of it, since it may hang up on the core for
longer. So I'd say, unless we have problems, this is fine as it is.

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven

[...]

cheers,
Nicolas

--=-O46nnlDAIF/qqFenTBb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTB+yAAKCRDZQZRRKWBy
9O9wAP4vK3/hFQMhn6LQeuouPwSbEOMHtv4m89+tlQ156SdFFQD+IbzJtlWm4CnT
1HlbYcGIvYOfmuM+UuiPeSwc538wrQs=
=u1fm
-----END PGP SIGNATURE-----

--=-O46nnlDAIF/qqFenTBb5--

