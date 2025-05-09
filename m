Return-Path: <linux-media+bounces-32116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52576AB0EFB
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55EB97B44C1
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397CD2820DD;
	Fri,  9 May 2025 09:28:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635C280A57;
	Fri,  9 May 2025 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782903; cv=none; b=Qq6BrpXTBOxHREcYnFAeRSEkFYd2Ewo3Tw0PZBY8lYaalrUWj0gv4wBTFNd2oeg37cu9ALqBwQGThkF4hn/JvuPFHiG+3ant//AxbZuM3gcNONqCAsewqOvGMCMqO07eF3HMZK2C2A5P26IkvBcg5zPACnd9IkC+TOubq8SUf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782903; c=relaxed/simple;
	bh=dCsXi84UhimhrxsYV/BtTeEkqT1oQoKtLpb60nGAJws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=euTTO+eA2QKDbhRJykDdlStUlAe+Urf6ChzYnTGMhf6Ec2HH2Oubuhi8A+8SJLmBEogrbfd6I61UvaKexHqfsb0+XWAqGbmRoG6UHIgGk4U0Yv/rGyIe7UGhYfwD9cMa2XAb0fXfeVYWeKhWU0L/NK9CPe9+vAAy6bDRlZDZQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498UaT2012563;
	Fri, 9 May 2025 02:28:09 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f05g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 09 May 2025 02:28:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 02:28:09 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 02:28:05 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <jianqi.ren.cn@windriver.com>, <fullwaywang@outlook.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.15.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Fri, 9 May 2025 17:28:05 +0800
Message-ID: <20250509092805.3242802-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JPDXlUU78oy8GWbRgHEFoe2a2inWsnIL
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dcaa9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=t7CeM3EgAAAA:8 a=7f2alXSBUxmpNkzq_swA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JPDXlUU78oy8GWbRgHEFoe2a2inWsnIL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5MCBTYWx0ZWRfX0AUpPuVIhF8K 1HdCfPaiGDVHFj2cglJ38I3OcM4xeqGSTn07eE5r9XdZqr6686sT7Gg1PwGY3+c6FBMyYLo3tSM lUzAWuEHXkuNnNONvOwjcC7+HKBL07n3GWpoEMw02jmt2plgGBbUmXoBUkuZO968snYCbtbXf2f
 UhQvsrKK8Dhw6MKafkZhZ8231h6r1hkB5w0y+q9KHuGTVCVRpGvSawD0M81bKs0zLQrZKnncuxe 9YvtzfM5n8dPlMWubMACAR3Jp1Bl2JtF7kEPONa45/hjQ5uWh3YIFvSubthdqNS2idNz8hzDAgK Y+W1sjAK0uOpPe/BP8155ZLPaAoSFyEkMN1TDIbiBDLXKqsD/cc5TuXxiXOWS2CW6YOQ1P+wDSr
 6NFwhCsQjomRz1HIQFuthMPdWD5He75UHnOsan+RZcNj5+bHzaKi0ytoZuBQHCw53rwQjsH/
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090090

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
[Minor conflict resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..27f08b1d34d1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.34.1


