Return-Path: <linux-media+bounces-39603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45305B22A0D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD2053A77B0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3429C2DEA60;
	Tue, 12 Aug 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="xunq7241"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352912DC320
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007815; cv=none; b=L9+moWir9CNS3WqMMiNRXMDj+J+7fpXFbxYxgFbxlGPp1cszh+8v3EpihTUbIxYm4Bh+nyYeOe9h4CXSVsKhIekFQCbAP070C04+3V5eCuudgGrx2o2ODsht+klnWiJpTYyuxAjoqG10j5BgH5YGQIQEJoPdyl+AlLsF3a54538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007815; c=relaxed/simple;
	bh=8LfjAJHW+mfgXBUXql5OobxymMq4p4kqJvNiBeMWw4w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sbd43NvaIfoUgvxe6RieunKfeCbTIwRfoTWNR4h3JkQ9rOIaQGUF7OWIR5vVff3cmFsF5u05Ct0S0AkasQ4zb18T2aS7gghVSGNoVkv8nFfQf7xGZ8xpr+m69P4JcQv2fvRWEjjjoMpumsCLb0MBRARt+dez0wgPoiE0AOWpCow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=xunq7241; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755007809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8au1BkNQCBnNySZYfiMEj46zoU7WWHs+Ju163gDFc6o=;
	b=xunq7241M6hc19Bn3WAarEymwrckCDjykmgAvQZ4VQbsrTAClXRwweHiQoupA3SOzTdnI8
	FZanaU4w22jwRoeytpngU5w8uLV7rdvFGZYDsZxbTUn3IaHEez09tTu1MiNOYtU4/+okcV
	hAxO9R4FzzqnRUmgcOI+bHjHjcVFGMhusj8cgNFM6lW7fU/p5k2EztxCZ8RymMhPxPpI5f
	lphtG9rMtLYs4vFZLko7nQWNTfLwpXVtY3z8P9Lz3ERwf/7JXkNzWAf1ENoXmhLmw2/qG6
	7yoFHtpTcnm+XlsGz6oWcZSxY0CV916mhxpnQhUZFTZdoZBBfqtaf1sxz3e7rQ==
Content-Type: multipart/signed;
 boundary=2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 16:09:56 +0200
Message-Id: <DC0ICB8ESISQ.1111XINSCI29S@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 "Detlev Casanova" <detlev.casanova@collabora.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
Cc: "Alex Bee" <knaerzche@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <DC0FTXJNW0KB.3I8DLNHJVL21O@cknow.org>
 <DC0GRKB9V014.1J7A2PO1B7U8H@cknow.org>
 <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
In-Reply-To: <816fa42715e8bc4bf538371975f97b6d102a74f5.camel@collabora.com>
X-Migadu-Flow: FLOW_OUT

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 12, 2025 at 3:27 PM CEST, Nicolas Dufresne wrote:
> Le mardi 12 ao=C3=BBt 2025 =C3=A0 14:55 +0200, Diederik de Haas a =C3=A9c=
rit=C2=A0:
>> On Tue Aug 12, 2025 at 2:11 PM CEST, Diederik de Haas wrote:
>> > On Sun Aug 10, 2025 at 11:24 PM CEST, Jonas Karlman wrote:
>> > > This series add a HEVC backend to the Rockchip Video Decoder driver.
>> > >=20
>> > > Patch 1 add the new HEVC backend.
>> > > Patch 2-3 add variants support to the driver.
>> > > Patch 4 add support for a rk3288 variant.
>> > > Patch 5 add a rk3328 variant to work around hw quirks.
>> > > Patch 6-7 add device tree node for rk3288.
>> >=20
>> > It looks like I had a previous version of linuxtv-rkvdec-hevc-v2 branc=
h
>> > locally and that also had this commit:
>> > - media: rkvdec: Keep decoder clocks gated
>> >=20
>> > Is that one no longer needed/useful/etc ?
>> >=20
>> > And 'chewitt' also had a commit to fix 8/10-bit selection:
>> > https://github.com/chewitt/linux/commit/4b93b05d2ca608bc23f1d52bcc32df=
926d435c7c
>> > "WIP: media: rkvdec: fix 8-bit/10-bit format selection"
>> >=20
>> > I haven't tried that one (yet), but did=C2=A0 try an other variant wit=
h
>> > changing the ordering in rkvdec_hevc_decoded_fmts but that didn't work
>> > in my tests. (Can ofc be PEBKAC)
>> >=20
>> > Would that be useful? I do/did have consistent problems with playing
>> > 10-bit encoded video files.
>>=20
>> nvm about the 10-bit problem. It exists, but it's not restricted to HEVC
>> as it also exists with with H.264 files.
>
> The referred patch is against some out-dated kernel. In mainline linux wi=
th
> have:
>
> 	if (sps->bit_depth_luma_minus8 =3D=3D 0) {
> 		if (sps->chroma_format_idc =3D=3D 2)
> 			return RKVDEC_IMG_FMT_422_8BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_8BIT;
> 	} else if (sps->bit_depth_luma_minus8 =3D=3D 2) {
> 		if (sps->chroma_format_idc =3D=3D 2)
> 			return RKVDEC_IMG_FMT_422_10BIT;
> 		else
> 			return RKVDEC_IMG_FMT_420_10BIT;
> 	}

That's indeed the code for H.264.

> Which covers all cases supporte by the hardware. Chewitt seem to add a
> previously missing 10bit case, and forcing downconversion from 422 to 420=
. A
> downconversion is something to be chosen and applied by userspace, the ke=
rnel
> should pick a non-destructive format by default.

It's based on the 6.16 mainline kernel, but that patch is a 'fix' on a
not (yet) accepted patch he added on top of that for HEVC. So it not
working for me on H.264 must be from somewhere else in the/my stack.

Sorry for the noise.

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJtLOQAKCRDXblvOeH7b
bs3HAQCxT5YbN/2lR7MNLL4Ut6pvl9wf/Pgc1qE3anE5JNfU7wEA9hiJInBMZsPp
WQpNfZk10b6mmxacnf912uguESmwRgU=
=rf9k
-----END PGP SIGNATURE-----

--2acb74a24eb3823e8a8b290ffe7c02819ac18ce13497a3a8eecc3891ed83--

