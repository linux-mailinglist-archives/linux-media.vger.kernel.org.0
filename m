Return-Path: <linux-media+bounces-41681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D38B420EA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD5897BEAEC
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF997302740;
	Wed,  3 Sep 2025 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="y16Bkrs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511EA301027
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904885; cv=none; b=pWcyqt4CXyejERvfv5ys1/5c7JxHyGXQi2Smpm5MBSu0stTkoJnGJPTjsQDsXgRTXG1FxO7OjcbUzaA9qYFMcGO250gq0dBTnvgNVubvpUdFI8UPBhDL+y9yZ7DlofYDkOubB7IfvBvweK10HRxkW4Sqk/bD3sR3CtXtX1Ouiok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904885; c=relaxed/simple;
	bh=Dx5Ici+OBjBTJLXmsFf15+Lxp4LfdyFzJMjM7AlRQEU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z44McWQeEuVPZff08gte7jafkWAN+PtT1rnM1O2sF3qztizEJfxJF3gp+I63eEk4BDEaRoHr3+mzIHdSqkIu+dLjbpb6gOqBE4bSYFnrvs3HYdt6658idqejLsc2b30LmDtHUYJajO75ekRmy/QLyUq+TPhOSX2JsohdOTWhy38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=y16Bkrs5; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8080a88a32aso128037785a.0
        for <linux-media@vger.kernel.org>; Wed, 03 Sep 2025 06:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756904880; x=1757509680; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx5Ici+OBjBTJLXmsFf15+Lxp4LfdyFzJMjM7AlRQEU=;
        b=y16Bkrs5LKwemEMm4SHO91xf9FGoYMR6TDpSFEkym7tvudUZvv6FiMQq7zGUoE6GpY
         pNh+9ytYcYUauiyRVb+43OagFtgfDgaVO6pHKuWtHz1m+0jmCeyDLvzAeT5dI4pDLK8Y
         gBu5vR4QBqkCd/7NLFvlVlHgG14L/5pjdZ55txjKAy80cXl0LkGedwifmRv9QYgL8H74
         yJ4qxyTF1bcFsGcbDzobBzwE/w+LxqYRL3HVmzIqZWnxNlKgpIY0EoVWwBjjowse3Zjq
         cDagn3qvdKWle8XGb/dF/dI1w0Zo8HlpLzuIX68AgL/w6gAZH0veFTrcujsjHtDXsafZ
         rUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756904880; x=1757509680;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx5Ici+OBjBTJLXmsFf15+Lxp4LfdyFzJMjM7AlRQEU=;
        b=ImYCeUSHdtgtPPvBrtjvpqS80JnC36wXpp7USwbYrmIxvt+Vx1sMcZsc3RWpBPccsC
         Cph2vxOONrMyNxbBH2mjIA3zDLDPxaMpmqBN476o6ZHxy3Dj3e0k+epPpT1hYDcsijWK
         mG+COApb8u2bkAsu682MPJVtDONCPUGmuRn5kkdUu46wHNcYaMs437zgy2TVjxC0RUMU
         sbSwggmJXVPgBQm0lkEx6bpbJILcX00kXxtHnFvYwXHrilGAjzrbH+WZze/CzLSR22CB
         7jE9bau1KayBYQ0yF0dl44YNYQ2XKB4KKacYLp1B3yalZW6DJRZQK6FEg06F33ryB4b0
         SYHA==
X-Gm-Message-State: AOJu0Yyl6dyCwozaXKWQSjpMN/I8eYA6ujkHyZOVxFp8QKI0y+MCBqUf
	RzsIbTZjXkXTqLvDiKdDQwNKn4FtdT0PDa4jLQSLbJ92W1Qe/9F4xx7l1A5z/Firclc=
X-Gm-Gg: ASbGncsmTX5/OT+lWoha2ttdaRto6RnnHGLkpdkGterbaoPH0F4fHRYg2h3zAcjkD7E
	mutBQfNuZ3pM1WZYOb0/Cz//TDIu97jCO0Tl+X0YdleXTocNwj25+38fCQsZj+LyhRtD0MCipoz
	TVPaZGxrfJFWo+JB8VwUN5rxngOwRqyIWNvgZvETQrfuiSp2zX4yZg/9r5gTp4+tcw9q1xKAchG
	L0+L7thRmc90epRTbOaTpU4lydPgp4Fz2d/DcqgoBKrNLn1DZfvoexBgg1j750aixlWBKW2NctO
	xx9J5Cb4RBTO0BcN13naVVfEuqZUmS0vbT4rNZ3p+ZLQCLFgX9SpMLqCgzEqDBd1IRtthtZLyB8
	hxe49mn1LNIvVLP0yxOgWh5Ga/Ic=
X-Google-Smtp-Source: AGHT+IEZd6Wy7rXUueyIKYs7uS6PsB6R/0wQ2Eh6AdYJAFNUvucrxlH0mYG6F+aOMiBdXaPaoUV8tQ==
X-Received: by 2002:a05:620a:400a:b0:7ef:38e6:5a3c with SMTP id af79cd13be357-7ff26eaabc5mr1790436985a.6.1756904879928;
        Wed, 03 Sep 2025 06:07:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f76083fsm10865361cf.25.2025.09.03.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:07:59 -0700 (PDT)
Message-ID: <be621717ee62c2ffda40d531dda15e0c9f28a858.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 0/5] Enable support for AV1 stateful decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia
 <quic_vgarodia@quicinc.com>, Dikshita Agarwal	 <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Wed, 03 Sep 2025 09:07:57 -0400
In-Reply-To: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
References: <20250902-rfc_split-v1-0-47307a70c061@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-lgRlMTk62Tz5+XvOiPcv"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-lgRlMTk62Tz5+XvOiPcv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 septembre 2025 =C3=A0 16:00 -0700, DEEPA GUTHYAPPA MADIVALARA a=
 =C3=A9crit=C2=A0:
> Hi all,
>=20
> This patch series adds initial support for the AV1 stateful
> decoder codecs in iris decoder. Also it adds support for AV1
> stateful decoder in V4l2. The objective of this work is to
> extend the Iris decoder's capabilities to handle AV1 format
> codec streams, including necessary format handling and buffer
> management. I'm sharing this series as an RFC because conformance
> testing and gstreamer testing are still in progress. While initial
> functional tests show positive results, I would appreciate early
> feedback on the design, implementation, and fixes before moving to
> a formal submission. I plan to submit a formal patch series after
> completing all the compliance checks. Meanwhile, any feedback or
> suggestion to improve this work are very welcome and will be of
> great help.
>=20
> Gstreamer testing:
> Gstreamer MR for enabling AV1 stateful decoder:
> https://gitlab.freedesktop.org/dmadival/gstreamer/-/merge_requests/1
>=20
> Thanks to Nicolas Dufresne for proving the MR=20
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9469
>=20
> However, Gst testing with parsebin is not resolving to av1parser as
> below:
> Ex:=C2=A0 With the following command parsebin is unable to resolve to
> av1parser.
> GST_DEBUG=3D*:2,parsebin:6 gst-launch-1.0 --no-fault=20
> filesrc
> location=3D/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-AN=
NEX-B/
> argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/stre=
ams/test10220.obu
> ! parsebin ! v4l2av1dec ! video/x-raw ! videoconvert dither=3Dnone !
> video/x-raw,format=3DI420
> ! filesink location=3Dgst_decoder_output.yuv

Be aware that Argon integration with fluster/GStreamer still needs some wor=
k,
see issue tracker:

https://github.com/fluendo/fluster/issues/222

It is fine to proceed with testing the other (IVF or MKV based) test suites=
.
Feel free to report all wrongly identified files onto that issue, this will=
 be
addressed in GStreamer (and eventually in FFMPEG too if need be).

>=20
> 0:00:00.051674896=C2=A0=C2=A0 400 0xffff8c000b90 DEBUG
> parsebin gstparsebin.c:2439:type_found:<parsebin0> typefind found caps
> video/x-h263, variant=3D(string)itu
>=20
> The same test with the av1parse command parses correctly:
> GST_DEBUG=3D*:2,av1parse:6 gst-launch-1.0 --no-fault
> filesrc
> location=3D/media/sd/fluster/fluster/resources/AV1-ARGON-PROFILE0-CORE-AN=
NEX-B/
> argon_coveragetool_av1_base_and_extended_profiles_v2.1/profile0_core/stre=
ams/test10220.obu
> ! av1parse ! v4l2av1dec ! video/x-raw ! videoconvert dither=3Dnone !
> video/x-raw,format=3DI420
> ! filesink location=3D/tmp/gst_decoder_output.yuv
>=20
> Got EOS from element "pipeline0".
> Execution ended after 0:00:01.599088176
> Setting pipeline to NULL ...
> 0:00:03.580831249=C2=A0 1075=C2=A0=C2=A0=C2=A0=C2=A0 0x3354f960 DEBUG
> av1parse gstav1parse.c:435:gst_av1_parse_stop:<av1parse0> stop
>=20
> Fluster testing:
> As fluster.py is using parsebin for gstreamer, seeing the same issue as
> described above for the following testsuites.
> AV1-ARGON-PROFILE0-CORE-ANNEX-B
> AV1-ARGON-PROFILE0-NON-ANNEX-B
> AV1-ARGON-PROFILE0-NON-ANNEX-B
>=20
> Test suite: AV1-TEST-VECTORS=20
> The result of fluster test on SM8550:
> 134/242 testcases passed while testing AV1-TEST-VECTORS with
> GStreamer-AV1-V4L2-Gst1.0
> unsupported content, bit depth: a000a (66 tests)
> Iris hardware decoder supports only 8bit NV12
> av1-1-b10-00-quantizer-*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=20

That is interesting, I believe there was no profile without 10bit, which wo=
uld
mean this is non-compliant hardware. Not a blocker, just a remark, and me b=
eing
surprised 10bit isn't supported on modern codec in 2025.

>=20
> Unsupported resolution (36 tests).
> Iris hardware decoder supports min resolution of 96x96
> av1-1-b8-01-size-*
>=20
> Unsupported colorformat (1 test)
> av1-1-b8-24-monochrome

Fair enough.

>=20
> Crc mismatch: debug in progress (5tests)
> av1-1-b8-03-sizeup=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=20
> av1-1-b8-03-sizedown=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20

These should be basic dynamic resolution changes cases, let me know what yo=
u
find.

> av1-1-b8-16-intra_only-intrabc-extreme-dv

No idea about this one.

> av1-1-b8-22-svc-L2T1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> av1-1-b8-22-svc-L2T2=C2=A0=20

These two are spatial SVC. That means that some decode only frames are goin=
g to
be smaller in dimensions. Only the last frame of a TU is displayed. Both do=
 have
the optional sequence header announcing the maximum resolution though. On
stateless side, these usually works by simply decoding the hidden frames in=
to
the much larger buffers. Dealing with firmware can be harder, since firmwar=
e may
silently drop the decode only frames, which leads to wrong timestamp matchi=
ng,
which could have side effect in frameworks.

On stateful decoding, SVC have never been done, some documentation will lik=
ely
be needed. Strictly unsupported is the case the sequence header is not ther=
e,
which results in resolution change on non-keyframe. We now have the ability=
 to
allocate frames of different dimension at run-time, and free old unused fra=
mes,
but in stateful, decoders streamoff the capture queue, which currently resu=
lts
in lost of references.

Let us know your progress, inter-frame resolution change is not a strict
requirement, it is quite rare in real life.

looking forward, there is nothing particularly alarming in this report. Tha=
nks
for the transparency.

Nicolas

>=20
> Testsuite: CHROMIUM-8bit-AV1-TEST-VECTORS
> 12/13 testcases passed while testing CHROMIUM-8bit-AV1-TEST-VECTORS with
> GStreamer-AV1-V4L2-Gst1.0
> Crc mismatch: debug in progress
> av1-1-b8-03-sizeup.ivf=C2=A0=20
>=20
> Unsupported test suites:
> Iris Hardware Decoder supports only
> PROFILE0/V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN
> and 8 bit, 420 only
> AV1-ARGON-PROFILE1-CORE-ANNEX-B
> AV1-ARGON-PROFILE1-NON-ANNEX-B
> AV1-ARGON-PROFILE1-STRESS-ANNEX-B
> AV1-ARGON-PROFILE2-CORE-ANNEX-B
> AV1-ARGON-PROFILE2-NON-ANNEX-B
> AV1-ARGON-PROFILE2-STRESS-ANNEX-B
> CHROMIUM-10bit-AV1-TEST-VECTORS
>=20
> Compliance test for iris_driver device /dev/video0:
>=20
> Driver Info:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Driver name=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 : iris_driver
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Card type=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 : Iris Decoder
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bus info=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : platform:aa00000.video-codec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Driver version=C2=A0=C2=A0 : 6=
.16.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities=C2=A0=C2=A0=C2=A0=
=C2=A0 : 0x84204000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Video Memory-to-Memory Multiplanar
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Streaming
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Extended Pix Format
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Device Capabilities
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device Caps=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 : 0x04204000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Video Memory-to-Memory Multiplanar
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Streaming
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Extended Pix Format
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Detected Stateful Decoder
>=20
> Required ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test invalid ioctls: OK
>=20
> Allow for multiple opens:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test second /dev/video0 open: =
OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCAP: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PRIORITY: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test for unlimited opens: OK
>=20
> Debug ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_DBG_G/S_REGISTER: =
OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_LOG_STATUS: OK (No=
t Supported)
>=20
> Input ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_TUNER/ENUM_FRE=
Q_BANDS: OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK =
(Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_S_HW_FREQ_SEEK: OK=
 (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDIO: OK (Not=
 Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMINPUT: OK =
(Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDIO: OK (Not=
 Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Inputs: 0 Audio Inputs: 0 Tune=
rs: 0
>=20
> Output ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_MODULATOR: OK =
(Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_FREQUENCY: OK =
(Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUMAUDOUT: OK (No=
t Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/ENUMOUTPUT: OK=
 (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_AUDOUT: OK (No=
t Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Outputs: 0 Audio Outputs: 0 Mo=
dulators: 0
>=20
> Input/Output configuration ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_STD=
: OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM/G/S/QUERY_DV_=
TIMINGS: OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_DV_TIMINGS_CAP: OK=
 (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_EDID: OK (Not =
Supported)
>=20
> Control ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERY_EXT_CTRL/QUE=
RYMENU: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_QUERYCTRL: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_CTRL: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS:=
 OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_(UN)SUBSCRIBE_EVEN=
T/DQEVENT: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_JPEGCOMP: OK (=
Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Standard Controls: 12 Private =
Controls: 0
>=20
> Format ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_ENUM_FMT/FRAMESIZE=
S/FRAMEINTERVALS: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S_PARM: OK (Not =
Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FBUF: OK (Not Su=
pported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G_FMT: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_TRY_FMT: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_S_FMT: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G_SLICED_VBI_CAP: =
OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Cropping: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Composing: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Scaling: OK (Not Supporte=
d)
>=20
> Codec ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)ENCODER_CMD:=
 OK (Not Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G_ENC_INDEX: OK (N=
ot Supported)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_(TRY_)DECODER_CMD:=
 OK
>=20
> Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUF=
S/QUERYBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test CREATE_BUFS maximum buffe=
rs: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_REMOVE_BUFS: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Support=
ed)
> [65391.311675] qcom-iris aa00000.video-codec: invalid plane
> [65395.340586] qcom-iris aa00000.video-codec: invalid plane
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test blocking wait: OK
>=20
> Total for iris_driver device /dev/video0: 48, Succeeded: 48, Failed: 0,
> Warnings: 0
>=20
> V4l2-ctl Test verified for 2 streams as well.
>=20
> Thanks,
> Deepa
>=20
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.=
com>
> ---
> DEEPA GUTHYAPPA MADIVALARA (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: uapi: videodev2: Add support for AV=
1 stateful decoder
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: v4l2: Add description for V4L2_PIX_=
FMT_AV1 in v4l_fill_fmtdesc()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add support for AV1 format in=
 iris decoder
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Add internal buffer calculati=
on for AV1 decoder
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: iris: Define AV1-specific platform =
capabilities and properties
>=20
> =C2=A0drivers/media/platform/qcom/iris/iris_buffer.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +
> =C2=A0drivers/media/platform/qcom/iris/iris_hfi_common.h |=C2=A0=C2=A0 3 =
+
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 109 ++++++++-
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_defines.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 10 +
> =C2=A0.../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 22 ++
> =C2=A0drivers/media/platform/qcom/iris/iris_instance.h=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 15 ++
> =C2=A0.../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0 | 156 +++++=
+++++++-
> =C2=A0.../platform/qcom/iris/iris_platform_sm8250.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 17 ++
> =C2=A0drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 25 +-
> =C2=A0drivers/media/platform/qcom/iris/iris_vidc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 255 ++++++++++=
++++++++++-
> =C2=A0drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 105 +++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A016 files changed, 703 insertions(+), 28 deletions(-)
> ---
> base-commit: 88a6b4187eacb700a678296afb0c610eb3781e2f
> change-id: 20250821-rfc_split-c3ff834bb2c9
> prerequisite-change-id: 20250704-iris-video-encoder-b193350b487a:v3
> prerequisite-patch-id: 8a566690da276da34430c10dbc2fe64c1d623a9c
> prerequisite-patch-id: 1430a33603b425d0b142aab98befcda771fb885e
> prerequisite-patch-id: 32024cd49d2445ff396e31f40739b32597be59a4
> prerequisite-patch-id: 65b569952650647174e8221dc7adde9b000a7ae3
> prerequisite-patch-id: da128980fab8538bf668f19016c5121fb03759c2
> prerequisite-patch-id: 079823dffbe8b89990797bf7f7640b754382d8ce
> prerequisite-patch-id: 6ce10e03d7b3b96b2391e26cda703b650bde7cd0
> prerequisite-patch-id: b5950670ac5068a0c5b26651ebd433f7d3bbe6ca
> prerequisite-patch-id: 4de7a934f6bdfe28c84e461f70495925aa98365e
> prerequisite-patch-id: 07682a6d2530b5796122bf8763f94b5bc92949ec
> prerequisite-patch-id: 72b7eba20f1a222908d41323f28be3ba84106759
> prerequisite-patch-id: fd9e2e1b157112c39c69486799493ee99e6033a7
> prerequisite-patch-id: ae0ad8a04a04dd3434a092d4c2bb3f493417c6e1
> prerequisite-patch-id: 52631eec348735d1dc5f5804b573e3cf942550a0
> prerequisite-patch-id: 4109c59edb1b757162db46297914c8f7c14408dc
> prerequisite-patch-id: fc0b713eb4822047e8172d11fd4cd5a097ef23a5
> prerequisite-patch-id: 20ac8e7307f1f852b2a43268b2474178fbc0b94c
> prerequisite-patch-id: e8419d716573beb64ad89968f0074d6bddfa86d3
> prerequisite-patch-id: bdc72f5876ceb2e981d594c86a45cb21a6264af3
> prerequisite-patch-id: fc5d26d01cab94d229a00eab819ae80196f3f5d5
> prerequisite-patch-id: 32a9fe1371fffc9abd9a862b2814050a144d1968
> prerequisite-patch-id: 25184583b5de886f78ee0444a4a59d5f3c271ce5
> prerequisite-patch-id: df3376b9de27b23ae81a4c7b7a8fe4b429c32423
> prerequisite-patch-id: e68fbf7c82567d2e9f3fdd0fdf2e2911329d5ccd
> prerequisite-patch-id: 580fa40de01a81a8685e56420f562d299bfc60fa
> prerequisite-patch-id: 89548da6690681854ee1de992a491bed73202b83
>=20
> Best regards,

--=-lgRlMTk62Tz5+XvOiPcv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLg9rQAKCRDZQZRRKWBy
9DOMAQDcVGSt5eCrtxmW5GjbjKDZX4Mcu89liSvmkvsYrOLRvgD2P/Nnk1oo5A0D
+ncidLW5Cr0ZLsvpSWtdbWk3bHr2AQ==
=3aMe
-----END PGP SIGNATURE-----

--=-lgRlMTk62Tz5+XvOiPcv--

