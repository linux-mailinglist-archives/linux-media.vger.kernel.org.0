Return-Path: <linux-media+bounces-67323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5bopI2ReUWpKDQMAu9opvQ
	(envelope-from <linux-media+bounces-67323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:04:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6DA73E9B2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:04:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=IW2z+hKB;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67323-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67323-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8200D303132F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F19738F233;
	Fri, 10 Jul 2026 21:03:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2513358C4
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 21:03:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717410; cv=none; b=GXskuwwsT8jjfA4d7ZulHfLDqZ4tqwEjQIiieDL7QSRl5petJScyIcS3xsSPbiXxUqLtEifePxyd5qLZ/BOctsg0x/1RG4JDeOgIxpdHEDmst5sGLZUJISzrvA9N4jWvpmROKLPF5VfO8q9XY9PfzXsLjS5tC0kETAGJJvmN5tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717410; c=relaxed/simple;
	bh=UuINZYU2qBG2qOfy+aG2hiy+Y3ZKTtMJs8nI6LhsJZo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCVDc1j30+zVJGugZhv/zp+tBxl5LjOtS9sh+ucJXGvW19SYwNUVspWBe34afkK1lR5ZyJS0sV2rPsr+pfRk8gJg0Qi0+rqkKn/uiI08UQHtS2AGolYoY0zgvP4isICxKMS8H4wjZglRkjria+CFsb/eud23BK3L+YGF4270PHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=IW2z+hKB; arc=none smtp.client-ip=209.85.217.51
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-738a5cc517eso799077137.2
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 14:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1783717408; x=1784322208; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oAW2HPCqHJuPf3glJ9yHtHXppBEBUHxayiVr2N8Uxo=;
        b=IW2z+hKBu2bfPcFnK+Israf5VvTVgBayUeYc4QEAwq7MrdMI+HB32em5TmtfXx03nw
         OwQ2NFlEf+Avva0L9/JVu/MzzwcnR1baC3yM0spHnqgHGTu4NNyYb1HTYNHuydKLnEly
         fVjUP3/uR8b2/nA5MTrkeSwjr9bvn2GDrFwEEVdaf+5jZnslhw09v58RDquX942EDTs+
         hZ4dsBgc3wegRjHH3dbeYiCIR3Jyz2MM9/5RALLJ9viYx9JTsfAHv80awzwmwd+Pe8ux
         K7OBl5WR4xhQnDgafKqyUmZT8mq5Z42Zq7z+vlczdiHGnZ3alB6Pwq/XXpz9FIHLpn9Q
         ouGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717408; x=1784322208;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oAW2HPCqHJuPf3glJ9yHtHXppBEBUHxayiVr2N8Uxo=;
        b=SOfYChhT/VTen4ywCABtrMZpIxy9JC6MlnLR0xZ0AqflIMx5HzOofMeE6U4CY/ueka
         Iyo5g8qC0bgPaIm5J7TcSkBMdK/qsnGKl7/U/iDWUCx2srIAaRln5gsOXGo0vM7C+mGP
         jsv/hAWEGevybhiGYT4aC3AhFYI357KI1+vVYweZNHqKJ7dSkiWpopWrucyBIfQeWqWp
         ZKP4iyoHTuQxR0clVqpngbcqnh8ASJptS8Im0lazQFGjqPhiIUvAuVf7vZ+A6I57zdwY
         w5jDebUbj4cX7Q/B/N+l66PSch8YR594/u5t3asP0d1ietIRjXLHDtkJQNt28+W4aYk2
         Fa/Q==
X-Gm-Message-State: AOJu0YwIS0f28KVA5/E2baKR5rlA+ShEcXgrfJ3fjAq2I+BFvxcuuDjz
	yeb8heHqMHnV5Uh6N7YLoS3crmDPV+J7Zl4j2Gw6qLoaiF7imDFG9Hy0qe98BbME2sk=
X-Gm-Gg: AfdE7cnwVQaI7oPRuCFlprFwD+Y3ykBs841qEKhqaafuVNkl2L+G/MhTbv2pAaxct2x
	Ufup7jiiSnesRTQGIkYuTTjD/80TjN8mfRpcnfxOpbqOmfffJDQuSM62HeQOUkL/LLUOI+hMbyr
	35tTNkDw926ykD1hioPG9EoBU4dGsXn4XVcttK9wYMl63VcxKoiQJH7fM83LU7BkaAjZ5ZouZO5
	roWZJBximYD/Na0mammgzz3//fKX2TcnA4KkT3woCZthd1x9QqzzuexgqcLPiCDpSF0HyTRu84j
	nC7EYMKNFTlUzWDr7DXjFcrYOCfnCgYgnCW68KO/j0Ew/DN+Mw2IxyITSvcVQOMIF1SdejUHb/G
	kEuVy+bPDw9yWX5E8OdIUxN4IbKasXVW7wupBC7oObW//iU479tThQU3UQq77V7aBBWXSdXUyIV
	WHVLF4BP+/p6a8Hh0+wA==
X-Received: by 2002:a05:6102:e14:b0:631:26f6:7022 with SMTP id ada2fe7eead31-74533e42448mr568766137.23.1783717403226;
        Fri, 10 Jul 2026 14:03:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38b3bsm5878777137.10.2026.07.10.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:03:22 -0700 (PDT)
Message-ID: <897e5af14729bfe3723af1797bc83c6edb677c8d.camel@ndufresne.ca>
Subject: Re: [PATCH 08/17] media: rockchip: rga: add rga_core structure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: sashiko-reviews@lists.linux.dev, Sven =?ISO-8859-1?Q?P=FCschel?=
	 <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Date: Fri, 10 Jul 2026 17:03:20 -0400
In-Reply-To: <20260605222234.6930A1F00893@smtp.kernel.org>
References: <20260606-spu-rga3multicore-v1-8-3ec2b15675f7@pengutronix.de>
	 <20260605222234.6930A1F00893@smtp.kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-V33ouVo1ZNZ1mFo4d/hx"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-67323-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid,ndufresne.ca:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB6DA73E9B2


--=-V33ouVo1ZNZ1mFo4d/hx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 05 juin 2026 =C3=A0 22:22 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
>=20
> New issues:
> - [High] Missing NULL pointer check for devm_kzalloc allocation

There is a lot of noise coming from Sashiko, but this one needs fixing.

cheers,
Nicolas

>=20
> Pre-existing issues:
> - [High] Shared IRQ handler accesses suspended hardware and dereferences =
NULL context
> - [High] Missing synchronize_irq() in runtime suspend with shared interru=
pts
> - [High] Race condition between pm_runtime_enable and platform_set_drvdat=
a
> - [High] Use-After-Free during module removal due to incorrect teardown o=
rdering
> --
>=20
> commit 1e1c3cc644587ad2255c5349765b3893e811a0e9
> Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> media: rockchip: rga: add rga_core structure
> =C2=A0=C2=A0=C2=A0=20
> Add a rga_core structure to separate the core specific data from the
> m2m device. This is done in preparation for multi-core support.
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/med=
ia/platform/rockchip/rga/rga-hw.c
> > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>=20
> [ ... ]
>=20
> > @@ -447,36 +447,34 @@ static void rga_hw_setup_cmdbuf(struct rga_ctx *c=
tx)
> > -static bool rga_handle_irq(struct rockchip_rga *rga)
> > +static bool rga_handle_irq(struct rga_core *core)
> > =C2=A0{
> > =C2=A0	int intr;
> > =C2=A0
> > -	intr =3D rga_read(rga, RGA_INT) & 0xf;
> > +	intr =3D rga_read(core, RGA_INT) & 0xf;
> > =C2=A0
> > -	rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> > +	rga_mod(core, RGA_INT, intr << 4, 0xf << 4);
> > =C2=A0
> > =C2=A0	return intr & RGA_INT_COMMAND_FINISHED;
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but does this handle spurious interrupts
> correctly when the hardware is suspended?
>=20
> If an interrupt arrives on the shared IRQ line while the device is suspen=
ded,
> the clock-gated hardware typically returns 0xffffffff for rga_read(). The
> bitwise AND with RGA_INT_COMMAND_FINISHED will incorrectly evaluate to tr=
ue.
>=20
> The handler would then proceed in rga_isr():
>=20
> =C2=A0=C2=A0=C2=A0 struct rga_ctx *ctx =3D core->curr;
> =C2=A0=C2=A0=C2=A0 WARN_ON(!ctx);
> =C2=A0=C2=A0=C2=A0 core->curr =3D NULL;
> =C2=A0=C2=A0=C2=A0 src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>=20
> If no job is active, core->curr is NULL, and dereferencing ctx->fh.m2m_ct=
x
> will cause a kernel panic. Should we verify the PM state before hardware
> access in the ISR using pm_runtime_get_if_active()?
>=20
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/=
platform/rockchip/rga/rga.c
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
>=20
> [ ... ]
>=20
> > @@ -799,20 +803,25 @@ static int rga_probe(struct platform_device *pdev=
)
> > =C2=A0	if (!rga->hw)
> > =C2=A0		return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match =
data\n");
> > =C2=A0
> > -	rga->dev =3D &pdev->dev;
> > =C2=A0	spin_lock_init(&rga->ctrl_lock);
> > =C2=A0	mutex_init(&rga->mutex);
> > =C2=A0
> > -	ret =3D rga_parse_dt(rga);
> > +	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> > +	core->rga =3D rga;
> > +	core->dev =3D &pdev->dev;
>=20
> [Severity: High]
> Could this lead to a NULL pointer dereference? If devm_kzalloc() fails an=
d
> returns NULL, assigning core->rga =3D rga in the next line will immediate=
ly
> crash. A check like "if (!core) return -ENOMEM;" appears to be missing he=
re.
>=20
> > +
> > +	rga->cores[0] =3D core;
> > +
> > +	ret =3D rga_parse_dt(core);
> > =C2=A0	if (ret)
> > =C2=A0		return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\=
n");
> > =C2=A0
> > -	pm_runtime_set_autosuspend_delay(rga->dev, 50);
> > -	pm_runtime_enable(rga->dev);
> > +	pm_runtime_set_autosuspend_delay(core->dev, 50);
> > +	pm_runtime_enable(core->dev);
> > =C2=A0
> > -	rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -	if (IS_ERR(rga->regs)) {
> > -		ret =3D PTR_ERR(rga->regs);
> > +	core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(core->regs)) {
> > +		ret =3D PTR_ERR(core->regs);
> > =C2=A0		goto err_put_clk;
> > =C2=A0	}
>=20
> [ ... ]
>=20
> > @@ -852,7 +861,7 @@ static int rga_probe(struct platform_device *pdev)
> > =C2=A0	video_set_drvdata(vfd, rga);
> > =C2=A0	rga->vfd =3D vfd;
> > =C2=A0
> > -	platform_set_drvdata(pdev, rga);
> > +	platform_set_drvdata(pdev, core);
>=20
> [Severity: High]
> This is a pre-existing issue, but does this create a race condition windo=
w
> between pm_runtime_enable() and platform_set_drvdata()?
>=20
> If a PM transition occurs right after pm_runtime_enable(core->dev), the
> runtime PM callbacks like rga_runtime_suspend() might execute before
> platform_set_drvdata(pdev, core) is called.
>=20
> In rga_runtime_suspend(), dev_get_drvdata() would return NULL, leading to=
 a
> crash when attempting to access core->num_clks.
>=20
> [ ... ]
>=20
> > @@ -904,23 +914,23 @@ static void rga_remove(struct platform_device *pd=
ev)
> > =C2=A0	video_unregister_device(rga->vfd);
> > =C2=A0	v4l2_device_unregister(&rga->v4l2_dev);
> > =C2=A0
> > -	pm_runtime_disable(rga->dev);
> > +	pm_runtime_disable(core->dev);
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but could this teardown sequence result in =
a
> use-after-free vulnerability?
>=20
> Calling v4l2_m2m_release(rga->m2m_dev) (which occurs just before the quot=
ed
> lines) before video_unregister_device() leaves the video node accessible =
to
> userspace after the m2m_dev structure has been freed. Concurrent V4L2 ioc=
tls
> from userspace might then interact with freed memory.
>=20
> > =C2=A0static int __maybe_unused rga_runtime_suspend(struct device *dev)
> > =C2=A0{
> > -	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> > +	struct rga_core *core =3D dev_get_drvdata(dev);
> > =C2=A0
> > -	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> > +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0}
>=20
> [Severity: High]
> This is a pre-existing issue, but are we missing a call to synchronize_ir=
q()
> before powering down the hardware?
>=20
> Since the driver can request a shared interrupt line (IRQF_SHARED), disab=
ling
> the clocks without waiting for mid-flight IRQ handlers to finish might re=
sult
> in bus errors or crashes if another device triggers the shared IRQ while
> suspending.

--=-V33ouVo1ZNZ1mFo4d/hx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFeGQAKCRDZQZRRKWBy
9MhqAQCROVYKKOk47bRr3kw9ylc9GXlY/LfDmnIfsYtUzcmv4QEAjvKH0y9f5muL
HGNmwOyigTAhQOLXl6fe+Fm/IuzA5A0=
=ndJF
-----END PGP SIGNATURE-----

--=-V33ouVo1ZNZ1mFo4d/hx--

