Return-Path: <linux-media+bounces-62966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIxfL7JdGGrVjQgAu9opvQ
	(envelope-from <linux-media+bounces-62966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:22:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E50ED5F4522
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1CA7930C3B3B
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F8D3F44C5;
	Thu, 28 May 2026 15:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0ZC1e84"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1F22E7398;
	Thu, 28 May 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980827; cv=none; b=ZlGfdDpIcSrhi9m98GqmoUGgX9sEkQ2+DtUvUQWyLSoVwYpIEC4I5rGVE1udUfWtlmXkcZekUgyPsj8XJDVPZRzh8bYMK5LXwpZBZeVn7FmzXXO/42ga0UQV1rorW/l2ftGNm70goZrJROp1ckJo/+hn/JeWRqSFbWCwHlhUNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980827; c=relaxed/simple;
	bh=AwSvtwInSR2c7gXAHmUxrSdW9Ds/fFAcqQthTHS+sgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtjVLInIvtzLYzBL5vJnvNX73cCfCySQih2/gS4asaEtw+Ku9puM5YexY4enq6zc2gRQAjIm8Yraz0KOsu1s0sucDgkI3I1fDR6tgZVTSFedvqmr48JUtoNPbNJHZM1IG9tNBYf+AGp61Ul6oXz08TKGt48mhECNsQkl2y+3W7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0ZC1e84; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABD91F00A3D;
	Thu, 28 May 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779980826;
	bh=h500BwDEUT+p3Ty+F27njgVX/ebHmMvwaBgrjJow7tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q0ZC1e84yQQqiIr7YM9N/gNMxDmiGZfgXgeOY1/M/JJ7a3KBUohJbDPgjbRPqQUjf
	 3aCIXa/2Qt0ot5ExXV1YcB12RVugO0WJ6GQJ+XICmC3F2W5OquFPnByALZHvrdkLcd
	 /jvstIEpGCibe2d4e72ejEAEDENL5lq1c5meyciPpdyhXo9qzSPVOf4tZc6Uw/u989
	 dQZ4P6pcdPCaYCeh0tCN6QwiigI0WCyUhQLoEW4i+SWSLx5odt2e6lrh6dfTz2osqW
	 vuO+sJU7uqb0IiYBsp0NqdGmrnSXlh8blFILigUbczkPOmaHEOVpwrDkOKrN999Pho
	 ZVht9o0IDT75g==
Date: Thu, 28 May 2026 17:07:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/tegra: Fix iommu_map_sgtable() return value check
Message-ID: <ahhaC4bILxrnE1l3@orome>
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
 <20260421-iommu_map_sgtable-return-v1-2-fb484c07d2a1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="luqt5i2skuahmce6"
Content-Disposition: inline
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-2-fb484c07d2a1@nvidia.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62966-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,nvidia.com,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: E50ED5F4522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--luqt5i2skuahmce6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/tegra: Fix iommu_map_sgtable() return value check
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 01:02:37PM +0900, Mikko Perttunen wrote:
> Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
> changed iommu_map_sgtable() to return an ssize_t and negative values
> in error cases, rather than a size_t and a zero.
>=20
> Update tegra_bo_iommu_map() to correctly check for errors from
> iommu_map_sgtable.
>=20
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_at=
omic]()")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--luqt5i2skuahmce6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYWhcACgkQ3SOs138+
s6ElFRAAkeWsm6H131lpF3ZXxxy+dw9NzX5hV718YdAxoduSvNCiSo6TtMd/VThL
Zv87c8tYmxdXjrz3HwXLrfWRQsO56d3nFbZH2brMMV4SDixycgKAAaPMH13UH5xF
WplQjm2az0ToTLlCnqca/u8u2uDCm7U5qpuydMFwv4R6T1fXkXP1bddperSuZQCu
Q9VyNz3B3IMcb4Se41KO180poWwNk2wdRIjbmznYZjjtfWJF3fDwcz8eNtgd5Uzv
J+87GApeZu2p0gusVCJAauD57SdA1xABSNZXKAqXpe30XYIkPN1f4fuJvqcocyxd
WlCn9s2xMEcegm+gZQOQFSLiOjKF4Efn5NwS/ZF6wp5Q5mPzRCg/zPSQo5FC6TPP
R9Yinz26rb/H3DnAEpHiUs7Mo6ovjxAJH1BVlEYWPlIZxk9T1keJt8jHeey9X/NF
noHtBcQCGfPfPsdaI6VFu+fOEgB+ziW+XDZjqVZ5CDXtFJ1U/j/eGGva3g2m2aP6
MBbT2y5frc2EeIcCN2tu0Pjsl32kIkdxS9agJ8CosenTrWlhRtAZK6yiOAUxuDQk
O3miB1VVzujulsZI+cpiAMzpVRtHxuNI+dcugypcES+yqR2uUbmhyG1mZ+oFXe16
DMqdt2tLo6w3wW5MkjWXZhBQ8CvPzFYOq/htE1dAmjwS/N56gBM=
=ZyOE
-----END PGP SIGNATURE-----

--luqt5i2skuahmce6--

