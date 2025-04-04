Return-Path: <linux-media+bounces-29389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70AA7BD23
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 243D8179B53
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF391E47DD;
	Fri,  4 Apr 2025 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NaWdRVDY"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D3131E49;
	Fri,  4 Apr 2025 13:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771877; cv=none; b=hDdkeX5mjVVH0Iz+cRaG7zjHz+S3Jffvifp+gUumVZUBaOndhN6V7UTM/blAzuB6sG96RStrkECOAH4XgkuQU+yzrjtEhC33V12CF3EArROzrf25sv2hMwqeE2UYZ+MgwJfWFgD57Q72zP5ElhWQfjL3up4/793P+onZ78zI5Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771877; c=relaxed/simple;
	bh=TIcjc1PX8pfAkNsgoaStOmZ/+4vUoGQm2eg6A6tJemo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gSEk6sFZujkdtvWU//JmLqdJqgYW8wXjokYingPEdlFrFeb703YyOqENRmDIDRYnB0ZzjjRHBdcDHVubC4+/uAoK8nIPAEyprfOK8+fj69irv0zxJHLmbjkU1RMqYR5agnR8gfo+i7/EsDo/qbspiYy4TiJmM23XrSLQQeS275I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NaWdRVDY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743771872;
	bh=TIcjc1PX8pfAkNsgoaStOmZ/+4vUoGQm2eg6A6tJemo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NaWdRVDYZHg/mewcsLnGzD/wrMPXR0kdn5WulVc85HU/8FeJSnDYQ948Li+qTaq2q
	 /tX9+iJYNOuD6T/YqFfTWWBvEyKEBqetQqXyzbWlb9xSmLGowI06MBw4hdnDr8lemf
	 kKu0rts181MpqI+gqe2QavDGbE94vJpbXrhFf31X5oi9WvOAa1BcV/un094saA9Zr+
	 PnIFGCxe9eUf9hW4RMcdrUShfLkMTvxpe4Yn5x96ocDEMX26Kkd69Eue+ZFiHyJ4cy
	 TUuzDXFzNV3mSfAz06E2toLG9juqNHbV1qUJBwS67/9id8F3DCEqpZgoBdB+MVxst1
	 n9JiQTr0QAlOA==
Received: from apertis-1.home (2a01cb0892f2D600c8f85Cf092d4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AB7A17E00AC;
	Fri,  4 Apr 2025 15:04:32 +0200 (CEST)
Message-ID: <8342b2562be8dda51decdb32b47af308d1d9fab5.camel@collabora.com>
Subject: Re: [PATCH v1 1/1] media: i2c: max9671x: Remove (explicitly) unused
 header
From: Julien Massot <julien.massot@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sakari Ailus
	 <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 04 Apr 2025 15:04:31 +0200
In-Reply-To: <20250331072707.3988687-1-andriy.shevchenko@linux.intel.com>
References: <20250331072707.3988687-1-andriy.shevchenko@linux.intel.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Thanks for your patch
On Mon, 2025-03-31 at 10:27 +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
>=20
> Note, that fwnode API for drivers is provided in property.h
> which is included here.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> =C2=A0drivers/media/i2c/max96714.c | 2 +-
> =C2=A0drivers/media/i2c/max96717.c | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
> index 159753b13777..3cc1b1ae47d1 100644
> --- a/drivers/media/i2c/max96714.c
> +++ b/drivers/media/i2c/max96714.c
> @@ -7,11 +7,11 @@
> =C2=A0
> =C2=A0#include <linux/bitfield.h>
> =C2=A0#include <linux/bitops.h>
> -#include <linux/fwnode.h>
> =C2=A0#include <linux/gpio/consumer.h>
> =C2=A0#include <linux/i2c.h>
> =C2=A0#include <linux/i2c-mux.h>
> =C2=A0#include <linux/module.h>
> +#include <linux/property.h>
> =C2=A0#include <linux/regmap.h>
> =C2=A0#include <linux/regulator/consumer.h>
> =C2=A0
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 30c5ca0e817a..23fb7e67d1a4 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -9,10 +9,10 @@
> =C2=A0#include <linux/clk.h>
> =C2=A0#include <linux/clk-provider.h>
> =C2=A0#include <linux/delay.h>
> -#include <linux/fwnode.h>
> =C2=A0#include <linux/gpio/driver.h>
> =C2=A0#include <linux/i2c-mux.h>
> =C2=A0#include <linux/i2c.h>
> +#include <linux/property.h>
> =C2=A0#include <linux/regmap.h>
> =C2=A0
> =C2=A0#include <media/v4l2-cci.h>
>=20

Reviewed-by: Julien Massot <julien.massot@collabora.com>

Julien


