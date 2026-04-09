Return-Path: <linux-media+bounces-58327-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE1tCJuq12kMRQgAu9opvQ
	(envelope-from <linux-media+bounces-58327-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:33:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D593CB42F
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C89D83035B30
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A392BE033;
	Thu,  9 Apr 2026 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="mnfDTDrf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1840C28B7DA
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740779; cv=none; b=RPBR61MX1m2ny/T7FR62akO+1O0JU9cnKplRaTTmb0Ew487ANAd/ddgM+DsqqnIay7ZIEiVjIoa3Haxzd31hFLpVoN4PhfHuMPeHc6XUwsuVDFSv4aV4u05eZTc6MXVL4O02h/3gLsJkBGRqt/c1o2ewl0NM7ItiKl5WA6z+k9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740779; c=relaxed/simple;
	bh=YTEFXB4Em+95TNKjqInan+WcTox/8mm8B4L8+hibVG0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZ2ZwQ8tJHxHDmVdccAq+Vc3xV4+QQ9CAsxKn7ooq6UVGBJTnHneKyyzErIfxKYQDs+MKFkxa0t6a989c3qDM9WozBCyV9Z+RMD0RqeG59zVcBNy9WtlNm+DwHV0uFK7H2AyWpqqknWtIMy4Cj1j5kQSzk3BtcN7yMPmoibU5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=mnfDTDrf; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a58057d7baso10499396d6.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1775740777; x=1776345577; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFG+7N2yTFpROZaXMIUZJ1XmWxfRVB2pSwz8dP8/hqM=;
        b=mnfDTDrf6v6B8tQlXzbZb3t0PSidqvM7KJi9TeQE7PD7w7uw1X3/8/4ObkkivnrHS8
         10T/kfY9dKlPih9e9LYCxFE7NGck4Hjw0nqM+7OElyfrcHZfI9O9Z13ZLTgriGSDYyVi
         oZ5zPasdRcw+6a19g5LjH0MFB0arnoM9aUXiGrgpehEXirVVdOYH2AoBr6nF78SdW+3A
         LGYS90pNnS5y5vf4p/rUfMSWInro8bBpxIUfV2UNbco80UVo57V5vkG0nnT9Jv8d11pX
         sztHC0NmTtCY9NW93egil/JuMPa12biZGtwxX4amaKqTUj8a2jbsf+nKHmNOfEDw15Mf
         GvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740777; x=1776345577;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFG+7N2yTFpROZaXMIUZJ1XmWxfRVB2pSwz8dP8/hqM=;
        b=lAupULkVCIcve8EYb0/5Ik2QUAEmvZ761ONFBl/VmiKUBEjjDvMn4Z+w6rKk6mdKaL
         uWJVFA5BD0bZjbfaPIPCUEzGyihVV1xAkZJX2egvzpMyiHfPxBFeyadf94wbkpJyU06B
         f77pSycOGwwpRw9LavjkIDu5R5aLnpayAkm7W5w9usEAwiOr9ozgmenLBdOH+XYYRnZn
         g/ZsrBXOBbxFvH5XGuIIp1yoYgxVYoR+sC5sPXwIhV8yzqgIK1b+k0LBd+AoPba2hiIA
         JY1E/i3Zzp0d74No3zmLnuZCpeqqRDhvC5I8j9vhj7r5KQc++NqDRRAELoNSUNku+ARf
         JKlA==
X-Forwarded-Encrypted: i=1; AJvYcCVbwl1a3sda//b0wL755NptxBhYVtzzYC1WgNLp9KSQQ+JaZS9Z7iQNYyNSUS/qdbLjvT8uKwlJJrzi3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KkXQsRVXmgPa/9W2IOLJ4M4iv02zfgq0ZN1FZn8hGclxEOqZ
	FcMsaTsnZ78uSoV4Qhwf8iVnRZoiJ7ncfkLoWn7vRtgHyl9VHMD5Je4G9uiHIzFsBcE=
X-Gm-Gg: AeBDietUsCOHKSjzlTYlaiaqGW+OI74DuzcaLHqQbMDfke11e8C7PnOrq1ACyojMfP9
	OOZp3bIRVl8X3io2IHf1L2wuoQiPsu/ee1T+5ncuBtfyoTQ5wmjfrPBjTYnLJfKlbm1dVRA7v1j
	G87s82zgQhWNX0JlfoX6elCBOUXFnTcUkb401oehXzweke/Ta/NkrlcQc0CzHpfhtCamisNzKh7
	xiW01XupKRvdwMxCCrR6YWwOjRJ8yK5nRlK/6xUIvr4h1uJhKFUHd9cTyHWojZSQmFbmFP8es39
	G8443JG/c013XRvRVncwhQlRDTU63zw8qryY57zlf1LsLiH8FwhGXqqBxY33KN9NdWf5jEK8tDh
	pL4eoR9mBE2Z7eBxcbP3E/ZaKDpVrW8r31M1RAdm8gcqs1evXre1Jp3fqZXtMv0Gr9lTK5kQdYq
	X1Bjx3+iCpPx95FSOrxeYwRRCPYxpc
X-Received: by 2002:a05:6214:76f:b0:89c:dd02:75d3 with SMTP id 6a1803df08f44-8ac740ac47fmr61009126d6.9.1775740776887;
        Thu, 09 Apr 2026 06:19:36 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596a0a655sm197646116d6.29.2026.04.09.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:19:35 -0700 (PDT)
Message-ID: <353933d7dc0821de180db2a8bae4b0d309ed4c25.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 0/7] media: qcom: iris: add support for decoding
 10bit formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov
	 <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,  Bryan O'Donoghue	 <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 09 Apr 2026 09:19:33 -0400
In-Reply-To: <f9edc172-c26a-4fa1-bca2-425e74bcd90b@linaro.org>
References: 
	<20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
	 <b4uqpepf6caojxe463izkmnrlayrdrgce6jusak33ewcr5yd4w@ukwbo7zfphn2>
	 <454f0f277cbaee5774c25d34a33fc3bc478fa756.camel@ndufresne.ca>
	 <f9edc172-c26a-4fa1-bca2-425e74bcd90b@linaro.org>
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
	protocol="application/pgp-signature"; boundary="=-Hst4jAB8ppCutrX+uWL9"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-58327-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim,linaro.org:email,ndufresne.ca:mid,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: A9D593CB42F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-Hst4jAB8ppCutrX+uWL9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 09 avril 2026 =C3=A0 09:36 +0200, Neil Armstrong a =C3=A9crit=C2=
=A0:
> Hi,
>=20
> On 4/9/26 03:04, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le jeudi 09 avril 2026 =C3=A0 03:02 +0300, Dmitry Baryshkov a =C3=A9cri=
t=C2=A0:
> > > On Wed, Apr 08, 2026 at 06:43:53PM +0200, Neil Armstrong wrote:
> > > > This adds the plumbing to support decoding HEVC and AV1
> > > > streams into 10bit pixel formats, linear and compressed.
> > > >=20
> > > > This has only been tested on SM8650 with HEVC, and was inspired by
> > > > Venus and the downstream vidc driver for the buffer
> > > > calculations and HFI messages.
> > > >=20
> > > > I was unable to get 10bit decoding working with Gstreamer
> > > > and ffmpeg, but v4l2-ctl works with:
> > >=20
> > > Any particular errors? I assume Gstreamer needs to be taught about
> > > Q10C. But P010 should (hopefully) work.
> >=20
> > P010 should work for both Gst and FFMPEG, its probably a user error, or=
 there is
> > a hidden bug in the driver that make it fail, v4l2-ctl is very permissi=
ve as it
> > simply dump to disk. You should provide an updated fluster score, so yo=
u have to
> > use one of these.
>=20
> I did run fluster and all main10 fails with Gstreamer and FFmpeg, I tried=
 to manually
> run the gst and ffmpeg commands with v4l2-tracer and logs but I can't exp=
lain the reason,
> all returns from the driver seems valid but somehow they just error out w=
ith:
>=20
> FFmpeg:
> $ ffmpeg -c:v hevc_v4l2m2m -i Big_Buck_Bunny_1080_10s_30MB_main10.h265 -y=
 -f null -
> ...
> [hevc_v4l2m2m @ 0x55c0328aa0] Using device /dev/video-dec0
> [hevc_v4l2m2m @ 0x55c0328aa0] driver 'iris_driver' on card 'iris_decoder'=
 in mplane mode
> [hevc_v4l2m2m @ 0x55c0328aa0] requesting formats: output=3DHEVC/none capt=
ure=3DNV12/yuv420p10le
> ...
> [hevc_v4l2m2m @ 0x55c0328aa0] An invalid frame was output by a decoder. T=
his is a bug, please report it.
> [vist#0:0/hevc @ 0x55c02dc9b0] [dec:hevc_v4l2m2m @ 0x55c029d510] Decoding=
 error: Internal bug, should not have happened
>=20

This one needs further investigation for sure. This error can be various th=
ings,
and it requires going up to the v4l2 code to figure-out:


Case 1:
    if (!frame->buf[0] || frame->format < 0)
        goto fail;

Case 2
        if (frame->width <=3D 0 || frame->height <=3D 0)
            goto fail;

But a quick look lead me to think it case 1 (frame->format < 0) since I don=
't
see P010 in the format map in ./libavcodec/v4l2_fmt.c (at least in mainline=
).
Its also missing support for any opaque format, in fact I believe the DMABu=
f/DRM
context is only in LibreELEC fork. But overall, it points toward ffmpeg for=
 this
error so far.


> The v4l2 trace shows a normal sequence with the driver returning P010 as =
G_FMT after the source change event,
> and the capture planes dequeued but for an unknown reason the buffer is r=
ejected by ffmpeg.
>=20
> Gst:
> $ gst-launch-1.0 -v -m filesrc location=3DBig_Buck_Bunny_1080_10s_30MB_ma=
in10.h265 ! h265parse !=C2=A0 v4l2h265dec ! tee ! fakevideosink
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> ...
> Got message #37 from element "h265parse0" (latency): no message details
> ERROR: from element /GstPipeline:pipeline0/GstH265Parse:h265parse0: Inter=
nal data stream error.
> Redistribute latency...
> Additional debug info:
> ../gstreamer/subprojects/gstreamer/libs/gst/base/gstbaseparse.c(3702): gs=
t_base_parse_loop (): /GstPipeline:pipeline0/GstH265Parse:h265parse0:
> streaming stopped, reason not-negotiated (-4)
> Got message #39 from pad "h265parse0:src" (property-notify): ERROR: pipel=
ine doesn't want to preroll.
> GstMessagePropertyNotify, property-name=3D(string)caps, property-value=3D=
(GstCaps)"video/x-h265\,\ width\=3D\(int\)1920\,\ height\=3D\(int\)1080\,\ =
framerate\=3D\(fraction\)30/1\,\ chroma-format\=3D\(string\)4:2:0\,\ bit-de=
pth-luma\=3D\(uint\)10\,\ bit-depth-chroma\=3D\(uint\)10\,\ parsed\=3D\(boo=
lean\)true\,\ stream-format\=3D\(string\)byte-stream\,\ alignment\=3D\(stri=
ng\)au\,\ pixel-aspect-ratio\=3D\(fraction\)1/1\,\ profile\=3D\(string\)mai=
n-10\,\ tier\=3D\(string\)main\,\ level\=3D\(string\)4";
> /GstPipeline:pipeline0/GstH265Parse:h265parse0.GstPad:src: caps =3D video=
/x-h265, width=3D(int)1920, height=3D(int)1080, framerate=3D(fraction)30/1,=
 chroma-format=3D(string)4:2:0, bit-depth-luma=3D(uint)10, bit-depth-chroma=
=3D(uint)10, parsed=3D(boolean)true, stream-format=3D(string)byte-stream, a=
lignment=3D(string)au, pixel-aspect-ratio=3D(fraction)1/1, profile=3D(strin=
g)main-10, tier=3D(string)main, level=3D(string)4
> ...

There is not a lot of details here, but I would start looking into
V4L2_CID_MPEG_VIDEO_HEVC_PROFILE and V4L2_CID_MPEG_VIDEO_HEVC_LEVEL
implementation. GStreamer (and Chromium too) will refuse to use a decoder t=
hat
does not advertise the supported profile (though I see there is code for th=
at,
maybe its just some bug).

>=20
> In this case OUTPUT is not STREAMON and no OUTPUT buffers are queued, so =
I wonder why this one fails....
>=20
> My gstreamer and ffmpeg foo is bad and I probably missed something obviou=
s...
>=20
>=20
You may get a different hint with more traces, just enabling general warnin=
gs:

  export GST_DEBUG=3D2

Or the full V4L2 traces too:

  export GST_DEBUG=3D"v4l2*:7,2"


I'm sure its just a bug (or two). Happy to help to find it.

>=20
> >=20
> > For Q10C on GStreamer, it needs mapping [0] and you need some bugfix [1=
] and
> > another that I will be sending tomorrow. We had never tested video comp=
ression
> > with this module before.
> >=20
> > [0] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests=
/8195
> > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests=
/11222
> >=20
> > The last issue has to do with:
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/38965e2d9c111=
9674a65dc437ee7e8ec95339f31/subprojects/gst-plugins-good/sys/v4l2/gstv4l2ob=
ject.c#L4378
> >=20
> > V4L2 format gives us the number of allocation, but not really the numbe=
r of
> > planes, and we forgot to initialize that number for the "opaque" format=
 case. A
> > tempory fix might be to add this after S_FMT:
> >=20
> > if (GST_VIDEO_INFO_FORMAT (&info.vinfo) =3D=3D GST_VIDEO_FORMAT_DMA_DRM=
)
> > =C2=A0=C2=A0 n_v4l_planes =3D format.fmt.pix_mp.num_planes;
> >=20
> > Works for AFBC and QC at leat, since both are unambiguously single plan=
e, and so
> > cannot have mplane variants.
>=20
> I'll definitely try that ! thanks for the pointers !
>=20
> >=20
> > Let me know how far you get! Please be aware that Robert and I are maki=
ng these
> > patches based on feedback, we don't have access to any boards capable o=
f
> > decoding to QC compressed formats.
> >=20
> > >=20
> > > > v4l2-ctl --verbose --set-fmt-video-out=3Dpixelformat=3DHEVC --set-f=
mt-video=3Dpixelformat=3DP010 --stream-mmap --stream-out-mmap --stream-from=
-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> > > > v4l2-ctl --verbose --set-fmt-video-out=3Dpixelformat=3DHEVC --set-f=
mt-video=3Dpixelformat=3DQ10C --stream-mmap --stream-out-mmap --stream-from=
-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> > > >=20
> > > > The non-10bit decoding still works as before.
> > > >=20
> > > > With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> > > > and tranformed in v4l2 header format with [1]:
> > > > ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c=
:v libx265 -crf 28 -x265-params profile=3Dmain10 Big_Buck_Bunny_1080_10s_30=
MB_main10.h265
> > > > /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_=
Buck_Bunny_1080_10s_30MB_main10.h265.hdr
> > > >=20
> > > > The frames correctness has been verified buy displaying them
> > > > via Vulkan DMA_BUF import, including QC10C and QC08C.
> >=20
> > In GStreamer, once the video4linux plugin issues are fixed, you should =
be able
> > to display the frames using glimagesink. GL only allow for RGB render, =
which
> > damages the data, so its not good enough for conformance testing with
> > compression enabled, but usually just doing visual inspection is accept=
able.
> >=20
> > > >=20
> > > > The support is probably incomplete for other platforms and
> > > > I'm unsure what's required to conform to the V4L2 M2M stateless
> > >=20
> > > stateful
> > >=20
> > > > spec, especially since AFAIK the decoder doesn't support
> > > > decoding 10bit streams in 8bit pixel format, thus the RFC state.
> > > > Review is welcome !
> >=20
> > Why would your decoder need to support decoding 10bit into 8bit ? This =
is quite
> > rare and its only possible with post-processed capture buffer.
>=20
> Yeah it's just a note, the Amlogic one supported outputing main10 in NV12=
 but
> only supported 10bit in their compressed format.
>=20

Ack. There is a lot of variation with various hardware for sure. The Allwin=
ner
stateless one swallow the extra 2bit plane (since they do some funky NV12 +=
 two
more planes for the missing 2bits, and that's complicate as a format hehe).


cheers,
Nicolas

>=20
> >=20
> > > >=20
> > > > [1] https://github.com/superna9999/pyv4l2compliance
> > > >=20
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > ---
> > > > Neil Armstrong (7):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: add QC10C &=
 P010 buffer size calculations
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: gen2: add s=
upport for 10bit decoding
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: add helpers=
 for 8bit and 10bit formats
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: updat=
e size and stride calculations for 10bit formats
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: forbi=
d g_fmt while waiting for first source change
> >=20
> > The is suspicious, it should just send the previous state until you get=
 the
> > event. Typical use case is for application to set a format based on bit=
stream
> > parsing, and use that as a guess to try and pre-allocate the buffers. I=
 don't
> > usually review iris code, but I'll give that series some more eyes in t=
he coming
> > days.
>=20
> Yeah I wasn't sure, venus does that, same as the vendor driver so I thoug=
ht it would
> be good but I'm probably mistaken.
>=20
> >=20
> > cheers,
> > Nicolas
>=20
> Thanks!
> Neil
>=20
> >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: updat=
e find_format to handle 8bit and 10bit formats
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: qcom: iris: vdec: allow=
 decoding into 10bit format
> > > >=20
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_buffer.c=C2=A0=C2=
=A0=C2=A0=C2=A0 | 81 +++++++++++++++++++++-
> > > > =C2=A0=C2=A0.../platform/qcom/iris/iris_hfi_gen2_command.c=C2=A0=C2=
=A0=C2=A0=C2=A0 | 71 ++++++++++++++++++-
> > > > =C2=A0=C2=A0.../platform/qcom/iris/iris_hfi_gen2_defines.h=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > =C2=A0=C2=A0.../platform/qcom/iris/iris_hfi_gen2_response.c=C2=A0=
=C2=A0=C2=A0 | 35 ++++++++--
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_instance.h=C2=A0=
=C2=A0 |=C2=A0 2 +
> > > > =C2=A0=C2=A0.../platform/qcom/iris/iris_platform_common.h=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > =C2=A0=C2=A0.../media/platform/qcom/iris/iris_platform_gen2.c=C2=A0=
 |=C2=A0 3 +-
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_state.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_state.h=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_utils.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 16 ++++-
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_utils.h=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_vdec.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 70 +++++++++++++++++--
> > > > =C2=A0=C2=A0drivers/media/platform/qcom/iris/iris_vidc.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++-
> > > > =C2=A0=C2=A013 files changed, 285 insertions(+), 18 deletions(-)
> > > > ---
> > > > base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> > > > change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
> > > >=20
> > > > Best regards,
> > > > --
> > > > Neil Armstrong <neil.armstrong@linaro.org>
> > > >=20

--=-Hst4jAB8ppCutrX+uWL9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadenZQAKCRDZQZRRKWBy
9HUTAQCXiz/zGaVPKTEDrc5OX78dMhL/OeLI63q8rdwPtUthzgEA0R8cv+osHgGP
tnJu5cgmABlw6/QJtjYa7w6qPbJyPwM=
=Ykh3
-----END PGP SIGNATURE-----

--=-Hst4jAB8ppCutrX+uWL9--

