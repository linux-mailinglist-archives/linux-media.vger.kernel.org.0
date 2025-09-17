Return-Path: <linux-media+bounces-42671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFEB7F250
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3AD1C80FB4
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 13:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7746C333AAC;
	Wed, 17 Sep 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NVVMP4F9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6A2494F8;
	Wed, 17 Sep 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114440; cv=none; b=sVVa59at2Lem+FaekEmOQ1x1QvvApVKZ6G41nvs4zHcnMb2PjO+GHPR7Up3KDiJgaj1StnLACvC5n6lV6EnbnHdqTtWFVzL6nWpzwBwb5Ac5IeURF/bDJi8eFQkuV8uRTapB2l3hW16i+ex7+MJsBrQEBpWrxd2im5kDrV/JhXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114440; c=relaxed/simple;
	bh=07Z+7lEYn50IcefYha2C+kHvzFRCpea9gQQqNZKbmdc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fe+Mzx9tYj4WFUaST/6nLIhV50Jc71oddlLTYiFl53bjCz0qF+869fEA/SFdKeJHCiHJmyU8dOQSKycjjDJffrlH5RdxLLE5z6XceX8Aek4noqngxIaeEr1/YulSbY89IJbBhZYMPANurTWMq0zHZegNlIbBxGlpXfxXuv8q0xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NVVMP4F9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XYdO026846;
	Wed, 17 Sep 2025 13:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CM6E97NiG5rYGpms0xKoTs
	VCHIrPGUqA11xmEILxBao=; b=NVVMP4F9RcrX9GRWcbBw9hSAP23kNb2hLlr4yl
	eogAiNqQOU0hyQPuCsHLmqV5AMbiOGrG4JacmtQDQcmPgAw4oC3yjUtigwTsAVXH
	hgwne4NcJPsksJ1kJ6yAwodUZlgh3/pUma5hhZGtCiddIpV7dUnuHet8tvjt7HJI
	1g88x9u9qibodmNTBLKBA1i2D8Zx0F8MKI1MsUH5gSOwMssvSeH6NNFrN9xSH01m
	s/s9PAlWSV399jjTV5zlKcdhUIT66TXjlzQ0DotTJIR9WbC2gUEExMAs3YvdM7rs
	Ye8fDKYAmx+o3BjY59bvOQBUjzBOhO5dE179OE4eRM+YRwcA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt2evp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 13:07:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HD75Ov002310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 13:07:05 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 06:07:00 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_nihalkum@quicinc.com>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] Add CCI and imx577 sensor support for monaco evk
Date: Wed, 17 Sep 2025 18:36:44 +0530
Message-ID: <20250917130647.1701883-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: VQhMJjhFcM3_yEVESsif9x4y_XadTmjB
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cab27a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=RVIg9llbwysgEqpyqKEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3Qe/BDbphKXU
 0Ze/s0IjNOetLsRnxcKLW3Tza1MLvcIcoo5h8G3gcXv3QscmTXJztcWk3efoD6ovaQASaj+t7Nk
 y0n9GN7d+5ZgNg45R/8qEJtu4tlIW3Lb/8FfMWRSgMwRZTBOR+jItaGthBhqJ3TbOR0xulGJVjK
 mQCvG8qObGD9+BxLlSmgs+hPVHL5YpCMBD+R6mKB+Lzty0JsCCF/6tchSoVgD0RqVFqVXT8Kyqd
 R/ytdBcl5dEVUJpnXFsvlY6ANBYMFMQlDsNrB3QwOSXgKJtFRM9KAaqkp4Kj7yNFH1U53VRdBZN
 Zh9v/ke4ZaA2SZm9v09nm+xmcqbbAvgxgaIjWkB+xyILaHr5iMuUe1Z4IEeQ0aS4ITmQxfY7FHh
 cbY3bOzz
X-Proofpoint-ORIG-GUID: VQhMJjhFcM3_yEVESsif9x4y_XadTmjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

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
https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com

Bindings for Supplies are added by below patch, Bryan is going to merge
this in linux-next:
https://lore.kernel.org/all/20250910104915.1444669-1-quic_vikramsa@quicinc.com/

Changes in V3:
- Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
- Link to v2:
  https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com

Changes in V2:
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

  Below 2 checks are passing by taking bindings from:
  https://lore.kernel.org/all/20250910104915.1444669-1-quic_vikramsa@quicinc.com/
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
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 309 ++++++++++++++++++
 4 files changed, 411 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.25.1


