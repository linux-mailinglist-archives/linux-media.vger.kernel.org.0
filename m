Return-Path: <linux-media+bounces-33605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25ACAC7AF9
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 11:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAF787A564B
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 09:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECFF21C9E5;
	Thu, 29 May 2025 09:25:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AC219302;
	Thu, 29 May 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510722; cv=none; b=EsFv9QsCsKvqx0TuxbPwqJ7LJRfzdFwmEMsAIl1KjyX/kI8A/MYO+hKXMxcytLz04LITVooMlCnL+iRwFj+CNn53nFZZuTzdOdyul7QVjgtJi23DZCrVHlytN0/2v91PShzHIE8tlRgqq95WoqZhGuOR9WoXcpK8AzzjDCoIv3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510722; c=relaxed/simple;
	bh=9c2gFsqymeTMgjQSpuDxPYXz1vt/sj891vlHdiB3At8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fM3qFJhBfU7uc/F+TbxzgsCcwyl/Y6/rxH9Td1uVGV8g54Zy954YXe+4pjmmfagWolXeqYWONsP+LKk4VJe1EokgPuA6xqyei2AD/SHsQze4DhYj3R7s1RTm+nZxcwDzRZ1v61YPFKGwjC5iWGLgrLCaHEN/ci8tElsmhMXw4eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id CC1DBC3EEAC9;
	Thu, 29 May 2025 11:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl CC1DBC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva <rmfrfs@gmail.com>,
  Martin Kepplinger <martink@posteo.de>,  Purism Kernel Team
 <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  <linux-media@vger.kernel.org>,
  <imx@lists.linux.dev>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <65670a02-e217-4d0f-955d-d13ca0240819@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?=
	Szymanski"'s message of "Fri, 23 May 2025 17:34:01 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl> <m3plfz7io0.fsf@t19.piap.pl>
	<65670a02-e217-4d0f-955d-d13ca0240819@armadeus.com>
Sender: khalasa@piap.pl
Date: Thu, 29 May 2025 11:25:08 +0200
Message-ID: <m3v7pj6a6j.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi S=C3=A9bastien,

S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

> On i.MX8MM mipi_csi is at 32e30000. NXP kernel (6.12.3) with ov5640 camer=
a:
>
> # devmem 0x32E30000 32
> 0x03060301

Thanks a lot. So at least the version register is the same as on
i.MX8MP.
I wonder if you could test if the CSIC possibly supports filtering by
DT.

How would such a test be performed?

Maybe: while streaming (otherwise the system may lock up):

I assume 'devmem 0x32E30004 32' shows 0x4305.
# devmem 0x32E30004 32 0x14705

and:
- does it change anything? If the streaming stops, you may try
  restarting and writing with devmem again - writing to this register
  directly frequently stops streaming on my 8MP.

- what does the register contain after write?

- you may also try:
  # devmem 0x32E30004 32 0xfffffffd
  # devmem 0x32E30004 32

On i.MX8MP the above returns:
# ./devmem write32 0x32Ex0004 0xfffffffd
# ./devmem read32 0x32Ex0004
0x0000FF05
(and the streaming still works, usually).

The above is not a very good test, I admit, but it may show 8MM really
doesn't have those/that bit.

TIA.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

