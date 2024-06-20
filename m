Return-Path: <linux-media+bounces-13823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C291081C
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB4928259E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD31AE080;
	Thu, 20 Jun 2024 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3av3fyJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EAA1AD4B2;
	Thu, 20 Jun 2024 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893570; cv=none; b=ibddsNpZxYEYrFha3AMqVSZY1+yK5yf6Rjns9duTQEmuUNVWgEAMgbrocKlRV/rgA77Zq6818JgWYQ5Ej/yFMvjnohmdKvv3erlXB0AwZGbL1aR/0rv918Ko2CiD08H6W65soKhJ9LfPl3noGt6I8vEaf4Zj/0DRqCHn3yo2Rvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893570; c=relaxed/simple;
	bh=0/FfAt3cSYRx0NHA0nqVIaLGkcN+3itJkOw3CRTTXcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHmL92uY7Mrmd0w4LObZLhge7lclMb8Q7YvrU227zF4CikWgAhvkDAYpxXGmMavE7yHJda5Pmt+sQ4K9IeztSrH+h7yN7fh7QPDvlfhBdR7YGqGialjSQpkjWI5DxkI4OXQdpeT3Rv33fJlHr0Mchi8XhLgG1+7IhB51SPD17VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3av3fyJ8; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718893567;
	bh=0/FfAt3cSYRx0NHA0nqVIaLGkcN+3itJkOw3CRTTXcw=;
	h=From:To:Cc:Subject:Date:From;
	b=3av3fyJ8qpK83vb7XS+AGaXwQBHXIG10nU980ofHt7F9LVF2Hy6yHyhJzZLnGFwEM
	 8n8PLMhF9+6mD2MItdoiawBvntnqlYBljLsFlu8bznzfo0e2YNr2LRTTQAHby9zSYQ
	 k5Pn1sWlnPW+VIEGj6CAXgfB73Qy0Lcs6wWiaigCHOqFq+SBz2aulYLVHlY+TVgF/l
	 Zc6hiPUU6LuGcJh7ABTk4BCEgDGcVBjIYZtF9lDBho9Q9HjnDYxv9iBuXOSD3AMZiI
	 8Dx4mjz7nT1sXsudtboOi906aNj9X4x8mT20MIhMG+R1DwUSYraFkCb3fOPjeIqPfP
	 Fj2rfyJthY7JQ==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C90283782159;
	Thu, 20 Jun 2024 14:26:03 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alex Bee <knaerzche@gmail.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/4] media: rockchip: Add rkvdec2 driver
Date: Thu, 20 Jun 2024 10:19:42 -0400
Message-ID: <20240620142532.406564-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a rkvdec2 driver for newer video decoder found on rk3588 based SoC.

It is also found on other hardware like the RK356x, but not tested yet,
so it will be added later.

Support for yuv 4:2:2 and 10 bits streams will also be added later, when the
https://lore.kernel.org/linux-media/20240618194647.742037-1-jonas@kwiboo.se
patch set is merged.

The support for IOMMU will be added later as preliminary tests show that
the current rockchip iommu driver fails to allocate pages for the video
decoder iommu.

See the second commit message for more details.

Changes since v2:
- doc: Disable resets and sram for other platforms, add maxItems for
  clocks
- Fix h264 spec equation number in comment
- Remove superfluous status field in dtsi
- Add TODO item for IOMMU

Changes since v1:
- Add support for RCB in SRAM
- Move bindings to rockchip,vdec.yaml
- Add resets bindings
- Add second core and enable them from dtsi file
- Only expose one video device to userspace (but don't support multicore yet)
- Share CABAC table with rkvdec
- Fix iowrite32 call and add preliminary support for arm
- Remove unused code
- Improve registers naming and code style
- Remove DMA_ATTR_ALLOC_SINGLE_PAGES flag

Detlev Casanova (4):
  media: rockchip: Move H264 CABAC table to header file
  media: rockchip: Introduce the rkvdec2 driver
  media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
  arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)

 .../bindings/media/rockchip,vdec.yaml         |   55 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi     |   48 +
 drivers/staging/media/Kconfig                 |    1 +
 drivers/staging/media/Makefile                |    1 +
 .../staging/media/rkvdec/rkvdec-h264-cabac.h  |  509 +++++++
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  500 +------
 drivers/staging/media/rkvdec2/Kconfig         |   15 +
 drivers/staging/media/rkvdec2/Makefile        |    3 +
 drivers/staging/media/rkvdec2/TODO            |    9 +
 drivers/staging/media/rkvdec2/rkvdec2-h264.c  |  739 ++++++++++
 drivers/staging/media/rkvdec2/rkvdec2-regs.h  |  345 +++++
 drivers/staging/media/rkvdec2/rkvdec2.c       | 1253 +++++++++++++++++
 drivers/staging/media/rkvdec2/rkvdec2.h       |  130 ++
 13 files changed, 3109 insertions(+), 499 deletions(-)
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264-cabac.h
 create mode 100644 drivers/staging/media/rkvdec2/Kconfig
 create mode 100644 drivers/staging/media/rkvdec2/Makefile
 create mode 100644 drivers/staging/media/rkvdec2/TODO
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-h264.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2-regs.h
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.c
 create mode 100644 drivers/staging/media/rkvdec2/rkvdec2.h

-- 
2.44.2


