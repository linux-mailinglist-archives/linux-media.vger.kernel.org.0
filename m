Return-Path: <linux-media+bounces-14705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC192A69A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3DC1F2183D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2930A1459F6;
	Mon,  8 Jul 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d857G0Wz"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8808145340;
	Mon,  8 Jul 2024 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454410; cv=none; b=d8sq/9xghSr+Lr4abLE3ydDGe/2Oy1HdL/6alfnZ52wgE7OieKc5DQ+RaDxNyOIn/OqV9EOMsRf8vV9nfox/tT2/L/YZxH19iugbNCS9UGNRDdGY7uvQ+vTMQVDdWCO16nsgGxBUMCof9G47n2TEnHwCC4KrQlu5jzjQqhJt28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454410; c=relaxed/simple;
	bh=nFbJnq23XTYikyNFznKLNb2hOHJ7fDlvEzP7lvzRdss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArKThmqxh+zb2qJRVT2ON51U2LEy/+/DMSeFGFI7kAJNjw2jwJF6M2LxPjvTAHo8BTchDU6ID+PhVT//mQI2o8bS4uiQl1ildd+L1D6v4RQBpcgCgD25793wZy41E8gYxzM9IXY3IowDC1BCRj6tD6KVYJXW3ddjd8X7V2rAJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d857G0Wz; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468FxkRq046174;
	Mon, 8 Jul 2024 10:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454386;
	bh=S1jiyaqWjuWtWeLWTjTTn+GeFYYElSU9yqWMjOuLZc8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=d857G0Wz2wf8dAWlvF9zVBUZ9LG20T6juG/8uicnGa8Pzqz8GwMKe47w+S9XOg0oq
	 nFpzvjq/ciHuiVJNyfyPiGhfyhG0zM00HTBs6RC4sb1hDhhADafX435TSsOySpbjUj
	 PAeXws324cSdW0T3ko3xAsdHev7ZQgp7UK8GOKKg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468FxkGm021706
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:46 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:45 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxj1A103461;
	Mon, 8 Jul 2024 10:59:45 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <andriy.shevchenko@linux.intel.com>,
        <jani.nikula@intel.com>, <jirislaby@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <rdunlap@infradead.org>,
        <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH 1/6] math.h: Add macros for rounding to closest value
Date: Mon, 8 Jul 2024 21:29:38 +0530
Message-ID: <20240708155943.2314427-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240708155943.2314427-1-devarsht@ti.com>
References: <20240708155943.2314427-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add below rounding related macros:

round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
power of 2, with a preference to round up in case two nearest values are
possible.

round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
power of 2, with a preference to round down in case two nearest values are
possible.

roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
generally be used only when y is not multiple of 2 as otherwise
round_closest* macros should be used which are much faster.

Examples:
 * round_closest_up(17, 4) = 16
 * round_closest_up(15, 4) = 16
 * round_closest_up(14, 4) = 16
 * round_closest_down(17, 4) = 16
 * round_closest_down(15, 4) = 16
 * round_closest_down(14, 4) = 12
 * roundclosest(21, 5) = 20
 * roundclosest(19, 5) = 20
 * roundclosest(17, 5) = 15

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
NOTE: This patch is inspired from the Mentor Graphics IPU driver [1]
which uses similar macro locally and which is updated in further patch
in the series to use this generic macro instead along with other drivers
having similar requirements.

Link: https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480 [1]
---
 include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..79e3dfda77fc 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,52 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round closest to be multiple of specified value (which is
+ *                    power of 2) with preference to rounding up
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to closest multiple of @y (which must be a power of 2).
+ * The value can be either rounded up or rounded down depending upon rounded
+ * value's closeness to the specified value. If there are two closest possible
+ * values, i.e. the difference between the specified value and it's rounded up
+ * and rounded down values is same then preference is given to rounded up
+ * value.
+ *
+ * To perform arbitrary rounding to closest value (not multiple of 2), use
+ * roundclosest().
+ *
+ * Examples:
+ * * round_closest_up(17, 4) = 16
+ * * round_closest_up(15, 4) = 16
+ * * round_closest_up(14, 4) = 16
+ */
+#define round_closest_up(x, y) round_down((x) + (y) / 2, (y))
+
+/**
+ * round_closest_down - round closest to be multiple of specified value (which
+ *			is power of 2) with preference to rounding down
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to closest multiple of @y (which must be a power of 2).
+ * The value can be either rounded up or rounded down depending upon rounded
+ * value's closeness to the specified value. If there are two closest possible
+ * values, i.e. the difference between the specified value and it's rounded up
+ * and rounded down values is same then preference is given to rounded up
+ * value.
+ *
+ * To perform arbitrary rounding to closest value (not multiple of 2), use
+ * roundclosest().
+ *
+ * Examples:
+ * * round_closest_down(17, 4) = 16
+ * * round_closest_down(15, 4) = 16
+ * * round_closest_down(14, 4) = 12
+ */
+#define round_closest_down(x, y) round_up((x) - (y) / 2, (y))
+
 #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
@@ -77,6 +123,23 @@
 }							\
 )
 
+/**
+ * roundclosest - round to nearest multiple
+ * @x: the value to round
+ * @y: multiple to round nearest to
+ *
+ * Rounds @x to nearest multiple of @y.
+ * The rounded value can be greater than or less than @x depending
+ * upon it's nearness to @x. If @y will always be a power of 2, consider
+ * using the faster round_closest_up() or round_closest_down().
+ *
+ * Examples:
+ * * roundclosest(21, 5) = 20
+ * * roundclosest(19, 5) = 20
+ * * roundclosest(17, 5) = 15
+ */
+#define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
+
 /*
  * Divide positive or negative dividend by positive or negative divisor
  * and round to closest integer. Result is undefined for negative
-- 
2.39.1


