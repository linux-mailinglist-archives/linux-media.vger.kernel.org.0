Return-Path: <linux-media+bounces-37504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C02B01D11
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 15:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFDE61CA26C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 13:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA702D3EDC;
	Fri, 11 Jul 2025 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AMR4YYqP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC242D23A8;
	Fri, 11 Jul 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752239554; cv=none; b=jiC6v7kIH8n2JE36ownvwP5eRl7hywoEVp9WDYOVu63u2xdXACg+icF5hWTZpG5BkYTWT9UKjvqpYqdl3mDHBNLKu6+9lc9WqJnqTcfqgKZ7MBLSe78IxkqsHDx0tbzzcIZluOd7f2rLleS8TbhiJ1AcWm+Lm+Li162oFNHXxY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752239554; c=relaxed/simple;
	bh=buj/9LK9WnRrx9la+Ug00s901rQX5MS5V6pK1tKyVPQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gk7MLDGnSH41vFu8bA4u026RwlwC0QdYzWEnn0i0FLQb81OHsW4jHhpMM3t+aL7MxJyApv0/H+8NgjCyRoN2W/SYECPZzVVqOaF2uLC5chy7pPZxUrMNBQowJkzloaF4+myu020MZtsA9+NWNmAsY2C/P1KRJahlN4cVwnCNkqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AMR4YYqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BBLP7A018809;
	Fri, 11 Jul 2025 13:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bl1nSPn5YlRo3UiVoA8IR2
	c/9+m0L+tOtQINu67XSlc=; b=AMR4YYqPLwOQ8HgTlUj3ND+N0gEkDIHDwD9Yrn
	qHaXaNrlto0oegBiwBBkGkEvdrSKhLQS9wYTWeH7OF7K9eTacrKi+y2YEUbW2L8J
	rIXF9vTM/9T4Z+Q+8ktlR2+c5NDwldI0Forrgu7j6mr+/9QujPdMv2IY67FaeTeL
	rG0TKAROVIqlM1xH4oX6BNW4KbVDVXUyd5zGDxRueFfTmX4rKMIagUReGhGPsRPE
	mdYQNOmGs4grFYk+FWFwJE73niPHxZ6E66/uU3hlg3viZOk+cfCUtdhikn9gOkc8
	2HKlL47XM+ef9ZQFoodxLUSpze9hzWhF4u5c2/C3jreyq2Zw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47tkf32j5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BDC9j2019978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 13:12:09 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 06:12:03 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/7] qcom: qcs8300: Add qcs8300 camss support
Date: Fri, 11 Jul 2025 18:41:27 +0530
Message-ID: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5MyBTYWx0ZWRfX4AlnZ+BefChF
 qO4LfICsTapvG8UfsT67gJ0kC/Ksm8hSs6sJk2z4SLX8R1MSIrx66qCW1HZpRLr6cytVTcRj/nx
 CaW+JEXHK3weHAFz8BLgQAQg7lkUULZtnI6Mol8NQ1RdIhdvLlh4gqV/ZalbzW+kcaS4sHzkE3w
 d/a6kxz4qsw4pkXhWnwgNmwWet6j5ROSBGbpMpFUfIsVUhmXpsE01AzbtdjqZ//3LtBEHAXh9fJ
 tYFKuOjkbuuY17EpAmYYlaynX5xvLhS3N5+/p44q/FnE2BHXXoQD+pCjymA+kZ3CskSs9QtSDco
 cU0CNSOs+c55R/HNNfDF/bNgxZVLSO29om/evhTeeX5vb7tDPHSWnovIKe7KQwT2g0QaKpv8mMQ
 Oe6cI9lkgXHWzXU0cFmZyTlDV+KcEhD4R5S0cRFdIBOCa4Vh9rXh5M+2ZQ0lDUF8Vu6vSG1V
X-Proofpoint-GUID: Lm_SF-pIGKVbL7LD6FApfTwYH86JsB5X
X-Authority-Analysis: v=2.4 cv=Xuf6OUF9 c=1 sm=1 tr=0 ts=68710daa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=vOnZBVaixI17Gw8aOCoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Lm_SF-pIGKVbL7LD6FApfTwYH86JsB5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110093

From: Vikram Sharma <vikramsa@qti.qualcomm.com>

QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

Dependencies:
https://lore.kernel.org/all/20250703171938.3606998-1-quic_vikramsa@quicinc.com

Driver side changes for TPG will be submitted as a separate series which will be
rebased on top of these patches.
TPG Patches:
https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/
https://lore.kernel.org/all/20250217-qcs8300_tpg-v1-1-6e0f4dd3ad1f@quicinc.com/ 

Tested with following commands:
- media-ctl -d /dev/media0 --reset
- yavta --no-query -w '0x009f0903 0' /dev/v4l-subdev0
- media-ctl -d /dev/media0 -V '"msm_tpg0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev0
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0
  --capture=7

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32
- checkpatch.pl

Vikram Sharma (7):
  media: dt-bindings: Add qcom,qcs8300-camss compatible
  arm64: dts: qcom: qcs8300: Add support for camss
  media: qcom: camss: Add qcs8300 compatible
  media: qcom: camss: enable csid 690 for qcs8300
  media: qcom: camss: enable vfe 690 for qcs8300
  media: qcom: camss: Add support for CSIPHY QCS8300
  media: qcom: camss: Enumerate resources for QCS8300

 .../bindings/media/qcom,qcs8300-camss.yaml    | 336 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 ++++++++
 .../platform/qcom/camss/camss-csid-gen3.c     |   5 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   2 +
 .../platform/qcom/camss/camss-vfe-gen3.c      |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 401 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 8 files changed, 919 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

-- 
2.25.1


