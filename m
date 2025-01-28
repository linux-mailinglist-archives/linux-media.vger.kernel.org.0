Return-Path: <linux-media+bounces-25322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD1A2058A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFE7C7A27A6
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074341DE891;
	Tue, 28 Jan 2025 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j9LMVcIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5D8462;
	Tue, 28 Jan 2025 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051530; cv=none; b=VyoxWAodpK3JMGt6XmgHyWz+Ca/T0S84O6WCvgZqDDpbJYbceJ0bu0Bw/3H9amWzGdf6Luxg9pyfwM+h2Ol1k3VcOCvHXqgK7We8GHlWng/FMXQxAkkuib8LnQdU+W5QRB9UVaoC/VGnWLP4GyIfkpD+Khp1rIyPKs67sYSOklw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051530; c=relaxed/simple;
	bh=Jv1NoSnajnsYRwrGd9hpm0gdsLWKcyah3KPpZDeoVYQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bArm1jyppqG/YB2ANEHkD/bUX1wUC/vRh71t39C07KpXjzIjfqLsGXa9XUxxLxyAvGsDI9P27+C0oFZgOOt4iwJYzngx3PXTR/XWQpbc6ZSW4CAs2b06aGmYNaqFxVZIazpinGZXn/aqDLq3LGU0ysHF4g45hzT1MjBCVeH5Hes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j9LMVcIZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5qgnp028350;
	Tue, 28 Jan 2025 08:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pp2c1xp201HQqn9cz+TIYg
	cZ7RDSj3WdXgrJvPwHGLY=; b=j9LMVcIZRfqjpMHXCUPmJFkzRRqKBsZ/NW4JTS
	nOhV3GUDGNCODDQ0ZnPLpLOQe4lFPAjfBkcEN9fK1IkmnIiPhj46Bzs5ShPbyBp0
	kWtqyaAgKS6ZydcbxCTVxWirPmlCJSPWdnYLz6J49LYr5xm3smFTAAEj5cWeuCBS
	+OLYanAswRWK0D3XosGw2IHD9iql8F8yfGyDGZ9kLUcqjFxMpGkk6AJPp6gqWw98
	YTKBlrInqlOijs8+UM+fjJyczC+svSgsZBTcz5z4L/uqtTD0KfVGk+4lMtuCW1Z9
	KhNoFGx/ZtAArAlEYOU6sbfHzpM8+hvN9MzDL0UpInNqdllw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esfq0a50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 08:05:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S85HnX006172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 08:05:17 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 00:05:10 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <hverkuil@xs4all.nl>, <sebastian.fricke@collabora.com>,
        <bryan.odonoghue@linaro.org>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <nicolas@ndufresne.ca>,
        <u.kleine-koenig@baylibre.com>, <stefan.schmidt@linaro.org>,
        <lujianhua000@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <johan@kernel.org>, <quic_dikshita@quicinc.com>
Subject: [RFC PATCH v10 0/2] Add helper module to select video driver
Date: Tue, 28 Jan 2025 13:34:27 +0530
Message-ID: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DAtI1cS7ySRS3Prdn9EpIZWebLSVJem7
X-Proofpoint-ORIG-GUID: DAtI1cS7ySRS3Prdn9EpIZWebLSVJem7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 mlxlogscore=751 phishscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280061

This is a RFC patch series from the original iris driver [1].
The first patch introduces a helper module to select between venus and iris
driver for plarform supported by both drivers.
The second patch enables the probe of SM8250 with iris driver.

This is just a RFC series, will send a proper v10 of iris driver
including these two patches, once everyone is OK with the changes.

[1]: https://lore.kernel.org/linux-media/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/

Dikshita Agarwal (2):
  media: iris: introduce helper module to select video driver
  media: iris: enable video driver probe of SM8250 SoC

 drivers/media/platform/qcom/Makefile          |   1 +
 drivers/media/platform/qcom/iris/Makefile     |   1 +
 drivers/media/platform/qcom/iris/iris_core.h  |   1 +
 .../platform/qcom/iris/iris_platform_common.h |   1 +
 .../platform/qcom/iris/iris_platform_sm8250.c | 148 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c |   7 +
 drivers/media/platform/qcom/venus/core.c      |   5 +
 .../platform/qcom/video_drv_helper/Makefile   |   4 +
 .../qcom/video_drv_helper/video_drv_helper.c  |  70 +++++++++
 .../qcom/video_drv_helper/video_drv_helper.h  |  11 ++
 10 files changed, 249 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.c
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
 create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h

-- 
2.34.1


