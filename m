Return-Path: <linux-media+bounces-31114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19552A9E024
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97DC5A18B9
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 07:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8479C24728F;
	Sun, 27 Apr 2025 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="it74CA05"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213342459C7;
	Sun, 27 Apr 2025 07:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737362; cv=none; b=OLBIfxddtAVD5TX3Zr8rRl6CqvKNpyF2Ko03eYDbE5jRv2CF5n6tRMyD9qebkejbfiYymR4kHIzqs6WohICebCpyN4WkhJJy1pQuAnlOlwUQYQdwtqBPFnewwvv3EA4O9E2OamiROziQNNVHm2iJJ77kgkyAGyYJzGO3+NhZkEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737362; c=relaxed/simple;
	bh=47kLZPUut9WWbTSbHi4nhZs1+KsdMSLZkdH9lfl+YFg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PhVgYxiQzD3N0n/fEWIpJ6csXkJRHZDkTAZBwUQqEVP57TaTtAz83ew/h1Y/CU4VMNquiNzCxyRpJmfwD4gyUmeTgnpLwmHl6ZJJli3+/od6ghwwbnWNo2Qe/rGtpxbQxYtpCEtti2sSV/dvJ0bDHI3CYH6neKf4RBBpVv/bh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=it74CA05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM3pA012252;
	Sun, 27 Apr 2025 07:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+MAEcSEhI4YhkGLSQlz6Ty
	WqjuuATG51QHsdhzGFtUk=; b=it74CA05hGNLRsSfc259A/n1+G9swQxYOq/WwY
	zYx7iZOZulQ0iCYlKKOChZRoN/2VKcNXUwg3iZtGPVMsYPmqUyIrQkmyp0840Gsx
	leTzyDmqqx+PQyru8w0rio8AaxC4fiwB06Z6yMo0IFbAMDL+oPLOKOAjRIe7GJQB
	5/YQ6pZDsoS25PgvkFiAwIDy9UVKzaNAq+j5/s6YO0DdvQ6irvEsm3N4SSEptcBp
	PvS3bnaKRbPo+ItuuolWDR9TGGlY2aXsUwSr/USPfM+TRLEqWOdVVJzfR04JTgDk
	ELwwr0UeR5vYluMd5fR3a1uSu4y8lo2Se4Gh10ZiyGSU02KQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hk3x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R728xO008163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:08 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:02 -0700
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
Subject: [PATCH v2 RFC/WIP 0/9] Add sa8775p camss support
Date: Sun, 27 Apr 2025 12:31:26 +0530
Message-ID: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nyMFdmJsIaxmS-DB1eDskt_ZBIEyb0RN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX01OGbWF16R5m UJMsHHgf2bMrhq/BXNBjK/v/1ZNWpOkuwl22+JfJlovu/wSutKMz2RfuAP1qfhARzHQUYnuCi/m df3aO0Oj3TGPwTepOO4TrtEABWIImf8QhmXCsxC+3Pmr5GyOZN+Qp+iUS6f5fCrWdvmingJllRh
 oy4j67+nMHKy8TnjCqZUy6FbEtoRLYcLCCvrnnVeygM4SUhVSJcGDcYkI7HY8+cKrXLGyFnhLll lstbkoWqye0n1OQosb0B0l0PcR1RSXYAdaS0/fbFib5MKAwB9IOP7LK449dOnUInPFWiBMim6uU FjbjddBUYzNA+M5hhFqIMcNnqlz64fgio1IXXfjvnZK24uZdpXyUBJnhKuV/KkYwTWD9auPydMG
 JNMWqFHCT0Tpmk18t2dKymZEQ/TbgEkqwOPTuz2Qnv2rR6o8ZXFs/aZ9/or2rFmib57ZhEgw
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680dd671 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4pAsuTqdjomlMBfRpP0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nyMFdmJsIaxmS-DB1eDskt_ZBIEyb0RN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055

From: Vikram Sharma <vikramsa@qti.qualcomm.com>

Posting these changes as RFC/WIP because there is some renaming done for
existing files so that same files can be used for multiple vfe/csid
version.
 
SA8775P is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY
   
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
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32 W=1

We have tested this on qcs9100-ride board with 'Test Pattern Generator'
TPG driver support will be posted in a follow up series.

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

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (9):
  media: qcom: camss: add generic csid handling in csid gen3
  media: qcom: camss: add generic vfe handling in vfe gen3
  media: dt-bindings: Add qcom,sa8775p-camss
  arm64: dts: qcom: sa8775p: Add support for camss
  media: qcom: camss: Add sa8775p compatible
  media: qcom: camss: Add support for CSIPHY 690
  media: qcom: camss: Add support for CSID for sa8775p
  media: qcom: camss: Add support for VFE 690
  media: qcom: camss: Enumerate resources for SA8775P

 .../bindings/media/qcom,sa8775p-camss.yaml    | 352 +++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 187 +++++++
 drivers/media/platform/qcom/camss/Makefile    |   4 +-
 .../{camss-csid-780.c => camss-csid-gen3.c}   |  42 +-
 .../{camss-csid-780.h => camss-csid-gen3.h}   |   9 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  84 ++++
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../{camss-vfe-780.c => camss-vfe-gen3.c}     |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 drivers/media/platform/qcom/camss/camss.c     | 461 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 14 files changed, 1130 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (87%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (95%)

-- 
2.25.1


