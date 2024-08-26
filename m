Return-Path: <linux-media+bounces-16838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393195F4A9
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3BA41C21D30
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DF61925B0;
	Mon, 26 Aug 2024 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s/+xySvw"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5081946DA;
	Mon, 26 Aug 2024 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684931; cv=none; b=bDskzeREGPNCOurSxH4N6Mybr3F+ZDVbNFGypn0nRIHAcmtyEkJo0DFUnp6HxougHE1zb73Lmsy90rc4FIShMujxSLM8Ydg0QWxu7GOAfVIWMtoFGwqqaNGCCkOKgbq2ByO2xlLrRXCQtmfiCBcFQvyPsAo8O2s9xj5SQWg0Y3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684931; c=relaxed/simple;
	bh=9YdgDY/M9CMIyYAOwRThPKkgv46VjZMo/nEM0y4XkI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfiGsagaSurbCUPBE0A4MXaHsAVicHDhujhxmy/B4R+vTOIe8RFh1hp0TEaOL3Qci/SY0cRlS34dXuWJLBwkRAE9KrM8fEAF+ogWduYxVbdC3u2vQKylZkGLn3pipEEuML2U3zRekfhfDw1tSt40TST4zWzCJd8zGjuTUNAFhYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s/+xySvw; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8VmP068668;
	Mon, 26 Aug 2024 10:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684911;
	bh=iSfjNTDiDOpSy3E/xP7QfbTcn9KBKLf8SDFz8hsnSTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s/+xySvwHOo4naesYdwow7Trc/jN6eIbwsxYDL+YBfRL3eqJ36kOL62YLraWBNcgo
	 iEYwlxEKxEPFJ2caF0sWJ6qjVdbz1uUm5zMbdf9PFq95vYDhIlvwoZBl3D75ut8Rqe
	 gVspNi+j+c0KrQSvrNaVm12ni0d4fb1clydtqYkg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8VNq115157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:31 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:31 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8Uwd100597;
	Mon, 26 Aug 2024 10:08:31 -0500
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
Subject: [PATCH v2 5/6] lib: math_kunit: Add tests for new macros related to rounding to nearest value
Date: Mon, 26 Aug 2024 20:38:21 +0530
Message-ID: <20240826150822.4057164-6-devarsht@ti.com>
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

Add tests for round_closest_up/down and roundclosest macros which round
to nearest multiple of specified argument. These are tested with kunit
tool as shared here [1] :

Link: https://gist.github.com/devarsht/3f9042825be3da4e133b8f4eda067876 [1]
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
V2: No change
---
 lib/math/math_kunit.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/lib/math/math_kunit.c b/lib/math/math_kunit.c
index be27f2afb8e4..05022f010be6 100644
--- a/lib/math/math_kunit.c
+++ b/lib/math/math_kunit.c
@@ -70,6 +70,26 @@ static void round_down_test(struct kunit *test)
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
@@ -95,6 +115,18 @@ static void rounddown_test(struct kunit *test)
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
@@ -272,8 +304,11 @@ static struct kunit_case math_test_cases[] = {
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


