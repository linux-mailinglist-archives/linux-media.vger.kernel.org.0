Return-Path: <linux-media+bounces-12743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7079004FD
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD110B29062
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94FD196C9E;
	Fri,  7 Jun 2024 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kfm9fNc7"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864019414B;
	Fri,  7 Jun 2024 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767072; cv=none; b=TSipNGrIdMZWnlU86HObfBiIyzblmVdBDHQmpA46YqnujPHUaTyFO+LY4DOcDgXaudGa1+WmhmlCUpKfg5lr9VAhk6C79zeq2j5FeHtjVpz59CZsBHO3NAyp+rkddXHSqozTEORg1d1jjVCjYQysddh7NlsszTOVXCijAEe6aW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767072; c=relaxed/simple;
	bh=FINJunvslvsDft6X0FCW9fIW4x9HDOR96bpphV+WFCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XQ3BiFTMfur1//35lLaUKaOiNbxGacSbmM6W2pggg6Xfon1JoRTAKq/3gOMICpZgmo4QcHA3fdQ5waScBw4im/GCnUnI+G3Fku45f6llgXaLNySIyUowNREtyKOqrrWQym81+at2R53YpOqCkI/LEl6xwjoinjrS5dKHUR76Vho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kfm9fNc7; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457DUs0Q086595;
	Fri, 7 Jun 2024 08:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717767054;
	bh=wT+sQQdkJtU/Yzp+KDhp78KwpzqYXgXkTsAS0oqdKjo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kfm9fNc7bGqRLA/2gSux2n+ddxvpW/qyBK2QZeIzk79EM1qhzrkx/VnsXk+VELHQ4
	 L1Yyqj6Tnsga/SY1Cl6hVcUPG6ASOgFmRz1y4J5jPvrK6isvMqPMSpakbkt0WVIZXc
	 vQYdrV2PIZk2m/UUUVOjZ9uTbh65yVeEp+FahcNQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457DUsUt110033
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 08:30:54 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 08:30:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 08:30:53 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457DUr5d116566;
	Fri, 7 Jun 2024 08:30:53 -0500
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
Subject: [PATCH v13 08/13] math.h: Use kernel-doc syntax for divison macros
Date: Fri, 7 Jun 2024 19:00:52 +0530
Message-ID: <20240607133052.3555642-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20240607131900.3535250-1-devarsht@ti.com>
References: <20240607131900.3535250-1-devarsht@ti.com>
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
V1->V13 : No change (Patch introduced in V12)
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


