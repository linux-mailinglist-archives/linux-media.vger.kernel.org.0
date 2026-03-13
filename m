Return-Path: <linux-media+bounces-55688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKGSIo0QtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:26:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB13283E2B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0211304BB73
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBD3399362;
	Fri, 13 Mar 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9UTtKZp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6xm5JJV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF7399036
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408056; cv=none; b=JbDzv/jysJ9ZMitTuffmxLZLlajcTHkR3gIv6W6N/OiyHxkDl9VcV5D63DXX2Vs3pcA3QIcyjpY7KfkY/WMGLkFNojb61ONtHtsh6/KpWODFIczc+/rNoSq2mfH4vdogx3n+wnQ2jTuiC8nuWQ1FCm/DHf+DOT1zRMYi2jD9Iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408056; c=relaxed/simple;
	bh=shTpjy8+H5B7ZoannBsh2Cco1ExUgSP/Jsk01EQHXEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViGiiCtN2wzfjwl1UvCW/u/w29ctN9r4CXOm9ipuGIlsPJb0EqL2nqVxw1zskIT06pP468TwwibT18IrWtc/fZHbZvXfu33jSY/fX0LCZ1Ebta+xeCQV9atOI4GNSlI9ZXCRPvbZ4BfpkguQkz29lruqmTQ3/5S1cyR0HAlOIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9UTtKZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6xm5JJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B46S3906292
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=; b=G9UTtKZp/pL+Yju7
	YKbb0+MQ5FyNlVg2lSfqV1pkYVroNN0ySpTL02BslVn0fZPjLhahDPtPYMcrA8IF
	CwMA6XWgfClBKsBT1E9XwqkWywpP0v3Fuom1/dr98Cdtm8ILVx1XqL/WarT7TcEJ
	oVT+COU5KDJUTtjOB55jDoYRrffBwbPVkeAkFu3wBIRUsekm4cfQHbGXt8XcvkpJ
	2Ax0H/3FNI+o65bQiXAiRowAh4g8+JVeFc9cJ/L0mKXC6UCQqJxBbiXwX+QV70D1
	5yMxb4MgyUavr8zNsHCNcfbAa4v2CQxR1M6AUkhVLFdrTFHGB+7zh0JpwB00qPvC
	rC4VSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8sdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso7356964b3a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408053; x=1774012853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=;
        b=g6xm5JJV76+PnYAbZ0SyColTFCYn0n2hPjemIYgOPCvf/sEY2Z9QQKzmhSUjtMQgD1
         F3RkznxJjHCUcUik5B54HLqDJsB0sHf4adIlSPcGMLjp5pCVXOQHxif5iU4a6lADDI6Z
         Uz3V6MW4NLQCZCw6DkSL2A8FIZbAvM7ocv9kN/uJ5Dfi15yoVmom/NrLh891xCocErFG
         XpjuQSKDrNPjhqDgZOdzmz9B4eEziENRx086f9mRdPQ/gS/WHUuMSnxk/g8g7S31eIBP
         1PRnrCHKUT2Pkaq6YMsanQySvr/UrGMTKU4MA0azd4IuLZzi4Idjyuqv8Kvt37cWSTrv
         hQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408053; x=1774012853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P1SvUxm3L8jpr8NBTirkAHm9fds4yk4J9NAxbtLExdU=;
        b=U3C3YTPFM49EC3ERWsbPQIWZbvNQN+l5AGPgI7rSC9NE7+AzD8ZH5Bjj2aBb0mkbvQ
         UqkXRsbsdTvUelvfpQAru2Kfxwy3azM0+XEeM1KK1sQ+wZELj3l+qTstC/qqlOKThO6e
         QbwHJKAyFw7xab3ZN5HvmKNUPQYMqwVRScyuxQo4Cm3Spe0JIZIPszTCG5DrXDWb5abi
         qlkphsgjjSUqCwph4G6puAwWNogI50LFeVAIQPaOAocvvZZgrn+YJhzCdvbd8pEWbVzz
         uQodQnCTbkefqk8a/fRJnWn1/poBeca0aEI4NFkWAS9lZ0r0OD+dfiUrD5Oh0DiBU60Q
         J14A==
X-Forwarded-Encrypted: i=1; AJvYcCVn/KjlpQkx465DvsYanKlQ9+3L9Hso5EO4FuVxza96x0MQ7biWXkbB68TaJoOKcpRvQJBZI0U1Mj2zFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNjtlNPEREJvNGVlDtuAXPOcpS81/UOZN4ttCNXEM7FmdC/+ps
	rXDNlStd18c/RsRgA3ztwrJBN0Gu99yjBCB/IDsEyO1exxF2kmWzcVWRmFmAODdCR1lG5cpTWFb
	FOpgXSKw9Bum89CLRewoQj8enzElc0PnX96vtr1y8RlNXfaihWF3UTfVhH/2fgK+Now==
X-Gm-Gg: ATEYQzyVGcZ2KucNQNNOv+0zbQMIWOl8wi5iTQqMPn8ggXWCPFbhQyVfpNoKAnI9VVK
	T4Ahog2ELy0Pul9GTrPaqUqA3R6BxLWiTsNym0GtHIDQC02lMb+HgpqurZzGOkLxC4zpZch1aHf
	MeKOntkjBLzii4kJUq0cO32KMd47cJXBcClr+YmfIHAPq7nWkxtBrSZDrzZOZW30sl3nLpI9zUb
	Q6Ix4MnP6JnZuFbC9x5Olz3FenueKSdxeeHcOoVdr2NXk5AifkufFNx15pqCdGUG7FFkzqGetnS
	0RMCIUxVoBYDB4JaBNL42hfxZzjEkiizs+t9kXD/Kw6joeyLKoSTF1k4Z4CroMwlhArIrZG6tvX
	Kwn7X/hmRUCLxMfcZcnJ1Ndv9H6pJePblfYD2anSNhxcClN0REeJXmOhR
X-Received: by 2002:a05:6a00:855:b0:829:924c:3488 with SMTP id d2e1a72fcca58-82a199399efmr3191637b3a.55.1773408052787;
        Fri, 13 Mar 2026 06:20:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:855:b0:829:924c:3488 with SMTP id d2e1a72fcca58-82a199399efmr3191588b3a.55.1773408052146;
        Fri, 13 Mar 2026 06:20:52 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:41 +0530
Subject: [PATCH v3 7/7] media: iris: add platform data for kaanapali
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-7-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=9082;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=shTpjy8+H5B7ZoannBsh2Cco1ExUgSP/Jsk01EQHXEc=;
 b=noiZy9zGls2nFeZW6mGOuwEbHBmNFeMXrcrvgS/ttpZaOdfGvYGEhHLKLAEBS939rQTXnV6nJ
 tq/Z/tch+3vBWvQypz+/ch83F0Qx/u2ATx0/YbJHKrMORsWi+oM82lq
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 2Zi7Ya9EwXslYKkPe6bYZFNcEHJSMuG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfX1WNtKqvf586C
 tamvdw8k/Bmzhmj7wtvyzuQlItljvcQ7sIIrh72lRwoyPfBJNafenpDYaFP8MBVNpUpGlnpJLMj
 TQIbMJT/KCi9Q1cqeo1gh8JKdML8UXCfuoX4q6zldrDg4Idm6vCWLopO1WhNgTsV8j6EaAwQYC4
 gguSFGZQUtxD/ZAjBfQVSZAOKZxCRW/lfo1Q1Xl3JYqdrCeUCAs/3F3fZQCKMqokI20sYEo/69c
 RiBAF/Dqu+HwXUZAtPkHvw/nnTdyDnKG/3BOSZy2cfvPYvTJjBWNY4InkAT9x4STGJZx6DdiYs9
 COWMaft0vb5PZ5GrDGCLnRwGTr4PHIjded2Q0BnLyZRCBztUl6cYmWRFyCKBXX6ro2RNY8EB7lb
 9AtutPeHyqXUDAUn1V2EhSvYJyS7LFjDEWxSSaQXA1lX94fIBZPFeRp4vid/xnzWbIcCFyFbqnU
 OX+KZ1IgfonvyxraeQA==
X-Proofpoint-GUID: 2Zi7Ya9EwXslYKkPe6bYZFNcEHJSMuG3
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b40f35 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oUDkSdWbjXKg0EQNC7QA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55688-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EB13283E2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the kaanapali platform by re-using the SM8550
definitions and using the vpu4 ops.
Move the configurations that differs in a per-SoC platform header, that
will contain SoC specific data.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 90 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 83 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index df63a06b8401cd367c69ab8909af227f04bf69bf..d97e3fb18c3636abbbca3c2086c5263efeca3db5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern const struct iris_platform_data kaanapali_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..df906f6b9fcd80100872a12815036a3aad9e925b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_kaanapali.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -921,6 +922,95 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+const struct iris_platform_data kaanapali_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.vpu_ops = &iris_vpu4x_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
+	.opp_clk_tbl = kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_kaanapali,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
+	.cb_data = kaanapali_cb_data,
+	.cb_data_size = ARRAY_SIZE(kaanapali_cb_data),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
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
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
 const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..bdca1e5bf673353862c1554fb0420f73b3f519cb
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+#include <dt-bindings/media/qcom,kaanapali-iris.h>
+
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
+static const char *const kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+static const char *const kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+static const struct platform_clk_data kaanapali_clk_table[] = {
+	{ IRIS_AXI_CLK, "iface" },
+	{ IRIS_CTRL_CLK, "core" },
+	{ IRIS_HW_CLK, "vcodec0_core" },
+	{ IRIS_AXI1_CLK, "iface1" },
+	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
+	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
+	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
+	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{ IRIS_APV_HW_CLK, "vcodec_apv" },
+};
+
+static const char *const kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static struct tz_cp_config tz_cp_config_kaanapali[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+static struct iris_context_bank kaanapali_cb_data[] = {
+	{
+		.name = "iris_bitstream",
+		.f_id = IRIS_BITSTREAM,
+		.region_mask = BIT(IRIS_BITSTREAM_REGION),
+	},
+	{
+		.name = "iris_non_pixel",
+		.f_id = IRIS_NON_PIXEL,
+		.region_mask = BIT(IRIS_NON_PIXEL_REGION),
+	},
+	{
+		.name = "iris_pixel",
+		.f_id = IRIS_PIXEL,
+		.region_mask = BIT(IRIS_PIXEL_REGION),
+	},
+};
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 439e6e0fe8adf8287f81d26257ef2a7e9f21e53d..f6d8761daf0471d3aabec21c708445ee7698487b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -406,6 +406,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


