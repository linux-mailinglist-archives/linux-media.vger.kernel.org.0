Return-Path: <linux-media+bounces-44449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970ABDACDC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB3C18A7041
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F231307AD8;
	Tue, 14 Oct 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9Hbk4Oc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C2E221555;
	Tue, 14 Oct 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463641; cv=none; b=eoZhXq2ZpyzqGcjqLSq0XxweamySNcehVEnNZFxCqY1GFdOKEgHMjb/QBOkceIVX983T0+kUWN/8MXERlVrNxHrfe+zwgwUFU7EdH07IzLbd/IBFFtcJrJZ4H9I9aKKpSLN7ExFIjspYOgVrO5wnrM04mRqyvrUPZ+EHoc2zxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463641; c=relaxed/simple;
	bh=Gu5P+bQtdMky2zRKnF1lFJDrTkY1FoHLpwP8oHnZRsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syjqR/xDDozqUnP/a4bt8QgPGq47QFiolqiPEs5slo8ESbl2nhOO4mPIgPNfOlTuNqhB4DHYVLaEYCZq8dtNPebWyeu2mhCgbvFkPNK2HGI7pjIXnvHNcKi1Ao6QLcunRkgHTVK7sk0ckLecZ538xTFRVcMtZfBP2pucMG6Jo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9Hbk4Oc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82BCC4CEE7;
	Tue, 14 Oct 2025 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463641;
	bh=Gu5P+bQtdMky2zRKnF1lFJDrTkY1FoHLpwP8oHnZRsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9Hbk4Ocoe+4AWBBKNXYgbR6ns6nRdTTarpfra5yVlKF9PmixdUtcgBcFtvwgxl4v
	 ONUeFt0fVIsbpAolIydIQ+eR2bxMXGgFL7S9rcEMs1HTrK/3xe9T/WAiP6kD0TDlez
	 +6RZcCcSrCbJ4dNK/gD76GjAl7HCL7uLh13ypmVkCQFYqPKPs1FogJGHb0fe0Gvt2h
	 +knCLGaeGHMxGMvgZRwF0bYNrJBSuN43q2Ra8Hboo+7qD4xQ8CoubodsYMwMfZkuLp
	 QnWMzn36n277jP/Aq9t2nU2gE2MneC1oxFjhVBzmpVVnlZmTOZ5iRLxSDLMiFX5lZO
	 j5ql+KB6c50ig==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 02/25] media: i2c: ov01a10: Fix reported pixel-rate value
Date: Tue, 14 Oct 2025 19:40:10 +0200
Message-ID: <20251014174033.20534-3-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.

This also matches with the observed frame-rate of 60 fps with the default
vblank setting: 80000000 / (1488 * 896) = 60.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index e5df01f97978..0b1a1ecfffd0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
-#define OV01A10_SCLK			40000000LL
+#define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
 
 #define OV01A10_REG_CHIP_ID		0x300a
-- 
2.51.0


