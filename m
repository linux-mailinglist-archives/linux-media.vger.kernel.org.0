Return-Path: <linux-media+bounces-36777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525AAF8A40
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 005857B2124
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A0F28C5B1;
	Fri,  4 Jul 2025 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k9wZXyrI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893BC28B3ED;
	Fri,  4 Jul 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615651; cv=none; b=SfopQYf0JyMZU+9AHYmU0/oKon/jqTc0JCxqiRNLd+ksI6YVbRv2dzg0ACC1t2zWObdEcimt0xeu5VnoZPmOc5pIPA8Uq2oTeqqhaAbQ6nUVLzzHVGbp9xRFO6JKkF2DRdcsCuekPz2WJhRd3ZomnKjCmmWXZIWjP1uijRtkq0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615651; c=relaxed/simple;
	bh=HW/7bQDz6RN1kDmyJ95OWFrRONwb+HcZP7enCpgPaNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=elSoq5fU9YVUC1PrCdZvngNCpoy+X/w4bsQoUGk0M/+5p2IcjJGw6xCAy3wkreM4qUZJLRPE6+JdD1k/XNXxQO3pOTuyvxNlyUYy+63BySSrxYK2DktPkaYUxFFVhMW0el4vxTmuHuAzMnFHWeH19UFtSkqupqHfO6/sVq+GN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k9wZXyrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644MtWc002481;
	Fri, 4 Jul 2025 07:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+eG0mVfcfmUzuEgbSciyUwrRIEdvISJ0vd2Smn12H4c=; b=k9wZXyrIKZTeoqrq
	NOOL2OTUZqijC+5CVT3++VOr7JF7NrnlAgvjTGJtpwuO+ZYW4YTX1g/RwPFDsT53
	aZnJABUH7Jk00Tkc0MDBdBJwwr+hcAz6LOIhrC2Kjd6WfVYGAk2WXcntLQmZw5wY
	pbHTgCfeGqRqJzV0wCOvHjLTWOBVp2t/wJF9Bzxc8szrhqjJ+QjVBsFAy3forYwc
	skvqqD1mTsH1lTVneYcZWc71NJbt86xBOmkCRn1rihTxOOtrgcNjswcywVjZGYD4
	63wjzTilA6y6Fifm8P43Z9VOwwmGez5umb68rrX1f5IrWbybenXMxLyVSqnpGNRX
	hKUyuQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut0gej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:54:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647s3dG019355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:54:03 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:54:00 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:12 +0530
Subject: [PATCH 12/25] media: iris: Add support for video encoder device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-12-b6ce24e273cf@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=4819;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HW/7bQDz6RN1kDmyJ95OWFrRONwb+HcZP7enCpgPaNA=;
 b=cKF3RZjeVhgpLIPR/VuHtBoctIUncjVt8fmfOzFPKCiVfoXWr/Hg92nNyt2NlfcvOM/ZrGFoQ
 1yQmHceVnhNAT5yT8nq70Bj13hrKX8/HA0oXmL7weFeWkhhXCtwOHSs
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXxIVfCU0/3CDj
 3Mu3j+TAo5WMcgmlU9oS1AAKzpl6rP/8ZmrBVInSrYHmHeS7neVIk2Gili3QRQjSNPFS0Zpd4j0
 gOuvJOnZJr4paQ2HW5HbQWlynF2PuUdhgV/cKWenxqIBVuwm21sesTrx7/v6/4OQgHd47YJ+WdK
 zEvP6YHceF93Ok+IyBO4VWstWzTBuFOfOld/g8dCTu4L9LzUxVzRxCu8dt8rcjjIdvdZe2pwUNR
 LLYHtNp5Fi57SEenpBIFj5Hx4zDsjoqmcv7/UHGNA/IpbC9/qqMpzvgayjVjJh1+a/DQJViTcqR
 voYhJnswZOhIL0ycy4Loyk1bczhEXc1qR1BMjPlpyDOiXn/HyStmvqvter3TN8XpD3gtEdfy2Jn
 esmL/LG6o8+hPJku2kiOIKinvMXWYasedZpwq4FeCWfy2TBV1NiPQ9dg0iegd2KTnwUlGsDj
X-Proofpoint-GUID: z9YUuieJMSrq9v3un4E9jwnhslTL_8zm
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=6867889c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=2mCIi3ssoROZVgXUOfUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z9YUuieJMSrq9v3un4E9jwnhslTL_8zm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

Add support for registering a V4L2 encoder video device to the iris
driver. The encoder device is registered with the name
"qcom-iris-encoder".

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  7 ++++++
 drivers/media/platform/qcom/iris/iris_probe.c | 36 ++++++++++++++++++++-------
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e..09e83be4e00efb456b7098a499b6cce850134a06 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -25,6 +25,11 @@ struct icc_info {
 #define IRIS_FW_VERSION_LENGTH		128
 #define IFACEQ_CORE_PKT_SIZE		(1024 * 4)
 
+enum domain_type {
+	ENCODER	= BIT(0),
+	DECODER	= BIT(1),
+};
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -33,6 +38,7 @@ struct icc_info {
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
  * @vdev_dec: iris video device structure for decoder
+ * @vdev_enc: iris video device structure for encoder
  * @iris_v4l2_file_ops: iris v4l2 file ops
  * @iris_v4l2_ioctl_ops: iris v4l2 ioctl ops
  * @iris_vb2_ops: iris vb2 ops
@@ -73,6 +79,7 @@ struct iris_core {
 	int					irq;
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
+	struct video_device			*vdev_enc;
 	const struct v4l2_file_operations	*iris_v4l2_file_ops;
 	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
 	const struct vb2_ops			*iris_vb2_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4e6e92357968d7419f114cc0ffa9b571bad19e46..c3be9deb0a57cc2cf25d69784d54be5e4a5fe06c 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -146,7 +146,7 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
-static int iris_register_video_device(struct iris_core *core)
+static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
 	int ret;
@@ -155,7 +155,6 @@ static int iris_register_video_device(struct iris_core *core)
 	if (!vdev)
 		return -ENOMEM;
 
-	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
 	vdev->release = video_device_release;
 	vdev->fops = core->iris_v4l2_file_ops;
 	vdev->ioctl_ops = core->iris_v4l2_ioctl_ops;
@@ -163,11 +162,23 @@ static int iris_register_video_device(struct iris_core *core)
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
-	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-	if (ret)
+	if (type == DECODER) {
+		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+		if (ret)
+			goto err_vdev_release;
+		core->vdev_dec = vdev;
+	} else if (type == ENCODER) {
+		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
+		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+		if (ret)
+			goto err_vdev_release;
+		core->vdev_enc = vdev;
+	} else {
+		ret = -EINVAL;
 		goto err_vdev_release;
+	}
 
-	core->vdev_dec = vdev;
 	video_set_drvdata(vdev, core);
 
 	return 0;
@@ -189,6 +200,7 @@ static void iris_remove(struct platform_device *pdev)
 	iris_core_deinit(core);
 
 	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
@@ -258,17 +270,21 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = iris_register_video_device(core);
+	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
 
+	ret = iris_register_video_device(core, ENCODER);
+	if (ret)
+		goto err_vdev_unreg_dec;
+
 	platform_set_drvdata(pdev, core);
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
 	ret = dma_set_mask_and_coherent(dev, dma_mask);
 	if (ret)
-		goto err_vdev_unreg;
+		goto err_vdev_unreg_enc;
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
@@ -277,11 +293,13 @@ static int iris_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(core->dev);
 	ret = devm_pm_runtime_enable(core->dev);
 	if (ret)
-		goto err_vdev_unreg;
+		goto err_vdev_unreg_enc;
 
 	return 0;
 
-err_vdev_unreg:
+err_vdev_unreg_enc:
+	video_unregister_device(core->vdev_enc);
+err_vdev_unreg_dec:
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);

-- 
2.34.1


