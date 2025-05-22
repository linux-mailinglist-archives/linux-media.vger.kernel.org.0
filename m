Return-Path: <linux-media+bounces-33115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248CAC0B81
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 741537A2BC7
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9B928A41C;
	Thu, 22 May 2025 12:18:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BE24E4C6;
	Thu, 22 May 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916318; cv=none; b=O6vHtCwPKaBCD6olzZLeHPo1Q+F7hOTW0nWzbUqsFNcjaWyCxDXY74icDazgr/n/utyLiOK2cYQjYpl1kXzV4l/AKRSVwy2l8ieXx0KRvSDLIpFhXaLJ1fNXXmeZ/ufNXsLNU2l53tV+GjEa7TCBBknFaFdyIOuK36gl9WlEHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916318; c=relaxed/simple;
	bh=HDSvBOeKveZYF6b9S5X4vui4DH9xu/TEm/3/m9avi9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iJwcGb5KoLUO7qugz0qJXvrw3fdI1Y9vywLkvJo8/u9AhipOFbsToyKtCskIJtah2V5LM/WLjDA2EujxwX8hhks9Rk24CTNqj65NjNwdXrMsRvX9zCjVJXYEHAtOpqnax1pW3Bh8HK7nACMN1EDP0p6L3m6WOPtJnaCEPMyoreU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 4D218C405A45;
	Thu, 22 May 2025 14:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 4D218C405A45
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Heiko
 Stuebner <heiko@sntech.de>,  linux-media@vger.kernel.org,
  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman
 <megi@xff.cz>,  Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
  stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
In-Reply-To: <174784811736.14042.11404187248848039485@calcite> (Paul Elder's
	message of "Wed, 21 May 2025 19:21:57 +0200")
References: <m3tt5u9q7h.fsf@t19.piap.pl> <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
	<m3jz6b8lb1.fsf@t19.piap.pl>
	<20250521101042.GC12514@pendragon.ideasonboard.com>
	<174784811736.14042.11404187248848039485@calcite>
Sender: khalasa@piap.pl
Date: Thu, 22 May 2025 14:18:34 +0200
Message-ID: <m3wma87s9x.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Paul Elder <paul.elder@ideasonboard.com> writes:

>> > Setting "2", the same input scene:
>> > 32E12400: 15h
>> > 32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943=
 13201 460522
>> > which sums to 518400 =3D 1920*1080/4.
>
> Yes, these look good (although I think you might've copy&pasted the wrong
> number for the sum)

Definitely :-)

> Oh? I would've expected 2^20-1 =3D 1048575 to be the magic number, but ok=
 I
> suppose the hardware caps at 1048559 instead. It probably overflowed and =
that's
> why the sum is so low.

I don't know. It seems it counts all right until reaching this magic
1048559 =3D 0xFFFEF. Then it stops at this value and stays there.

>> > 32E12400: Dh
>> > 32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922=
 400358 386695
>> > total =3D 2073600. But don't rely on it too much, the "1" has problems.
>
> That's interesting. My guess would be that in practice a divider of 1 wou=
ld
> still work as long as you make sure that it doesn't overflow. Maybe the u=
sage
> documentation was based on a rule-of-thumb.

I don't know. TBH I guess I haven't tested it with mainline kernel (and
RK1ISP driver), only with the NXP VVCAM driver. But with stepsize =3D 1
I was getting certain differences in total number of pixels (not big
ones and not always - maybe 10% of frames or so, or less). Without
reaching the magic value, I mean.

If if was simple cap at 1048559 we could correct it in software (up to
2 Mpixels) - there could only be one bin overflowing.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

