Return-Path: <linux-media+bounces-39038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26149B1D74A
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 14:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E00B418C7ADD
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C95245006;
	Thu,  7 Aug 2025 12:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bXhySOjA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795C43AA4;
	Thu,  7 Aug 2025 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754568700; cv=none; b=RP/+XV4aIHUIPv8zzvE447IXeRlUMrrqPgNroFosK3sgR4H98wuH5MhkeN4UFN0gFKBIQGmuxGrS16zyEGCBXvBaVlCEkLIKniY0pXZnBcpZhsEo3wJML/z7IfGYCgITrnR/g/cxfjENqngx+L5pPnc1j3ghuYFjstCu+JBnXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754568700; c=relaxed/simple;
	bh=mAhgBynmJnocllLCHJ6doVOLTHWJz4kK52Xulssrbe4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OhkBUxN5hGBWH9ONkZId7LzOvFNJ/abJaBPjWg/46AHrr/xwoi/9h5VJoyFHkZYtdUPBWkbjzKbEPkbpJ4E717kCp3MOc31Jt4rrMd64hQLwiAjMKhqphGullKC+61IERrCVdsfTeC3T+TyA8Mk6U4yQRdQ5d6kTXgsrsz6f7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bXhySOjA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DDjf003806;
	Thu, 7 Aug 2025 12:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=na4kuzAX6zdMPU6c5/HpDL
	h29ZK+3d1BAZN1gqDo8kQ=; b=bXhySOjA512a2aJuYjwBaXhAYi9ScN1j+2/UAf
	LUppPR93k8UQLWJCiel/6h53Is2dXWirEeGFBQkCCXbeQ1friUBrX3ugN1oQ2HCc
	vVhNZ6lUblHLATw9Ispzu28UjQ9pnPDrzD5SOiPawtCITEZlyHZQrlxQie24dvyK
	X6uCbg520pji6XPT4CmR5Diybr2dJJ1DF82hL8NivP3fO7B0mm6l+SXC6Q6jJRIs
	87lE/7MGUeuZNGQvri/m5E6NJiyXs8FT+U8jW7QKR5nYPSGWblzKhtv0Tj52CCob
	5FrXk6xDL0I5x30aZKyASkqXGmuLCKtB0tYuJhJL70IqPawg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyae66q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 12:11:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577CBPim023968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 12:11:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 05:11:20 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/9] Add sa8775p camss support
Date: Thu, 7 Aug 2025 17:40:56 +0530
Message-ID: <20250807121105.710072-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 9HFhudJ_i4ZFKKJjesvQWRxLT7UqqYFg
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689497ee cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=4pAsuTqdjomlMBfRpP0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX7OIc0z45hxZ2
 6b9GEecwFLpdu7nBRb1hIHvmVbx73XpWyo5v5wLfKssacLLYIjt3aqlRpWQMegK/0K1B6bKAmuM
 KDCUfKn5SVxMLmoZ+47HIG0Zz/cDS2/ChWT0BnR9xwAePFiGoT4kvoyMEmG+5zz+R84OgAz+VSc
 Z+IQ0xdjMKTUgg9s9u+VsRjgRvcA6gE2CByJw0EZ51DW1K6qKw+FIiH5XuHkdJL77eTUXQYWUug
 Dx2mNKvmgV5ybMMZuOQT+y078Yp6X8VjNrPGq4N3rWLq4UGfjHdc4c8mGmK5EvmqzwC0fiW3/i+
 it8BmFUNlgm4AhDWbpax2RnqV8Ow5buPUkSXDTXqpyIPkYdkil5Uux5/5HusYlE0RfGygkXFeSj
 9Smy7CJi
X-Proofpoint-GUID: 9HFhudJ_i4ZFKKJjesvQWRxLT7UqqYFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

From: Vikram Sharma <vikramsa@qti.qualcomm.com>

SA8775P is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY
   
Changes in v4 compared to v3:
- Bindings and Device Tree: Reordered the csid_wrapper to be the first
  entry in the register list. (Suggested by Bryan)
- CSIPHY Driver: Added comments indicating the CSIPHY process node number.
- VFE Configuration: Defined bit fields for vfe_top_core_cfg.
- Clock Optimization: Trimmed down the clock list for VFE.
- Cleanup: Removed newly added deadlines from the CSIPHY, CSID, and VFE
  files.
- Link to v3:
  https://lore.kernel.org/all/20250703171938.3606998-1-quic_vikramsa@quicinc.com/

Changes compared to v2:
- Renaming camss-vfe-780.c to camss-vfe-gen3.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated commit text for Bindings patch.
- renamed cpas_ife_lite clock to cpas_vfe_lite. 
- added voltage rails for csiphy in documentation.
- removed sf and icp clocks.
- removed sf_0 interconnect.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250427070135.884623-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Renaming camss-vfe-780.c to camss-vfe-gen2.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated cisd-lite and vfe-lite interuppt names.
- add enumeration changes as seprate patch. 
- Update required fileds in bindings.
- Link to v1:
  DT: https://lore.kernel.org/linux-arm-msm/20250210155605.575367-1-quic_vikramsa@quicinc.com/
  Driver: https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/

Sanity check for these patches:
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sa8775p-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
  DT_SCHEMA_FILES=media/qcom,sa8775p-camss.yaml dt_binding_check
- checkpatch.pl
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- make -j32 W=1

We have tested this on qcs9100-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

A rebased version of the TPG driver, built on top of this series, will be
shared as v3 in a follow-up post.

Vikram Sharma (9):
  media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
  media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
  media: dt-bindings: Add qcom,sa8775p-camss compatible
  media: qcom: camss: Add sa8775p compatible
  media: qcom: camss: Add support for CSIPHY 690
  media: qcom: camss: Add support for CSID for sa8775p
  media: qcom: camss: Add support for VFE 690
  media: qcom: camss: Enumerate resources for SA8775P
  arm64: dts: qcom: sa8775p: Add support for camss

 .../bindings/media/qcom,sa8775p-camss.yaml    | 361 +++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 185 ++++++++
 drivers/media/platform/qcom/camss/Makefile    |   4 +-
 .../{camss-csid-780.c => camss-csid-gen3.c}   |  33 +-
 .../{camss-csid-780.h => camss-csid-gen3.h}   |   8 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  84 ++++
 .../{camss-vfe-780.c => camss-vfe-gen3.c}     |  75 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 drivers/media/platform/qcom/camss/camss.c     | 428 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 12 files changed, 1138 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (89%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (70%)

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


