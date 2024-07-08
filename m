Return-Path: <linux-media+bounces-14708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739B92A6A4
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD4D0B21F89
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E28149DE1;
	Mon,  8 Jul 2024 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c689uNQ5"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D9148833;
	Mon,  8 Jul 2024 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454415; cv=none; b=u1vD7y0leCZneaRT0du2cBcQLqCxyFmQ9rnkgWGWgk5KVf4WTcRTaWrqSAuVL9nQoCbgYWqlV+Y++oh/pULzkk297CPI9Qyd2obX3fsw+kSWRlzESznKk5wDI3dIKQRWTr5lF3zwdUYaG7l4YDI3BR8/2QwyY7ux+UqUb/J6G7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454415; c=relaxed/simple;
	bh=Dzj16WkoQ0uTxijbmpmUn2hcMYaC1uqUXIwI05saT5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpSXJPnCXvYFjcUH8zw4V+UREuSX4LKK52R4/LNK7vzmSSWNq9P30sqo541z+DG8NGLK3Kjts/rDFFUMeIWZn1eYHFDhtTpj4rZvSS80Qxinba7MJr+zo+d5VePJHrlNU2HZJRlO6M6S4oIgab6PQmv4ZW3CM7AQpH42G2xhfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c689uNQ5; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468FxlS2054471;
	Mon, 8 Jul 2024 10:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720454387;
	bh=0qZoUSeMngrAAEWNUhR2NY9MfHTCcvjovMCLrsGiDig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c689uNQ5IPk0RSu4GL3Z8CSJk78f02LQdF/X4txJ1XUzWyXkreCK+iYdxFRIGJXDT
	 /SvgSNBWt9yqwjR1iNc+8Xi3j8DCZ3GeEQMW76ug+yJNjgjAW+Kg1Havo2wfqF/VKT
	 /mi2IO9vvSz3buFdvDbneyrEWCCyoUWD+FTHJ+LY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468FxlQm040623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 10:59:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 10:59:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 10:59:47 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468Fxkc2033307;
	Mon, 8 Jul 2024 10:59:47 -0500
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
Subject: [PATCH 2/6] math.h: Use kernel-doc syntax for divison macros
Date: Mon, 8 Jul 2024 21:29:39 +0530
Message-ID: <20240708155943.2314427-3-devarsht@ti.com>
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

Enable rEST documentation for divison macros DIV_ROUND_CLOSEST and
DIV_ROUND_CLOSEST_ULL by using kernel-doc markup and syntax for documenting
them.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
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


