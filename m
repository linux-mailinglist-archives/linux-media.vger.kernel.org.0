Return-Path: <linux-media+bounces-39014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB9B1D57A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB31C7AB11C
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731682701DF;
	Thu,  7 Aug 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BoSI90Rr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A0126E70B;
	Thu,  7 Aug 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561099; cv=none; b=ZxJ9P5Om34eiYdb0jvgoPXP4lTvAtpe+6VjxyixLj0NN+q9gYPnuEWLpY/JQ4/tTf43VAjPDXsLUINkZs5HXtJWItY7TXrk7breSbSwcw1lv/m/RPXOisAj4Np6kYmeVYZTysti8iSxg3uVvwlPjDTAu529wHwuB8E/Zm0kycAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561099; c=relaxed/simple;
	bh=IhlhuCRo0UQkF41FNhRfetdyeIHsFugkQoENB+yfmcU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BaFmguMFQetw7LdrJcu4poGkieSSj0+B9WWAJw+HDE39ByAQ708NWYeXgbnitLM3Bcuz13THg8VFh+bnmy2yJ4NulK++zr0LTYz3QFkAId9ozJfLRKLz4q3dL780I3E7uTMzB6qbshL/Nb0KOFGf8BlkydVJFwkTQWwV2HSvm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BoSI90Rr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DCpS003788;
	Thu, 7 Aug 2025 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXe93JXceflh8PvWfKGGoZ9LbYnD7R/AGqPp/QvmJmY=; b=BoSI90RrJzRA+0bT
	CyvG9QawT/HhZgNGDBZSVWaQQpabVCbNJ6P/C8QdtgfTkwX48mgLwKcyNIK6HQIV
	Liu3fAMjJ5YDOSToLFpcReVqIpq5BneFYDpJZRNlPfJTTJybLZpMNHvm2xUqwzUv
	b1Ous/eK7wLenVWLyvi6+QhBPsalKjVWkOz331vtH6MBn1Z6fyzsnZgZYvIh/NzS
	GHbl86AtDkoxseTCTtMfmxLF0lXO5F1BmsPkePJCKOy3LlJAwdUTPjyWYxJR7oFz
	82IdMl1E4Syt62BL0535/Of028cqe2CBLeeXGKhsZ7U/UEdCOA0LU1lYHzMnQHtg
	RVbh7Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyadva7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:04:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577A4nKq014180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 10:04:49 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 03:04:45 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
        <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        <stable@kernel.org>
Subject: [PATCH v3 3/4] misc: fastrpc: fix possible map leak in fastrpc_put_args
Date: Thu, 7 Aug 2025 15:34:19 +0530
Message-ID: <20250807100420.1163967-4-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 2InUnzV_pmRDese2MSNymiOaOCl6OlfP
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68947a41 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Op9FgWJ_R3wbKKMAuNAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX9NEf3B8OgLmK
 gjvHNvhneRH87gf5vXCI++gCtCr7WWc2ReAL3qxQEDMEnjG0k0YKd4S0ENei6m3GjdR8S5AystD
 QtafHyPMhgsCUH/eA2axYcqaTUagj6zwp8lHjbJ+SGF/Z7d7L3MNz6a0v9vzy+hZsPYkUea+RKk
 f5YMahuuXHbfW2veRtHxaxtw1jpcRH/Xo9KdpUVotnphIjUgOLfTugh/3QUMfa3yVYJMIWufDf1
 86hstApBrmfAvWNabFBtuRWjVf6GA3qtC1KhZ5RBd4RzG5VQNtcaiNE39zpZYgN7BTYBhbzE7s5
 YLEPekX66y0WwjevYFTXXGSKd7doDzEBGpDwNNXD8wUWTKQh+Bd4N/ww4rCzKOlZgVLVR8s5O7Q
 toJmjzor
X-Proofpoint-GUID: 2InUnzV_pmRDese2MSNymiOaOCl6OlfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

copy_to_user() failure would cause an early return without cleaning up
the fdlist, which has been updated by the DSP. This could lead to map
leak. Fix this by redirecting to a cleanup path on failure, ensuring
that all mapped buffers are properly released before returning.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1815b1e0c607..d950a179bff8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1085,6 +1085,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	struct fastrpc_phy_page *pages;
 	u64 *fdlist;
 	int i, inbufs, outbufs, handles;
+	int ret = 0;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
 	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
@@ -1100,14 +1101,17 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			u64 len = rpra[i].buf.len;
 
 			if (!kernel) {
-				if (copy_to_user((void __user *)dst, src, len))
-					return -EFAULT;
+				if (copy_to_user((void __user *)dst, src, len)) {
+					ret = -EFAULT;
+					goto cleanup_fdlist;
+				}
 			} else {
 				memcpy(dst, src, len);
 			}
 		}
 	}
 
+cleanup_fdlist:
 	/* Clean up fdlist which is updated by DSP */
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
@@ -1116,7 +1120,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			fastrpc_map_put(mmap);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
-- 
2.34.1


