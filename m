Return-Path: <linux-media+bounces-61433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALOdDuR1BGqdJwIAu9opvQ
	(envelope-from <linux-media+bounces-61433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:00:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CD5337EB
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C666231F5C6F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28794779B1;
	Wed, 13 May 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+oi/4Yy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxHF3PI2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414B46AEEA
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676571; cv=none; b=QEZK8dmtSm0qyunyyiQtsNko21vdMbcaPrzWCm9oVwGUjaMT6yIRRgt4qnbRT3yG7K6j+5HwVA9XCCdRVM3PRLRtOvHiskDn+hMiwTmWZ0tyW1IqNdRWGpudbhEG/AZjR9bm7kwHPZRCXLJvdfEdKDKQHTt9/gcIteuK37b/tVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676571; c=relaxed/simple;
	bh=sv4VJqZ7JjuYZ9AdNyjmibmQwBvNg6eatU4XxzWlZyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hz25euZC9UexcMknHhvtAMhU1CLMu8w5ayxa/+4O3AocH3dTwQc4hO3D8cBu1dmgUvF9wnpooDMnb+x3t0jfOmjLQGk5Z0mqJe9BThy7XEUcLEJ2nA0/HLNXUIalTbePr/LKDbfrcI4lz6Fx5dj/Bbkqf0GvIJsgrLPOB0CXpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+oi/4Yy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxHF3PI2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mMXE3474958
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=; b=Z+oi/4YyAEwtVpIt
	K/a9LH6ttMA5+vPSk4pNJ0BJPG/bUeIop0oEo3RNu3pDSRuv6OQLxikQ1DAN7X8c
	PQj/wS4dOKBpbRPde6q9I9wCJ5u7XJmsjxZBh7fF+UCStJFBNrRdQJ1kMGRcjz+X
	IAHzbw71G9KGud6GJC1D9qatBU0BLU4gaDNgts/X9tPQPebFud7yQ9YtD9JlXX5k
	tZABRl0Ee9iyMOXoKgohuFKZLeKS+vI1bpzJMmaHZOO2EA1S6GW2MmJusGujINoN
	dvU1JatjPiqc3dfhx2Iaf4XVxZkRdNO1sjqP54rKuL01DFsFZgmWANR5U1i+keMT
	7lT74w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418uvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 12:49:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca172588cso50557166d6.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 05:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676562; x=1779281362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=JxHF3PI2bSmN2xwFB7zLsaN3m4axqgjO1K8nfTPYn+Hcz7E1xlSNVa/pkjhbAOGOnr
         aMcb6RjqXRCKi0Gn5aW+CBojxEdeo7tpEsR7erS2xIpVz4NywE0pTDrFaNk5vpBdL/8k
         yJXyOK28Quq5mmrP5oqHX+Febpt/QHeT8/qswS+e/YQjpZ8jv4R9OeZeRYNVsjvaJqAs
         qTGicYIKPEfn8uONeie0cSgvBS453CGX+TW34qM69p8nBv+DvgYemS6pkm6hX3Tx34/i
         C2JCKUq6ObrBZN8HvUfayNT2QR2YUR3TtjH9NKuDgUwJJCMW7is7IumEx+9OrsFbfyY6
         NT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676562; x=1779281362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwtKzRUpPu3qGqMPfV8u/ItsjOc0+QrJiGVMQ1OuoBA=;
        b=jv7iDO4ryORzoHw99TRcgwTfDHZ/zSxE9Bo/45tbJWQekMObWKd2wCirYUrRP5UWC6
         VnYdghQXH9BlnBdxKX8yVnKUYwI6Heqjr0LawQJ6MzJjhcYWPhpr2KGunU3ctZBfZC+n
         86T3LWHRUHrTOu933bLOvW7vdX1AWYP8OZHnga9b8xvingJyxLW5gjxMjlVPjg+koI8V
         DO1RaLp5kKYS0J0vK9pGe/BU8TZ9flhbsfjKw3HnTZjpZRaZRuct8A5VX5sYgPjesf9b
         XiI1Mr1ItswjmeoYlFeZc94WO0oy5vbU8iC/y/DNDf+sFuSbIVqQNMz6Crs/CDfcqA9Q
         lSLQ==
X-Gm-Message-State: AOJu0YwIL/l7ktY1YJGtIpECPqk/EvH/a0gVsjE4cbS7qpLyxgw70m9/
	WX3KfprqrxdXAc5g7Cfm+HfqhHmaKBTSp5+mpR3DoFysklcpLYyTXsqS2h/QKrMsuHam0zA/ow+
	Qjsf5B3Rb8DWsw+NsA7vdkxeQS5E7xawxDkvYxFK75YkQE9RAH7ZdFzpD/MzqFKkXnA==
X-Gm-Gg: Acq92OEp6f8MnlHOoa65teShFWU6fF9hLhMZl1yyyuNl6VO/TYo1/1+hx2eJ8CTHX2P
	ws0trQbhsjc8XAJ4uc0ihl2mCGgCjjcvRn4Vdx8QLph7kQC5jOlJ1b63dS+3vXJ6X00KFsu18hb
	4R/DrEIWH1EhtLQPnw2nxbubwVFNGUJA+/1NgmbBNC566nAmre/7Kkf9Ng7Pny8N7vajmUXfV2l
	cXyeLcsDvZCbgcnn6elH3CT3dp+KKlHS63AxhUxr42/LORmIm3mJvQUz9+BrqwaW9nL/ufX/SSP
	Q9T7R8xrOdA2JKtmdrtRByErJAEEJQP8K5ALY+Rwz/OVkZHqhcggpdC0nY9ZnzPsGPTQXoAGket
	MCzQHak+AJMhuGYlve3jTqNnU1ZlljLsVRd2JtgMeyshjMwWmnzG/ErJubjhpZ4AgHR9lCkzm/e
	bNGrzPWeUwUXeDuRlwDZMmM28bNbyiDMbWxoM=
X-Received: by 2002:a05:622a:a0b:b0:50e:6055:274e with SMTP id d75a77b69052e-5162fe24aa3mr37726091cf.17.1778676561835;
        Wed, 13 May 2026 05:49:21 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:50e:6055:274e with SMTP id d75a77b69052e-5162fe24aa3mr37725571cf.17.1778676561148;
        Wed, 13 May 2026 05:49:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:40 +0300
Subject: [PATCH v2 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-6-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxZLsYPa95pV34KZ3swVE2oyaAmtOJ2czxj59Y/IFsWkk
 wm5x/Q7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRtG4Ohu7r361O+vn8XBvt
 kx3b75KR8u3BbKlS9669b6fWsU+uDr6+6nDl8SkGDZ+7z7HMuvL4neamO7rlPHnXiyVixC8xOPf
 E7ctcfudn6d8fiucW/Djcs/hQnIZOeeO1Y1mMabdqcopqnN335+dXiIm9n9e7+4WC223NGYyH2N
 X/P32SteSCtmy+/2M7r77pX5LS1bYdfy+ifEVthqefgldOTa/xVD4j26CLmRf+rH7GKfqAYY3jn
 sxs+61LDsR3LFHtmqSTZ3qJIzF1+olVcSLST7Ni+bQVi5dsio4+Zef3c0PX6leZwQW2EYtPbxCc
 kJFeuWfig/nf5ENMdW3OxMfKZe6p8z/h//iKk/HE7EeNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a047352 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfXwm2A0OmTfHcW
 f1PULKKKjGs4vdL46/ycrgScEn4GFWU+kBBssbnsnX/T1z5+lxVMIMxgV/C+QUj6g6pGLrqa5ct
 ssXrxHv+BdiSnUQuwAG9bIJryoKkQzdDKMjWnnFnNYg7Px8HQ7I9dYSRCYD2FPZ7rCondmdkvSz
 jWo6H/pdZSnO7y7jOWljPm0PQQNPlztMhBfZQ/whOA7O5DOUiU552vmtm/PVnvmV7XkyEou7CQr
 I/DRzWg+Fp19txV0e8uG3FkYAjZrCuEFphBKRjl9R16G8/SHvLMC6kkUMYuiqkOwibMU8gA9mzd
 TxPFnAcY60vyq5oqoaBFnM+5cZcyxT5CbWrMJFYiB1fD7Iq3fht5byb//mSfZnvrqtACDf7PLOm
 XxgIzE/lr/X92sAofaK/WqdFy7QVtnjitdlFIGydsdscebgHb23z4HwHZvWE4CXmfPtBUHrx06J
 8ms6UvqfrtvKNEmVckw==
X-Proofpoint-GUID: X6NLrPLstYtEROOoTflzkPIIXENvrmLR
X-Proofpoint-ORIG-GUID: X6NLrPLstYtEROOoTflzkPIIXENvrmLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132
X-Rspamd-Queue-Id: 872CD5337EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-61433-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,60fps:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


