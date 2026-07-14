Return-Path: <linux-media+bounces-67572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aW8BDqZJVmqM2wAAu9opvQ
	(envelope-from <linux-media+bounces-67572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:37:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C1755EC6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 16:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=qm+Lms08;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67572-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67572-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7EEA30F4EA7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 14:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590CE47DD76;
	Tue, 14 Jul 2026 14:28:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5047D95F
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 14:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039336; cv=none; b=ZMJbfO/6vwYxSOwk5uoQZcUoC773nWl1i9Ah3m5xdbzLsUZrDp/z7agCUejJ/IaU6pp2tc0+TsRoWe9V6RcZ17j5BHq4/Y5TN6TGrQ0zStH93Z5Tl4PIlajajhTOOWKYlPDobsa7XgU3Q7X6jqK7/sEfzWTpQsUDvP36qWH2P9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039336; c=relaxed/simple;
	bh=5n8VbHtQhWz1Q91nPMs3Rqh2pcWVSlitrhif8Vd6au8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IglefVgTp2D6zzmU2HvL1OhNam3XOP80payUXVAjrLAoCMnGAZFAHfqJ+GKBp0c58fGvh3k6wiqWJ3qmaQbTu5aAqcpKZ4+F0Y6bvUeCXKQe18jKD/DXRWj//m9kHit4qxM1Qra+U0vS9LXUiJo3RPxRnDSooe7mxNzSk78WDrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=qm+Lms08; arc=none smtp.client-ip=209.85.217.50
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-738a5cc517eso961549137.2
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784039331; x=1784644131; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=qm+Lms08645Ye/uleJAPoVJJIU0t/12wrFNvcl41u24WT9PmuLBA9hXTj2Klf8mrKa
         lXYokHqH1VTK0qIfQWYYEMJnL7KBw+w+6j49nzEyAG1y0RmL7j9fTE0TT0s9yE5SjBJA
         ckQdZqd6bWCI+9dEsjvC2BTUBcHp9FgABWBGUEVfZ6uQI8TCVTZq2+9H7ssqaKXMNmbH
         LL/2vX6VDz+8T8ZuS6zaxjkpGVLLClqfZa9jVaiPVaBf17qlhTnsranakTruM7SkixHl
         2NyYPzRFAtNxksCZ1zs15OogYsfi26Aijtj2aJtCY3DRjvhQsZCenIelOJPOybPWsOE3
         N+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784039331; x=1784644131;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L25chsznU2xViBCoDsOOuGB4w/iTxvj+zhnZXq2fDI4=;
        b=cIIvvVZbhPJRdfgTNb6lXMMDtWSIRbMVnpIliB05U5zd40Lubq2lqUfpW5hBBLeyrb
         9Z7FEeVznynONuqgItAjapFuUG5Ux2JkUQjL+UCL2HLCY5jflL5EkJebtXlI2ns/wysX
         t7HFcvjyK30j5kNofjFryXi0VnUHrfGYGZMGpwVsMRPu2WqChfIHCAOqEufzkpItriHX
         QwmIeFQcgpco7p7BRa1NPdw8H5mOZiH/fVxBtYUF69sDtZwNqKK701bRfZwm3QSfBNp+
         H5ERKv+KsOUzr2/PqJS9+DA9TEzqht4orO/VWFGKXDTwvsSu8PVbSQJxYvnT0KfwOvKo
         3+jg==
X-Forwarded-Encrypted: i=1; AHgh+RoMe//wUDI5mfdeWTfPzIzwGhktxFnDlzDjX4iVa6rQvgLAoPZyn/3myKq9+kDCtsSkKCo8PS0tQZnvHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfvDVjGDJEp2b4VFVBdEC4qLfmE2ahCfCX84R0pi04PY+IDHv
	QJGMgsoS5GQVIu+qdGaH8ROh9wuX9JQXAiP11Ca1aOZCrljwUu17gRXPTZRs66P9FI0=
X-Gm-Gg: AfdE7clGs2yXCB8hsQ6cUemF3oyMLU2bgBEtipyTWBlBUyiFSyFqAZfPfNrSF1zkT62
	6a/vlxmixjNVIUfV36ummVdXqq2OJFOWlD9pMzJ1ZBh6quy1dLQ0jRBEE07Pe/gAaZRh67GDd54
	ljupqKrsXguFdPZxYOtBFzk6FWUDSls79xYBbVHwsvSCa2cC1mg4Ij6PMVlFv9wJbILo2edD+qw
	i/CvyGY5fnEZA+Lfc8s+lx73xpTtR61LNVA20gGyeVAhBaoDahiCaIIZtNvk9mHr7svbZUd7VFm
	zk0T7NwGwHPk0g3gwKybq0Vs6e4vU+daFODUr07zWviXKTWPIgUlgGQv/ZhGzmWRdEPUsV2cFNI
	u1z1uj1WIpOeVC/Kt0jUxrc8zOMUdD6FGYxOuFo33sSgS5WiP+3FHfe3xV87WqJogkCr+/dgk1p
	85C0nE6wCyQhLb8Mqdcw==
X-Received: by 2002:a05:6102:4188:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-74533b5d732mr8759191137.4.1784039331337;
        Tue, 14 Jul 2026 07:28:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm10251628137.3.2026.07.14.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:28:50 -0700 (PDT)
Message-ID: <263a79327f88e75a821abbbeb6f1dfa0448da86e.camel@ndufresne.ca>
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate
 devm_clk_get() errors
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, dan.carpenter@linaro.org,
 error27@gmail.com
Date: Tue, 14 Jul 2026 10:28:48 -0400
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-WDqrlTDAgquoB2fbpaws"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alfievarghese22@gmail.com,m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:dan.carpenter@linaro.org,m:error27@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67572-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:from_mime,ndufresne.ca:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 740C1755EC6


--=-WDqrlTDAgquoB2fbpaws
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 14 juillet 2026 =C3=A0 19:34 +0530, Alfie Varghese a =C3=A9crit=C2=
=A0:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
>=20
> Return PTR_ERR() instead to propagate the real error to the caller.
>=20
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index a039d925c0fe..fba1e7f88d81 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pde=
v)
> =C2=A0	=C2=A0=C2=A0=C2=A0 core->platform->revision =3D=3D VDEC_REVISION_S=
M1) {
> =C2=A0		core->vdec_hevcf_clk =3D devm_clk_get(dev, "vdec_hevcf");
> =C2=A0		if (IS_ERR(core->vdec_hevcf_clk))
> -			return -EPROBE_DEFER;
> +			return PTR_ERR(core->vdec_hevcf_clk);
> =C2=A0	}
> =C2=A0
> =C2=A0	core->dos_parser_clk =3D devm_clk_get(dev, "dos_parser");
> =C2=A0	if (IS_ERR(core->dos_parser_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_parser_clk);
> =C2=A0
> =C2=A0	core->dos_clk =3D devm_clk_get(dev, "dos");
> =C2=A0	if (IS_ERR(core->dos_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->dos_clk);
> =C2=A0
> =C2=A0	core->vdec_1_clk =3D devm_clk_get(dev, "vdec_1");
> =C2=A0	if (IS_ERR(core->vdec_1_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_1_clk);
> =C2=A0
> =C2=A0	core->vdec_hevc_clk =3D devm_clk_get(dev, "vdec_hevc");
> =C2=A0	if (IS_ERR(core->vdec_hevc_clk))
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(core->vdec_hevc_clk);
> =C2=A0
> =C2=A0	irq =3D platform_get_irq_byname(pdev, "vdec");
> =C2=A0	if (irq < 0)

--=-WDqrlTDAgquoB2fbpaws
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalZHoAAKCRDZQZRRKWBy
9ICYAP9pdhNwuOwbtfpwNZ80VSG7CJ/koMU0FTTz4mI20OIOhgD/YYFDt2jAB7h2
ZcXN8NZl9UQJkwnOiSpvH96NmWi2ZA0=
=7elq
-----END PGP SIGNATURE-----

--=-WDqrlTDAgquoB2fbpaws--

