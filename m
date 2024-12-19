Return-Path: <linux-media+bounces-23762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4259F7409
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 06:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8481892B89
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 05:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600072165ED;
	Thu, 19 Dec 2024 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nBGxInv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91ED15C13F;
	Thu, 19 Dec 2024 05:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586941; cv=none; b=WnDsSmQd7A2adRDZjimhq/+Zcu6In2ehCKyppTkR19YyZExEtTDPs/JlidP5vCN1T/HyovY0JIWhyyMIFHQZ89NEq3LxnWDPnW3I0pAmA8ZufGX+FIuGgyEVY4cEhr4PMPhjk4Nr5ysQkUr0SCoggbA8wr8bRvKPVue6MvI77E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586941; c=relaxed/simple;
	bh=y6G9Oywn8SHqIf3d2L1lozT/rWH4QMrvcxLKWQVzMbg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cQUwDrGbg5zS/AgQ0aYxqmpJJeX7+7sEz04J3uqniPb5ryBArLcrvxw5yVEqF6Ua72jjMGC8aTKPjcJ+UvEq2HWzRLR2RoMNfwm7/N2wU8gaF76+zU0O8QSEZX+MazMhVz2WFanxHp9dKoFm1C++C86wJVerQ1+/p9vkTK4TC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nBGxInv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ27iqr016151;
	Thu, 19 Dec 2024 05:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g3vv8oS9/06X/AnOkilGYM
	veRlYDHsnUBw3x//yEIYU=; b=nBGxInv4eB28BvhNHKaK+eQrVLr4PLAIfvqjHt
	bvrF+8rxBljjGWpt6wnzFjC3lThUH6zDLFPCHEdgNn7WE0JwoUsAF+On+98MM3Fq
	xZ3ATendR438H7Dd5sa4l1HJ4weqX6wlJkjGNNwb6OO8x8HbgHRay3mcbY1HhPlp
	3VdNTATHb8HOCB118gNAfPEl+0RQDTRgSXdM7JxDvNq6qUGbYPQASnflAu8IU0wn
	UJa9XPmQHJtAb3Gk4BtNjq5pPWiOpclR+2X039P95RzPVKa61HnWauXNAthgE8tK
	g/DWHkpExuYFsFJGUACauWfBUlSs8ELJsYQm+Up9/WqTqFkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43maeagd0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:14 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BJ5gDLI016005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 05:42:13 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 21:42:10 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v6 0/4] media: venus: enable venus on qcs615
Date: Thu, 19 Dec 2024 11:11:52 +0530
Message-ID: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACCyY2cC/43RbW/bIBAH8K8S+fWuguPJRNPU71FVFYYjQY1NC
 663qep3H44nNVMWba/Qge4H/O+9q1QS1W6/e+8KLammPLVCf9l1/uimA0EKre6QoeTILbgQYKH
 prULMBV591VwBit5FZVhgInSt9aVQTD/O7MNjq4+pzrn8PN+y8HV3AxnrV/BpY56WFCjDwoGBF
 NoTM0P0Wty/viWfJn/n89it3IKfBOf49zct2BjSxkoTrTIuXjPigkF1gxGNUU4YPVjjdE/XjPx
 kkIsbjGyMIfTWGQyC2WtGXTLmBqNWRhphVbCkBfuT+diyL9R2a5q3AXQj1erOk9zvvm6/bbn/F
 scRwgxTDlS35AfU2nrnmUZ5qX9bB/svyp+yf/Z5mks+nahs6ZkgBgwoVAzxP0RkFkYKyUGd3SF
 NB0AJnEObUBkEHL9D631xczsu6+k5E4qGVOxVFAzvT2lyJd/lcjhfMbhKa8+Y5v1OkMTgLaL1y
 ipGvRw4BcNUtLKtigKyHrFvYX78Ag12xA4eAwAA
X-Change-ID: 20241219-add-venus-for-qcs615-238af570d03d
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734586930; l=5385;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=y6G9Oywn8SHqIf3d2L1lozT/rWH4QMrvcxLKWQVzMbg=;
 b=vE5PHETgKJ2sXv8/PDqOHZgbid6PyY6DKLENkAWoKytF8RP4K0PS2tP45LVs43X5EV8Uiw2RW
 dwD9FgpXd4GD4n1rijUUfa0VcAeY73ssDlwQAsGCPIwKw/mYLTbF8yn
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cuD2VLiE2cop3Eg1LuDoDxvMsXU43TXY
X-Proofpoint-GUID: cuD2VLiE2cop3Eg1LuDoDxvMsXU43TXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190042

QCS615 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for QCS615 to enable video functionality.

There are no resources for the video-decoder and video-encoder nodes
in the device tree, so remove these two nodes from the device tree. In
addition, to ensure that the video codec functions properly, use [3]
to add encoder and decoder node entries in the venus driver.

Validated this series on QCS615 and SC7180.

depends on:
[1] https://lore.kernel.org/all/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com
[2] https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com
[3] https://lore.kernel.org/all/20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v6:
- 1. Remove video-decoder and video-encoder nodes from the device tree
- 2. Add a new dependency.
- 3. Fix missing tag.
- 4. Update commit message.
- Link to v5: https://lore.kernel.org/r/20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com

Changes in v5:
- 1. Remove extra blank lines in yaml files.
- 2. Add new variables in the driver while keeping the order of the
original variables. And remove unnecessary variable initialization.
- 3. Update commit message.
- 4. Update the order of nodes in the device tree.
- Link to v4: https://lore.kernel.org/r/20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com

Changes in v4:
- 1. Remove qcom,qcs615-venus.yaml and use qcom,sc7180-venus.yaml for
qcs615 dt-bindings.
- 2. Add "qcom,qcs615-venus" compatible into qcom,sc7180-venus.yaml.
- 3. Remove qcs615 resource from the driver and use sc7180 resource for
the qcs615.
- 4. Use the frequency in the opp-table in devicetree for the driver.
For compatibility, if getting data from the opp table fails, the data
in the frequency table will be used.
- 5. Keep the reverse Christmas tree order coding style.
- 6. Add "qcom,sc7180-venus" compatible in devicetree.
- 7. Update cover letter message.
- Link to v3: https://lore.kernel.org/r/20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com

Changes in v3:
- 1. Remove the ‘|’ after 'description' in the qcom,qcs615-venus.yaml.
- 2. Add a blank line before 'opp-table' in the qcom,qcs615-venus.yaml.
- 3. Put ‘additionalProperties’ before ‘properties’ in the
qcom,qcs615-venus.yaml.
- 4. Update the subject of qcom,qcs615-venus.yaml patch.
- Link to v2: https://lore.kernel.org/r/20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com

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

---
Renjiang Han (4):
      dt-bindings: media: add support for video hardware on QCS615 platform
      media: venus: pm_helpers: use opp-table for the frequency
      arm64: dts: qcom: qcs615: add venus node to devicetree
      arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec

 .../bindings/media/qcom,sc7180-venus.yaml          |  7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  4 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 78 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 53 +++++++++++----
 4 files changed, 127 insertions(+), 15 deletions(-)
---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241219-add-venus-for-qcs615-238af570d03d
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
prerequisite-message-id: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
prerequisite-patch-id: 3cee337bfc515f0fda75c8406e0e472313a4c895
prerequisite-patch-id: fb56cdcbac866038943e033ceaa898e0582e5365
prerequisite-patch-id: f7297a975e4ffcdb40e94cc7d050a1aa089b9e43

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


