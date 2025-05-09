Return-Path: <linux-media+bounces-32115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ABEAB0EF0
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ECCF18879C3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295682750FC;
	Fri,  9 May 2025 09:26:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF92220F58;
	Fri,  9 May 2025 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.166.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782791; cv=none; b=tKnIkMVNfNXteT5/384AmhhEOVzxCAwye7mYDeIV2FpM5DPQCXbWD3Y6O8jywMcGRN2YHhTNm7npW2OYYXCsTQb8ArYVr/xoynn6QMZFKPV21gPX76+cIPpYHCxT9IF5scrz+VzkU1zqtLbyKS50jZMf/rtJLyinjMbkRge8lbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782791; c=relaxed/simple;
	bh=dCsXi84UhimhrxsYV/BtTeEkqT1oQoKtLpb60nGAJws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EJK0hJryj3CBxef47mvIbs/O/JIi2Ai9xDa3WfVFi1vXGBFpR1XpMExr3moJvWAwpTbnS6cWz67tV4NS6ETkbGO5nmvkxlMjDHz3bgEQb7ySD2BHJyGPyFTQvaykw6zPf4Yz3Exe9AUWDHzg1pZPyM+0d4HuBL7YV2mSrMGMvJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=none smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497o2Ag016013;
	Fri, 9 May 2025 02:26:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3f040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 09 May 2025 02:26:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 9 May 2025 02:26:07 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 9 May 2025 02:26:04 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <jianqi.ren.cn@windriver.com>, <fullwaywang@outlook.com>,
        <tiffany.lin@mediatek.com>, <andrew-ct.chen@mediatek.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.10.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Fri, 9 May 2025 17:26:03 +0800
Message-ID: <20250509092603.3242559-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: SVL48-DeQqXfjwk7dSMV-d8Ty7ppsiPb
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681dca32 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=t7CeM3EgAAAA:8 a=7f2alXSBUxmpNkzq_swA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SVL48-DeQqXfjwk7dSMV-d8Ty7ppsiPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5MCBTYWx0ZWRfX3BlONRt2NrMi rmvT9B9ItQ+WklX4O2Ah1qepzPf6Wn5w1eZPcPeGF9gu+SKZwjvHbRw9miLvmT6DMIzr6EtCQIQ Te+Q+dgJxCtAwxi8oQ8HdoOj8KT/l5OrCDEbbPVtPLc+7Gk0R7WyRaSc3JMBErxJ7dnZCtPdK4D
 wzDQQS3EYcNLZbLJ00GPVkcWf/NkBRLVXyX7WrERAK8yc3CAVfT7gpKh3IoprC0zkRVC4fRAEwk ESQDc6gO2B3X3bYZ4tyHgp2cVPVK3JYPeiyMOxq1umkWrSx+lyEwhBtbGH+zHivAYcQ03njaeSZ xc5m5nFIyiyX7oyEq2UgE4feopTUJevIjlT+oQR4clnMULo7ktQWMFJ25eFsF+Wq6G6pay98AiQ
 vBSGMw7MVX8dL7T5ajlODhPDEfYzM0sZtRgziUBQb+HZce0Y9W7zGbvsT4bg+EFZ/dWfLI5X
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


