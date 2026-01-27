Return-Path: <linux-media+bounces-51705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFWTBtfueGkCuAEAu9opvQ
	(envelope-from <linux-media+bounces-51705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:59:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B349815F
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE1230185BA
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC30B33B6CD;
	Tue, 27 Jan 2026 16:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="neMRw4PY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F060311946
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533136; cv=none; b=Y3rmCfDvVjtUxzQpdgCy365fgLsBXHbXuxTahEqEhdQlMd78mpOvYT2K7NCz2IASyJEHiKfuo3Sfqg2sLJ/NGN+YHWlwP2aSFeLvbWzngRFuNNQkMvobF6Xi1K3mK+qLKCJ5s4IHj6inFgXX1WHmirBYCOwVswunPOZ3w74zFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533136; c=relaxed/simple;
	bh=BQxMfic91fvio2sSHNZJTwHwGTwfiIKo/DNvC2i6RcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sg3c47RREY2RZgf+z1Sp6e9crdnfqsehn8mtTho8jJRKGg/oFyQsaDlAlfdmnxyfDhUJ5fvbZtVLvZZSkUMQzP1JBNXdluQKYy/Gp4DEOaTBB2rFXAoH26ciHehRXDK8XqSPOZjrWv4wM1FaVawGJAtcmSETusUaqNqm+wykFsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=neMRw4PY; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c530866cf0so667410185a.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769533133; x=1770137933; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxMfic91fvio2sSHNZJTwHwGTwfiIKo/DNvC2i6RcQ=;
        b=neMRw4PYCIdrm9rCMMXc1B8R+XG0l5LESLlil16mbO7mMr9yiGUN/QW4LGNDiO3SxS
         ARtaM9/L29a5x/7SUHi4bgWeXstLcQkVJBq99lpLYEHR1T+EQrenf0cLtTMjUd5OTw0t
         vU1FZnQaN0j67kpSzaic81kbKM38xuFkwIcceTY83xjQzRzoAntfIT5Hqg96XpWWY009
         /NCPIdk+Lcu9rGc4EnRzLtmFYCSqhhxuZF+yPoPC85p4G+1SfEIVjiO8+jgtBUXywFr1
         TB12BD28Fi9KUeZe7EWENdEpifV769sxv7X/x93RQmbTCWqILe4TuM2bWoUoCOtnozEb
         OfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533133; x=1770137933;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQxMfic91fvio2sSHNZJTwHwGTwfiIKo/DNvC2i6RcQ=;
        b=CHJ8G8eqX28pPVNzn6bEvAC51eACEJZAao03P7Ck+73MeqkOtYcjINpa5mk01nIqJW
         CyXyecx+DASoVP05A68kpWJ5JwLeOcXUzoKneJZ8U0uFKeSIqfpguGDypkdOnSaNJoYP
         RNtTfAJbl7v8Wg5464q2eq+P+vvdLxWsMz32v4ClCWMVsx5n7QBiabBxMz6UjTnkTK9P
         xxbc/0dUFALy6rrosrouqxb6nrMTnGCX1GFNANBZDg+OeRUb8JqUDZ4ZDrLFgFGw0hsJ
         4EDJyF3FZJpHI7WIc6nIYslyQQjW1Kn2bOoobtpd9NMoMDSpS83GzscRC5SOeAmr6A+V
         rxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSJLRlog7o7ar7Sk8paStRuRnGCXv4EElOVX+7DrZc0y/VpTqql1cFa/d9Yik00f7ChF1Uyhpu0XesYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tAtKhl2VgthSTisWyQenF1z7ehCr7I9fVfeTqKcxdGeJGIOe
	7RufKImJo1Joh16VMfOEeZVfJDAjYvAD4r/GedD+V+q7cXTrzJirv3cCtz2pWVVR9nk=
X-Gm-Gg: AZuq6aLN9WrvXjk3cTYnxY7BbCg7JAVvEykyxLAgJ7qPzOW5mxYwpolW7FPGbhcVHcw
	HQ/5BG2kjyAYFjP8yM/+zXBEq5tQTMEzjSXzVyL8Ey4+xu/3ZOznQDVBnso3fYf8xcUWen8v3oV
	xZ+U3POLNdSPBrGr7AGcFKUaKaiCMj724cANnalYdZ9nY1O4evvCYfFdTMJxVlzTtNI7xaNgSOI
	Z9P5TdYA/D/1Ni8cMjRymt2DnW56XkRpXQDy6siP0UWZJ0Q3OXt35+gXmfi3a622Z/Pi0/+ozIf
	+eaIqtP39XFKC1NSt49AIP6ArBQR5Jt+y7PO9oy6bp/RTN9SjJfes2o/VWJgPVgUQ4sp7EA2p+A
	5S8zuwjz9UCmX7AfRc1uKlqwkT3g7HMZb4OTW3DUna8zdAH8Sc2Sj5Ao9vbEwTuo8Ca1SCA8w1n
	3IfiybkM5Zq14mpPz8
X-Received: by 2002:a05:620a:25c6:b0:8c5:31d9:2a7 with SMTP id af79cd13be357-8c70b904ee8mr273595085a.70.1769533132717;
        Tue, 27 Jan 2026 08:58:52 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d3ffd8sm8810085a.41.2026.01.27.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:58:52 -0800 (PST)
Message-ID: <63ca375440c4ff2f55ea0aa4e19458f775552d88.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dmitry Baryshkov
	 <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar	
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan	 <saravanak@kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Charan Teja Kalla
 <charan.kalla@oss.qualcomm.com>,  Vijayanand Jitta
 <vijayanand.jitta@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 11:58:49 -0500
In-Reply-To: <01532d63-ca30-42a2-920b-bab65254c9c6@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
	 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
	 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
	 <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
	 <df2d7dcc31c9a47752a1d58efdd7a416311e55ec.camel@ndufresne.ca>
	 <01532d63-ca30-42a2-920b-bab65254c9c6@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-6/FKpFX9y6veMxX1yWQS"
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
	TAGGED_FROM(0.00)[bounces-51705-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ndufresne-ca.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 88B349815F
X-Rspamd-Action: no action


--=-6/FKpFX9y6veMxX1yWQS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 janvier 2026 =C3=A0 21:29 +0530, Vikash Garodia a =C3=A9crit=C2=
=A0:
>=20
> On 1/27/2026 8:40 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 27 janvier 2026 =C3=A0 13:52 +0200, Dmitry Baryshkov a =C3=A9c=
rit=C2=A0:
> > > On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
> > >=20
> >=20
> > [..]
> >=20
> > >=20
> > > > =C2=A0=C2=A0- 4 testcase failed due to unsupported resolution
> > >=20
> > > Can it be fixed?
> >=20
> > Its nicer if you name the failing tests vectors. I can guess this is
> > PICSIZE_{A,B,C,D}_Bossen_1 by experience, but not everyone will guess. =
HEVC
> > level impose a limit on bandwidth, not on resolution. These files are e=
ither
> > very large and small height or the opposite. One of these is just 4K in=
 portrait
> > mode (that is more concerning). Though, there is a V4L2 limitation for =
this
> > aspect, since we advertise the resolutions by range. Most hardware is d=
esigned
> > to support 4096x4096, in that casse that's what you should expose as li=
mits.
> >=20
> > Though, some hardware do have dynamic sizing capabilities (like RKVDEC =
HEVC), in
> > this case there is not much you can do, you have to find the right trad=
e of. But
> > since you expose LEVELs, I think its fine to overshoot a little. Both
> > constraints should ensure it works with valid streams.
>=20
> I can list the failing test vectors for failing tests. In this case, its
> PICSIZE_A_Bossen_1
> PICSIZE_B_Bossen_1
> WPP_D_ericsson_MAIN10_2
> WPP_D_ericsson_MAIN_2
>=20
> I have not explicitly gone through individual failures this time on=20
> kaanapali, as last time when these were analyzed for earlier platform=20
> (SM8550), the failed due to resolution lower than 96x96, which VPU does=
=20
> not support for kaanapali as well.
>=20
> Do you think if fluster can query the supported frame sizes and=20
> accordingly, mark the ones testing outside that range as pass, if=20
> graceful error ?

No, the conformance streams are the same for all decoder regardless of the
subset of the spec the hardware designers decided have implemented. The err=
or
type could possibly be enhanced, but at the moment we have:

- Success: MD5 matches
- Fail: MD5 does not match (corrupted/truncated outcome)
- Error: When the operation did not complete.

Once you have manually investigated all the case, and you want to setup you=
r CI
(which I strongly recommend you to do). You can pass -sv / --skipvectors
parameter to `run` command to remove the expected fail from your run.

Another thing we get to notice, is that integrator very commonly assume tha=
t a
96x96 limits imply that all the resolution, display, coded and allocated mu=
st be
at least that big. Which most of the time is not what the HW designers inte=
nded.

>=20
> > >=20
> > > > =C2=A0=C2=A0- 2 testcase failed due to CRC mismatch
> >=20
> > These are clear example of "no one can guess".
> >=20
>=20
> RAP_A_docomo_6

When I read the description for this one it looks like something normally h=
andle
in the control software (which is in your firmware for this type of hardwar=
e).
You should report to your firmware team. When a GOP starts on a CRA followe=
d by
RASL, the control software need to skip over the RASL. This can either be d=
one
by skipping over the decoding, or letting the decoder run but marking as no=
n-
output. The second is what the GStreamer stateless decoders implementation =
do,
but we notice that on older driver, it may cause errors or hangs, so we wil=
l
stop doing that in the future. For reference, you can download the zip (lin=
k in
fluster/test_suites/h.265/JCT-VC-HEVC_V1.json), ITU conformances usually co=
me
with a description.

https://www.itu.int/wftp3/av-arch/jctvc-site/bitstream_exchange/draft_confo=
rmance/HEVC_v1/RAP_A_docomo_6.zip
RAP_A_docomo_6: (RAP_A_docomo_6.bit)
Frame rate: 30 fps
Picture size: 832x480=20
Spec version: HM10.1

(Category: RAP; Sub-category: Bitstream starting with a CRA picture followe=
d by
RASL pictures that cannot be decoded)

The purpose of the stream is to exercise the decoding of a conforming bitst=
ream
where the CRA is the first picture in the bitstream and is followed by 7 RA=
SL
pictures that are not decodable. There are two subsequent CRA pictures with=
 RASL
pictures, following the first CRA picture in this bitstream. These subseque=
nt
RASL pictures should be decodable since the associated CRA is not the first=
 CRA
picture in the bitstream.

Note: In actual decoders, any RASL pictures associated with a CRA picture a=
t the
beginning of the bitstream or any RASL pictures associated with a BLA pictu=
re
may be ignored (removed from the bitstream and discarded), as they are not
specified for output and have no effect on the decoding process of any othe=
r
pictures that are specified for output.

The MD5 of the yuv file in output order decoded using the HM10.1-dev-3420 i=
s
included in RAP_A_docomo_6.md5.


> VPSSPSPPS_A_MainConcept_1

This one depends on software cropping happening after the decoder. This is =
not
implemented in v4l2 stateful decoder, so a GStreamer bug. Unaligned crop re=
gions
that cannot be cropped by offset and stride stricks are generally not suppo=
rted,
but we opted for a proper cropper in the stateless plugin in order to suppo=
rt
conformance testing. Patched welcome, but not an issue with this driver.

>=20
> For "RAP.." test vector, it was discussed earlier [1] and the frames=20
> marked as VB2_BUF_STATE_ERROR should be dropped. GST is currently=20
> displaying the NULL content leading to CRC mismatch. Let me know if this=
=20
> can be taken up as a GST bug.

Well, as discussed earlier, GStreamer drops the ERROR frame if their payloa=
d
size it reset to 0. Otherwise its treated as partially corrupted frame, and
pushed. This aligns with how the v4l2 buffer error state is documented.

>=20
> [1]=20
> https://lore.kernel.org/linux-media/20250408-iris-dec-hevc-vp9-v1-0-acd25=
8778bd6@quicinc.com/
>=20
> > >=20
> > > Which means an error in the testsuite or somewhere on our side?
> >=20
> > The testsuite fully pass if you run using Franhofer reference decoder. =
This is
> > logical since the MD5 has been generated with it.
>=20
> Since the reference decoder in this is not generating buffers with zero=
=20
> filled data, its not complaining. In VPU case, even though buffers are=
=20
> of zero filled data, marking them as error, should get dropped, instead=
=20
> of considering it as a valid frame.

See comment below, you have some debugging to do here. I think other dev in=
 your
group have kept ignoring the problem.

>=20
> >=20
> > >=20
> > > > =C2=A0=C2=A0- 2 test fails due to session error (under debug)
> > > > =C2=A0=C2=A0=C2=A0 - PICSIZE_C_Bossen_1
> >=20
> > Hmm, see, I have no idea which fourth one could fail due to resolution,=
 and that
> > forth one is likely a bug on your side.
> >=20
>=20
> This could pass on sm8550 and fails on kaanapali. This should be=20
> debugged from driver side.
>=20
> > > > =C2=A0=C2=A0=C2=A0 - WPP_E_ericsson_MAIN_2
> > > >=20
> > > > VP9:
> > > > 235/305 testcases passed while testing VP9-TEST-VECTORS with
> > > > =C2=A0=C2=A0GStreamer-VP9-V4L2-Gst1.0.
> > > > =C2=A0=C2=A0The failing test case:
> > > > =C2=A0=C2=A0- 64 testcases failed due to unsupported resolution
> > >=20
> > > Can it be fixed?
> >=20
> > Check if you aren't mixing up constraints between display, coded and al=
located
> > resolutions. On most hardware, all 3 can differ. The OUTPUT queue shoul=
d either
> > not care at all, or use it to allow optimistic pre-allocation. But chec=
k that
> > the low resolution constraints is not coming from the OUTPUT queue soft=
ware.
> >=20
> > VP9 coded resolution, it always at least 64x64.
> >=20
> The failed list is same as the one published during sm8550 [1]. I see=20
> most of the test vectors are <=3D 64x64 and going as low as 08x08. Here a=
s=20
> well if we can have a query for supported frame size, it should handle=
=20
> these cases.
>=20
> [1]=20
> https://lore.kernel.org/linux-media/20250408-iris-dec-hevc-vp9-v1-0-acd25=
8778bd6@quicinc.com/
> > >=20
> > > > =C2=A0=C2=A0- 2 testcases failed due to unsupported format
> > >=20
> > > Hmm?
> >=20
> > Clarify please, I suppose these are YUV444 (aka professional profiles).
>=20
> vp91-2-04-yuv422.webm
> vp91-2-04-yuv444.webm
>=20
> >=20
> > >=20
> > > > =C2=A0=C2=A0- 1 testcase failed with CRC mismatch (fails with ref d=
ecoder as well)
> > >=20
> > > Could you please raise an issue against fluster?
> >=20
> > Check your setup, it fully pass with reference here. The MD5 has been g=
enerated
> > using the reference.
> >=20
> > =C2=A0=C2=A0 ./fluster.py run -d libvpx-VP9 -ts=C2=A0 VP9-TEST-VECTORS
> >=20
> > It also fully pass with the GStreamer wrapper, though it had been fixed=
 in
> > recent GStreamer versions (I'm testing with 1.26.10).
> >=20
>=20
> I would let Dikshita comment on this. I am unable to find that=20
> discussion where it was failing in her setup with reference decoder as we=
ll.

Looking forward some improvement over generation of hardware, not regressio=
n.

regards,
Nicolas

--=-6/FKpFX9y6veMxX1yWQS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXjuygAKCRDZQZRRKWBy
9FWjAQDY5JOJrkwiQLna3jdTscn2vjalPvdv//UFEHBpGupWWQD+KbOrFfXUBHK0
Mf7Ke63dsRsw1tp0UL5NHVkBTW4SqAw=
=XB7s
-----END PGP SIGNATURE-----

--=-6/FKpFX9y6veMxX1yWQS--

