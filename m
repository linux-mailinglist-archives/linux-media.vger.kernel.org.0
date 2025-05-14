Return-Path: <linux-media+bounces-32489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B732DAB6CE3
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EDB816D0F4
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF8727A914;
	Wed, 14 May 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SdonRetj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743B15AF6;
	Wed, 14 May 2025 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229923; cv=none; b=HCDerG6p1ngLMYhyfaQm2iXKbkL6EM3Ka9da2QHgJeoHQ9I72U4NBG4VOdLU4cyuzzBjixEkXgH3R3iOJgtrnGPaQ1lnKt7hHqIEXT2ujV4ZDaIBkn0yEwsgkJkAy491upTrWSlGzm8cgDDU9eotVp5bNs0n4gSxlnMVv4mlf/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229923; c=relaxed/simple;
	bh=rQV1LRho3W9UPH10mFSVXht2oG/IEcTcNPFneetDyXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=I3D5Cuh9iZh+9CJnKmsGrioAP5Kvef7xYbTLeT6NhtNGTnO/jOTVgixQ792v8zmjeizuTYdhEztVH2i4QIbT0Po7PQcC13YHFiATcP+A8dRP2jPaNY+8sT9fFr3/UhSrnDsnQOxzIoruNIuHDBFoaLojkFxoyey24/8bwoTj4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SdonRetj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuuTF030324;
	Wed, 14 May 2025 13:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNr3hkYR8KkmUIC+5EGw5/k8xNscagRgVm8MrbY61Sc=; b=SdonRetjJtlsH5Pf
	9J9Z9CtQx+/pJtlLWlgws5eIAfwWH+ZRX1Pi0j/vRZ8NLm19Iw3vmPvCpJXuhcVY
	om4vur0vIpoz2zRjiXW6Guo1WD/WLw7pBSVhHjfQnc1e3BHRTDelPo+7iAz2b+f4
	HiFprhgxesUp7Etf2PxvHUQQG+6CNNa3PMvswISRCpxPOxUsxX73A1fj44gV2XCZ
	CR5ELgTS10QV50/i3Wm2wQMQZuea9+cWM/50Pfm+wuJyZX+zCGQw+pmfuNQtcye7
	s2dAMCMjDX6C61hkedpF5hj+T4wyPy+64EZ77B07kjB/c7gpxK388wKnjZUdianZ
	00tGjg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcntu19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EDcY0r013700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:34 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 06:38:31 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 14 May 2025 19:08:08 +0530
Subject: [PATCH v3 1/2] media: venus: fix TOCTOU vulnerability when reading
 packets from shared memory
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250514-venus-fixes-v3-1-32298566011f@quicinc.com>
References: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
In-Reply-To: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747229908; l=1953;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=eyMkxROlSnO6cLmAsO+i/Ii2GzVRLRVurTDMNWWJ5Bk=;
 b=qXDtL9R4EJUjvcMJnPKBPd6dNJJHoB8nWz8xFVxsbbvpHh7cu0jt+zmNIIoz8rqRVGuEUTQBD
 W3KZkwdUYQOAdhIbP7lIYYBOLPtTkIFaI/ptDesQZP5yj9ylFVLEwOF
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W3MGBfQDJxr25wT5L0d7niizC-RQ3N7a
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68249cdb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=nGPZ3LvywAaDmkd3rgcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMSBTYWx0ZWRfX6pG8s9NmHTdW
 JvCz1cCXdcWDGjbnxuagjOLhBuIaRGCBTsla3YPMeAUUrULjZ1HhU4kzi9tkckRkdAwS+iC65J/
 yzFRC2yTH/TKhnXh8UtcrA/hSMg1aiSOyAP7cZHZkukfPxCT96evyQjRP7DQzpCVFIpgmf4CzTD
 l0/lFaMdEh4G8OgBCoWQo8i3MUdMOrTqbsZoqWBlGC1VkygJvSO7En/xmnEiGcMoxyaIMCwyrlY
 wcVJT0y1j9MK73w/A53L9+HwFtvfzk+AbpaGyG1pmDu2FYFdpys6rZN2La1uxo0w9Am7M79Sn1Y
 GybPO+M9HTXEOCHnEmeJrqpusjQQ9Tydt1DFGf65+yx5A/Ep7kpQSUzQeU5f07ZjvxhTUgqyR6m
 d9EmnNrybNDC+sHQwgufJCTzwXGiXoZ8MoSdrBabNiqpG1+Xx2KJItCLMbcG8fvnbMu8YwTs
X-Proofpoint-GUID: W3MGBfQDJxr25wT5L0d7niizC-RQ3N7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140121

From: Vedang Nagar <quic_vnagar@quicinc.com>

Currently, Time-Of-Check to Time-Of-Use (TOCTOU) issue happens when
handling packets from firmware via shared memory.

The problematic code pattern:

u32 dwords = *rd_ptr >> 2;
if (!dwords || (dwords << 2) >  IFACEQ_VAR_HUGE_PKT_SIZE))
   return -EINVAL;

memcpy(pkt, rd_ptr, dwords << 2);

Here, *rd_ptr is used to determine the size of the packet and is
validated. However, since rd_ptr points to firmware-controlled memory,
the firmware could change the contents (e.g., embedded header fields
like pkt->hdr.size) after the size was validated but before or during
the memcpy() call.

This opens up a race window where a malicious or buggy firmware could
inject inconsistent or malicious data, potentially leading to
information leaks, driver crashes, or undefined behavior.

Fix this by rechecking the packet size field from shared memory
immediately before the memcpy() to ensure it has not beenn altered.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..163c8d16530bc44a84b2b21076e6189d476fe360 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -295,6 +295,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 	new_rd_idx = rd_idx + dwords;
 	if (((dwords << 2) <= IFACEQ_VAR_HUGE_PKT_SIZE) && rd_idx <= qsize) {
 		if (new_rd_idx < qsize) {
+			if ((*rd_ptr >> 2) != dwords)
+				return -EINVAL;
+
 			memcpy(pkt, rd_ptr, dwords << 2);
 		} else {
 			size_t len;

-- 
2.34.1


