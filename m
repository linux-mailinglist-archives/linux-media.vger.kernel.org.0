Return-Path: <linux-media+bounces-21916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E51319D7B32
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D9D2815E2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A8F161328;
	Mon, 25 Nov 2024 05:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d6Ayax6w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAB1E517;
	Mon, 25 Nov 2024 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512917; cv=none; b=fTC9FDpxNaZbWvbsPy8LnwIco+FkbPpQZwPGroAJcp0RKaRwsOOYvUDEO4dNOMIE0VoK6wPOyv9PLX42J4pKXT+moxvWnoV2tx3TA/f1z+OVDKFn7g9BS7/ZDnCC4EoIQEveyD3kIM1txBbDqBLGwSRFoky382bxWk2A7D4KKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512917; c=relaxed/simple;
	bh=4NXeDYZVywiaLXWh1VZ8hy8K28yT0DHghASWc6Z8iCE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hcQs5LCRKHlWFPG0NSEMw41b0pu1y8Zf14UCbBivZ2A8NIONYQtGulTX3n5sd1Lzy/7YsbEBeQAsPJ9RCh1E4L+3RBbDpxYfKQ33CHSVMxn8cUBIzHLzG0MYw8pVhiGG7jgpIZsawmT8BRowKgdxHu9DTw33ZK3OUAIRNosKeuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d6Ayax6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0Ks4h022311;
	Mon, 25 Nov 2024 05:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jnZzoIyzFhC/9WW+CTgGgk
	mBWX0wFJKGxkFF4+RJkRE=; b=d6Ayax6w5eOae48/adBJs2PHcAwnw+oDUalkYM
	jbP4gq1nEcs+/SI2Cy8OMeoE+elVO3yXE6ylkBsgcCBijB8xH+NO+1j6JgyZs7Kj
	tN8p5TYBgEPDZB9XnceNzlmE9vmDvVAs0hbyUgESEiz2Cw/f7LcGpZuo+J2eN2mq
	jwK7YGtlMoRa8fupcl6tgId991pEd4FxxWzJ3kilNL8IB1onvAv2rGVdFtBiGyoD
	8q48AKH6zXqvRv1d9DtkCdMYG1a+CUt+zo4a1np5qiMg1jnXZROpU/6IJiPiSqWp
	gSFonO5WxDYFeQo6AtFu41vEbuXrxOo5esXSpOXnICJL28jg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337e6uegt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:11 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5ZAZZ018100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:10 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:35:06 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v3 0/4] media: venus: enable venus on qcs615
Date: Mon, 25 Nov 2024 11:04:48 +0530
Message-ID: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHgMRGcC/5WR60rEMBCFX2Xpb7OkubaLiO8hUnKZuMG22SZtU
 Zd9d9OWRUUF/XkGznfOzJyLBNFDKg67cxFh9smHPgt6syvMUfVPgLzNuiCYsLIsCVLWohn6KSE
 XIhpMEiVHohKEchDMWVtk6ymC8y8r9uEx66NPY4iva8pcLtMNiHG1AJsN08zeQkBziTBiVBjAU
 jsj6P0weeN7szehKxbcTD4Qv3aaScaAkDWTruZSua+Yy1YzQp4mP25diw5SUuvSh93txsdsreh
 7P3rVNmk6nUIcm5zUXJN4TqqthcpKXWGNPyfdLff4CVtdi3YdsiPqg4W07a6JELVRBgvC/o0yb
 TDPJvRjDG0LEc00E6Wlmtj8Imfdn4gcU1Jiua85J6hEi6UZhrdjmL7ZtUqAsuj8eNgpWhOKwTi
 hKebS8aqW2jDJmJI1xhIbp0GqKt//8g7pdqKVfAIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732512906; l=4266;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=4NXeDYZVywiaLXWh1VZ8hy8K28yT0DHghASWc6Z8iCE=;
 b=PfVYliimdr5Ejed+A4FPRhqSrAGnAUVslWp2sCPPZhCoDU5RKoIl8cMrLvlr+CvSLIIOXWswN
 fx6rBmUnkC7AU26Rk55uWrLq23YuFnh134OIzCTnY9LCCBTQXxJNoIg
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BhEUWAssVGDfckxWck4fwZo9f-QLkoIQ
X-Proofpoint-ORIG-GUID: BhEUWAssVGDfckxWck4fwZo9f-QLkoIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=959 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250044

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
      dt-bindings: qcom,qcs615-venus: add support for video hardware
      media: venus: core: add qcs615 platform data
      arm64: dts: qcom: add venus node for the qcs615
      arm64: dts: qcom: qcs615-ride: enable venus node

 .../bindings/media/qcom,qcs615-venus.yaml          | 182 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   4 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  86 ++++++++++
 drivers/media/platform/qcom/venus/core.c           |  50 ++++++
 4 files changed, 322 insertions(+)
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


