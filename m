Return-Path: <linux-media+bounces-33969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3FACC076
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F8073A4314
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 06:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BB4268685;
	Tue,  3 Jun 2025 06:50:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D01F4CBD;
	Tue,  3 Jun 2025 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933413; cv=none; b=pP/ofPFmEu9ItaDap/5qDhSvFr/aZeThrFMHNJ8nlIJptCZ4fu0+sQQXPGxrjzswCL0odHwHko+/sJcRhO5lk3QefKPySsePUX9RX6k9Bj7pdwZrxNGbjIz8F/NR1ode/k229ri/HZFxDJx4183YIqgEZRJXg2rcLBh2A+wg/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933413; c=relaxed/simple;
	bh=7ArF5YzrxRPHNf7/61zGZMMOUvKVPDKgRU1KI+bNLDY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ueSyd/sKq+kw/LTgmJzn4u87q69mjPffNGy7onUeyphClSxbV3fW8LyCdWwyJInsRX5S+ytLdcs/Wyo+kJ12fF4h7DoaF8c9/cw25BY/g9p1LFMgji0Vv2bn2rnaDI97fXbrCBG3CEYypzb15KgQA4A01YRAhs5gLN2mj19QJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Jun
 2025 14:45:00 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Jun 2025 14:45:00 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Tue, 3 Jun 2025 14:44:59 +0800
Message-ID: <20250603064500.94048-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 v7 changes:
  - The change for Documentation is moved to a separate patch and has
    been accepted.
 v6 changes:
  - Replace aspeed-video.txt with aspeed,video-engine.yaml.
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

Jammy Huang (1):
  media: aspeed: Allow to capture from SoC display (GFX)

 drivers/media/platform/aspeed/aspeed-video.c | 189 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 168 insertions(+), 28 deletions(-)


base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
-- 
2.25.1


