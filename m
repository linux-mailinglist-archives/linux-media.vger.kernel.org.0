Return-Path: <linux-media+bounces-36769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB8AF8A30
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30366E2772
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349C42882AD;
	Fri,  4 Jul 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUxbclyX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FA2877F3;
	Fri,  4 Jul 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615627; cv=none; b=S9izSESE1l7QWdkIyjUY7o3ojOUllJUVavq0z7riu8dN2Ba4duyQiLEib5mza0VUx+5F95sjPJVqenE3/PCg7RsqNSfh+ojTgsVejfotSLGNqLsUXrwAR8FfkQSRmdh73VmZnyO1+fHj5nWmdzpbKwP4pZ9vDg4IozLD9Cdc5Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615627; c=relaxed/simple;
	bh=CCPkkDTnG3P0SeeewUyE2VVrE49g0bg3/xbTp2/W0xQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KPr5YsKWK4MngDm7vJQ4zIF0/plNhaFr9nq5P8zzrijlHaCFKqErYmyXX018nWMJqvr27omovvcnNyb9+TDuDeP5BpUuVhPaGgS0bkPxeBMS8Y6EG6/4lo1Dnz17Blykirhw+wEQMFPN8ZCmgeod/l65GA4aG87qdCyyuVnc8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUxbclyX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646Iwpk007227;
	Fri, 4 Jul 2025 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XK46q5Hqzobm1M9phw2brCy2RlA73mJMO84guBG4pY=; b=jUxbclyXODoiKt4f
	OBI4YW/KvW8iSrZXiUhLQoglGD4x3fFISGuyZjfYqDc6PXPKd7ms4LppNCb0McmF
	j00rDT8GUQYySh0g0QtnfWR407kY1FetguIyhIOYhaCfbP58raGzs+ANexQ0fRfn
	PJCcjWTptMJHuqv5aAwaqO8Uh3MRAD9J3uyJ3bMoZ+HCXr4gw6f7oVVI3WThYiRM
	KA6s+DZJokNzFImRhK6qgM1pbYTXMF+6hwHo9bQqsiwz/qzHGMQ5kCPHkueggkz4
	FRtwDuSRomr4M3Xiq0namqcBWq2ECxX0gRG+lIMjDkIbGy/R81POCuQkk13U8kVX
	p6f5lA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqgpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:34 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647rXVf024430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:33 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:30 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:03 +0530
Subject: [PATCH 03/25] media: iris: Fix memory leak by freeing untracked
 persist buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-3-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1302;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=CCPkkDTnG3P0SeeewUyE2VVrE49g0bg3/xbTp2/W0xQ=;
 b=1tmaWezTVm3wYv6R82Uv3FB71nq1C7kE/rrs6v+RYPJfALmOU5VOR5MLxXgtEPZBEL6GPR6wg
 5fiyxBnpCCUD8J4dCanYAkByIyv9ZbJ66xXJpheneYn+IOXcLMY4QBE
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6867887e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=GUxkLdxIJ5orBtzUV8IA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MDj8h39Vs9H-1_zOLpwdpVEEH1PQeQ8f
X-Proofpoint-GUID: MDj8h39Vs9H-1_zOLpwdpVEEH1PQeQ8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXz3JOpMnPgJsU
 xsMs2/oTDS2Mv1pR6z3WqQnLLGB691R3wGTNB90dWRpa3G6t5cL7em8+WEaecvjvTjZncPapGNA
 ePHScWD3V+K6uIoaQFUxoDtwvvsmBjftEITqvHUzUNTT8JfYifIFoJwkL4CeNSH0U8eHHyATxCa
 Cxm9PPNR3H6ZPVbS0b2krYHM3PJVvEa1oZhyFCUfcUGVQD8J/11MMwUrLZEoOQXcdoCDqSl3Ohr
 vJ++XvVs5XKwmiNmjXHsTvRefHp1lDuP1ljwh/iP1Ldl8KtYaXtKHC06Crsc57yQ1Mq5cfnKqmP
 gMcvB1Ux227991wm7IECUbu2n6mxDT3QnXK1Ii8eyO3UxGcbqwMj0v4IBO8Wrlw6eVbEZCP1cMr
 OuSNcRP9P3eUbMtjoWaZqNQRCeRGDVstc4cYdqAbVUUCrh4XEWHun6JVUAZ4uARxuwn0GrxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=933 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

One internal buffer which is allocated only once per session was not
being freed during session close because it was not being tracked as
part of internal buffer list which resulted in a memory leak.

Add the necessary logic to explicitly free the untracked internal buffer
during session close to ensure all allocated memory is released
properly.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool
 		}
 	}
 
+	if (force) {
+		buffers = &inst->buffers[BUF_PERSIST];
+
+		list_for_each_entry_safe(buf, next, &buffers->list, list) {
+			ret = iris_destroy_internal_buffer(inst, buf);
+			if (ret)
+				return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.34.1


