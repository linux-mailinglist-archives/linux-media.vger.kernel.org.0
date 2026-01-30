Return-Path: <linux-media+bounces-51863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PXPREI/EfGm+OgIAu9opvQ
	(envelope-from <linux-media+bounces-51863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:47:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A2BBB6F
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8620A300D915
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4758320A14;
	Fri, 30 Jan 2026 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="NrZUX5i7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9D27467E
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784460; cv=none; b=o6qj2Tntee/Hls1taXmSDrwQe5V7Xc5AlBd0Ut/Vd7U5M0D1J7shG8gjG+OLUY3ld6ijJ3mqWyykC7tQsjnYKWMDbP6H0c6++gq7ldOTyDoP6npcFDFGbwathTkiNiwLYe+6QvR7tt+Z2fYVZFJPZ1J1aB+BpxH9OwFxn3yEcAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784460; c=relaxed/simple;
	bh=l0NK+L1zbI+S1elZ/cP/d0bNA/FxXgDqcRb+gufNh+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irBSlPGPvVeEM8ClBSveo0GU+enexrsUwJuP0BaDdAZAsAwamkPbff0c4nJ+fWDRSVY+Wovd2tucAjm7BX0VT0HGyr0j4HCFK0p++e4TXy4ptiztZe033ZRWykimYuxs+UMJG8TW82VzCWqC5xhgZuzRpGckx1sEeZ2Ab9cSWd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=NrZUX5i7; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-502acd495feso23217321cf.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769784457; x=1770389257; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=NrZUX5i7imhVIy92tZcx8S6LtPcpdUm9vR+yPdySba+zQEwxFRUr1WjadUVbCoLqfj
         KIQiY0y/Nf5FDInR0YFFYeXdpS8yq0hiUTy2yO0EA1RK3tNw7quKqKg2mC1aSuo8p4QQ
         5g4GMImgiygJGiBWPjEjrNdnn1zOQuavQ5X93MBPm343I9I4jLoLYhbzTnntUQA9WUJK
         BUgBu65cGj3MUXyc7l9jPWERD6DTE7u4ZoA2ofp0bqgDhrUtsm2VaaZmMzhvpDsKlxit
         v7gzPPp4VOvNTB3Ppb9gUUz5CBxC33CigGuefiCtgy6uG2lesb5vnr6dDPUZ7TZLrqki
         n9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769784457; x=1770389257;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2hfas+OWqJcbZ6w1+Kimr6HVSADO3LaGmzUbd8jJBA=;
        b=ES5yxBsCKNqsUyoojKpESD5LqUwWDFcGUE6r+Y/s5+Pv+9arBI/lzw/ZKv0f2EOxww
         5wTxWv0AMsI1coyg4vxp14YcgBBAPQfJNvEEd5+iJbjj+fjkZoXR0LNvPA53q/l9Pw3p
         rywQJfP+zbMt0E3zBBeWYK3gatUo39ldGzdxuO0NWo5sqvEimmTI44eZGigXe0NYAp5W
         WZuwYL/Dpdxu1/1mUqnuuCT8xSb6zaPO76Gae5e7CfNX8rDRGcHMrQBHffg3Yei0Os1a
         YjJb5eQZFjV4I1HyUnmXzLgLLONWHNcW6ByuF1ZsNtoTW5z8Isb7oe6XvROVkGh0wF6U
         8bOA==
X-Forwarded-Encrypted: i=1; AJvYcCXLrBProRXedcEQxnEX2jduUC++mJTsGKpysGsbUI8lsqWX96HhAYNON5hpoRFNkfLhapMU5zJABNV++g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwteCZdvMIKseZ7Tw5OMx0QAIUwXFZA51jIc1Y8V28W3uceD9EN
	XV3kHoDihWEjYvN1Buf8R9pC4WEiLjai+Hq0Jnw9PMOU3kJMIWU9BgQWKORK0wvECKc=
X-Gm-Gg: AZuq6aL8E9PLdaoNXqXgGjeymcP0ce4yNJoBm5vzmgqOQoOtawbUKOIsAmyY0DhfykP
	u5J1KbxrxNkv/fPmTssSXWG4A1ZqXpC6xn01tsHWD6SaPu+Cbwn8r9UaiOEMZB+AI6Hkn+vTogk
	dGxTc7gvHzKqQjK9p9LaTjzzG5nzfPyDxdL/dX25lQ5a/+twvACYpqTSLmbHqoaZceznKXXUBQR
	zgqu9Jh013+g2lQ69tt54xwTII3QFRCv4pFY2eG4axMeeXgEzGrjagp4lPOdSgCg+HhZxkMwd63
	sZE71WXA2QV6Pf+3uftaSE1xbhz5HfRX9DHvJarzjQ4gMfxhOOVu/lv67I27M+WKppurzR/RLHT
	/v7AiSnNpuswgp9IeH69f6AJl4pVOzGLkEesAG4xYBJ/Nl62TLz5lp9jJrKN/H0Q/9Z95EX2ivH
	ACKgKm9QIrUGbNGQJpQ9VpVPU6SfQ=
X-Received: by 2002:ac8:5a11:0:b0:4f1:ab79:fb18 with SMTP id d75a77b69052e-505d21c6bbemr33783391cf.25.1769784457458;
        Fri, 30 Jan 2026 06:47:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50337cbde30sm58435431cf.33.2026.01.30.06.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 06:47:36 -0800 (PST)
Message-ID: <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 30 Jan 2026 09:47:34 -0500
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-i/sogahe4R0AwUuBxOvE"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51863-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.6:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 953A2BBB6F
X-Rspamd-Action: no action


--=-i/sogahe4R0AwUuBxOvE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 janvier 2026 =C3=A0 16:41 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
>=20
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.

Tested on EVK, with the downstream DCSS driver, and this change triggers DC=
SS
underrun (which is related to the DRAM QoS erratas on this SoC). It also
sometimes trigger the "not all macroblock decoded" warning I added recently=
, and
we can empty IRQs, but these are handled now.

>=20
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
>=20
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
>=20
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed

That probably only true with the upstream DCSS + a small resolution embedde=
d
panel ? Can you clarify this setup, because the display drivers mainline ar=
e
very minimal. Would be nice to show you average DDR read/write bandwidth
utilization during this run for comparision.

Another information that bugs me, in the BSP code, the G2 voltage is increa=
sed
too, which you didn't do here. They also use the thermal 2 zone to kick it =
down
to 300 until it cools down.

Nicolas

>=20
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
>=20
> Test pipeline:
> =C2=A0 gst-launch-1.0 filesrc location=3D<4K60_HEVC.mkv> ! \
> =C2=A0=C2=A0=C2=A0 video/x-matroska ! aiurdemux ! h265parse ! \
> =C2=A0=C2=A0=C2=A0 v4l2slh265dec ! video/x-raw,format=3DNV12 ! \
> =C2=A0=C2=A0=C2=A0 queue ! waylandsink
>=20
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
> =C2=A0								=09
> <&clk IMX8MQ_SYS1_PLL_800M>,
> =C2=A0								=09
> <&clk IMX8MQ_VPU_PLL>;
> =C2=A0						assigned-clock-rates =3D
> <600000000>,
> -								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <300000000>,
> +								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <600000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> <800000000>,
> =C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0>;
> =C2=A0					};
>=20
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000

--=-i/sogahe4R0AwUuBxOvE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXzEhgAKCRDZQZRRKWBy
9PeIAQD5M45/PuqurizwtvrI3NE0hSFwAP/bvFLOeVBaM9GzsQD+PGBAYJjzNYYA
DPbDkSTiWXrcCwv7P2Bo3/hz5rdgBgU=
=/XEy
-----END PGP SIGNATURE-----

--=-i/sogahe4R0AwUuBxOvE--

