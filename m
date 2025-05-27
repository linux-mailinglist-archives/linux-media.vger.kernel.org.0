Return-Path: <linux-media+bounces-33416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE88AC46D6
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19455189574E
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 03:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC96C1B85CC;
	Tue, 27 May 2025 03:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gxGzALrK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829F450FE;
	Tue, 27 May 2025 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748316797; cv=none; b=aF6cGeWSUndjYjB2xDCgyonFCc7HDL/8yk4TbUDWV7r4QG3yXbz/CDhQpR8vIe82FRsFwmbfommbgdtpJMTC1yUQtuUUMMeCNh6UHX0B5Bhy5s618G2XBqhaFMXE5+oSt7KC1OUcQm566DNw4oVme5mjAaGLRjVm9P5D9PxqsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748316797; c=relaxed/simple;
	bh=1OF5+vHfl47rQV5lIX6EYm1kwXa09vFVEdM15y/CyeY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=UIEOtE+39dhNN5qnsTubU+z6AA1+5aAsycCzr7d/AsS8dVhAoAu+b4Nh5Vj2bMRfbdtYoQpPcObABhgfzeL5/fU3RnyrOXBZpd+CEMoD3mKde7I5hfOI6w+NuV97UIECOVbZdq2j1ZHIPciXk59hwSNxBCqVzEhQe6rbIT9bmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gxGzALrK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54QMP1BR023955;
	Tue, 27 May 2025 03:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bJvZpZbIdupLBltRGu21uT
	sAvJB8R+abVLj1dGVKY/8=; b=gxGzALrKjGtKaYjIyMFa9dJw5lkjBtUlLa1PEG
	VMW7XbOF9w6svqLbtcMhJZ1ePZwfdCzO3DsBcG8m09NqMfjQunmorlKORqqdjghT
	ExhtLEvk18OMOcJhRMedX3vu4wutPShSSVBWgAY5WeC3PDNcnbzLwZgT6PvkDD1s
	5y6jYNkpaTeknU44SlS/N11yfXJNM2BE70w0Ta3c7Dsk1nsDDFF86OwVj9CGGXaC
	WkfPX6t2TrfkEVTvbTrPsRp2Er/Bv7Qf+X4RM+YHneucSumLFT3/ZfSJxzSWdb/6
	28viFTOyhS079kq2yhZSUogiOYNL3YiKJzgLccSq5J6VfZ3w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejwha4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54R3X9FM017964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 03:33:09 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 May 2025 20:33:06 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v7 0/3] media: venus: enable venus on qcs615
Date: Tue, 27 May 2025 09:02:24 +0530
Message-ID: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEkyNWgC/3XS20rEMBAG4FdZem0k5zSLiO8hIslkqsFt4zY1K
 Mu+u2kXsVL3cgL55k9mTk3GMWJu9rtTM2KJOaahFuZm18CrG16QxFDrhlOuqOKauBBIweEjky6
 N5AhZM0WckkZJqpUOrKlX30fs4ufCPj7V+jXmKY1fS5fC5tMZlIzSdgafL8xziQETKYxQIoUGp
 MZ3oMXD8SNCHOAWUt/MXOG/BGP8/0yFVwa1sdJ0VhnXbRmxYri6wojKKCeM9tY43eKWkb8MZ+I
 KIytjkIN1hgdB7ZZRa8ZcYdTMSCOsCha1oFtGrxl7hdHz39QoMghPqQh/mfNlhCPW0xynyxybH
 nN2y0Lsd3fLPkguf8S+J8UQOCR4I5CGaUyHA46ZlLZ28g5cUF5oZd260/28K1uW1dgrlpMwkSE
 FzJeZgtTOS9pS29qN5l3GGqDv47TfMaPRMoOUUfAmAGiqOsYC9yBEJ2p+y2XLfX3x+Rs/fQHEC
 gMAAA==
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
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748316786; l=5048;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=1OF5+vHfl47rQV5lIX6EYm1kwXa09vFVEdM15y/CyeY=;
 b=nmmmL2RImoD60Bx7weklcGA218mTgDF+IJarcHVFVngHEK8k7Q/q26QRPCoRAU2teyM/i/eN2
 hWFLi8aN11WClCdE28GLmyBJvsy3XWVv9jTwnsEFHIw6QT2KulkOFcV
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68353276 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=ZRKmEd25s01oF459BEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2NnlW-EXiLhr2cWtOlnbRplTr8QVdRcv
X-Proofpoint-GUID: 2NnlW-EXiLhr2cWtOlnbRplTr8QVdRcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDAyNiBTYWx0ZWRfX88TF6K+YqPT8
 9ZuwmDozNBzIN+J90NXWdrCNQhKxeoyDkI9LPemZIpG97mHObglt8HiWBCRThgUghkgk1hCkRIH
 rB0/MYLbGp6+2zgjRXxE/m7Mhlp8oJqdf8vN9Ug+1JbgU0UNim5MDnG6W7gpe4uCaQUkdquPtTs
 oDP3bvsHFBrOBstYM2U3n6rATDvqLTXKhp91bynqNz93nUu7loe+PdV4iIWJCTTogteslJo9zNu
 pD6gVOi8mtd7vJERp+yq3htadEI5piGgRQd/wMGrUnupKu5m7hdqlq0pN/JBhCDyjGGkY7gftgG
 Jw7nv/RVcp1wWE357w+ad1v2kxlIB7Fjr2QPQRUgB416fBO0lciy8xWdDyzZq1koeXlxTSYM7ux
 vt++IdaxOK0/WLfM+GlFFzOBKbl2iVqx25ZaRNcR4IwqSgQJe+WJAm2GOQgDLxE7BXTP0w+2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_02,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270026

QCS615 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for QCS615 to enable video functionality.

There are no resources for the video-decoder and video-encoder nodes
in the device tree, so remove these two nodes from the device tree. In
addition, to ensure that the video codec functions properly, use [3]
to add encoder and decoder node entries in the venus driver.

Validated this series on QCS615 and SC7180.

depends on:
[1] https://lore.kernel.org/all/20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com
[2] https://lore.kernel.org/all/20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
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
prerequisite-message-id: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
prerequisite-patch-id: 90315d53ce2ec33b6503433068dd9a3ecdba8e8c
prerequisite-patch-id: 62ba590f968bf83ef3bf623e37be71aa861649c3
prerequisite-patch-id: b9e3a2663e27dc60be0eff97baf3739db8516eeb
prerequisite-patch-id: 23062409b23977940c958bf22a215ae5dc45e93a
prerequisite-patch-id: faf0d569634dad432f67acd073343e47add0ee68
prerequisite-patch-id: 9a0caaaa8d25634dd0db5edffbc939eb7e734c6c
prerequisite-patch-id: 1a1dbf7144745dfbc60c0f2efcad188d1fc26779
prerequisite-patch-id: 2327271def3656283d53dadb2ce9f8cd561249d1
prerequisite-patch-id: b12e39a6a0763b8ec23c99c82f3ac6acdca26f85
prerequisite-patch-id: 71f0eb0fb98c3177dcbe6736c120cba4efef0c33
prerequisite-message-id: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
prerequisite-patch-id: afd2dce9e6066b1f6ce0b41ceafe0dd47ad97c40
prerequisite-patch-id: f8d64c8cf6cd883dc7bbb2a4ed6d5a4db85c536d

Best regards,
-- 
Renjiang Han <quic_renjiang@quicinc.com>


