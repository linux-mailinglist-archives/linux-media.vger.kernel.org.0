Return-Path: <linux-media+bounces-40755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE70B3171B
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D29623F99
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 12:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577522FAC1C;
	Fri, 22 Aug 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lSCjDdr5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B892FABFD;
	Fri, 22 Aug 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864598; cv=none; b=flr3aRDuTPwi2IPB/l+WCOgL0gIvOCQSTGsNJcVTw/DZ4e+UT1DgwVxtdcapoqHv4lG8K0l5dcADeBem0jC4jc/xQSMYJFa8qPNygHYTOEwRz0nvczD1tofPCHhlH0LWYupvTEPJl+PM11SBE+eTYfPirN5BxBPHYSLRTRf89oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864598; c=relaxed/simple;
	bh=xYxKUqOPi9uHsSz9T2SIay1cubV4WKGr+q+8n/POPLQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=X26XYe/aQruFPmzNu/4B2XVz8c1lbKT9PTEDHuc0S/8hNcMgoLhIfmOQBBXRFpnL0Wk9Z+dzAjhNGcq36ay9AqQVbKG6RJOYVwypx8SfghG2H4eoafY2irsfggNkG4tB81IL1Hx2mz3PrQM+gxGN9o0+zi6QIyLC7BV1EcLHoBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lSCjDdr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UUQA024258;
	Fri, 22 Aug 2025 12:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EYn7ITBL8Ul4UiFt5Y/PML
	ay6Su4Sfb9WTuXzDCSrAY=; b=lSCjDdr5vxvNLn+mtnUy/zgxzJlpWjVGcbXXBH
	pgOdptzLjHAsIkZ/TwCyo2eUIShOvhDx8IU5jOmD5P+Zi0T6qsJfuJjqWFhRmcR7
	D176eeJzZuqA0vUPpwTU2r9tkAJE3epe66gQc/QtRNxRddZrkUcXbEETfQgLB9jB
	qNT+cBUXfAeq4I4D3MNZYMA2NvD0IWvXcP6ENNY6MjM0wfSj6WnGLPuJCCg5GSc6
	VeCMVfiwJ3BQZM6q/31eAEBHFrdObfAdBVfFRFgN7ZyBTEpg5mobnpS4/8nBG5Wg
	m0yXVHw85aW1Ueic3mPDmciRRl4RNjNrGGljCFuspmEtwHVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah6kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:09:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MC9qa2025894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 12:09:52 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 22 Aug 2025 05:09:49 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v3 0/3] media: qcom: camss: Add sa8775p camss TPG support
Date: Fri, 22 Aug 2025 20:09:18 +0800
Message-ID: <20250822-camss_tpg-v3-0-c7833a5f10d0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBdqGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyMj3eTE3OLi+JKCdF1zQ4uUJDNzixRLCxMloPqCotS0zAqwWdGxtbU
 A28jfr1sAAAA=
X-Change-ID: 20250822-camss_tpg-718db678d984
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755864588; l=2633;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=xYxKUqOPi9uHsSz9T2SIay1cubV4WKGr+q+8n/POPLQ=;
 b=fKkoKexAJ3Zg7UKJuEJ9TCHwX4BjJyBYHQJIzbgmGu/f/V88IqbvxIRAKVHE2mMngC6cJHm4S
 UZLVkCjX26ABKgVtR8PtsXUmKtV/+NxXPlxk1DddYT9U+FoWLQrXNwO
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eqtFM2slnpL9KO_ZG1cixRx6JhctIutD
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a85e11 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=2kMP3QB-8nRYnlZXCZMA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: eqtFM2slnpL9KO_ZG1cixRx6JhctIutD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0XkMUGegANj7
 DQGFdspYrfX3U7DlcRWUU6+gHhfoHp0HTkg/Rp6uGMWQ3sUAhCs6X/6TE6TX2mZfaEMhbnIigm9
 i4hcyJEbH/OPNa6X3gcvDgx1jKzUX2iglIqxKya9IO5knUJFK34NGCjtICZ+9TuFkXZEzORvuTW
 v4nmTExLerNyKdBLHFx+FPVjoCsJ6gnErYPPIvMfKyDRLYKFmjmol4/jFWeiKZoQo/r9N9rIYEK
 Q7wOqmeqWICS+t2aZvE4LHZwzdlixqp5KmjFGAcxWAA0LZX1MApibdTsQTe2I6Eo8zRarwR2cL6
 ekdS19YNp3otplXuSOQk6YEWsf0jZmtxqZbhZqCqtfmszsfFLaJgrwhlcNHZv3O/E1K94btj5PY
 jbw2UJTDCtC9Xz5V8akAlBUcYI5mMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

SA8775P is a Qualcomm SoC. This series adds driver changes to
bring up the TPG interfaces in SA8775P.

We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.

Tested with following commands:
- media-ctl --reset
- media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
- media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- v4l2-ctl -d /dev/v4l-subdev4 -c test_pattern=9
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
  --capture=7

Dependencies:
https://lore.kernel.org/all/20250814101615.1102795-10-quic_vikramsa@quicinc.com/
https://lore.kernel.org/all/20250813053724.232494-1-quic_vikramsa@quicinc.com/

changes in v3:
- Change the payload mode string
- Change the method for setting the TPG clock rate
- Remove the TPG IRQ
- Format correction
- Remove unused variables
- Merge functions and eliminate redundancy
- Modify the register write method
- Change TPG matching method to use grp_id
- Encapsulate magic numbers as macros
- Link to v2: https://lore.kernel.org/all/20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com/

Changes in v2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to v1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

---
Wenmeng Liu (3):
      media: qcom: camss: Add support for TPG common
      media: qcom: camss: Add link support for TPG common
      media: qcom: camss: tpg: Add TPG support for SA8775P and QCS8300

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  43 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   2 +
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 219 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 696 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 125 ++++
 drivers/media/platform/qcom/camss/camss.c          | 130 ++++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 10 files changed, 1226 insertions(+), 14 deletions(-)
---
base-commit: 6afac82056e38e02266cd30f458b25a1f9017508
change-id: 20250822-camss_tpg-718db678d984

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


