Return-Path: <linux-media+bounces-33243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69384AC2071
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41AD1C0536F
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF5D2288EE;
	Fri, 23 May 2025 09:58:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B26238179;
	Fri, 23 May 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994308; cv=none; b=Y180Nsx5vBWY+Zvpmo6f20aFUskP4s7KHvTt1C2SVNYn3qssdEUCgSFdLwD56h69LTQfrcvtWIJ89XEzhx0UMtuRHkKUJE05IVVBHuyUzRdb+z6K5esAKIMmNsFB/tqhAIPhDboWcXa1JfLZKjsGdxm8WGWay7/B0lOrQKAmI9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994308; c=relaxed/simple;
	bh=08fg3jpSPJOEN6w8dbd543RIPo/ty5tra/UHgFDBq9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jvILEnWifyAcoRu0TyJP3NRQwedSTYzDjG0P2jVCY6LS1KJREjE97pJ3NRAgksd1BydX/SGHbtZne/wkxOKiexclqi13yEFeALdMDdUYXswlgxaeUVjcfeiIDsC8B7rFhx8L9HnCWb5yJiUkUZ69KEAsg/NPXv/clQqXNEWjW4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 9A651C405A4C;
	Fri, 23 May 2025 11:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 9A651C405A4C
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Martin Kepplinger <martink@posteo.de>,  Purism Kernel
 Team <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <m31psg97dy.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Thu, 22 May 2025 14:06:49 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Fri, 23 May 2025 11:58:23 +0200
Message-ID: <m3plfz7io0.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I wrote:

> This produces (test_pattern=3D5 which starts with black, using ISP):
> Y =3D  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00...
> UV =3D 80 80 80 80  80 80 80 80  80 80 80 80  80 80 80 80...
>
> Now I do (perhaps I should revert the patch instead):
> ./devmem write32 0x32E50004 0x14305
>
> and this does (=3D without DT filtering):
> Y =3D  E6 FF 36 1B  00 00 00 00  00 00 00 00  00 00 00 00...
> UV =3D 85 6A 74 B4  7D 8C 80 80  80 80 80 80  80 80 80 80...

The corruption is visible in ISP RAW-12 mode as well: CSI2 + ISP2 without
DT filtering: IMX462 test patterns, Linux v6.14, 1280x720p25.

Only 3 first 16-bit (12-bit on MIPI) RGGB values in each frame are
changed (bits 3-0 of the third pixel aren't changed).

32EC0060h          0 Gasket 0 output disabled
32EC0090h          0 Gasket 1 output disabled
32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
      ISP ID mode 0, ISP1: DT 0, ISP2: DT 2Ch (RAW12) left-just mode

32E50040h        B0h ISP Configuration Register (MIPI_CSIS_ISPCONFIG_CH0)
      DT 2Ch (RAW12)

pattern 1:   0 800   0 2AB changed into 2AA B02 B00 2AB
pattern 2 and 3: FFF FFF FFF FFF... not altered at all
pattern 4: 501 501 4C2 4C2 changed into FFF 7FF 7F2 4C2
pattern 5:   0   0   0   0 changed into 7EF FF7 FF0   0
pattern 6:   0   1   0 101 changed into FFF FFF FF0 101
pattern 7:   0 2AB   0 2AB changed into BAA BAB BA0 2AB

RAW-12 on MIPI goes like this:
 lane0    lane1   lane2 7:4   lane2 3:0   lane3
----------- MIPI Header (all 4 lanes) ----------
P1-11:4  P2-11:4    P1-3:0      P2-3:0   P3-11:4
P4-11:4  ...

This means all the changed values are located in the first 4 bytes after
the packet header (i.e., in the first byte after the header for each
lane). Which IMHO smells like a hardware bug - especially given the
problem manifests itself only on CSI2 (+ISP2, I haven't tried using
ISI).

Fortunately enabling DT filtering fixes it.

I remember I was getting a bit different results on, I believe, the
NXP's 5.15 kernels (with their =3D Verisilicon VVCam driver). Instead of
simply changing the first 32 bits of the MIPI payload, the rest of the
RGGB data was shifted a couple of pixels or so.


Now, what do we do with it?
Is anybody able to verify the CSIC version register value on i.MX8MM?
Something like devmem read32 0x32E50000 (or 0x32E40000 for CSI1) WHILE
RUNNING CAPTURE on that very CSI would do the trick (using your
favorite instance of devmem/devmem2/etc). Alternatively one could add
a debug printk to the csic module.

And: is anybody able to check if the DT filtering works on i.MX8MM
(=3D if my patch doesn't break it on 8MM)?

Alternatively I guess we can add MIPI_CSIS_V3_6_3_1 for 8MP only.

Anybody using i.MX8MM with ISP2 + CSI2 BTW? Is the corruption there as
well? I understand it may be hard to spot, it's (usually a bright) dot
in the left top corner.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

