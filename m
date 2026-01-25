Return-Path: <linux-media+bounces-51492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAZ5J1ohdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:57:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6BB80DC1
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A780B30094DC
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B265A322A28;
	Sun, 25 Jan 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joTNN08n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2KhRw43"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9303233ED
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349458; cv=none; b=EbIYJ+/IFx04XHA+61bUJw7yB9iUAyQ07+PNs6hfBo/OnPPRAgrHEP115oBmGZdXuU6dAKdf/4nI4XVSneKLd9KieUPYHI1MO4Xq2mBRShiSPAh7EkXARP5erY7n+3KWo5hTltHhJuzaAlRXZ2KHzEyOrwA6hPg1su0mDXFA5PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349458; c=relaxed/simple;
	bh=hLnX9O+jNkWp4eIwqeLrNV1GLUMHqOPIj1AAiPtuF4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJt1HdI4FTe2EY8+AZ8RxcxDiOszPcuiX3R+uJTV4FC8b2rlaoGx9dMhj3OGpBJZINBirstA+9g6tx3SOzYFYidgs+di9CkwByJSgV53G/jsDdmZhRSTlGKVC1oqAdP+YAW0iqnZncUXIm1rdtLzKzAV73MfJBY+kYWp2oG9B8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joTNN08n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2KhRw43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PBKGLp3479783
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=; b=joTNN08n+gyeI9Kl
	XWkaHIxHzeQURuqQ15D/8+dwwmKnC8xTQfSCJqObAVBJfoNHkWgaWvg1gzu4sAXU
	ZLPU0IgBOhqn5FfW1pC0UICiuS8LEqQY3o5xrS0rqEy8hm8LbEQJSYOzi0Qxg6+c
	3/QsBqH51k+0aDyDrtpDojU++whTsmyUHOdG44TTYVMIsu3mWFGTvlIUIfKba3nc
	cGajHEtfaD6EQV9+KG0VKvTUIAlF/qDJ0YbV9inYPIVE/wIWCUBePRRitRNLM23w
	AFj0oZFL3uReFhjcZzqG5okZxwHEFrJtThp+j974Iq4TDm1iguK+84xQVq4FnkdX
	pV2D0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj643-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5311864d9so290149085a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349455; x=1769954255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=J2KhRw43OLvLRdb8pfJ4fqBzocPDcoK2GJDuWN0qyIOu1LBrFsXONg6gMdXyD7hI5z
         2AyDnQuLuyC0ZUoFNRzo5+W1BF7wMIWiICxHclFCPXknI0XisZIIBiVn0coKkxwsmDAu
         qHS8tw6W+ITI8VHKycEdCnVaCFdbMYwY6R79+Zs8Ris3FBr3Lwdv5cksGBbh+P/qbfpL
         tuu7F6s7LA2WUntBv22ufr+YOstcY3DPwe0MWA7l/YUTt0kdpkE4LqacfZm45wxtgcWn
         64YWfk/OF9L7h/U/85tBLw9BEozMO0watHBJ4mHPlwf29OGIh0L5v5WMWKWHH9nJD6qU
         H8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349455; x=1769954255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKNJUo95dhWW3QqNfHAa9QPKochcB0AESW4u0Ff6SDY=;
        b=FLF7rnJl36OP13a3GsukzQw7oQu+B5u/EOVxM+tzBk1aOly5i0MIiTBXu8tNw6JndH
         tfzWtN766B4dqBR1D11grgOT3IlTsLX9Won+oICnJzCYKbRQeeDeF0lcjfyu9Pg9f75H
         L22GAkBdo1XAkpMX0EyOOcANstQtIWu6TAbPx7CJRIuXN8/6gxHm2TK4UCoEQf76BUD1
         yJP5sfpQ6OLYhrg+mHd0lp3Uvv3yXRrEWAUJvTqzdS3Ch1PFstnZgobv3A/FJEBl0Ra8
         Eyz8Hz4MxCYK2JSadAwC6DYyqh/9/zs/7JQdic8wIyOntdWgADpkk6L869f4+Hpvk+JK
         axUA==
X-Gm-Message-State: AOJu0YwgGovlXdLsrDZWPiSf6N5MsFbBs7skHqlDbTtxpZUnaJxGY1CJ
	Fzoyg7/QaqRPpATFZ4Tr2IQ4hoVLyBXJhD+EO8IFKBMCD9DjD1LD2dwo/2H+gwmn83AGRBQ8jTO
	5s8WXshpKQQ8yxSqGQ/w/OzOCy5Y3jl+JYTTZOw/q4cOGhmMyEHEtxAXPzYynRmxXyw==
X-Gm-Gg: AZuq6aKQogvA596qrMl1b/XadHhxFHXba4Dj3Q3N8z1lmBru73/d4EbPODnCfyl4NWp
	fi+E+npdivkI0jmpb/nNuccmPgWtPtZz5q8a6bhAAicInkJk0g4rNJuzhpPk2Fx461Ah4Qhs3jV
	suGRj+8hy+Obg6SpgaW3TbWl2IVfwzodLFsVsxnZg56oSv8LOjPfThaARu68sjqpJ2fl0kDMf3D
	kiJtFVwkO1TdI/bPHMOvT4/qnQOmJzByw5OpfBFs3wfExp2DezHxA2/ryh9YqqcNexjCMbMSdhR
	FNKVAzYWoQdw1YAEXoQTWyYdM/4yO3Cpp5JA68enxoDucx3+4aIt0fPfX/X917FCNWO75VPzv6o
	/rNGYwulESOz4FYzrBRSBxAJMMoJY7uC51FSYVjst8j4UDcIHrlNROEH5Hw8mysgi7SN94jXfqz
	tJ7YU2UhaEs+lceSGX78u55H8=
X-Received: by 2002:a05:620a:2982:b0:8c2:f72e:5456 with SMTP id af79cd13be357-8c6f9670bb3mr187367985a.90.1769349454686;
        Sun, 25 Jan 2026 05:57:34 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8c2:f72e:5456 with SMTP id af79cd13be357-8c6f9670bb3mr187366085a.90.1769349454243;
        Sun, 25 Jan 2026 05:57:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:24 +0200
Subject: [PATCH v2 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-1-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3992;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EyYfaE2Cufcr0C/0jDHR82fWre92I+G4XxMx5Yzq/OM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFFUL7+QmPyhACJG0l8DP5rhsey7dvwBP1U/
 EHoZ60ndV2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRQAKCRCLPIo+Aiko
 1fo6B/47UCalapfScj2qAkADa1BM28ZwUlDUnpXWEY1vLQ8wTRC5AOOFAkH3HoC6QGO7v+eC28i
 gGUroPlpOJnvYF2pErRYhMbQ2qbEFP17JVB/tqJc/Y+8m5pCco5GSeJX0tf8cvQry6+kHuVSL9G
 rKli6yGN4JqabCin9RhSpNOVBz3kviQiWkFD4fBkV251bN3mzaetIfjGxCeEtstYVYBk/ourEHP
 z00uf1twdNeJaDhNjMIs45hWEvvnr2jKq6g0IRT3qDcXGbaorw7M7EcVvW7WTs4kBJOdU8E8iMk
 OfNDjIwpU0wh/gi7lK22Ec80APrH1snjV8YI2XF9wftKckPl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6d2C0Wq_X5GeqN4iU6vKXFlWpPpuRcWr
X-Proofpoint-GUID: 6d2C0Wq_X5GeqN4iU6vKXFlWpPpuRcWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNSBTYWx0ZWRfXy8hTTEHKWsfY
 XqhFWcb3iAhFybCgvdkrjjJr2OBn0j1xaDAOseLUlOJIFZ862/yMYGmCz5LYzRNsLPZa5iG3+Rl
 4kG5kr6ChP7oF006mKl5y8ZLDJ/Rn6P2n3cEaxf6sp7tQOthvgFCjye2IBu7rX5Qsptk8VKZWLg
 ReWH5lSLZ9d0CqNiFg1XqElRG6IurmTt3D2NTsjjweB4yZ+FBBW9FOiRt4hwagIHUj00NbuND/w
 INsAmydXQ9TbsUVf8w8X0AC8+6Ss04B7sXtc42ueGorK4d1miRLt1CouK+mJl3cwL7xYpY04C9W
 hJOcNyjzGg5haU40AUYCAQSukBO8c5bVMhx9+8tzP+o+HQz1w4zj+vkfUSKZxj0iKw/ozdXEiEL
 mzIHRAaOaw5cDYaH1QcSeIri4nSULjFc9nMaFs1MCY7V+vqSvcJaSCQAtWzCMO87Jd8IP+Mx+bD
 6vPYDDUyouU+4b7UOwg==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6976214f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gdo2EkX-Jlq9hQkSyREA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-51492-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aa00000:email,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A6BB80DC1
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Both of these SoCs implement an IRIS2 block, with SC8280XP being able
to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
SC8280XP having just 2.

Document Iris2 cores found on these SoCs.

Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped dts video-encoder/video-decoder ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[db: dropped status, dropped extra LLCC interconnect]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8350-venus.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
new file mode 100644
index 000000000000..d78bdc08d830
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8350-venus.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8350-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8350 Venus video encode and decode accelerators
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  The Venus Iris2 IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,sc8280xp-venus
+      - qcom,sm8350-venus
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: core
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
+    #include <dt-bindings/clock/qcom,sm8350-videocc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8350.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@aa00000 {
+        compatible = "qcom,sm8350-venus";
+        reg = <0x0aa00000 0x100000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core";
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+        reset-names = "core";
+
+        power-domains = <&videocc MVS0C_GDSC>,
+                        <&videocc MVS0_GDSC>,
+                        <&rpmhpd SM8350_MX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mx";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        operating-points-v2 = <&venus_opp_table>;
+        iommus = <&apps_smmu 0x2100 0x400>;
+        memory-region = <&pil_video_mem>;
+    };

-- 
2.47.3


