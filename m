Return-Path: <linux-media+bounces-21305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C599C593B
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 919AAB42BF4
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9881F7789;
	Tue, 12 Nov 2024 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="STYHAvFA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F91C1CD1E2;
	Tue, 12 Nov 2024 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412146; cv=none; b=EjygSCYEinmfLNXr5Vsg8sfvGljYEBiTpQJbLh6WcusvHQKKOuakGLnGKkL10Io1Dyh6K7V8D7eq82e7+qdZEH/jWBWQZeItRjSkneEZsKFy60WcDX9fR9IcdgQmgCjthEJwOSQofCMjRJx4SGf6YUb7phZV2p/EJ/tFaFXfopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412146; c=relaxed/simple;
	bh=/VoLo8GPUO9aui7o8929TcPBwm70bz8r6nvBqHexZ1o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=i3KqIFz78/DIZipi0c43P0AgOIzfxwH5XM3rzkFO1pUbf/XgCugO7T4YoPYwSFjShbGbDmF4obP2T1zXgIz0lGma6cFEfPqtDZtPVdS8DIVPPslA4y71NG1X6GOO/YOFNwZqZZdSbH25jg44+px7xIOR5qf9OEPEupJYcsnee34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=STYHAvFA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC9f94U025919;
	Tue, 12 Nov 2024 11:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ewnCiB4f+1AyNaiJaPvEzy
	l0g1l28oniXwZ5f3BArPY=; b=STYHAvFAn4+21mvMcpFvccER/0WkzMknahGnlz
	lbZk+NeAVTJrE8jZfKQMKxcFu3U1h2dmPv2zAMpvYvY8wRWhiSXiLgmH4QtXf8ZT
	DzlBejaM7uv99GYUQoJzUBy0Q4PRcTmJI/U9IhvMPD2aU19nTcBtWogWjFmNv2tz
	/vfag1ahWRS7QkKwfb10cMSx9bH58+UMRgl9AurI7slT72TboUMj/y6YYwIdgqNa
	bS1mfAI0VXS2ytZ/5TduD4dkW/Y0oJsyg91DgJWEWRBbwqOgdbnU3YR8gYWtxqFO
	csSCT4WJKL7yMKdCR1KIo8Da8S6h6kCkBd8W63bo7ZSK+87w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kqraak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:48:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACBmuv7028694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:48:56 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 03:48:53 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v2 0/4] media: venus: enable venus on qcs615
Date: Tue, 12 Nov 2024 17:17:56 +0530
Message-ID: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGxAM2cC/5WQ3UrEMBSEX6X02ixpfttFxPeQpeTnxA22zTZpi
 7rsu5u2CoJe6OUcmG/mzLVMED2k8lhcywiLTz4MWZC7ojRnNTwD8jbrkmDCqqoiSFmLFhjmhFy
 IaDRJVByJWhDKQTBnbZmtlwjOv27Yp1PWZ5+mEN+2lKVarzsQ43oFtjumXbyFgJYKYcSoMICld
 kbQx3H2xg/mYEJfnm47P0K+Jj/tIWUPKamt7bG438titrH94CevujbNl0uIU5trf+ahheekxlq
 ordQ11vh70sP6yG/Y+uvrvkd2QkOwkPbSmgjRGGWwIOzfKNMF82LCMMXQdRDRQjNRWqqJzds66
 /5E5JiSCstDwzlBFVot7Ti+n8P8w65VApRF76djoWhDKAbjhKaYS8frRmrDJGNKNhhLbJwGqeq
 8/+0DV5M+RzUCAAA=
X-Change-ID: 20241112-add-venus-for-qcs615-686235e64fdd
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731412132; l=3895;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=/VoLo8GPUO9aui7o8929TcPBwm70bz8r6nvBqHexZ1o=;
 b=R8ldjqwlMyPFpqlSqA4mh/YR0Vgg6BagOjKkPSqaQ54ENbWcs/m5IExKFxIaCiG+3T8FGNCHO
 Jd/fryNcMMuAlOLyHve/6yfSp7wDbHRZKYlw68holTf5UELs8gIH62C
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YM0sVP7q3MpJFipb4CLZ-pGUCux6a0M_
X-Proofpoint-GUID: YM0sVP7q3MpJFipb4CLZ-pGUCux6a0M_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120095

This series enables 4xx venus encode/decode on qcs615 for BU.
Configure venus node in the devicetree, add resource data in the venus core.
And binding node to the venus core with compatible.

This DT change is dependent on [1]dts and [2] videocc dts,
[3]videocc driver and [4]smmu.

depends on:
[1]
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
[2]
https://lore.kernel.org/lkml/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
[3]
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/
[4]
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v2:
- 1. The change-id of DT and driver are removed.
- 2. Add qcom,qcs615-venus.yaml files to explain DT.
- 3. The order of driver's commit and DT's commit is adjusted. Place the
driver's commit before the DT's commit.
- 4. Extends driver's commit message.
- 5. Split DT's commit into two commits. Add the venus node to the
qcs615.dtsi file. Then in the qcs615-ride.dts file enable the venus node.
- 6. Modify alignment, sort, upper and lower case letters issue.
- 7. Update cover letter message description.

- Link to v1: https://lore.kernel.org/r/20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com

base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8

---
Renjiang Han (4):
      dt-bindings: qcom,qcs615-venus: document QCS615 venus
      media: venus: core: add qcs615 platform data
      arm64: dts: qcom: add venus node for the qcs615
      arm64: dts: qcom: qcs615-ride: enable venus node

 .../bindings/media/qcom,qcs615-venus.yaml          | 181 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   4 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  86 ++++++++++
 drivers/media/platform/qcom/venus/core.c           |  50 ++++++
 4 files changed, 321 insertions(+)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241112-add-venus-for-qcs615-686235e64fdd
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-message-id: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-message-id: <20241105032107.9552-1-quic_qqzhou@quicinc.com>
prerequisite-patch-id: aaa7214fe86fade46ae5c245e0a44625fae1bad3
prerequisite-patch-id: 4db9f55207af45c6b64fff4f8929648a7fb44669
prerequisite-patch-id: 89ce719a863bf5e909989877f15f82b51552e449

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


