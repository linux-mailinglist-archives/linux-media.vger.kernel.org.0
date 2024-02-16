Return-Path: <linux-media+bounces-5256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 143DC857982
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 10:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B73BF287364
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 09:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDED1C693;
	Fri, 16 Feb 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hpHhzRjo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D61C697;
	Fri, 16 Feb 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077320; cv=none; b=u65k4Rq62yl/0H9iza+6b2OzgPXoSEZSDcv4ubEdffu/j1kzOPdtlP4cEMilTfDNzzA66BSs9rqU1bJN3sEgrP/eX4WvShB3n67BowycUTXck5y0ILA7Svd4lkpksqUE4bdNhKNoGASLqJ5AocwjePQp5X0BmXHTzn90hHFLqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077320; c=relaxed/simple;
	bh=14pbGMOUrSYFgdYiRsPiVkEL+Ef/tvyX16rpDvJtEtM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UtXzcGSlus0Fj35bwwvMr6mjGqjmp9Of1Fm2Mycg8T5bgqCcjpAIm93r/KBZOgpI9Wg+wbV7U+NWbW6SF0WvTPi2/5txBHzovhEIKOy5b0jOgUkWzsYek3MLGokTGSNbyEQKJYUuYw1UG28WcIHUysWoaowXeAHxDjnaasg5+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hpHhzRjo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.hamster-moth.ts.net (h175-177-049-156.catv02.itscom.jp [175.177.49.156])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 553236B3;
	Fri, 16 Feb 2024 10:55:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708077310;
	bh=14pbGMOUrSYFgdYiRsPiVkEL+Ef/tvyX16rpDvJtEtM=;
	h=From:To:Cc:Subject:Date:From;
	b=hpHhzRjoqXjm22tS4Wtv1ifSooadJ1hfqlGZhU1WBqa0JmyS47x6gHXWbuCdXVyW3
	 HNVXqVYKI5iaeO0loqx2pJt+NTHh1HCEccE6TA5PsTxVdGyQBAcOUqY48QRkGva1bM
	 Zg87q1F0ib5TWu+OOmYIK7FG6dJVriNkO7WjZt3c=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	aford173@gmail.com,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v12 00/12] media: rkisp1: Add support for i.MX8MP
Date: Fri, 16 Feb 2024 18:54:46 +0900
Message-Id: <20240216095458.2919694-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Twelfth time's the charm.

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

Patches 9 and 10 add support for UYVY output format, which can be
implemented on the ISP version in the i.MX8MP but not in the one in the
RK3399.

This version of the series specifically has been tested on a Polyhex
Debix model A with an imx219 (Raspberry Pi cam v2).

v6 added patch 11 to fix endinanness issues on raw streams on the
i.MX8MP.

In v12 patch 6 "media: rkisp1: Add version enum for i.MX8MP ISP" has
been split out from patch 12 "media: rkisp1: Add match data for i.MX8MP
ISP".

[1] https://lore.kernel.org/all/20231218-rkisp-shirq-fix-v1-0-173007628248@ideasonboard.com/

Laurent Pinchart (2):
  media: rkisp1: Add and use rkisp1_has_feature() macro
  media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (10):
  media: rkisp1: Support setting memory stride for main path
  media: rkisp1: Support devices lacking self path
  media: rkisp1: Support devices lacking dual crop
  dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
  media: rkisp1: Add version enum for i.MX8MP ISP
  media: rkisp1: Support i.MX8MP's 34-bit DMA
  media: rkisp1: Add YC swap capability
  media: rkisp1: Add UYVY as an output format
  media: rkisp1: Fix endianness on raw streams on i.MX8MP
  media: rkisp1: Add match data for i.MX8MP ISP

 .../bindings/media/rockchip-isp1.yaml         |  37 ++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 219 +++++++++++++-----
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  71 +++++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 ++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  35 +++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  17 +-
 include/uapi/linux/rkisp1-config.h            |   2 +
 8 files changed, 467 insertions(+), 80 deletions(-)

-- 
2.39.2


