Return-Path: <linux-media+bounces-25043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7CA17D8B
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 13:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B86933A864E
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4361F2371;
	Tue, 21 Jan 2025 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jYWBEdns"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E91BEF70;
	Tue, 21 Jan 2025 12:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737461383; cv=none; b=WXMa6ajH7YLAefYW+fSpLtLeSs96VEp/T+l1LebO/p5T+oMJmkWP9yOWn3yHvYSsPVhgVWn792JNvYkh/83BSj/qEOQp5AjcMoRdtEdBzqZd92JdaRfeXIMDaCDIW6Tdp+kWbHr2d8mCnQb8+ZcVEG6Aa+za1G3T29V8m1d6V/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737461383; c=relaxed/simple;
	bh=m49ShRPBxss7htGJ+rrxLv215Sp1PVh5qMIqzM38WDw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cxqRXvHnHp+SaJ9//VKWvJIGspErzXw6a8lFWm60saHNeHitJHmH8iGs/4UzcPugrnhtKYsWGklPot8dIFWeep4vTv2XhLd/m5En7IpM5BQJF/myXMCDeQJtN90CTYcr5Ze31EQAo47/XxCwolMxEuGE1gOHF7E2cn88puF3GB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jYWBEdns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L8YsKd018009;
	Tue, 21 Jan 2025 12:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A2rjxWclf+WPEXBHSO1PTi
	J94UtgJfvYGJjqmycRMCQ=; b=jYWBEdns2p3qGhvX5rFqZFbUxDuXamJ7lM5F4i
	m+51ZCgqkUMlBORRJh1WmynbtwvzfioobXu3tuG6EmUCUzV8MQQJVEyoMcrOKxCH
	n7gy6lzp7c3YgTqCV98AsUVy9N7IsgjqfwpgJS8TVAyz0URkE8gzp4hDvRZiepKt
	48lMT/cMnFuNxQq5BxLoLpBtsRRpa+3h1gs5ZjJeHiWbHNENa2rqVBQxlyEw3yG6
	USW9Wng3FXTiIHQPX0JE2bTHbUWq5WDSus85QjHV4ohcArRL0eBTS5d22aNkJ7HH
	tdSpRR2b6IvSK43/9h7b0ENqdvgSpSwKH58LXdGmaUgRHBDQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a85r8sed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50LC9Pwd015782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 12:09:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 Jan 2025 04:09:16 -0800
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
Subject: [PATCH v1 0/2] Update clocks for sc7280-camss 
Date: Tue, 21 Jan 2025 17:38:59 +0530
Message-ID: <20250121120901.1841142-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: iLj2eIVwCmQD8f6xHerIgWtpfvpRjaOq
X-Proofpoint-ORIG-GUID: iLj2eIVwCmQD8f6xHerIgWtpfvpRjaOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=889
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210100

This one is a follow-up change for series.
https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
We have got comments on our dtsi change to update clock names as
- GCC_CAMERA_AHB_CLK is always enabled clock so it can be removed.
- Change clock name from gcc_cam_hf_axi to `gcc_axi_hf` for consistency.
- Add gcc_axi_sf as missing to enable it can have undefined hw behaviour.

So to handle these comments in our base series we need to update
documentaion and driver (already merged) to work with dtsi.

We are not breaking ABI here because the ABI hasn't been cemented yet as the dtsi changes are
not merged yet also there are no users for this driver as of now. 

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: dt-bindings: update clocks for sc7280-camss
  media: qcom: camss: update clock names for sc7280

 .../bindings/media/qcom,sc7280-camss.yaml         | 10 +++++-----
 drivers/media/platform/qcom/camss/camss.c         | 15 ++++++++++-----
 2 files changed, 15 insertions(+), 10 deletions(-)

-- 
2.25.1


