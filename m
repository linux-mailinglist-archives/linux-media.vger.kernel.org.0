Return-Path: <linux-media+bounces-25068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05256A184CB
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 19:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03A637A615C
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 18:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82E01F76AE;
	Tue, 21 Jan 2025 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n39phQWz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DB01F5439;
	Tue, 21 Jan 2025 18:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737482917; cv=none; b=ZJCZ0yL2Qn6jAKWNpAVSnoK9qSrTa3kUI0Np1lauP7YaRCsETsD9B7Vk5TgIjtSQMoQuaR0yibRrIbHvHHWZw8+9fTYdIGLE7qEpBPjqi95qXYTqT5s1i2M7oCE+IS67Cj3Vn79hJ9a/fuF1Y/4krSS745o8hn4UuEgTFa14h6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737482917; c=relaxed/simple;
	bh=GvQ80gPNfFPgDmMSMVObIsVLL7jW5m79h2mybf7vbkA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C91Q9n82R9C2QBeYBs19XasBFSYoNIJXBgAVAOMx1UrkiptmZFzPEf7a4i2Yv+pEHjurymrOqDqPpS5A/EoUoz69fzjgqMj/re9vzWNi9bY9k8uMkotxJ7XoCJkeRK2YuGif2KOgbR/VleXPACGCyxgAOjQRTZGGrlU+rTs6muc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n39phQWz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LH3fwV001671;
	Tue, 21 Jan 2025 18:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=knco0MIQTXRNrrudeSCOiW
	yXlInlVY2HacStlFZpdsc=; b=n39phQWzrzIIytWzy1tcBvfSBLnIqCwM0mJ+pi
	j71THLbZQ6rFMowl8HLm0KNROv+80ZmtWx2ogU+JLAUXLCCxOdfNGc0iVXBX+Na2
	+4BU4BscVvBAXzVohn9zHWfHLfjM8XJRorL7/nisQhzDGfg0o6PH+5zQDUadrHyU
	YkZnM7qGsMNLVgYKWGrqzI0el8NUFpBBPC40+t83v0o/frH5H146AAWuDjODfKFl
	ONL6CySXlNknDdXpZ7qC+jTBLjq4hCDLvNH1TMXtMz1pb6uZT7vvW/z1t9pvi5ub
	JZp/zA2XIQA2Tj11xAJC5NgWt22MauVhjqOk4sVkN0eNiDXw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a866su5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LI8BJf010435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 18:08:11 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 10:08:02 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v2 0/2] Update clocks for sc7280-camss 
Date: Tue, 21 Jan 2025 23:37:44 +0530
Message-ID: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: WuO4tfAZ3JTy-77qyFmNea2H5a_OkedA
X-Proofpoint-ORIG-GUID: WuO4tfAZ3JTy-77qyFmNea2H5a_OkedA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210145

Update clock names as follow-up change for series.
https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
We have got comments on our dtsi change to update clock names as
- GCC_CAMERA_AHB_CLK is always enabled clock so it can be removed.
- Change clock name from gcc_cam_hf_axi to `gcc_axi_hf` for consistency.
- Add gcc_axi_sf as missing to enable it can have undefined hw behaviour.

To handle these comments in our base series we need to update
documentaion and driver (already merged) to work with dtsi.

We are not breaking ABI here because the ABI hasn't been cemented yet as the dtsi
changes are not merged yet also there are no users for this driver as of now. 

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl

Changes in V2:
- Updated commit text to explain the reason behind this change.
- Updated commit text to use imperative mood.
- Updated commit text to utilize 75 character limit properly.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250121120901.1841142-1-quic_vikramsa@quicinc.com/

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: dt-bindings: update clocks for sc7280-camss
  media: qcom: camss: update clock names for sc7280

 .../bindings/media/qcom,sc7280-camss.yaml         | 10 +++++-----
 drivers/media/platform/qcom/camss/camss.c         | 15 ++++++++++-----
 2 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.25.1


