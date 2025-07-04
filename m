Return-Path: <linux-media+bounces-36774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F794AF8B31
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B042172162
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F418288CAA;
	Fri,  4 Jul 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JqaJJTln"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF7288C29;
	Fri,  4 Jul 2025 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615643; cv=none; b=Z3VvqdjnYsgcAzEL0EOYoDKaNtwLJtNYZlOZL/8c2uX3U8HxhtbaXHLmyXmAsKF98meuNawjXelJYJQFH5HUOZX3eZFzJmjYWa6qCHj7Oh4a1t+S4JM2+FB/Yr/QOb4kIzSlY9XYTJ/W3BjZAQcAqMp/bQs+lcuRH7UWSh34ZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615643; c=relaxed/simple;
	bh=dRxbz96Z2+jNfqLv4UxWyQRKThDSBP9Zop23bLgLf+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RyhBhMBblkOBFFd+g4Xfs4RqONUCCbmp1f9MfLlImKlDh5280bGuWeFNy9O3nWKjJIVGjPlgAjGvvHsIvScY5ovqqEJoChyuN2zdSUXNgQojxMLQl51nqCKjCt4XV0oYo8KjVsHeTyUHaq8ZyPZnFZy+2Zh3kQ3b66Cl0qQh3Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JqaJJTln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645w92P028430;
	Fri, 4 Jul 2025 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JcVofRBfVreMJIT8Bh5XM2YdJsgL8YWro4Lt3Uj3ZfQ=; b=JqaJJTlnhQ3YEHBt
	ESz5HdnWSF0DlHG3Ty1junGQKWlp5O7vBVlr/FLDpjWexijrc0lUsm71STZsmC8E
	pdHoKK6Ldfx9zw5+mras2n3dKOzgH9mpqwWlG7wX/hhTvAEtQVwTfMkFHwCnU/Zp
	jh5uUL+kW3O8KqOWDRYCxB5oszcuF5vXV9htrAYDVS/JZG+G7Hc4t/SLR7LofGoT
	Ps45WqC5TMRSoXrgUdQgrdVY1dY28IO7xRZzvpjXOa9dTbx77M2ocLRztbopNRYY
	2h0uEnxKi24niXdoZV2PcgEjDFILrYDepiI29rF/B3EEbC/SXb6i0BxXKDoBYHIh
	f3IR7w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw34s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647roI6017939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:50 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:47 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:08 +0530
Subject: [PATCH 08/25] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-8-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=1365;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=dRxbz96Z2+jNfqLv4UxWyQRKThDSBP9Zop23bLgLf+8=;
 b=+Gq3tMYKouZMTDqZhnZApgufQOYbAltLtG++wGzUjkWSeXKbPJ4X0SyvpmKhnageVwc7Rpnd+
 0+gKd5WlnafDTchxxGq8AjEFUFY2ilW71DDFkQ+EuQmrfTuEGLZGVXx
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Nu0ZGRzqiCLVl98N0SPx4YU_UNJ4C3R
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867888e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=MjMrax0v_7cEApFHy6YA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4Nu0ZGRzqiCLVl98N0SPx4YU_UNJ4C3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfX/lTN4A92BqH1
 bdfS45eKEV6pxxUBypj1qUR1wEQ7oQd4KlX33Ngdcy7naV3fC+R7VFTH3jR/XVm5Q47GrbIGSig
 t5I7L3AyONCiQXq0hfIZ4qIFgzh1BVwmvZXfs3PVY6fTmOoDALmrMenhsP/OMNC9VXe+vidR4rI
 4rJ8lB7ppaZHSjLoJl5nYxQAm26hVS1O6iKOmJRHBFAAm1HsW6WR336CxrtCyAKdbyC/DUPNcNs
 XGh5nLkkmzlVBA1chg9+e8RYTjcf5nzYkvwFYHSp32aNadiRhN3wa96BjkZ1nUCI3q4XtLms6Qk
 BfCGiPaFXJoVIDlghXr0+lBEc7fRe1fn+tqOj+OcNZxV+4LEKfKSVhnLYcbLW3BZJuzl+o6pOsV
 QOyf1cT2FJpd2E2RMwst47W6iOx/MyA/DjgAeLGmpQmX32h74pKbdaCY972akbIXAbfomz0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=860 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Update the vbuf flags appropriately in error cases before calling
v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
scenario, which could result in incorrect state reporting for buffers.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 320ebfb833331294ba5ddda8e9cd243c80633408..3ab533310b2dfece11ea31b30d29ecb32e0c3f87 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
+	vbuf->flags |= buf->flags;
+
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
@@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 		return 0;
 	}
 
-	vbuf->flags |= buf->flags;
-
 	if (V4L2_TYPE_IS_CAPTURE(type)) {
 		vb2_set_plane_payload(vb2, 0, buf->data_size);
 		vbuf->sequence = inst->sequence_cap++;

-- 
2.34.1


