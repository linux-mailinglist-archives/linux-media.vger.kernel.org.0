Return-Path: <linux-media+bounces-54649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JrxCh2FqWkd9gAAu9opvQ
	(envelope-from <linux-media+bounces-54649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:29:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F04212989
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A77B30148A6
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997DA3A255E;
	Thu,  5 Mar 2026 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nen8fdgN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpGvxyPh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401023A4511
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717333; cv=none; b=uTAK32iYjJqiOHCRBqjJdI29igiCmcO0ziSvAiz4/KZsmSRGeliG4YkxNOkYtXzwyPr2jdk08F9t4DiqZIxdHzYsyNYNWoSyQal/X8He2++n95TU1CbJr0ShGEUIngRISjbx393pL50Hoxun9zEALt9S7OHsgQcpnVZRpQTesro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717333; c=relaxed/simple;
	bh=l15mSyjuck4U9FDRKOGPmVbWICnvQJSekqWWPer8y/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J6MEnYKVOnBHoQjtagTRSyaQfp9euaz0hwQhAdvfG/0SVPvrvT1Uv/rTYmFngOm0Euss1LeMUOZ7ixJMA1nCN5vPfN7lhec8I0FZWzXSUh+bR5u2UVAVO3htLpX4xaWwJI+lXqsLJEYPEqWSHUwx5rby9LRtG418ydb9XVTEsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nen8fdgN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpGvxyPh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFn8F1783563
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 13:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BQeIcd/nOZ7ZX1VNZs/yyO
	p0K92hK4/8vWea26Lu1JM=; b=Nen8fdgNESsiOUQyVLcz3OVIbih3z75sEgReVI
	lD5Vbuy0tzGFgHPLXvB6BgmN6e7bQ+63+vrPAyFQtOAqyh0k7zr3UpNliIL2CJ69
	cJ7U8fj22Xqagyv4wXLQGSsULSuXLKSvYNujcgTwNUaWJOFe1+RwRO5fcIbe4kho
	0Mz3m+gU4KxiaU7d+yuFWysfV2yMHjGPn2o1GUPiu9MvcRMCkJQ/XpQL9lEHjlP3
	aoUYCMgzgNQovm5RxKbFaXpmz8pvGmIwfbUtv3kxg4oL5jAkvbwWr44tj8L9pvUN
	70W2SJcZ5AbeQVIKigS4K4J+JkKkpOlu7l6+1CbqIVtKHh7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk1ug9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 13:28:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae6961bff0so93190495ad.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 05:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772717329; x=1773322129; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQeIcd/nOZ7ZX1VNZs/yyOp0K92hK4/8vWea26Lu1JM=;
        b=BpGvxyPhDKqWQGXBWFHdeehqtYX76tfk3X8xKarLhk0VyJidbzxV3iUL/JsEcocT6n
         pA78pDM8HZZJUhlCHaCbojEK9gIjjPh2fPbUb6LrQjsfRLZRMmwS6PqReM5izWK64KOF
         8lWT0mjGDT5Cm27G6Kg6QDmPRRNK2AuY5UKvWZpkcmsGqjpGu449bALAWySZ3qnQnGjK
         LsMap34JnrN8hgCMUKTlBjWFDg4ZkFukPDb/d+Q20LIqgRhFvts/yR7tijkCdaRwhIHI
         LesBKEtT0UYetZj0RWR4/MrwR010p8CcD1yDeWLxqtADL8skbUIWSrSmebyX2ckJN6g8
         vHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717329; x=1773322129;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQeIcd/nOZ7ZX1VNZs/yyOp0K92hK4/8vWea26Lu1JM=;
        b=UoIgWYl2g7nypQwCzj1BKbXahjilcPN89oSTdLYnfbI38gTuw7qsYEJqOibkQf5Ycq
         L06brZ54y2HbFI7eiHa62//QL4TjFv9nQvqs4XdbR6xhQkr5f8gqKGUtkmteP7+4Fkjd
         9Q9Cvxka2X4YVhygShLDyzNV/brHvieTRvR6dTkpjKBlNNw+p6KDL2TgMU7uc/QQ1MmM
         3GwwK53/X4eqA4oLOIIMPluRGwHbgMXXIKKxbJA81dZ+YBs8B6qQ32qhhcy9lIYw2AG9
         viPdfBtnXlLW67ABQi5M5YncaGNz4WKNIZWEHnsfdZDQLwLI8qtK5wzlHj28kgnyVUp4
         jxBQ==
X-Gm-Message-State: AOJu0YxM2vkmhKSozXufGr1fBRM8A5PgT4KMjezNgJFRmK3pTkgu54aO
	EXTQh8lIlX7OmSiXeEHjaVIbUYnbvNKaMC1ywunRb0IVc1KS8SBb1tSqveFXFJrJqp71utBLKNJ
	L8mW/lx1EhGy1rUgUHOQKrzHxJ4Qo1aLmDi8Kl4RviCxZmr01vxo5B2TZ9T0GPnqBAA==
X-Gm-Gg: ATEYQzxXYK9flcR3+ghQ7mzZ8L3RoinKsi9ojGI01J7QjYBNBcLb6kd/JnCDHX/jdDX
	V3eg5QTVJegUPLD5SwwNS9BxL65iiOBjCSm+bzsYX00AUl9LJ/qhzcLn9BmFrtRwcJ/K5cufaK7
	317k4YXT/Lm/ppZjp/XlbqIWnzmJILMnNbpl6a+FG+dTrji34xSps7sY2WjF3kNRFxCHSkRsG9v
	lNS6+Rs41XD4vtJChA4EY89R5C+pyzPfCwJ78lzx51VPq8Oxy5aJIPpBUCmAQ6K4KTPphN7BPRc
	Ql2BpRa74rsB/UiHiZ+q2IaElTPt9ebSoem1t3TeqLl0R9LQD9DToMP9Q11ASO5Oji1IjQHmCQf
	FAvieaEyZQwc1phOJzJf9a6IZsmY1bUAuULMBQZ1s90jg42qpCgX0zgc=
X-Received: by 2002:a17:903:15c3:b0:2ae:5a21:f7ee with SMTP id d9443c01a7336-2ae6a8bfe34mr59082195ad.0.1772717328569;
        Thu, 05 Mar 2026 05:28:48 -0800 (PST)
X-Received: by 2002:a17:903:15c3:b0:2ae:5a21:f7ee with SMTP id d9443c01a7336-2ae6a8bfe34mr59081865ad.0.1772717327994;
        Thu, 05 Mar 2026 05:28:47 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c0f2fsm330533105ad.20.2026.03.05.05.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:28:47 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 18:58:31 +0530
Subject: [PATCH v3] media: iris: fix use-after-free of fmt_src during MBPF
 check
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-fix-use-after-free-of-fmt_src-during-mbpf-v3-1-20cd61ca488b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP6EqWkC/5WPy2rDMBBFf8Vo3Qny2LLcrPIfpQQ9ZhJBbSWSb
 VKC/72KU+imm2wG7sCcc+cuMqVAWeyru0i0hBziWELzVgl3NuOJIPiSBUrsJGIHHG4wZwLDEyX
 gRASRgYfpmJMDP6cwnmCwFwZjHWpWummlFIV3SVSON9fH5zMnus5FOT2XwpoCdnEYwrSvOk/Yc
 F8bRbK31LNlRb3X9M5knUajrOIiEA/WOeQppu/tjaXeYL+N9QuNlxpqaKR23jCzQXOIOe+us/l
 6lNqVsckW/BM0sn1FgEVgW6d7X1vWXfuPYF3XH7fDxMeWAQAA
X-Change-ID: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772717323; l=5820;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=l15mSyjuck4U9FDRKOGPmVbWICnvQJSekqWWPer8y/8=;
 b=bX+vvijA0pCBxWAyG7KXMzC2RGq1j5Vi587NVFVDveniogeJm+LZJh0mQ7u6+QC/JIYms4Soe
 jDzBNXJing6BxM7CrijmrObvtj7DUmFg7GHuoDRNHpWVPvUqyl6auLY
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: JkO7jE89kOUpKZv398KA-SYoyjamG7sf
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a98511 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vOiXTFtDm48uhe5vJ3sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JkO7jE89kOUpKZv398KA-SYoyjamG7sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNiBTYWx0ZWRfX/CVODMMVZAmj
 0KYh1CtbvkM5c7VAIHSDZoesBKwky2FyOhcW66Mt/PBggQn/U1Rn9XCikgHKbap160AFjIowGEJ
 wluMqoqqbXA1BtmV1RPXsx4EhDkk1g97L3P1+gLd6KXLVKrKPmIZlD/I1s5wnp6mVnd6vWColNs
 khXA65GfUebjzGrWQXYxWPxvjjVOSFAnHwZqpREadQYgujr5I7rzmvKJObok7De+kqdhHSxcKHU
 IASPP79wK7tStFQSiAPSq6ZvBQ3L1BrHHOUfFQWhzb5aF9Kbfs/4OTzYZrp7caGPYC9CB3SU2FR
 lE2Qj6wHccSRCwI1AUYDgc0HbGNFc3+nAqS6XFNPS9qrZUtbvcMRxD5YC9BGIBxAY0BfMAqh768
 48I2IHmLJKteo73j6+pNw2OD2o/JPP8KL5nevsO0H7pWzTEQ4Rvo7rfj+j02oiuy3FC53IiuO8Y
 eGpWR7zKw/5Q1t3tEbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050106
X-Rspamd-Queue-Id: 29F04212989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54649-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

During concurrency testing, multiple instances can run in parallel, and
each instance uses its own inst->lock while the core->lock protects the
list of active instances. The race happens because these locks cover
different scopes, inst->lock protects only the internals of a single
instance, while the Macro Blocks Per Frame (MBPF) checker walks the
core list under core->lock and reads fields like fmt_src->width and
fmt_src->height. At the same time, iris_close() may free fmt_src and
fmt_dst under inst->lock while the instance is still present in the core
list. This allows a situation where the MBPF checker, still iterating
through the core list, reaches an instance whose fmt_src was already
freed by another thread and ends up dereferencing a dangling pointer,
resulting in a use-after-free. This happens because the MBPF checker
assumes that any instance in the core list is fully valid, but the
freeing of fmt_src and fmt_dst without removing the instance from the
core list is not correct.

The correct ordering is to defer freeing fmt_src and fmt_dst until after
the instance has been removed from the core list and all teardown under
the core lock has completed, ensuring that no dangling pointers are ever
exposed during MBPF checks.

Fixes: 5ad964ad5656 ("media: iris: Initialize and deinitialize encoder instance structure")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Removed global word from the commit description
- Added MBPF full form in the commit description
- Link to v2: https://lore.kernel.org/r/20260304-fix-use-after-free-of-fmt_src-during-mbpf-v2-1-b4c78d1bf764@oss.qualcomm.com

Changes in v2:
- Updated the commit description
- Added Fixes tag and Cc stable
- Link to v1: https://lore.kernel.org/r/20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
 drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
 drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
 drivers/media/platform/qcom/iris/iris_venc.h | 1 -
 drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
 5 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..99d544e2af4f 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_vdec_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_vdec_formats_cap[] = {
 	[IRIS_FMT_NV12] = {
 		.pixfmt = V4L2_PIX_FMT_NV12,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
index ec1ce55d1375..5123d2a340e1 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.h
+++ b/drivers/media/platform/qcom/iris/iris_vdec.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_vdec_inst_init(struct iris_inst *inst);
-void iris_vdec_inst_deinit(struct iris_inst *inst);
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index aa27b22704eb..4d886769d958 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
 	return iris_ctrls_init(inst);
 }
 
-void iris_venc_inst_deinit(struct iris_inst *inst)
-{
-	kfree(inst->fmt_dst);
-	kfree(inst->fmt_src);
-}
-
 static const struct iris_fmt iris_venc_formats_cap[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index c4db7433da53..00c1716b2747 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -9,7 +9,6 @@
 struct iris_inst;
 
 int iris_venc_inst_init(struct iris_inst *inst);
-void iris_venc_inst_deinit(struct iris_inst *inst);
 int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
 int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
 int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..5eb1786b0737 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -289,10 +289,6 @@ int iris_close(struct file *filp)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	mutex_lock(&inst->lock);
-	if (inst->domain == DECODER)
-		iris_vdec_inst_deinit(inst);
-	else if (inst->domain == ENCODER)
-		iris_venc_inst_deinit(inst);
 	iris_session_close(inst);
 	iris_inst_change_state(inst, IRIS_INST_DEINIT);
 	iris_v4l2_fh_deinit(inst, filp);
@@ -304,6 +300,8 @@ int iris_close(struct file *filp)
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);
 	mutex_destroy(&inst->lock);
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 	kfree(inst);
 
 	return 0;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


