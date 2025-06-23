Return-Path: <linux-media+bounces-35670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3878AE49FE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB82F7A87E9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0EB2BE7D9;
	Mon, 23 Jun 2025 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mBIu00QN"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38FE2BE7A1;
	Mon, 23 Jun 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694867; cv=none; b=CRWeK6pfK2ChQCEAPob/6nFLYuK9YrN/CcAtx7NEvGh6BW0zYy3K7rBIuo5soAR63auP7kS8kK+Af33ltzcJrMJcUts3vlCkHS4hHy5k/MaEpYzFINXyidy7McDhSW1Z+8F4nwRhwB9xNhMIDI9ZOVlMTEluXgeTJNjPMOjtZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694867; c=relaxed/simple;
	bh=potBOdXr8Iz2ioECm7kZqlRyCx32EonrYrShLBe6IA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qcNoea9yr1C7Sx5GcVjNC1gXkCEU1iShuWgZxoFJ0maH23ZtelG10gpzQUKS63iOnPR/+CD0kPSvYLGz+ap+OUnQ9w4Nz+dLsaTm3gKyl8sFvDDo6hR1emSlaLsvirA6eCYiCmNj8mUETKUxyZAKciz6dPF0gzDakQDH1Bwut4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mBIu00QN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694864;
	bh=potBOdXr8Iz2ioECm7kZqlRyCx32EonrYrShLBe6IA0=;
	h=From:To:Cc:Subject:Date:From;
	b=mBIu00QNj1CLzYNlx8lmRn1yZwl8BwHb8ZyGA/R4yuut7XODfZQJbiFB5/sbi+fsf
	 Bw2bOUpqvZIwTHJSLxTO7psFxYAyKq9zqlPFYlWsqqcI6EOOQ25XR3B6Mx83A5djyP
	 pqjUwjEfK0hZxAVtKN2kPWGVYUiY1CtqITnzUlAvEoFqprNKlGrauXGP33M6h/g/N/
	 d1I21SWkZYP+XO0+ajKlXWpTutAK1ydowgxxJSE0BudcAIhujvx3qer94e6ZjiWIZO
	 sTXntA+k5WA8HQsSAaLruG3at6OXYKJSjWOor2i6mSVw+Xg0uniCMrFRJ0XKkY/YML
	 rKX23HXSQbY5A==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBD5C17E0342;
	Mon, 23 Jun 2025 18:07:40 +0200 (CEST)
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
Subject: [PATCH 0/8] Prepare for new rkvdec variants
Date: Mon, 23 Jun 2025 12:07:14 -0400
Message-ID: <20250623160722.55938-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set introduces the necessary bits for new variants
implementations that do not modify the driver.
The driver changes will come in another patch set.

The first 4 patches document the device nodes and then add the nodes for
rk3588 and rk3576. I kept the R-b tag from Conor Dooley as the patch
didn't change much from [1]. I can remove it if needed.

Then a new v4l2 control for HEVC is added to be able to send the missing
RPS information to the driver.

Finally, the driver is unstaged as the TODO points are removed. I added
myself as maintainer for now as I'll be adding support for several
variants.

Those 3 parts can be applied separately and do not depend on each other.
Based on v6.16-rc3.

[1]: https://lore.kernel.org/all/20240620-unsmooth-surfer-b62ed94b4a5e@spud/

Detlev Casanova (8):
  media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings
  media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings
  arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
  arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
  media: uapi: HEVC: Add v4l2_ctrl_hevc_ext_sps_rps control
  media: v4l2-ctrls: Add hevc_ext_sps_rps control
  media: rkvdec: Remove TODO file
  media: rkvdec: Unstage the driver

 .../bindings/media/rockchip,vdec.yaml         | 80 ++++++++++++++++++-
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 73 +++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  6 ++
 MAINTAINERS                                   |  8 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 36 +++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++
 drivers/media/platform/rockchip/Kconfig       |  1 +
 drivers/media/platform/rockchip/Makefile      |  1 +
 .../platform/rockchip}/rkvdec/Kconfig         |  0
 .../platform/rockchip}/rkvdec/Makefile        |  0
 .../platform/rockchip}/rkvdec/rkvdec-h264.c   |  0
 .../platform/rockchip}/rkvdec/rkvdec-regs.h   |  0
 .../platform/rockchip}/rkvdec/rkvdec-vp9.c    |  0
 .../platform/rockchip}/rkvdec/rkvdec.c        |  0
 .../platform/rockchip}/rkvdec/rkvdec.h        |  0
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  9 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 ++
 drivers/staging/media/Kconfig                 |  2 -
 drivers/staging/media/Makefile                |  1 -
 drivers/staging/media/rkvdec/TODO             | 11 ---
 include/uapi/linux/v4l2-controls.h            | 48 +++++++++++
 include/uapi/linux/videodev2.h                |  1 +
 22 files changed, 339 insertions(+), 17 deletions(-)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Kconfig (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/Makefile (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-h264.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-regs.h (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec-vp9.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.c (100%)
 rename drivers/{staging/media => media/platform/rockchip}/rkvdec/rkvdec.h (100%)
 delete mode 100644 drivers/staging/media/rkvdec/TODO

-- 
2.50.0


