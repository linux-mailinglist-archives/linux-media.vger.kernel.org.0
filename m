Return-Path: <linux-media+bounces-62965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCMYHAteGGrVjQgAu9opvQ
	(envelope-from <linux-media+bounces-62965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:23:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E53465F4561
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 17:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57FC830E4584
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27253EFFBD;
	Thu, 28 May 2026 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9ocXmfN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C85735898;
	Thu, 28 May 2026 15:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980810; cv=none; b=h3z4drI2CFQr/HrjdzqV7yKvFFKpbLp67kVZfaBwwB2YtRHUsaonwCs3wH1DF2yUakw1fpDEzqGe1S/jPakshERjVseODaDaTt/ZBSLi9jnqM4r7C0BH6IvTY1YHCVA8qIkQeHZ9+wtuN0miSPHyOw0xNHmxD2SAcjgPdnsv6xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980810; c=relaxed/simple;
	bh=BJvRrKptkp4JGf0Yy59hD3vxSgepeXzCbF/RDAPH0y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsREkv+/SZLwYg/cZN1ZAXRbY4OK6oPgGz4QAUkaT4/9AQmmNEJREHo8ffDfjOGVuSVIBECYzRCngIYSKYoUsT7WejppcLS4uTdVPyqOyluyvm548Yg1DTd2dRiU+LBL0NvSuPsAYdtbz8mwmPtGTWkMx4ZAGVnT92BlfZMQBjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9ocXmfN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2811F000E9;
	Thu, 28 May 2026 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779980809;
	bh=c8uxKDeozKtw7HhpWHZre9JGy+bOINHNRMoLgA/eKYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9ocXmfNTfoni/BH+FLS5BRReOswvnj9TI77F5FJoQ9tbi8N6PiXxVov73pQuR+zV
	 Z2VNVEt3c+xDsDlT5YgyBpD0HZpGUS+w9eK+h4/K5/xrApsYRcEjL1MZXrz9fBk5Yq
	 FZZK3nGAGQE6BCDUnpc352dkT6gMwXbO7opycSWfLW7cfXjVTDp4vagYpztci50YlB
	 kOsl1OaNqcKYRG70JisL8un20vRx4Mh4hYic52t0ER+8Rhq9dtjZ9CffvH5V2dfMh0
	 aBJwGtUxKrTErAvxEwkbU6KC36VF2okVU6EInLUERYanGkUSMGb7jbTKrH0HJqx6dc
	 fANY3xEsIJrcQ==
Date: Thu, 28 May 2026 17:06:46 +0200
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
Subject: Re: [PATCH 1/4] gpu: host1x: Fix iommu_map_sgtable() return value
 check
Message-ID: <ahhZ_Enh2TAWFxDg@orome>
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
 <20260421-iommu_map_sgtable-return-v1-1-fb484c07d2a1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hqgt5icxz7r7yoip"
Content-Disposition: inline
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-1-fb484c07d2a1@nvidia.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62965-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E53465F4561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--hqgt5icxz7r7yoip
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] gpu: host1x: Fix iommu_map_sgtable() return value
 check
MIME-Version: 1.0

On Tue, Apr 21, 2026 at 01:02:36PM +0900, Mikko Perttunen wrote:
> Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
> changed iommu_map_sgtable() to return an ssize_t and negative values
> in error cases, rather than a size_t and a zero.
>=20
> pin_job() also was incorrectly assigning to 'int', which could cause
> overflows into negative values.
>=20
> Update pin_job() to correctly check for errors from iommu_map_sgtable.
>=20
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_at=
omic]()")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--hqgt5icxz7r7yoip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYWgYACgkQ3SOs138+
s6GqTBAAwdxQxm9pX/VxKeekH9QcutZH2UVnE3Piqkgk4WWWPGo+OJe0eP8rYRz1
k24+EwaUd+TCg8hwLmi/ReXPiDEB5aIT1nbnCMi6a88ND9a+hnTydA27jSO4Gtip
Yahkuixea/PETVHJ1QgBx6ZZBVY227qbdDrrSFCDHkqXgquFYcEq/y1GcCPNI6v3
Q5pKK9anrZDdGSLmML3X1+djUHS1G16/H3AG3xoabDRrQkA/C1wwN7sa1eFRTdGy
CvAl1aTketmwRuw5nPn46fVBlTbsP/oVyr+KclRI8ctkMXFMq74f0fs4DyOlqdAy
AKkXXpppda3yiy1r10NAC03D7EdDKcIkO0Y98KxANFj5FQoa1FI4Tp3H5ikAh58I
hQuXi2WCoLe10G4jrJrGLstvUhgJVrP0WbCa1xGdDAe8AZfH/NUEadDFSkQ+Gl8X
7fGdUYkUrDnjTPUrvJWiOZj9fk3TQbsrGKIFeu0TJp2+rO22jocolSvSvLX1lL4t
XfYPcbsCu7xQQPNqDLTid+hoX/w7cRhPUSrQAhEM6OPtn1s+6pDRT0qkXb7hu6bn
7SyijlTJZ0l3a5XziROyiiIZ4T672pAeQmzI5i3+xBRTATutOuciF+UAcQfu4afo
CBmYMaAZDyDSCIPAvXaQ5OEE7nPap7sQdz9jNvw+w9ltQlSKfLw=
=uYsw
-----END PGP SIGNATURE-----

--hqgt5icxz7r7yoip--

