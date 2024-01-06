Return-Path: <linux-media+bounces-3267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF5826059
	for <lists+linux-media@lfdr.de>; Sat,  6 Jan 2024 17:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6DE01C21438
	for <lists+linux-media@lfdr.de>; Sat,  6 Jan 2024 16:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A90848D;
	Sat,  6 Jan 2024 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O4ZdFBQv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B94847A;
	Sat,  6 Jan 2024 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.hamster-moth.ts.net (unknown [IPv6:2001:268:c203:a8ee:6c57:4243:1eb3:6cb])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7932FF3;
	Sat,  6 Jan 2024 17:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704556901;
	bh=/pjXivSG4goku7eRq54a5o6OqspuBVcEzAsDoABpraA=;
	h=From:To:Cc:Subject:Date:From;
	b=O4ZdFBQv06eiLHFTWsS9AMMmzjwa/VDyAi0O/YER15sKfxQJERJVr6PH7T0cLrMam
	 IPoLroqGwQfW/P5JZnkuZ0B/GoJH1SdPrUfAbNYbq/O+9xgvRxOL82sWkxpBiZmt5q
	 ygsHcTR+aBUyfbAPRAQ8mRzhzNauo+CVp9KWQbpU=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v5 00/10] media: rkisp1: Add support for i.MX8MP
Date: Sun,  7 Jan 2024 01:02:11 +0900
Message-Id: <20240106160221.4183409-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series depends on the series "media: rkisp1: Fix shared
interrupt handling" [1]

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

In v5 the patch "media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP" has been
dropped.

[1] https://lore.kernel.org/all/20231218-rkisp-shirq-fix-v1-0-173007628248@ideasonboard.com/

Laurent Pinchart (2):
  media: rkisp1: Add and use rkisp1_has_feature() macro
  media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (8):
  media: rkisp1: Support setting memory stride for main path
  media: rkisp1: Support devices lacking self path
  media: rkisp1: Support devices lacking dual crop
  dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
  media: rkisp1: Add match data for i.MX8MP ISP
  media: rkisp1: Shift DMA buffer addresses on i.MX8MP
  media: rkisp1: Add YC swap capability
  media: rkisp1: Add UYVY as an output format

 .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 130 ++++++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  37 ++++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  74 ++++++++--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  27 ++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  12 +-
 include/uapi/linux/rkisp1-config.h            |   2 +
 8 files changed, 392 insertions(+), 58 deletions(-)

-- 
2.39.2


