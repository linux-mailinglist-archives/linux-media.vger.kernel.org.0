Return-Path: <linux-media+bounces-35679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09CAE4A18
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B2507AE4E1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39182D29CE;
	Mon, 23 Jun 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qskRex4K"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572242D238B;
	Mon, 23 Jun 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694896; cv=none; b=kyZBIUCShx+7Q0OSDQXJ9iLFSf/FE4CzPH93f3Pm0xtUoDXdMCoBd//v0R5F/N91mZbMp2ivbS5K9US/8gcVP8OgaDB5fjJbXcKqHRn5StGNcDT0dxNCSRPg2NdZ3LffkgxU0pgI7SIuMdoUExOqEuXonrwWDSeAgqTz3tXiRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694896; c=relaxed/simple;
	bh=L4p5mXi7DFDYHCSaTVxJNafGXSHDm+zZmxqXO3mMrMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMaoMw47aS61mFb7tIQV3EeXfS8cdccvs9csO51rnoHg+flc0j+N16r52olC6jxq/YahdnQZuDm1HjWkxJQNm3a8laxI5IOw9KUQCKxrIWAvcUIupCtsDm12IR9XwfCHKXBnQnJT14pSuIyPTHClXor2OT1PoeVHSvPEpInWvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qskRex4K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694892;
	bh=L4p5mXi7DFDYHCSaTVxJNafGXSHDm+zZmxqXO3mMrMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qskRex4KS5ZZJaJwLsSUyUFsAf1k4QKIQF0MgHltmvgQxKp9+2+d//S4QHw/Q3Uea
	 fH5rR/de88nZaQ4f5gJfPxOY3WCUTR9TxeZDGtVPKyjxe3mUlsYP53rSeANhyNHMWx
	 sJjhLlyEn/tOFLFlOzmxpx78ZmDnGHMi3+1Sv+IcPFAsmr5JQfU9A35hwRsdSVKcFd
	 WPPfDCSNgLWT4agyfvYPfgK/3OyKn/93e+8BFS16TXhP5jA+YBuJ5i8YUB0gBIkOTQ
	 W8M5WjDI32QzMLnNbwu27TMdzQMSXAh+NWDYDEeUA5iA8oF0YvcR03GFtucqa01Hpz
	 c40gtzlbT85jw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8969617E37C2;
	Mon, 23 Jun 2025 18:08:09 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 8/8] media: rkvdec: Unstage the driver
Date: Mon, 23 Jun 2025 12:07:22 -0400
Message-ID: <20250623160722.55938-9-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO list for unstaging being empty, the driver can now be moved to the
main media folder.

Also add myself as maintainer.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 MAINTAINERS                                               | 8 ++++++++
 drivers/media/platform/rockchip/Kconfig                   | 1 +
 drivers/media/platform/rockchip/Makefile                  | 1 +
 .../media => media/platform/rockchip}/rkvdec/Kconfig      | 0
 .../media => media/platform/rockchip}/rkvdec/Makefile     | 0
 .../platform/rockchip}/rkvdec/rkvdec-h264.c               | 0
 .../platform/rockchip}/rkvdec/rkvdec-regs.h               | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec.c     | 0
 .../media => media/platform/rockchip}/rkvdec/rkvdec.h     | 0
 drivers/staging/media/Kconfig                             | 2 --
 drivers/staging/media/Makefile                            | 1 -
 12 files changed, 10 insertions(+), 3 deletions(-)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Kconfig (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-h264.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67af..d05a153c21526 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21466,6 +21466,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip-rga.yaml
 F:	drivers/media/platform/rockchip/rga/
 
+ROCKCHIP RKVDEC VIDEO DECODER DRIVER
+M:	Detlev Casanova <detlev.casanova@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+F:	drivers/media/platform/rockchip/rkvdec/
+
 ROCKCHIP RK3308 INTERNAL AUDIO CODEC
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
index b41d3960c1b41..9bbeec4996aa2 100644
--- a/drivers/media/platform/rockchip/Kconfig
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -4,3 +4,4 @@ comment "Rockchip media platform drivers"
 
 source "drivers/media/platform/rockchip/rga/Kconfig"
 source "drivers/media/platform/rockchip/rkisp1/Kconfig"
+source "drivers/media/platform/rockchip/rkvdec/Kconfig"
diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
index 4f782b876ac9b..286dc5c53f7e1 100644
--- a/drivers/media/platform/rockchip/Makefile
+++ b/drivers/media/platform/rockchip/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += rga/
 obj-y += rkisp1/
+obj-y += rkvdec/
diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
similarity index 100%
rename from drivers/staging/media/rkvdec/Kconfig
rename to drivers/media/platform/rockchip/rkvdec/Kconfig
diff --git a/drivers/staging/media/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
similarity index 100%
rename from drivers/staging/media/rkvdec/Makefile
rename to drivers/media/platform/rockchip/rkvdec/Makefile
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-h264.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
diff --git a/drivers/staging/media/rkvdec/rkvdec-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-regs.h
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
diff --git a/drivers/staging/media/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec-vp9.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec.c
rename to drivers/media/platform/rockchip/rkvdec/rkvdec.c
diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
similarity index 100%
rename from drivers/staging/media/rkvdec/rkvdec.h
rename to drivers/media/platform/rockchip/rkvdec/rkvdec.h
diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index b442148543995..b9d52a51841b5 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -32,8 +32,6 @@ source "drivers/staging/media/max96712/Kconfig"
 
 source "drivers/staging/media/meson/vdec/Kconfig"
 
-source "drivers/staging/media/rkvdec/Kconfig"
-
 source "drivers/staging/media/starfive/Kconfig"
 
 source "drivers/staging/media/sunxi/Kconfig"
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index ad4e9619a9e07..102ca632ddf5c 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -4,7 +4,6 @@ obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
 obj-$(CONFIG_VIDEO_MESON_VDEC)	+= meson/vdec/
-obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC)	+= rkvdec/
 obj-$(CONFIG_VIDEO_STARFIVE_CAMSS)	+= starfive/
 obj-$(CONFIG_VIDEO_SUNXI)	+= sunxi/
 obj-$(CONFIG_VIDEO_TEGRA)	+= tegra-video/
-- 
2.50.0


