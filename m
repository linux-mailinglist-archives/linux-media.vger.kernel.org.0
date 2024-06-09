Return-Path: <linux-media+bounces-12789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162190184F
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 23:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60A19B20D5B
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 21:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE28502B1;
	Sun,  9 Jun 2024 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L0yJJWgz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7B2C181;
	Sun,  9 Jun 2024 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717968775; cv=none; b=CL99C6BxhtoTf7ffmEwYnYRrym+jxqbvVo5ZLTwkNTHiYGWMNSY+XBNxDR+q0IikQ3m69s1v9pi7dyUqZfeugfmIsVS+q8qJGzXq+eSCK+zr8TWqg22WAWBQEepnjgd1wF5D2AV/IB7QyBFyEopI73EmaU4mbtpuag9e1SinWVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717968775; c=relaxed/simple;
	bh=qyNhs/9nHQQrhY5yMtobGiHAi6//N3azt7k7xwD+8zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=tRjSCa4rQ4hFI7i2Ne24iU78hxDCrK7BwcxJakF8PmctpmdF0MJFeGFMN5C3sFX6T551WoEKPT9qYdjd7bhU1YS/w5fEEkz+Lua0UIR8FMt786GZbvKCcSrTgqWYH1be3iQTX6tX9x4UAxqCAtGWL9S1U5Sn72BL6bB+UO+rh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L0yJJWgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459KBk7F016532;
	Sun, 9 Jun 2024 21:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CBqHEpHQ9wqAmwDqOHIauD
	O01tXbYO66LS4rFh2JpI0=; b=L0yJJWgzrg0T4gi+AA/IJqTBDMbpl34cAHzfQ0
	I0gTA+QgVaMkfeDFpeReFfLe5yq34tL6+VcFkc2V3tnmp+GTceoUZp6YRjIEfdv0
	9B6PF6OJQxUloyxez5Cqoj8xwSOJunGM4JEZoWUNzQaizGfjXrNq/G7R98BCSNlu
	Dweekxxf7Gr7wXvGU2G5jWqAfrsfYs9UNJ9L/invP/pn2YHS4sZilOcY0DdENE5C
	BT4J7cCfetOrJRvWGJ5wH1D5+34m2LnOSbEWGwN3eVhSU1pcRH/hSq2/20zmMscs
	nV+irh7rn2XkLBq0HWLSlLmqdpSM/dvLgCvqgMn2i4Bsvnmg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rtfky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 21:32:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459LWnBt008039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 21:32:49 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 14:32:49 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 14:32:49 -0700
Subject: [PATCH] media: ti: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-media-platform-ti-vpe-v1-1-b9e6a85f2a10@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIAfZmYC/x3NQQqDMBBA0avIrDsQQxHbq5QuEjPWARPDTAyCe
 PemXb7N/ycoCZPCsztBqLLylhr6WwfT4tKHkEMzWGPvZjAPjAGDcCVRjBTYYV5dmTeJWBhrJrT
 k/Wj90I82QMtkoZmP/+L1bvZOCb24NC2/8MppPzA6LSRwXV9xeFb2kQAAAA==
To: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yazGrEf3MZ6OhEWnbgbCQlI_HklTqOEo
X-Proofpoint-GUID: yazGrEf3MZ6OhEWnbgbCQlI_HklTqOEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_17,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=984 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090170

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/ti/vpe/ti-vpdma.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index f8998a8ad371..da90d7f03f82 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -1173,4 +1173,5 @@ EXPORT_SYMBOL(vpdma_create);
 
 MODULE_AUTHOR("Texas Instruments Inc.");
 MODULE_FIRMWARE(VPDMA_FIRMWARE);
+MODULE_DESCRIPTION("TI VPDMA helper library");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-media-platform-ti-vpe-2ebb82b6182d


