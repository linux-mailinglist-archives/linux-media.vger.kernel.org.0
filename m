Return-Path: <linux-media+bounces-16836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566D95F4A2
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C15E8282D86
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA3119343D;
	Mon, 26 Aug 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JD9AU/B5"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363ED18BC24;
	Mon, 26 Aug 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684926; cv=none; b=YcMkUvK03S/iKiKFPj6nD64EclR82NYgfPThZ91LrENT7WH5GJ9zoAlysDlW2R/zWqh8EqOnBfTvgn7aYy0Dk0TOKgrruoqoel3uFOPAkFFliUC6mwjfcWfdF0RIRfijxzxe4C8mQaFbAv2tqzDHkpdMzFIXkPwGIPEAZg7QBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684926; c=relaxed/simple;
	bh=YJIkUeRLu2Kr/WqRzxWJExQWPxmfHyiG0Bgnp9y7yyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k69ucGUx80aEnNCey/FBL0ba9geIioGgWnFf902Hd5VzNw8WABmkUzyGTnY6HR+c4PR4v8TPKPPcinWXbI6y62kyKWS5Qbs8EmVRYoQLi3g3CQuNjD5uxZGtFk1mAVhgCqxS5sUVQEb4zfPDQVU8oy0Y+HULy4F7XUiNfRSQQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JD9AU/B5; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8QFG078703;
	Mon, 26 Aug 2024 10:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684906;
	bh=InOaQ/oT4jDIyfmOlh93amRUx7UWvjLOJkSpc/qJSO8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JD9AU/B5GijX8jmT9o5Ld0HQTH8vIb0TkEJr+ExqCQQQVVx0lyIQlURqAksWfaqqq
	 LECLWqGjhWmvuyQA2AFaifoVpNuDi3f92ZbS/5/UXP0n/cNlClWBTSklUDvn4AGCT5
	 55DOb7pQF7HS3Yx5zmxQDihcoJljNvP9bb3pCNTs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8Q5w115122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:25 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8OeO100787;
	Mon, 26 Aug 2024 10:08:25 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>
CC: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <devarsht@ti.com>,
        <andi.shyti@linux.intel.com>, <nicolas@ndufresne.ca>,
        <andriy.shevchenko@linux.intel.com>, <jirislaby@kernel.org>,
        <davidgow@google.com>, <dlatypov@google.com>, <corbet@lwn.net>,
        <broonie@kernel.org>, <jani.nikula@intel.com>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
Subject: [PATCH v2 1/6] math.h: Add macros for rounding to the closest value
Date: Mon, 26 Aug 2024 20:38:17 +0530
Message-ID: <20240826150822.4057164-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240826150822.4057164-1-devarsht@ti.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
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

round_closest_up(x, y) : Rounds x to the closest multiple of y where y is a
power of 2, with a preference to round up in case two nearest values are
possible.

round_closest_down(x, y) : Rounds x to the closest multiple of y where y is
a power of 2, with a preference to round down in case two nearest values
are possible.

roundclosest(x, y) : Rounds x to the closest multiple of y, this macro
should generally be used only when y is not multiple of 2 as otherwise
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

Past discussions and alignment on this:
https://lore.kernel.org/all/7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com/#r
https://lore.kernel.org/all/ZkISG6p1tn9Do-xY@smile.fi.intel.com/#r
https://lore.kernel.org/all/ZlTt-YWzyRyhmT9n@smile.fi.intel.com/
https://lore.kernel.org/all/ZmHDWeuezCEgj20m@smile.fi.intel.com/
https://lore.kernel.org/all/ZloMFfGKLry6EWNL@smile.fi.intel.com/

Changelog:
V2:
- Fix grammar in macro description
- Update roundclosest macro to use roundup to avoid overflow scenario
---
 include/linux/math.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index f5f18dc3616b..b59a02a007d7 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,52 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * round_closest_up - round closest to be multiple of the specified value
+ *                    (which is power of 2) with preference to rounding up
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to the closest multiple of @y (which must be a power of 2).
+ * The value can be rounded up or rounded down depending on the rounded
+ * value's closeness to the specified value. Also, there can be two closest
+ * values, i.e. the difference between the specified value and its rounded-up
+ * and rounded-down values could be the same. In that case, the rounded-up
+ * value is preferred.
+ *
+ * To perform arbitrary rounding to the closest value (not multiple of 2), use
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
+ * round_closest_down - round closest to be multiple of the specified value
+ *                      (which is power of 2) with preference to rounding down
+ * @x: the value to round
+ * @y: multiple to round closest to (must be a power of 2)
+ *
+ * Rounds @x to the closest multiple of @y (which must be a power of 2).
+ * The value can be rounded up or rounded down depending on the rounded
+ * value's closeness to the specified value. Also, there can be two closest
+ * values, i.e. the difference between the specified value and its rounded-up
+ * and rounded-down values could be the same. In that case, the rounded-down
+ * value is preferred.
+ *
+ * To perform arbitrary rounding to the closest value (not multiple of 2), use
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
+ * roundclosest - round to the nearest multiple
+ * @x: the value to round
+ * @y: multiple to round nearest to
+ *
+ * Rounds @x to the nearest multiple of @y.
+ * The rounded value can be greater or less than @x depending
+ * upon its nearness to @x. If @y is always a power of 2, consider
+ * using the faster round_closest_up() or round_closest_down().
+ *
+ * Examples:
+ * * roundclosest(21, 5) = 20
+ * * roundclosest(19, 5) = 20
+ * * roundclosest(17, 5) = 15
+ */
+#define roundclosest(x, y) roundup((x) - (y) / 2, (y))
+
 /*
  * Divide positive or negative dividend by positive or negative divisor
  * and round to closest integer. Result is undefined for negative
-- 
2.39.1


