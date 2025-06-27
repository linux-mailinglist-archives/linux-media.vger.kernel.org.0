Return-Path: <linux-media+bounces-36112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8CAEBBEE
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 17:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1454516ACFC
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2A12EA480;
	Fri, 27 Jun 2025 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UP+gjjU6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586F2EA158;
	Fri, 27 Jun 2025 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038390; cv=none; b=acKvB71QH/q8hVfLFXbiCjhrNbKHfA3fR1mmk0+UczpCZKHI38bKhGje0yyJEdIe7o3+yeD+IoKTb7pLaq6BTASUsQeWZXFPxSA7/IynTMG1rCNxFIJhGL7mcHhkEnKGrxNuYMupkak2AvsNIg3tV/8fTEaEmcZJOiVQzOpfjSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038390; c=relaxed/simple;
	bh=3N2w2gbNb6zjinpI7X9gyQWnQIkyPQjlVsmeYYz8AEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kNkn0HRr1Pq9INnVbecbniC3nxVbPkpxmFmeYf18YZ0ffIM7GQ66sy3AsieNEj2pi7bnFX8AOKxo2PldOw0YsL442v9YNLa6wDaa/pwFwcaRKYfyiWkhnetU2Nvfp8LymyjoIem/8n14BgjBJoE2J6mWMhP01mHYMjPZn1ihBzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UP+gjjU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC5WVV006912;
	Fri, 27 Jun 2025 15:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaBNQXheq/2f4YnX2sKogMfPUBJSxPPiA6XRcPj7Ab4=; b=UP+gjjU6vhJSu6sC
	mqYBZwxq/nrv96axr0OUyo3oe7N07uBjrxTuSPyefZUEJXSwvIfKsqe6dCUtNJWQ
	ESq5QhKUJRKppYPxTeA24jnNAtCiD62xzSC6LPH6HCsR3+EuMrDqHQkmtwbFl31D
	G+5BdN3DKaXNnAOaQLEV9f5E8QghcBaO01bw+MNKpIaaS6C1ZIUUf4lhRvBJ+Sud
	LlQf54Wcmnj1Rzgpn//aXSHmy2nGiQMHTdiSR1c5SKQAQuqG4WnyynEg4FSvZOoy
	Z/T9rPNuJmS+yLVBRJtYE9lNNlyXH4BZCtf9nQkfT57WKeaiB5NGVDJhuqq1QTpr
	KkSF6A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc60fwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RFX1FG006415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 15:33:01 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Jun 2025 08:32:57 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 27 Jun 2025 21:02:39 +0530
Subject: [PATCH v2 2/5] media: iris: register and configure non-pixel node
 as platform device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250627-video_cb-v2-2-3931c3f49361@quicinc.com>
References: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
In-Reply-To: <20250627-video_cb-v2-0-3931c3f49361@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751038370; l=3725;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=3N2w2gbNb6zjinpI7X9gyQWnQIkyPQjlVsmeYYz8AEE=;
 b=4uXqsWXNbc0HHMSAScU0+l39CwtreDt8jwnEWD771qdH+hfK0/87LwdpwezlgnLclFHfsV/df
 +HVXtBPdGhuDCd4Skw9E64pRDzlG96CoxGibjRMLUvr5SHcZts5nJxo
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T-rZ_eKbDoPQuRpS5tSkH6bWqGipDNlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfX33DvRy8fl0ZZ
 sy58wAXlX+QJXboi5+f2NeupwxY36nCEo48t23QZVHxTHYr7tZdnvH0RSH32GuLGt0wzw5YOnRk
 81rMcJF8vvzoFSso6AmoDTs+XpXiGcZFl8VxG/LC6bdCizulbvzCSiwRnpGg/Sl7//TqB/L34/8
 GwgQvGDNZk+dENfG6LL16vkc3aXEeziV/H7wRk5uWVGU+ykukhAbF/N4O2RA8ZFN+P3fo6AQVFP
 IemuxjFUbL1shVvEdVRstk+Ng1erHs0H2+9oeroqVIOeKoX9gaVH7AkhFW2mvbpdSOkA0tiJmYc
 1zqbSpeowhgqHchTAws2LqvtvXyYvj+1i0vgKlhN+BWcX/bQA+eSw4J+Qu9FbLlQt9u8+uYTWwX
 qP48EJHSnU39MiJuhUZB1nF3xL6BVreraF5Wk06JtSP+bO5d4/rd+ghrURYn4ogTs5xxFLkq
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685eb9ae cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=fTcLDvV2J6e7RefBZ9UA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: T-rZ_eKbDoPQuRpS5tSkH6bWqGipDNlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270126

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


