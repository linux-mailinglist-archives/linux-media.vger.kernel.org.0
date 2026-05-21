Return-Path: <linux-media+bounces-62396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHQKEnlcDmo4+AUAu9opvQ
	(envelope-from <linux-media+bounces-62396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 03:14:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E27659D941
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 03:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17A3330F8172
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 01:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4E62C11F3;
	Thu, 21 May 2026 01:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HtzBzzzn"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411C62D0C82;
	Thu, 21 May 2026 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325808; cv=none; b=pmVxJahPlaNBmrD9Zs4Wiz1knRw0HXW5nsOgcjkaL2sZw5JNCKa9ZZU8EKg6iUrpe/B2Coa2mo4ZxhJFT5OcjA9nuHXO0KtJBI6Zy70o7gGzTRbn2QQhqPAi2YGWduTi9/MijoczFqCDE/4lhgNGVIL/NEuLDvW4X9qyxV5sIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325808; c=relaxed/simple;
	bh=vwvK/qSv/aZAl1CPofiDoXpIyBZsN7vdh8/5gMr7JTk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6Y9lqLHgbOt1qS/U1bKW8TMz5I6MTAAW5RgIyDv2ch0ne01JXdqP5ZNgNXCF56KnLQVOoQBPY5mhp+vFEHExGviya+b9uUSs1nDq87TjICHVyrMhFkWIjIWRpEO2WywhEbxMuRIYss85GrV1LY8vT/Gi7VnOQqco0CwhNAWlaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HtzBzzzn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779325803;
	bh=vwvK/qSv/aZAl1CPofiDoXpIyBZsN7vdh8/5gMr7JTk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HtzBzzznFfrhb4+KNwEuwqKGzcI//vla6E0jju3dgGSDGkcC1GPQUlofR0fVJrzWk
	 D4/Dtz+yEub6GACCxzxCZZUMH4eeM2e1hZ6+Mx0pjTkrPgRHqmSt28MSD9cqusRNwO
	 GeWMoQjBcjJFH9ScMM0YWyCpqyP7PjGqdJDBxfVVqgXtoBmDAFrY/grsGBRvvBlCcP
	 f0hhSgiJEERSJNvy5ZaRq0CvtN8DeiCsF4JxeEBFIYiuP57D3uKVm3w7ET/3zOP2LV
	 YhybF8NvOxlHpHfAeyubEQdOBlqq6qSgfgRc2uMQijjQrnT2ehEft1rQF6o2ni+Lsi
	 FtRhJB+jNDzLg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E876217E05B5;
	Thu, 21 May 2026 03:10:01 +0200 (CEST)
Message-ID: <9c9857f2dff60d536de6d201cdc9f68afec5be38.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: fix PM runtime teardown ordering in
 remove
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>, jonas@kwiboo.se, 
	detlev.casanova@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de, stable@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 20 May 2026 21:10:00 -0400
In-Reply-To: <f9e63fbbd99c11f303ac8e8f5aec6b2bd528cf99.camel@collabora.com>
References: <20260518105413.42147-1-pavone.lawyer@gmail.com>
		 <20260518145414.64514-1-pavone.lawyer@gmail.com>
	 <f9e63fbbd99c11f303ac8e8f5aec6b2bd528cf99.camel@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-a/Niwa1gTf9973ZgRNez"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62396-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kwiboo.se,collabora.com,kernel.org];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,collabora.com:mid,collabora.com:dkim,sashiko.dev:url,pages.freedesktop.org:url,kwiboo.se:email]
X-Rspamd-Queue-Id: 9E27659D941
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-a/Niwa1gTf9973ZgRNez
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 20 mai 2026 =C3=A0 20:51 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Le lundi 18 mai 2026 =C3=A0 16:54 +0200, Francesco Saverio Pavone a =C3=
=A9crit=C2=A0:
> > From: Jonas Karlman <jonas@kwiboo.se>
> >=20
> > The current remove() path calls rkvdec_v4l2_cleanup() and
> > pm_runtime_disable() before pm_runtime_dont_use_autosuspend(), and
> > frees the empty IOMMU domain after that. With autosuspend still
> > armed when the domain goes away, the VDPU381 can be left in a dirty
> > state across module reload and suspend/resume cycles.
> >=20
> > On RK3588 this surfaces as a VP9 inter-prediction bug: from the
> > second ALTREF frame onward, motion blocks decode with U=3DV=3D0 (BT.709
> > green), while intra and static blocks stay correct. Reordering the
> > teardown to dont_use_autosuspend() -> iommu_domain_free() ->
> > pm_runtime_disable() -> v4l2_cleanup() makes the symptom go away.
> >=20
> > Tested on a Radxa Rock 5B+ (RK3588, 8 GB LPDDR5) with both the
> > libva-v4l2-request mpv pipeline and Chromium's V4L2 stateless
> > decoder. With the fix, 300 random pixel samples on VP9 Profile 0
> > clips at 1080p and 1440p match a libvpx software reference exactly
> > (worst delta 0). Without it, the same 1080p sample at frame 4,
> > pixel (960, 270) reads HW=3D(0,112,0) vs SW=3D(204,147,116). HEVC and
> > H.264 stateless decoding via mpv keep running on hardware with no
> > fallback.
> >=20
> > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors"=
)
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> > Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
>=20
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> cheers,
> Nicolas
>=20
> > ---
> > Changes in v2:
> > =C2=A0- Add Cc: <stable@vger.kernel.org>; media-CI flagged that the
> > =C2=A0=C2=A0 Fixes: target (ff8c5622f9f7) is present in the 6.17, 6.18,=
 6.19
> > =C2=A0=C2=A0 and 7.0 stable branches, so the fix should reach them too.
> > =C2=A0=C2=A0 Link to v1:
> > https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.=
com/
> > =C2=A0=C2=A0 Media-CI report:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/1001=
24849/artifacts/report.htm
> >=20
> > =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
> > =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > index 6f5f0422d317..bb95b090a25b 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -2066,12 +2066,13 @@ static void rkvdec_remove(struct platform_devic=
e
> > *pdev)
> > =C2=A0
> > =C2=A0	cancel_delayed_work_sync(&rkvdec->watchdog_work);
> > =C2=A0
> > -	rkvdec_v4l2_cleanup(rkvdec);
> > -	pm_runtime_disable(&pdev->dev);
> > =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> > =C2=A0
> > =C2=A0	if (rkvdec->empty_domain)
> > =C2=A0		iommu_domain_free(rkvdec->empty_domain);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +	rkvdec_v4l2_cleanup(rkvdec);

After consulting the sashiko.dev report, this made me reconsider the fix. A
problem that pre-existed it seems, but made a little worse. Basically, user=
space
can still open and call into the API until rkvdec_v4l2_cleanup() is called.

Didn't research too much, but may you can extract:

	media_device_unregister(&rkvdec->mdev);
	video_unregister_device(&rkvdec->vdev);

And move this at the top of the remove function. This will prevent further
access by userspace, avoiding races. While at it, remove useless
rkvdec_v4l2_cleanup() helper and merge it in, its only used once.

For the rest of your report, I'm under the impression remove won't be calle=
d
unless all the open devices has been closed, which will call
v4l2_m2m_ctx_release(), which synchronously abort any pending job.

https://sashiko.dev/#/patchset/20260518145414.64514-1-pavone.lawyer%40gmail=
.com

> > =C2=A0}
> > =C2=A0
> > =C2=A0#ifdef CONFIG_PM

--=-a/Niwa1gTf9973ZgRNez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5baAAKCRDZQZRRKWBy
9PuoAP9gtGPvLxa4W9L5+xumxe/MkgDxKRvK3bcntdSpVRuoywEA9Q2fu/BulsAq
W94NZMxGfEsscd/Nfk469D3oxF6mrQU=
=U/NF
-----END PGP SIGNATURE-----

--=-a/Niwa1gTf9973ZgRNez--

