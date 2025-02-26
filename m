Return-Path: <linux-media+bounces-27058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 099CDA46446
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88EB0170AAE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9F122370C;
	Wed, 26 Feb 2025 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="YXfOOeOh"
X-Original-To: linux-media@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F919223329
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740582860; cv=none; b=iGdORfxKfl6GP0OpJ5HMgeDLK6hoTGh5lta8IxydoT4K7m6J3hhZdwfWKlNYbXNv7FCU5hnUpsAF2NaeLMbfjXCnfA3skD96xfCPsletsdEycxXRKvRCsQQQGwPdaSwTrRbqIDgTb+gtCB0XTR2IBI92Z/r4caFQkpZOZf+MHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740582860; c=relaxed/simple;
	bh=cqvBrG3ie58oNevi03YHgjZaOlLV0ON165ZblqwNnOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GkEFY9wcLFxeEhxr7CqpYrILsC9Bkf4+drYBwlP8LMtDDyPLnJiyoiAgqU8qPe2afbq/UE1c2pSA2Y1tiHHambC1CxD+lETXH0Ai8wY1HFS2toE5GoooczbZFWrJFrmqJMPEU5M0kG5FkTLtZV3gSfrrm+CXkxJc9P0CbtE+Tl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=YXfOOeOh; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1740582853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6kQbb0PLOfRfxhBJWSWjWCVR9AvSTbkkHB29xifIVyM=;
	b=YXfOOeOhPXiP8XxbTz7Vksn6vNnz/3+IGZ8Un2zM+V/NOt44UM00lgD4cYqwMKDhSSgDda
	o6A71UbWTysV+Om+XzX5R4b3ctGUz0Z2jSx2n+Lx9TMobIDZmlYWDJjEyrSRnTWb7tL21V
	CAe454MournGNCN3lI1U6sbqPqQab6eGDN9DPkIrsQOSjdLASSMz5s7J8zG3gizRisBToi
	H8zk4KWkeNhClDlEN6WhP4xqLEUymcYJ/fCdhQZlTFs16hLI06/W9VNhPz66KyJY9b3UPI
	ZcpfaBLUImADDXFiLuoi+t7HL5ZPdb4q6T5tSJ+LX4BlLE6Aj6OrwPDCSJ0Ozw==
Content-Type: multipart/signed;
 boundary=a7f4c90e99e2aac72da4a10f52bcd4b0a05ca7264a6152fe3a9c3f70b508;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 26 Feb 2025 16:14:02 +0100
Message-Id: <D82H4F6J4V4V.2BLHVUVD3BVX9@cknow.org>
Cc: <kernel@collabora.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, "Tim Surber" <me@timsurber.de>,
 "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>, "Diederik de Haas"
 <didi.debian@cknow.org>
Subject: Re: [PATCH v10 3/6] media: platform: synopsys: Add support for HDMI
 input driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Dmitry Osipenko" <dmitry.osipenko@collabora.com>, "Shreeya Patel"
 <shreeya.patel@collabora.com>, "Heiko Stuebner" <heiko@sntech.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <jose.abreu@synopsys.com>, <nelson.costa@synopsys.com>,
 <shawn.wen@rock-chips.com>, <nicolas.dufresne@collabora.com>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
 <20250225183058.607047-4-dmitry.osipenko@collabora.com>
In-Reply-To: <20250225183058.607047-4-dmitry.osipenko@collabora.com>
X-Migadu-Flow: FLOW_OUT

--a7f4c90e99e2aac72da4a10f52bcd4b0a05ca7264a6152fe3a9c3f70b508
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Feb 25, 2025 at 7:30 PM CET, Dmitry Osipenko wrote:
> From: Shreeya Patel <shreeya.patel@collabora.com>
>
> Add initial support for the Synopsys DesignWare HDMI RX
> Controller Driver used by Rockchip RK3588. The driver
> supports:
>  - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
>  - RGB888, YUV422, YUV444 and YCC420 pixel formats
>  - CEC
>  - EDID configuration
>
> The hardware also has Audio and HDCP capabilities, but these are
> not yet supported by the driver.
>
> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/synopsys/Kconfig       |    3 +
>  drivers/media/platform/synopsys/Makefile      |    2 +
>  .../media/platform/synopsys/hdmirx/Kconfig    |   27 +
>  .../media/platform/synopsys/hdmirx/Makefile   |    4 +
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2756 +++++++++++++++++
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
>  .../synopsys/hdmirx/snps_hdmirx_cec.c         |  284 ++
>  .../synopsys/hdmirx/snps_hdmirx_cec.h         |   44 +
>  10 files changed, 3516 insertions(+)
>  create mode 100644 drivers/media/platform/synopsys/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_ce=
c.c
>  create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_ce=
c.h
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
> index 85d2627776b6..9287faafdce5 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -85,6 +85,7 @@ source "drivers/media/platform/rockchip/Kconfig"
>  source "drivers/media/platform/samsung/Kconfig"
>  source "drivers/media/platform/st/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> +source "drivers/media/platform/synopsys/Kconfig"
>  source "drivers/media/platform/ti/Kconfig"
>  source "drivers/media/platform/verisilicon/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Mak=
efile
> index ace4e34483dd..6fd7db0541c7 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -28,6 +28,7 @@ obj-y +=3D rockchip/
>  obj-y +=3D samsung/
>  obj-y +=3D st/
>  obj-y +=3D sunxi/
> +obj-y +=3D synopsys/
>  obj-y +=3D ti/
>  obj-y +=3D verisilicon/
>  obj-y +=3D via/
> diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/plat=
form/synopsys/Kconfig
> new file mode 100644
> index 000000000000..4fd521f78425
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +source "drivers/media/platform/synopsys/hdmirx/Kconfig"
> diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/pla=
tform/synopsys/Makefile
> new file mode 100644
> index 000000000000..3b12c574dd67
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D hdmirx/
> diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/med=
ia/platform/synopsys/hdmirx/Kconfig
> new file mode 100644
> index 000000000000..3f96f6c97cf0
> --- /dev/null
> +++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_SYNOPSYS_HDMIRX
> +	tristate "Synopsys DesignWare HDMI Receiver driver"
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_DMA_CONTIG
> +	select CEC_CORE
> +	select CEC_NOTIFIER
> +	select HDMI
> +	help
> +	  Support for Synopsys HDMI HDMI RX Controller.
> +	  This driver supports HDMI 2.0 version.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called synopsys_hdmirx.
> +
> +config VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID
> +	bool "Load default EDID"
> +	depends on VIDEO_SYNOPSYS_HDMIRX
> +	help
> +	  Preload default EDID (Extended Display Identification Data).

I see some value in making explicit what you mean by EDID ...

> +	  EDID contains information about the capabilities of the display,
> +	  such as supported resolutions, refresh rates, and audio formats.

... I do not think a/this Kconfig needs to explain it.

> +
> +	  Enabling this option is recommended for a non-production use-cases.

My guess is that it could be useful for development/debugging/CI work
which possibly do not have an actual device (monitor) which provides
actual EDID data? Is CI work the reason why you (initially) enabled it
in the defconfig?
But when you have an actual monitor (=3Dproduction use-case?), you
(really) do not want it? Would it be harmless if 'still' enabled?

Thus a more extensive description what *this* Kconfig item does and why
and when I want to enable it or not, seems more useful to me.

Cheers,
  Diederik


--a7f4c90e99e2aac72da4a10f52bcd4b0a05ca7264a6152fe3a9c3f70b508
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ78vvgAKCRDXblvOeH7b
bgcOAQDqS73Snv/YiK3XuYu+04zVOsVyoTgZaPdwB1flqhS6PAD9HpydvFKnE7vj
pve5Zbq372uE+I1waffsJU9B6k2p2w0=
=lwwn
-----END PGP SIGNATURE-----

--a7f4c90e99e2aac72da4a10f52bcd4b0a05ca7264a6152fe3a9c3f70b508--

