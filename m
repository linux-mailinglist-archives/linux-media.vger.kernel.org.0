Return-Path: <linux-media+bounces-67326-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VnHmKeJeUWpvDQMAu9opvQ
	(envelope-from <linux-media+bounces-67326-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:06:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12F73E9F1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:06:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=qNK53DeS;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67326-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67326-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF429300B833
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79CD3B0AD8;
	Fri, 10 Jul 2026 21:06:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3208314A98
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:06:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717594; cv=none; b=B4W17j0oN0n8qopUzt+J7AZdPBsUjTfqmuYc0NvlOEHWG/cDAXZ9gD8AIAVKR3VpY4haCFGYm2JeT4nGExSGm2iMx5pLC4+eRf4U1v3Eodva+kqm+5CpCMA+OlyHZfXRX6vnpImOZjYoM0njBEyGKIuQ3DTm733K8dda98qK6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717594; c=relaxed/simple;
	bh=DxDrT9NmX4ZZIhVEHWLdymY2f78kT5MiLBlnK/xA7Zc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qura9baZG38GheoyH+9j6XGEVCM5u6+MEER/TtNff/X+wnrfn3JYVuCdMc3OqiuSMOTF0gUCmEQ/I8U0S2i8nQxFrVrjQ5IUQtkci7cBwwTn+GVWlow3Lc6bgaCooPFHHcq3823l1tukWxLBRBtqUpSsnSowICV0qfTUyL9b5WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=qNK53DeS; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902fc790cd5so9165966d6.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783717592; x=1784322392; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TVT9N7Zf4tzdtEz92uIESo3Z8ztU5bsCLtI2pOZcHKU=;
        b=qNK53DeS5XlC3NfVNjSmicTw0CqC6JjmoxorKnrC1cfLGzlUhCS/DebljfFjXwA0RV
         taGGBV1LWMtyC4hUCyPA0lj6V9u0yekr6fQUYfCx7V9BXwQDpgEqH3AOS4Q4hpmdg+xh
         f/3XH8yeEEujOFDBZQTaiLL3nKTRuZJFMtOrgI116wTlGZXxVe/9mXVG6cVuj9DCwBB3
         Kk/TLRbB1ddALbWLQhId2e8Y77gaaFdWGAiVkYZLnm0i59dRK3IUM8gIGicKFWiPet+V
         3w3EeKlaxsGn7jaVlWWc+j294wN1YQsz62cNMr4L6vFDmYshDZSSNSZTq5LNBct9WEht
         mr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717592; x=1784322392;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVT9N7Zf4tzdtEz92uIESo3Z8ztU5bsCLtI2pOZcHKU=;
        b=OsmOQ8Nw9a+VTuPNdcRKACmTR4S9JQQ9GIFG65h8y4xutwFxyA3M1uxKrII3BBzSUH
         cLPq+UhfxjKEsBpJp1Dp+94PzSgByCcrTO0b7IJ0NlVmzuBYXPaXUO4Q6WfA4vbCdtgS
         XS52CmvM4+jePCDgFlqNlUQl4mTcFia6/Kt+h0+Iki1AsdXiEWYs05zdKOg4eHE3+X7D
         AkD2SK6EVXeDh5nsMBi7at4Ds7Cf7qO8IbuuMbDA2CZmS4D0TUzImYaytNN4295GRUrP
         WnFrGjAhwMz1NyLUc4R3He4QMhkLz0i0LZ4YHI2rKMhdpTRmf8xk1kGt7ZjUKh5aE3ES
         /Iwg==
X-Gm-Message-State: AOJu0YyDx+k1Y8VhcYwG24qMlOQ7c8Ex396miFRhD2v4s6jW9vwycI2b
	kDLTD1s+FGgecGt5ODfNLW9oxbDHIV1b+WXvySUDVzPyCC4fmvopspoc2TDJ5xvuM94=
X-Gm-Gg: AfdE7ck1rtDr3xXp9qgpfRCGU+yklUSz75EDCh/S62zsQKoTqojCxrQ8YUWmwXbiSNs
	eWd6AcGJy7vyxcEFzQJxD3o+ZozyapF7IqzDyY1blb89GvGhddIDzyhWsewC0Wv+4K4lp4FSJJb
	SvHVhWicPxcxn+Xwn1K/wBZUpsVMiYeTgZW5CgSLLfKpWVo6A6TnqvgdbT1NUEIudti8kExSMMj
	6pCG8LJG8MQcmpAs3Ovj5QCpOJFNRYR6z1c5UTcADgmJFdxutPm3xiTq+cMxAOoBSI/vCAa8S9J
	MSrDLZ/rZSU+4SZ6gZnHcNe9CwfiJKbaq6geslXyQ6Ssi2Vt+b9bKZjgkrMKZvKxc2b9Z92/4VL
	ikD4yVtLKX8RBAVdJ862V/q6JlMJZFgrfJfQGVRVXbq70JOcCPtOA8vaBN4V1uLDl8Xz+pXJV3E
	f8FzghMgqq6SpTdu1Zcu16Ob3KJ52t
X-Received: by 2002:a05:6214:3b81:b0:8f1:581c:4b40 with SMTP id 6a1803df08f44-90400f9540emr8519656d6.7.1783717591801;
        Fri, 10 Jul 2026 14:06:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9500sm50123616d6.46.2026.07.10.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:06:31 -0700 (PDT)
Message-ID: <1e7a3efb76d84730748b9c47c03a90b51b2d2d20.camel@ndufresne.ca>
Subject: Re: [PATCH 13/17] media: rockchip: rga: bind all cores to the master
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 10 Jul 2026 17:06:30 -0400
In-Reply-To: <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
	 <20260606-spu-rga3multicore-v1-13-3ec2b15675f7@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-TbhSyHxkx/Z3fez9TIdu"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:jacob-chen@iotwrt.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:detlev.casanova@collabora.com,m:m.tretter@pengutronix.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67326-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim,vger.kernel.org:from_smtp,pengutronix.de:email,ndufresne.ca:mid,ndufresne.ca:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E12F73E9F1


--=-TbhSyHxkx/Z3fez9TIdu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 06 juin 2026 =C3=A0 00:06 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Bind all core components to the master component. Previously only the
> first core has been added to the master device to avoid creating
> multiple video devices. As the video device creation has been moved to
> the master component, it allows us to bind all cores without creating
> additional video devices.
>=20
> We expect that all cores to report the same version number, as we only
> add cores with the same compatible value. This is important, as=C2=A0 we
> setup the command buffer before actually scheduling the work to a
> specific core. Therefore adjusting command buffers depending on the
> version register only works when all cores have the same value.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 22 +++++++++++---------=
--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 1 +
> =C2=A02 files changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 0413b8518dfc8..6add6c510c127 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -742,6 +742,7 @@ static int rga_core_bind(struct device *dev, struct d=
evice *master, void *data)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D data;
> =C2=A0	struct rga_core *core =3D dev_get_drvdata(dev);
> +	struct rockchip_rga_version version;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	core->rga =3D rga;
> @@ -750,14 +751,21 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> =C2=A0	if (ret < 0)
> =C2=A0		return ret;
> =C2=A0
> -	rga->version =3D rga->hw->get_version(core);
> +	version =3D rga->hw->get_version(core);
> =C2=A0
> =C2=A0	v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
> -		=C2=A0 rga->version.major, rga->version.minor);
> +		=C2=A0 version.major, version.minor);
> +
> +	if (rga->num_cores) {
> +		/* we are not the first core, expect that we have the same version */
> +		if (rga->version.major !=3D version.major || rga->version.minor !=3D v=
ersion.minor)
> +			v4l2_warn(&rga->v4l2_dev, "Detected multi-core setup with different c=
ore versions!\n");

We should fail, and not just warn.

Nicolas

> +	} else
> +		rga->version =3D version;
> =C2=A0
> =C2=A0	pm_runtime_put(core->dev);
> =C2=A0
> -	rga->cores[0] =3D core;
> +	rga->cores[rga->num_cores++] =3D core;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -983,14 +991,6 @@ static int rga_probe(struct platform_device *pdev)
> =C2=A0		component_match_add_release(dev, &match, component_release_of,
> =C2=A0					=C2=A0=C2=A0=C2=A0 component_compare_of, core_node);
> =C2=A0		num_cores++;
> -
> -		/*
> -		 * As multi core is not implemented yet,
> -		 * break out of the loop to only have one core per rockchip_rga struct=
.
> -		 * Also put the node, which otherwise would've been done by the loop i=
teration.
> -		 */
> -		of_node_put(core_node);
> -		break;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!match)
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index fcf1ef7d2029f..6237436b984eb 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -88,6 +88,7 @@ struct rockchip_rga {
> =C2=A0
> =C2=A0	const struct rga_hw *hw;
> =C2=A0
> +	u8 num_cores;
> =C2=A0	struct rga_core *cores[];
> =C2=A0};
> =C2=A0

--=-TbhSyHxkx/Z3fez9TIdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFe1gAKCRDZQZRRKWBy
9GClAP9CEDkckOHaaBs3JSr4kR2glZ91T2+Em462BGZsPI608QEAkZF6ihkk7v4x
pzNO4wHmiemguZjKW2cONNbyb6HNbwQ=
=KoiK
-----END PGP SIGNATURE-----

--=-TbhSyHxkx/Z3fez9TIdu--

