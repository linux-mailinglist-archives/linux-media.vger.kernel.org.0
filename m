Return-Path: <linux-media+bounces-1322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28E7FD291
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984B7282FAC
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CA314AA3;
	Wed, 29 Nov 2023 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cdIKcKef"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9020626B3;
	Wed, 29 Nov 2023 01:28:16 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99D122B6;
	Wed, 29 Nov 2023 10:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250058;
	bh=TEIBgpUjK6NYJRiaGUhsgKnE4DjYmC8agG6/GUA9vAM=;
	h=From:To:Cc:Subject:Date:From;
	b=cdIKcKefkWjwzhIvpuWrxnGyyHUS9fT9pqK9a/uCs+7BYq+w5lWzHI5A3SEFv6/xp
	 1tShxd13EgaI4oarWFRcC6RYkS1wDdgNy6qwmh6bJqiYbX3XUvdRhAW9tHGfdWSpVB
	 QcKFGgqtKLDDbqgWn7eJ9VnJYHWdkex0l8ZgribY=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
Date: Wed, 29 Nov 2023 18:27:48 +0900
Message-Id: <20231129092759.242641-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the rkisp1 driver to support the ISP found in the
NXP i.MX8MP SoC.

The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
and in the NXP i.MX8MP have the same origin, and have slightly diverged
over time as they are now independently developed (afaik) by Rockchip
and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
and is close enough to the RK3399 ISP that it can easily be supported by
the same driver.

The last two patches add support for UYVY output format, which can be
implemented on the ISP version in the i.MX8MP but not in the one in the
RK3399.

This version of the series specifically has been tested on a Polyhex
Debix model A with an imx219 (Raspberry Pi cam v2).

Laurent Pinchart (2):
  media: rkisp1: Add and use rkisp1_has_feature() macro
  media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (9):
  media: rkisp1: Support setting memory stride for main path
  media: rkisp1: Support devices lacking self path
  media: rkisp1: Support devices lacking dual crop
  media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
  dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
  media: rkisp1: Add match data for i.MX8MP ISP
  media: rkisp1: Shift DMA buffer addresses on i.MX8MP
  media: rkisp1: Add YC swap capability
  media: rkisp1: Add UYVY as an output format

 .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
 include/uapi/linux/rkisp1-config.h            |   2 +
 8 files changed, 398 insertions(+), 60 deletions(-)

-- 
2.39.2


