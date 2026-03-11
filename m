Return-Path: <linux-media+bounces-55297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sODnNsr4sGkRpQIAu9opvQ
	(envelope-from <linux-media+bounces-55297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:08:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9C25C3C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 06:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 447D6312BDCA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 05:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B021E325727;
	Wed, 11 Mar 2026 05:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Twgb65T9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DE7kdIkC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC686325483
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205529; cv=none; b=LKJUjwqMxyoM/4rtp8DvWtyUTyS6H0Cb+nBO1YiTEnaZeSKPhYUF4DQuumCTSkcGNY6p1m3UdXhGkEpHrc49ebfZwX+cr9OPWREsYJqePWZX4xCm9+VHTHo49jr+z8UqYkU2EQ17fWNi84ab7mAOWU2bYPlR6IDS83c74aI9sIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205529; c=relaxed/simple;
	bh=CtWOxxNLvINQuoxRDW5FqCzOjuGwRgb6qMA/H9WAPS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy7ooEKM/gat5qG56n6VJonM01s4yfYgYViF0A/3NaBgDXADuUYbWdyEng/7qsRnQ8JWNmFK1GOptD2K1CquAbtC2UAx/3VTJxCE/CoCLWFuRjbRLEL4Q2DQjFzlLZrpwY6DFXz8SljkkBPXbhOgRebXAiMcr8PgU4YNojqHRmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Twgb65T9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DE7kdIkC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJNlXT3295792
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FbvBkSXHPmm0gZPtLIZSX2dSpBh1f3huzQHvkqUVcs=; b=Twgb65T9vaDPTARr
	GqaQS16RJS9dWwow6YmS7nDuY4WbdxYaQ0SG9ov5p4WJK15UWObcmJKo//0n6f28
	VVvrZG9LnyFR9bk/BEidy6HYEp5qBb9b6Fhj5e5Xzahh/+Umcr8FhPLPNzglhL6G
	jKoMGGuY442q0ZhW3uQiMeGef+q98MqK7mFSycJrIcJmVLA9nDvpM9JNs7k/jyBK
	bhdgsHAun6S1hr/nhFnHmZW7XtQf6uRO3axP+vJLL2NsUjQhEZDvbqOND6sWNCoy
	nlFBZCnyo+Nlv4mxRk/8QeU3Mht3wEyC4OhVROhuYtr2zsoPZQSTFj0XbKr4Qtu2
	AcOmRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mv1wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 05:05:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899f474fae1so53804336d6.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 22:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773205521; x=1773810321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FbvBkSXHPmm0gZPtLIZSX2dSpBh1f3huzQHvkqUVcs=;
        b=DE7kdIkCOYxLy5F9KzVyTgGWq47OF90ICvoiuMITBr4/+0q/tG9UkmewajYR4P6+7F
         s19LiPjL9oiav6CSa1xs4FnW++frLGc/mMbuSoT2Rq6cErmajQag5JCe6GgPvrDLcxln
         k8lSg1MJ7tTCBS93dagBU4iSJ8bDEKcc9FvIiaab43NKmXAip9w/8tjZSttgtODkV0tW
         nBAKMKPXd+og66SBj0+5TUrVqTBL+Naj7koHk0SHNxxgPNjAE17WjP4zdfK9nFo5sefr
         dcU+wvnWTN7EJuxboBasopSwiHLHGHQoIeaN4rR3sMnE87F/Dxl93tO+wLatoyerZQY+
         J3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205521; x=1773810321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5FbvBkSXHPmm0gZPtLIZSX2dSpBh1f3huzQHvkqUVcs=;
        b=IMlTmXMXHvp8rAFZ81mQdSPO2U22Qqodk631Rbqqud7GOSXrg9S/Dkj9L39QP+ZiO3
         TlavdlJGHh3RsQHVzV/tuv2yeuykEKxwu8vLugYyo8F8EEFBKxI4FW0DN8rOcVSnBqIK
         gvcC3v0MDaPI8gKpk9EM8NRZdeqC+bxOp9oLeLAEsfdckNC0K/zLDgqemDm8P/mIhsqR
         V3H0u7w/RUqnFEhL3uWZq/M8zIVU2qTP8oGh8qcRzs04o4zVaGpfAgiudJeJ6WCzRd1Q
         RpO4bZQRBy4ZMJRAFuz7JCcOtlDBIMSZvGqyVdrIfJXLpDb5PrDdbkTJAflcQCnA+Au/
         a3Ew==
X-Gm-Message-State: AOJu0YzK/GYgPvtEeWxIWhTteUajLC7NmnlnLHGPEzApQsI5waSfr/q9
	1SlJs4mvdYR5aukZL6RhCcpL5EDcQ3m5YpOGOTV98o7/SFj442jiewytpU5TmvMeCbI9iB1D/Wz
	Mxles8GxfJmMeRcthe94QWzkwQeHmk85XqcbsY55z5C0L16F3oKgAsyZvTFqIWrFeiw==
X-Gm-Gg: ATEYQzxWut1nv3chWyyauvjEeEPbfLfNuWBM7s+eR6knWvhBgC+tI9f+dpTB5nlhhLr
	FoQwAeRDy0u0w4eRB2sCdCta/E33FywGt4rAH/lsxvTq5LGDrlhWkwgO6rbUwObDaHNsYpJpJcz
	F1A9E8qvuSAre8TS+cZhGpet8PZa/wnGsPauJY2kPXn16p8cF0kEV7L9Z23qKsfQacOEsPJ7kLd
	3ZZVIsmzbdZt3iO+4mHyTxfP3h2VFoSrWGlwrrqpiB+MMA+8eYsYR+iPmLBhvfb/KC0YXJu3agd
	IXe7+3j+Q4t4sBNl6CeEdYV2Xa5TY26g+Z8AC15QJKqFQ0lqMoKWVFCpp98VGxzSK+SfJzjDHUu
	62YUADJht/qGdaq0NbXI6enMDYvmYZj2em6ONAUnycFcXYj1v0i8TtRs98BZjZ0KuK23L+oW552
	SeQDm8duc+SCdO1CmIqNL09UMjeqLuUX0mfWk=
X-Received: by 2002:a05:620a:1999:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd93bec8a6mr676377485a.22.1773205521134;
        Tue, 10 Mar 2026 22:05:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1999:b0:8cd:8ce4:c0ad with SMTP id af79cd13be357-8cd93bec8a6mr676375985a.22.1773205520659;
        Tue, 10 Mar 2026 22:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635805bsm199240e87.65.2026.03.10.22.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 22:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 07:05:07 +0200
Subject: [PATCH v3 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-iris-platform-data-v3-6-f02258c4d4ed@oss.qualcomm.com>
References: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
In-Reply-To: <20260311-iris-platform-data-v3-0-f02258c4d4ed@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9065;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtWOxxNLvINQuoxRDW5FqCzOjuGwRgb6qMA/H9WAPS8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsPgBTDXsV4Y6pXIpaOh6SDciDbGkRiky1nT3g
 M+blNc0MM+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabD4AQAKCRCLPIo+Aiko
 1RZyCACx3PRUZdRyszanPrb28JzBKc3jk7ZhAfmWbw6OVbTsYbwYJDzFbYL2jCXBdgSIDW0gbgf
 bzt8im7CdaBsx2Ufpaiytb9QKJUHaPfoNkk6juQxQG22jsKJVLh5lno553xMIzLOtmjWlslBOyI
 /QMbWPWJEvgpU4RBvPTPsWaQLWmnd0WTs8bLSCTE8TYmzGvtyVVUXJINtpPsS9RLLbDZWOwh2Lf
 +GQmfn5YkUHPVitCG6vy5dHQeNe3XizrdFmt8vJq3nxLCZU7Lx8e7zVuXATKm7rZr+URtEmAm+h
 +s3xqayZnw5BSlyoVPyxY6cm3jwBkDhwIB5mkOOaAPFfVLDF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0f811 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 1XyXaxzJOZrAOYoq6OkBMp8HfzDNPoch
X-Proofpoint-GUID: 1XyXaxzJOZrAOYoq6OkBMp8HfzDNPoch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MCBTYWx0ZWRfX6ru9QUNLDPFh
 9r8abVza+FpLWism0YCOduw69T6vRXXsZBsy+ywNSix3FafTY49oAIobSKOh8/mU82a9BVy1oj3
 qfeQDnCsdPSuCnrViBiBNtHCHnl/Ytnv3DcubZ+GI+zhyJ84TIkitG02r2R6CbxOE595MckgGbL
 ZREE/l5I93YeicGWCTRx223L4G6pT4Wdpu+y26192Qrwjl5UhuX3GisqSxf7Mi5TzAatVTcrVCv
 6oQMxh9DGem6FooUkdT4JERdXgL/5vtMOd1IorBMd99latX02bhQOoC/tR7+2wRrRFjQFnpXOlU
 DHMhlPtHC0bM9v53qGWeEYDvWnCgCzbhSvsohG4yzX1Z8qksViKRmJS/j9X0E1bUQ3HNYY54vH/
 +bDz+EWhSBVF8jAc9k5rmAq4eybK9jUJR/vzKxayjd5OpO05Dje9NiDojEp2Fg8J0+syFGQxWGJ
 0t8tGmV6uKKau1D51Ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110040
X-Rspamd-Queue-Id: 63B9C25C3C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55297-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 1c970243532a..0479ba442b09 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index eea9cc3e5904..abf02f589a28 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index b981a1ba6954..f1d293759bc6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a875fa906193..6ce94f4dfe08 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 75dd496e2984..d8d205fbd61b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d72d397a2c2b..0f8d67473c3a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


