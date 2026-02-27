Return-Path: <linux-media+bounces-53722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFyRNg2ooWmivQQAu9opvQ
	(envelope-from <linux-media+bounces-53722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:19:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB31B8BD7
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 15:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEE07314F0FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCCE41C312;
	Fri, 27 Feb 2026 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KA8aVTVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYysR9bx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709D841C2F9
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201517; cv=none; b=BQLsYa92vWez5dUeblr5lRrupv73syk3WDE0BpQkdNq6ZPxqtBZwT1NEQDyo8S9Ua0ZOJQW/0C6SfcYHGffECL72D7q9rhjp7X13/9mmzxqvvgrTJuGjKIkFTyhKLJ2eear7czADgxXggcFISahCq8KrOTQg9R70xiZ62RQBNmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201517; c=relaxed/simple;
	bh=1aBMCcY1sqcA9jMQn7X5NDB3KeM+637v1CrgagGc2fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzgAjNrq81bpZgecOa/4hKcHDe5z2UpO0kyAVwADHcd/0Ot4dmW1c9aq+pn3pXWzkAIAyn6N/bWORClXb3S58huw0oVyRa9KYeI3+ogq7dyrbHEEWE7LW52DTKVVdW7fE48pJYyjo3XF3P8Oe27V/AEfuZdoXYWxlfWl5nlt66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KA8aVTVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYysR9bx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9WA4v2439935
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNreSKpMBXmExQ7U+u9+2z8gWvOKR9ypkAh/cPOqOt8=; b=KA8aVTVTt8zS052b
	sbPf59v9b5JaRELN7DMyK0iCP6tj091jGYPXGavrC3+cJkpRLCr3EG0x4qmxkRK3
	u3MlOV7xRBgLGkdK7syoiG/0UAQseHo5rdX0cWjaOpVo6Aw6iKbk/0Qs5cLpOg03
	NKMioKcWV+mmKVvSr+3qzJ97FW7QvbDM6hC3vQYLvYkRl9Onh9Ce4a6AP9uhdPqO
	cGEzneN8bnkFwtMDzSPnKgAyhMhAN3i4gCTXbSDrFYAUVVsUeVuao7PHPYq0izbC
	PQoyXHywu9b6w4ca2B6xOHC2tgUacgP7TY44a35TidUJKiDtABeCt4eJ5iCasO5s
	VFEaBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r3mt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 14:11:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae146bab0so32046385ad.0
        for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772201514; x=1772806314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNreSKpMBXmExQ7U+u9+2z8gWvOKR9ypkAh/cPOqOt8=;
        b=KYysR9bxx1x9Lq3JSf3Jxft6G4LrdfV5ZAn1DdjvW1YLHufGsUyZbKCVhHJfV/WINy
         FgmQQEzqjtON1BJQwNH8e0xCR7xSr2kyMJt+aKHLma+6odzaQ9JWZ9LplaKlr5xgKf35
         dQGG5sFOG41o1lpZDNTJDANA6u3iDCTpQHouS2Oc19oMZu+7Ixe7qVvB3kOw3f6KOEou
         tbZ+9GCIF8Fa75v4iJ8RdIjw/1xkEK4Nbj9UnGkHlLEn72ahVGVgTkxm8jhsoboFp6mb
         pdqX1FmvYlE8K4CdZj6Q0gi4brIx55HPErNspICGrBIHWd0wiTs2z9vkYxTFjv/S0QEE
         /Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201514; x=1772806314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qNreSKpMBXmExQ7U+u9+2z8gWvOKR9ypkAh/cPOqOt8=;
        b=FhbQQib81ajylpjcJwYl2U4U8A+405y04703bqUS0dzs0QU1ptx8BSaPccHMTnIKKn
         e7dfIaKgh8Jss7A27OrNI2caW9scF1rUmpx5IzMZ+YewI118Ypp/JpSJ2Xa05sYi/jxC
         iNnRAMKPjuYKjum7G9EwXqyIQKcEA7ohQvlqT7br0Vs0iPrFNCBj5FPcicm0VkeIcphC
         y4sMwqZpeHsbf5TsVa/CXXAQNVWK9b/mnhP0izGtrwYDzcQ4LNWjOvRLXI0gXXSRStsy
         Xjs88kpYZrKLoUCYzLJOxL/w0sSeyaqrq5hd9CLkcQT4gIRMcXbl2Wmk1W091KsPJ1zY
         oK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNzNlwRhNUoN9abKRyG1wioF2dMUcfIGHRMyP93KueKMOiFgcyF54WltjY8ewDKJ95iNjEfZqXBIl4lA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCV1QsdStd81JZ+h0GGsW81Bk2qnhL6cm6a16K6BB3OpEkqyDQ
	APZHb+V15jodCxVHTkSlZN/QuMSgiRHbnxqMTxy1XdYJNLWhG92dSVz74cngqwUYEBEqaBluRo9
	d2w4qM0J4Txg8dTwR4idp2VgWEM8Ej8INl5MW+2K7OInuiFsi9f8DlrsjkPmTkGQf1g==
X-Gm-Gg: ATEYQzyLyfNiZCXBCMSi8FUHTSl9s+QmwxaalxJ8IfUqR3WTi6nIC2XW8mo/3JG2I/s
	1lng1BRHxwwS9GFPCOE7Ckle5rihT+cBCPHveX9L30+mVuypfcoflqHSgIjrm8+qrNc+Fj4EBwP
	9mFjPWWVfuM4j8aivUFIfkLcMrs+4O5N9ZO4efAXMzDWe515wDDgvR3hWNA/6FeKjSIPy94hHzm
	NiLl99qB30gqLOuPtHPqXG+7V4tT2CZtJT4J4aiDVNJpQtF/4ONpZVN/InmsAg9bLMz1DnCXSge
	34FvUwocoJnWOJ5hnedco8Sp7+ms8Cea9HfeLirTtvW+wmGDW2gfmXYe1OzYgsXyaaczjrCf/ti
	fq9DoDHHbwXu57JAlTFdTgkQ016EqlET+SAlT04J7AgaONTifWqYtd/YS
X-Received: by 2002:a17:903:32cb:b0:2aa:f469:fa32 with SMTP id d9443c01a7336-2ae2e3cd315mr31224835ad.5.1772201513871;
        Fri, 27 Feb 2026 06:11:53 -0800 (PST)
X-Received: by 2002:a17:903:32cb:b0:2aa:f469:fa32 with SMTP id d9443c01a7336-2ae2e3cd315mr31224345ad.5.1772201513202;
        Fri, 27 Feb 2026 06:11:53 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm60960865ad.24.2026.02.27.06.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:11:52 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:41:17 +0530
Subject: [PATCH v2 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-kaanapali-iris-v2-1-850043ac3933@oss.qualcomm.com>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772201499; l=10552;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=1aBMCcY1sqcA9jMQn7X5NDB3KeM+637v1CrgagGc2fs=;
 b=BWjeUWe8/0pIWJeJQTN2yyZJaY93nRdcG/SYRgh+BJ3XdQuJOyKh29etEYtDB1W8ttjQhyqI9
 B0BE2Dm6jBtDkquTAY5kfMES3FqH0StLneUPCoPt2/qVumKz42CM4TZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfXxvD/eXqyOITJ
 BRpLmyEf+6sarTAZ00v1KOzzWTkkqF/RvHCzqafCQcAkdIeHzcVmIAnzGjU6q3ra81g22cKX+SU
 X6srlR+jQEaqowFlT5LkagnezfkH8Kg8GStQtCV3FlYK+sF4a5sBWPR2cwDU9B1PleelB/vNq2o
 GYLQUbYHL2/3Kj394NvrJ3HeiHYGC4LzrCvIQqoNvd3xabU5Qho9umPn5jtKEXKoeJC2ygMx1kx
 hzXas4U2o8r2qtPd7ENP1a+E4IRy8EFdBqiW4yUm0s9zpT4aV0e/BwUU5sVT6b6Z4iRzQPJeo67
 FR+Lu0l4I/nwjQn0xlhTKjfIqBiqACcY1zXM3crZLRC5IMxeQCCqEiXJLYcNo9NQLkaOEcdcq/N
 LmRcECcXvwZd+wCgXQ9JdkVtddLZjRgWohuoI6g42kcUq8cpXOqXDfh0fECicXzIQA0Qxh6fsg6
 M7GPXE8yjUnRikAuvbA==
X-Proofpoint-GUID: r08pbJnPGaZpwxgYuchBOqblyQoMers4
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1a62a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Rh-vyvfIvcITaNYUV7IA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: r08pbJnPGaZpwxgYuchBOqblyQoMers4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53722-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DDB31B8BD7
X-Rspamd-Action: no action

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

iommu-map include all the different stream-ids which can be possibly
generated by vpu4 hardware as below,
bitstream stream from vcodec
non-pixel stream from vcodec
non-pixel stream from tensilica
pixel stream from vcodec
secure bitstream stream from vcodec
secure non-pixel stream from vcodec
secure non-pixel stream from tensilica
secure pixel stream from vcodec
firmware stream from tensilica (might be handled by the TZ / hyp)

This patch is depend on the below dt-schema patch.
Link: https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 261 +++++++++++++++++++++
 include/dt-bindings/media/qcom,iris.h              |  18 ++
 2 files changed, 279 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..db734c664a0417d8f5ea55b066f63f42583b1c14
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,261 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm Kaanapali SoC.
+
+definitions:
+  iommu-types:
+    items:
+      - description: Function ID
+      - description: Phandle to IOMMU
+      - description: IOMMU stream ID base
+      - description: IOMMU stream ID mask
+      - description: Number of stream IDs
+
+properties:
+  compatible:
+    const: qcom,kaanapali-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_apv
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommu-map:
+    description: |
+        - bitstream stream from vcodec
+        - non-pixel stream from vcodec
+        - non-pixel stream from tensilica
+        - pixel stream from vcodec
+        - secure bitstream stream from vcodec
+        - secure non-pixel stream from vcodec
+        - secure non-pixel stream from tensilica
+        - secure pixel stream from vcodec
+        # firmware might be handled by the TZ / hyp
+        - firmware stream from tensilica
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      $ref: '#/definitions/iommu-types'
+      minItems: 5
+    minItems: 8
+    maxItems: 9
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 7
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - iommu-map
+  - memory-region
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,kaanapali-iris";
+        reg = <0x02000000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&video_cc_mvs0c_clk>,
+                 <&video_cc_mvs0_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&video_cc_mvs0c_freerun_clk>,
+                 <&video_cc_mvs0_freerun_clk>,
+                 <&video_cc_mvs0b_clk>,
+                 <&video_cc_mvs0_vpp0_clk>,
+                 <&video_cc_mvs0_vpp1_clk>,
+                 <&video_cc_mvs0a_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_apv";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
+                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
+                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
+                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
+                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&video_cc_mvs0c_gdsc>,
+                        <&video_cc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&video_cc_mvs0_vpp0_gdsc>,
+                        <&video_cc_mvs0_vpp1_gdsc>,
+                        <&video_cc_mvs0a_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vpp0",
+                             "vpp1",
+                             "apv";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&video_cc_mvs0c_freerun_clk_ares>,
+                 <&video_cc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533000000 {
+                opp-hz = /bits/ 64 <533000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l0>,
+                                <&rpmhpd_opp_turbo_l0>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 630000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,iris.h b/include/dt-bindings/media/qcom,iris.h
new file mode 100644
index 0000000000000000000000000000000000000000..beb244289466ca938c7e5fe5cf15526f606a3a6c
--- /dev/null
+++ b/include/dt-bindings/media/qcom,iris.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_IRIS_H
+#define _DT_BINDINGS_MEDIA_QCOM_IRIS_H
+
+/* Function identifiers for iommu-map to attach for the context bank devices */
+#define IRIS_BITSTREAM		0x100
+#define IRIS_NON_PIXEL		0x101
+#define IRIS_PIXEL		0x102
+#define IRIS_SECURE_BITSTREAM	0x200
+#define IRIS_SECURE_NON_PIXEL	0x201
+#define IRIS_SECURE_PIXEL	0x202
+#define IRIS_FIRMWARE		0x300
+
+#endif

-- 
2.34.1


