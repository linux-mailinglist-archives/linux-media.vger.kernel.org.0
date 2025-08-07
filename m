Return-Path: <linux-media+bounces-39012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C74B1D573
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0900566431
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E02641FC;
	Thu,  7 Aug 2025 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MDs7HNL1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77922262FE2;
	Thu,  7 Aug 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561093; cv=none; b=aS970ZFoir1t5yOOG6tURlWt8qBhGJe+/t2zNB0aE82yYjuRq9CPf0sdGmlLgt095jqn4UxnIdwHGMoLD9vujyPrDi0qYNpmY68J8fNnJm1n2Ws4HoGkxGV7iY2QJBeN8IEDShQhyarHgDoZxAkV0Z/kLUmTvQL1JeTRzGmoDGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561093; c=relaxed/simple;
	bh=TFIUgK2aOX5TX4HMKE29RL1uFMGFzod30r7XRcxabxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3FPjTb76IEvhXWLgzkNNLW06Yr34FyjRHma/f0TK2OGbR86+9MawTeetPOasV7QNxaXRHqBq5XXbZ8KlnqPWBzge1F2jQaDoUPHmpIqF6Kymx1SU3lPNSMsBROYRT02IJLQ1u4GOQ47HxVcPf11K+0DURRONJtQjHgH5rDOQHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MDs7HNL1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779Cv6K003598;
	Thu, 7 Aug 2025 10:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfOd4e6XeVxmfQvad9001hhfk4OBVv0XSm0TtXLPd4g=; b=MDs7HNL17fNSwGk6
	AHElMkL6HMmOgar6GN+xUi+X6aZduC6HwdZ6Qfcav1yex1IekDryB4BFVTQPsWdc
	fnxlQz8A23aAYENgfZyEG1kz4VQtpGACJiRHyK6hardOFTVL9PwJMVhe585lUgxV
	HL42aXG4iEw9VN86DyelkJRNN85lfzqBuh0l2tiMTsEOM+BJ/GiGMdbE3E5TeC1Q
	Fwxqc/HcXohjN3I16zZHIOvdP2SihKSxERIoMBeK5xI/sxIxa322jtgPUrX42z2a
	Ui6/KDpevLtI1w9xZFqaaPBmNQYN7cGdlf69hHrFXCDMbDGAcUfZaNuzD/NYXKHj
	27SlJg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyadv9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:04:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577A4eRl032483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 10:04:40 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 03:04:36 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
        <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        <stable@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 1/4] misc: fastrpc: Save actual DMA size in fastrpc_map structure
Date: Thu, 7 Aug 2025 15:34:17 +0530
Message-ID: <20250807100420.1163967-2-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L_5vc8yWW-FlF5f4y_W9vN0FqyZwUEXF
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68947a39 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=xfFNeJADx1FHDao19vwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+HpSXYNuk5Mc
 wqJ4eGW17a/X/NhiZl7b5IakrErNmXKjEjEhlCOZ7xBZEKiDTpcZ5+Dk8hgQYDa/gWW2Vtfw0w3
 s57q5mq+5OS9scotcxWEbfUQvlVU/6y0yIlpcVoDodPxPXLIzxa2GGdnAno9P3J2Z3yGAAwkIox
 g+GJ/ecKUUa5GWv6Dzn/SmQ8rqoGzbucubd8hSJ1GxGSroohtyDtnFsfPfPsi1F93E8c5OOOmy8
 zb6q9hJyk3PpaN0uaoxodOB+JHnjmPK9kUkrMoJnuN1nIBbTCpGx1mbjp0uPj/qiyvMDBUmC/vC
 YqL36c3lQFFRwNeEPl2KO10kq3GzrfE9PfaIbBC8j2Ram6/Y9rHMwz5IGBxW08hRDbq9D3n/84X
 0+dzzPJU
X-Proofpoint-GUID: L_5vc8yWW-FlF5f4y_W9vN0FqyZwUEXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

For user passed fd buffer, map is created using DMA calls. The
map related information is stored in fastrpc_map structure. The
actual DMA size is not stored in the structure. Store the actual
size of buffer and check it against the user passed size.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 53e88a1bc430..52571916acd4 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -323,11 +323,11 @@ static void fastrpc_free_map(struct kref *ref)
 
 			perm.vmid = QCOM_SCM_VMID_HLOS;
 			perm.perm = QCOM_SCM_PERM_RWX;
-			err = qcom_scm_assign_mem(map->phys, map->size,
+			err = qcom_scm_assign_mem(map->phys, map->len,
 				&src_perms, &perm, 1);
 			if (err) {
 				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
-						map->phys, map->size, err);
+						map->phys, map->len, err);
 				return;
 			}
 		}
@@ -758,7 +758,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
 	struct sg_table *table;
-	int err = 0;
+	struct scatterlist *sgl = NULL;
+	int err = 0, sgl_index = 0;
 
 	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
 		return 0;
@@ -798,7 +799,15 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		map->phys = sg_dma_address(map->table->sgl);
 		map->phys += ((u64)fl->sctx->sid << 32);
 	}
-	map->size = len;
+	for_each_sg(map->table->sgl, sgl, map->table->nents,
+		sgl_index)
+		map->size += sg_dma_len(sgl);
+	if (len > map->size) {
+		dev_dbg(sess->dev, "Bad size passed len 0x%llx map size 0x%llx\n",
+				len, map->size);
+		err = -EINVAL;
+		goto map_err;
+	}
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
 
@@ -815,10 +824,10 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
 		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
 		map->attr = attr;
-		err = qcom_scm_assign_mem(map->phys, (u64)map->size, &src_perms, dst_perms, 2);
+		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
 		if (err) {
 			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
-					map->phys, map->size, err);
+					map->phys, map->len, err);
 			goto map_err;
 		}
 	}
@@ -2046,7 +2055,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	args[0].length = sizeof(req_msg);
 
 	pages.addr = map->phys;
-	pages.size = map->size;
+	pages.size = map->len;
 
 	args[1].ptr = (u64) (uintptr_t) &pages;
 	args[1].length = sizeof(pages);
@@ -2061,7 +2070,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
 	if (err) {
 		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
-			req.fd, req.vaddrin, map->size);
+			req.fd, req.vaddrin, map->len);
 		goto err_invoke;
 	}
 
@@ -2074,7 +2083,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		/* unmap the memory and release the buffer */
 		req_unmap.vaddr = (uintptr_t) rsp_msg.vaddr;
-		req_unmap.length = map->size;
+		req_unmap.length = map->len;
 		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
 		return -EFAULT;
 	}
-- 
2.34.1


