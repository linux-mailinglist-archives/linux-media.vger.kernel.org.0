Return-Path: <linux-media+bounces-44580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F49BDE9DC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 865F1421F3D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49943233EE;
	Wed, 15 Oct 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SsrQGATJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E1128816;
	Wed, 15 Oct 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533331; cv=none; b=jqtEsXo+cBLiOelRWSogYOlSZNipHAgOxoulxWDwthCzL5eIdZtdpjGs0v3HET9tXbGXKP5z4EBmbBw/U7r37PM+HLPDXLI/+ZwPzpSdiinqcLWXzSrLPZZCFe2Aaadm1LKJlpAKXjGWe1XI6HVqiw+GgmEG82CMvnyZOc8U67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533331; c=relaxed/simple;
	bh=pCuXk9UCuLUpzLZPechBf38fCqrC0RwejQlK4GvLL6U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LSYFl+AX0fJs0shvnKxOfbWIasRMqPUzr4Eu7G04xcj6glfrRvwk417dTuCOGzekA195BOalfIm/LE2sY/JEGc9r6ddFKMSdCXmX3vwo+7U1INg3/gbdJlHU4RKu5z77047uycZfFH58zRT+mYGssXuVnBmJJGlWIyQ2aHckp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SsrQGATJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAvebn010182;
	Wed, 15 Oct 2025 13:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cd+OTR7iLD5gSA426bO2fd
	bm4l33t3cFuwRWUrbvZV4=; b=SsrQGATJ7dZY7Z8GG2QRchnqwC/Z9K3F/jj512
	4Gr6o9oaxT41leWo+MjHTdBPEPyKKC8DdUdRHPJhUI+7t+aifIGVViQRSdq4e2n7
	z0M17nGJ9O+AWh0QIQCnjn+VoCgfscnTIsih0U9qNztXianq163Y12YPGcD6WEh0
	KvF+11Eo8ba0AdiNjar5kakkCuDJQ1/5XswUz9sDKGpYBhh240anl8MygcJVvIJN
	HascBw7IRiOq/L/C1VFkwC4F415KA7tyKDLWWECGddrO5Fbu+jLa3ON9IBfMPpSU
	vFMOrlh9yQBmLdun79apcNnu7jUz2/vjLrG89n8ApoBkNUkQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c4cve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FD1qPK017031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:52 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:01:47 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] qcom: qcs8300: Add qcs8300 camss support
Date: Wed, 15 Oct 2025 18:31:28 +0530
Message-ID: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: U_E8y-gDgUuYccvmX5anEuoQQ-U6IAYd
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef9b41 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0I1b_zmpnLY7N7-knUEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX44C7kJSzdCHx
 oW95i0+O+ZANfxRHLSvCmZE5Phwl0Whxo2k4u2mYD5TJ7ohUu9SsvRHEDNAhPEck8KfLtTM3bjn
 NlpfZggbLTlxnx6Ec+vKE79Y0a+0EOCfYuuamCByT0O69x6mh7qYTCu8uIX83OEafm1RFrxU7VR
 PzGtz0RCMBdqIuVWfS/e4/lpwzML48w6UEBk5k8RdDz98B+H4i8Swal7gVBbsUhq/G129bfgWpi
 y3bSLpEwHBIOgQuWk2zXizw0Q+7Dxo7jqL//f6rZYhErVQf4xCK8wHwZiPr29PsNlyzwCfIwdbX
 qN+DZJyI45mwbfvw6KtcZpJIzidXzNo4tQhqoJcrw==
X-Proofpoint-ORIG-GUID: U_E8y-gDgUuYccvmX5anEuoQQ-U6IAYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510110022

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

Changes in v3 compared to v3:
- Added supplies in bindings to enable camera sensor.
  This change was earlier added as V3.1 of Binidings which was 
  reviewed by Krzysztof and Bryan. Link to this discussion:
  https://lore.kernel.org/all/20250910104915.1444669-1-quic_vikramsa@quicinc.com/
- Droped the zero-prefix from the size field un DT patch - Konrad
- Link to v3:
  https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com/

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

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250925-camss_tpg-v4-0-d2eb099902c8@oss.qualcomm.com/

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  dt_binding_check
- make -j32 W=1
- checkpatch.pl

Vikram Sharma (2):
  dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    |  13 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 ++++++++++++++++++
 2 files changed, 184 insertions(+)

-- 
2.25.1


