Return-Path: <linux-media+bounces-12363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD38D6800
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 19:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3195289589
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 17:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B479E176ACD;
	Fri, 31 May 2024 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BBSWgNw6"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B30F158200;
	Fri, 31 May 2024 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175808; cv=none; b=Q4C7RReA1C4qWjgVf3Ze3ddOGx5bTG6qKDZ3cbGOSDvFK0RJN93iUREJ1X31xrYkcWhl/fSYc+Kol7mV1Xzge1BZY1/FEQV6S+hpSWMAmGHI7ESGoE09dj+Vi7B7UETw0wIGP+Em4J02Q2h9wQg2eOuRNb9jWFLNk/hOWesIuW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175808; c=relaxed/simple;
	bh=hnJBp9J7yr7ugaoLdHGXWZ09ZEPMxcDCxL6JIXMkwrI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlyhjX1NsT3B5tbFTQisG0/BjFAgq6zoJIFldCGAl3rXOEj31TYpPah7sn159HM7NTgAw9HdaVi0fKw5PfbtXUEuy2vIaFRfzNrPIXMpO4bsXUrjQOi5PKRziSuBWKQCDjuNJlUu64y9F6TogCKDtYzdC3Ru1UG1DGVdzJQfe5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BBSWgNw6; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VHGUnh063193;
	Fri, 31 May 2024 12:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717175790;
	bh=Spits0njPC3lG9fqR1Is5PtKb6tj7QPAJ4pQ0WwxGSc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BBSWgNw6UmJVacjLOKfaYU+SY9Yaef4waOYPtoyWqRc3yOj8t+Bg+naKZA3DMXljg
	 2QnaPz1phbMSD6sNJFx0KD0lVYHspnmJeT8wCb+qgE5WFV+653pSKhMGHLoU6a3za9
	 J/o/HCHTFy/R+/VaTgToOONVAqtos5lfAssVIrhA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VHGUZb026880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 12:16:30 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 12:16:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 12:16:30 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VHGTMK080326;
	Fri, 31 May 2024 12:16:29 -0500
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
Subject: [PATCH v11 09/11] lib: math_kunit: Add tests for new macros related to rounding to nearest value
Date: Fri, 31 May 2024 22:46:28 +0530
Message-ID: <20240531171628.1306389-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240531170229.1270828-1-devarsht@ti.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
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
V1->V11 (No change, patch introduced in V8)
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


