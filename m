Return-Path: <linux-media+bounces-62821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ApKOrzWFWrRcwcAu9opvQ
	(envelope-from <linux-media+bounces-62821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:22:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9885DA8FA
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9123301DCDD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B6407CC2;
	Tue, 26 May 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0MDOmS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hI0zgWXx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB8410D1A
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815643; cv=none; b=uXmpkDCdOBwd0qyzDpvpL/jQufKqhivVbKYOak++MkQbuEkhFVLCZYBsqf+bWIIXpeoVwmxPU7AuRxRKR9G4XbXd7eyntYO5oOinHFO5gBn7/Ld+v7aYi6AXU/QvgwiJxHczRTKFQ1VWDeAEk3BLBigYed4wfyQ+JpBdMV89nM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815643; c=relaxed/simple;
	bh=xImboLMczBQdAyz9gWg6GBSKFU5e9Ka0KWu8CeYxrCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3l+AAPQCRffoS7UExgadEz5V9VxowragV/T/KY2RKL/HSDv/4d3ZCK0x1m/LQC7qbklANI/KVN/NcWuAChauZlCinX7zn4lYbDc9TLd+a92Nie7oNGzsnvhvLUYKXCJAcGWhjfepcU4kXHzX7/aM8YY7wr83Akt5KjpNxX6JpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0MDOmS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hI0zgWXx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0r0M3463911
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=; b=b0MDOmS0Tns7Ipev
	je5IjoPK0TMAWlL3t7B/nxGR4YutfWrB9LlEW133f+2bw1YD7Ja9s8/1IkczJ2QW
	/UR2wpjOCqFqZDzS1B4HT60OysDmLVLhmQ/V0dJBASCq0Ho1uqwamTI1mArgIgbM
	0zAKf6HiG6NMeJoXLxArgLlmgsdwydanj2L00T2M3iT8JLU8Fnw/9x4I4+6Nfxmg
	DKRHEGFxdHw6hYCPNE7rt/ioeLgpkkhk2H+XBFIjhn3OYZ1tHPiEYS02CMQEFU6H
	+9IyJLnBM9d7h51gP8xvZIUUqby0JL73Sa/YiZaC0QeaQXSM2B2BgSsewCYRqmPl
	ejjDYw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentgcfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83ef22f8e8bso6981888b3a.0
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815637; x=1780420437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=hI0zgWXxqv8E16m1Ui0kvfjBJS4SWbWa7tS0LbNdQsvHVUDI1nbZBcLyNozAd5cdaY
         vpZ416A0Rj7LjC4F4oVsYuO1ajJnSLtFCVIkD5cVgnz+Or49PuCbRKc7OtntcN1qMqEY
         IhZaMq4z5O36zbcLM3uhu00Y3xCprwCzzcxqAfcaYGydzbJMp7l2NC4hl3eqqk1lrhjV
         3Qcb3KxfKtP0oieQhqg6zQLbsGkJsLIq//H5jipFMtfY6XMyjOnmhgyNnKeXJgXGBa6C
         orEciHZxvK7TBz18onqiLqMEoFT/23yxLTFLr5DbJI9KuoIWk0EIcYZdftwe7vgq90ZF
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815637; x=1780420437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/VpYFMMpLLmKzbMdrg0+lrYz7OLrPF5tO36GfEIMoY=;
        b=A1aZtUpwVmH678SXHKK/FDuYVhs6RbHrjmnTKmITvkJd13wKCk6/BHCTRb3al+6bVY
         25DSQ3C72SFRgMeAN5OYhPO+4JLexQUS56NJIHtA8B7fjX8U+gRMG2xnlHoSH38QJ+mL
         BegfDDez40ppc5QtC/P/PQLPoZHwoS8bCvX8JvQZ3q8HF5ZoaVs0hK2gOKQaOo0qLe+J
         gBcjLa8EufT6P+rN1UsX8JGsI4wsdSmdZYS305aylTUApAT3g2zPNoPVTHRY/wCRkn5S
         DuvYaBLlFLJzigFqRD7cTTnCwutgVeSZElmH5RCLO5ffmt2Nj7JBa+LmXtKT3EVw91tT
         wW/g==
X-Forwarded-Encrypted: i=1; AFNElJ+6YdXocogBFGyhhNe68FOEE7xUxy3No0Na5DEmkX2nw8m3byy4nykx4L/4yLk+e5pnowdKqPew9ySaCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygkMKzrLkV8VmZXKnX0f8IDuY7MEy+vaMXPgJP6bNY7naqAmur
	LgSXiTLyqmQG5eYC834lEpGCEEduSFW+J/f5Zlb5TLwEqg+WWMgz88Om5QZesxZnziC7WZT2Rfl
	4doMx2ZY3XGunB8h/NJ1V/2IrjYRLLg+h0D5EGsPGH4FwFS7Or0zm3a8bRFX1+145RA==
X-Gm-Gg: Acq92OFhUnf12sH+SUxRxxe7gC2S5lohsHD+6UtEkDSqhVZFqs+zaygRbFqYUPY8OkA
	oyMdUBbpqtBEsA4BT8/n3rHIMmKc1EqmM6H60EVkgkQwXcKhWQUStspMcAbxwSNet9n4Y1ySbU5
	UC++fFVd0QcPC6J47qrUQY3e7iYG3Qmp79vpBRsewy18VfhBxAiONwnpKpl+XIVhWoEdWoBaA/a
	PpJzId+X3aiTvYu/nhU/YuR9Q61bOzIcfnqCPRlZCl6+hdhRV/ExhEPQj9dFGgdr0dwSMUiri5o
	ObMfk+ebaI2Cb0AOOe23mr1s4X4I9TEpnJoZ76a5izLXUufuZLgaY1Ih857GThNYUljMlEv5RZg
	RJlEyHRgPEWqVqi6lb6pFoRSIdFd6kwhpGue5ejdCOMQzsWzlUJ6N
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369704b3a.8.1779815636579;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:83f:638d:1e64 with SMTP id d2e1a72fcca58-8415f580e40mr17369687b3a.8.1779815636112;
        Tue, 26 May 2026 10:13:56 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:55 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:52 +0530
Subject: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT
 overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a15d4d5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FHwBmxWp57AShg3XVyoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 9LRsnoPX255dXip_DFHVEYlu2gxbrrJR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX89mBCoQxAYCG
 X+HCi2iOzLFLe28oSiEyebs1E42xj46ZSuWIgduV3/J8IA+MPYYGxZqm0c5a28BvVKsXeyEEMoz
 NVfPJ2dJuYNgRqiyaUGgEtKZzS4eCCv7jeqB1HWWAlzaczWOxGdPBI/7HC7+95z8aTnjHY83u+r
 4tXtJglCpXxvKPSYOeXQ2YMptqCFJLjIB7rL1Bdblc8uAX4eWq7ckY4U9Tvbl6Lz548Tl8Kufmu
 GP+FxV9SXeNInKmb9JYSk7HsJe7qGX4ac5mvydo4kC/TUUODkpxrc7VqavR3c07Lz6/hbIKzNYO
 Vh94jdwxmQNCLNiJNMqS+qpa8aDCnR4OSfIfU05Tz4GJcR4RIVSXYFsUOmjMBKUXekwVNnGmHUh
 3qNBOeynZ/aGPefRfqPUUxiSsOg6az8I2UKszW4GSghdvFDrna3w83TuZH6armq4uRMl1dy4+BF
 4mbsY/PqxlvEzjOguUg==
X-Proofpoint-GUID: 9LRsnoPX255dXip_DFHVEYlu2gxbrrJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62821-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.1:email,qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,1a:email];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F9885DA8FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index df41830e18edff82893ca24ca84d7e03065d0ef7..2a728c975a38f700360e317307036efb0968a00f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f0423f1ab4e93abdcc7cad8977b39e31b2437e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&mclk1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


