Return-Path: <linux-media+bounces-12787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F1A901837
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 23:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12B2FB20F9D
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 21:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20D84F605;
	Sun,  9 Jun 2024 21:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W1C1TP99"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFB18C22;
	Sun,  9 Jun 2024 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967006; cv=none; b=Ke89oiIBgPYYubgouY1Q828EXQIMVG20boWBIz1lkOmjKDDbVe6Ogj/aAbm5TaxKD0T8JWafAK9+GvRT/h8ttpBOg/8b/zC2PWoQAoCa2NiD1Fk8I+iLtgHRqeKD3kn6mlQbyE/NA28N5HHmkbOlJtOhRu2E7z4hWsWdTQZcpyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967006; c=relaxed/simple;
	bh=Wl9NG8h/GJ+vj6ODjcz+fX4TjV1msfDj8arPmokIcOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=uBuHbybrslIshCz2tDLxhFPfpiaM1cn2PyiUr5jX/JGC1N380IGTAsglu8pFdkyvKb65arit64euBhA/qP7ZoxsENDW6Uz3dYNiEkfDpg8FkzEeeuxkTkz2G6F2yoeXlDK3VBlH0FSPwai44RFhXBN2cyviCVR1mkDcYmpnt0rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W1C1TP99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459HtLZO024951;
	Sun, 9 Jun 2024 21:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WixHRYN2timxfzVPnpYDb/
	GYF5ejmv1jUPZn2cYpWKI=; b=W1C1TP99e+EZl0v+qBeXnJq3H0ohKYkoOSLApS
	i+ALw7184rLDZ5D9QyXzE6eXkmxeCyFoCpGy3BGkFaATfrUHMP1PP1fJf06Wi6QJ
	W4c6vmS713//ay7RiACRUJplQ0B8WqCK4WXJ5iUabVoX8JbqvGD6hRkaZ28izGox
	6pjDFVXP2O/3TE5OULzW0fxV/pF7IY32oDRwIczopG1wypHuuAg6s9xbFg3P5/eS
	DTIhPNiZd/CIcfyFqYW0jhqq3fZEgEfpkrXys6O9iEegLEK59KexDwxgRbx9c4Xe
	IKws2ZhkmJ9M4ir9IA+jrXuN67AO4pHkLCYA7XqVkepba3ww==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgj5gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 21:03:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459L390m024628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 21:03:09 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 14:03:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 14:03:08 -0700
Subject: [PATCH] media: exynos4-is: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-media-platform-samsung-v1-1-d474799346dd@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIsYZmYC/x3NQQqDQAxA0atI1g2otRV7ldJFnMlowBklURHEu
 3fa5dv8f4KxChu8ihOUdzGZU0Z1K8CNlAZG8dlQl3VTPssOo0evsrMaRvZCuEy0hlkjGkXb0oC
 hfbgmtFUTujvkzqIc5Pg/3p/snoyxV0pu/JUnSduBkWxlhev6AuWorDKSAAAA
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mjFA0Prx5eVWNJXc9abuziiQl1vixQUL
X-Proofpoint-ORIG-GUID: mjFA0Prx5eVWNJXc9abuziiQl1vixQUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406090165

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-lite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-is.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos4-is-common.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/platform/samsung/exynos4-is/common.c    | 1 +
 drivers/media/platform/samsung/exynos4-is/fimc-is.c   | 1 +
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/common.c b/drivers/media/platform/samsung/exynos4-is/common.c
index e41333535eac..77007f1a909b 100644
--- a/drivers/media/platform/samsung/exynos4-is/common.c
+++ b/drivers/media/platform/samsung/exynos4-is/common.c
@@ -44,4 +44,5 @@ void __fimc_vidioc_querycap(struct device *dev, struct v4l2_capability *cap)
 }
 EXPORT_SYMBOL(__fimc_vidioc_querycap);
 
+MODULE_DESCRIPTION("Samsung S5P/EXYNOS4 SoC Camera Subsystem driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index 39aab667910d..0a4b58daf924 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -999,4 +999,5 @@ module_exit(fimc_is_module_exit);
 MODULE_ALIAS("platform:" FIMC_IS_DRV_NAME);
 MODULE_AUTHOR("Younghwan Joo <yhwan.joo@samsung.com>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
+MODULE_DESCRIPTION("Samsung EXYNOS4x12 FIMC-IS (Imaging Subsystem) driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index d1d860fa3454..1a4d75443215 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1662,5 +1662,6 @@ static struct platform_driver fimc_lite_driver = {
 	}
 };
 module_platform_driver(fimc_lite_driver);
+MODULE_DESCRIPTION("Samsung EXYNOS FIMC-LITE (camera host interface) driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" FIMC_LITE_DRV_NAME);

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-media-platform-samsung-f75c4f714f93


