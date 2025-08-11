Return-Path: <linux-media+bounces-39444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C4AB20C9F
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68161630C4
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD2B2D23B8;
	Mon, 11 Aug 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gABWQOEk"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58B1DE3BA;
	Mon, 11 Aug 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923693; cv=none; b=Mgx0q+rsuSh8pjZZkHnS79yVNxCBp83WF0LB94EH0Ybqu5w4h79wqRfma3GT+HB+3PuAdgNfqIIDvSeKA/yAAQRcgA6aT0dgmPKg1dbsiyeHM9LubQCINxO+dAPgZzvGyXw5NDhOfuSvxORm4mjLd5T9a2TJ8uw1Ow4kM3B6GYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923693; c=relaxed/simple;
	bh=2ttNFHfmj4mQE2B7+cFN9UQXOG4qR8BI6Y3f2gvJkYw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tDmAe8nyqYMVYbSVtidWa0907QtjewQFS4HCd0G7WwkogLn+e9l5Etbmzsd4z21qXmPEDy0WcQJTfvDm3VrTZ6PMiOTer3bMH+M137FTctLIYwqz2RiOZecEso1bCAKel60ha+g2YscAY8SH8uaGV7kXJu1yCNjpPrCqTCZVq6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gABWQOEk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754923689;
	bh=2ttNFHfmj4mQE2B7+cFN9UQXOG4qR8BI6Y3f2gvJkYw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gABWQOEkM52WLAnQuEi3mba8WkBHcmbi3GuxKe3B3aclcUGyMpyYa5PwKKjscmOeP
	 3+byGipQrdmOj724lMOW3pXGmWeYmLdbDLZQabzSaNX1GnawmF0X0OlopyOxlOf4St
	 KyNcRgBSYOJ6Smk7p5oBYMN0cxONcXINdyE+t5MLcVkpNexZy18o/JjFojWS8zrUfj
	 0YK7OtlXS7CqhEXXnfFrPj6Fe7dkgfjFbBCSgItka0z7Vkks7lHsw3GxwLF2ixWX8v
	 GpUwUpQU1RaC4AMFoIL3NlaAWEHJQ2/AdTi3zD73f8cm3pnmbpuHVKLECIwXhfrFPz
	 YxtLTRnw43/Kw==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6064B17E1014;
	Mon, 11 Aug 2025 16:48:08 +0200 (CEST)
Message-ID: <1adf4bb9717def1b98d75344b8b888e8d1a8526a.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Remove redundant
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sakari
 Ailus	 <sakari.ailus@linux.intel.com>
Date: Mon, 11 Aug 2025 10:48:07 -0400
In-Reply-To: <1894144.QZUTf85G27@diego>
References: 
	<20250811-rkvdec-redundant-pm-rebase-v2-1-90c47213fbbe@collabora.com>
	 <1894144.QZUTf85G27@diego>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-uaMjjumv7IKMmvZZiIOJ"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-uaMjjumv7IKMmvZZiIOJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 11 ao=C3=BBt 2025 =C3=A0 16:37 +0200, Heiko St=C3=BCbner a =C3=A9c=
rit=C2=A0:
> Am Montag, 11. August 2025, 16:03:45 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb
> Nicolas Dufresne:
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> >=20
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a cal=
l
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call =
to
> > pm_runtime_mark_last_busy().
> >=20
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> verif=C3=ADed the (new) definition of=C2=A0 pm_runtime_put_autosuspend()
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
> But the subject could use some work, I only got
> 	"[PATCH v2] media: rkvdec: Remove redundant"

Thanks for catching this, good thing I posted the V2 here, I broke it while
porting.
>=20
> so maybe make that
> "media: rkvdec: Remove redundant pm_runtime_mark_last_busy"

Will set it back to its original name:

	media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls

I'm missing a link to the original too.

Nicolas

>=20
>=20
> Heiko
>=20
> > ---
> > Changes since V1:
> > =C2=A0 - Re-applied since the driver have been moved out of staging
> > ---
> > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 1 -
> > =C2=A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > index
> > d707088ec0dc1f6a18b2d168ebdf20b443f2240e..445f7c92eee34f7d6f885bb519d9e=
b2431
> > 3da548 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ct=
x,
> > =C2=A0{
> > =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> > =C2=A0
> > -	pm_runtime_mark_last_busy(rkvdec->dev);
> > =C2=A0	pm_runtime_put_autosuspend(rkvdec->dev);
> > =C2=A0	rkvdec_job_finish_no_pm(ctx, result);
> > =C2=A0}
> >=20
> > ---
> > base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> > change-id: 20250811-rkvdec-redundant-pm-rebase-ed9b885eeadd
> >=20
> > Best regards,
> >=20
>=20
>=20
>=20

--=-uaMjjumv7IKMmvZZiIOJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJoCpwAKCRBxUwItrAao
HClfAJ0YxRFweEQwk5MRl6kYLms9oInvSQCfXdPl7BQb7JncFkBHCaoRIILSUEc=
=NYOu
-----END PGP SIGNATURE-----

--=-uaMjjumv7IKMmvZZiIOJ--

