Return-Path: <linux-media+bounces-33619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03444AC871F
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 06:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3379FA2210E
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 04:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D34F1E47A5;
	Fri, 30 May 2025 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b/EwWc3f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB54689;
	Fri, 30 May 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577794; cv=none; b=Png/Ecn2G7g+RPr7bpfUWHAQhO8jc9hagKDs44PeKTJHU8QnKw7rWJwLd2+oqhPGkrMVvXWVS3Q/3u5ZgutH7uLyj9i5RC5Sly6X15sd8G/g4LcHpSbv+jAp2uVkvhshYiGnz4DVsrU4cl/es2GMKqedThzXw7yixzKI1pVULWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577794; c=relaxed/simple;
	bh=OFyAwHWb5Hq6ccy32Q8MA/AWh/hYU+rVoeYvcZptIUA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=B1gA8tFvVa2lpZXOKv3VGI33GtQ+Pw+bdukrAS66F9khBG/h/wnVnzw1MxDutVXR61QY670kiPqm4nXqhcldm2VSzZPdNXddSbF1xqHVipKC6Xt11LmV0eQlJsTpVHV3CfTaNfn2T8v/aCfkrFKGRJRBOb5Ml4EP2QlCvPJY/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b/EwWc3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0oko8003582;
	Fri, 30 May 2025 04:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cknv53wXBx53wYTbwAA7sM
	Dw3tbOlyZ7iqCJkb6NquI=; b=b/EwWc3f+MO+JtDLD7Msh9+WE/3ag4yI327fbO
	yJToE0OD5yS7+aQWLC6/7uUFjxhfMx2tKEFqJZp9TM1B6I8fIPHLvvrCKAfa8rbq
	7ONjuwCIbebjQg18vxC9me/pQjzJYmEMnAmn1KQ/P/JkcRnt4DnqFE1Exv/JpGD5
	Xg58qIsalPk8hcXV1ZimQ8a//AJ9mQtQzJuDGgi56pwLHf2tiFzUM8i76PZ69PQJ
	DxmtW305Gk1gLxgXgw8bgcoYGkHSoAVxAIRZnqrRPh1HkLcJU5/QdumcG+I5PGZq
	Y+smdwjPEEg+zY9gvw851mn4pss9qwUtU+D9D3UctlRA2aDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549qmsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54U4330L001317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 04:03:03 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 21:03:00 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v8 0/3] media: venus: enable venus on qcs615
Date: Fri, 30 May 2025 09:32:12 +0530
Message-ID: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMUtOWgC/3XS207DMAwG4FeZek2Qc3QzIcR7IDSliQu5aMuar
 gJNe3eSDbRB6aUt5csv28cq0RgpVdvNsRppjikOfS7qu03l31z/SiyGXFcChAYtDHMhsJn6Q2L
 tMLK9T4Zr5rRCrcBoE3iVn76P1MaPM/v8kuu3mKZh/Dz/MvPSLaDiAHUBdxdmN8dAA5s5A6ak8
 QTYtN7Ip/0h+tj7ez90VeFmcSU4F/9nmkVmyKBV2FqNrl0y8oYReoWRmdFOomksOlPTklFXRnC
 5wqjMIAlvHYogwS4ZfcvgCqMLo1BaHSwZCUvG3DJ2hTFlNjmKCrIBkGHJ4A9T1r6WBjPjvROGB
 ObR/NnU6XIJI+VuitPlHKqOUnLnu9puHs4+zzG/xa4rewsT64dA6bJDr4xrFNRg619TeyyX1rh
 ELBddnLYbjoYsRwIOvsHgvQHdch5E46VsJShhhapFk6OdvgCc/adR+gIAAA==
X-Change-ID: 20250526-add-venus-for-qcs615-a547540656d1
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577780; l=4682;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=OFyAwHWb5Hq6ccy32Q8MA/AWh/hYU+rVoeYvcZptIUA=;
 b=HKhGJup8dtOCwHsbkXX5oFw2wHpVOp8qaJUntreFFcZ0tFIORoQZ6iMovQ6yle5qWe3b+Vi4e
 +L5OecgiXCGCFBXrs5kr3lU2yS/4MHwBgJU+s7fuQOrs0nIoSBAnoGR
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 82IPsUsr2Jw1E2IcLG4wUKr5FGK-YitN
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68392df8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ZRKmEd25s01oF459BEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMSBTYWx0ZWRfXw6HNCslIx1EH
 OQsj59KHZyQ6/tZdph2bL1EPOHnXIypg+rAGD9RNpzIc9TG0d1yOeMlyTGl446x8B5ynGALuh6o
 kuTxT9JesOxKrq7RsT7ag73iG38hSG6Nk+K9TjScz7TSsEr1e+BeBaDrGA8wMBXlEv/O8el4W7T
 /gPS4HG1gWvzJgfug1wPZfdReYXfq1Nhp9BAnrs9V3z+KgitL0TQ8C7M1ycKxcjOrzXgDhJ6T7l
 BEIAofplVMzuHSiWsb9imqOoYoiouv1ZrEpDcG2HGJpYmrd68r2W0WBbTb3slcGIDyPOO9FTuJo
 PEBXDYBL7NG38o7oyN2svPC3UD3WS/Reg7nSijpncRKRk1Mbm5HVSOzSo3H5tKV2sCimHodMB06
 1nMURV10xlKAyjPT5P2aAW+T/YNfkAv4FWAyBniZAdd8ZTcEwzxjPneTMP7oJ11RBCKQdAdn
X-Proofpoint-ORIG-GUID: 82IPsUsr2Jw1E2IcLG4wUKr5FGK-YitN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300031

QCS615 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for QCS615 to enable video functionality.

There are no resources for the video-decoder and video-encoder nodes
in the device tree, so remove these two nodes from the device tree. In
addition, to ensure that the video codec functions properly, use [3]
to add encoder and decoder node entries in the venus driver.

Validated this series on QCS615 and SC7180.

Note:
This series consist of DT patches and a venus driver patch. The patch
1/3, which is venus driver patch, can be picked independently without
having any functional dependency. But patch 2/3 & patch 3/3, which are
DT patches, still depend on [1].

[1] https://lore.kernel.org/all/20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
Changes in v8:
- 1. Add missing tags.
- 2. Fix the dependency to point to videoCC series alone.
- 3. Fix review comments from Konrad.
- Link to v7: https://lore.kernel.org/r/20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com

Changes in v7:
- 1. Update devicetree patch to fix the cherry-pick patch conflict issue.
- 2. Remove dt-bindings patch from this patch series due to it has been
picked.
- Link to v6: https://lore.kernel.org/r/20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com

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
Renjiang Han (3):
      media: venus: pm_helpers: use opp-table for the frequency
      arm64: dts: qcom: qcs615: add venus node to devicetree
      arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec

 arch/arm64/boot/dts/qcom/qcs615-ride.dts       |  4 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi           | 78 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 53 ++++++++++++-----
 3 files changed, 121 insertions(+), 14 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250526-add-venus-for-qcs615-a547540656d1
prerequisite-message-id: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
prerequisite-patch-id: afd2dce9e6066b1f6ce0b41ceafe0dd47ad97c40
prerequisite-patch-id: f8d64c8cf6cd883dc7bbb2a4ed6d5a4db85c536d

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


