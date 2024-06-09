Return-Path: <linux-media+bounces-12788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935890183F
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 23:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161251F2122E
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2024 21:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906584EB52;
	Sun,  9 Jun 2024 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjwIunXd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A74E1865C;
	Sun,  9 Jun 2024 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717967942; cv=none; b=Oytu40bQ9czzsVgf09y8r/ZaZjF6ZNIT8FZruUtv/52+WGsroxsKRdD+vJqR3Hl9uMjDpYGmRY6AaHIUaZgrpmp8OcqER5P8Br7RA6XC+jGrdE0g4LPRxTwBnaTlMoxJrl5TmvwtgRvoWCtd3Ftu2HTy+JF8YTGJMJfr4OQL0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717967942; c=relaxed/simple;
	bh=DCJZ903Iyqx99CG/79GpN7cqrwsDhNajoLZyr3aPV/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=IaLhgxJHqgTgU4TLckw1XzSQzcKB8Ic/HAFcBCeEzqhxRG5SqAAFp01wcyyR9T3/eWd5vL9YRZKS0admNZD4gXrS/oyMzAB++QBq0HWhLsimszdPQW1Im64KcSk6Eif5L9GuGQj9s6UdOqaxK/YFVbKSt5jnRi0+dwW7jxwHhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjwIunXd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459GNmKJ014800;
	Sun, 9 Jun 2024 21:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d2cmoZjvOHFDQVw+eKsX1o
	NmZr/G6gIa9FTXpsTXAMg=; b=XjwIunXdRkFrTXWRjST2lBksfsOqosf+QEXQr0
	2hCeurK5xTGjRxHCOEgQJhHT0+RqOVgEG8l+U3zS3sWDx3I5S4PGXqhSwU3KvU6S
	ueavwIHbBTJMe2Id6vek0cQcJODmJn4yS7OIwQoYz/J0jRCImboGKXjg2y7y+YdA
	BS4JmGbKWdkIrAwJouab/IR1ewq6kT6AiTGLdaIfMpRwAfMhDL2BQmXrN+b1WSAB
	IGkmKIkLFhPs2PqplQaa0GGj/N/8iWWQrdalCe1hUmxoogbn269hWoAtYNDq8OGk
	PGtKf41b7ZfU+TV6+ZHoCxjJiPcDESYDhzsJXUkmmND4GqpQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rtf6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 21:18:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 459LIuBK025496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 21:18:56 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 9 Jun 2024
 14:18:55 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 9 Jun 2024 14:18:55 -0700
Subject: [PATCH] media: marvell: add missing MODULE_DESCRIPTION() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240609-md-drivers-media-platform-marvell-v1-1-c9e6d9e3b4f7@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAD4cZmYC/x3NQQrCMBCF4auUWTsQQwnqVcTFpJnagSQtM7UUS
 u9udPkt3v8OMFZhg0d3gPImJnNtuF46GCaqb0ZJzeCd711wdywJk8rGalg4CeGSaR1nLVhIN84
 Z+0jBU6Bbih5aZ1EeZf9/PF/NkYwxKtVh+pWz1M/exraywnl+AVkSK86SAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: flmcS-XLSDla6OssfGWUGtN70KxYttYi
X-Proofpoint-GUID: flmcS-XLSDla6OssfGWUGtN70KxYttYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_16,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090168

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mcam-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mmp_camera.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/media/platform/marvell/mcam-core.c  | 1 +
 drivers/media/platform/marvell/mmp-driver.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 66688b4aece5..9dfaea56a46d 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -1981,5 +1981,6 @@ int mccic_resume(struct mcam_camera *cam)
 }
 EXPORT_SYMBOL_GPL(mccic_resume);
 
+MODULE_DESCRIPTION("Marvell camera core driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jonathan Corbet <corbet@lwn.net>");
diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index 170907cc1885..ff9d151121d5 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -30,6 +30,7 @@
 
 MODULE_ALIAS("platform:mmp-camera");
 MODULE_AUTHOR("Jonathan Corbet <corbet@lwn.net>");
+MODULE_DESCRIPTION("Support for the camera device found on Marvell MMP processors");
 MODULE_LICENSE("GPL");
 
 static char *mcam_clks[] = {"axi", "func", "phy"};

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240609-md-drivers-media-platform-marvell-4ba62a6a8db2


