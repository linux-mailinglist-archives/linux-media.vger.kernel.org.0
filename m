Return-Path: <linux-media+bounces-37928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D41B08352
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 05:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5ACD97ACFBF
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 03:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D15C1F130B;
	Thu, 17 Jul 2025 03:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fsMJ+R9Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A4D7E9;
	Thu, 17 Jul 2025 03:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752722435; cv=none; b=H3XmrVXi2XNFSPyrNY0Tc0VB/PdItObJa2IakUqJK81m8l2t6YbB0/AFWEYRARgz1+UBH1BWXPieOSkLT70nbcYEH7pCxYrJZRz8OeYVT0JbJSsUeEJKivtxOpexZXTYCuN7/jCvd+gjhHfxudwuXnITq/zcA6IRjgMxhYG/yY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752722435; c=relaxed/simple;
	bh=tWTrXoTktxJL/EJGF59FXWRjFlNzsiAA1gxvM1E19do=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=GpGtjAkYr+TM670xGw/eLntox1LokuFNsQEi/rJdXDP1REUGY+Usw6fYO+hzGxI8B4+EQUjofSLdZyED3THlvDcli+W/6gi7PAVBOyxMQBcWqgO1/yzUrP5KOYG13ZbVeCG3iLS3F13LkuGsmRZ9kO831CS7XPYLJRSj7r8LWNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fsMJ+R9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GGDdLa028159;
	Thu, 17 Jul 2025 03:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hgqWzpjuS5ZMrXwcAhuNYf
	xs34rMa+tg3p7rgYxhbYQ=; b=fsMJ+R9QYdvW4T7U4jhI8lc0dY1u9muBghDdnn
	0R91vRKu0Q7XzC4w+s+FDoOXd2K+X7qrlVF/NjyYhbYtE9ytND1JTyfl8UgmsAH8
	G0uKAixdkbiXhWC2K8MwvqrP5gY5SWCdSzfJNgMgxv+zNn4ewpB/noGGCWbI0rT+
	zlcmPLu+zEff8FgDDXHLrYo/dEk9uglaEm1BNlOZgKX60Jt4+tgOLpA8h+8+mKYk
	H/Ubd4kJwHuDAJafwInEDBN8LadduFDWN8nCNMHbOtesu6IULekxHBKj5Z82yIaZ
	mgfihkBxAraSgtgPIM4dxcm6HatioH5vJekJ3kBDVziyyBzQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5xc10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:20:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56H3KSsG029809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 03:20:28 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 20:20:26 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH v2 0/3] media: qcom: camss: Add sa8775p camss TPG support
Date: Thu, 17 Jul 2025 11:20:04 +0800
Message-ID: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVreGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDc0Nz3ZzU3MS84viSgnRdC4NU80RLC4skS4NUJaCGgqLUtMwKsGHRsbW
 1ACLG0+1cAAAA
X-Change-ID: 20250717-lemans_tpg-80e7a988b90e
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752722425; l=2039;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=tWTrXoTktxJL/EJGF59FXWRjFlNzsiAA1gxvM1E19do=;
 b=qyXGbQohnb05OoIze23+OF/ghq/bDomHUy3Y8N0yootdvwMtt5Lao08sX25pn7Zkt7HiJHH42
 2dA3zLy+AxfC6vPL91yhdglLOdegrSYpha+tTeI3czl4m3id32N2H1r
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68786bfd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=A9gtz7D0Z5Qt4BOyJHAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P-lnfyV7LGN22dJOZEyCYIeulQ4n9zSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAyOCBTYWx0ZWRfX1Av2OKgcu4oS
 fuWzb36Pyv45BUaj1+/hVfShjK8Ne39kvTFYgyvx34d3tT2UVNK8h6Tb5EwgPPOhSVuIodG9zCc
 njzbeavxY81gw2eZ9qexrYqVqsD6Kdg8fwBHl+NMuLnxKXzdzIUCtwBUILkfmsvP6qOG/O3yjfx
 qI2bg35LvTgHPIprvNYWBBpbL3vN6ql4z1w4LDsml54Lz0+CGubP8DDa2AbHgaHAn9C/9h2jCxD
 WTchHG/ikdCZ4hYDrYGEjFkW1PT3kcR2U5g7LIbf/K/9CMSRwKgYKq/yPhkeSuLBYQpekhv4umB
 6+iO23sCCLNgwzB9wBEvL6uuBDQWJ0gZsl5Hss4cbCn1dtB21ojsUdR4X3ZBqnUaEso/W4NIv9t
 q/R57U2cNz3V84n9h9WwUiMnHWpUtI+KWRFZVFpcPIwDagKSXv3CTmRjZgNTmxNMiO1+fVr+
X-Proofpoint-ORIG-GUID: P-lnfyV7LGN22dJOZEyCYIeulQ4n9zSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=998 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170028

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
https://lore.kernel.org/all/20250711131134.215382-1-quic_vikramsa@quicinc.com/

Changes in v2:
- rebase tpg changes based on new versions of sa8775p and qcs8300 camss patches
- Link to v1: https://lore.kernel.org/all/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
Wenmeng Liu (3):
      media: qcom: camss: Add support for TPG common
      media: qcom: camss: Add link support for TPG common
      media: qcom: camss: tpg: Add TPG support for SA8775P

 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 +
 drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
 drivers/media/platform/qcom/camss/camss-tpg.c      | 737 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
 drivers/media/platform/qcom/camss/camss.c          | 108 +++
 drivers/media/platform/qcom/camss/camss.h          |   5 +
 8 files changed, 1279 insertions(+), 9 deletions(-)
---
base-commit: a6f70b9b51a4ebaf316f230ca3d0da305850bf64
change-id: 20250717-lemans_tpg-80e7a988b90e

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


