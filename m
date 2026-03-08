Return-Path: <linux-media+bounces-54903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABMJOdbsrWnG9gEAu9opvQ
	(envelope-from <linux-media+bounces-54903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 22:40:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643323256A
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 22:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D211301F324
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F4435A3B0;
	Sun,  8 Mar 2026 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xfzALRvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B12A2475D0
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773006018; cv=none; b=mJ0XeVM344MiQ1UTXXRqzGtWHqE1cmGRt0NwWP4svLcWbWsA3FoYVk+lI6H8eUt835aSIUTiGNMK8Gbj1Lji+osJQVG1ki4E3CkpZiU8jnjCqWCrOXQeUIwe34rhlnfsPFI3NK2NIQkrj7GotfKbVNPY71LC9ScIYS1wt4gJPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773006018; c=relaxed/simple;
	bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tcwoXOegi4QklN21ipsmrk2sP0mzT5wCKSuj2O0G5CeWEkixJoOFUDOFBQAZ9Dnjgfq5i+wZovvO2oceRD+1r2Yt2fObhNdiMF6lJNUkDzTd93JAnlqSF0FoAik/KeRZYrqDDkPuyGCv9nszpSfL5pEGAjSKkk9GCevsUK5UL8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xfzALRvQ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cd73c4a827so211791285a.3
        for <linux-media@vger.kernel.org>; Sun, 08 Mar 2026 14:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773006015; x=1773610815; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=;
        b=xfzALRvQRN3r7qC16rE/zFYp2KdsotG8ArlayGolHOKcoLZ+Cph0Fr9QH8BQZM71mu
         nDq1TRJfDnV0r7HHzboMYcieS4PTwpJ6fWIs5Hr3tITTgThzrbiVIu7pwPPS8gjfc0rB
         5CJNQR9qRisqm01W+0/vNmEF3Ixmm1WS+xcxHyjXdomk0jXhKeMO4yIOEntepHIrfvba
         54uL/y8A3ydVfWVp+X2dfKYTrq7gbgI+BBlZwvo4k7ItmtyEjmzFxt+rfzU0RNg29nlo
         LKuJjDkkgdViHeH2rySQqwKwSRc3fCVRPpPd80tqkLxsuuaAI2vG1XGsorQDpFh+exs3
         v3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773006015; x=1773610815;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/5v+Crp++VTBrLnHYqmqlg39N1g9UgV39jx8JRu1pY=;
        b=YG8PlJLt2xMDrJDSVb4Ro3PQ1zzQNyKmx+MgJAOiOQm9INHKsGzpQp9sBvCFpkKHkL
         w3klZKzfX1bKa+odKlTVP5WrIjW3YHAerNwbt03bkqYzt+U1pNLujRmQiXFjaM/D8DI0
         8bf0f/e1x84I70NVJM0ImE/KDmKAFBQp7+9tSNtMi++Sk7E+sOeBenHVBbzd8AABzkPD
         aUZQiIklBR6zjQfRdYzWJ/n5qjc3xsvFy2n9DObPGcjfhCbVLJGoovv9oywE9tjGc/TD
         chDMjatl1Ybl3ZjU5IVCo9BGQbOJwymzLKW9RwSQUb/z5FhS49ERTdLYTTbQYo5fKhZk
         prSA==
X-Forwarded-Encrypted: i=1; AJvYcCXpsslmqWVcgV1nXUiOSpDqUWW9lo0lBtGreGQ7cN3APMuaTGuajmGYFLh8Me6IWDOKrkW7zMFYZgoYOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwavQ+RvjSFymy/pT+nhRuwAtvuS5BAzdXAQccdtTU54AH/YLv/
	o20Myyhf498Xb2/P/CrMbFc+QNWSU+j55xfkfDw5H3PlZfAPZsQuX9LapFu76hJAheg=
X-Gm-Gg: ATEYQzwj0exP3bbfq7hUN+FCcDgBdWCe/EUSHtGi7XQXzamX7ECEPYlFQeJTKEjrdqS
	BQGFOQeQO95nhtXX+pNDp20uO3WSnqBtSzez6yELyufmnuFstHGc5QunxlFyIuXLRX2pJuSG88K
	43aCMX2yArScyTe+rJftd8FM/GEAZk0FRhF8zWquj8YbnMNDbVfqyaPG5NcU3RLEuyfceb1Egjh
	jbRnTyXRkrCMkvL7k2Fu8V8KVqBmvhVio1IGqd5cy7zKI7jwcmNL420XJ2NBGinZOXZ6j3YavBw
	3ul6H+7U+TWqXjSwmPJxevAwCkNMaLYswhyXFVWTIFznJrQBa6+olmf3xPvwpYQCz1gsvTjch4f
	eTHQXheluuU4L+/kN83CUtnMmqGnUMuXNshuTVXmLtZe8mfkt1U0tHKXikQBsLITaCGhaFUIywJ
	bWi/MtnHPzOe6Chu7WFmkBS+pqfLSD
X-Received: by 2002:a05:620a:1a9a:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8cd6d40d37fmr1134703485a.8.1773006014866;
        Sun, 08 Mar 2026 14:40:14 -0700 (PDT)
Received: from [10.120.58.110] ([192.252.136.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8cad692csm21257585a.19.2026.03.08.14.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 14:40:13 -0700 (PDT)
Message-ID: <ee0fd1ecc6c940811cae743f087e96d348909c9a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 0/3] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christian Hewitt <christianshewitt@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Olivier =?ISO-8859-1?Q?Cr=EAte?=	
 <olivier.crete@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner	
 <heiko@sntech.de>, Diederik de Haas <diederik@cknow-tech.com>, Dmitry
 Osipenko	 <dmitry.osipenko@collabora.com>, Thomas Gleixner
 <tglx@linutronix.de>,  Dragan Simic <dsimic@manjaro.org>, Chukun Pan
 <amadeus@jmu.edu.cn>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 08 Mar 2026 17:40:11 -0400
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-8MH3FGNDEj7hU0SQaMwz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5643323256A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54903-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,cknow-tech.com,linutronix.de,manjaro.org,jmu.edu.cn,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ffmpeg.org:url,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action


--=-8MH3FGNDEj7hU0SQaMwz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Le vendredi 26 d=C3=A9cembre 2025 =C3=A0 11:31 +0000, Christian Hewitt a =
=C3=A9crit=C2=A0:
> This series depends upon Detlev Casanova's current v7 series for VDPU381 =
and
> VDPU383 support [0]. It adds support for the VDPU346 IP block used for H2=
64,
> HEVC and (in active work) VP9 on the RK356X boards. VDPU346 appears to be=
 a
> close relation to VDPU381 used with RK3588, except with a single core, ou=
tput
> limited to 4K, and minor feature differences, e.g. HEVC level 5.1 on VDPU=
346
> vs 6.1 on VDPU381. To handle differences we declare a new compatible.
>=20
> The device-tree changes are derived from prior-art in Detlev's patches fo=
r
> RK3576 and RK3588, the vendor kernel [1], and some earlier patch attempts
> from Piotr Oniszczuk and Diederik de Haas.
>=20
> The register differences between VDPU346 and VDPU381 appear to be minimal=
 so
> we currently and intentionally reuse the VDPU381 h264, hevc, and regs fil=
es
> to avoid duplicating code. There is some evidence of buffer size changes =
in
> testing which still need to be explored. If further register analysis nee=
ds
> separate files for VDPU346 the refactoring will be beyond my current n00b
> coding skills and I will either need some coaching or would be happy to p=
ass
> the series over to a more experienced developer.
>=20
> NB: Testing with the v1 series showed lower mbps bitrate performance. Thi=
s
> appears to be resolved though it's unclear to me whether this results fro=
m
> kernel changes or the ongoing reworking of ffmpeg v4l2_request support [2=
].
> However with my current Linux 6.19-rc2 test branch [3] I'm now able to pl=
ay
> Jellyfish H264 and HEVC test media over 100mbps.

A fluster score and explained error report is missing your this cover lette=
r.=20
This will probably highlight some of the instability issues reported in thi=
s
series. I'll mark the series are "Change Request", as you have few review
comments and now this test.

Overall, I'd like to see probably investigations of the problem before goin=
g
ahead.

regards,
Nicolas

>=20
> Changes since v1:
> - Drop DO-NOT-MERGE patch as changes included in Detvlev v7 series
> - Adapt to variant/capability changes in Detlev's v7 series
> - Add bindings ack from Rob
> - Add rkvdec ack from Nicolas
> - Rebase against Linux 6.19-rc2
>=20
> [0] https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D10=
34794
> [1]
> https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi#L1539
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/commits/branch/v4l2request-v3
> [3] https://github.com/chewitt/linux/commits/rockchip-6.19.y
>=20
> Christian Hewitt (3):
> =C2=A0 media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
> =C2=A0 media: rkvdec: Add support for the VDPU346 variant
> =C2=A0 arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>=20
> =C2=A0.../bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |=C2=A0 49 +++++++++
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 | 103 +++++=
+++++++++++++
> =C2=A03 files changed, 154 insertions(+)

--=-8MH3FGNDEj7hU0SQaMwz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaa3suwAKCRDZQZRRKWBy
9P8tAQD6X8K1OVv800JKuX4SsoOPaPlRfvbbnmOa6xHYfpuvYgEAuMC1QOrMqK1D
hcJLVPMGRf61xg3w0Zlr9mqYZ8vjFAg=
=8LZ4
-----END PGP SIGNATURE-----

--=-8MH3FGNDEj7hU0SQaMwz--

