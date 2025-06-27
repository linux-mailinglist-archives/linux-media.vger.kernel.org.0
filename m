Return-Path: <linux-media+bounces-36119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E82AEBC59
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00D4D3AEBCD
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073E42EA487;
	Fri, 27 Jun 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e62kkSZY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23062E9EDF;
	Fri, 27 Jun 2025 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039315; cv=none; b=OGuCGF4xEyW9Dn/UjTkhiYv21KGFQufOb0AoG7wFqNY25f2Oc3VBHzBnfvA92munVAlOkNn8sPN9UBk4xhJzp3ErUQOw4EO9C/PIRX0vj2W0UsYQpVeE2kYSPqfTPH/waJB6Qidm5hl/J7kPiN7h49BhlxXR6hs46kTzVNDel5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039315; c=relaxed/simple;
	bh=3N2w2gbNb6zjinpI7X9gyQWnQIkyPQjlVsmeYYz8AEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MW+1tnQ2wFNTOHjhjCOwure3an1yPrYHjjDA762yfO3wQ52NElaB75BYw5GMpU2rQlH7YwLI1nAYZKIlJH+k24pBuj6ACxJK2knMBsaN+xilFOaHTE3hMfbmwnh7cmRxgivdYKuZmjseVgTblkn5lTHJx3GCvCGmqqnNzdfp9fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e62kkSZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBq2Sl028862;
	Fri, 27 Jun 2025 15:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaBNQXheq/2f4YnX2sKogMfPUBJSxPPiA6XRcPj7Ab4=; b=e62kkSZY/rYDejzt
	8MOryjgPMfy7X/+siSAiCLW/K2pbs/0tnw7mVMx6NXSwNYI6tWcjoJw1I2JXmkGZ
	4IZxEG8xp+uifEFLVXCOqPn3q6swsv6Xi8BqdzTBtnmu+CBdUBGCvpFlBUEWxU17
	dniZBtnsJ5EiFk9oFGn/327s9+NShAahkBQvZuGE03XYyyzbVTJ3i/FqFFZaSE+n
	z25uOiXft6ecT7b9Do6UnyqHbXHU5b7w9+uJIBwSuc2iT8DIS9JKwQOIT+XynZGy
	9upWaq8cRZKUJ+PzGdTqHjJjH3A4C3lGXPX2REO2pTOlNljyylNOxaGGmi4q84bO
	LiPmjA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbj1mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFmRnk003070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:48:27 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:48:24 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:18:08 +0530
Subject: [PATCH v3 2/5] media: iris: register and configure non-pixel node
 as platform device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v3-2-51e18c0ffbce@quicinc.com>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
In-Reply-To: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751039297; l=3725;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=3N2w2gbNb6zjinpI7X9gyQWnQIkyPQjlVsmeYYz8AEE=;
 b=xmCV5T0N4z0UCvN6X+XEFeE1CqZRqzVPQxhnO/kfn4Orx7cGqHGSuifCMhWtuC9TwktH25IPB
 F3dTToQw0PrCxRa4/Nes4FUb5TdrM3WJG5sjxqGXnkwYyOBj3Tl9qdf
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOCBTYWx0ZWRfXzXOXJ5MFq/Hw
 9atGRomqU0HOWFVyv+7Kk4ZYEZ15DV9y0z1DG4BTw0qxmEivXn6Ssm/+EPQu8l8NgLm+b4EYbUS
 Qs7hkTfYAOXffvbUyHV3xNyOZfZaAw7LoK3AaT5a5H1IoDYp8XfWpUqe5GCHpFoWqrU+nT/FdXG
 8tCSct100xLqc8sCZ3HGwkzzoJtK1ysJJRGoj2fJc2+/SdbAayccLCYxSwmPpWo9jqv6JpMvI49
 c3LuMdB9HO//k5YHd1Q8Kod+vAm+iIySoPeeivF6xd3PgWRMnwFi0KiVxGat82GIe9EJTIkDpIm
 IcuiBib8UO66qnVCtDJdxVUtkd9Nm7Bhb9GSBnKy370mjNIh9KFtDUxK7cBSq8Yum9L2/GJOwKJ
 LaTQqg9rUYKIEr/ecv33Tl4olsGJhTVWIDMCgvGk452eLihtZfzXYbBsPiPdtKprefSp7Iuc
X-Proofpoint-GUID: 87dMwml7YzLm90fgQ5nLOWCs4z4W_c8s
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685ebd4c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=fTcLDvV2J6e7RefBZ9UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 87dMwml7YzLm90fgQ5nLOWCs4z4W_c8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270128

Register "non_pixel" child node as a platform device, and configure its
DMA via of_dma_configure(). This ensures proper IOMMU attachment and DMA
setup for the "non_pixel" device.
All non pixel memory, i.e bitstream buffers, HFI queues and internal
buffers related to bitstream processing, would be managed by non_pixel
device.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 50 ++++++++++++++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index aeeac32a1f6d9a9fa7027e8e3db4d95f021c552e..757efd16870876bd2b1d5b1e4103b2d2326b5f49 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -65,6 +65,7 @@ struct icc_info {
  * @sys_error_handler: a delayed work for handling system fatal error
  * @instances: a list_head of all instances
  * @inst_fw_caps: an array of supported instance capabilities
+ * @np_dev: device to represent non pixel node
  */
 
 struct iris_core {
@@ -105,6 +106,7 @@ struct iris_core {
 	struct delayed_work			sys_error_handler;
 	struct list_head			instances;
 	struct platform_inst_fw_cap		inst_fw_caps[INST_FW_CAP_MAX];
+	struct device				*np_dev;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..8fe87e30bd40f3c67ec41305c7d73520fbc9db7b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -6,6 +6,8 @@
 #include <linux/clk.h>
 #include <linux/interconnect.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -127,6 +129,46 @@ static int iris_init_resets(struct iris_core *core)
 				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
+static int iris_init_non_pixel_node(struct iris_core *core)
+{
+	struct platform_device_info info;
+	struct platform_device *pdev;
+	struct device_node *np_node;
+	int ret;
+
+	np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
+	if (!np_node)
+		return 0;
+
+	memset(&info, 0, sizeof(info));
+	info.fwnode = &np_node->fwnode;
+	info.parent = core->dev;
+	info.name = np_node->name;
+	info.dma_mask = DMA_BIT_MASK(32);
+
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev)) {
+		of_node_put(np_node);
+		return PTR_ERR(pdev);
+	}
+	pdev->dev.of_node = np_node;
+
+	ret = of_dma_configure(&pdev->dev, np_node, true);
+	if (ret)
+		goto err_unregister;
+
+	core->np_dev = &pdev->dev;
+
+	of_node_put(np_node);
+
+	return 0;
+
+err_unregister:
+	platform_device_unregister(pdev);
+	of_node_put(np_node);
+	return ret;
+}
+
 static int iris_init_resources(struct iris_core *core)
 {
 	int ret;
@@ -143,7 +185,11 @@ static int iris_init_resources(struct iris_core *core)
 	if (ret)
 		return ret;
 
-	return iris_init_resets(core);
+	ret = iris_init_resets(core);
+	if (ret)
+		return ret;
+
+	return iris_init_non_pixel_node(core);
 }
 
 static int iris_register_video_device(struct iris_core *core)
@@ -188,6 +234,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	platform_device_unregister(to_platform_device(core->np_dev));
+
 	video_unregister_device(core->vdev_dec);
 
 	v4l2_device_unregister(&core->v4l2_dev);

-- 
2.34.1


