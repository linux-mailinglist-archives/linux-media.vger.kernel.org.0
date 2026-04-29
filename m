Return-Path: <linux-media+bounces-59937-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G6dHiG38WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59937-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:45:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2836490A90
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DB1230309AD
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00D53A9D8E;
	Wed, 29 Apr 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pl/f9ba9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVd6vnRl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C653A758A
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448666; cv=none; b=Mgd3ZaBeshEgKa+ssIh5KFEjWlz7NJXbqSp3MuN6q8NOQv0Cnqvqs9uRNrV2tUPD9DAVTe2fk1rrlSM6DqOCuripntPICwZFpysPpRXIhaZBUcT/wQnlT8JbNkr0pdZ7SDO0WesnV7Ufi0Y9MHgw0d5r+pr111Cw4ZDu1+IeThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448666; c=relaxed/simple;
	bh=UwHsW94MB3EMtwU1y+eCL+soH5udZvcsIUOG+6S6vNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dld7X0lOqDzbt6Nb8OAieyfAZvCdB5mVnTi8Bak/+16OJXjmDPA3j0cK+FRAkl5E6ukXFDDeYuEOFFEQLPAb2Egbkc8+u9Gv5XCMtO3SyTnNyi3hS1eJLyFxvj3yXYeFpSI27KnJrdiOakzZNKyVmuUNYcjM4O8Nu8LWyS0Ldq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pl/f9ba9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVd6vnRl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T6EwCM1281907
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcKHy1kjJE1MPjOsurcv/HGRaXLNWaX7S2VQRTlyTPY=; b=Pl/f9ba9KgSK3fyL
	1I0p1MiAIVU4HZu+Ti8+TB1idLxoZsPQnE4/U3hgQi6qzsRxRNabLgutCeVks9xc
	58PkXY4WMddm7MaGLEAK3llAZwHGGhrY2sI2dT1R4SDeem81ZK9NvSPMVixgr/gj
	VlYMacGp/NieCvL+9wsmeR381n2sc1Wxg8foPyTg3gsJHZ/AyRFfcDEQs4FLjtT/
	vT8l9uSkxDyo36XJGR8qV4i4+lfdM075dyv8uldjzbPjv81ILLJY6O0Fog2AiPXb
	WsaO9RnkNrpLfJqztA22Cnqv4WnxANoa7+NISeWFm5D/3sxsnO2hjEXA7rXIgBlr
	MFreMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80by8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so369687b3a.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448661; x=1778053461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcKHy1kjJE1MPjOsurcv/HGRaXLNWaX7S2VQRTlyTPY=;
        b=HVd6vnRl6ynj+GLaNh9VifAijPvt6dNSYuqId1ca4iEvsGTZLoqU2KmtVohSIFdC0A
         zzLAvyxdAgSmZdF6GBnK8ciLZ88luilcPrBkZJ/dGo5T5bf5wEVodU/H3Cn2F+TiPik5
         O5AkwMIiuRLH9GE9QKveQo4JXxQ0P1NGsN6mqiOjzI9Xfhm8e9pnUdSIlTx0I2B2xP4Z
         4nwjGvqrpLk8cmGY8nSYGpCs9hCoMcsoTDEiYRQqL6v7M4OSANomSMNuHPHIpeHKGYnX
         mhF6TdXuE2Fgj15E0WB1xhqEBj/MTZ+EWyTT+TE36VFRhiP+e9QaB/FnLX6oR3QbHlS7
         yCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448661; x=1778053461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fcKHy1kjJE1MPjOsurcv/HGRaXLNWaX7S2VQRTlyTPY=;
        b=srwAYIQr5dLLBpIwoCWUGuwNGwsZe1J5Pv5FRceuT7YP0pSvksXcb4Vz5LKPxCEV1o
         2HMIv74MZeDIivG3sU9vddCqqxqM/sZbKfHr5Ko7BoPOSg1HLNKX6uVwM+yd5ktkEIjJ
         k7D6NgPxikB+kWS2Z7sM6D4pFW4bhKRNqxYQ+9l1pMfygkzIn2Oa57OigAXyPgcJzww5
         aaY3DMc+nOzdfeQIoZZiHYxMXOm700VK9o7lZHZdcaslgtnIMoW16ZCusErMrTHl9zWM
         t2ffzJdYbMNARt3t8d0677lBMvrSiv9VLTdEpI0N7snV0MaqnxdvZp5eDb284VeFmPPj
         mjlQ==
X-Gm-Message-State: AOJu0YyQU8powBoiW00SPMmE9XCtsNSW7PevYuuEC1n24q3zhnVp5yAr
	shdvNGqww7rhv0HLEr952Xzsw+fFFIpU9VclSErLgiLuhPMWyzWLcG6rCWbuf8HTTDN6HMB/fib
	+Fl5i6QE2yMLwIk8YvWFflhEO9K+mlIbAgD/oy3IpnQnRzkMgTJskVsZVnxLNz0KuYU9IMn0mQA
	==
X-Gm-Gg: AeBDievJ+fo1c2ySXYe5H5rCV6JpyVjp5gw+PEMn9YATCmM9Gjow4xp/Durclr0Baq/
	A+77K6vxui3PioxOX1aj3w0qjLHfrw1ORgQuq70ZSXh+d4sFfI8IXYm6Gk8zdmY4Ik9mJ5wh6XJ
	4pA1e0tA3HFw4sNcZBqjI+W2uqf2VwrftAE74+yOc78+Y9pNCPMli40h70/a9bdxaeB5p1N4NoU
	IOjGU7sYaYPtZDRTAQsInKVmymx8GprkekVoqU7h8Lz93GDSRbZO2DKKAVNhzUqZoRFtEC9tHFE
	2YYZZDTN1qW42gUIOIWY/ncuXmLVHb4+9P/yD/6sSUzmj5FnfVEwEg7ZNRuAvQ/ED/CZkwq+HDD
	9QY5QydABPPrPj9OujEx94gHyPf+19hMkAWtNVeQeQ3nfyp97hSY83EqU8hm6+0I=
X-Received: by 2002:a05:6a21:6d8e:b0:3a2:d53f:691c with SMTP id adf61e73a8af0-3a3b3963ca3mr1746733637.26.1777448661405;
        Wed, 29 Apr 2026 00:44:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8e:b0:3a2:d53f:691c with SMTP id adf61e73a8af0-3a3b3963ca3mr1746703637.26.1777448660853;
        Wed, 29 Apr 2026 00:44:20 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:20 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:54 +0800
Subject: [PATCH v5 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-3-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=7777;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=UwHsW94MB3EMtwU1y+eCL+soH5udZvcsIUOG+6S6vNo=;
 b=+i7ZoIYzFst2QcKUcezlcEq6DAWuQBIis9Gohf8bzCBVJgyvk9EBSgaUTBjXcpu9huVAqdQXG
 D8GfNd9PvHPAKdt2619rf4nznZ9hYEBN4NNU6jzJrUd9W1Jw1+6Wn7F
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: j-xyMUm6_yhFGamW-6xXVRFiYJ0WHs23
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1b6d6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jfxm0zpEqxNMAX7I8EwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: j-xyMUm6_yhFGamW-6xXVRFiYJ0WHs23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX2YTaQDJzCKax
 BOojMQaM3QNDdlnXwv1Cioz3y0JgpHg1FCD9Cb2z/HxXV16FgniwVJM+AFolpp3cGp4+cUA/W9c
 A0xLYGda/0GW+m6hnWhGP3UlIEn3CgdxbaxbmOqXB6dOnEBiy6/iwnW5NfDH0BJa/7ZAJ5bswx0
 vCvkZx5VqZEkJT1abOyL1bh3pPa0KszNZwM5JmWnlTtLQVBQU6RcdQ/rMEX3BKNkYZR9TESKpdl
 uUOBXzBekdSS6Sq1OWBfBa0d5P5JS90AbMEFpG1U4bLOkTUu4UH2rwqaDMaAtBmR/pUBSroaDRA
 S00tApbfiZvJxdnqXBls8VYqwS3u8fh+PhOCatOyvNfhJrc33rd0vQddmnylfNms8VEnoLWoJPv
 S5De67Tn30EnkzQ3cveCtOpKkcpD701lJqWr9FhTy9hHUXjEfRSklS8GC5ewz2gr2IJbmvbNk4I
 WT1mBkrVvcautxQPsSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290075
X-Rspamd-Queue-Id: F2836490A90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-59937-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 124 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..e8b1b92a6329266d22b06e84c47c477d1a9d742e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_platform_data x1p42100_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0


