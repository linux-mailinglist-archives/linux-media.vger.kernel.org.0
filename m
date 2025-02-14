Return-Path: <linux-media+bounces-26146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BBA35ABD
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E5537A4183
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDD424A048;
	Fri, 14 Feb 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HbyoZrUg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5A1FFC47;
	Fri, 14 Feb 2025 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526505; cv=none; b=j3eJDoj/ZwUrDjH/MNqZht7lERDIcNsv+g5g989VfkTvb1zP34VmDmJK4TKFzSUR3wIXb9BCxrepGiB+0tSyq9WDXjqs61UwQKdOvk/d8vMJvfM8kdwj9WJlJIXCyDXzAQBqxew4lq9GZssg7pjQoJFv9KjdFyRht5GeYWPCU94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526505; c=relaxed/simple;
	bh=kEM4+KguikHP9jTvJfsWtsFhnXjddDSzcxwKu7eEUIE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WgQIwh6gRcWPgwn9Yc8yNTgQ2fia1Iwnobga21bNikFdZP3Pv0enz93z2aDiCC9b5EolODnv9a4UsnQQN8jBQc3aI5x59ulvQ4BR95MXiBgtUFB6aIoBFTkowrNb1Jk+0raItBNpGDByGhKQnkn6NPvr0NsLD4we/RPmz5dAvLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HbyoZrUg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E50K3t000955;
	Fri, 14 Feb 2025 09:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pV4F50q6aGUXbvPJzNnvRl
	iaS5adwLOXuLykzBQqR5s=; b=HbyoZrUgrZjkmdlIvQcHT5pyo1pZlWk9jP5Jek
	PZ/RumU/zhX1Pd+M/fmTy6B/AuFBJ6dspAC6Vvu5mCR7ruTruJ+/Ml7BhDf/F2b0
	mJTRMJjXUF37+5oPHE7cD8xqmmRed9moDunGC8mo2fzwXJuVsmkvS5bJd4jdVEjk
	Ndpn+7Z+/35Jdm41o1DTi6HIWXxouIBn8geL781Fn+k4HDR+//fbT2C1w8HXyBbK
	doYb/aRqaNyJlZx9rvKZXIYGUieR+ED5BAussIvO9tnl+YKT5IM3m2mrqm6p48Ki
	Nf1vUy8Kg6vuvg1UKbjp4/Py5cLz+gcDDOVDJ6nZH7N2lHmw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7bbnc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:48:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9mCrp002506
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:48:12 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:48:06 -0800
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
Subject: [PATCH v1 0/2] arm64: dts: qcom: qcs8300: Add qcs8300 camss support
Date: Fri, 14 Feb 2025 15:17:45 +0530
Message-ID: <20250214094747.2483058-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vgmVAyoP3W2_70y4ARlGUuIX6mqAaIdV
X-Proofpoint-GUID: vgmVAyoP3W2_70y4ARlGUuIX6mqAaIdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=582
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140070

QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Used following tools for the sanity check of these changes.

- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: dt-bindings: Add qcom,qcs8300-camss
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 +++++++++
 2 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

-- 
2.25.1

