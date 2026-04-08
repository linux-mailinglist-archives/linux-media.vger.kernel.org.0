Return-Path: <linux-media+bounces-58285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHYMOVa31mlxHggAu9opvQ
	(envelope-from <linux-media+bounces-58285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 838E73C3A9B
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA669301F4AF
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CA0379EF6;
	Wed,  8 Apr 2026 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Iac1NcN8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C611F2D3750
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 20:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775679315; cv=none; b=Z7NFBdutXH6dYv64S86xjw0oZLlbjX3RMbCv0j83svkfWMNs2X27OQLI5Z4OP6AB4OPKLczj7No9ELfGDUiBCfgIAmIRR68mJYwqbVObsQSsWEh8xaz9m0yKyNtYrcZgzq9ijFkTuZWN7tWbc+8a3s+p5+X0hOtfGhuLWiWvpAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775679315; c=relaxed/simple;
	bh=6DpfMg7k6XNsT47Eyr++J8fsvAvQwyle+lT6X3jR/kY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p77/NW/YfEgvxg1ZKd1shB5/v4DtgA1c6M82AW1KbH55RtSZ7hxV6x8Thw17KgY6wBQlykD+m4d8wVfJd30O4koJyHzNiHmifSpLr2oa6k3KI0dxsBzbmFi9WQ6gfmS0WiWLwVb6Nc4GWuvM5DvjONVD0PAz6P5xlNDgbw7JqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Iac1NcN8; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cbc593a67aso16107485a.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775679313; x=1776284113; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6DpfMg7k6XNsT47Eyr++J8fsvAvQwyle+lT6X3jR/kY=;
        b=Iac1NcN8o9dWQmebt4DN5j+vOTIkdtAVgxRwDkhYYcLDk/92Pds/k9FP3kkkiPnZ3u
         ikfh9iZNwL3U6kOmaCbpnn+1lIzsx4/LdnRVhTTaBOaA0nQobWpNbqvMzWI+D36PPib8
         iXeydfmfR5NVXBUxVj9MXRqL9jPsgncfMIp2upW0eoLxZCJTXvrOes2g2Dg8OZs2pgMD
         MPhQKEaHQV4ru44nkU4/XF1kxtt9ZUa7/q5knOQSlDTaUSDgHGQL1sRKz3YC2/Z/8/yo
         KxAXYcwFJxAKfHLprDX+ECgx/9C61cXvr8O8rf3KKOtcwKDhQfLXOSYwmXnd2PFuHfEg
         6SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775679313; x=1776284113;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DpfMg7k6XNsT47Eyr++J8fsvAvQwyle+lT6X3jR/kY=;
        b=aiI8pz87agIn4LGRY+uhlOXdM7siicdoDlGPNjumAHFKTwLxPF7fjkcbPyxWO112ua
         ZuwgNjV0j+wBT5LG55bQbBwzcFVdSD2cHy02AgmiyRMGVxlGNa8Unb/2h4VbzOy332Cy
         oWsq4H6OR4NHpRIATGGx2ge74t8XvgTjc4WxkBaBs0ZmgnU2WDSLG5ZnJ568lLXtBUBm
         u3rOLTMKsCz1hU+XqNrMXlTlZRYO6/FdijQknC0gl60Umr3xtD0AWV5oIh4n5kbHMxwy
         AN1sAXzLZ0ieN3IrUVRL9VRPHElhdo1eJ+b/rYIRvGuTxgBefOqn3+tKjDdRlCXR2TVX
         KJAQ==
X-Gm-Message-State: AOJu0YzxHGvSZaECcXzylEf5l5a+RA68DRfwp1E5NmxRsIofTdmD9whu
	/9iYL4qMRdWHa/fGiRyuJvFeoooOmFj71JBG8x7wb/d6OAaUVhATmAYlVs+zBKXQNlI=
X-Gm-Gg: AeBDiesAUGSetAT0E02JPoqVmCjWvWPKvm3iGKRAW72HMJYKjuH0JeDSjEs+JvKcUQX
	uJipPKUnOYQtKaOVCyShbdPWmH/qQsA95FjpLs6Uk2Miy09GLL171r5QdUwVSHlXJVizlob545k
	BtvQ1hbEDWsW9UBjooQESKASWeLxggCOb4kuf1KiYYcLrQPFqGcAJiHmql3mfMEV+RTlvzFE0A9
	qzU9T6iOaidT5MjRF+0isnBkmf6jRdtEg3w6/kRBHd/A9QZVLnVFYNDJqUtOnQyAfHXhhR8+Fdk
	YYdSHUmLcYUN46tHbCH90u+02qrt9E4qVWaBstjKsEMbC/DgeCuxCcuQQ6tUkjIJDkGJcjb/WlA
	pzRK++hStCggxvGj25NMVz77ppxHlnzsPp6JX9HujadPiEYjVSV2ltKEYGGnuEMrlyRVLFHT1Jx
	k3CYdf+8jln7OLtR8rC1KsOuHh1stu
X-Received: by 2002:a05:620a:2909:b0:8d7:f950:ea4d with SMTP id af79cd13be357-8d7f950ec95mr1848012185a.4.1775679312575;
        Wed, 08 Apr 2026 13:15:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d3edb58da6sm1411844885a.8.2026.04.08.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:15:11 -0700 (PDT)
Message-ID: <8961bec83974ff9499d53baffb06d50e48761677.camel@ndufresne.ca>
Subject: Re: [PATCH v2] Documentation: media: Fix v4l2_vp9_segmentation
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fritz Koenig <frkoenig@chromium.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 16:15:11 -0400
In-Reply-To: <20260324-try-2-v2-1-eedbd0d3cec5@chromium.org>
References: <20260324-try-2-v2-1-eedbd0d3cec5@chromium.org>
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
	protocol="application/pgp-signature"; boundary="=-uFAbDLFk2rLLFlIDtDOv"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58285-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 838E73C3A9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-uFAbDLFk2rLLFlIDtDOv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 14:00 -0700, Fritz Koenig a =C3=A9crit=C2=A0:
> feature_data is defined as __s16 in the header.
>=20
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes in v2:
> - Correct author/signoff (@google.com -> @chromium.org)
> - Link to v1: https://lore.kernel.org/r/20260324-v4l2-doc-fix-v1-1-1b4773=
c391df@google.com
> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst=
 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 3b1e05c6eb13..d7a3b8ef03a7 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -1877,7 +1877,7 @@ params syntax' of the :ref:`vp9` specification for =
more details.
> =C2=A0=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> =C2=A0=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1=
 2
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0 * - __s16
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``feature_data[8][4]``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Data attached to each feature. Dat=
a entry is only valid if the feature
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is enabled. The array sh=
all be indexed with segment number as the first dimension
>=20
> ---
> base-commit: e3c33bc767b5512dbfec643a02abf58ce608f3b2
> change-id: 20260324-try-2-0f63be5786ef
>=20
> Best regards,

--=-uFAbDLFk2rLLFlIDtDOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada3TwAKCRDZQZRRKWBy
9B7RAP9LxsqG0D46EpKoysuZo9ypLWsVtuC5eFbCFxihJStbrgD9H+HsHsnHoptD
NqV4WfHFoBgOttldsNd2msKW3qyG4Q0=
=3JpO
-----END PGP SIGNATURE-----

--=-uFAbDLFk2rLLFlIDtDOv--

