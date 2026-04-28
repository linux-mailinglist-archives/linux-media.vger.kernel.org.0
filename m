Return-Path: <linux-media+bounces-59751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJvXM14w8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:58:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6A47D3E1
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 05:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F003301A0A0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D2533BBD0;
	Tue, 28 Apr 2026 03:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5WDb1dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDLLUQ/q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143933AD9D
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348611; cv=none; b=W6Mn6yNo7XOaqGHYX3PxoBWLbRgUqvVv/KO3JX6V/9b4fMvRhMhbseonMbqEKvKCRuCi2MFx4AgkKDkF013coQI90XVgXwNVy06aH+Wvff2OC0zBsTOoeAQS1zdDJfCWnVLHzt9O4B2T00+k6F7wJ7CR+k1XI1PCm5IbPFc130s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348611; c=relaxed/simple;
	bh=m5k//9k2AZqLBLTijFuX7klJ8v4jofc5QHXrTy9WJIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C0tb4isxGHWbZoVlzTUkkzf29KuikIcKb3GKucS+QvQduzkN5Ez1BX19yIA1qWjqgPPjpG6vlozHy1AgOcOqlKdjrR9+BEMyr/zCBP6nH63pe00DPCA/e9KKZFvx3VAwSIHiYj1zFYz0tup7mOUZjJB/fZ6grUgqHBpGw0/tT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5WDb1dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDLLUQ/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ87Y82383117
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BuwJDFwl9orRME+wdYyrWEnQLmpCChqNE71P1LyFhI=; b=A5WDb1dqjfbs3wfI
	565W9wfNOaPZ0QtU1PfO2BJmEmGTYfNKkZRGRfxsYWChlWjdszhaxkDdH5bOQi74
	tNwcvkOFyGgfCp6gaevPvsGEo26ND8sivl5IizQpXcYryLbGY9Np9ayILWc/06a/
	/3ID2ntGi831ON+a8fzTKtptywIYQwfqSu2GExVLd8fogldZezgrZFdJ3BNexNQ+
	6VCp+6H6XmbJwHwySmYHvE0/c/8kUDEtNgldae2DDQnrYTdDgBrSNfBI0mwe4Wlt
	9g6XWOEzU+MBKZoCxUJ/oU5gtGazlv2S1MQrWyVEnyP/sQ/OhIXGbCIxx2ULmGLi
	VzxcWA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xu49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:56:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso13352218a91.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348607; x=1777953407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BuwJDFwl9orRME+wdYyrWEnQLmpCChqNE71P1LyFhI=;
        b=iDLLUQ/qy4tHogO/c5BCCcPBY06+X2Oq1TMtaumZCfO3p5ywtb7hrVahdKB+hb0Z9P
         gx2Vu1NOg/N5ewd9KUt0aEV/oKR/pFL5We0maLkNt+D1hAs1i6CJo3VE9cWBXFpp1Un7
         5dd831M7hXp7/Nn23wjG0oTjuwYAcJhOgRZMgIz/XpOKs1ffmV7OBxF0kRmrM6nNicyv
         d3nKIIW0vR91B3Dp7TXlUj6AyqDwihRv/UUF5P4MgIp3UDa3oLCPaUoNwNd4AH2wwNfl
         fo/SqlbUy4PxahaVGU0jr70S7PaOhc0/lwFlfSyK4chn25uYq5EOyI+NCk7SvjvzBVvW
         f69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348607; x=1777953407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BuwJDFwl9orRME+wdYyrWEnQLmpCChqNE71P1LyFhI=;
        b=KwL8JHt9PK6AChQIyc+GDtLpaFk83uv2eR/8PtL8zAGsXlPT4DjMx38dJZBlbykIO/
         9GV+huM4hAyqq4TUwlm1A0VQoYnOq0HFBjtB0NAz7knhVlxOOcMfssy/i5O+xAY7XaMH
         aKkdf/qAtc1+nLWK+OuHvilWcS17WnGmaeZMK60ZSkTTtoA5G/5czuUPH+iz/S4oE6ds
         /e5hAei8cpNWql6XDRvT1c6VycD88kHB3kCyviskGqNDpfgxdfKgSt0ueI+B/j7lSb/5
         l+9sciOlzr///4zJxNQpVlfbAsXqBNxyQymrLHClDbfPT3tqRdfcH9yPRh4kGsm2x8XN
         Efwg==
X-Gm-Message-State: AOJu0Yy5JZWjpMc4rMZSiarTwQACz+y0/GeMdAjmKHPeki4FtJXJTiYv
	JiFGc2xviCTyjdd5hRSQNV+UUFhmuRSx6+2OpwUpdU2hCOWQPKqlEb2SnHlT1cJzMCrSVvyShT5
	gXyewCRWJxH3i07kBNZLMxe5W9HpBAWVvA3nzuCXPRh64ZKqYpF5iCDJgWsgVWX8z8A==
X-Gm-Gg: AeBDiesut/xjS6cOYjRwU/k3mXc2mmXribBj+oSH/CHAxggmY6ggsOdRozHckikjv2X
	sVpcSR43IUyiFzjJEWpYOPnFh/BaOqtB1ZhSXFXbMEC+m9M2qVsr+bqPNkmx+bfCVmsCSR8+bch
	9PMEG/DuF0CtGorkj3Zor9V6Ca+WoUHbEFFhqs42OSnrDSwY54flw+rcUshq6y3naleYVYpsbJt
	d2w0zqcB1zDX5N8a4oxsX24yHE1dnELmswwVIdkB5WPmk4bCKVrR9vh3BiR0x0HM5IUKUKI/ABt
	0f2L83qX4TYyFLxCe4X7+v2Td8yXcGUNUh8b/8DyekThBU3kkyKuPdCjdHy8zm8k7quciX08hmb
	QSSpB+YlEHLxoaAAqOIngZDgpYnzOqErCA8UXPjTalslAGuME4byO+4UqryvtGtVyew==
X-Received: by 2002:a17:90b:3909:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-36492000bb8mr1425072a91.14.1777348606577;
        Mon, 27 Apr 2026 20:56:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3909:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-36492000bb8mr1425043a91.14.1777348606032;
        Mon, 27 Apr 2026 20:56:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:56:45 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:13 +0530
Subject: [PATCH v3 07/12] media: iris: Rename clock and power domain macros
 to use vcodec prefix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-7-8f28930f47d3@oss.qualcomm.com>
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
In-Reply-To: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=17094;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=m5k//9k2AZqLBLTijFuX7klJ8v4jofc5QHXrTy9WJIk=;
 b=biwex0pG6ufpJ3jk0X3dyk6uaSR20CtjD04wy8MM9fZ1FKaeNUCGJz1a5jJezWvt0iOGj6z7+
 Fo9n0+d0SUVCS0h9bWpP2YuXCDa+AR+uBZXeaX+Jesz8xnKuadKIjAb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69f02fff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kpNcZxiqwdVgWfiEekEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ytfcmQN6hkeRLNoJXDjHL7sfsWG-nEDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX1RqFX0AA4o8d
 e1drDAmusq0fPIAfGacl+Ys6stpgN0SfCVJ9pNmtT0CziX/2VY9KZy899+a6dX4z/CflD2DLlCE
 yjYX1wzhgNQH6QvdE0ps+tnEHKCVeLvqL1FqtlkgS6mVLxJt9cIVOTPmkPZusB3M5nPGcEHczMh
 KWCt1TIzkB+bTIn19U98V8EZbVTIMTq9vYEf7h3DuJTaQA0kYc09pjFJl4jzSBrCZv8o+54eZjL
 tEwkF+8DyqDYgkyneOqhd52hLJRX8E/biD5c8dokivlYgsUglLUM9JnkFLm+hJnGkRqD4+lQy/A
 HkBgNefjS+wEAW4Kn4yDKtrJ5JI1UOR9hiVuGM9bcs7/Ez0pOE18Detg8btJQY2+pTmVPGWIWf5
 72iljqeh16RNqgybwkDaDEeVe+rCPrjfCyNtsLo4VIW1Yc4QMwowAQiU7TTw0skRr0cK0e9/Bod
 wyFLDy3xdmMwpyomSTA==
X-Proofpoint-GUID: ytfcmQN6hkeRLNoJXDjHL7sfsWG-nEDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: 7AA6A47D3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59751-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The current clock and power domain enum names are too generic. Rename
them with a vcodec prefix to make the names more meaningful and to easily
accommodate vcodec1 enums for the secondary core for glymur platform.

No functional changes intended.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
 .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
 .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 25 ++++++++--------
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 ++++++++++---------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 35 +++++++++++-----------
 8 files changed, 70 insertions(+), 66 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55ff6137d9a9..30e9d4d288c6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
-	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
+	IRIS_AXI_VCODEC_CLK,
 	IRIS_CTRL_CLK,
 	IRIS_AHB_CLK,
-	IRIS_HW_CLK,
-	IRIS_HW_AHB_CLK,
-	IRIS_AXI1_CLK,
+	IRIS_VCODEC_CLK,
+	IRIS_VCODEC_AHB_CLK,
+	IRIS_AXI_CTRL_CLK,
 	IRIS_CTRL_FREERUN_CLK,
-	IRIS_HW_FREERUN_CLK,
+	IRIS_VCODEC_FREERUN_CLK,
 	IRIS_BSE_HW_CLK,
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
@@ -206,7 +206,7 @@ struct icc_vote_data {
 
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
-	IRIS_HW_POWER_DOMAIN,
+	IRIS_VCODEC_POWER_DOMAIN,
 	IRIS_VPP0_HW_POWER_DOMAIN,
 	IRIS_VPP1_HW_POWER_DOMAIN,
 	IRIS_APV_HW_POWER_DOMAIN,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..be6a631f8ede 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -284,9 +284,9 @@ static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
 static const char * const sm8250_opp_pd_table[] = { "mx" };
 
 static const struct platform_clk_data sm8250_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
 };
 
 static const char * const sm8250_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6..47c6b650f0b4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -780,9 +780,9 @@ static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
 static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
 
 static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_VCODEC_CLK,	"vcodec0_core"	},
 };
 
 static const char * const sm8550_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df67..6b783e524b81 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -16,11 +16,11 @@ static const struct bw_info sc7280_bw_table_dec[] = {
 static const char * const sc7280_opp_pd_table[] = { "cx" };
 
 static const struct platform_clk_data sc7280_clk_table[] = {
-	{IRIS_CTRL_CLK,    "core"         },
-	{IRIS_AXI_CLK,     "iface"        },
-	{IRIS_AHB_CLK,     "bus"          },
-	{IRIS_HW_CLK,      "vcodec_core"  },
-	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
+	{IRIS_CTRL_CLK,		"core"		},
+	{IRIS_AXI_VCODEC_CLK,	"iface"		},
+	{IRIS_AHB_CLK,		"bus"		},
+	{IRIS_VCODEC_CLK,	"vcodec_core"	},
+	{IRIS_VCODEC_AHB_CLK,	"vcodec_bus"	},
 };
 
 static const char * const sc7280_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
index 719056656a5b..f843f13251c5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -11,12 +11,12 @@ static const char * const sm8750_clk_reset_table[] = {
 };
 
 static const struct platform_clk_data sm8750_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_AXI1_CLK,		"iface1"		},
-	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
-	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+	{IRIS_AXI_VCODEC_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,			"core"			},
+	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
+	{IRIS_AXI_CTRL_CLK,		"iface1"		},
+	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
+	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1..1f0a3a47d87f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -209,7 +209,7 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 
 disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 
 	return 0;
 }
@@ -218,36 +218,37 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
 	if (ret)
 		goto err_disable_axi_clk;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto err_disable_hw_free_clk;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
 	if (ret)
 		goto err_disable_hw_clk;
 
 	return 0;
 
 err_disable_hw_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 err_disable_hw_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
 err_disable_axi_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
@@ -256,8 +257,8 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 {
 	iris_vpu33_power_off_hardware(core);
 
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
 const struct vpu_ops iris_vpu3_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index a8db02ce5c5e..4082d331d2f3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -27,7 +27,8 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 {
 	int ret;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN],
+				      hw_mode);
 	if (ret)
 		return ret;
 
@@ -63,7 +64,7 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
 					!hw_mode);
 restore_hw_domain_mode:
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], !hw_mode);
 
 	return ret;
 }
@@ -162,15 +163,15 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
 {
 	int ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_FREERUN_CLK);
 	if (ret)
 		goto disable_axi_clock;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto disable_hw_free_run_clock;
 
@@ -198,11 +199,11 @@ static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_v
 disable_bse_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 disable_hw_free_run_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
 disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 
 	return ret;
 }
@@ -216,9 +217,9 @@ static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse
 		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
 
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 }
 
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
@@ -226,7 +227,8 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
@@ -278,7 +280,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
 						[IRIS_VPP0_HW_POWER_DOMAIN]);
 disable_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
@@ -356,7 +358,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
 					   [IRIS_VPP0_HW_POWER_DOMAIN]);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 }
 
 const struct vpu_ops iris_vpu4x_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index bfd1e762c38e..006fd3ffc752 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -213,7 +213,7 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 disable_power:
 	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
 	return 0;
@@ -221,10 +221,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], false);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -251,7 +251,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
@@ -268,7 +268,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 err_disable_ctrl_clock:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 err_disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_VCODEC_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
@@ -279,30 +279,31 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 {
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_CLK);
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_VCODEC_AHB_CLK);
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN], true);
 	if (ret)
 		goto err_disable_hw_ahb_clock;
 
 	return 0;
 
 err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_AHB_CLK);
 err_disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_unprepare_clock(core, IRIS_VCODEC_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_VCODEC_POWER_DOMAIN]);
 
 	return ret;
 }
@@ -362,7 +363,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 disable_power:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 
@@ -379,7 +380,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 	if (ret)
 		return ret;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CTRL_CLK);
 	if (ret)
 		goto err_disable_power;
 
@@ -396,7 +397,7 @@ int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 err_disable_ctrl_free_clk:
 	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
 err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CTRL_CLK);
 err_disable_power:
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
 

-- 
2.34.1


