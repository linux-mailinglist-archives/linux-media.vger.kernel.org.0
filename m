Return-Path: <linux-media+bounces-23551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC229F4740
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F8AD16F165
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C351EE02A;
	Tue, 17 Dec 2024 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M6YGpWBj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12701DED7B;
	Tue, 17 Dec 2024 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427105; cv=none; b=dILC+9PDm21wCWbqX6YPERxnoyDMrKMzPxqcLXYKUOFon9n3+DYjQW9ahPiirwxMnDiS6PviqWx/KAFpD+mEXhg4NAjgKEpJr6uGYome22YE9AllHgrt/gaWzmGV3Mh+QnqOoDD0LLL7HcOiJtUAFQ/OHx90r5PikfqelIhRwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427105; c=relaxed/simple;
	bh=CF/1L5ScPTin1i4TJ5pC+FyzdTor7ZR/lAmRGy8XMiQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CvvmFXAfStz/bcim85LrJ5JImpVTg803L2g1OJ4zpFNOEIcxnXyz9+q6EVXl2IQxDXSz1YxEJqJSQsEOq9EY4kkyacOQr8F9PlrEOgC86r2mRwXmG1HHTgY+5S6pwFMvCfTmWu6orRyc3hhI8f0W1iZDgp09KgypGEic2TUU7K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M6YGpWBj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4lmiJ013791;
	Tue, 17 Dec 2024 09:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MVrL2Oc/gcl95tjbJR2u/m
	YUIyGa131Me3tKQ4sSgEs=; b=M6YGpWBjAezF6mpgwy6RXTs6FPVboq3UPUz1w0
	wMK/+ib8Lpr2AmAVIVxBpD8HnX4c6wFluoC9kcGI+7PlQ5eUrbdWGCdKgUavCs7v
	av9OQ5iZba685+IIimAfAl/9+BG8MD14fiV7g6dPmLIGaO0/wyHUA133h21QO/3A
	KnNxQRmscYbr/KUNGTx6TDB/0fn3hGIbAZJXDz0+IR5BUKKl4A22x2ENIF1fbgOU
	0NB8dFjKF8ooU6UXCI+DTP6A5mnhtDY4PhFPBOOXfWK5S94otvh2dxchLk6s9/1i
	19V5EceF2EpJa6bkyqmy/ATuoFkpPeSi0SzoWyF2F4GwYv4A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7gn9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH9IGJ9030493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 09:18:16 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 01:18:12 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v5 0/4] media: venus: enable venus on qcs615
Date: Tue, 17 Dec 2024 14:47:36 +0530
Message-ID: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALBBYWcC/4XRbUvDMBAH8K8y8tpIcnlqhojfQ2SkyVWDa+OaL
 ihj3910FTaZw1fhDvJL7n8HknGMmMl6dSAjlphjGmqh7lbEv7nhFWkMtSbAQHLggroQaMFhn2m
 XRrrzWXNFLTfaWuCNRUXq1Y8Ru/h5Yp9fav0W85TGr9Mrhc/dBWSsmcHNwmxKDJho4ZRRKbRHZ
 trOa/G020cfB3/vU09mrsCZ4Bz+/lOByqA2VprOKuO6a0ZcMKBuMKIyygmjW2ucbvCakWfmZkJ
 FVsYgeOsMBMHsb+a4hDZi7eY4LcmRHnN2pxWsVw/LN2tgP2Lf0zDRIQXMS2QtaG2980yDvNQf5
 438R/lt8u8+DdOYtlscl7FNEC0EEKoL3ZXYuoy0Fn2c1iuBEoK3ANYrqxg2suUYDFOdlfVUGIA
 1AE2d9PgNISPgK3QCAAA=
X-Change-ID: 20241213-add-venus-for-qcs615-9176992189e5
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
        "Stanimir
 Varbanov" <stanimir.varbanov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734427092; l=4146;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=CF/1L5ScPTin1i4TJ5pC+FyzdTor7ZR/lAmRGy8XMiQ=;
 b=rtyrqlOG0F3O3srRNtYtMhtwfwLQ3u31suH9wxCag+A+mrmh3aJYCF3LnEexC65r32BL1tndX
 5qCQ3cbBV7MAeND+An66ZYk5b3U7Ii8+JF9Uxng1Beirvp8woh7ah+h
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RbjXLGektThPjW79UPi4WdmLuG_Tyu_k
X-Proofpoint-GUID: RbjXLGektThPjW79UPi4WdmLuG_Tyu_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170076

QCS615 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for QCS615 to enable video functionality.

Validated this series on QCS615 and SC7180.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
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
      dt-bindings: media: add support for video hardware
      media: venus: core: use opp-table for the frequency
      arm64: dts: qcom: qcs615: add venus node
      arm64: dts: qcom: qcs615-ride: enable venus node

 .../bindings/media/qcom,sc7180-venus.yaml          |  7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  4 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 53 +++++++++----
 4 files changed, 135 insertions(+), 15 deletions(-)
---
base-commit: 3e42dc9229c5950e84b1ed705f94ed75ed208228
change-id: 20241213-add-venus-for-qcs615-9176992189e5
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

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


