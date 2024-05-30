Return-Path: <linux-media+bounces-12267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA18D50E1
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CBE2840DB
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 17:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571A646421;
	Thu, 30 May 2024 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VLBZVYjH"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA32D05D;
	Thu, 30 May 2024 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717089555; cv=none; b=SBM91ABVghFqLj+KzT6nRnDUA0Rxw9rfii2ojpO/yC+SPIs1cAlKRJKwwrMeX3SmQzsooyTMOL/OW17TGjEq/vlrydcpm7sfCsw379YaQHCkiCRxHT4T9fvjNZoRpiBQj/VvDPaT3Y7YMNO2gCJrW3UFtVlzqQxLjphPpp0Qi2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717089555; c=relaxed/simple;
	bh=vwRGKnBM8n1zsa2BElxhvGNqvaUndHUszAqMTEMU1NM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEksP5+Kk6hzRunuDuunG48yQ+UNrx8/941F/jaxP568Lyx8Fecdk1RztZnCkqujh8CUv1UQNR855B4xHIhE8mMre8E+EOEBVhXkVOqbS8TKxEPRVtfZyyfpWK5dw4KOMpCKF0OD4VjXBWk8NK4lNvB+TzayZZpYMsY/yMBK+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VLBZVYjH; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UHIwZS030014;
	Thu, 30 May 2024 12:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717089539;
	bh=2PogmUk1hSB0bi7VeD5vCAwoLSFJmHO/jgjPWpoPpEE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VLBZVYjHU70VpPh6sTbQpN1WWRBLxGm82mqeqsvxmQjO87WVrLDj0FfsCClCIwFYB
	 ZsPFEPI5q+LbldEVcUvZqPRXOWzcDPW4rmi4tLx5JryCL0IJ8tq8dZXVizjttjjLF/
	 nWD4mLtcyn8xijSVl+Gviw2lOlC63pLxVkiPFFvA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UHIwPM000475
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 May 2024 12:18:58 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 12:18:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 12:18:58 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UHIvv6064687;
	Thu, 30 May 2024 12:18:58 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <andriy.shevchenko@linux.intel.com>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
        <davidgow@google.com>, <dlatypov@google.com>
Subject: [PATCH v10 09/11] lib: math_kunit: Add tests for new macros related to rounding to nearest value
Date: Thu, 30 May 2024 22:48:57 +0530
Message-ID: <20240530171857.2766683-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240530165925.2715837-1-devarsht@ti.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Add tests for round_closest_up/down and roundclosest macros which round
to nearest multiple of specified argument. These are tested with kunit
tool as shared here [1].

[1]: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V10 (No change, patch introduced in V8)
---
 lib/math/math_kunit.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
index 16263e30a292..60b66aa41121 100644
--- a/lib/math/math_kunit.c
+++ b/lib/math/math_kunit.c
@@ -67,6 +67,26 @@ static void round_down_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, round_down((1 << 30) - 1, 1 << 29), 1 << 29);
 }
 
+static void round_closest_up_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_closest_up(17, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up(15, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up(14, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) + 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_up((1 << 30) - 1, 2), 1 << 30);
+}
+
+static void round_closest_down_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, round_closest_down(17, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_down(15, 4), 16);
+	KUNIT_EXPECT_EQ(test, round_closest_down(14, 4), 12);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) + 1, 1 << 30), 1 << 30);
+	KUNIT_EXPECT_EQ(test, round_closest_down((1 << 30) - 1, 2), (1 << 30) - 2);
+}
+
 /* These versions can round to numbers that aren't a power of two */
 static void roundup_test(struct kunit *test)
 {
@@ -92,6 +112,18 @@ static void rounddown_test(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rounddown(4, 3), 3);
 }
 
+static void roundclosest_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, roundclosest(21, 5), 20);
+	KUNIT_EXPECT_EQ(test, roundclosest(19, 5), 20);
+	KUNIT_EXPECT_EQ(test, roundclosest(17, 5), 15);
+	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30), 3), (1 << 30) - 1);
+	KUNIT_EXPECT_EQ(test, roundclosest((1 << 30) - 1, 1 << 29), 1 << 30);
+
+	KUNIT_EXPECT_EQ(test, roundclosest(4, 3), 3);
+	KUNIT_EXPECT_EQ(test, roundclosest(5, 3), 6);
+}
+
 static void div_round_up_test(struct kunit *test)
 {
 	KUNIT_EXPECT_EQ(test, DIV_ROUND_UP(0, 1), 0);
@@ -269,8 +301,11 @@ static struct kunit_case math_test_cases[] = {
 	KUNIT_CASE(int_sqrt_test),
 	KUNIT_CASE(round_up_test),
 	KUNIT_CASE(round_down_test),
+	KUNIT_CASE(round_closest_up_test),
+	KUNIT_CASE(round_closest_down_test),
 	KUNIT_CASE(roundup_test),
 	KUNIT_CASE(rounddown_test),
+	KUNIT_CASE(roundclosest_test),
 	KUNIT_CASE(div_round_up_test),
 	KUNIT_CASE(div_round_closest_test),
 	KUNIT_CASE_PARAM(gcd_test, gcd_gen_params),
-- 
2.39.1


