Return-Path: <linux-media+bounces-58299-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IBVAhT71mkPKggAu9opvQ
	(envelope-from <linux-media+bounces-58299-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 03:04:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED13C523B
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 03:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E53BC300D619
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 01:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBB020FA81;
	Thu,  9 Apr 2026 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="b0a0f8iw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB2235358
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775696648; cv=none; b=bbHiNw7xyT9rKX8hCXUbYJpTJGlFRq3Rh1v9heZebORRCSLU065uSCm7+wrRFgEalf6nEcxm9FZtOj4tVgz9Ob4gXKvH9T03qG1h4MgPXcyCSVg5CF6joQau6FqAIiSNggR8NjWaJP8ORIWJXHHAV+nTrThqqZwk0+Ooi5oRT7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775696648; c=relaxed/simple;
	bh=Vq6j2DK3ZZmGDozLDcxr9T4TaigkxshlcL8VC116WDM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ulkAnZfPpKnonwh5KXGbovoWEwWWgifU0oXq6KczN4b4SUqVu2p4vTxJbQgJh1A0oPd1Cbd84814WSGefXbAUbyO8X7I4MHanqwHjpyYeLbDevvKcLrnrZB3LlPxd00FW7YsgAwpBj/tHROqblJMy/GHsqNNnHsDiYjDQDdxOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=b0a0f8iw; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89f87257904so3128516d6.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775696645; x=1776301445; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vBrL0l2Zc3G6KrlRBRuGMvXJ7VpmuaQtzN2zKLv5REw=;
        b=b0a0f8iw1fxSPi5sowVU2Mpp24vDPMrXmI36jUt4SCU4Z1ybOmnahTRN2rM9a9yyCM
         Ss4jlurrLhiXNXF5+ZikCQe19m26qenhBMEZBxUwqeOHTh3X4LD+ujDEVtuInqF/rzZI
         oN8LCYVUkpSTxB0Y3ilMCT5qIgLtcLFtg6d66JSOem7nEDKUnzGi+fuKKd7mQAYzN0Zp
         wTKz/0RDP8qUN8r7uvqgj60QED4VdwCL/yvAu8m5iKvnPine2gRVSRdEyhAeO9rctce3
         lw1hcraTns0LN6KWyzQh0PVC1MGgMA47q9vlSs4yt40fbufdmdfHDmLCAqvvxd1R7Wsc
         r9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775696645; x=1776301445;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBrL0l2Zc3G6KrlRBRuGMvXJ7VpmuaQtzN2zKLv5REw=;
        b=HnXBOfVw0s6BsJjM7dOvL0dpCYaMDVsEIqwt+59s1gjJgEwl1lIIQI2WorlKqnX3zU
         9mlTtwjTsibNV2M8+/r/N38sFcp1F1GqfEMpRhehzkt3NhzCQPvOQiaoeNSAewSvebHn
         koSdYkk3kPl8kK5R565imPZ7IVOJg/XICpjOHLuMWA5yilteisFz45/1jX1G1TJzFHP6
         K5tNFftGmP7GQU6KDo1B0vNF+daSBIUSnRMYMO7K669xReFnNpqEhK8iIHE0FGzwV0s+
         tzNJd5n5Fe2B2yU6mUiyyEstrBrcAXEEhBb52cV8bYBFZU/iHTak29Fq7el613hgJte9
         4HSw==
X-Forwarded-Encrypted: i=1; AJvYcCW1rkep30Lf2y6yhRM3vFgQDNDduGAoS0/LXfKJI31Emd8Dq7y/Cb3/4IV0Jg64ZWfvWFfeeXJAjgZuJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1YkOmUky9XkFM5qvA66rqiqBbqXnhqUOtG6DloTTQ27yTOu9
	i68RmPbzmJvaEKCrUGLxRePQ9e5uabIJ9BwD6gJrZQ/zko/AyjgOBXIHIIZpF2zK+xo=
X-Gm-Gg: AeBDiesz7X5f7mFMOqH0sfVWOgtHrNrHetwDUH11KM8DlQ0qoZLeWLDog//3vaow/jC
	Ghy+a8ewtivK1NL8doKPSzSlg3sT7+a2sksAgXVBq1UMoEescgUiaquxhoSxyTlfAdnr/LzHTmq
	9r/rDykllr3lstdqei9Hc6gOIU9g5MSQgDOfQphnRn36JYRyJp3F3vx4g6oo+2XXP2+ufh0LxTd
	Bxutejcu97AJb7wd2UkFKDA2zcTZMJnjuiCKWPO6L2OpY7jfwetug/qmXAu/JM+b95z8vBC8W2g
	9yQVyyJUdYExksy5hLE6B8ZpfiOEPE8VlLzn7PPkHnAWtJ+0NWGgkFvXvYSTw+5c7vZPEfI9pI4
	SIMU2tl5RHB+AfwWvEMCYIr4oYA95IwyZSGNDZlQgW4G7isMUjFFhWr6eIm1k0eBJhIWZawEKr4
	9CERb5PGyQf/gIuia6dvr8MAmuQVL2
X-Received: by 2002:a05:6214:dcd:b0:89a:258:c1d5 with SMTP id 6a1803df08f44-8a704fa43ffmr386871216d6.50.1775696644737;
        Wed, 08 Apr 2026 18:04:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5969156d3sm187275646d6.31.2026.04.08.18.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:04:04 -0700 (PDT)
Message-ID: <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding
 10bit formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
	 <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 21:04:02 -0400
In-Reply-To: <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
References: 
	<20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
	 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
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
	protocol="application/pgp-signature"; boundary="=-/9/A1hhbG0WtV7XUd9PY"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-58299-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64ED13C523B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-/9/A1hhbG0WtV7XUd9PY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 09 avril 2026 =C3=A0 03:02 +0300, Dmitry Baryshkov a =C3=A9crit=C2=
=A0:
> On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
> > This adds the plumbing to support decoding HEVC and AV1
> > streams into 10bit pixel formats, linear and compressed.
> >=20
> > This has only been tested on SM8650 with HEVC, and was inspired by
> > Venus and the downstream vidc driver for the buffer
> > calculations and HFI messages.
> >=20
> > I was unable to get 10bit decoding working with Gstreamer
> > and ffmpeg, but v4l2-ctl works with:
>=20
> Any particular errors? I assume Gstreamer needs to be taught about
> Q10C. But P010 should (hopefully) work.

P010 should work for both Gst and FFMPEG, its probably a user error, or the=
re is
a hidden bug in the driver that make it fail, v4l2-ctl is very permissive a=
s it
simply dump to disk. You should provide an updated fluster score, so you ha=
ve to
use one of these.

For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1] an=
d
another that I will be sending tomorrow. We had never tested video compress=
ion
with this module before.

[0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/819=
5
[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/112=
22

The last issue has to do with:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c1119674=
a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2object=
.c#L4378

V4L2 format gives us the number of allocation, but not really the number of
planes, and we forgot to initialize that number for the "opaque" format cas=
e. A
tempory fix might be to add this after S_FMT:

if (GST_VIDEO_INFO_FORMAT (&info.vinfo) =3D=3D GST_VIDEO_FORMAT_DMA_DRM)
  n_v4l_planes =3D format.fmt.pix_mp.num_planes;

Works for AFBC and QC at leat, since both are unambiguously single plane, a=
nd so
cannot have mplane variants.

Let me know how far you get! Please be aware that Robert and I are making t=
hese
patches based on feedback, we don't have access to any boards capable of
decoding to QC compressed formats.

>=20
> > v4l2-ctl --verbose --set-fmt-video-out=3Dpixelformat=3DHEVC --set-fmt-v=
ideo=3Dpixelformat=3DP010 --stream-mmap --stream-out-mmap --stream-from-hdr=
 Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> > v4l2-ctl --verbose --set-fmt-video-out=3Dpixelformat=3DHEVC --set-fmt-v=
ideo=3Dpixelformat=3DQ10C --stream-mmap --stream-out-mmap --stream-from-hdr=
 Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> >=20
> > The non-10bit decoding still works as before.
> >=20
> > With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> > and tranformed in v4l2 header format with [1]:
> > ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v l=
ibx265 -crf 28 -x265-params profile=3Dmain10 Big_Buck_Bunny_1080_10s_30MB_m=
ain10.h265
> > /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck=
_Bunny_1080_10s_30MB_main10.h265.hdr
> >=20
> > The frames correctness has been verified buy displaying them
> > via Vulkan DMA_BUF import, including QC10C and QC08C.

In GStreamer, once the video4linux plugin issues are fixed, you should be a=
ble
to display the frames using glimagesink. GL only allow for RGB render, whic=
h
damages the data, so its not good enough for conformance testing with
compression enabled, but usually just doing visual inspection is acceptable=
.

> >=20
> > The support is probably incomplete for other platforms and
> > I'm unsure what's required to conform to the V4L2 M2M stateless
>=20
> stateful
>=20
> > spec, especially since AFAIK the decoder doesn't support
> > decoding 10bit streams in 8bit pixel format, thus the RFC state.
> > Review is welcome !

Why would your decoder need to support decoding 10bit into 8bit ? This is q=
uite
rare and its only possible with post-processed capture buffer.

> >=20
> > [1] https://github.com/superna9999/pyv4l2compliance
> >=20
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> > Neil Armstrong (7):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: add QC10C & P010 buff=
er size calculations
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: gen2: add support for=
 10bit decoding
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: add helpers for 8bit =
and 10bit formats
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: update size and=
 stride calculations for 10bit formats
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: forbid g_fmt wh=
ile waiting for first source change

The is suspicious, it should just send the previous state until you get the
event. Typical use case is for application to set a format based on bitstre=
am
parsing, and use that as a guess to try and pre-allocate the buffers. I don=
't
usually review iris code, but I'll give that series some more eyes in the c=
oming
days.

cheers,
Nicolas

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: update find_for=
mat to handle 8bit and 10bit formats
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: allow decoding =
into 10bit format
> >=20
> > =C2=A0drivers/media/platform/qcom/iris/iris_buffer.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 81 +++++++++++++++++++++-
> > =C2=A0.../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=A0=C2=A0=
=C2=A0 | 71 ++++++++++++++++++-
> > =C2=A0.../platform/qcom/iris/iris_hfi_gen2_defines.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> > =C2=A0.../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=C2=A0=C2=A0=
 | 35 ++++++++--
> > =C2=A0drivers/media/platform/qcom/iris/iris_instance.h=C2=A0=C2=A0 |=C2=
=A0 2 +
> > =C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0.../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0 |=C2=A0 3=
 +-
> > =C2=A0drivers/media/platform/qcom/iris/iris_state.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 6 ++
> > =C2=A0drivers/media/platform/qcom/iris/iris_state.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0drivers/media/platform/qcom/iris/iris_utils.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 16 ++++-
> > =C2=A0drivers/media/platform/qcom/iris/iris_utils.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
> > =C2=A0drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 70 +++++++++++++++++--
> > =C2=A0drivers/media/platform/qcom/iris/iris_vidc.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 14 +++-
> > =C2=A013 files changed, 285 insertions(+), 18 deletions(-)
> > ---
> > base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> > change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
> >=20
> > Best regards,
> > --=C2=A0=20
> > Neil Armstrong <neil.armstrong@linaro.org>
> >=20

--=-/9/A1hhbG0WtV7XUd9PY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadb7AgAKCRDZQZRRKWBy
9KLRAP9nhaEiplPaaoOq0V04jzwrMeHXixo+gZ3MEIa5JAcDBQD6A9DpAPGeVDd5
GWH7n23T6INjDs09WY0/YFVzwTLNngs=
=qnBB
-----END PGP SIGNATURE-----

--=-/9/A1hhbG0WtV7XUd9PY--

