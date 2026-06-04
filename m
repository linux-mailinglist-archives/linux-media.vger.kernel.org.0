Return-Path: <linux-media+bounces-63831-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pMdpFr66IWriMgEAu9opvQ
	(envelope-from <linux-media+bounces-63831-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 19:49:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4A64266D
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 19:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b="q0S/gUY3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63831-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63831-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0ED430107D5
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D13911A8;
	Thu,  4 Jun 2026 17:41:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823739EB59
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 17:41:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594893; cv=none; b=og1Ki9GirWsh/IBQk31RLBUaLFaM1NRBADtDl5bg95YR6CtUxIt7ekpmg6522KPT9Th9WmG8rsYl9wH5+z3dRSSZOumYk90j12G6XeyheEYBZt+sTIIf9CPbAH+F6DmBPPDhpyN5IgPa58lvbnRVeE+rdk64pFJnctaJodtvqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594893; c=relaxed/simple;
	bh=pC9e6ctIavrkjKDLSgeoYwhFuyrN7IU8ETdkWkY8paU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HSY0uxjbJusqyCkIG8hFPLa/s2+9ZlSXzTzJVed+9SDhRfmewcC23++jkl04zmRsU1N6vt/7ImOS9VwzsMCiUfSfHDPRSUGIoDWmHD/X5FXZJYxKfwjU1kWJbuE6gamSv3KPiG7gxFxyCprWO+bNM8hFSkmpbL8af7RLIUav+4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=q0S/gUY3; arc=none smtp.client-ip=209.85.222.194
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-915671abde5so92525485a.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780594888; x=1781199688; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=skAIbP0bYT4iohS+MzNYrgk3F/DjM49p6r2+AXeW9Dc=;
        b=q0S/gUY3TSNg+bnUDrjKceF0cHDst0wueydtlfYjTKUyOm6+s0eAdJQQot6gI0EMBU
         zRUnxoDfu0E91VXDf7rZ4UMrtDUplvpQuRqWuVKN1haF+9yhCGOAHAlrMTODz6OdJj7J
         sZ0DCKF7cUlzjHth6g2EdaF70C35fr1rn1JREJQSBlaIGcbVjFkGvORjMtGosJS4Tl6H
         loPmunBQyFi7mcT32dKQDEkN1T13CqzxdSffsPlO1e497LJPi9glaYAWauo4OdZBGNRt
         gs/Z8H5ayb7w3VDrmdWjE1NymrpurvTwgdFM/o/WYShRANKUO/4QLi94tk9uNk46Fc8H
         nbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594888; x=1781199688;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=skAIbP0bYT4iohS+MzNYrgk3F/DjM49p6r2+AXeW9Dc=;
        b=J9xKvjIuy2tKIcjyqMQSW64k2wzfq70qTCPdCF882FIIyUDon+qDiiKk3hvlqhk8lP
         Ac/esYFiOYoItAy+wNOhorWXL6DHyFm/y+yhF/xNXLIxTnR4CaMEnOi0bux50d0F7PN+
         Pag9PHR8YXcX6H416sBjSV5ZFdoLEuDKDe0pZgjb/z5l/6+wlKfcfPAFdbgPoVeEU2gO
         gJdbKs+8eCYUvis2Ml4XRDnQwWBf5ITM4ij0m94PlKkhU3YnItZpbGIULNNYVIXoEoua
         gnZXuuCn3wUm99DuMc690eejwEwGWjPKVQJPfqILT3yQpdhtv+mLZ9kUYapaP0GEipp3
         UHiw==
X-Forwarded-Encrypted: i=1; AFNElJ9Eqq6YNFMWnTxk0V0vv2uP9y+sfgImG2HvRBveVm5pxL6OtaEZdfNFEABj2orab45XtkCc8NmFqlr4zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXtvjVZfdn9NR/K0u+M8tMsLeNCajexT1O2Ly1tamED6RB9wO
	tN4Rm9MLAEpRrXUmJG9F0NuWAw7d/Vli+WIMf73v0OPuRHUpgMcHFfEDINgcDoZVzu5eg1uUa48
	IrERm2GFfKPil
X-Gm-Gg: Acq92OEYUBS32PveHChFPEUpiFrLe/GZnOUyFiEIp1ofLFZUWWzQru0pYarirGNusO1
	GGJMxIjXWqzDAF+r+vXFIxGVrn8hLW71Uf3H+7lVsuhDROx+v3a42tHdH0gm1gk3/wd1+ptdAxQ
	6MkMR3ykoKdN/uZUmza9pJ0qMPdyw+QtCsaWpeLuwlkrDCJs7mIclbJ5bHADRJpyEBjrE0fKET7
	iDmd3Hy5BbmysKu26wSaYU31xIk5XivKr3HFGimA88KxsHJVafhdxAPx18GbMtZEULsVl2dYx2o
	UHE1i+iM3cgpXe1M9eTuJ4VKA11uFwwoQqvma40ySxAkxz2wibTxFShNvuktbgiBHdHPCs36frB
	gkjcGK2s5CeeY91zaGVXLhkXRL4ukrhbLgrmPt3zJ2TrinhR/6Fmzje9wD85l361g3TGHeuUzuy
	9JBaw0MKZ/pRqQ9/dF/eBRcdToUDf2aZyW8iywrPE/Xox/36zt+/d1VEG4so/RymrxiRmFecbot
	9b5Vsw=
X-Received: by 2002:a05:620a:7083:b0:910:c0ba:bd11 with SMTP id af79cd13be357-915a9dc24c0mr17096985a.47.1780594888093;
        Thu, 04 Jun 2026 10:41:28 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c50bsm653900885a.24.2026.06.04.10.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 10:41:26 -0700 (PDT)
Message-ID: <b68ce0383e8118b4e6e4439dcbdcd8d813069c25.camel@ndufresne.ca>
Subject: Re: [PATCH v4l-utils 0/2] v4l2-tracer: fix expected frame length
 calculation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sarah Gershuni <sarah556726@gmail.com>, linux-media@vger.kernel.org
Cc: hverkuil+cisco@kernel.org
Date: Thu, 04 Jun 2026 13:41:25 -0400
In-Reply-To: <20260524204400.8287-1-sarah556726@gmail.com>
References: <20260524204400.8287-1-sarah556726@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-HV5owm4CSkodr2UeKtLo"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
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
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sarah556726@gmail.com,m:linux-media@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63831-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1B4A64266D


--=-HV5owm4CSkodr2UeKtLo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 24 mai 2026 =C3=A0 23:43 +0300, Sarah Gershuni a =C3=A9crit=C2=
=A0:
> This series fixes the expected frame length calculation in v4l2-tracer wi=
thin the get_expected_length_trace() function.
> The current implementation assumes that the stride is always equal to the=
 real width, which can lead to incorrect expected buffer sizes when bytespe=
rline includes padding.
> Update the calculation to use bytesperline as provided by the driver inst=
ead of width-based assumptions.

We try and follow kernel patch rules, please fix other messages for v2.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#subj=
ect-line
   "The body of the explanation, line wrapped at 75 columns, which will be
   copied to the permanent changelog to describe this patch."
  =20
Nicolas
  =20
>=20
> Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
>=20
>=20
> Sarah Gershuni (2):
> =C2=A0 add plane_bytesperline to trace_context
> =C2=A0 use bytesperline for better expected buffer length calculation
>=20
> =C2=A0utils/v4l2-tracer/trace-helper.cpp | 22 ++++++++++++++--------
> =C2=A0utils/v4l2-tracer/trace.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 15 insertions(+), 8 deletions(-)

--=-HV5owm4CSkodr2UeKtLo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaiG4xQAKCRDZQZRRKWBy
9LwRAPwLdMNIJGiWaXepEKmh9vmvcw5rZXmrgyHkWBk+2GHztgD8DnJqrUsZoUTQ
tFW3q5BiOQHjJlMMsJB4Nd6hQV3CeAA=
=ci9E
-----END PGP SIGNATURE-----

--=-HV5owm4CSkodr2UeKtLo--

