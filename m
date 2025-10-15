Return-Path: <linux-media+bounces-44584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E38BDEB32
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8535505B11
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4881F13C8EA;
	Wed, 15 Oct 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UCuH9asw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491732BF24;
	Wed, 15 Oct 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534015; cv=none; b=C3m55i2xitSclUQe9O0L/KJgvCSzjTR/ch+CfijufUIpEY5pf+Ze9kG6jm7aRD+7QpoM8XjjjwV7fUt6jDDnw2vQbApmIMNTA1tBds/UdoDKbe3dCTwhfhlsk93fbBfbqF2BZ+48bibNZRfZY753i6XF/FLZX0XHahcI/pQSiN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534015; c=relaxed/simple;
	bh=OhP5z+uhLIeIW1QADkJmlGQZetbZLVoAvU3kSxsRFsk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eXCtMuinqs1BogbWbflY70JiE//1c7+cAwWlpS2jN1lRnRZz6FsohcbZ+7ArMHCzyuMEFoK9p599bXS3ouFgDZ/MW1zvwEYMKa9a7p0l7X4B/COAQ3F5skqKm7GH6E0YMCl2pNHvaFkLiyp6ZxzKiX7sGJ+U6ACHOFe5ZMKVXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UCuH9asw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAoGS2003541;
	Wed, 15 Oct 2025 13:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L9FZVV8ifs53cNZY1ESFco
	2sDL4YiPzh0mjjUAVy2tI=; b=UCuH9aswW28wybTqAB1WOE4kU3YUtW1z2UWTFT
	7/Rbv/ZZYa4zacJVJdkF1H4e82Uq+73gMzSI1fpk0kz0+tF37UDLUdckv/zsYiXs
	wxOqmUiH5JZ2gWS2+S+oUyG+wqN1lIhfmY3VYOKdobyUVbj0j19NNLO1NqPpM5vE
	pLz2+rY8tNEs2p11fr2BqN9yg3zgCtuwOVRKToKqisWFJ//qsUcoUPpwAiil1LfX
	N8hqie9dCTcbJ7hnielRqcadiFrV3SY+tIF6uL0uhGbgR6xdw1c0zjUoe0++JhF/
	QlvXW+sdpaUg2wrJagUuBgoYNfP2LEkvYfa0X/UAzMW6RGyg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8k3cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FDDNFt004956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:23 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:13:18 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_nihalkum@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/3] Add CCI and imx577 sensor support for monaco evk
Date: Wed, 15 Oct 2025 18:43:00 +0530
Message-ID: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wEWTZE-niR1qI16psjOeZ6KVFFqdoMVd
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef9df4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RVIg9llbwysgEqpyqKEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6wigO97PcB51
 Ge8XW3keTS7UxsaTGO3UPw4vjE4YDrBhMVg7kG4vAUgZx2cl/mkgk7w68cHnu0J41K7eZ81Ur4X
 0Y1djEBGAQU+XwL01thuihc3J/S9p0NNYGKbThar15YiprocGP4BqCwk0cA0u/agxagUd+yzQsI
 lR8m8am7TEDacdz5i0gYIEtYoOTHCOP/AGlyzXBenZgXjurrr4+rGRgjobFid/tBVHaleoBn0uB
 wzWx6WJ1SXZX1u4LkIJbNckbxBToSHAQzuUp0o6Olg1DhIHUsJGuEdADKIteCXD79z7tk7xfE01
 9b1kK03eLosvaSSsW3FB5qTbaYeFJvjd9HBND2Iz/DBxcKpA+T1o4SvhBf3mLE7yN76GG1GO8XH
 5I8x03bnTKUVDLrcnuOEBxJmD3CibQ==
X-Proofpoint-ORIG-GUID: wEWTZE-niR1qI16psjOeZ6KVFFqdoMVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
---

This patch series depends on patch series:
https://lore.kernel.org/all/20251015130130.2790829-1-quic_vikramsa@quicinc.com

Bindings for Supplies are added by below patch:
https://lore.kernel.org/all/20251015130130.2790829-1-quic_vikramsa@quicinc.com

Changes in v4:
- Remove the AXI source clock from the CCI node - Konrad
- Updated the qcs8300-camss device tree binding.
- Link to v3:
  https://lore.kernel.org/all/20250917130647.1701883-1-quic_vikramsa@quicinc.com

Changes in v3:
- Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
- Link to v2:
  https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com

Changes in v2:
- Remove the patch that adds PHY supply documentation in the qcs8300 CAMSS. 
  bindings. This change should be submitted together with the qcs8300 bindings patch.
- Fix indentation and regulator node name - Krzysztof.
- Update commit message as suggested - Dmitry.
- Link to v1:
  https://lore.kernel.org/lkml/20250909114241.840842-1-quic_vikramsa@quicinc.com

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Nihal Kumar Gupta (3):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: qcs8300: Add CCI definitions
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    |  96 ++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 303 ++++++++++++++++++
 4 files changed, 405 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.34.1


