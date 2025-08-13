Return-Path: <linux-media+bounces-39768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE9B245C7
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C553B7804
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70472FDC43;
	Wed, 13 Aug 2025 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ws7vxsFd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2D2FD1DD;
	Wed, 13 Aug 2025 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077951; cv=none; b=uzVOLng6Xn1fo45inczCWfXNs122vM7gaEUhHelQLpvQlFudlvXtGlMKsZBgUOalVjq/HV8QZQKjmpyZfi99EMFcVtz9Sn7bQGcKmFCRA30q4t6TplETE7MPd/LQKzHKYacPs6lAy+nnf9So8C51idmdECDK/tueaYZLRQAd1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077951; c=relaxed/simple;
	bh=HnP79lcGRhy0p8qSEmaCcbBTUPXlEOZ3++1OH12MxTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oevM82l9a2mqm3O1yShPcnqO6rfxnsqDKTdEpsLaVxMGSglbGU3W7vT8HpuXJZx+fQiAPy+8L+s0gs4kbUumDUd2t1LLPZUA8tNY4UJXtEeOgQFWibwdubT33FxwaUKrnLewSWBLN3VdMqWuMjd9UIA5yLvDC+W7TicEd005HoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ws7vxsFd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mL2s028901;
	Wed, 13 Aug 2025 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HXp/UDw+2vYo6lf45UfI8f0kNYY9Ka0O4dwDxlJv5h8=; b=Ws7vxsFdCmb6VBMS
	kYS5p3kqvj+ZsDQrNP1TI2ftxiMTxqyAEwg8Aq2F6MZwSK6/nHM7uwEKJyEyu7/0
	FiKP+6OsctxF5JpbA2jWQftBmoJzLSuaSxLOrHDEVBg55qpn+KM69qBMIonWkZUV
	YkCiAALWaGQJTWKqYU4JfFGagTnfKRVv5koPvMBtUPgoMoC562HyFC2Od5GvBHwZ
	gYnrKsiCIJxsMHvs1tiS4cVzkhhvt3/4a9BXUWNG6z3vwOIjvCd+/w2CnsnrgM57
	UO3P2+PxpxANeGepQ5DDCR98xG/nFtw7ntXYiJbYU+UhIzYyklpZINYD6UDnI8FF
	rwuZcg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4b9vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9d4Ef020328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:39:04 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:39:00 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:08:01 +0530
Subject: [PATCH v2 11/24] media: iris: Add support for video encoder device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-11-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
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
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=4885;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=HnP79lcGRhy0p8qSEmaCcbBTUPXlEOZ3++1OH12MxTY=;
 b=tNUtf2PptHvAAjpIu+XvFgScde3X86O1uYYFA/9SsiQAN6+E0B5+vPtsfEV11FmJPdDbARSrS
 txT8E6iMYQDBbZpSN931KUPIRXFeVkeeQHuJfevqzjoPWI7xnjLWKsQ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX9WVhgiGBfHs6
 /pt1Y75L3YoKh4xwsaPppeyMmvDmnfLVWNFY0sc8zYj/RiWhixzWoEVTmCHSGJ8gq0HYiZPOF0/
 /muNFsJmOlJGc0liZQOQo16bNzwd1Fbi39yV0qcyt3nVBeNs4fid7XIv6dABR+G/1xmZc5u2PCU
 GBXeM7L6W+RPZvnlyK4vzAP9mw1kK2cFetjC+ng2VQe+9qIKdXQ2FrPtbcsP8mC+e66Zosw94Gh
 iTXPmYy3+cbjtPI1IwPQq7FsSHkaigH8rNEuMD4496Af64e6eD0ksZyEs74NEDU6BcSNhsckqWv
 NO6DIc68L8HZglAAV+j8vD9/cXtmTlPaiLMAmeKvY8jE0ShAQA88osWSUrlxIS+ZsiR6WZTGfmk
 mpl+CYDC
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689c5d38 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=2mCIi3ssoROZVgXUOfUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SOWj_AeZ3Td3ySLCMPKYkBycEVf6vsMO
X-Proofpoint-GUID: SOWj_AeZ3Td3ySLCMPKYkBycEVf6vsMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

Add support for registering a V4L2 encoder video device to the iris
driver. The encoder device is registered with the name
"qcom-iris-encoder".

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
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


