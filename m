Return-Path: <linux-media+bounces-11434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B541C8C4EFB
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6AA21C21650
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 10:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C2132808;
	Tue, 14 May 2024 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zqf3aEP7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E96DDC0;
	Tue, 14 May 2024 09:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715679925; cv=none; b=WKqPf4AGy52cWENbLy65eYz5sbXEvCQF3cQt9yK6yJDP8cj4Hy5M1/quxvX6d2fLQqIjkG1C4bjD/VhWfFvFXe+zhtdYgHcQJ9lc/IXTl6Uifis/baGZNXUgP9iqrxp6HYbxsD5oa+yU769AMeQEFKaXfRcfGigE+0ssditTodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715679925; c=relaxed/simple;
	bh=pRt0UK+p32yjKIlzIRv+YlIUjQjs9sQJEBuQBv3iEl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHlaGA5hJqbPwn4jkZuruKMgUbqt6giuYvu11VNEmA17Tm6GQdzyZJrPEjfKj6Kg6ZTfO/qwKSyY3xoUMGe5zexHU1kRiw/iCP2rDyJ5u3rL4ID/X9cSfomQl9YjYAbr1q5X5qCVeSAvTJoQ5i/2/qVfD4BrrA8Q31ny1zXMEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zqf3aEP7; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44DNhuB0010109;
	Tue, 14 May 2024 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=62WFMf+jWRmrTWMzL27i/aBJ5QjdMfSfWVKxAzeuhrI=;
 b=Zqf3aEP77coi/pYABON1BBVVjk/VKKjBiTtFPqwHhsjaZmvqoFrVl3Ibn0G1zaFdoAtQ
 ueFuzTIkZFob1kJb5TQfA4tc7zJf5Sy3/xWYlBrAa0y97mlOK6IKwp/Tl41xe2/CXYZG
 FeyyFcyIlY1ysNyyuXHYaZ1xIAiKDh/uf2ZYifg2htUWQuL8y8f04TV3jxXovWEb8JdD
 wFXBSZFaO08QNqEtipFb3HZnyP9gvQv6Af45XYk0zkMltVDZf0yy75jOIYte9PmtOKfF
 7+laHjcMdS6ETLZ7y5Eq8nbr9B/DCj7wBUNZ/Wmoz8KVjmPgXm0147qU3W/MJhgrHz5L 3w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3twyruu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:45:03 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44E8tCtB005720;
	Tue, 14 May 2024 09:45:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y4706b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:45:02 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44E9j2xs002863;
	Tue, 14 May 2024 09:45:02 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3y1y47069e-1;
	Tue, 14 May 2024 09:45:01 +0000
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
Subject: [PATCH] media: imx-pxp: fix ERR_PTR dereference in pxp_probe()
Date: Tue, 14 May 2024 02:44:57 -0700
Message-ID: <20240514094458.3463408-1-harshit.m.mogalapalli@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140068
X-Proofpoint-GUID: dGfj8Iyw2b-aEJtXyatdsksXQWBuXPvY
X-Proofpoint-ORIG-GUID: dGfj8Iyw2b-aEJtXyatdsksXQWBuXPvY

devm_regmap_init_mmio() can fail, add a check and bail out in case of
error.

Fixes: 4e5bd3fdbeb3 ("media: imx-pxp: convert to regmap")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/media/platform/nxp/imx-pxp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index e62dc5c1a4ae..58c10156c7a4 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1805,6 +1805,9 @@ static int pxp_probe(struct platform_device *pdev)
 		return PTR_ERR(mmio);
 	dev->regmap = devm_regmap_init_mmio(&pdev->dev, mmio,
 					    &pxp_regmap_config);
+	if (IS_ERR(dev->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->regmap),
+				     "Failed to init regmap: %d\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.39.3


