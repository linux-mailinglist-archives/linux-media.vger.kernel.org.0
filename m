Return-Path: <linux-media+bounces-52327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEdZBU5WhmmlMAQAu9opvQ
	(envelope-from <linux-media+bounces-52327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:59:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195B103505
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 21:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0524B303FAE4
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 20:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1164311959;
	Fri,  6 Feb 2026 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TdpfGr1o"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E946E3112D2;
	Fri,  6 Feb 2026 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411587; cv=none; b=UfWIwcJ97MoIz5crGwpWeER47iar31ouD8svJfyPJ+dCV4RYamtTrBCvWJaVGgPUy1qK/pVis5jt+JBuR5lH5bbZr8wpgS6zEi22oCeOo0Wk4UhODUA02v66xjjNyOtAVC6/z4C6KOrQ84QwLVvk4C1InsniMeUtUL7eu0SEjdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411587; c=relaxed/simple;
	bh=jXqEJEGiXPhD7zWPLuNoLbQ/40GXnh/bGuHL6XDHfek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WukOijy14fKJ+ZtdUmZGHV/E9b2AFn7MHJ8FEMU6FyY2L8mt+zWW6QXrNyueYZnVUBL4wynnM3VJdDcxJLaoydhMzjwtTic9vXBC5paloLUUzX+FDdh/eazlW8yCHjwk2bXmNqIxpZW3bwWING2GpdUMMdaKpR6sltmZbt5+5tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TdpfGr1o; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770411585;
	bh=jXqEJEGiXPhD7zWPLuNoLbQ/40GXnh/bGuHL6XDHfek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TdpfGr1olNIIlB9hGxiPuShvtxZDAHT7HAWgwZoTmZai4SeKIGTo7dtrysq9o7ktp
	 e0ALbI/bUt62nKdexqz3rUhKjTT+YE+vjtYx5RDiqtUPIlZMqc+d2OPDLJNPXCjEvD
	 D3EWlm9fSeyhNhjs+ABoWFsatKPpAbRHiA/DZ837Y66j7Sy5MtCMzU9QrmdsKFHsAU
	 YnHHKFDXKWUFLfhb6iUqIqWwzH92K0TzoCXCr2cMWXKasQ1dBtB7Px7zntmzrd84Wu
	 2K8GWgbzDr94dTxQ7BTy68PUTQ0vHO6ukpHC2IpBb+O7O/tBC0U4aRhGZ0ykvXExpU
	 ncrLNdfHPsrIA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00CFA17E1013;
	Fri,  6 Feb 2026 21:59:43 +0100 (CET)
Message-ID: <600cc65678331b0c419d0b517d6c9003481223b8.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Improve handling missing short/long term
 RPS
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, Christian
 Hewitt	 <christianshewitt@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Date: Fri, 06 Feb 2026 15:59:42 -0500
In-Reply-To: <20260123192244.1441637-1-detlev.casanova@collabora.com>
References: <20260123192244.1441637-1-detlev.casanova@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-897AqV6kq3AaBnl4pheR"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,vger.kernel.org,lists.infradead.org,collabora.com,gmail.com,kwiboo.se];
	TAGGED_FROM(0.00)[bounces-52327-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6195B103505
X-Rspamd-Action: no action


--=-897AqV6kq3AaBnl4pheR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 23 janvier 2026 =C3=A0 14:22 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The values of ext_sps_st_rps and ext_sps_lt_rps in struct rkvdec_hevc_run
> are not initialized when the respective controls are not set by userspace=
.
>=20
> When this is the case, set them to NULL so the rkvdec_hevc_run_preamble
> function that parses controls does not access garbage data which leads to
> a panic on unaccessible memory.
>=20
> Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 var=
iant")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Suggested-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'll pick this in fixes, so we don't release 6.20 (or 7) with that bug.

cheers,
Nicolas

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c | 4 +++=
+
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> index 28267ee30190..3119f3bc9f98 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> @@ -500,11 +500,15 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ct=
x,
> =C2=A0		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_=
ST_RPS);
> =C2=A0		run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	} else {
> +		run->ext_sps_st_rps =3D NULL;
> =C2=A0	}
> =C2=A0	if (ctx->has_sps_lt_rps) {
> =C2=A0		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_STATELESS_HEVC_EXT_SPS_=
LT_RPS);
> =C2=A0		run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> +	} else {
> +		run->ext_sps_lt_rps =3D NULL;
> =C2=A0	}
> =C2=A0
> =C2=A0	rkvdec_run_preamble(ctx, &run->base);

--=-897AqV6kq3AaBnl4pheR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYZWPgAKCRDZQZRRKWBy
9JwhAP9UIkCMcg8W8+RHSrgDTGNgUiIycn2gGMavIcmqgcq98gEA3XieiwUqwRbW
pkGqVq8rFrMMs18duyTlZ6hmGqQ4iw0=
=cb/E
-----END PGP SIGNATURE-----

--=-897AqV6kq3AaBnl4pheR--

