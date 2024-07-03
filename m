Return-Path: <linux-media+bounces-14611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F248D926B85
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 00:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86329B21617
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 22:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C4918FC90;
	Wed,  3 Jul 2024 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tsNy/jFx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD3136643
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 22:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045559; cv=none; b=I7+7z5IPteHHB+UNCpdoKm5wDhiRaww9YAUuzY0PI/JTjYEmfSjZLcgxOq3rKqG9dRwNqW3z6GPeQT4u2kbaCNwwMJAHoGV/HwAmQnINurxxB2Jr4Qw9wiGsjdkYxrPn9Qn3iDggfsI84R/DdhDRpYqUDNR4LLTRYQURVEJLX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045559; c=relaxed/simple;
	bh=BmOtYXV8tsCqxjxjxliKqEzMBQZWSt9XONLRRPSKZDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nkNCYK9ab8otP0aEOVtkbjNXT5eCtO/BJifJ38RLyOrhnEj53sjmivJ/037W1ElcC06lK8iYe3qwK0MsNOWEdUbmNLVSrqlQ3kwwXdF7W/diWcmW9Ynpa33EyghSGEaZ+claN0djU6RzMGN1QQcyynTtVexLADLGmNY0cbg3V/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tsNy/jFx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7EDD4CC;
	Thu,  4 Jul 2024 00:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720045527;
	bh=BmOtYXV8tsCqxjxjxliKqEzMBQZWSt9XONLRRPSKZDY=;
	h=From:To:Cc:Subject:Date:From;
	b=tsNy/jFxExLvaMiWCzaPg2p15g4fZ7TobXo4lNf9jlSY0Ll5K4HLLp7umnLP0hMKg
	 K9MaahO7oTAfUs6Mda30rRkRy1TcQoHtv76uYcO9ZSE8+cQ4kyil78pgX5CKpVwrpU
	 zx4XBCh3CCg3EMZNjCAd1sX3kaPks4fUwSU5dn6s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/5] media: rkisp1: Add support for the companding block
Date: Thu,  4 Jul 2024 01:25:28 +0300
Message-ID: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series extends the rkisp1 driver to add support for the ISP's
companding block.

The companding block is an ISP processing block located at the front of
the processing pipeline that performs data expansion, black level
subtraction and data compression. It is found in the ISP8000Nano on the
i.MX8MP, and not present in Rockchip versions of the ISP, that implement
BLS in a dedicated block (not present in the ISP8000Nano) already
supported by the driver.

The first two patches start with preparatory work. Patch 1/5 refactors
existing duplicate code to share a common function, that will also be
used later in this series. Patch 2/5 then improves the ISP parameters
extensible format handler by making it possible to condition support for
particular ISP blocks based on device features.

Support for the companding block follows in the next three patches.
Patch 3/5 adds macros for the companding block registers, and patch 4/5
adds feature flags to differentiate between the dedicated BLS block and
the companding block. Finally, patch 5/5 adds support for the companding
block in the ISP parameters.

The series is based on Jacopo's support for extensible parameters in the
rkisp1 driver ("[PATCH v5 0/7] media: rkisp1: Implement support for
extensible parameters", see [1]). Thanks to that work, adding support
for a new ISP block in a backward compatible way is easy.

[1] https://lore.kernel.org/r/20240703161048.247124-1-jacopo.mondi@ideasonboard.com

Laurent Pinchart (2):
  media: rkisp1: Add helper function to swap colour channels
  media: rkisp1: Add features mask to extensible block handlers

Paul Elder (3):
  media: rkisp1: Add register definitions for the companding block
  media: rkisp1: Add feature flags for BLS and compand
  media: rkisp1: Add support for the companding block

 .../platform/rockchip/rkisp1/rkisp1-common.c  |  15 ++
 .../platform/rockchip/rkisp1/rkisp1-common.h  |   7 +
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |   9 +-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 236 ++++++++++++++----
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  22 ++
 .../platform/rockchip/rkisp1/rkisp1-stats.c   |  51 ++--
 include/uapi/linux/rkisp1-config.h            |  85 ++++++-
 7 files changed, 338 insertions(+), 87 deletions(-)


base-commit: cefd157968bcde0f648cf2421213eb217451d39f
-- 
Regards,

Laurent Pinchart


