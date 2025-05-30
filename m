Return-Path: <linux-media+bounces-33648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C38AC8C5E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 12:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13408A4077B
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 10:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DB5221DA6;
	Fri, 30 May 2025 10:48:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9991E1A31;
	Fri, 30 May 2025 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602131; cv=none; b=TO7pRmfRKhlGYbVYKZiMGVZ1ZZKxWpULuk0O/htgi4xiUy2Scpdip1g7kpEhyPgTiDrTvZM/FIBFn4bw1XDBcDuENPXqQqKC5NbGIkzej5xYuahVrYEwI8vEN9U6zLt/o5567Hzkx99tpzCWUwF2D84wzScYvqd97LB+VaFwPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602131; c=relaxed/simple;
	bh=UesS92bhejRVBi1FrU3ctF6c0bUMAZZJnak0MPJk3vc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dAebg4xaODaOmQ/Eul6oYieCCweQEKs1sHILe1GYD3ORill0WpUgNvzUyEZherKUy7mM1bGMWCxqjOxPjW4ur31kZzQgeoBIfvcX7qi1TckYuAQMyu9IlIPp/yrvfhP6HRi2OokY4rkeOfhuWjbO3roA7v4q5hM57B0UuZryOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id D12B4C405A45;
	Fri, 30 May 2025 12:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl D12B4C405A45
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Xavier Roumegue <xavier.roumegue@oss.nxp.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva <rmfrfs@gmail.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <2fd6wgsiwfx4raharcrpmmtayhkipjnz64u2cbprhsxkna3lhv@yshftexhmgns>
	(Jacopo Mondi's message of "Fri, 30 May 2025 09:56:32 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
	<jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
	<m3o6vb64hv.fsf@t19.piap.pl>
	<2fd6wgsiwfx4raharcrpmmtayhkipjnz64u2cbprhsxkna3lhv@yshftexhmgns>
Sender: khalasa@piap.pl
Date: Fri, 30 May 2025 12:48:38 +0200
Message-ID: <m3frgm5q7t.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jacopo,

> Let me recap all of this.
>
> With:
>
> - MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
>  "Select Interleave mode" =3D 0x00 =3D CH0 only, no data interleave
>
> - MIPI_CSIx_ISP_CONFIGn[7:2]
>   "Image Data Format" =3D 0x2c =3D RAW12
>
> Embedded data and OB pixels are filtered (which means we're filtering
> on DT even if MIPI_CSIx_CSIS_COMMON_CTRL[11:10] =3D 0x0x would suggest
> filtering is not enabled)
>
> However corrupted pixels are still sent through.

Right.

But there is more: there are 3 separate "DT filters":

0x32E40040       0xB0 ISP Configuration Register (ISP_CONFIG_CH0)
   DT 2Ch (RAW12)
0x32E40044  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH0) =3D> 128=
0 * 720

0x32E40050       0xDC ISP Configuration Register (ISP_CONFIG_CH1)
   DT 37h (User Defined 8-bit Data Type 8)
0x32E40054  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH1) =3D> 128=
0 * 720

0x32E40060       0x48 ISP Configuration Register (ISP_CONFIG_CH2)
   DT 12h (Embedded 8-bit non Image Data)
0x32E40064  0x2D00500 ISP Resolution Register (ISP_RESOLUTION_CH2) =3D> 128=
0 * 720

The 4th set looks the same, but doesn't appear to have its SHADOW
register set, so I'll ignore it for now. I'm ignoring the SYNC registers
as well (offsets ...0x58) - they are zeroed.

It appears the 2 LS bits of ISP_CONFIG_CH* are the number of some output
port. #0 goes to ISP, not sure about the others. Will have a look.

I.e., I can disable CH0 and use CH1 or CH2 to feed image data do ISP -
it works.

MIPI_CSIx_CSIS_COMMON_CTRL:
Bits 18, 17 and 16 respectively reload SHADOW registers for CH2, CH1 and
CH0. For these tests, I have to use
"devmem write 32-bit CSIS_COMMON_CTRL 0x7xxxx" instead of 0x1xxxx so that
all 3 shadow sets are updated (and not only #0, the one in the docs and
used by the drivers).

0x32E40080       0xB0 Shadow Configuration Register (SHADOW_CONFIG_CH0)
   DT 2Ch (RAW12)
0x32E40084  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH0) =
=3D> 1280 * 720
0x32E40090       0xDC Shadow Configuration Register (SHADOW_CONFIG_CH1)
   DT 37h (User Defined 8-bit Data Type 8)
0x32E40094  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH1) =
=3D> 1280 * 720
0x32E400A0       0x48 Shadow Configuration Register (SHADOW_CONFIG_CH2)
   DT 12h (Embedded 8-bit non Image Data)
0x32E400A4  0x2D00500 Shadow Resolution Register (SHADOW_RESOLUTION_CH2) =
=3D> 1280 * 720

Also:
0x32E40100     0x5F10 Frame Counter (FRAME_COUNTER_CH0)
0x32E40104     0x57C4 Frame Counter (FRAME_COUNTER_CH1)
0x32E40108     0x33CF Frame Counter (FRAME_COUNTER_CH2)

Data selected by all 3 sets is somehow fed to the ISP. Now the data
isn't simply appended to the previous fragment. It seems the DT 37h
lines (which appear before the actual image data on the MIPI bus)
somehow overwrite (only) the first line of the image. I'm looking at
it.

INTERLEAVE_MODE =3D 0 or 2 =3D> only CH0 is used, the first 32 bit in the i=
mage
		on CSI1 are corrupted.
INTERLEAVE_MODE =3D 1 =3D> all 3 CHannels are used, no corruption

There appear to be some subtle differences between 0 and 2, and 1 vs 3.

> If you
>
> - MIPI_CSIx_CSIS_COMMON_CTRL[11:10]
>  "Select Interleave mode" =3D 0x01 =3D DT (Data type) only
>
> Embedded data and OB pixels are still filtered, and your corrupt
> pixels are filtered as well.

Right.

> Now, why are "corrupted pixels" filtered away by enabling this option ?
>
> As far as I understand bad pixels are corrupt in their data values,
> the CSI-2 packet header which contains the DT is correct. Is my
> understanding correct ?

I think so. Maybe the corruption happens after the packets are received,
on the 32-bit internal bus maybe.

> It would be nice to actually understand what it does before enabling
> it unconditionally.

Still trying :-) Next Monday, maybe.

Especially I don't know how do I receive multiple DT types, including
12-bit RAW pixels and 8-bit user data. I know it wasn't probably
designed for this, but nevertheless.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

