Return-Path: <linux-media+bounces-25930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD82A2F240
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 16:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B5418819C2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F221C24418E;
	Mon, 10 Feb 2025 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cigTyyx2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34B241CA6;
	Mon, 10 Feb 2025 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203000; cv=none; b=Mt4vZrlNKeQRI//jIaJI8+swBfbdDs3zhKsoEPAMbSbNcI9APxMBgOaUVMHiwfivignnIYWdTSqGACb5HwEEQX1yY8j/TETmhJPDlj/DUI9vN/Arevvt70JTfLHiTQNSYymJ946jiQ/PlMvIyuyTPMivYJsgrVOe9XylOCbOzeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203000; c=relaxed/simple;
	bh=rDedKxEefXsackABt6YFb3UahVifC+H9tWsS17tmshE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=peot3ezsYf5KM9KpJckFcWKfdaz0FQLcnT976RCloMBmHK+8e14j8ollJsBFlxTrTd4dePuivk9tEsaV8NEQ5wgb34oOGvKOyOsr3zai8pzm9/HB/lg1RKZMZfo2vJa0sEoTH4HzOmmnoFBV0l0iZUY59066yE29Qx31V2bpxeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cigTyyx2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9HoDP001462;
	Mon, 10 Feb 2025 15:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wa0cJZMSZapOEwhgl8wBba
	D2/qRsUY1uAW8tNNERCZ4=; b=cigTyyx2orDbmVFdHth0Y8Rib+2svLsWU6l/0q
	ubLo9aF8vFpIbAH60i7U4UiL4DqAZdIU14XBMr+fuq9VOnMiEjLYrUDnZcVpnRQR
	Lfza7jj6Y0lwIOHvu4gG6zkC0QLXZRXQEs9swBiPsbbz3rI2iVu2ntcVz5FS4gw0
	JresF/gge1wkl5ilI1tg7KgvGvk5MhBo3zOPeU+pDosKvQkbGPMMaBkzgyLQIlFv
	e+pa6GnIB6pK0gct2J8DM+RcnaXeJxq1b6b/b1ZJ6AElxE4l45sLZifLY4SBfugG
	tSWNngV4FNyksXs/1BEr2XqwfGm/njV2K2RCehjLTx7DM7dw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxh0wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:56:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AFuPRD021331
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:56:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 07:56:20 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] arm64: dts: qcom: sa8775p: Add sa8775p camss support
Date: Mon, 10 Feb 2025 21:26:03 +0530
Message-ID: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _t0PWLJZIDep5kaAbqjtJanOuosYooqK
X-Proofpoint-ORIG-GUID: _t0PWLJZIDep5kaAbqjtJanOuosYooqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=613 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100132

SA8775P is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: dt-bindings: Add qcom,sa8775p-camss
  arm64: dts: qcom: sa8775p: Add support for camss

 .../bindings/media/qcom,sa8775p-camss.yaml    | 351 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 187 ++++++++++
 2 files changed, 538 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml

-- 
2.25.1


