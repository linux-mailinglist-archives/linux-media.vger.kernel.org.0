Return-Path: <linux-media+bounces-16259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13976951133
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 02:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48A0284C08
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 00:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D09F8469;
	Wed, 14 Aug 2024 00:54:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3251C17;
	Wed, 14 Aug 2024 00:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723596873; cv=none; b=GUmIw7suBl5UihWnIbDelIsgycz6UvTo10hnwM90uS4FXl1X6jquQWerjt4eoGf2BUkf7fQEcpwMhSfc+ZK8DtvnafALCidAP8B2AT0zF6LnD1psxjBS3hU+l1EJ1CKJwu69myN6BZsw9r4gN46kLFQDhx6Em0E9HyUvTS5XhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723596873; c=relaxed/simple;
	bh=Gn/yi3KbAwbZGg0oEB4ivFkqHgwxWjeMBzw3MzO6mcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EYMuIT1VGIGEF9iaODlJlTWASRdEgVNdApwF/7Ql53kyq/koYsgZotTVWvQUfNL5gGqTqPEekJqq3YxzHyeF1yCTwXNhpho0JbebVKbQ8oRgSCG2QQGBuuVJQxhfx5bXEdqXeRf6fN+STYG8Pk0toAKx7lLmEjXy5ldkRUlvzx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 14 Aug
 2024 08:54:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 14 Aug 2024 08:54:21 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <pmenzel@molgen.mpg.de>, <krzk@kernel.org>
CC: <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] media: aspeed: Allow to capture from SoC display (GFX)
Date: Wed, 14 Aug 2024 08:54:19 +0800
Message-ID: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The aim of this series is to add another capture source, SoC
Display(GFX), for video.

 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (2):
  ARM: dts: aspeed: Add properties of scu and gfx for video
  media: aspeed: Allow to capture from SoC display (GFX)

 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi      |   2 +
 drivers/media/platform/aspeed/aspeed-video.c | 192 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 3 files changed, 173 insertions(+), 28 deletions(-)


base-commit: e9d22f7a6655941fc8b2b942ed354ec780936b3e
-- 
2.25.1


