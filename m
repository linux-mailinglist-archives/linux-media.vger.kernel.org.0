Return-Path: <linux-media+bounces-16453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96A95653B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 10:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD421F22B6A
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 08:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A819515B135;
	Mon, 19 Aug 2024 08:09:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910A15B0FA;
	Mon, 19 Aug 2024 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724054950; cv=none; b=K/AQYZDl0n1p7rdljqO/vqmsn6Sz4o5ffVaH+fStApXZ8UsSZrL5diwBywuG78GgSlKtZHR+zLVmFraQ0C/lVgFjwwgFY76XTVHVyPkaTOuYU2cfBmRtQpJzh8PYysyPuDnAb8QDrj3qT7BQ0Y+vMBFC9jvxHmvdYB7i7AuEQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724054950; c=relaxed/simple;
	bh=DNsFU47QhxQ1nrGbPhK1XcjMHHQWRkXXTuDzy/cSY9o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pXtL+ulaqsgDTvghzkHEhyOWAHNkmtQB3WdyMhKNVRUC1Bky1mu4Kuuw22+50EDaujq5sH8xpAAHwx5u7tGXApA4HsSyi43Xk9ixMPCygZ8vQw7gwFujdJl+bHaefgwh64MNRGyYoznVzr7ePg0Le2cT7kFGuQshDmcskVZF/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 19 Aug
 2024 16:08:59 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 19 Aug 2024 16:08:59 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <robh@kernel.org>, <conor+dt@kernel.org>, <eajames@linux.ibm.com>,
	<mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<hverkuil@xs4all.nl>, <pmenzel@molgen.mpg.de>, <krzk+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/2] media: aspeed: Allow to capture from SoC display (GFX)
Date: Mon, 19 Aug 2024 16:08:57 +0800
Message-ID: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 v5 changes:
  - Remove dts.
  - Add doc, aspeed,video.yaml.
  - Simplify aspeed_regmap_lookup.
 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (2):
  dt-bindings: arm: aspeed: Add aspeed,video binding
  media: aspeed: Allow to capture from SoC display (GFX)

 .../bindings/arm/aspeed/aspeed,video.yaml     |  81 ++++++++
 drivers/media/platform/aspeed/aspeed-video.c  | 189 +++++++++++++++---
 include/uapi/linux/aspeed-video.h             |   7 +
 3 files changed, 249 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed,video.yaml


base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
-- 
2.25.1


