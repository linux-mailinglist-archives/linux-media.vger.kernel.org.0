Return-Path: <linux-media+bounces-35466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8026AE13BF
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B787167969
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4863A227EB1;
	Fri, 20 Jun 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fbpgnQrt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD922154F;
	Fri, 20 Jun 2025 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400510; cv=none; b=D26W2Q+82PM7E+5b6FBwelsrmr0e8Yzk45CF/1Ev5if9kKdkUCq9nQ8UfFAbYi39pNS+kSrxpRemdVhwVGiNXnjDmz8uOWJFmeeOL/8mnMZgklx0kPuW+T8nVl4T6s0IH8XxfnsN5ilcg9C79EbSMwzVW7HpM0NX3vu89MAWH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400510; c=relaxed/simple;
	bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NUgrF2vmdLy3xIz28gY8lSbZlV/MuSQz8HLA5aDNigxvVusifDBQr1N8pYPxRY7mxF7ONJwPkIT9/kyrcjTr848eN3Ojwdap6+/vn1yqi1iACTX4SruFPQGxZ6ghuP7aDBCZjZnHf4xO9q0q5C66jH8NkQKU91tHa1jylS/UTlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fbpgnQrt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JFvx3L027539;
	Fri, 20 Jun 2025 06:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9lsuwkEDfzWSPkDeANs5L89I9hXnOx1xQOCrn7r2z4=; b=fbpgnQrtqsWxO2qK
	zaH0qIfZcmK/F/q2VWxiAqrAj3Z8oui3dKU3prfVPjWPFKHy/vevc2F5hQgp11jL
	F6du6ngmbEh5NhKuQcIrzuNbKLoDsywNL+24/pzDu853DQ/LIjvSVNfFdfY3W05l
	bSmLBgGfvNfUSohrypUs1gNj8H/JUGfFmIiWVfORxIANF4N+W5K8HPp96nk77unB
	z9v8nmFHJdbb26WAdEKzyErZ2gGU7ZNQ8lgL2Wej11hoUUxydyR7auBtae/rPQHX
	YZQ1OSLQ91UcR7GQteX/bufMavh/pm1CO0L5NUJ8wyHkNeJ0Dd5ErqJ6oKTgW/DZ
	hfM89A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdabgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K6Lcep009661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 06:21:38 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 23:21:34 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 20 Jun 2025 11:50:54 +0530
Subject: [PATCH 4/5] media: iris: select appropriate DMA device for
 internal buffers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-video_cb-v1-4-9bcac1c8800c@quicinc.com>
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
In-Reply-To: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750400480; l=2223;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=HnzC2NXWKuXGG6DwRrGTVEY4cwE6xjAZhcxObvKqsbw=;
 b=92VFM4w78OjayQqJ5GPo4f6CWLHDfph32vBLpsr2iO3FkXNqKLDRmMOA4X72X3gw8CsHbX6eJ
 XY+rTSegebFCajSIZm+UZ3KOLYs7NhCsDHLn3C/CKr96TwsO+FU/wkN
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NiBTYWx0ZWRfX6VK7djm27t3E
 xu8iIRXN7hkJBDFzVbFIdsu00IsEBZb3Oc3sczXXZYjOzoHlkkssGDZUr8oHSwsqKRUmhBw9fsR
 sxaU1wpjAEOHsW93BUZY0lgQL/y3neIzHu2bJg3B6+8GsHM3f+bAgFpKBD4j+qqnpmX11ZqLDjP
 IXeouEZEZudpjwutJFxUzJlPqqCC3DB/3rjqM5py6lqrqXrmmg6d5UULF7lLf66tdO///uWcaks
 OdPuVW6Nir8mnzZe/u05rRmjhP8zbYJzb4sg7IYImo/W/6eEwFKYS7Ojk8hpttCJ+ntBuQb+DKV
 OBNgypJyijRVu0qqD1oczgvBXnJIC5IfyqecXOhBFmwTAoDRsnqT6bXsTJRWMEM1EA7s/fGnD30
 xHVx8lOWdpsE9c6V+q849zd2nuRsNGTR+jGXJC2kpEId0bTl3YaxJKdclHWgpzoIbWlcBWjq
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6854fdf2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=Jl8zK0-8wVe6xbTnPs0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8jHWboUsAQhgtXAzIfnJDqVM_S_RmIs6
X-Proofpoint-GUID: 8jHWboUsAQhgtXAzIfnJDqVM_S_RmIs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=939 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200046

When a non-pixel device (np_dev) exists, it is preferred for DMA
operations for internal buffers which are specific to bitstream data
processing. DPB(decoded picture buffer) buffers are internal buffers
associated with pixel buffers, hence they are not part of "non_pixel"
device.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb81e77746df8c4797a10a07f2ae946..0bf6041936175d03a51985be148e78894fc3e990 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -265,6 +265,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
 	struct iris_core *core = inst->core;
 	struct iris_buffer *buffer;
+	struct device *dev;
 
 	if (!buffers->size)
 		return 0;
@@ -280,7 +281,11 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 	list_add_tail(&buffer->list, &buffers->list);
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	dev = core->np_dev ? core->np_dev : core->dev;
+	if (buffer->type == BUF_DPB)
+		dev = core->dev;
+
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr)
 		return -ENOMEM;
@@ -367,9 +372,15 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_core *core = inst->core;
+	struct device *dev;
+
+	dev = core->np_dev ? core->np_dev : core->dev;
+
+	if (buffer->type == BUF_DPB)
+		dev = core->dev;
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 

-- 
2.34.1


