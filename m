Return-Path: <linux-media+bounces-25993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46552A3080B
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A623C3A589E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F5D1F4168;
	Tue, 11 Feb 2025 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YQ5C6aY9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D971F3D59;
	Tue, 11 Feb 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268544; cv=none; b=rSE1aQxbgT5IfNFm1oWJZdXX8lbUIVsDnD/CtyzxtamIa/9A0yo6F8rj9Wk57CWCWpBUUEcCW6DuKu2m4pJdqL1wGkvWQ+ClY620luCq45o5h0ELViNTorR1j3CoCvHy0g7uou4HFMs1Qhby5nibHQmyQ1JLqOC7aPl6KkdZ7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268544; c=relaxed/simple;
	bh=4GhogfJyxTMcWfTFNE11+2+p6ZVGHGeYzW6c0T32U9U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qhqVWzdQqy06+AytAhi1f1WbdH6TJlwJPuS1XpRoujHHEbr6zlToHyrFfwOxOos8F7y+G2+26xZvA1vGhyiS46sexMoYI5LU2uVcNOhClb2S/hSzCluO6AzIXJJXbE7O+xRHW51b2UG4IGFXQIrbUxXflsgxtl+9ZxvbEjvn2tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YQ5C6aY9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7b7kp009207;
	Tue, 11 Feb 2025 10:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hdshuFqOFUXi3wHeKDYiQ/
	aPfLKGPmYadYWRB5qYbhs=; b=YQ5C6aY9Qi0SNr/puA5xocXPTP0JTo7LOozdZ4
	74/5GzHnhcrrZB2M3uzFYXVX4dHArOXNdySvJ5UMw0ywDg6RKkl+fzpB4dePZV+W
	QkpWdrY+MsAmzoPJeFvnwpERcq0a2Ifp90eZBE0GS0Sf2SoMLZ1+Zmv6NA/Ct7XF
	e2C8fln8k8EL1gW5TzPYKQ7/OJEvYJ9EHxxomlkkIo1LLvEx0ya35YXy1AP87mkq
	TqSeE18FTabsx+i03NhoK+5ZRTLekordOAeVgY4osXfyhkVByDkkZk4UHPFm78Rc
	kRpXIFwhM510ush/jRRG79zlktpyElALrTb6q/aRECaiVapg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh3jj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:08:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BA8uaa026458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:08:56 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 02:08:53 -0800
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
Date: Tue, 11 Feb 2025 18:07:55 +0800
Message-ID: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIIhq2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ND3eJEC3Nz04L4koJ0XfOUVCMj80QLo9QkEyWgjoKi1LTMCrBp0bG
 1tQCOe+GxXQAAAA==
X-Change-ID: 20250211-sa8775p_tpg-7de227a82eb4
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739268529; l=1998;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=4GhogfJyxTMcWfTFNE11+2+p6ZVGHGeYzW6c0T32U9U=;
 b=FUYl9C/g5BMwkk6wuqz4SpiuppKNnufJP4kKgFIXY4pYbu1xeipjkGF8u7O45pjlE2+b5QgYO
 +1K/yAGNi6DC+k6xCFWmL+Vx0hM1p3ZKtTGc32eFlwyF+y9eHCvngCQ
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JJK_FL44CSuHVQix0m0-WWoOlcX7MmhU
X-Proofpoint-GUID: JJK_FL44CSuHVQix0m0-WWoOlcX7MmhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=801 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110063

SA8775P is a Qualcomm SoC. This series adds driver changes to
bring up the TPG interfaces in SA8775P.

We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Used following tools for the sanity check of these changes.

- make -j32 W=1
- ./scripts/checkpatch.pl

---
This patch series depends on patch series:
https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/
---

---
Wenmeng Liu (3):
      media: qcom: camss: Add support for TPG common
      media: qcom: camss: Add link support for TPG common
      media: qcom: camss: tpg: Add TPG support for SA8775P

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 drivers/media/platform/qcom/camss/camss-csid-690.c |  15 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 737 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
 drivers/media/platform/qcom/camss/camss.c          | 113 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 8 files changed, 1282 insertions(+), 9 deletions(-)
---
base-commit: c1696380f08cf7cc68560a11f2e8c51cb24aa7ba
change-id: 20250211-sa8775p_tpg-7de227a82eb4

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


