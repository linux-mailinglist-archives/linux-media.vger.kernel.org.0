Return-Path: <linux-media+bounces-53653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEJoNFAsoWk/qwQAu9opvQ
	(envelope-from <linux-media+bounces-53653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:32:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF31B2DFF
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43D373143F97
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 05:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFB9393DF4;
	Fri, 27 Feb 2026 05:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8Xr2FzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsSeDzHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580CC394466
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170233; cv=none; b=bM3Fqjk2knWW9YqLBF+dMgK8Ype+PCjx6qhe+7AtbhYjb117J9P8TahBt0wH3KI+n3u7iaiSM393n5Z21X4+yhyHmBf/q40Z8sNBw0Syz7CwunzBH36tdcinNMQoPlogFjFD2BpsOBkL1fVPlI8yQsl3WHQIFcuR38vBgDNS5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170233; c=relaxed/simple;
	bh=L+GHPQAqqBvSWQjUMi4LyDjW1xWjQwZbzVzgQjYpoZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHCA8fSUjUIf6ToS2+uCa4XSw2w2a96R+UFxeXir2eyOpUOiUGcYSR3DHsaF3usOUn1fTH2nyInEBAoLiBl+n83UcjPA06ZPIeXJgszfhfdhU+5wns2JQ87SKhpkqzEGeScYxetx/wEK+PXmh9bn80ZFRb0c6EtBu82zM6cZPdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8Xr2FzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsSeDzHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KhLm2354431
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=; b=f8Xr2FzNaUUpYxVe
	x8oPWd6fiRV5Uf0Z1BCQ7oKyv4u2/Or3U3QBUyzmYzk85UnjU9tPl+JDBFFuMaj0
	Y+JJT6U1tnoDM5+YJakDV1scKkFOMCf6T9wWYgxsVY++L5gaPGCbDfK1oF9BxMFh
	Kwe8ZlLRYeQT8CgxI+AI19UeKiJwhaJNrXYHWmyn84A4Lso2VbOH/nOjwtRGkQkc
	00NQSOIGNXB6yjy1OVE3eLZlgLzHUFYl94cvhoXXfly0qJwJut3h/NOZ8T8Eo2xB
	MO5VnHdVBT03fKlJ96ItM0PoCnUbL3DnkksR+E49gGPE0LbR2Rv+gnexbHCRA3xX
	hiXYqA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u3egc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899b98ebf47so59877046d6.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 21:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170230; x=1772775030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=CsSeDzHHkOk2cZtblgEcZNApcDIJbfrChLXpqV1StrYPJWydEQOxhZ0BLYonL9qkMF
         b9eXo0bE7jo2IEoK8BNTFZ6MdZ1OS05iyj+S5ttHISLjOstir2LhpkfICGkslSyfvnEh
         yapAwERJ5ba0CLamKp9l43jeTgcBOyxsi+Vc0DpKSdHhigSyI2X5mE1k3gw3w0VQw6fu
         GG/b8HD2qc2XPpvuxG91cFCb/SmRS//s0tYsYHqJf8knRHviFbCb+md2L0qKqnnZ3V/w
         ywtAUy2zCecd2pU6+1jsTXZF6CrgV4QT65Y8nU1Px6kjKYHleIYtn0P6xwGQ3rfaAj85
         Zl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170230; x=1772775030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvSftihsd1SbZhKDJ4Cnab43xZlVq5+abJE9Otkr5lI=;
        b=vKcIYivzyId/OhQho2VGnVKyIbv8IzJKcaosc7Uis7oPpxvjVzHoi7w5+99c3mRDcR
         eXJX6ydO5tYadYuinnG5HHiIYkpyTEX2Y7kinP+6150QMYHaRQhFWrj+1/otrH8s/Uxe
         oFMK1yunh+sQvMrf/Ltfxbi8oD2b1+1tGCjEpd13X+PK2Le8ISfSw9x5EqANxYdJ4C+z
         /ihK7YJVvOIR0bA6nNY2FL30ZNCWlZukjqMaGikkJNzlSKE7jeeBDjhzFhKidMWkO9rC
         JUF+wcm7cBPqw+xX2Dxe+SHlLbbHjUQGauAW5lcdaOYNhjFFCY+x2kLNhr4IIwSEUxv7
         qFQA==
X-Forwarded-Encrypted: i=1; AJvYcCXr0Jw/OtmB9ANXIOQuJnfy57sIrIJ1Pthv5wJKnmEnOk5VujQ4zWwILm31tVucPuQCIzZVEABoyKrGGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv7kLlQiUDndRmvRr5Oj0NKVYwaaJvpjr3rTgWGcK94RM7A1ny
	6aKAgTdWXpknrx4/VJyVYopE9PSW/YyuAEFDWkeNHUadq92nE9mFFlXLnwcbj7HbMY3BTgrEar7
	Qxd4eMQ8zc6DKB5+MmVX4Rv6vixoIFH4O0VExFcTmngqhnEmB3JqMI9xdBqCs+mjblw==
X-Gm-Gg: ATEYQzzcTPxDNzD/6+PF+lJ7xEXu+U5XVr1GsHKDDE2ki0kQebsbgjFCbbPAOjZU3hf
	jTPv2AOLgykxHxXAb9ttpQ5/3at75n+KbgMPIN2FGxgUq3cD8eU0L5Qo6YRTIznwFWVUTNV9WGN
	SjkComWwyPsoUzt+ao/NlvpFw80EiB3LERZw2YsKYFKpuzrcfNRI4JNj4pk+fH7n9p6fJCUDbRX
	24eDO+ilOO0hf1wHOm9kyX6JwzOv51H390oP3u9WcDiZIl9cDV6O8zJxt3hQ0SWZubWP++4XW5W
	lxHi4rxs3M3EmXTlWpLVwDX4xO/QnV9VYNeDhIvy42ejoZy5vWHxHPr7E0OEtKsH5kOdz/jgqZA
	Ucd3IWLED+yE+PlABcpoCCDEQ3GjFhUuu+Nbg3dt+hvExMTTkf4pBbQTXHeYMCyMi709ZxW4szf
	JdNE/nKCu1tNsl
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172596d6.49.1772170230455;
        Thu, 26 Feb 2026 21:30:30 -0800 (PST)
X-Received: by 2002:ad4:5cc7:0:b0:899:a58a:9039 with SMTP id 6a1803df08f44-899d1e54365mr27172096d6.49.1772170229863;
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:29 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:40 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT
 overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-2-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=4071;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=L+GHPQAqqBvSWQjUMi4LyDjW1xWjQwZbzVzgQjYpoZQ=;
 b=R1BoEM2l+QRSFpo9pTovfM5KoiIDRXx2uUsgGfdRgEUDSF8H8uiABvrCgwwc/W423s/QelVym
 64Up7FeDSNLDmbaDkBMueu6bT7p5OQq3N7O1TftR3fkweIMJ88WlTYf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX/oCBHvCeseqA
 z763lxoAUv4FCrLlXBwu3M07m0Lw0k1+nzMash51DaDJxsfIjuV/eHA53hRUAAmDiaxA0WE3r/g
 5CoEihGop1F1U3nZ/mytAqhA9ZpzfyAWSzGXJCaQsI5qeAtyet2tu34MdVQ84P9y1ju6ZsYjjk/
 ubf1Ly6qLLZTNVrmKhjKg/U0EkKF6FtH4oaxGMKwpsuEVtJF72va5YDA1OS8lIWWmoeG9Gy/kDS
 hWtyGH1aOQ8UK+Ffj4X56Y5ylM+cGO3V9Yv1Q9/nVmtuTHsrdAau02c5NYaflvT/oRVjPbJ4T87
 l7tAKavEyxTSo8X60MHuEcLh5mvi+Ksq39IdIAOa0RUCvpfDm5J3Zz/+kUHKQmOt2Q5QWSMWsbX
 LcP4Qs2twDMl9g4g66IQ2Q1pfJuykRDsVio6qD3V47f7zepQX796rqyuLta6RTNl5mbZD/fowLz
 iFkvv6bQiiQM9ehvJQw==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a12bf7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GnqVPrpTqDTv7ixMMmsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: bU0SwUxLBW_OGESGKEq2o5e0Kms2NeiK
X-Proofpoint-GUID: bU0SwUxLBW_OGESGKEq2o5e0Kms2NeiK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53653-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,1a:email,0.0.0.1:email];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35BF31B2DFF
X-Rspamd-Action: no action

Enable IMX577 via CCI on Hamoa EVK Core Kit.

The Hamoa EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 317af937d038f5d8bb5292db66c48625fd904793..724e3c4524e9fecb0719f5297ea19a1fc7f5797d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtbo
+
+hamoa-iot-evk-camera-imx577-dtbs	:= hamoa-iot-evk.dtb hamoa-iot-evk-camera-imx577.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f45a7fbd14b1f6eea994de5d15402106ca1b5e79
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+
+&{/} {
+	vreg_cam1_1p8: regulator-cam1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1";
+		startup-delay-us = <1000>;
+		enable-active-high;
+		gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&camss {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csiphy1_ep: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 110 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dvdd-supply = <&vreg_cam1_1p8>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			imx577_ep: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};
+
+&csiphy1 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index fccf1d1bdc6067b33e264262af3c4bb64346cf1c..f44f314b2192a131dfcbb0358d5b85a9e91fd739 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1274,6 +1274,22 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	cam1_default: cam1-default-state {
+		mclk-pins {
+			pins = "gpio97";
+			function = "cam_mclk";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio110";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


