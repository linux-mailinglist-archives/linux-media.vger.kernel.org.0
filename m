Return-Path: <linux-media+bounces-52048-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NB1MrPTgGmFBwMAu9opvQ
	(envelope-from <linux-media+bounces-52048-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:41:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ACCCF141
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314EF3017C32
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 16:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CE937F0EA;
	Mon,  2 Feb 2026 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SLt97rhG"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07A37E311;
	Mon,  2 Feb 2026 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049942; cv=none; b=K1GTQuQIHn8IdZF5j+6NsExklqiRf60iCua35iVU+7pTRqxSu57C19oSZwiemS1zwwvSURRDA585+AeRp9zSa+DnTPOGxang5hqzw5uIlMVbtqYEdnzvfuEvAzVx2bFReuw+xFdNJP2lVIhouizIuOoDUpX6pwtQe5OVBR/67qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049942; c=relaxed/simple;
	bh=EbEcrN/Wa7xsaLg8FjqJkY67F/gdBSGhJKVWbuWvgtY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TfWn8goleRmcyeEJZEyRfO36MTB67m13ADIo3fI2dInRGvsWbm82LBNQOTr5rfPXSBKAUUH9pN2LZo+AZZcvnzpmAz7zzVB3WCIluB9rBqqor2Am08dSNrVOwSffKxjXu3xz13aTklskJfxsaDtPIFGdBbUp6cHxU1dlDcPnLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SLt97rhG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770049939;
	bh=EbEcrN/Wa7xsaLg8FjqJkY67F/gdBSGhJKVWbuWvgtY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SLt97rhGMZFLOSh/T2m5qPWsdjbnIbe7p98Ae65y+OIRQAPOHS5V7IiMNMJt2I5q0
	 i8ip9fNtICHk6o6pP8+dtXzQGFVHCvfM5l2vCrGS9u8gV0anm7Sm3oM5Np5XNfi7p4
	 xINUFjlpdXXeyOgbj8r49BNxczNTUkWTSSDNaJ0qxVd9DDhiUospsvhNAoH2mvzrLd
	 UI62ZkxaQoRAt9T7khg/yKusIiGkgDuNI6w/uLPtiMvMUBt1yOl7Ns20s5ijq135wa
	 80FZLW6lxw/1LFITVFCEXcA77i+53ndesDm3xomWB0ux5Z/6/2vXbUtnyziBKy/Vr3
	 zk1XLtA9yL2hw==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CFB417E1276;
	Mon,  2 Feb 2026 17:32:17 +0100 (CET)
Message-ID: <ca81b8b03651cdb4f997c89fffd489407be59b8b.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: rkvdec: reduce stack usage in
 rkvdec_init_v4l2_vp9_count_tbl()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor	
 <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Alex Bee	
 <knaerzche@gmail.com>
Date: Mon, 02 Feb 2026 11:32:16 -0500
In-Reply-To: <20260202094804.1231706-2-arnd@kernel.org>
References: <20260202094804.1231706-1-arnd@kernel.org>
	 <20260202094804.1231706-2-arnd@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-2jK0PyPR5gtYSVPZSaBh"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52048-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,google.com,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,kwiboo.se];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,lkml,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,arndb.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33ACCCF141
X-Rspamd-Action: no action


--=-2jK0PyPR5gtYSVPZSaBh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 10:47 +0100, Arnd Bergmann a =C3=A9cri=
t=C2=A0:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The deeply nested loop in rkvdec_init_v4l2_vp9_count_tbl() needs a lot
> of registers, so when the clang register allocator runs out, it ends up
> spilling countless temporaries to the stack:
>=20
> drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:966:12: error: stack =
frame size (1472) exceeds limit (1280) in 'rkvdec_vp9_start' [-Werror,-Wfra=
me-larger-than]
>=20
> Marking this function as noinline_for_stack keeps it out of
> rkvdec_vp9_start(), giving the compiler more room for optimization.
>=20
> The resulting code is good enough that both the total stack usage
> and the loop get enough better to stay under the warning limit,
> though it's still slow, and would need a larger rework if this
> function ends up being called in a fast path.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index ba51a7c2fe55..1c875d5a2bac 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -893,7 +893,8 @@ static void rkvdec_vp9_done(struct rkvdec_ctx *ctx,
> =C2=A0	update_ctx_last_info(vp9_ctx);
> =C2=A0}
> =C2=A0
> -static void rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
> +static noinline_for_stack void
> +rkvdec_init_v4l2_vp9_count_tbl(struct rkvdec_ctx *ctx)
> =C2=A0{
> =C2=A0	struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
> =C2=A0	struct rkvdec_vp9_intra_frame_symbol_counts *intra_cnts =3D vp9_ct=
x->count_tbl.cpu;

--=-2jK0PyPR5gtYSVPZSaBh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYDRkAAKCRDZQZRRKWBy
9HFyAP0RF5b0OenNAGH35mTowVmYp7pBvzgVyYN7ehX7jmx8VAEAw6AY+q+q1f2m
VfoYBMjnRCRr5g/hOebJT5oXUy814QA=
=fZxd
-----END PGP SIGNATURE-----

--=-2jK0PyPR5gtYSVPZSaBh--

