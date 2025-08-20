Return-Path: <linux-media+bounces-40366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EFDB2D7E3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 11:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F33518863E6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 09:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DD12E8DE5;
	Wed, 20 Aug 2025 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9jVpfCs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D572E7F1E;
	Wed, 20 Aug 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755680930; cv=none; b=Kr5TJTuBXFqZHx16CXeTfvepaxmGPVg00+nYeLf/zMeJ7i/RlbFpFxXsoGhdpvdQJetCIM+2LR//NT7qh2UdqZzGLMEW9vbYwcflNDCub9aBUiKc27IzU/QRExlaQcmERznoTEZcMzaytwEbn+ovAAv9PqxntBkkPfZ21RCAxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755680930; c=relaxed/simple;
	bh=ugBSnbxB2issyFqHFvgowvv2NDarhPj+n0YxFkVJLYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=egHKY5/rsvZN2kebVrbjtgoUj4EPxe47S0EYycFcW6C+28k6vh/3noNbPaqpsJXTdvp1+AXw1zg1O/tzwVPn33ZPfc+lB7OmhZ/ebMFjXJ1arhg9Zt5mNmerL/D1d3cULNb1ryy7B4PDGgEYwsRSouGb3dw/7T6KBujKLGiVRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g9jVpfCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ovuN007306;
	Wed, 20 Aug 2025 09:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HgMj+0hHTJ36AXA1f5zCXxorQH1y31mwKWj/vG2hZH4=; b=g9jVpfCsCB7JPnl+
	YExdy+SOkBwK1mymMmggL3jB7RzwSKQx3bVdxpk4/io19+npcrM0vpVK0FjG26K7
	wdQJOdyItzrPPrFZlSA8lRPhBxXi+b4llOtLzu2SWCdfUHFn8oknFy/Q3yqy/uIh
	+bL4c5QbMzzX3pOLXQ/PRhuAHErXa8uI6Y34PHPHDWXKQh/kGA8QyHbjlFDEBLxQ
	5G7PV9LUqMsXAj0bpJXA0eNLNZYpwgGXuGElDl/wnNbsKpPmTHfAiXKWUNvnTOR2
	QHjMjeHTYC4PyqoWDJQipI/Q46mogLGCVDQEfGQNzwUFhAcJtJQFg8VsUtgRgTtR
	4EORSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52913yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57K98gZU011730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 09:08:42 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 20 Aug 2025 02:08:38 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 20 Aug 2025 14:37:51 +0530
Subject: [PATCH v3 13/26] media: iris: Add support for video encoder device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250820-iris-video-encoder-v3-13-80ab0ba58b3d@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
In-Reply-To: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
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
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755680867; l=4833;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=ugBSnbxB2issyFqHFvgowvv2NDarhPj+n0YxFkVJLYY=;
 b=jpCX4wpCzgQ2yOkp7gocAuR0ah5iLFDMDqupFRhcvAA6B9vvagQ6SsNBkKfkGpu6USmRMVIQE
 FoHDVd1J9exCx1qLrbSB25IDOlWIW0uUxQulxS237csFPyEHX/G/4U4
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5909b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=2mCIi3ssoROZVgXUOfUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: iN86v48T3Bdpv0q3UUmgAFO8lJz7a5zE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9Ns6xJ/y8fbD
 L9mta7uXCE2EE2enLlL7asvCo7Bc8NysxTYH6bKuq7bnTtmj70VAMmwASshHbsnhShSXu3qX7VG
 jTW0qF243RXksTEKC54kVcirGfMpdY0Ng8W8cGGy4Xt55Mnt4o3KhceH3QfzCZOmwQkJWC6JSgY
 1WXpmujmA7uHS9+HzOJzVgqvlqo2CbCU/Iqfth2NQjbfhFe2EdYt8HB+CguSyibzarrUS5qJXwn
 mu08doE62T5H5oSnhKSee//mmR6FdVRsFyhNiBDAhFNK/+FqR7kUbO/EoPFlX6/ezZYGqE4ioGh
 0DzKOW5oWRjwMhvffNGCY+oiizGDzqDNtkBltkSooDw05a90ZAE7Dz8uMxppVk0oG2ic601nIOv
 xuKQEUP6VyazUhaHj/Ztl2wkUBH4Pg==
X-Proofpoint-GUID: iN86v48T3Bdpv0q3UUmgAFO8lJz7a5zE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Add support for registering a V4L2 encoder video device to the iris
driver. The encoder device is registered with the name
"qcom-iris-encoder".

Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
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


