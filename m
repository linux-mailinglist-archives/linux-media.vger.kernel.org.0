Return-Path: <linux-media+bounces-59756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEeBHkcx8GltPgEAu9opvQ
	(envelope-from <linux-media+bounces-59756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:02:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3047D4CA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7234F304A88D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 03:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C67342146;
	Tue, 28 Apr 2026 03:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YA/bPEqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APSC8ApT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4833E358
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348643; cv=none; b=WP3VRD1mspQWqRxKRONHXLiUC5l3BKpPHy3rMv+bOS7vCaxl3EN9AQpVORhnZOg87uh9TuxqWFff1dvBDfPASgjoyfaQ9bQysJNxOEHZWrkd83Sm2Umzy24vqVd+jYV3V1kyjj7/Z5Ra9/tpJNvC6yC+2Ep5ukQRvkf3oVuLwFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348643; c=relaxed/simple;
	bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S16f+H0EDkkfOl2hd+jSjZmhQDdZWiYRDbWkL+SAFozXbpmDvPQc1ysQq6xzUkbHkoZwFN2l6oG2xYYDbtvDQGfg+T+aAiwswUyY5gYZQUrEz7rs/ebrj4xVtkmc+8RZQrp+W0wY3kPJnHOzISdPoglVcueGDybrV1BPvv21F+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YA/bPEqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APSC8ApT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S15Ux9440726
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=; b=YA/bPEqTPpaqy6z+
	L/onEJNoGCRkZAY2mJtVMUPZScgQGh7S9TriNAYK5BnzSn6Lv67oc1gJcVAWAbO5
	njI0X09HDSZ8uMSrVYUgV10xsF9kJAoQjntHGi5xKeVd9Zb9UbIOP/q4PD91pxOr
	I8IkPnUt0PFCS93kc6IY8M5JxCXjkdnndMFSDXJvt11ngNEsjsq8F3B2yJNOo6dA
	/QbzGH1ux/XkSS9SrcZOsqhZAHrM0gAokerNkQm2eesRkStzusC14BmH8G9YCb/F
	eCCJIXnA7aUl3q02PgvcIKZhO71QJo+uBLGPnU6KPnvBlOcIdb0+quynKtbJmpX7
	C3kvJA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac42gbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 03:57:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so11856577a91.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 20:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777348640; x=1777953440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=APSC8ApT/WxGYaM41KJj+2rNHLys6aH13mwL2EugL5IpeloKsSk9yaB4c+Eo2Q5AQL
         K7TnIcNxdkLcF4kUbg7gWSm6Wu96vRIdQokVG715OubdYdwzDRg339vVpNK8DKipkor5
         SoGHGvbeZLnRUi1atcWrRzxYcCSEX1NJp+4fVHlzDywA35hovwkzTElMsTL6ji48EvNU
         EA9HM+HTPObMFbbfhBSD+buvp4o5k6Gu2Ai0+9bJnsRQsR2fC3Kf3oKsXMFqFLxx/b69
         37K3omAbMpNk8Q3SLnqwAk4dJ2og7FrvApBq4ZQWLpaJi7+1jKpLEKsiNKlB8GTyMyAR
         hNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348641; x=1777953441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZLUyV0TSMl/0FUp0kbCXsS7r5z0r4oRuVSRhSVL+wo=;
        b=JziAu/lG9JvxyzFQgkVWAMjKnNJYe3esG0Tt0nLaL35aBwTo4KUQ53uwD04O6h/IpZ
         FeJ7a3VU7htRLHxSlipjQ634jRZzGAXvzF/0vmUWUnsXMbschoSZtu5VIks6r+mvNKQ1
         ILUwbxq1gfc/m8S8xZch1gCJfC7IHYYCeGRUs/ET6pIduuvDO4CfCDc/Qs5oA6oIAaV+
         Zj/X0nVvl8Kka6Oc0CxyHTJ/O3ij7RrrlzD6i+3yOmGmAFv+UFkME539rRTPdI2I/++k
         LXQ1iKCb98KKd3oKkxvnIp2yGgOaEqrVXbDKP46ZWLnVGVt4bohJqaN2oyP7J2Nwl5GD
         E/VQ==
X-Gm-Message-State: AOJu0YwaaKwjZ/V2NoUIS3YoVwk4YdGKh9/HeQ5fKPfhZlP3QhIanYS3
	hLLG2u81+BeqHj0DuTDQTGzCVnmnTZ1P3rTfjJTsPyPPWev6ov6olLYn+1lGHZ2yRTDmMecK/ZI
	x0UKlRACldCnsdkIGAOO4WUSDh+Nz4JYNy87NaxDJARS8RPIloaKPJpWfRJ6ZmImmpw==
X-Gm-Gg: AeBDiesOAxsgLGm1uTRorDhkOm96eUHp1pjDBVp/ZF7hUTJ1mo0uXR+0ctjMgf28s9t
	uCw9GJakSEHwRRkdxf5cGBVenJDQmJFcEXDg5efhNxVojn5SiOGpsJfN074g5qm+9Fq7xtbqTYK
	dESbPxs62JlqaWHNnzzqs/n9JmL8n431GRX+UhnDRDp9dPVeBg6tzyAkfOWqM9kRLtgTpE/obdy
	hwntkjOmVdI4y2CEm2PSIz0Bf7sC5mocOr2cqONHKFSZ77AS21c3ulZ/1Gdi+GVKypP1AZc1+RJ
	yv/wbl9B4A7IQDIIoKd25OnlBSgcH+ExL9hGbHjncFC6M/b6ZL6Ynf1xX7iI7wIv9HAku/xOdTX
	mwTHP59khZKbnXwTBJa2EAIaIilipqk16TNbQhmK+94KYi3aqC7NNzpFkaX4tRwYXJA==
X-Received: by 2002:a17:90b:2fc8:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36491c9acd5mr1465249a91.0.1777348640525;
        Mon, 27 Apr 2026 20:57:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2fc8:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36491c9acd5mr1465203a91.0.1777348640047;
        Mon, 27 Apr 2026 20:57:20 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490905648sm393888a91.4.2026.04.27.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:57:19 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:24:18 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-v3-12-8f28930f47d3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777348550; l=5015;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AXNNMUqpUBkT37jqrWXRRraxt0+yVQz0nuc5i48FDy0=;
 b=jCv+PEapELXi7ne+BCnuDA2WWT9hw+wlEpU7KBCcLutA434msVkBuNG4JIiYmwnRaklsyFYiH
 7yEBqBuPVHSDxOIWwnORTxSU3ljylISTZPXCnybuoM0HVCf/yxNAOyb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: SoFQTb2wMDSS4nfUPMykiBL-ucaFeneR
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f03021 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: SoFQTb2wMDSS4nfUPMykiBL-ucaFeneR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAzMyBTYWx0ZWRfX1YiYrOfXR3Wi
 jcorddWBs4FFzdQGi5TvL0wJXGSkIvzvOTRY2kU8S8MCzF0JJ7zYDJ51zMddH7uHKtTTYPOT1+R
 9Ap1qKdA/HRHs3Et8SgeIAGzt6uQvErn6akpYmHSE8IkWbL2acBSOlyXvSBfCkmE28BQ0O7/Cxf
 +QGql+6yvzNtsQoi92mqojvc5lFeTo4ZhmV7xyJp5qIHlOk11fE5C8ZLay577ntOrKbuKkgMXJQ
 0ubDAbEkS8XKyuqaWyLpz19VLZOhQHrEyyS541A2+7+YzKixDZ4pwzOxeAH6Mbd9jHFES1631Kz
 0YrHsD4lJ8aDsybcOCN4bh0YQdXirMFm5CIn63VO7e4L2RJRgcnc5HX3lQF90Ws85Z6uyNw+alg
 bq6nhQwmZfUd8CS5GirykZYTaFGcLpaSwwn1uaeL9xi6qg2q4Wsb0BITGf5BSRcKa2j7R9yZTaL
 8INYiTQ8mgv4qCMBbzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280033
X-Rspamd-Queue-Id: 07D3047D4CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59756-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ae00000:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts |   4 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 118 ++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 35aaf09e4e2b..cbc9856956ff 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -255,6 +255,10 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pmh0110_f_e0_gpios {
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..c47443174f97 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "iface2",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1943 0x0>,
+				 <&apps_smmu 0x1944 0x0>,
+				 <&apps_smmu 0x19e0 0x0>;
+
+			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core",
+				      "bus2",
+				      "vcodec1_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


