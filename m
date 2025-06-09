Return-Path: <linux-media+bounces-34355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F9AD1FE8
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 450B57A2181
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DDB25E814;
	Mon,  9 Jun 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NXM3MyQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FF25D522;
	Mon,  9 Jun 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476910; cv=none; b=gJ3yd7aY8UyxV/AhA6x/3JGhxM93PZWY+xlmmdOfkMmLkeC/aQoVqbY3AtqNmZ2PF3wSTqbbeutbWuQNNU2Pua2wGP3/hxZcTUgfc5k90h3zSSN/Y9U2LH51ueOP2kNiPgfycOVBs+d4NZNhQ0pTlZA3sje4XZoNI6J8CP84GzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476910; c=relaxed/simple;
	bh=vgwhyh1CxuZb8UdoAqr32qx6vpDjfmzvPWgirIeTlY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WxdwB6+fuXNDWHNlW9J9HunKaZlxGQw/c2IGR/13aYfV/wThqmW/+IoaMq12TMT71Pd1W0c27lKFXlNoCqqs4hDSLX4DA6Oxsqb/52tgth0CA8dyN7w7Kh+sZC9yN8L5WUj7nNm2iWLt4eAnouccAgF72v2cDGuK36WBGHFWwVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NXM3MyQ2; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BFB76031400;
	Mon, 9 Jun 2025 15:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3AGBe95HF3BnVmh4pOJ7r6vQHap+Ggg/Epoh6G8NlvE=; b=NXM3MyQ2f7VgDrxY
	OPXJSZj1NtYDYF3j0Ouy/mLHhPKCVBQklu6zWRERuij5JeCUQgyiSt3I8c7hziop
	DfSUppli4SRGz/sp4fELiLvGzHQBMtGZzzIsqp1pcapHCa1vAkS5dm5g0GV5oHXL
	UCKYmKbzpOh0oFCNy+EITC7JfkDxPtFIxIZWEGBNrf0Tvn1kWrRQ5yBOwaIG+qLs
	PfElFiE7BJSzIQy01zbLmnjivQKvo+NSQsS2XKs1XjpiaCIsVQjzqKFag3860XQY
	nBSIvD2YlQ3I8Z5RHApBPx8i595Qhc92Y8bUrjf4loe7bJl53PDBHUZSsS4BKdt4
	HfNhPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2fxvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 15:48:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A6A92400C8;
	Mon,  9 Jun 2025 15:47:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48A2CBA7F42;
	Mon,  9 Jun 2025 15:46:31 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:46:31 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 9 Jun 2025 15:46:22 +0200
Subject: [PATCH 2/4] media: i2c: vd55g1: Fix return code in
 vd55g1_enable_streams error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-fix_vd55g1-v1-2-594f1134e3fb@foss.st.com>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
In-Reply-To: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
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
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01

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


