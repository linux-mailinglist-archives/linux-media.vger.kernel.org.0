Return-Path: <linux-media+bounces-34384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E8BAD2E5C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4FC27A84AB
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 07:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3461527FD6F;
	Tue, 10 Jun 2025 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HU2Dr8hF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4FE27AC3C;
	Tue, 10 Jun 2025 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539327; cv=none; b=UYsy1RaZg26xFUCiTmWiJJinKzqIW3qoNYBfdn8AjXOpKQkO19VG2EPqe+hGLXQOm/6MYKtq/4SIuJ0tvZH/kuNXTtRMmcnRTrGsIrQ2VBvIwb+Rxjs4Ox0yklWv8Ya8b3nrmMFgB5fyIUsyoX+Bw/e9uZdkWJMByP3ZZj2D0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539327; c=relaxed/simple;
	bh=69Lk3vhK7kxM+f3aRs9NZGKK7v3SZWRNe334x64JVkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mLRyy3WbXLXlEivTggmRjgpGKDIPDvnZM/Ywyhwvs20ZNLhAK3nm1Y16RMTZyzvG0nC/Z0+F12pBovmhEP1IUChGeIz2cKcICyfLA85631qvGQUnKZe85ndlQQatOYbFlDbv9DFogUeumJhbEzrv29/BI2VCfJNA3sK0Jkf6Kjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HU2Dr8hF; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6pmar003209;
	Tue, 10 Jun 2025 09:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PX/y7gliH4I8f98WoXqhCdSxGh4NTXeRFWxdmsiFQgw=; b=HU2Dr8hF0Y8uEhi2
	jI9Kmex0phlqEN7QH8IPqPxPhm+33Fkbetza1JUzm8R8vqrwWuA1mtjb3Irgjo9x
	14++eYZSo5euKqgJeJDY2aV6fYTmDzL7bXF8c/5jBOuoNFOuxZDArhaMhUdklU4i
	9rG3WOYbao01Bs5ESg7i1GMnLlkjd3MKWG3cW6YqL2+DTPw8dhlTCMECU6DK8Bed
	9guOQLzW/a0WEMrYCF+sRuP5MZTTz6nAqo6CjuC2Dnc/BlbLbxSSVEaJ7TRoGvXE
	LhHjFERW94i+QBMGHNeUQLL6TKwvR25h97JJC6WKQyFC6TG/Hn6f5iyH4PCYwaUS
	RnKAfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2k6sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 09:08:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 91B9B40058;
	Tue, 10 Jun 2025 09:08:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EB0AB9DCDD;
	Tue, 10 Jun 2025 09:07:43 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:07:43 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 10 Jun 2025 09:07:42 +0200
Subject: [PATCH v2 2/4] media: i2c: vd55g1: Fix return code in
 vd55g1_enable_streams error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-fix_vd55g1-v2-2-328305748417@foss.st.com>
References: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
In-Reply-To: <20250610-fix_vd55g1-v2-0-328305748417@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01

Enable stream was returning success even if an error occurred, fix it by
modifying the err_rpm_put return value to -EINVAL.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78dd22d9cab03edf4ff3e5a301f8d045e930c997..336dc3c85ac9e695f22aa524e0df6138dc76e45c 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1084,7 +1084,7 @@ static int vd55g1_enable_streams(struct v4l2_subdev *sd,
 
 err_rpm_put:
 	pm_runtime_put(sensor->dev);
-	return 0;
+	return -EINVAL;
 }
 
 static int vd55g1_disable_streams(struct v4l2_subdev *sd,

-- 
2.25.1


