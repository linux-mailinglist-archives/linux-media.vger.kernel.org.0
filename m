Return-Path: <linux-media+bounces-64503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TqHNH2ylKWoubQMAu9opvQ
	(envelope-from <linux-media+bounces-64503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 19:57:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E44BB66C14D
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 19:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=JBvTxIE3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64503-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64503-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D59F30DE42C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98416351C0D;
	Wed, 10 Jun 2026 17:55:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15633D6CA
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 17:55:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114115; cv=none; b=bnqbiQKcvWRaDZkJRHGGa3HsfaaDyRj3HeNpJTEL5cwi3sslgK5HEmXEzm+Sdv43SXDFIyon0eSmRs59LLdNHKV+2C2t8enDmJilk6eImUBiddrDr0gkUpXsU39Zf8WvYoWw0reazwv4/trTxfoFyuxkFiHke2Yy6viDtDpEY0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114115; c=relaxed/simple;
	bh=3FBv/EOGjeC0r39H/l8rvAlfT1jWGq5iy39JWbN5UhA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwTGbAFAz81NKlRvPIWlc3XzS3dKYcX1nSrgktnmQh1nhj6bbBVewQmZTliVRz8h6BIwbOkxRencbJS1Tmx1TFgdvZ3jKywaCFhMXj201s2+UWayoXGmkKVS7fcTOfNwIQKT6SNK0w2jqMN8FINikoDLSA5JjQgyZLfrehDuWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=JBvTxIE3; arc=none smtp.client-ip=209.85.222.181
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-915aa0a9293so13936185a.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1781114113; x=1781718913; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TFzr6Ap8q6XOCl46PeL7Sqp+9/TMWSjPVAD+5M0vgVw=;
        b=JBvTxIE3XGk3vVPMH7Dt3U2BZAkpcceFDgS4rNeqtT+ZegZdCYH/4bn4zdfmI23A0W
         GcBhM1EhkLqTxC9B57meRh7KMJKq/PDQkPBq3TfdVxQrK8LyEzbPAHyVR0p0lxd5gfEd
         IMTPDqBtRLqgt/fZjUt+2fwcvAb4r/wrPg1EMsZxYJJ5YnkVjkYzutfQ4ngADrlJmiv2
         x8cGP3uKKK6vxfT54/3+F1PY/+nPtOcABwWKi7dZztFj9MKt0hUBcrsQWqwDKLut6BVt
         +vIVPGLUMGVs4nln/Z9RIQTzGiBWstJPa/YDgUUKLcHshWhEWZJWMou4gVduunKyrMg6
         /+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114113; x=1781718913;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFzr6Ap8q6XOCl46PeL7Sqp+9/TMWSjPVAD+5M0vgVw=;
        b=l2+aiQhHwLu2dZ8qAUN8oaTu+bETxsL6vZAb2Ssd5a2EaUMbKBFd3BwMhBc0YfG/Hg
         HtRuKy9/NLUrI3AT3ajmmebpVJLwGNQ4QlSVPXAgfcSE7RfGPhF8s/Z2DWpJBpMurixV
         HdM5qoe1bwAZrrSlSaFvmuMT0idxZhTgltWhjLyYNowLxH7u4sNrPp3//O5zXBrfb0oV
         vQ1wvzgl2mtOgpLMNmi6mzPlo3BmO0/d7PvBAqJQSqqzFfTOP7pKDnkeBaLkEKYKa678
         LTrkA+no26s9heXvg3fbFNk5uuR/qdO4fZW/JUIOKZiQpkWA3TyrjFGtXyKuPk3j4JjY
         HiIw==
X-Forwarded-Encrypted: i=1; AFNElJ8Vbz2vN+tnLOhbyEre7tGqy+ZJ4ITNfjN+Q/6FLHHlah6IwhHFCWwydAmAW0fixJ4LmaK3oZBdslYzlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEw1TGRqZACBUqjcrBXQFE6xZzwyodsmRzz33oV2dEORDu0P5t
	lItFhJF0C+Cw953TJSbqdy4liu5vtRT9lGoKEyK0BuM4tXIDULlFnM1WRP94IIBb/v0=
X-Gm-Gg: Acq92OGwby5h3zUwiFHXq7fDXKaaHSGcUymdwEYEwFlFG6lrdrEYLL6JIBOk2YJ1yS/
	2zk9XP8h0A2IwtF2237a9PTuBSHHoeeWWLdsUA+a6Pafs/jHTi0scqrk0uRKWo1S01ckzJ7gYI6
	VR9rLl90b6kvKUCHRLI6R5Lz2/zWtSfJ08ah3/Hh3VGvtU0uFMCTogSBZIcfdWVSafUbR06rXUv
	UBUYDQybJr73J8PRytyJA1ZZEEavMgz+ixO6pW42XK2ImnZSd8Gnd7xUAOFZNQ/7bDL6XGTsIoF
	6RHWwXKSpgnyzgelFdeUuQMZBWcexDvDRq0VAFAXdH5l+Wp6EMXwStchomzEUQq0mxikJBXeSx7
	g+YdzCdH9HkDBSYHNVzS25urKLtsnzgCmYvXouhh66H9zfM/dANglZhdwE4ZQo9mPDtcNmVrPbs
	H7ALg6kBSBlNrYps99WkpJ9yDz18FUkUL1a/IN/Zkmdd0OdP57O8DcjPwhAxWugixpYvO9zCpmt
	/gNm+0=
X-Received: by 2002:a05:620a:4625:b0:913:dcd2:f117 with SMTP id af79cd13be357-915ad2f40aamr3123760185a.24.1781114112689;
        Wed, 10 Jun 2026 10:55:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a21f871sm2515222585a.12.2026.06.10.10.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:55:11 -0700 (PDT)
Message-ID: <0e3b9cdb9d8bd692290dfabafb32d7faa5bd50f8.camel@ndufresne.ca>
Subject: Re: [PATCH v6 1/2] accel/rocket: Fix error path handling in
 rocket_job_run()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ZhaoJinming <zhaojinming@uniontech.com>, Tomeu Vizoso
	 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	stable@vger.kernel.org
Date: Wed, 10 Jun 2026 13:55:09 -0400
In-Reply-To: <20260610071045.3414828-1-zhaojinming@uniontech.com>
References: <20260610061915.1CA281F00893@smtp.kernel.org>
	 <20260610071045.3414828-1-zhaojinming@uniontech.com>
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
	protocol="application/pgp-signature"; boundary="=-Xq/WDBnnQBcMXRcBkujo"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-64503-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhaojinming@uniontech.com,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,ndufresne.ca:from_mime,uniontech.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E44BB66C14D


--=-Xq/WDBnnQBcMXRcBkujo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 juin 2026 =C3=A0 15:10 +0800, ZhaoJinming a =C3=A9crit=C2=A0=
:
> In rocket_job_run(), after taking an extra fence reference for
> job->done_fence via dma_fence_get(), the error paths have three bugs:
>=20
> - The dma_fence reference held by job->done_fence is never released,
> =C2=A0 causing a reference leak.
> - pm_runtime_get_sync() increments the usage counter even on failure,
> =C2=A0 but the error path does not decrement it, leaking the runtime PM
> =C2=A0 reference and preventing the NPU from suspending.
> - A valid but unsignaled fence is returned to the DRM scheduler,
> =C2=A0 which triggers WARN("Fence ... released with pending signals!")
> =C2=A0 when the scheduler drops its reference.
>=20
> Fix by replacing pm_runtime_get_sync() with pm_runtime_resume_and_get()
> which auto-balances the usage counter on failure, releasing both fence
> references on error, and returning ERR_PTR(ret) instead of the
> unsignaled fence.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
> ---

This is a lot of versions within the same day. You should slow down a littl=
e so
a human can provide a review, and also document the differences in this sec=
tion,
after the ---, or using a cover letter.

Nicolas

> =C2=A0drivers/accel/rocket/rocket_job.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/accel/rocket/rocket_job.c
> b/drivers/accel/rocket/rocket_job.c
> index ac51bff39833..e8a073e22ac2 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -310,13 +310,22 @@ static struct dma_fence *rocket_job_run(struct
> drm_sched_job *sched_job)
> =C2=A0		dma_fence_put(job->done_fence);
> =C2=A0	job->done_fence =3D dma_fence_get(fence);
> =C2=A0
> -	ret =3D pm_runtime_get_sync(core->dev);
> -	if (ret < 0)
> -		return fence;
> +	ret =3D pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0) {
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;
> +		dma_fence_put(fence);
> +		return ERR_PTR(ret);
> +	}
> =C2=A0
> =C2=A0	ret =3D iommu_attach_group(job->domain->domain, core->iommu_group)=
;
> -	if (ret < 0)
> -		return fence;
> +	if (ret < 0) {
> +		pm_runtime_put(core->dev);
> +		dma_fence_put(job->done_fence);
> +		job->done_fence =3D NULL;
> +		dma_fence_put(fence);
> +		return ERR_PTR(ret);
> +	}
> =C2=A0
> =C2=A0	scoped_guard(mutex, &core->job_lock) {
> =C2=A0		core->in_flight_job =3D job;

--=-Xq/WDBnnQBcMXRcBkujo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaimk/QAKCRDZQZRRKWBy
9GXRAQCaqFjOga0b8AcWUWyj7n1hBiojgtP5sEJWopdr9ZDLTQD6A7XpFDMgyJa4
NJEu5ngUhgE6hDlNbS+w6OnOyC7oRQI=
=G0Lr
-----END PGP SIGNATURE-----

--=-Xq/WDBnnQBcMXRcBkujo--

