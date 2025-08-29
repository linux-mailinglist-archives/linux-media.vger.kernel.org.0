Return-Path: <linux-media+bounces-41292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F678B3B1C8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 05:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDF75685452
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 03:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E1121CC6A;
	Fri, 29 Aug 2025 03:53:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840A1917D0;
	Fri, 29 Aug 2025 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756439586; cv=none; b=pyI+aNs+QsWgZGD656bHWcAZHXJ1FIZGwRc4UCle43yvglhECs1m4ZodZLGZG+xrJ4bkC5I6tFzK4v4h5DBynZUEp4cOSImRQ0Eud29Dz3PjTwzEmuht9lifrr1TY39IEQ/+eA2ZYAi+1k1qQcVTMQDSeEsz+C3sHhYzWyXm4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756439586; c=relaxed/simple;
	bh=ZVbIaFbphE+LYDYGmjndSahP/JwGWca2Y4Q0wuhD30A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rnj8uSrJjLmLSVEanTliSeqUUvsY0Z/CBjzys/3Q3NXiO7IbS6ZD6kbopILhyE7lvezNH2aZRwvoJ6J12QMkGXCzWybGxbQqy+p4i+MqqFQuFw8ToD4S75RPjkbHUwsTcmgmyKcrZ5A9bVsVqaxavvNOa22u0BOkOMj3tKAeBX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 11:53:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 11:53:01 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Fri, 29 Aug 2025 11:53:00 +0800
Message-ID: <20250829035301.2697535-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 v10 changes:
  - Fix alignment check.
 v9 changes:
  - Fix line length WARNING.
 v8 changes:
  - Add check in aspeed_video_set_input().
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

 drivers/media/platform/aspeed/aspeed-video.c | 199 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 178 insertions(+), 28 deletions(-)


base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
-- 
2.25.1


