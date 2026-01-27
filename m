Return-Path: <linux-media+bounces-51694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL2XAwvbeGmwtgEAu9opvQ
	(envelope-from <linux-media+bounces-51694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:34:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C996CF0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEF2330BA7D7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 15:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3BA35DD13;
	Tue, 27 Jan 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Ch0BRNRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671235D5F8
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526616; cv=none; b=Ei1cAOlW3LU9ITYTK/Z2M+4Whsrr5b4PZbtf5dMGfrNPlC1r91CshgFwjdUz2FmK5jQAzjNeePPMy0TrSz9UBwjHQ3PBJBNn5ZzJs2RXd2uGkQSpvIS7dRNzjaJ6ixc8k2pCfneUoLRBZ9qaKqUHHo0SbhuofE9apTDBlMFEY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526616; c=relaxed/simple;
	bh=V2NzastbFhpzOzHM5nA+miN7xKYKTp/1Xy8T6Y+6Cv0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p/HNGjOTk6i4pubWWEmUcgu0HCAEzSmUUc9SMEAxl5sjV8BjF3+n5D3ojs0P32Naf5y4KN0owp11p8REHyEFkAaQ6CAztm4IFOYY/kRIULi6xbM3ECDDzpk5Y1JDiQYktvGkecFckPOeDtiIeabq7/nTLx/cYdr22/BkziuFn3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Ch0BRNRo; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5029aa94f28so52160961cf.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1769526612; x=1770131412; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OhCrE4/omd3Aqh9ad+ieSaeycC5AgJDDUBgsMqT4cBk=;
        b=Ch0BRNRoFYdSILdhOygMhPXCmhuWlh/wdX5WsRTQmCgY/N6Knl0bV8zueL5ZmpoGZI
         qcyh5he21802KZJy4784amAGraXIKTALFhpKJCjASUbdHmxXXxc3W+vjapbm6TUcIStY
         //4Teim1zo5tXQqFsBB+26C1Hzi4mHwLfHaQv3vQclfXmfVTBrd/oFWODvl4xe9z0vxZ
         j8Y+pmWZIFwiPsah2AU4omDXSk2Dhsm2cFFVxkJ+R+8FbqH1IWAAuIyjGBJo338Lp1Fj
         lGJhJkOCdnYOlcSNvG4Qodil4X8X7gKJZY1R/bvRPmpe2jLk2Oxbl2pcpGrNxEr1Hue9
         X7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526612; x=1770131412;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhCrE4/omd3Aqh9ad+ieSaeycC5AgJDDUBgsMqT4cBk=;
        b=CFnop4MPATG5xUgvCSKvp50Vp2D+/0GExAAzQJYl+MGu8xhdnW/XN7rAaU5kZC3rDX
         d71qu+w3OvyQPLOqgRrenHyK1yFfaHb97YLmHa4eTwRxw+dONcIlocD6lznvh9Q0bEw/
         igyCT1J3UO8Sc4/ajWfoLMx2LHpbkoozmur5UGCHMw+GtO27UxKJMrbZfglaPl1fYZJH
         CZQql9ez0WRTLcIhLiT08UStMG48RrPF2phheafW8xnBApZJBdO/CQrxIOffzprOdEb/
         JAQOfBiTl7jCTPjnAmSC/E9nWWYbkng2Y7dzmJ9vZBecoWg9xDnpqRZIoC4G6GwEiVLn
         Qsfw==
X-Forwarded-Encrypted: i=1; AJvYcCWbZ85GnNjqaSmhU6gu8JJdZbf+3FnSt2e86gFhj0jqMqBF+nzEo1vB+XG1uzAMoyWxY+B3jRpiD6VB9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8VJJOrs4P58xUf9Xv2UmKQAlVNmyGaOPK8cS7ZimwCTQ6Ql3
	W0Fnn9Rc+jgq0wGLkJbIvrydWEzHvrFG4nAjtjOGSuVFTRONUeuGGQvOhP2EfpVyA34=
X-Gm-Gg: AZuq6aIGNO88Z3gLnbYU16jSaruMaeY0UkT4Fz0fuZogXKtkXHiRLaf1IjAu59WohIn
	/Zg//JupDz/1FNA/cGpqKelIsKV7UUUla5Ti9Q4ExLghGdTVnONElRuLewL4BCyrBy3rrC6sQxz
	y2hehf8bqK6vMVb4i9jr+grhSB0TJRwh7kG77pLHIWTVklmqtjam27XYNVaPFIvm/2K8WBPINDG
	hNQfNx3v/g2CxXWf9gEu7hNL2PVEEvrk42U3P4vD3xNjXU7GylH1YkbeOxPj4//OlhxT2cH3I1w
	Ha+xE0DvjwSa21KHB7O+Mf8GCiAUaePUK1glEkZ1HTj8v7/vGIuwj12VOBlKyThJ1kizOloSjGL
	9mZkjcOpJOUFQuui01p4fOm9SiDLo+mvjBFWAGuyIq563VXU3adDnvRM2+p90FQSvFMS6Na5F4b
	NHt1lM6EQGyd1f/ZVH
X-Received: by 2002:a05:622a:592:b0:501:45d7:10cd with SMTP id d75a77b69052e-503301175d8mr21471091cf.20.1769526612072;
        Tue, 27 Jan 2026 07:10:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491841640sm113651406d6.17.2026.01.27.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:10:11 -0800 (PST)
Message-ID: <df2d7dcc31c9a47752a1d58efdd7a416311e55ec.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] media: iris: add support for kaanapali platform
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Vikash Garodia
	 <vikash.garodia@oss.qualcomm.com>
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
Date: Tue, 27 Jan 2026 10:10:08 -0500
In-Reply-To: <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
	 <lpgw6eodclsvfwgvtljfiorvjkpd5vd27yhxs7i3ijfibaqzuk@bak2lwbyh77f>
	 <2d4632b2-916a-4eda-ad08-44af68461dc8@oss.qualcomm.com>
	 <vv4stkmrrwdqmbnpv7pg5nd4immtqo5iplwbcia3oykycfmg2m@dsithotfy5ls>
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
	protocol="application/pgp-signature"; boundary="=-fIhbK5YC4Jyx7+92/gYN"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51694-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne-ca.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A89C996CF0
X-Rspamd-Action: no action


--=-fIhbK5YC4Jyx7+92/gYN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 janvier 2026 =C3=A0 13:52 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> On Tue, Jan 27, 2026 at 04:56:34PM +0530, Vikash Garodia wrote:
>=20

[..]

>=20
> > =C2=A0- 4 testcase failed due to unsupported resolution
>=20
> Can it be fixed?

Its nicer if you name the failing tests vectors. I can guess this is
PICSIZE_{A,B,C,D}_Bossen_1 by experience, but not everyone will guess. HEVC
level impose a limit on bandwidth, not on resolution. These files are eithe=
r
very large and small height or the opposite. One of these is just 4K in por=
trait
mode (that is more concerning). Though, there is a V4L2 limitation for this
aspect, since we advertise the resolutions by range. Most hardware is desig=
ned
to support 4096x4096, in that casse that's what you should expose as limits=
.

Though, some hardware do have dynamic sizing capabilities (like RKVDEC HEVC=
), in
this case there is not much you can do, you have to find the right trade of=
. But
since you expose LEVELs, I think its fine to overshoot a little. Both
constraints should ensure it works with valid streams.

>=20
> > =C2=A0- 2 testcase failed due to CRC mismatch

These are clear example of "no one can guess".

>=20
> Which means an error in the testsuite or somewhere on our side?

The testsuite fully pass if you run using Franhofer reference decoder. This=
 is
logical since the MD5 has been generated with it.

>=20
> > =C2=A0- 2 test fails due to session error (under debug)
> > =C2=A0=C2=A0 - PICSIZE_C_Bossen_1

Hmm, see, I have no idea which fourth one could fail due to resolution, and=
 that
forth one is likely a bug on your side.

> > =C2=A0=C2=A0 - WPP_E_ericsson_MAIN_2
> >=20
> > VP9:
> > 235/305 testcases passed while testing VP9-TEST-VECTORS with
> > =C2=A0GStreamer-VP9-V4L2-Gst1.0.
> > =C2=A0The failing test case:
> > =C2=A0- 64 testcases failed due to unsupported resolution
>=20
> Can it be fixed?

Check if you aren't mixing up constraints between display, coded and alloca=
ted
resolutions. On most hardware, all 3 can differ. The OUTPUT queue should ei=
ther
not care at all, or use it to allow optimistic pre-allocation. But check th=
at
the low resolution constraints is not coming from the OUTPUT queue software=
.

VP9 coded resolution, it always at least 64x64.

>=20
> > =C2=A0- 2 testcases failed due to unsupported format
>=20
> Hmm?

Clarify please, I suppose these are YUV444 (aka professional profiles).

>=20
> > =C2=A0- 1 testcase failed with CRC mismatch (fails with ref decoder as =
well)
>=20
> Could you please raise an issue against fluster?

Check your setup, it fully pass with reference here. The MD5 has been gener=
ated
using the reference.

  ./fluster.py run -d libvpx-VP9 -ts  VP9-TEST-VECTORS

It also fully pass with the GStreamer wrapper, though it had been fixed in
recent GStreamer versions (I'm testing with 1.26.10).

>=20
> > =C2=A0- 2 testcase failed due to unsupported resolution after sequence =
change
>=20
> Can it be fixed?

This one can't be fixed without adding an extension to the V4L2 Stateful De=
coder
spec, like we did for the stateless decoder spec. In order to handle inter-=
frame
resolution changes (a resolution change on a non-keyframe), you have to not=
ify
userspace with the new resolution, give it a way to read back this solution=
,
have CREATE_BUFS() support to allow allocating for that new resolution with=
out
going through streamoff (to avoid looking reference data), and finally, a w=
ay to
remove buffers that are now too small (or too big if userspace wants to red=
uce
the amount of RAM used) through the new DELETE_BUFS ioctl. You also have to
track in your driver the reference buffer resolution/stride.

This is non-trivial with the existing stateful state-machine. You have to m=
ake
sure userspace won't be confused between normal DRC and inter-frame DRC (dy=
namic
resolution changes).


[...]

regards,
Nicolas

--=-fIhbK5YC4Jyx7+92/gYN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXjVUQAKCRDZQZRRKWBy
9K0kAQD0MAxPQbBuvjXyEOQ54AGTdA6LiPXI/V2NXsiuOOyzsQEA0zSjwWpUUgI8
OAbqxNRQbDIJW1n1zkHysWn/LRy5NQI=
=TSG9
-----END PGP SIGNATURE-----

--=-fIhbK5YC4Jyx7+92/gYN--

