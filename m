Return-Path: <linux-media+bounces-25935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC9EA2F37D
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7F81885A56
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 16:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB01B85FD;
	Mon, 10 Feb 2025 16:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UijfnECh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1881E2580F3
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204948; cv=none; b=jNgeIJzi93PVo0wHzKCh+MdDNNnsKSVFGB3tmH9kQPG3PJ52F5r3Cw6Sh0YvAU4uahLycYe78otv6wm0i+ZP6x0M7xUEBvFngwzegoKdO+w+tzoIA1XRedyXneVm4or7SyQMm4GrTCPz5a0UpQb12JNT7PNPZs+BpFMEmnkcQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204948; c=relaxed/simple;
	bh=RdLs6lpQLnmmqeTAqLLNjcbHev3o36cD3x7sgqv0vR0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFlP6MM+4drvFaCaV/5y5mc6GfscSdUKu/OrD1uzTlLGzKcNY+sMpFPguLZUsqbXSeuKVTAPRtduOjMv0yOptGxMiXF9rzUrZAXSy691zoUeCvVcj4ElDZKMAEOIRTWm8nyfoAjVg+9OEYPzXPZ2lYgVnD4ij/zcqKbqkKZxlwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UijfnECh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9bdxL006420;
	Mon, 10 Feb 2025 16:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jhXer1RtAGcMPW8XJ1/4tw
	V0oaLKSpLBbgV+kLTrmgc=; b=UijfnEChh+gXE9VIQvVLl/JIWZ03ZzqMCj9kxm
	CBPCpQaq6s5hKw9mMXhWHaO8Y3XnnwfSiRfMYTeEi+R6On0dR746R+7gsFOvBUzy
	yrr4c4KjCbGRCPwRuYPaiHZlD+ybvQUAr8KMDZAptBRzarKGfWDOu3DGTJPHm9mh
	CK2v3YQ6tjHpk8XoRz1yk+0xVDAQjtkQ95VjN/TkwA3wCV4zB5xrqgChf3HmmYoN
	eQpe/UyaEIu3OMnAkct92EwG1gl4aGmMkW2AKinbp9itK2kTUP8scV7fnXJl1V/R
	dRP42zbymiGywd1qlM96H/TRfbLaa/xNOlYXG2JUyEHUmOeQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0escycc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:29:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AGT1VU013875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:29:01 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 08:28:59 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>
Subject: [PATCH v1 0/4] media: qcom: camss: Add sa8775p camss support
Date: Mon, 10 Feb 2025 21:58:39 +0530
Message-ID: <20250210162843.609337-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: bgWNV-HMj0FXvLK50Rc1zfipwcn8ulws
X-Proofpoint-ORIG-GUID: bgWNV-HMj0FXvLK50Rc1zfipwcn8ulws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100135

SA8775P is a Qualcomm SoC. This series adds driver changes to bring up
CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY

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

Used following tools for the sanity check of these changes.

- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (4):
  media: qcom: camss: Add sa8775p compatible
  media: qcom: camss: Add support for CSIPHY 690
  media: qcom: camss: Add support for CSID 690
  media: qcom: camss: Add support for VFE 690

 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-690.c      | 353 ++++++++++++++
 .../platform/qcom/camss/camss-csid-690.h      |  27 ++
 .../media/platform/qcom/camss/camss-csid.h    |   1 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  85 ++++
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../media/platform/qcom/camss/camss-vfe-690.c | 163 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 431 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 12 files changed, 1074 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-690.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-690.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-690.c

-- 
2.25.1


