Return-Path: <linux-media+bounces-39718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D28B24050
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4881A26BF1
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 05:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D051F2BEC21;
	Wed, 13 Aug 2025 05:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C+yn+i19"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8961129C325;
	Wed, 13 Aug 2025 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063499; cv=none; b=YbdNqOScN28BoYwMRuALosaS1ilyuZ7vxTxh9yUyPHVPw1+yMxaf8oZjHUMaVv+TeoZA7ZSQ/gTsS7PahLA3HDQ6gMlQAQXrBNiVg3SbaEkHCTDI17+iDs7kNpki5Fr2VFkzYOCK5WI3sGNMYWpJaIWGa0uxj2JwrZtl+87zpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063499; c=relaxed/simple;
	bh=ur+XoyAnnhMf2Gyc6LAvTuQZUY2496eAik8EkwZjH48=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y4jBo72+aTe966S+xnu8kGsSMxSe42n7c2Za6ShPwm2TtqWdK5eZXklsHr0GaAyFXkTdhiP9/u0bB7bJtWg/IWwC/OidhBBPJC/YKJ/RX79Ubr69UV7x2RdqWHWYm6qzTP5A8Ik980PCqI+pmKNgkuTxwijB5uZUdWD5x8k2ThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C+yn+i19; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nrDe021451;
	Wed, 13 Aug 2025 05:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTeD8XjA5sDc2PaAhEZRnC
	J2P2kHoKkZGlImDRo/ri8=; b=C+yn+i19hGSoH98BotgmaidXSNR0sGK387FIdK
	ZhSDyry7ienDPUtWpPJEt6WKVxXht3CAkp1C1aqVo4wv8Nfm1Ypxk0GdeIlL7d7q
	6+G2CoaWDOJYEztwXgRhrBiYtFM1/uqMUh7SUFwHkM8RnLMdhsaOgyuZpUI17ni8
	1rqFDw51uXZifPQDS8/4EDxworEI93judLrlpcoP5Dl8i6EU1xAhA/kKPSdkBhxl
	KEd1/P1/FaoNb/NwvXJHY4r6fhXQNdp4b/Hc5Ju7prySZebe6rH5xqa3YnjOgNWY
	YChwO48fHTeJ1D/mVnaKvcG12Gt7OOGFt0pPG+3CRlbPMA7g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv2hj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5c2XA028798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:02 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:37:56 -0700
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
Subject: [PATCH v3 0/7] qcom: qcs8300: Add qcs8300 camss support
Date: Wed, 13 Aug 2025 11:07:17 +0530
Message-ID: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c24bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=cI1YGEVR75NLnxNL1NcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CLZnXJoJvOmKlPvtAgUAzbE1_7odMk0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXyo6/oHbMxAkD
 q/qOYQnGpmer8uRpCrwrjtrBcMHqgOEFopvH9YMd/j2WJ66vOKcKIOz8buz0JBWu1dy+YZUkAoT
 XBguEQBawdPwaHNdmw0ZI8JtAE4S9qnQodjULQo4eAxo8Tr9MbSktAOHFzz6Pm5Wh0C+jtPyXgS
 MbQWjH2/YFlcP3WM5ZC1NtTw5rkjWrahBIQbmbHpYtrtJovFFSKoEX/NeSmwRnv5e82C1R2asXK
 huX3fN5iGaVdhvRaT9X3c8ZJrnSgBlA8NqRMFsM9fQLMvH3sAtGaIA1yZtgYJdEQUujUzaPHRFq
 AejWqgZ6Se2gGcSzjZOD/fR3blMQwslX10K+2CndmB5WBiobOXOblGRhYi33e0PqvPoA5JacqGj
 mBmzYU3C
X-Proofpoint-GUID: CLZnXJoJvOmKlPvtAgUAzbE1_7odMk0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

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

Changes in v3 compared to v2:
- Bindings and Device Tree: Reordered csid_wrapper to appear first in the
  register list (as suggested by Bryan).
- CSIPHY Driver: Updated the commit message for the CSIPHY patch.
- VFE/CSID Resource Data: Reused the same resource data as sa8775p for VFE
  and CSID.
- Patch Series Order: Rearranged the patch sequence and moved the DTSI
  update to the final patch in the series.
- Code Cleanup: Removed duplicate data structures and reused existing
  ones.
- Optimization: Simplified and optimized conditional checks.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250711131134.215382-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

Dependencies:
https://lore.kernel.org/linux-arm-msm/20250807121105.710072-1-quic_vikramsa@quicinc.com/

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250717-qcs8300_tpg-v2-1-0946c69c2c8b@quicinc.com/

A rebased version of the TPG driver, built on top of this series, will be
shared in a follow-up post.

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  dt_binding_check
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32 W=1
- checkpatch.pl

Vikram Sharma (7):
  media: dt-bindings: Add qcom,qcs8300-camss compatible
  media: qcom: camss: Add qcs8300 compatible
  media: qcom: camss: Add CSIPHY support for QCS8300
  media: qcom: camss: enable csid 690 for qcs8300
  media: qcom: camss: enable vfe 690 for qcs8300
  media: qcom: camss: Enumerate resources for QCS8300
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 +++++++++
 .../platform/qcom/camss/camss-csid-gen3.c     |   3 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   2 +
 .../platform/qcom/camss/camss-vfe-gen3.c      |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     |  85 +++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 8 files changed, 601 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


