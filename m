Return-Path: <linux-media+bounces-23366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25F9F08E8
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 10:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F9B188C724
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E871BF7FC;
	Fri, 13 Dec 2024 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WIaSOAkt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81B1B412E;
	Fri, 13 Dec 2024 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083858; cv=none; b=un0JrLOnVirCvNM4XfLD/0cGN/0sM0w3AiAsv6cP6XyJWTUY919S0PrVVAfSGnaWAjovfmxZe3g+aRQAXi6dQvLcUwQLzXIbFKNEgthsSCP3JXxBjszLhwnYrvBCmC4SLpDCEMXt49tRxAlOFZ5qH2MOWlg8haQI4Jo8hLrjafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083858; c=relaxed/simple;
	bh=NzeK0LaOIVOS9o7nvm+oV6GyyHcmg5zDiCsBPiSyd3Y=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pj4ciQEEK0WIaYh2lllPmEl571JsuijXx4NScHzJn5kk6HhxLsrG8yZ7EbH3p+J9XWD6LjCsMAm4sdLyz632t0ZFYgl8nmh8jLlmARjt7afvymw+BFhkTSdY9Zgx9QTPtnFSQ2MwPbJS/GH1FqTdcA5jF21+ETZK0CMxgAVQcYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WIaSOAkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD7IO7J029994;
	Fri, 13 Dec 2024 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+4rfkbwPSpZNUNhB1iNR3k
	naVXg/NN3F08CxFDEtCIY=; b=WIaSOAktAhdf2avzetj2LJd88w6txvwuii5kMt
	Km8gVYFAzcIbHWhwufV3BF/YvwVuzYmm81+ep6YBweNkn/8qXj4rPJDZ4jZwqF95
	2or3b0FcS1/2L4Eb6G9PNvQySWf5CCaTfhVgd44WXAMk8DNN9gMxRcdBkvDi+zhW
	MMK7lqUuMdcMD2zTuJzhszZQKOqP8Lgz5YNr8Q/C//8ESKUlJQ85FpZTOHIlK1Ns
	gnkocK/CZnHj5kFe1zvbBAC1VaaO1pxEIvufCJ+vPo38QZ+ILSsXQeQ+uutEg9+2
	JEcaUYFFMsk/uivElEYR0vUu23c99dJnR2rfRZK7TCjIgnqA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4e98t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9vOKa025948
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:57:24 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:57:19 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Subject: [PATCH v4 0/4] media: venus: enable venus on qcs615
Date: Fri, 13 Dec 2024 15:26:45 +0530
Message-ID: <20241213-add-venus-for-qcs615-v4-0-7e2c9a72d309@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAN0EXGcC/4XQ7UrDMBQG4Fsp+W0kOflqhoj3ITLa5ESDa+OSr
 ihj9266Ck6m+Cu8B/Ik7zmSgjliIZvmSDLOscQ01iBvGuJeuvEZafQ1E2AgOXBBO+/pjOOh0JA
 y3buiuaKWG20t8NaiIvXqW8YQ38/s41PNL7FMKX+cX5n5Ml1BxtoF3K7Mdo4eE505ZVQK7ZCZP
 jgtHvaH6OLobl0ayMLN8E1wDr//aYbKoDZWmmCV6cI1Iy4YUH8wojKqE0b31nS6xZ/MaW2bsU5
 LnNbKZMBSuvPuNs3d6temX+IwUD/RMXksa9cetLauc0yDvNTvl1X+R7ldcq8ujVNOux3m9b/Gi
 x48CBV8uBL7riCtYYjTphEowTsLYJ2yimEre47eMBWsrKdCD6wFaGvT0ycEa5HaLQIAAA==
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
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734083839; l=3773;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=NzeK0LaOIVOS9o7nvm+oV6GyyHcmg5zDiCsBPiSyd3Y=;
 b=iv96TDRMM4yYpVP3zYnCYi+knWzKX00twY+n5A03PI9YA9bRYeFJsproMioWhweBStBRxJZE8
 /ckKWL5QTn6D5s57ZPOnQ43HFl7tQUBB43/VQgnLoNcu3I/fsEuj4hr
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5hts7Fdu--nIWDtdzHdSuqED7jssbx6S
X-Proofpoint-GUID: 5hts7Fdu--nIWDtdzHdSuqED7jssbx6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130067

QCS615 uses the same video core as SC7180, so reuse the same resource
data of SC7180 for QCS615 to enable video functionality.

Validated this series on QCS615 and SC7180.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
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
      arm64: dts: qcom: add venus node for the qcs615
      arm64: dts: qcom: qcs615-ride: enable venus node

 .../bindings/media/qcom,sc7180-venus.yaml          |  8 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  4 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 86 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 67 +++++++++++------
 4 files changed, 143 insertions(+), 22 deletions(-)
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


