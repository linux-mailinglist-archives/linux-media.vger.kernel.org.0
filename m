Return-Path: <linux-media+bounces-5409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A7859E98
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 09:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C951C21364
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 08:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9E21370;
	Mon, 19 Feb 2024 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="azoAV0SX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E1920DED;
	Mon, 19 Feb 2024 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708332157; cv=none; b=jVDaBHmIsFQv2dVqZy+xIGc7LD9LrejZXLeQNikHbJn3yZ9YBd7d8S+cxGv0rbrgRKQjxxCuV8A4ULDQ8kPyFAGhR9jvzJRzhF9zuIFcHVCgbMUGEDLz1uZBQDR86CjmEdv5bQIp+2R6j9Q3KV8ja2Ma6FwkIuC89eWlyZ4tD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708332157; c=relaxed/simple;
	bh=dvOFgjHNK432ujMqvQ81GKNPxgY0ga9ZOsPY3V9qfOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsit8Z8hSVBKTYKHDSER4LBN9My4UtzXq66xP6VR1Jg9da+5AEpCPIDeY7s+4GmLqg7ZstA50Jlg6tYinUdhxIb0FyQVVDVSoTwoBrsb7XscXqEhw5P3kNUytd1NNoMCUYlUSZSO4g2TCg3FKNFGv/+h6NuV5rIaFLu0M9BXRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=azoAV0SX; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708332153; x=1739868153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b3pLRSvlRNkx4QVYyNlxFS5vrERzFzUE1laQUlHC0YI=;
  b=azoAV0SXybqSPXx52xrsjlsd7KLJv33Jpu+NX7LUF79+E539ESxfB3BO
   +6Butey4AWfgzD5PUsfKsXMuThWI2YpnmzIMnx/XsUhDzYP747EQicvxi
   Qcb0KfiRdlQPp+IfGWxPWesQPYqmk0+jOQxcFjX+nPmoYuhAAV49wmUzy
   eE65oFmwS1TfTG4ki610tudqsEgQjVX/ISwqsiF6ghskQoupyIqz29LnR
   TxVj0fYjJvHoP78v8EW+BatcEWDY6TT4nBpEHEWhI/3PeDM+wlsNuFFJn
   bodumCJmI8kX+lH2f5WZq6KQgrtiwfkKDp1xkmM5vmpRnXYbW3YysC0o/
   g==;
X-IronPort-AV: E=Sophos;i="6.06,170,1705359600"; 
   d="scan'208";a="35468937"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Feb 2024 09:42:25 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BD1E7280075;
	Mon, 19 Feb 2024 09:42:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Helen Koike <helen.koike@collabora.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Elder <paul.elder@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 00/12] media: rkisp1: Add support for i.MX8MP
Date: Mon, 19 Feb 2024 09:42:27 +0100
Message-ID: <6019598.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
References: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

thanks for the update.

Am Sonntag, 18. Februar 2024, 21:43:38 CET schrieb Laurent Pinchart:
> Hello,
>=20
> This series extends the rkisp1 driver to support the ISP found in the
> NXP i.MX8MP SoC.
>=20
> The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
> and in the NXP i.MX8MP have the same origin, and have slightly diverged
> over time as they are now independently developed (afaik) by Rockchip
> and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> and is close enough to the RK3399 ISP that it can easily be supported by
> the same driver.
>=20
> This version of the series specifically has been tested on a Polyhex
> Debix model A with an IMX219 camera sensor (Raspberry Pi cam v2).
>=20
> See individual patches for a detailed description of changes compared to
> v12.
>=20
> This should hopefully be the last version, I plan to send a pull request
> in a few days, in time for v6.9.

Still works on my platform TQMa8MPQL/MBa8MPxL + IMX327 using libcamera for =
1080p + SRGGB10 debayering. For the missing commits:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Laurent Pinchart (2):
>   media: rkisp1: Add and use rkisp1_has_feature() macro
>   media: rkisp1: Configure gasket on i.MX8MP
>=20
> Paul Elder (10):
>   media: rkisp1: Support setting memory stride for main path
>   media: rkisp1: Support devices lacking self path
>   media: rkisp1: Support devices lacking dual crop
>   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
>   media: rkisp1: Add version enum for i.MX8MP ISP
>   media: rkisp1: Support i.MX8MP's 34-bit DMA
>   media: rkisp1: Add YC swap capability
>   media: rkisp1: Add UYVY as an output format
>   media: rkisp1: Fix endianness on raw streams on i.MX8MP
>   media: rkisp1: Add match data for i.MX8MP ISP
>=20
>  .../bindings/media/rockchip-isp1.yaml         |  37 +++-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 180 ++++++++++++++----
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 +++-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  71 ++++++-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 ++++++++++++-
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  35 ++++
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  19 +-
>  include/uapi/linux/rkisp1-config.h            |  50 ++---
>  8 files changed, 472 insertions(+), 86 deletions(-)
>=20
>=20
> base-commit: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



