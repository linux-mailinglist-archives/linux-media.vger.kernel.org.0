Return-Path: <linux-media+bounces-67325-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xAEqNJ1eUWpWDQMAu9opvQ
	(envelope-from <linux-media+bounces-67325-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:05:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC0273E9CF
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:05:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b="MXX/V4nO";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67325-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67325-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A79B93036710
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8DC314A98;
	Fri, 10 Jul 2026 21:05:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230A38E8CC
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:05:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717525; cv=none; b=HswV3ofggkwkMIkYnnyanghDp0nTJAckHUZFP9U1C8mTWROjYazNZJWqXESHP31zjDtVCWP4bNb+YMqr3ECwkf+tFPEFG1VafnH7sEigAi42oeIdyTtdEcUPX2I4WVlRR5CVcofpte2TZvSQegi4buk2s8a6/JSOOXwwUQUf6iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717525; c=relaxed/simple;
	bh=FTZWWjRhWDfYbUZdVlv5lAyKBGf81/olpriaG8gMRgA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+QtSGe2ymWw0883oeUyERsJy/+O5BhwVh5bPVVr8u8EeID/Gn7EozybkVoJr/7p60nTzI7SWdnoaI8GTFfGiWlTJnwJnRCR1fTh12nfjN8XSbvUwTw/TBGWEWYVu4W9NGt+2fRA6WKAQMF6oJQ8huqDB/PDTiPTYJYSJ/mmjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=MXX/V4nO; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfb3347ce0so241869e0c.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783717523; x=1784322323; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fzdRgw5D47A6vc4awRc8DLJJmN1O3Mb0gJhGI5I9fBI=;
        b=MXX/V4nOQRscdYvmsY9M/ipdnPSL8or6GCyUqiQs0YZ9AjF/kG4MHJ9kImVSkYDITw
         1iLDlwo+1iBGaDOYUNhlIco6zG6SvqMAcu0b9r/KTZIl+F/1Yw729G3XO8xiYQ6xNgtu
         YwDICLSpkevJMBRPc8fEXmXC+4KWIcaejIumYahW908K84kKSlu9DLuZ+Ehegil4A1NF
         Zwwt7crLv5Yn2GKUtFa+PeZMDbN6KT8rswJhRM9mPeaEUAndqWLOnptZHwXICrSSHK0a
         Ss1I5LzYdjaBb3M87vAWbx+TGACoEBz3NIyJIPP0mwHqNnGzmBv8tjBk9mBl7T5Inv8k
         j7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717523; x=1784322323;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzdRgw5D47A6vc4awRc8DLJJmN1O3Mb0gJhGI5I9fBI=;
        b=FLXL8qhJYEQWif2PXHgOu2Sf14e//isVOpuj2SFbnw2j8y/R5iZZFP/eXNU6XG0DIs
         hTeHbDMfLjIrd2r+Q8x+CpOApQKjLPWd67GxllIImWxdJ9GVkD7ThxSXqcL0m1KJUfuU
         qNFp/8+yBcr0WeGfLjD3QIh1u2Qwvbh3wT0/J/Ey50BvATerBeAL/xq3mzZuB00ga8Lq
         K9Lj3nMfXdz/ryEPeZ27Y6be5Al6kHR260uuCsby/5+iN88DZ+0mkUp1bisAUzDGHC3H
         yLnyugwDmL3cfsJ++Ij77+p9asvPJYtOVpZqhG1/ysnJP0Xtz7Rkci2dRnhG9y/mrYRx
         AS0Q==
X-Gm-Message-State: AOJu0YwXq17Au2xGZymh3k6XszRyaYG0TaW+THQ1IzaiiyjnX3fO0ZT5
	k5cbd5li4CqGHNEgGZGqTJS5Pr7wOQpxKHmak7UeTOMcl5+3aw9vCNVqHXfYOCDYyVQ=
X-Gm-Gg: AfdE7cmwuuV02enReYXZvQmkhhHrYF7/MQnUY23I4T5xEaqdv4wjQ1TnlX3I47bVNdO
	lEVH+8wJHfG4fOzaUK0Lo850F5wRhdBb6S0YjTP8sMwD/yxuX/qxtlpo3Y/S5Wd0CJ59c3hEL+v
	jX11RWMWhwkCuwC+mFLjGv8ski+HuW6svLjILVM6YVrh8qLUM59mGQ8M5QSnYSEwc4u2yC0Vmiw
	8ssVSR4rrktJcl042V1zvt4oqkRncjpn9C7DD4p4Y+Ic74FxVGLW1KcpGm0p4buc+y+qJNK8RjS
	25u7PBiiv7OjTCdt/TrLE1BxWgIGnOxt9SxKVfnSdXkvXtb1NOO13ybW0hWn/dZGLcZZmOmxQXI
	abNaGP+uJCtIeLLSomeCm0ikUvP/vNVOFtg+ht2kTadK2t6BUGxqRPB0/4zgtq+jFOUw4KxxFtM
	7vroVPsVJNsm4mU87QZw==
X-Received: by 2002:a05:6122:83f2:b0:5bf:bb2c:1325 with SMTP id 71dfb90a1353d-5bfbf2b3c14mr551931e0c.11.1783717522463;
        Fri, 10 Jul 2026 14:05:22 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f66bdfesm6547770e0c.6.2026.07.10.14.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:21 -0700 (PDT)
Message-ID: <54627c5dcc9d0f8318163dfa63ddca9f3c3a0845.camel@ndufresne.ca>
Subject: Re: [PATCH 12/17] media: rockchip: rga: move core initialization
 from bind to probe
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: sashiko-reviews@lists.linux.dev, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Date: Fri, 10 Jul 2026 17:05:20 -0400
In-Reply-To: <20260605222016.84C581F00893@smtp.kernel.org>
References: <20260606-spu-rga3multicore-v1-12-3ec2b15675f7@pengutronix.de>
	 <20260605222016.84C581F00893@smtp.kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-1IFg3XQG4ab9EwEqwNVw"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-67325-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:s.pueschel@pengutronix.de,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,ndufresne.ca:from_mime,vger.kernel.org:from_smtp,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EC0273E9CF


--=-1IFg3XQG4ab9EwEqwNVw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 05 juin 2026 =C3=A0 22:20 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] NULL pointer dereference in `rga_isr()` due to early shared IRQ =
registration.

Not really applicable to this type of HW.

> - [Medium] Missing `pm_runtime_disable()` on `component_add()` error path=
.

relevant.

Nicolas

>=20
> Pre-existing issues:
> - [High] Unprotected hardware access in shared interrupt handler.
> - [High] Missing `synchronize_irq()` in runtime suspend for shared IRQs.
> - [High] Use-After-Free when the master device is unbound.
> - [High] Missing NULL check for `devm_kzalloc` allocation.
> --
>=20
> commit 8a3476b206ac8426da5cf08410222d4a74238c92
> Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> media: rockchip: rga: move core initialization from bind to probe
>=20
> This commit moves the core initialization from the core binding function =
to
> the core probing function to better match the actual initialization seque=
nce.
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > index 952377ae467f5..0413b8518dfc8 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
>=20
> [ ... ]
>=20
> > @@ -740,21 +740,49 @@ static int rga_parse_dt(struct rga_core *core)
> > =C2=A0
> > =C2=A0static int rga_core_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0	struct rga_core *core;
> > =C2=A0	const struct rga_hw *hw;
> > =C2=A0	int ret =3D 0;
> > =C2=A0	int irq;
> > =C2=A0
> > =C2=A0	if (!pdev->dev.of_node)
> > =C2=A0		return -ENODEV;
> > =C2=A0
> > +	hw =3D of_device_get_match_data(&pdev->dev);
> > +	if (!hw)
> > +		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match data\=
n");
> > +
> > =C2=A0	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> > -	core->rga =3D rga;
> > =C2=A0	core->dev =3D &pdev->dev;
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but does this devm_kzalloc()
> allocation need a null pointer check?
>=20
> If the allocation fails under memory pressure, the immediate assignment t=
o
> core->dev =3D &pdev->dev will cause a null pointer dereference.
>=20
> [ ... ]
>=20
> > @@ -775,7 +803,7 @@ static int rga_core_bind(struct device *dev, struct=
 device *master, void *data)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ret =3D devm_request_irq(core->dev, irq, rga_isr,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rga_has_internal_iommu(rga) ? =
0 : IRQF_SHARED,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->has_internal_iommu ? 0 : I=
RQF_SHARED,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(core->dev), core=
);
>=20
> [Severity: High]
> Since devm_request_irq() is now called here in rga_core_probe(), could th=
is
> trigger an early null pointer dereference in rga_isr()?
>=20
> When hw->has_internal_iommu is false, the interrupt is registered as
> IRQF_SHARED. For shared interrupts, the handler can be invoked immediatel=
y by
> another device sharing the line. However, core->rga is not initialized un=
til
> rga_core_bind() runs later.
>=20
> If the interrupt service routine fires early, it will evaluate
> rga->hw->handle_irq(core) and unconditionally dereference the null core->=
rga
> pointer.
>=20
> [Severity: High]
> This is a pre-existing issue, but does the shared interrupt handler safel=
y
> access hardware registers?
>=20
> Because rga_isr() is registered as IRQF_SHARED, it can be invoked by anot=
her
> device while this device is runtime-suspended and unclocked. The handler
> unconditionally calls rga->hw->handle_irq(core), which accesses registers=
.
> Reading powered-off registers typically causes a synchronous external abo=
rt.
>=20
> Should the interrupt service routine use pm_runtime_get_if_active() befor=
e
> accessing registers?
>=20
> [Severity: High]
> This is another pre-existing issue related to the shared interrupt, but i=
s
> there a missing synchronize_irq() in the runtime suspend path?
>=20
> In rga_runtime_suspend(), clocks are disabled without synchronizing the
> interrupt. If an interrupt fires on another CPU just before clocks are
> disabled, the handler could actively read registers exactly when the hard=
ware
> is powered down.
>=20
> [Severity: High]
> This is a pre-existing issue, but could tying the shared interrupt to the
> core device lifetime cause a use-after-free when the master device is
> unbound?
>=20
> The shared interrupt is requested via devm_request_irq(core->dev, ...). W=
hen
> the master device is unbound, its rga structure is freed. Since the core
> device is not removed during unbind, the devm-managed interrupt is not fr=
eed,
> leaving the shared handler active.
>=20
> A subsequent interrupt will execute rga_isr(), which dereferences the
> freed core->rga pointer.
>=20
> [ ... ]
>=20
> > @@ -833,11 +825,20 @@ static int rga_core_probe(struct platform_device =
*pdev)
> > =C2=A0
> > =C2=A0	ret =3D component_add(&pdev->dev, &rga_core_ops);
> > =C2=A0	if (ret < 0) {
> > =C2=A0		dev_err(&pdev->dev, "failed to register component: %d", ret);
> > =C2=A0		return ret;
> > =C2=A0	}
>=20
> [Severity: Medium]
> If component_add() fails, does this bypass the pm_runtime_disable() clean=
up
> at the err_put_clk label?
>=20
> Returning directly instead of using a goto would leak the device's Runtim=
e
> PM usage counter.
>=20
> > =C2=A0	return 0;
> > +
> > +err_put_clk:
> > +	pm_runtime_disable(core->dev);
> > +
> > +	return ret;
> > =C2=A0}

--=-1IFg3XQG4ab9EwEqwNVw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFekAAKCRDZQZRRKWBy
9EJxAQCerJAHaLRN7FFNTY3YyPH0fqeo6LEF7j3+G+gOa6SqPAEAkqdjquJ6+79k
yKGWesuohb6hpxdNV7L0h2dJMmp88gU=
=YL8F
-----END PGP SIGNATURE-----

--=-1IFg3XQG4ab9EwEqwNVw--

