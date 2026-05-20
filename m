Return-Path: <linux-media+bounces-62295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILh7LonEDWrD3AUAu9opvQ
	(envelope-from <linux-media+bounces-62295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:26:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93658F946
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6AFB3094BC0
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BD23E716D;
	Wed, 20 May 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="kEL7u84C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FF3E51FF
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286127; cv=none; b=Qgrgab4M5E9LFVvrvxXq4KCYDhBQzgLqzrZJwmY91Sgf3GgFCgL+LBxr4EbFUxyLfRJSm5i9V234OAfcQmph5ByF5GZ1L9EVHhAx9NLlq61GcnBFegiHysLvyj6cpYpzqSHa+1VgN9QlDkdO8Muce/uqxZn5ybK7qd+cpvJl2ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286127; c=relaxed/simple;
	bh=PbYWCXafoVbgcY5G3LrCjhRSBZcxFFtbBndKIx3U3I0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wb1cslbR8Rltuga9Scj2YfH80hsWQ48580xuNOwstRfCkG50j6lmCBrDLyycR3T5J1blJZRtjnhg3soScKuatptwX7BizTAbFgZi3lHefrXK6NC3HMkc6jIYIpJ0xRn/Y2ntQzk6rEhxFCJccTfS2S1ah8O9bs422HgDdkK3isI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=kEL7u84C; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7c04749d739so31991107b3.3
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779286125; x=1779890925; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PbYWCXafoVbgcY5G3LrCjhRSBZcxFFtbBndKIx3U3I0=;
        b=kEL7u84CyCnu/NwELxzJIBYih5/lLm+IOCibverYnNDPLx5L27eONZwRluGyrYM2X3
         w3TByZSEBb//r3KXDwjzT1+pZhX9mclLhb4RsfYmU3rwrbZnzqi39jdrVodahEWOrOtr
         BsyEusBLZQ5NoZs4SyM99szIjg9UbzJUFKqNNBBzs0JjjNO8slZRHWalWaahcP5TmDt2
         oWi4Eavtjhu0OwZrxOrSor+D/BO1EB8B6hAhqsMEgC9CeILkka7/A+3smp9NNDms/TCC
         Jq8MfSecYAj4TH9f9TeXilZkKXFNopiXXyInfthsb3W+zSJZcRLoekdrIWmezX/eOqDn
         dwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286125; x=1779890925;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbYWCXafoVbgcY5G3LrCjhRSBZcxFFtbBndKIx3U3I0=;
        b=XJzsSAOupndNbr7nvP9B55PJXlR9zlMlVaYM9/C1+bSTfpo3/6DwswTOguSYMF3cjS
         PhNv4+yhZpsVP5GU9I4J2koyOOuX/DR/imigH7LwkArAXy/Hi2uMkGosOlz2gdKy3YHl
         TE48rjeMfHvXHOVROTcGwu5J6WJoEm4lBey+kD9n01+rqTfc6O0ZqQxfSDylLwd96RdZ
         12P0nWxvmVVKZRrCo9RhF+jQndbKSm6BUJYbi814QRlHPC/TATjs7OBaE3/MG3+6cv+n
         nBQs0pCUgJsJ9Lh1DDD6ZQE9fy8+VokIAr/npQktqEKu9FDzVcWC22G5je+omOU/XMiJ
         RIdA==
X-Forwarded-Encrypted: i=1; AFNElJ9IJS1eMtHmwATkS5TpRLwmnbK5l3JxBITBLTtHT3vGx+7kNYjt/D+w38naDf96n9BnlqGUAqw1bGajIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaw3k2Ri4JnVq6dxjzzNoB4OIpizEsPvlRN7WnMsmPsA5gwf5Q
	XJOd18xRAuEpGi5A3koKA/9LI0t2/++OuMuRUzLzqBiDlRFSL4jQUcg/dGoND6IbLBU=
X-Gm-Gg: Acq92OGjUc3OOn3tlO3Ojw5xiOxmnqmScQ1AfeBZ5Km+Tu2MbV8BVGjWUDX5oPpKYat
	E5Kve69pxSi7BwCZ7ClHsFEnL7861FzCaGmxKuVCKhJxSoetgQlVPDTkNP0WuEIQTMtOm0SqXu6
	wZO5mW6yNygnfmTJ2Ezco/Vn8T+m92Qvy10RJIgglkLOgkRnFI++cI7nGbdVc/wNrRUTYfmPmVX
	VFbqo+idwzVvKBBtBjFdKcdS4fd7JXh0sJU97Ao+P6i6x/nFvG8PfrFgWr5VXRcaD2dCV6cvagC
	NA6yxZDKrtQ/epmipD03I0gzes6+UD3EL3s1avWHR88ie/25mMQkV/sLPfW9J3nyI+PfpPF7gqI
	yRkXQZ8Qe8KMR7d3tRKGUFw6ewGfvg5dvjlDZC1Rq1i9LaT34YfLnVb2cy0fytMWzUy95dr8h05
	2+L5R0sOwGraRrkkInhr1BQCjph+JQH6rH4uc4Ycy/7nYUI37LSmGlhz8pAnVj7lD6bFnf
X-Received: by 2002:a05:690c:f15:b0:7cf:bc0e:5641 with SMTP id 00721157ae682-7cfbc0e5aecmr71636237b3.6.1779286124466;
        Wed, 20 May 2026 07:08:44 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361905bdsm122740036d6.23.2026.05.20.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:08:43 -0700 (PDT)
Message-ID: <6e377f63de47fa110d8b69abe2683ea9c076727e.camel@ndufresne.ca>
Subject: Re: [ANNOUNCE] libva-v4l2-request: RK3588 VDPU381 VP9 decode (fork)
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>, 
	linux-media@vger.kernel.org
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Hans Verkuil	
 <hverkuil-cisco@xs4all.nl>, Jonas Karlman <jonas@kwiboo.se>, Detlev
 Casanova	 <detlev.casanova@collabora.com>, Heiko Stuebner <heiko@sntech.de>
Date: Wed, 20 May 2026 10:08:42 -0400
In-Reply-To: <20260520120746.51732-1-pavone.lawyer@gmail.com>
References: <20260520120746.51732-1-pavone.lawyer@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-xgtlEH/oqWRH7787VazX"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[bootlin.com,xs4all.nl,kwiboo.se,collabora.com,sntech.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62295-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid]
X-Rspamd-Queue-Id: 2D93658F946
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-xgtlEH/oqWRH7787VazX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

Le mercredi 20 mai 2026 =C3=A0 14:07 +0200, Francesco Saverio Pavone a =C3=
=A9crit=C2=A0:
> Hi all,
>=20
> Now that the PM runtime teardown cleanup [1] has made stateless VP9
> decode usable on RK3588 VDPU381, I would like to announce a small fork
> of bootlin's libva-v4l2-request that adds the userspace side. VP9
> Profile 0 output on this hardware is pixel-identical with libvpx,
> verified frame by frame against the software reference with
> `ffmpeg framemd5` on a 1080p59.94 reference clip (3000 consecutive
> frames, all matching).
>=20
> =C2=A0 Source : https://github.com/dongioia/libva-v4l2-request

For me this approach is deprecated and should not be used. There is several=
 gaps
in the VA API that forces deep parsing in the VA driver, which adds yet ano=
ther
layer of parsing and security vulnerability surface. I'm actively working w=
ith
Vulkan Video group to fill the remaining gaps, and will likely encourage lo=
oking
toward Vulkan Video instead for cross-platform codec abstraction layer. It =
was
also attempted to improve the VA API in the past, but this was a dead-end, =
the
API is closed by now.

Meanwhile, native implementation exists for GStreamer and Chromium (with VP=
9
probabilities that got re-added few weeks ago), and being worked on for ffm=
peg.

regards,
Nicolas

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 branch rk358=
8-vp9
> =C2=A0 Kernel : Linux 7.1-rc2 + [1] (queued for stable)
> =C2=A0 Tested : Radxa Rock 5B+, mpv --hwdec=3Dvaapi-copy on 1080p VP9.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU drops fr=
om ~113 % software to ~56 % with hardware
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 decode and N=
V12 readback (Cortex-A76 @ 2.4 GHz).
>=20
> The substantive change against bootlin's tree is a port of FFmpeg's
> range-coded VP9 compressed-header parser (vpx_rac + read_prob_delta +
> fill_compressed_hdr equivalent), with the `interp_filter` probability
> read gated on FILTER_SWITCHABLE per VP9 spec =C2=A7 6.3.10. That gate alo=
ne
> is the difference between "green chroma after the first alt-ref" and
> pixel-identical output on this hardware.
>=20
> A second change moves the V4L2 OUTPUT / CAPTURE format setup, REQBUFS
> and STREAMON out of RequestCreateContext into a helper that is also
> called eagerly from vaCreateSurfaces. It keeps probe-pattern clients
> (mpv --hwdec=3Dvaapi, VLC's glconv_vaapi) from failing fast on
> vaDeriveImage before any decode has happened.
>=20
> Known limits, for full disclosure:
>=20
> =C2=A0 - VLC and Chromium's native VAAPI path are not yet usable through
> =C2=A0=C2=A0=C2=A0 this driver. Both import the V4L2 CAPTURE dmabuf into =
a GL texture
> =C2=A0=C2=A0=C2=A0 via EGL_EXT_image_dma_buf_import_modifiers, and on Mal=
i Valhall
> =C2=A0=C2=A0=C2=A0 + Mesa panthor the imported texture does not refresh b=
etween
> =C2=A0=C2=A0=C2=A0 frames for the linear NV12 layout exported here. The d=
escriptor
> =C2=A0=C2=A0=C2=A0 is structurally valid; the broken surface is downstrea=
m. mpv
> =C2=A0=C2=A0=C2=A0 --hwdec=3Dvaapi-copy (CPU readback) is the supported p=
ath for now.
> =C2=A0 - H.264 and HEVC entrypoints are advertised but unverified on
> =C2=A0=C2=A0=C2=A0 RK3588 in this fork.
> =C2=A0 - VP9 Profile 2 (10-bit / HDR) is exposed but not tested with the
> =C2=A0=C2=A0=C2=A0 current kernel patch set.
>=20
> The bootlin tree carries the same architecture, so the same eager-init
> refactor would presumably help there once VLC's vaPutSurface and the
> Mesa panthor side are in place.
>=20
> I am happy to send the work as a series for review against bootlin's
> tree, or to keep it as a distribution PKGBUILD first while review
> catches up =E2=80=94 whichever is more useful. A PKGBUILD against this fo=
rk
> is up at beryllium-org/sbc-pkgbuilds#4 [2].
>=20
> [1]
> https://lore.kernel.org/all/?q=3D20260518145414.64514-1-pavone.lawyer@gma=
il.com
> [2] https://github.com/beryllium-org/sbc-pkgbuilds/pull/4
>=20
> Thanks,
> Francesco Saverio Pavone

--=-xgtlEH/oqWRH7787VazX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag3AagAKCRDZQZRRKWBy
9NkGAQCygDyECuYaJq0g2vyvMiaiQpBqxR5vKM8jJDGxWa/ExAD/WCQCjsgVJEtx
Tu885kZPCABWGHp36a6MYhTyUwF0CAc=
=LCiP
-----END PGP SIGNATURE-----

--=-xgtlEH/oqWRH7787VazX--

