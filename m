Return-Path: <linux-media+bounces-40888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5AB3373F
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D99692025DA
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2179F29D288;
	Mon, 25 Aug 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A9crYi+u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2B29B204;
	Mon, 25 Aug 2025 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105313; cv=none; b=qtpMtFZS5YQVo4sBqZ5m64CfzpGAsIVGBW6XGLsm3KBQ1ExIv8fwYuh8tiwQg+Jnt4BxPRa11+pOqd00KGNzdXBjZP5nbzZAusi0VVubkcNqucVxn4lmaOYV9vk78G9xFMk3+1Z6bl8rtx0Edx/G5pqW5ADg82+47r8UCH+uV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105313; c=relaxed/simple;
	bh=+eSMHp4aOfD0B0NT7fp1/jBcnCLpIIlbIWtznFJiSEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LBKkZfaN0a8NU1Q2jJcJpZs5UQ9ymb1ulhbMCJ1iczXHLq2hrVlbWoVp7Dl0dL8a3t4ZEFpd35K8/Gatnii/NLV+WEwCGCFAip6QlqqQ2trs22UcOvvXjlAf6uWLtzuqSlNOpMxyw4tk5nHmBeGGAAQYxR5BPXSTGi6vho/Z7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A9crYi+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0EFGD009151;
	Mon, 25 Aug 2025 07:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pik67Z48JXkdrn+iZ+0/fiW3fNpgImlTzJjXOHu/Yw4=; b=A9crYi+usA8kwJ7+
	hp/Vip2HNipXJZTrcwUPbW9LAQcUULC66pumH1iJGu5o2gdVQboc/nHoDVKgOKre
	uUJCT8XpgGLNlNFJkW7omauWyS89vwrvNx3laWk8Kty4d+bPoqmcYcPfWRaJO0LW
	fOGEhtmg/94oZyHn+Bdq4APVt/AfiT/VlxyCbZ7Gp6nUaT5PqivJkCv8h6kYNAxn
	D/7VDxmoNKVXvJCF1tDGn1/VNso/UkmZptgN0l5iTa7WMmLEzTWsBnURv+ul25AF
	jk/GUzGPU80XEe4RD/vD17MVPw16ze1vIu6k6zwNs22c1PLIct/HnLIobnBC8bdc
	4TeLKA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfc41m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71aSG026584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:36 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:32 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:37 +0530
Subject: [PATCH v4 13/26] media: iris: Add support for video encoder device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-13-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=4975;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=+eSMHp4aOfD0B0NT7fp1/jBcnCLpIIlbIWtznFJiSEg=;
 b=DxnGLRZxTOstmRk0RD75+1OhZ7uwIBFPNROww3BWRvG4Of4gWESadzJlEVAzsrISNr5n95NQj
 Kg0WdaoD0dfCxRbIHj70/18NtFO7uPxeE/PrAXn+QQZzrbzXcpfutMe
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX6M7C3iSB8vKB
 L+eSGvm3LGkVOhUzUTOnuUATuB/lsdUbXVv3BTE3xEtCCj2/qi7AL+gBO6j7cN0oxOYDpL6R5FR
 7cRaHD8mmq1Bhrgz06yy4t9wUJ9M3HNSJ54uamBZcOF6CEhSkNJzZmspGxowLChfn9L5ULKV84Z
 paZ3mu3T24y/K9zvwuW2vUh9RA/HdkXGRoEiX+7cK2LimMGISaySMnPi0r5ar3TaEjRTVKUr/LD
 tvFabVuZLKvwhpZbuaxE6N8eHaBECp0B67touVAEZKISthI6SJXvU4VlxYLZwFKhsdz1nHTLskP
 VkJzk47kOhtRlNYjx8vKK+okElKOqNRmgDoL65IArT3O4QBi2L2H72olFofxEy2sOgF4CwuAqiA
 awIh2sDY
X-Proofpoint-GUID: rICXnwnWnPG9NCaOJ6TzfXnyh_fxxUEA
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac0a51 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=2mCIi3ssoROZVgXUOfUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rICXnwnWnPG9NCaOJ6TzfXnyh_fxxUEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add support for registering a V4L2 encoder video device to the iris
driver. The encoder device is registered with the name
"qcom-iris-encoder".

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  7 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c | 30 ++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 7 deletions(-)

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
index 4e6e92357968d7419f114cc0ffa9b571bad19e46..324ffc5035bc0ecfd9d7491ee07fd9333917455b 100644
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
@@ -163,11 +162,21 @@ static int iris_register_video_device(struct iris_core *core)
 	vdev->v4l2_dev = &core->v4l2_dev;
 	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 
+	if (type == DECODER) {
+		strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
+		core->vdev_dec = vdev;
+	} else if (type == ENCODER) {
+		strscpy(vdev->name, "qcom-iris-encoder", sizeof(vdev->name));
+		core->vdev_enc = vdev;
+	} else {
+		ret = -EINVAL;
+		goto err_vdev_release;
+	}
+
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret)
 		goto err_vdev_release;
 
-	core->vdev_dec = vdev;
 	video_set_drvdata(vdev, core);
 
 	return 0;
@@ -189,6 +198,7 @@ static void iris_remove(struct platform_device *pdev)
 	iris_core_deinit(core);
 
 	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
@@ -258,17 +268,21 @@ static int iris_probe(struct platform_device *pdev)
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
@@ -277,11 +291,13 @@ static int iris_probe(struct platform_device *pdev)
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


