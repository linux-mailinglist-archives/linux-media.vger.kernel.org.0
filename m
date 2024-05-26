Return-Path: <linux-media+bounces-11896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB08CF53C
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 20:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 080641F21181
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 18:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6128B12BE8D;
	Sun, 26 May 2024 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E6jlAkTh"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E912B143;
	Sun, 26 May 2024 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716746992; cv=none; b=Qi6yh+b691XmxnTVmsVvQBtTCGZGVy4y5VfXcwxMJnXG+K0a8UUNZEPufolKj0ExhK7QWFL/ePg6II7lejZXxgQ1BMqlRuRVE4m2/S6ogTxdPnQpfzf/SPDC8fGf6zrPnMzO1JtIkma7KREzfy1looCn2X7yDcj1E9ZbTgw7Z98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716746992; c=relaxed/simple;
	bh=FzsEDR+fwVXbKzfbrheIAWhuCowb1uMWKl6G+rFmcoQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RWalhovkjJK8QoT9wky8ufQT6DCXo07obCyGCf8RwhKyWD/jS6lQtKcfa2aBv5mo3Bd8Oxiho6K499A9LeneXhqZ0EI/1bzOQNs9kOEa1HkP5O5YPDc0Uf8PLt8Tx25AZ92ECS3xWdh+NVpwoM4hqLQs7gaV1FfIDuzow1f03Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E6jlAkTh; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44QI9ZON104342;
	Sun, 26 May 2024 13:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716746975;
	bh=y1Hjy8fYQr2VOfoEmm5DiP6isgRfD/gQrEx4Mu0C/bY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E6jlAkThyH5JC0/YVpMZTynMaG5w7geNIuTjSkFgy1jDHQ+Y017DdCmZbxqfGJKw9
	 gGn9zdpqZdrIjxpea6RD8rgC1ONbuGT0ANXjlDHLGSjgLmZCTZthPCKLJEMvS2KScl
	 hR5Ml1UowB9KCvG4gAHKMq7396F7aUpzuQ8l+ZaM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44QI9ZMm107908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 May 2024 13:09:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 26
 May 2024 13:09:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 26 May 2024 13:09:34 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44QI9YtK098313;
	Sun, 26 May 2024 13:09:34 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Date: Sun, 26 May 2024 23:39:33 +0530
Message-ID: <20240526180933.1126116-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240526175655.1093707-1-devarsht@ti.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Daniel Latypov <dlatypov@google.com>

Add basic test coverage for files that don't require any config options:
* part of math.h (what seem to be the most commonly used macros)
* gcd.c
* lcm.c
* int_sqrt.c
* reciprocal_div.c
(Ignored int_pow.c since it's a simple textbook algorithm.)

These tests aren't particularly interesting, but they
* provide short and simple examples of parameterized tests
* provide a place to add tests for any new files in this dir
* are written so adding new test cases to cover edge cases should be
  easy
  * looking at code coverage, we hit all the branches in the .c files

Signed-off-by: Daniel Latypov <dlatypov@google.com>
Reviewed-by: David Gow <davidgow@google.com>
[devarsht: Rebase to 6.9, remove kernel.h and change license to GPL]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
Changes since v8:
* Remove unrequired header file linux/kernel.h

Changes since v7:
* Rebase to linux-next, change license to GPL as suggested by checkpatch.

Changes since v6:
* No change

Changes since v5:
* add in test cases for roundup/rounddown
* address misc comments from David

Changes since v4:
* add in test cases for some math.h macros (abs, round_up/round_down,
  div_round_down/closest)
* use parameterized testing less to keep things terser

Changes since v3:
* fix `checkpatch.pl --strict` warnings
* add test cases for gcd(0,0) and lcm(0,0)
* minor: don't test both gcd(a,b) and gcd(b,a) when a == b

Changes since v2: mv math_test.c => math_kunit.c

Changes since v1:
* Rebase and rewrite to use the new parameterized testing support.
* misc: fix overflow in literal and inline int_sqrt format string.
* related: commit 1f0e943df68a ("Documentation: kunit: provide guidance
for testing many inputs") was merged explaining the patterns shown here.
  * there's an in-flight patch to update it for parameterized testing.
---
 lib/math/Kconfig      |  11 ++
 lib/math/Makefile     |   1 +
 lib/math/math_kunit.c | 290 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 lib/math/math_kunit.c

diff --git a/lib/math/Kconfig b/lib/math/Kconfig
index 0634b428d0cb..832c6989ca13 100644
--- a/lib/math/Kconfig
+++ b/lib/math/Kconfig
@@ -15,3 +15,14 @@ config PRIME_NUMBERS
 
 config RATIONAL
 	tristate
+
+config MATH_KUNIT_TEST
+	tristate "KUnit test for math helper functions"
+	help
+	  This builds unit test for math helper functions as defined in lib/math
+	  and math.h.
+
+	  For more information on KUNIT and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
diff --git a/lib/math/Makefile b/lib/math/Makefile
index 91fcdb0c9efe..dcf65d10dab2 100644
--- a/lib/math/Makefile
+++ b/lib/math/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_RATIONAL)		+= rational.o
 
 obj-$(CONFIG_TEST_DIV64)	+= test_div64.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST) += rational-test.o
+obj-$(CONFIG_MATH_KUNIT_TEST) += math_kunit.o
diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
new file mode 100644
index 000000000000..16263e30a292
--- /dev/null
+++ b/lib/math/math_kunit.c
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Simple KUnit suite for math helper funcs that are always enabled.
+ *
+ * Copyright (C) 2020, Google LLC.
+ * Author: Daniel Latypov <dlatypov@google.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/gcd.h>
+#include <linux/lcm.h>
+#include <linux/reciprocal_div.h>
+
+static void abs_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, abs((char)0), (char)0);
+	KUNIT_EXPECT_EQ(test, abs((char)42), (char)42);
+	KUNIT_EXPECT_EQ(test, abs((char)-42), (char)42);
+
+	/* The expression in the macro is actually promoted to an int. */
+	KUNIT_EXPECT_EQ(test, abs((short)0),  0);
+	KUNIT_EXPECT_EQ(test, abs((short)42),  42);
+	KUNIT_EXPECT_EQ(test, abs((short)-42),  42);
+
+	KUNIT_EXPECT_EQ(test, abs(0),  0);
+	KUNIT_EXPECT_EQ(test, abs(42),  42);
+	KUNIT_EXPECT_EQ(test, abs(-42),  42);
+
+	KUNIT_EXPECT_EQ(test, abs(0L), 0L);
+	KUNIT_EXPECT_EQ(test, abs(42L), 42L);
+	KUNIT_EXPECT_EQ(test, abs(-42L), 42L);
+
+	KUNIT_EXPECT_EQ(test, abs(0LL), 0LL);
+	KUNIT_EXPECT_EQ(test, abs(42LL), 42LL);
+	KUNIT_EXPECT_EQ(test, abs(-42LL), 42LL);
+
+	/* Unsigned types get casted to signed. */
+	KUNIT_EXPECT_EQ(test, abs(0ULL), 0LL);
+	KUNIT_EXPECT_EQ(test, abs(42ULL), 42LL);
+}
+
+static void int_sqrt_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, int_sqrt(0UL), 0UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(1UL), 1UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(4UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(5UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(8UL), 2UL);
+	KUNIT_EXPECT_EQ(test, int_sqrt(1UL << 30), 1UL << 15);
+}
+
+static void round_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_up(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, round_up(1, 2), 2);
+	KUNIT_EXPECT_EQ(test, round_up(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, round_up((1 << 30) - 1, 2), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_up((1 << 30) - 1, 1 << 29), 1 << 30);
+}
+
+static void round_down_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_down(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, round_down(1, 2), 0);
+	KUNIT_EXPECT_EQ(test, round_down(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 2), (1 << 30) - 2);
+	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 1 << 29), 1 << 29);
+}
+
+/* These versions can round to numbers that aren't a power of two */
+static void roundup_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, roundup(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, roundup(1, 2), 2);
+	KUNIT_EXPECT_EQ(test, roundup(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, roundup((1 << 30) - 1, 2), 1 << 30);
+	KUNIT_EXPECT_EQ(test, roundup((1 << 30) - 1, 1 << 29), 1 << 30);
+
+	KUNIT_EXPECT_EQ(test, roundup(3, 2), 4);
+	KUNIT_EXPECT_EQ(test, roundup(4, 3), 6);
+}
+
+static void rounddown_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, rounddown(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, rounddown(1, 2), 0);
+	KUNIT_EXPECT_EQ(test, rounddown(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, rounddown((1 << 30) - 1, 2), (1 << 30) - 2);
+	KUNIT_EXPECT_EQ(test, rounddown((1 << 30) - 1, 1 << 29), 1 << 29);
+
+	KUNIT_EXPECT_EQ(test, rounddown(3, 2), 2);
+	KUNIT_EXPECT_EQ(test, rounddown(4, 3), 3);
+}
+
+static void div_round_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(20, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 10), 3);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 20), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(21, 99), 1);
+}
+
+static void div_round_closest_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(0, 1), 0);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(20, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(21, 10), 2);
+	KUNIT_EXPECT_EQ(test, DIV_ROUND_CLOSEST(25, 10), 3);
+}
+
+/* Generic test case for unsigned long inputs. */
+struct test_case {
+	unsigned long a, b;
+	unsigned long result;
+};
+
+static struct test_case gcd_cases[] = {
+	{
+		.a = 0, .b = 0,
+		.result = 0,
+	},
+	{
+		.a = 0, .b = 1,
+		.result = 1,
+	},
+	{
+		.a = 2, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 2, .b = 4,
+		.result = 2,
+	},
+	{
+		.a = 3, .b = 5,
+		.result = 1,
+	},
+	{
+		.a = 3 * 9, .b = 3 * 5,
+		.result = 3,
+	},
+	{
+		.a = 3 * 5 * 7, .b = 3 * 5 * 11,
+		.result = 15,
+	},
+	{
+		.a = 1 << 21,
+		.b = (1 << 21) - 1,
+		.result = 1,
+	},
+};
+
+KUNIT_ARRAY_PARAM(gcd, gcd_cases, NULL);
+
+static void gcd_test(struct kunit *test)
+{
+	const char *message_fmt = "gcd(%lu, %lu)";
+	const struct test_case *test_param = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    gcd(test_param->a, test_param->b),
+			    message_fmt, test_param->a,
+			    test_param->b);
+
+	if (test_param->a == test_param->b)
+		return;
+
+	/* gcd(a,b) == gcd(b,a) */
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    gcd(test_param->b, test_param->a),
+			    message_fmt, test_param->b,
+			    test_param->a);
+}
+
+static struct test_case lcm_cases[] = {
+	{
+		.a = 0, .b = 0,
+		.result = 0,
+	},
+	{
+		.a = 0, .b = 1,
+		.result = 0,
+	},
+	{
+		.a = 1, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 2, .b = 2,
+		.result = 2,
+	},
+	{
+		.a = 3 * 5, .b = 3 * 7,
+		.result = 3 * 5 * 7,
+	},
+};
+
+KUNIT_ARRAY_PARAM(lcm, lcm_cases, NULL);
+
+static void lcm_test(struct kunit *test)
+{
+	const char *message_fmt = "lcm(%lu, %lu)";
+	const struct test_case *test_param = test->param_value;
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    lcm(test_param->a, test_param->b),
+			    message_fmt, test_param->a,
+			    test_param->b);
+
+	if (test_param->a == test_param->b)
+		return;
+
+	/* lcm(a,b) == lcm(b,a) */
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    lcm(test_param->b, test_param->a),
+			    message_fmt, test_param->b,
+			    test_param->a);
+}
+
+struct u32_test_case {
+	u32 a, b;
+	u32 result;
+};
+
+static struct u32_test_case reciprocal_div_cases[] = {
+	{
+		.a = 0, .b = 1,
+		.result = 0,
+	},
+	{
+		.a = 42, .b = 20,
+		.result = 2,
+	},
+	{
+		.a = 42, .b = 9999,
+		.result = 0,
+	},
+	{
+		.a = (1 << 16), .b = (1 << 14),
+		.result = 1 << 2,
+	},
+};
+
+KUNIT_ARRAY_PARAM(reciprocal_div, reciprocal_div_cases, NULL);
+
+static void reciprocal_div_test(struct kunit *test)
+{
+	const struct u32_test_case *test_param = test->param_value;
+	struct reciprocal_value rv = reciprocal_value(test_param->b);
+
+	KUNIT_EXPECT_EQ_MSG(test, test_param->result,
+			    reciprocal_divide(test_param->a, rv),
+			    "reciprocal_divide(%u, %u)",
+			    test_param->a, test_param->b);
+}
+
+static void reciprocal_scale_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(0u, 100), 0u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u, 100), 0u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u << 4, 1 << 28), 1u);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(1u << 16, 1 << 28), 1u << 12);
+	KUNIT_EXPECT_EQ(test, reciprocal_scale(~0u, 1 << 28), (1u << 28) - 1);
+}
+
+static struct kunit_case math_test_cases[] = {
+	KUNIT_CASE(abs_test),
+	KUNIT_CASE(int_sqrt_test),
+	KUNIT_CASE(round_up_test),
+	KUNIT_CASE(round_down_test),
+	KUNIT_CASE(roundup_test),
+	KUNIT_CASE(rounddown_test),
+	KUNIT_CASE(div_round_up_test),
+	KUNIT_CASE(div_round_closest_test),
+	KUNIT_CASE_PARAM(gcd_test, gcd_gen_params),
+	KUNIT_CASE_PARAM(lcm_test, lcm_gen_params),
+	KUNIT_CASE_PARAM(reciprocal_div_test, reciprocal_div_gen_params),
+	KUNIT_CASE(reciprocal_scale_test),
+	{}
+};
+
+static struct kunit_suite math_test_suite = {
+	.name = "lib-math",
+	.test_cases = math_test_cases,
+};
+
+kunit_test_suites(&math_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.39.1


