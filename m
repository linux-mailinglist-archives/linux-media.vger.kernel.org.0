Return-Path: <linux-media+bounces-61693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PylMiQLB2pZrAIAu9opvQ
	(envelope-from <linux-media+bounces-61693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:01:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A054EF9F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 718B031237DB
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C159848AE29;
	Fri, 15 May 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PZvA+ula";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aCJ041v4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884C480957
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845707; cv=none; b=XYrBsRt+LGb/RvdNHrqxBiOWVBuSnUBGtU6AIVztMWj2HBpoqYAqes1p7Hu2UXTM+ggvBf6l72QMgfGoGgQT4mqGDY5HP9nadrJ8md4yIuIZuPNnffYd7AOWNDRTLHcC01cEHDKqCnIMAbiMq+baZJCtAp4orNA6Bo7PAap1/40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845707; c=relaxed/simple;
	bh=sv4VJqZ7JjuYZ9AdNyjmibmQwBvNg6eatU4XxzWlZyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBueeHffEqqrZB8tq0ugDXz1PJANI4Rsxm71EDy2WQFBqwxHGjRU0MbeUSrMYGpSQXFqpPXcMtqQuI4cTm5WaynHhZZw1w8vryIzjQOuvjfRVsmJupylvfgzsr7kt29X7gJtW+X23wMK0MJO4Kt6+fDMEObqfyDv0ciWdvy1H3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PZvA+ula; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aCJ041v4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9O7EW1714971
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=; b=PZvA+ulaKHzmEhEe
	anvLPWWhs9oZhOu3MeynYkEvJDfDa1IPTxzcAPjOKnaXKvAPInpo7bFNPmB/o+l6
	aR1rkZu22hA+fDlqXhDPfGYqh1hPTSfdnHei9oYfUokdrBHxtXyzRKesl19mRcPo
	/Gh5ZlRwkwXUCPCxH+BjMMnXBeyGCnEo6675h/1G/b/JiARJCsbV+8NHsmXm7j/I
	udCPHadeC6vtsKNCgSYeYMMw2ASYLDGfdeO5RC1Lx9T3Jx8a2Q3UN84x8qO7H3m9
	400/QXfY8xMXxYnYaFgFR8vJuzAzlfnFelvvSXPDCQeEYM+Ojm3bhCzefcKUnjl5
	8W1+mw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsvfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso66644851cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845700; x=1779450500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=aCJ041v4ZlRcMnydXeqA/0/4K2O/lbHNqQyeO1E0E1faqB5ayQdCYbrwwQwjMBarzi
         mc6yYMMBNLDpZxGlgyjGxhF7zSVcwevGgfM0gAKwvVyTM+NSSfzPq7MGPbeouwJnStEL
         ANkvmIEokWfnWW5kRhySXUwMYQAnvHpufWvMzJhSR5C/LmkNtU7+ajplvZ66W35tG6gS
         hZwE9hghK858ZZ0MztWCiiluRTSaJnzrdc1850b8Nu68Tr1+dbSX1kkyWx6WqtY6DYl5
         6I3NSbnr59qqr4lhCppUEGfrJRtCnET+Jqgr5ngU+p1SZnKzmqBVJ+pe6G6efFCMd3w8
         nFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845700; x=1779450500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=XfhdD/4HuG0UFpg8R5Bht8P5wRDoEvrRNepJyfSt5ZeNbBLdVp4oJVi4/B5fIBgnNV
         sOMMa+vYBmic7OjEbArer3qNoIAlhLQVFPrrMm01F8qAOEZvM/o2tjq5+PLp1aMpcIDa
         w4y6eqYqAbmbI/M/vBFaJIvL+9GF2WK1rrAIEQ3maftQvKT4ez260ZAanjFbMNA1hKEe
         oD08Kczhui8pafqU/0D1TxRsC7dXKIjkQTg17Hjj4K0R7SNT5jMD12EBPXeXuz1OA+d1
         Oa/tWJc/ES7t33vq5jfYmtVQpM5LrILk2U4qgyW5aaVOJM74H04ZdOzU9UobNHzM2/xp
         6qKw==
X-Gm-Message-State: AOJu0YyKMwa9RvGpxPgwTa+nw2C/Pjjem+V9gGXoDcQJ222jjYc85ctJ
	hPxU0/htJ8UbisZpQdAi0C6ZeKgyq3X6GKE1mG2aqqBUXlIv+B5ztpgLp37Mdq3yK9ppVfCwcef
	rfQJ6+XR/Tou4jOpnyxBVEjcBOQeMpN2naF2XQjRGwH2KecZvI0Foh0tSKstyczQucw==
X-Gm-Gg: Acq92OEFbN4haKSeCSRXFx3FuSdIb7EcxhkdGfT/WCXoprof0xn8SfZBIisvUar2tD/
	gDy1kKy3OrcJcilu/vvZ8hj1sA5zm+dl6K5td78aWXeaPHXYNVmtzBtLChBkQCvAprHyV0UP5DP
	PQxyY5hL4Ft3E/ZXZjNKr167OTjffcgVqPmzSFF1k6CVgT5v1ldrQKdk0HtErZ2eACcXR6FL5tP
	apz+vgaOosQ14MOr3S7BoGhVwO1KawSqxAHWUiiNxFWsxROZr7+1LpkdC3g4prQD9EbMyr5ci+S
	TFVj9Vd59+lPZwXto74R2UlqU46gZaaKYzlkYzgxGvzMV8HpkSIzbbv/OM7uzfjwkswDRvx0Xek
	Mbj4xRw1Tq7dXeQ6wXGmNkfJ+qXl7Yeo8XEAYWSlQflFWKO7TglhT3L5wZ+GyM8nWsrx0/3a/4f
	TpsuyKXh8tC1edqPhyIEOSZzSN+58pgJ7SBzY=
X-Received: by 2002:a05:622a:4a:b0:50f:c920:a907 with SMTP id d75a77b69052e-51659fd7ec9mr49238771cf.9.1778845700073;
        Fri, 15 May 2026 04:48:20 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50f:c920:a907 with SMTP id d75a77b69052e-51659fd7ec9mr49238281cf.9.1778845699559;
        Fri, 15 May 2026 04:48:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:05 +0300
Subject: [PATCH v3 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-6-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UQqP5tD2UNNP8smTrGrxEDFFzhpcWSGstXQh9hbGrL4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxY7+xeh2G37uEwzDmXfeb3n+JHM1SdTou+cPXLpwDK/a
 bZT+d4ldjIaszAwcjHIiimy+BS0TI3ZlBz2YcfUephBrEwgUxi4OAVgIo6JHAwzj0plvCrOVVoT
 0XyBO7B9mmDjhvU8xxt//GfoPvFKV7IuNC/hrFS39OmT2kFP19e3VlxfxRc8YZLibKN7s+yexv6
 +8Vx1MWf4rJWMb2wPZYgvPhBlk3TXIWVDuU6Of8sun7h467gwJQEPUxvHC4dnzOl3yN16PzzuVZ
 HX+hUdF3irZC484/D2mrWISyAprFNizdEGy7vXXkpmxcu21qcy87ROSUzbnHT6vVb1eoYC290/3
 q5y1P4px99y9Znc5PRMhj3CyYm67QLPt2Tdi8zWVrPT7FCaz/zSxbZMVWaZyDkXba+OtP2Pwta4
 Wl7Vcl4V8SXEale1XTjPq7e32RcJLt9h7H7hYL0VQyY3AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a070805 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AGbD3hjgsX7adz6sYhUC0POKkP_e94D5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX//0YABehgqBL
 mMChgT15VTOgyJ1Ldpj2ePYoE6ZAij8gSZo1rblv/Yi9Vc93MEXj2F+CwUIy93PtqDNUxAS4TFE
 J6F4uj5O7B/MFBBKhzTJyihmzX1A0yvYXGsFcNHDKyjZjzgeCI3zkfu1EMXZLMng8GRb7j6ah5N
 jTKIwMazM35jvp0kIsM3aHdDdkB4HfD+/HehcWatCaz6Z05heNTyVyazFgfWi4Dyj7e3nD3a7NA
 rBzQxnQ1I5mIzOxbkIEFTXPKMXwRnPy2NdzMkJ1LpluBkOOMTTBfJRVnyZ12KSAdxpSLMZPpP8J
 /PytNXA8/2J4lWD4yz1N4kWdsVbI9/2COQLdLGuwN21wHPrATSaZna7q76vhkHv/xVuMSS9GgZJ
 viAnO0EhPf2eJfz0XJ9NfHLnl2P5wjne6OkPl/Q0pgXSIzSTY/w2Hr8gRCrJ8iqtyuwMWaVGzNp
 ml2zl7T+81jXiq6qTlQ==
X-Proofpoint-GUID: AGbD3hjgsX7adz6sYhUC0POKkP_e94D5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 474A054EF9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61693-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7acb073f7197..51d8faf6fd1a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -283,6 +283,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 9a76149f37b7..5fbaff5c01ca 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 59e4d68d042f..b8300195a43b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


