Return-Path: <linux-media+bounces-12518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D92628FB071
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 12:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 168341C231C1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 10:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C61145336;
	Tue,  4 Jun 2024 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J1OsLLm5"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F63144D0B;
	Tue,  4 Jun 2024 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498318; cv=none; b=Ifd0PHq/r8/u+D81Mc+BE6tf3DQrAZ3pzOVYWrdkeIQa4NmiB2ArqbPDbIbOavAdDXo0aVl59iXB4F2DAyG5V35GE4zB4R3oaGI8rC+PP16eV175nDlavUv//FK0+2wMNz1W347g5LBeJUjAqL3g0L80/9yAQjmf/A56V9PHTnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498318; c=relaxed/simple;
	bh=FuA1WcnBPszbIPbLmTvMS8kdJafvCN4L5VjRSOgRtFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDVwLFT7b+OtzPcz98jLrSKaYZEAKzpyKXIBwzd5n0dxh6efa0TjFHEsutaETwVFwsJ48plnZVmulrX3j+80U+mu5cJAfuugIQsDDrtFNp6/U6Z/4zf4TZp8kHfkjgRIfW9uNEGg184RZB3lTS1SP6WkfcYSwcCKkDHyNdKE0xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=J1OsLLm5; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 454AplfQ085785;
	Tue, 4 Jun 2024 05:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717498307;
	bh=BYFA+37pk1fG/ZKarRHnqpVvX/8BGXWnojqY8CdQTlc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J1OsLLm5R5Mh9c/ZEyB477JB7M3Pyd7lbTjxaktAXK7NWCaTqU4ohPbv5T6Ky/Xsw
	 TasjEA+vg9ELqvon9Z8EMbE3+1NMtZdyNR+cNEYcIkCRzvwWezPTaVEB9N+5G3VaTE
	 hkV2kcLbIpOUST2mmxTFpkHOP59nDA600N0WrS3Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 454Apl8P117893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Jun 2024 05:51:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Jun 2024 05:51:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Jun 2024 05:51:46 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 454ApkXt073514;
	Tue, 4 Jun 2024 05:51:46 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <andi.shyti@linux.intel.com>,
        <p.zabel@pengutronix.de>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <devarsht@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>
Subject: [PATCH v12 08/13] math.h: Use kernel-doc syntax for divison macros
Date: Tue, 4 Jun 2024 16:21:45 +0530
Message-ID: <20240604105145.2254442-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240604104001.2235082-1-devarsht@ti.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Enable rEST documentation for divison macros DIV_ROUND_CLOSEST and
DIV_ROUND_CLOSEST_ULL by using kernel-doc markup and syntax for documenting
them.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V1->V12 : No change (Patch introduced in V12)
---
 include/linux/math.h | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/linux/math.h b/include/linux/math.h
index 79e3dfda77fc..2ab9489bba81 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -140,9 +140,14 @@
  */
 #define roundclosest(x, y) rounddown((x) + (y) / 2, (y))
 
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


