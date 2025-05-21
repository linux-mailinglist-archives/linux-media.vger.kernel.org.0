Return-Path: <linux-media+bounces-33048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99964ABFC2D
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 437B3164126
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964FF28313D;
	Wed, 21 May 2025 17:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pByxq+tI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E200427CB0D;
	Wed, 21 May 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848125; cv=none; b=nYw0aIG42rq5wHk4NcQH524j6FR6hdHYqnpHBXVDE3ByeDuSBdtbjdC5eHCjcWUgWPgov3nj4bzhSfdBYEYgGixp4lK80TizJsea9EO29dUDla8EzDEKRbNN3mbCs5zaxdEROm7Qmh9CIGj1QsHDwbXCXW2PFjd1sS2sBZsEPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848125; c=relaxed/simple;
	bh=csyzNJFw2AJbiYzZTyQmczuu5qmI9+cCAk3tKlVGbO4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=S9f0u8fBu2sg6AKbObN/F2NFz6mVM+tcHA1aTQ5tADKqYuuNPUrN4SIjabYeWpN95YaYp3qCMIpnWWJCd7dA4MVkmU3JZprXJO6H1tGHyK/LMsbzp1KZYkA137uzK+vxuoTu2l55zMBmWYx3lsxDbJue9LLFRWeWMMRdEBw1ySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pByxq+tI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [149.232.183.6])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A85E6AF;
	Wed, 21 May 2025 19:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747848099;
	bh=csyzNJFw2AJbiYzZTyQmczuu5qmI9+cCAk3tKlVGbO4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pByxq+tIPg46n1qPJ6LmSM8c5WKJkN+6ETZzJKOonsewR31ZIPoIs1hS8YI/9wMpI
	 tng2HCQsu5YDGac8ZY20mpRxQdsyPWzrZNaoLYbFjTF0w/ONJljNELajhAETM5AGVW
	 sgJ8JBrSXY76rZLmiiu2RNzom59ew1RVkj8uXt3I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521101042.GC12514@pendragon.ideasonboard.com>
References: <m3tt5u9q7h.fsf@t19.piap.pl> <aB31Eg6oRpcHHEsb@pyrite.rasen.tech> <m3jz6b8lb1.fsf@t19.piap.pl> <20250521101042.GC12514@pendragon.ideasonboard.com>
Subject: Re: [PATCH] RKISP1: correct histogram window size
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stefan.klug@ideasonboard.com
To: Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 21 May 2025 19:21:57 +0200
Message-ID: <174784811736.14042.11404187248848039485@calcite>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2025-05-21 12:10:42)
> On Tue, May 20, 2025 at 03:26:58PM +0200, Krzysztof Ha=C5=82asa wrote:
> > Paul Elder <paul.elder@ideasonboard.com> writes:
> >=20
> > >> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> > >> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> > >> HIST_STEPSIZE =3D 3 (lowest permitted):
> > >
> > > According to the datasheet, the histogram bins are 16-bit integer wit=
h a
> > > 4-bit fractional part. To prevent overflowing the 16-bit integer
> > > counter, the step size should be 10.
>=20
> That would be for combined RGB mode, as every pixel is accounted for
> three times in that mode. In other modes, a step size of 8 should be
> fine.

Ah, right.

>=20
> > >
> > > Do you have any other information on this? Is it known that it's stab=
le
> > > and consistent to use all 20 bits anyway?
>=20
> The documentation states that the width of the bin counter registers is
> 20 bits wide including a 4-bit fractional part, and that the software
> should use only the upper 16 bits of the bin counters. The fractional
> part is caused by the weights. There's a corresponding todo comment in
> libcamera:
>=20
>         ...
>          *
>          * \todo Take into account weights. That is, if the weights are l=
ow
>          * enough we can potentially reduce the predivider to increase
>          * precision. This needs some investigation however, as this hard=
ware
>          * behavior is undocumented and is only an educated guess.
>          */
>         int count =3D mode =3D=3D RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBI=
NED ? 3 : 1;
>         double factor =3D size.width * size.height * count / 65536.0;
>         double root =3D std::sqrt(factor);
>         uint8_t predivider =3D static_cast<uint8_t>(std::ceil(root));
>=20
>         return std::clamp<uint8_t>(predivider, 3, 127);
>=20
> libcamera sets the default weights to 1, and discards the 4 fractional
> bits. It seems that the=20

(what did you mean to finish saying...?)

>=20
> I expect that each pixel contributes to its bin by adding the weight
> value corresponding to its zone. Setting all weights to 1, I would
> expect that the 4 fractional bits could be used to increase the bin size
> to 1048575 pixels (20 bits), and therefore decrease the predivider from
> 10 to 3.

True. I suppose if all the weights are 1 then we can squeeze out more bit
precision then. But that's a todo for libcamera.

>=20
> > Interesting. I only have those mrv_*.h files which come with
> > isp-imx-4.2.2.* package(s). Here we have (among others):
> >=20
> > /*! Register: isp_hist_prop: Histogram properties (0x00000000)*/
> > /*! Slice: stepsize:*/
> > /*! histogram predivider, process every (stepsize)th pixel, all other p=
ixels are skipped */
> > /* 0,1,2: not allowed */
> > /* 3: process every third input pixel */
> > /* 4: process every fourth input pixel */
> > /* ...*/
> > /* 7FH: process every 127th pixel */
> > #define MRV_HIST_STEPSIZE_MASK 0x000003F8
> > #define MRV_HIST_STEPSIZE_SHIFT 3
> >=20
> > In case of my IMX290 1920x1080 sensor, 1 doesn't work well (it stops
> > counting before reaching $((1920x1080)) in each bin, and even if no bin
> > reaches this magic value, the total count may be invalid (not equal to
> > the number of pixels). IIRC, 2 worked well. Maybe with higher
> > resolutions, I don't know.
> >=20
> > I'm currently using "3" per the .h file:
> > isp_hist_prop:
> > 32E12400: 1Dh
> > histogram_measurement_result:
> > 32E12414: 0 0 1 1004 569 476 633 1197 2373 2212 1923 2945 3632 3025 582=
1 204589
> > which sums to 518400 =3D 1920*1080/9.
> >=20
> > Setting "2", the same input scene:
> > 32E12400: 15h
> > 32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943 =
13201 460522
> > which sums to 518400 =3D 1920*1080/4.

Yes, these look good (although I think you might've copy&pasted the wrong
number for the sum)

> >=20
> > Setting "1", the same input scene:
> > 32E12400: Dh
> > 32E12414: 0 0 25 9046 4924 4317 5435 10655 20781 18965 16051 24716 3268=
1 28368 54301 1048559
> > which sums to 1278824 which is rather less than 2073600.
> > The last number (1048559) is the magic one, no bin can go higher. Less =
lights and:

Oh? I would've expected 2^20-1 =3D 1048575 to be the magic number, but ok I
suppose the hardware caps at 1048559 instead. It probably overflowed and th=
at's
why the sum is so low.

> > 32E12400: Dh
> > 32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922 =
400358 386695
> > total =3D 2073600. But don't rely on it too much, the "1" has problems.

That's interesting. My guess would be that in practice a divider of 1 would
still work as long as you make sure that it doesn't overflow. Maybe the usa=
ge
documentation was based on a rule-of-thumb.

> >=20
> > In short, those are integer values. One may use them as fractionals with
> > some clever step size, I guess.
> >=20
> > >> isp_hist_h_size: 383 (=3D 1920 / 5 - 1)
> > >> isp_hist_v_size: 215 (=3D 1080 / 5 - 1)
> > >> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 2=
29401
> > >>
> > >> Apparently the histogram is missing the last column (3-pixel wide,
> > >> though only single pixels count) and the last (same idea) row
> > >> of the input image: 1917 * 1077 / 3 / 3 =3D 229401
> > >
> > > I don't quite understand this. With a sub-window width of
> > > 1920 / 5 - 1 =3D 383, shouldn't the resulting total window width be
> > > 383 * 5 =3D 1915? Same idea for the height.
> >=20
> > It would, but the stepsize =3D 3 makes it ignore only the last one
> > - i.e., normally the counted ones are 0, 3, ... 1914, 1917 (which makes
> > 1920/3) and with 383, it ends at 1914, thus only 3 pixels (1 really,
> > instead of 2) are missing from calculations (not 5). I guess the same
> > vertically, 1080 divides / 3 and 1075 doesn't.

Ah ok, I see. Thanks for the clarification.

> >=20
> > > The fix looks fine though. Although, I'm wondering if there's a reason
> > > why there was a -1 in the first place. Does anybody know?
> >=20
> > There is slight chance it's different on some other SoC, but I would be
> > surprised.
>=20
> The documented constraint is
>=20
>     hist_h_offset + hist_h_size x 5 should be less than or equal to the
>     horizontal size of the picture.
>=20
> (and similar for the vertical direction). The initial -1 seems to be a
> bug.

Ok.

Looks go to me.

Reviewed-by: Paul ELder <paul.elder@ideasonboard.com>

