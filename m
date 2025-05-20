Return-Path: <linux-media+bounces-32925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6BABD94D
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 15:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 731867A13CA
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 13:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91F0242923;
	Tue, 20 May 2025 13:27:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F4241CBA;
	Tue, 20 May 2025 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747624; cv=none; b=Hq7HuFhl1RYLDQhL/3By2iZuglnkdMk7dt+7aS3geNBtHNMbVd5N7+WwM07/QJx1Q7J0Ej913nBgR7Qt19DlaJZW8UI5rM5BS/x6nNZ/bVoTaTdfRuMU9E1rA2XDp7DhXXsz4rNoYlIm056/XxXo3EBMdY5ZbaiSYpj36ca4gM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747624; c=relaxed/simple;
	bh=vykBg8ejrA86ORynX2aNEi6P3gRBY+QDembUBCdgmWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BRQbOZ3CN4uhk6rW+JyZugboLUtbrNGQWqlrdKKEozTwivoHqrgX43Ceu78UgXwkeWEMAw5RyYxChZBlcHC21N5s0GA59YokKgIEuwohDnYze1GNgU31WAmAV2lMin+qr9sho2bUIi5/32+16+ecyY5OlANZI0bfJNDvkPHUPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id B0B1EC405A46;
	Tue, 20 May 2025 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B0B1EC405A46
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman
 <megi@xff.cz>,  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
  stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
In-Reply-To: <aB31Eg6oRpcHHEsb@pyrite.rasen.tech> (Paul Elder's message of
	"Fri, 9 May 2025 14:29:06 +0200")
References: <m3tt5u9q7h.fsf@t19.piap.pl> <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
Sender: khalasa@piap.pl
Date: Tue, 20 May 2025 15:26:58 +0200
Message-ID: <m3jz6b8lb1.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I'm sorry it took that long.

Paul Elder <paul.elder@ideasonboard.com> writes:

>> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
>> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
>> HIST_STEPSIZE =3D 3 (lowest permitted):
>
> According to the datasheet, the histogram bins are 16-bit integer with a
> 4-bit fractional part. To prevent overflowing the 16-bit integer
> counter, the step size should be 10.
>
> Do you have any other information on this? Is it known that it's stable
> and consistent to use all 20 bits anyway?

Interesting. I only have those mrv_*.h files which come with
isp-imx-4.2.2.* package(s). Here we have (among others):

/*! Register: isp_hist_prop: Histogram properties (0x00000000)*/
/*! Slice: stepsize:*/
/*! histogram predivider, process every (stepsize)th pixel, all other pixel=
s are skipped */
/* 0,1,2: not allowed */
/* 3: process every third input pixel */
/* 4: process every fourth input pixel */
/* ...*/
/* 7FH: process every 127th pixel */
#define MRV_HIST_STEPSIZE_MASK 0x000003F8
#define MRV_HIST_STEPSIZE_SHIFT 3

In case of my IMX290 1920x1080 sensor, 1 doesn't work well (it stops
counting before reaching $((1920x1080)) in each bin, and even if no bin
reaches this magic value, the total count may be invalid (not equal to
the number of pixels). IIRC, 2 worked well. Maybe with higher
resolutions, I don't know.

I'm currently using "3" per the .h file:
isp_hist_prop:
32E12400: 1Dh
histogram_measurement_result:
32E12414: 0 0 1 1004 569 476 633 1197 2373 2212 1923 2945 3632 3025 5821 20=
4589
which sums to 518400 =3D 1920*1080/9.

Setting "2", the same input scene:
32E12400: 15h
32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943 1320=
1 460522
which sums to 518400 =3D 1920*1080/4.

Setting "1", the same input scene:
32E12400: Dh
32E12414: 0 0 25 9046 4924 4317 5435 10655 20781 18965 16051 24716 32681 28=
368 54301 1048559
which sums to 1278824 which is rather less than 2073600.
The last number (1048559) is the magic one, no bin can go higher. Less ligh=
ts and:
32E12400: Dh
32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922 4003=
58 386695
total =3D 2073600. But don't rely on it too much, the "1" has problems.

In short, those are integer values. One may use them as fractionals with
some clever step size, I guess.

>> isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
>> isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
>> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
>>
>> Apparently the histogram is missing the last column (3-pixel wide,
>> though only single pixels count) and the last (same idea) row
>> of the input image: 1917 * 1077 / 3 / 3 =3D 229401
>
> I don't quite understand this. With a sub-window width of
> 1920 / 5 - 1 =3D 383, shouldn't the resulting total window width be
> 383 * 5 =3D 1915? Same idea for the height.

It would, but the stepsize =3D 3 makes it ignore only the last one
- i.e., normally the counted ones are 0, 3, ... 1914, 1917 (which makes
1920/3) and with 383, it ends at 1914, thus only 3 pixels (1 really,
instead of 2) are missing from calculations (not 5). I guess the same
vertically, 1080 divides / 3 and 1075 doesn't.

> The fix looks fine though. Although, I'm wondering if there's a reason
> why there was a -1 in the first place. Does anybody know?

There is slight chance it's different on some other SoC, but I would be
surprised.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

