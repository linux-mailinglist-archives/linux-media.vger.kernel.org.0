Return-Path: <linux-media+bounces-28746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C30EA70C1A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E7E1673EF
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E82B266B55;
	Tue, 25 Mar 2025 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lRKqKZyB"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6E01DB154;
	Tue, 25 Mar 2025 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938397; cv=none; b=tKny5jJMW5eLyNEQHQcKxVk0k+cTCVIXaFVsjOIwZ1t/Kfhg+Cq8WGfMbW48q1+P7yET5i2Q53lYJK6TlB5WdqntrJoUY+39NFlpPeG3xXlBPwcXTW9heDx1k/oy79mv851EpEmoLgN0fUTsgF3CNsKiyziDbpgfdC9VSf1VuUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938397; c=relaxed/simple;
	bh=8NRPCHR6JNw369gLermxb0yx+vv0DC6gM487kHYtqlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOPadfJcVLdv61bQeCpqP7Pz9n2MfoZoiOauYOq/OFqZen8Dfmzd5XzrlyJwvRgDVzFPYBsT+Vp/Sw/sfBsJXLl5Y7hWGkyiw+UAPlUiKpsE6IMLlGl6DIVDJKqJqEbZHfrpsihmS+r5Dx0GwQq0QseHrhnA7wb+o8O8s1KApmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lRKqKZyB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938393;
	bh=8NRPCHR6JNw369gLermxb0yx+vv0DC6gM487kHYtqlk=;
	h=From:To:Cc:Subject:Date:From;
	b=lRKqKZyBfdIpiAdYDEHHRp99ohsi2LRzkt86NuZc3zI6pKFL/7d5jJFyBeUQJGVvf
	 vSIdiSoa7padRTxzqbWVAq40AH5CuytZiAFMSUlJhnxx0laua3hMDRVfCMkkDO7Jwl
	 N7J+fIPW0owpoK2FZom6WjCOjNJql3KW/EmDPnEkwwrrXlcN5AEwPQp+dPS8i723Pf
	 IiGp0zeU/C32jZip+0sBTF2q6BYgsbLke0SdmRsXKJ+VG+TZRRgv6TdPLlZWB1HG07
	 wl+jS1xy6i5MFjdco64pOgUQOrghKtujFgnqRaqf+AdqrXq5OTDibvG0j+6WKuQ5Vt
	 fUaYp8UYroQOg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87C2D17E0865;
	Tue, 25 Mar 2025 22:33:09 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 0/6] media: rockchip: Add rkvdec2 driver
Date: Tue, 25 Mar 2025 17:22:16 -0400
Message-ID: <20250325213303.826925-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
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

It only supports h264 format only for now, hevc will come later.
Yuv420 and yuv422 are both supported. 8 and 10 bits format are also
supported.
The NV15 and NV20 pixel formats are supported in v4l2 with the first
patch of this series. It has been picked up from [1].

The driver supports using the IOMMU through the rockchip IOMMU driver.
Because the IOMMU HW will be resetted in case of a decoding error, the
IOMMU mappings are rewritten on the HW by switching to an empty IOMMU
domain, then switching back to the default one.
This is one of the ways that has been recommended in [2].

[1]: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_422_support-v7-2-7992a68a4910@collabora.com/
[2]: https://lore.kernel.org/all/9bd56bd6-ce7d-495f-9bb3-ce7f07975f62@arm.com/

Changes since v3:
- Add IOMMU support
- Add 4:2:2 and 10 bits support
- Move cabac to v4l2 header
- Imported improvements from [1]
- Improve timeout value computation
- Improve clocks handling
- Always write scanlist buffer address in register
- Rebased on latest master

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


Detlev Casanova (5):
  media: v4l2-ctrls-core: Set frame_mbs_only_flag by default in h264 SPS
  media: rockchip: Move H264 CABAC table to header file
  media: rockchip: Introduce the rkvdec2 driver
  media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
  arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)

Jonas Karlman (1):
  media: v4l2: Add NV15 and NV20 pixel formats

 .../bindings/media/rockchip,vdec.yaml         |   73 +-
 .../media/v4l/pixfmt-yuv-planar.rst           |  128 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   74 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 .../media/platform/rockchip/rkvdec2/Kconfig   |   15 +
 .../media/platform/rockchip/rkvdec2/Makefile  |    3 +
 .../platform/rockchip/rkvdec2/rkvdec2-h264.c  |  778 +++++++++
 .../platform/rockchip/rkvdec2/rkvdec2-regs.h  |  347 ++++
 .../media/platform/rockchip/rkvdec2/rkvdec2.c | 1424 +++++++++++++++++
 .../media/platform/rockchip/rkvdec2/rkvdec2.h |  150 ++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   13 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  500 +-----
 include/media/v4l2-cabac/rkvdec-cabac.h       |  509 ++++++
 include/uapi/linux/videodev2.h                |    2 +
 17 files changed, 3522 insertions(+), 500 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec2/rkvdec2.h
 create mode 100644 include/media/v4l2-cabac/rkvdec-cabac.h

-- 
2.49.0


