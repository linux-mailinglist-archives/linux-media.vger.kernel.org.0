Return-Path: <linux-media+bounces-42832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA3B8CE7B
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 20:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E97565A30
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 18:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060D930277A;
	Sat, 20 Sep 2025 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="FoywK2Ce"
X-Original-To: linux-media@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86952F5B
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758391636; cv=none; b=kLfrT/sy/V6pOontfnxDfvl6TR/dJxlr5NExsXKaFAzN6G5Yz0/zXGV+7Td98mhnoYh/YraxnQJMQS/s+H5K5aKYQYSFfbYpXOevMNM6UTgIWW6sTi6h7hmedvZetiDoRx+J28pPOBfIjV1gVxSanQ6D0HzpVNAvWnMAodJbrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758391636; c=relaxed/simple;
	bh=Npw9zbQPEC18zj59d72lkZciw7xRLD4UXrUrBirx/MA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sspXI6BWfh6A8CsDT8BwVFVZLo2k1i+LK/roaJIjXD1sMdEZFVZskaf2UACqkO/N62Oktebm3ia5btb378jpEAwaQUsmwnKAqjp2KZjRbh6BhQG5cdy2AfoGyV7+YiDUi3qrqr47JC1wRo2sjRj22hudzzE02ykchYeiQ6XD1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=FoywK2Ce; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758391630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EDZl0ANj7v5q6OpbuwpuZi8KB2n6Sh+sPSSDtZHj8Es=;
	b=FoywK2CetcfKqJWZoi8P9Omv+JEBR1tPPr8nt9qDZ1F6dKpfEZFqNoOZKYD2jHPV3aXgba
	H7C1Lf4RizzKZDwOYARbBVDgXBNID3i/TeeeTRzm/LndVdtdHK/E4iEjYvml37SR41gFIh
	ViD5f9lh4KGIlVVdU3cPgUCjn0fOvFgTIpnYd/8RYMYhsbOFBAikWsW3mc2oIFnntFRTbA
	a0KOoyp6qfUWy+cNmomqzNzry2VdeU7IMR5TfbffHnu5FkFZ5KWIvZtCu2cs73+FoQdtPR
	gNRwb+cQ4LG/mB7lG0+oGqArQlrmPCan/gtkdeNyttZ7sU2De0Xa45SS4/N31w==
Content-Type: multipart/signed;
 boundary=d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 20 Sep 2025 20:06:36 +0200
Message-Id: <DCXTSROW5FPM.1008CWKUXILAI@cknow.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the
 VDPU381 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Detlev Casanova"
 <detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
 <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
 <ea0914d9-bd12-4bdc-b465-3ae82571118a@kwiboo.se>
In-Reply-To: <ea0914d9-bd12-4bdc-b465-3ae82571118a@kwiboo.se>
X-Migadu-Flow: FLOW_OUT

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas,

On Sat Sep 20, 2025 at 6:15 PM CEST, Jonas Karlman wrote:
> On 9/20/2025 5:00 PM, Diederik de Haas wrote:
>> Thanks a LOT for this patch set!
>> As already reported the results were quite impressive :-D
>>=20
>> To figure out how to make VDPU346 for rk3568 work, I had a close look at
>> the TRM and compared that to rk3588's TRM and compared it to your code.
>> I think I may have found a few potential issue, but I may also not
>> understand things correctly.
>>=20
>> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
>>> This decoder variant is found in Rockchip RK3588 SoC family.
>>>
>>> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
>>> output formats and level up to 5.1.
>>>
>>> The maximum width and height have been significantly increased
>>> supporting up to 65520 pixels for both.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>>>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>>>  .../platform/rockchip/rkvdec/rkvdec-h264.c    |  36 --
>>>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>>>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>>>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 164 +++++-
>>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   6 +
>>>  7 files changed, 1067 insertions(+), 38 deletions(-)
>>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu3=
81-h264.c
>>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu3=
81-regs.h
>>>
>>> ...
>>>
>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
>>> index 0ccf1ba81958a..1b55fe4ff2baf 100644
>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>>
>>> ...
>>>
>>> @@ -287,6 +327,25 @@ static const struct rkvdec_coded_fmt_desc rkvdec_c=
oded_fmts[] =3D {
>>>  	}
>>>  };
>>> =20
>>> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>>> +	{
>>> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>>> +		.frmsize =3D {
>>> +			.min_width =3D 64,
>>> +			.max_width =3D  65520,
>>> +			.step_width =3D 64,
>>> +			.min_height =3D 16,
>>> +			.max_height =3D  65520,
>>> +			.step_height =3D 16,
>>> +		},
>>=20
>> Also in the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image si=
ze" :
>> 16x16 to 65520x65520; step size 16 pixels
>>=20
>> I interpret that that .min_width and .step_width should both be 16.
>> (.min_height and .step_height are correct at 16; if I read the TRM right=
)
>
> The frmsize used internally for rkvdec is only meant to restrict/align
> the frame buffer use while decoding, It does not reflect sizes the HW
> can decode.
>
> frmsize should typically be min 64x64 with step_height 16 and step_width
> 64 to ensure stride is 16 byte aligned for both 8-bit and 10-bit video.
>
> Only max_width and max_height is used from here to signal userspace what
> max res is supported, together with min/max res and step of 1.

Interesting, thanks for the explanation :-)

So if I understand correctly, only .min_height should be changed to '64'
here? And it should also be 64+64+64+16 for HEVC (patch 11)?
(and also for VP9 and AVS2?)

> Regards,
> Jonas

Cheers,
  Diederik

>>=20
>>> +		.ctrls =3D &rkvdec_h264_ctrls,
>>> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>>> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>>> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
>>> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>> +	},
>>> +};
>>> +
>>>  static const struct rkvdec_coded_fmt_desc *
>>>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>>>  {
>>> @@ -1125,6 +1184,35 @@ static irqreturn_t rk3399_irq_handler(struct rkv=
dec_ctx *ctx)

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaM7tLwAKCRDXblvOeH7b
bmaPAP42aR+Mi7lYj8rv/CnJ3+XArfhpCOXq8Cechr4YPjJB5QD8Cuv/WjyPD0bq
+qJ3+PrgRJ7oywdCszE4tHtnZPvAPwE=
=yrXy
-----END PGP SIGNATURE-----

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396--

