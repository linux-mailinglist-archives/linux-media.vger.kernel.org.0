Return-Path: <linux-media+bounces-11436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B6E8C4F10
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 12:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547A71C2042F
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 10:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E45139593;
	Tue, 14 May 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ENsGStoM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5BE139573;
	Tue, 14 May 2024 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680265; cv=none; b=moAVMuiPUEX6o8OXymgKGiQed4IsEwUCCpBampPxrGFoXw0jt+7T9VFUdIcXvVcxMj6wo+WH6VDYM1+btZ+SRRyBF5+RVOWfY2azL/GlDvGI+iIp/sG+75uAxN/z/g7SS46YNjhG2SGHe7XLhXzDJ9SVpdDgJ4c66Fa3CMUhdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680265; c=relaxed/simple;
	bh=1ddMESPRbR/Tq3udfUb04EEVR0bcfeNGOe07JV2hApM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mk1KSsdMD/gwnHfCEL6pVZbrDL8eOIcLRJCmN8pnEfEg/VYgObzp2fw+4H1AhcJcM9PuTNLP0Y8NkCug847EuZBKnGrB40OOB66sJQ0nyHFdK7fcYN6te6y8ylKmVR7Z/CzaVHrBmPZhDoKAaRqEsSyDUQt0VieFj571CiBpolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ENsGStoM; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44DNhu1V010098;
	Tue, 14 May 2024 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=9Ca2lgPO30idUTxJE9jJD94U/9M5vevTe/e35F13yVY=;
 b=ENsGStoMm5TGxgoUWOrONQloYKZGLIrULxv5JytIdwrSBG3UBHfXJgbsJ3EmpXfB4GHH
 9D4rn3ai0f6cQfL3YRxSGZ8YaJD4FpUsgKwGTY8yVkVA0YiV++EOuRpZBWeklxwPAUkG
 48zLlhAKL4HqR2K+CJje3XVPD1wE2Z3Xj7vB37y9nHpSqgBlGddGBX64fskCwtf0wRDN
 DcmnAy/LGEvrcur/gsIphYllmXfh+D44CVZw8ltr0izk8ohacxuQLbjNBAkSyuOQXA8f
 79fI/3a0lDZehALLb8A3VHJ4R9c6p7wNZRQWG74so9jrr3SrCx1zo8zjYlcsyBeOzCV0 Hw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3twyrv35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:50:43 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44E97a6q017298;
	Tue, 14 May 2024 09:50:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y46yj89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:50:42 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44E9ofNK020667;
	Tue, 14 May 2024 09:50:41 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3y1y46yj7q-1;
	Tue, 14 May 2024 09:50:41 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH v2] media: imx-pxp: fix ERR_PTR dereference in pxp_probe()
Date: Tue, 14 May 2024 02:50:38 -0700
Message-ID: <20240514095038.3464191-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_04,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140069
X-Proofpoint-GUID: oBgolkqJvJyd9dlzhQgK84oTp90jMzCq
X-Proofpoint-ORIG-GUID: oBgolkqJvJyd9dlzhQgK84oTp90jMzCq

devm_regmap_init_mmio() can fail, add a check and bail out in case of
error.

Fixes: 4e5bd3fdbeb3 ("media: imx-pxp: convert to regmap")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis and only compile tested.
v1->v2: fix error message, we dont need %d in dev_err_probe()
---
 drivers/media/platform/nxp/imx-pxp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index e62dc5c1a4ae..e4427e6487fb 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1805,6 +1805,9 @@ static int pxp_probe(struct platform_device *pdev)
 		return PTR_ERR(mmio);
 	dev->regmap = devm_regmap_init_mmio(&pdev->dev, mmio,
 					    &pxp_regmap_config);
+	if (IS_ERR(dev->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->regmap),
+				     "Failed to init regmap\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.39.3


