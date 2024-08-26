Return-Path: <linux-media+bounces-16835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947695F4A4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7037EB2196B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6237F193430;
	Mon, 26 Aug 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wY5VFQHl"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3648218C910;
	Mon, 26 Aug 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684926; cv=none; b=LX2zv4MtnDv1ainH7hmXK2A523KhO0+KAPK0qYtHmIrn92wSqFOc5OE2aJ/hC8CUvkuRQkpNRSXkplPWH27fty4mvis7TRZsiOV+nuaasKdu6SCgQWBhLkMeB22xHL0663HkI9YE+rD5PTFELl2AkcMHylQOGIE7NmHsxG0Xc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684926; c=relaxed/simple;
	bh=DP0gIXWyE308qN/l4qf1+gU6ZdDAgWfbIearBAk4XcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUg21UCTQGSL4XdkbZ+VtJY2G41/FOzu/gpbm73rTADYQURwE6eXf+2oOI6KrzvqpwjDzIFz9slvrsX/+WVjsTpGRh7KfvyzAryWzRvfElCrIWBXsO+JYacohUMrnQx6dALgwWxuSjM6OJDFVE3//xXkRQSQPF/slJo1rGtxz10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wY5VFQHl; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8Rul078716;
	Mon, 26 Aug 2024 10:08:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724684907;
	bh=LwlfODkidCtJkxu5eE64NZ6jjmyFvKpsdw8G3pCd3e8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wY5VFQHlXquC0fWRyQAHQgv7/qmRDtRDzmt/dv/fOtOJMfyY6bQd1EurrhOu6NwzS
	 fk9J5rYOj/ZrW1ptrOezHOLrReFrMZIe7iZsBIgTy5en3BCLPQ9xUbJpTXuZq8NTUh
	 3/jEFupZClOJkh+/ci8G7KfRWinzv/5cM7UYD77g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47QF8RbN057571
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Aug 2024 10:08:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 26
 Aug 2024 10:08:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 26 Aug 2024 10:08:27 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47QF8QxO100807;
	Mon, 26 Aug 2024 10:08:26 -0500
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
Subject: [PATCH v2 2/6] math.h: Use kernel-doc syntax for division macros
Date: Mon, 26 Aug 2024 20:38:18 +0530
Message-ID: <20240826150822.4057164-3-devarsht@ti.com>
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

Enable reST documentation for division macros DIV_ROUND_CLOSEST and
DIV_ROUND_CLOSEST_ULL by using kernel-doc markup and syntax for documenting
them.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: Fix spelling for division and reST
---
 include/linux/math.h | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/linux/math.h b/include/linux/math.h
index b59a02a007d7..f3ba3ebe4fcb 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -140,9 +140,14 @@
  */
 #define roundclosest(x, y) roundup((x) - (y) / 2, (y))
 
-/*
- * Divide positive or negative dividend by positive or negative divisor
- * and round to closest integer. Result is undefined for negative
+/**
+ * DIV_ROUND_CLOSEST - Divide positive or negative dividend by positive or
+ *		       negative divisor and round to closest value
+ * @x: dividend value
+ * @divisor: divisor value
+ *
+ * Divide positive or negative dividend value @x by positive or negative
+ * @divisor value and round to closest integer. Result is undefined for negative
  * divisors if the dividend variable type is unsigned and for negative
  * dividends if the divisor variable type is unsigned.
  */
@@ -157,9 +162,15 @@
 		(((__x) - ((__d) / 2)) / (__d));	\
 }							\
 )
-/*
- * Same as above but for u64 dividends. divisor must be a 32-bit
- * number.
+
+/**
+ * DIV_ROUND_CLOSEST_ULL - Divide 64-bit unsigned dividend by 32-bit divisor and
+ *			   round to closest value
+ * @x: unsigned 64-bit dividend
+ * @divisor: 32-bit divisor
+ *
+ * Divide unsigned 64-bit dividend value @x by 32-bit @divisor value
+ * and round to closest integer. Result is undefined for negative divisors.
  */
 #define DIV_ROUND_CLOSEST_ULL(x, divisor)(		\
 {							\
-- 
2.39.1


