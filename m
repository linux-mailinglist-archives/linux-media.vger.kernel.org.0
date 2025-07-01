Return-Path: <linux-media+bounces-36389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA52AEF146
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 10:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6AE3AC9A0
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 08:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278E726AA85;
	Tue,  1 Jul 2025 08:35:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29232266F0D
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358903; cv=none; b=p7Fljy0xoOoyikbfXA75T+jCHEijB8alYENcY/6qu5ISpzxNQl+Etyn060702rSU7uEWL2QbkMKt++us+RgYx9981xKIvxz+quN3a/73GK0FGE8qYwq2lCB76jHp+BeDkbfn8eeE0YDxFF+Hj97+PrbyrMwkRI1YSdi8WbJtA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358903; c=relaxed/simple;
	bh=0xe8FGfrXDzC5wjnPnQaezc6X0eO0KIJ+XiANWs49w4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LAGqKJqJ+Aa22c5QsionBCnDJ+nXyB+Z9X4IFvjgCkTyZR3inrnHNvzStAEl99YueZ73LqntJgVmqLe3Q7gtBIxprTsmcimR7dB04R6aXrclXO/gyHwhC6iYgc9+j9sNanRmkU/ETGvYm/63rpVO3OC3pbbxWxQwZx81G6tykz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWS2-0000f8-Nt; Tue, 01 Jul 2025 10:34:50 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWS0-006F1A-37;
	Tue, 01 Jul 2025 10:34:48 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWWS0-0003VY-2v;
	Tue, 01 Jul 2025 10:34:48 +0200
Message-ID: <8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] media: platform: Add Renesas Input Video Control
 block driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Scally <dan.scally@ideasonboard.com>,
 linux-media@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 jacopo.mondi@ideasonboard.com,  biju.das.jz@bp.renesas.com
Date: Tue, 01 Jul 2025 10:34:48 +0200
In-Reply-To: <20250624-ivc-v2-2-e4ecdddb0a96@ideasonboard.com>
References: <20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com>
	 <20250624-ivc-v2-2-e4ecdddb0a96@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Di, 2025-06-24 at 13:35 +0100, Daniel Scally wrote:
> Add a driver for the Input Video Control block in an RZ/V2H SoC which
> feeds data into the Arm Mali-C55 ISP.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
>=20
> 	- Added selects and depends statements to Kconfig entry
> 	- Fixed copyright year
> 	- Stopped including in .c files headers already included in .h
> 	- Fixed uninitialized variable in iterator
> 	- Only check vvalid member in interrupt function and wait
> 	  unconditionally elsewhere
> 	- __maybe_unused for the PM ops
> 	- Initialise the subdevice after setting up PM
> 	- Fixed the remove function for the driver to actually do
> 	  something.
> 	- Some minor formatting changes
> 	- Fixed the quantization member for the format
> 	- Changes accounting for the v2 of the media jobs framework
> 	- Change min_queued_buffers to 0
> ---
>  drivers/media/platform/renesas/Kconfig             |   2 +
>  drivers/media/platform/renesas/Makefile            |   1 +
>  drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  15 +
>  drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 237 +++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 379 ++++++++++++
>  .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 678 +++++++++++++++=
++++++
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 133 ++++
>  8 files changed, 1450 insertions(+)
>=20
> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platf=
orm/renesas/Kconfig
> index 27a54fa7908384f2e8200f0f7283a82b0ae8435c..5462e524c3708be87a50dd80d=
4b4017a2466aa99 100644
> --- a/drivers/media/platform/renesas/Kconfig
> +++ b/drivers/media/platform/renesas/Kconfig
> @@ -42,6 +42,8 @@ config VIDEO_SH_VOU
>  source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>  source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>  source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
> +source "drivers/media/platform/renesas/rzv2h-ivc/Kconfig"
> +
> =20
>  # Mem2mem drivers
> =20
> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/plat=
form/renesas/Makefile
> index 1127259c09d6a51b70803e76c495918e06777f67..b6b4abf01db246aaf8269b802=
7efee9b0b32083a 100644
> --- a/drivers/media/platform/renesas/Makefile
> +++ b/drivers/media/platform/renesas/Makefile
> @@ -6,6 +6,7 @@
>  obj-y +=3D rcar-isp/
>  obj-y +=3D rcar-vin/
>  obj-y +=3D rzg2l-cru/
> +obj-y +=3D rzv2h-ivc/
>  obj-y +=3D vsp1/
> =20
>  obj-$(CONFIG_VIDEO_RCAR_CSI2) +=3D rcar-csi2.o
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/Kconfig b/drivers/m=
edia/platform/renesas/rzv2h-ivc/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..3df8ff585c36fe7c74e1eb040=
8b344cbc2b4d898
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_RZV2H_IVC
> +	tristate "Renesas RZ/V2H Input Video Control block driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on OF
> +	select VIDEOBUF2_DMA_CONTIG
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select RESET_CONTROLLER

There is no need to select RESET_CONTROLLER, the API has stubs to allow
compiling without it.

regards
Philipp

