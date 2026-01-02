Return-Path: <linux-media+bounces-49846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FACCEE963
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 13:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A67FD3009F58
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 12:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6FB316919;
	Fri,  2 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWsp5iE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OrYrHRtS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB96314B6C
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 12:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358205; cv=none; b=l9uqhRp6Q8PvRB/PhTWaOCFLik56sQImJhctZIEGOT8e3cVeWnNyQiaGGTEDaY3p+xci7pCnQDeKk6NnZk60i3UZR09FnbgLFMG2COfOnTu54J5AUPXQfYzdyX5yRBJZ0hMQGPhyuf/m5f62ahtfJ650+aknK1uKHwsUmi19I24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358205; c=relaxed/simple;
	bh=7Kxp4rafP02LArCpSg5dncCo0KyLbUptXkzMYKxwphg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNOwzGNx2bca5KZcVH6Xuo+lQCXI7U0aKFLD0e9+e2snSTqWirPbGWM8oa1Cw/H2//J6HGSuXwWZvcycdxMvwMVuejeD9KbmUo7XuhVy7rB3cDr2iNnQOHPSTQm0wP5VUzp4lTiKwtZh+xaFQ4HkaKZIgBz6ntqVX9ch345YrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWsp5iE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OrYrHRtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WE2c207464
	for <linux-media@vger.kernel.org>; Fri, 2 Jan 2026 12:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca
	3M1GbB58=; b=QWsp5iE9ab8xJ597i5D7toXb901fdK12hZ33wV4DbhtU2Z9otu+
	quK8vg2iidBwngPCsR0cKI6J1AJRw26HrB+oqJncGhYkaRNgPVILHsXoeUrZ6Gag
	MivsT7qJ5pdhnlliRvJxGXOYGmz8Pr9emp+g7gfaqzzpD7L11fMa6n1O/O2PPyIV
	xv7I5Rx7lskbMSLFgbwy+U9VJhsC/xcUbRi1GqYHJ+U6KHLIKDmcLC+lOlYbjxZY
	8nl+HS5HFWMDQhVqSkQ+tzQ9djHBb6X6WakeOxSJwilaaDGmO7R0xvCg2UuQjZlr
	qNnaJAtPYDdHHMJvRc5hpKc8BgSQrHbqd9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cgjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 12:49:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so265707161cf.2
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 04:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358199; x=1767962999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=OrYrHRtSfrnRB0a5aqFVJRBxepicERo5gRwUYEmRHAyVU3eqBEm6HXZimd3dtyG0p3
         iIGacHa0lsDNj3QxQp3xLZ5PDViLBAlkVFrpZC0B+N5Uc41kTbWO9axstWUeH2+tuuPH
         lv2qxW7MXgHPh+9yxgYm2kX/csxeDo2g6bxwXxxvSuGuifpb+rAfckygQ/sLkMBjSsEP
         V4rOvwyQEzs5KJ9AWbMUKv85Qmyhlvu0h60IrDAfjyD0CB9YM25FjEDgcXbY9H7p1lHM
         zLhT7EdaNRD4HxudZz+MU7Mekh1rzsYa7saoZ7I7i2Xfg/TXmJY5wwGrWrNkEdmEGWLa
         yGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358199; x=1767962999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLiUNZSnAo9t78mimXccZs/6MNf7HQaGBca3M1GbB58=;
        b=kfL0CSFUMRjra06iO0l3Izo67bOb8vdf8552Sg/RNmjLBdo+cwTAyjMdRbAlQvDFc7
         EbIFyIu12OSFk6MFajLn5we55zev/KCgW9KMGqq3uIug9mJJPKS4BUEwz2OKfznltGmB
         zLaN0QvE62O5N25KEO6a5f8XBNPl+7pwGjjkQCKFYIWNN8CAzoZdiwYmQMckUx4yNTCh
         ZL2TFer8bixKOXMtEAqJfgs982N1mYvv2jnP+CV6cEYbsT/jPjNAMsjoFIaZOq54r9xC
         4N8w8CbReuWhC+yoz8iaQ9Rcw70xRxUFlNPbPcQcnInXPeHDbyctdWv+v1AVPlqygATj
         aBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaaKLzak2NDZRXRS+18lAYle7pD6OsUBevpgNOj0LhDtOVXzdSf1hWPZXv0NSBgBoCj+NF5sQmAeCv/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/VUriIJFbHgK6ep+c9XYaHfj3STGmgnzdW3hi1Vzo30hpEdX1
	6JASIPAvgpaQI4fCWhIh0xKjF8MXHrnyG3pZ39MYSgRNfc3M/JdsB9U8YBk2SDJxni/fXPBo/fb
	gZcBL3pbc3KZfnu1K8+XPCToFIK1P7D3DTv6tix7vHuIl5/uN813UgavXD0SyGknWUw==
X-Gm-Gg: AY/fxX4YYpR/ZKps8G3g9kgGoViYiMzjEKWomyBHhnc0gZUbV7zvFOKX3CkuwljcTn9
	t8cSqu3ium3vX9VHxOaScN6ULrAojbNj8hl6fItHWWNu2zhVRb3AO8ucPbqMwYeTrL5fK6TCP2f
	nkeajb3T5PwQz3oJuM9Lw9E7kxQhMITK4lVdE8WT+uFt6G2JE9iRsHsQX8X7H5L/FcTg0KRSAfj
	zBGgc30ZCkiR4mVOYkevsUJkW3H+ndJCqal4BHPcCTDaVMIuzOMugQCPJYJ3xuyaTS1B4SoiDV1
	aS90qBRETs9T02TvhV3xvwyN9hRv1i1V6RCAFYOq7z2zoIXwW7Rs1O6+dnIIk76amerdo5HcbZi
	Pff+8BIeRw7lblQ1YxGIKs5JlXA==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766231cf.27.1767358199049;
        Fri, 02 Jan 2026 04:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZagIXa4K7UiwD5qxXFieVCGwspFO5xpb5gF8sjqKgHUder8jH1otxtn+PNVNQiVr37FiqWA==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr641766021cf.27.1767358198703;
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm84559575f8f.36.2026.01.02.04.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] media: samsung: exynos4-is: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:56 +0100
Message-ID: <20260102124955.64904-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1366; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7Kxp4rafP02LArCpSg5dncCo0KyLbUptXkzMYKxwphg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77zD2hVA5D57NH58kYmrfiyJQ3QXONoILlur
 6D15JdueleJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+8wAKCRDBN2bmhouD
 17PZD/9Lij+SGI18r/gFDiIrQhcXUCtmYd3oxV+HNEyfOOtGYWT5QXmo5Vc4ZPW7hLRHTYxd8z4
 ufqwqpNHT4Bd03OrijU1h1/htWdD4OW3w007czSsAeAi4wtfMk2OrydUHW0ZJny/VB3f9tpnHPH
 u3o6nULvSNMZaj2pzRwHOgNXajwzS8eXEQxrQZ9s3aaBCtAgF+5471vnQSZ95PoAHlnrjFi/wRt
 DyOM5JxExVg2cxFrpC2BKIk8rtgUHMNtxU3OZJj49C1TGHmE//EZ1mTtZ0reC5lkN0D/dKVjw7C
 WI3Vd4eXAB+yrdYhkCIvzPxM4jQ86R7lD3tv1aOTr14lsa5aZTe9UaCHyYjwUQVKC1jlwRt/TW/
 i8BQD/1YzAgObycfzQsOytiVA+Ra/KtVZy5RmwOLfFBDD5c5F/rSVCtxz8eYbX69RxszY/vFPqf
 xeTzfWFTodIr5hbqsod6LOYsMiOQT9vLQLLZRUtbfbtSknHzdNnXxeoAlwUtailGSFYG6TnXBFc
 LYV8Vdhs3uS8Ji6jN7tboxFJqwyWXNWxNE9rT6hoM221vdzHRKIrEiel8t1Zs0uorXtVPPYHL5q
 vhyb8LR0ZeiKkdZTKhFZEZXub73MILtbU3mTTMvlMyuGUQDDysTs9WfV/AfgRQuPGFSCJJovGk4 mjjujELBTaPYcWg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V5Vhy1AVsprdYxTEKrDQocxx9zx9D2B5
X-Proofpoint-GUID: V5Vhy1AVsprdYxTEKrDQocxx9zx9D2B5
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957bef7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i4aJ-GEgVbPWXsRE1ngA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXw24O8kXgSaF/
 gsNbhZSSGwHOv8zm3e9KeDgfPff8iHpfYsmekpnX4yA5XEnlPothy7xETCajjuFsISSmGJZ2IhE
 Yz1NCR2zpxpgXKGVqOUcMzvhAoUziAqewCoyLpQxr/9RjgT721r3fDPdoMdFUzNKzYpKd1+wULR
 bF/ZKfHbfVNbDVsQp7RYez1rifn1JRPypizvIFr2O9ho4GZRhBczf2uSyJ0W1njgS4tPuz/8NEa
 AM0+If1tMAm0bTQDZxl6gotNbqBjVnxtrKYNMEKPzd9k2PDf7U4Sp9Q1uLxzeOzPPpyhNcGaQZ2
 R3VO4zVq6eeo/LYsD1bCKGeQ4YM0yePX4eIGzB3AbUixR1PlfGf/YXriqVjRWaoO/z4H9Qa5q3/
 /K3qW9Io4454CD4elQZRAAROOMXf7/Fpz+6gyJktOK4uv3cSjSS9y9r8fkmCVLzi8jvZTUfeSS3
 nEkOEncVCsxeqpcLWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 0827fdaf455a..14d84cc96831 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -200,7 +200,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
 
 static int fimc_is_register_subdevs(struct fimc_is *is)
 {
-	struct device_node *i2c_bus, *child;
+	struct device_node *i2c_bus;
 	int ret, index = 0;
 
 	ret = fimc_isp_subdev_create(&is->isp);
@@ -208,11 +208,10 @@ static int fimc_is_register_subdevs(struct fimc_is *is)
 		return ret;
 
 	for_each_compatible_node(i2c_bus, NULL, "samsung,exynos4212-i2c-isp") {
-		for_each_available_child_of_node(i2c_bus, child) {
+		for_each_available_child_of_node_scoped(i2c_bus, child) {
 			ret = fimc_is_parse_sensor_config(is, index, child);
 
 			if (ret < 0 || index >= FIMC_IS_SENSORS_NUM) {
-				of_node_put(child);
 				of_node_put(i2c_bus);
 				return ret;
 			}
-- 
2.51.0


