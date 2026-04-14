Return-Path: <linux-media+bounces-58703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLDzIwPL3WlGjQkAu9opvQ
	(envelope-from <linux-media+bounces-58703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:05:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F0F3F5A35
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41CB93046F16
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAE02FF176;
	Tue, 14 Apr 2026 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FT5IeK7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrYvZU4u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C22820A9
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142900; cv=none; b=rDmpKtf4HiYmsO2Z7plGvlx+ejeyUykRRV0YX1aL4qoBZGB42MiTr/9cC6/a3Q2g3sx1GWLOiXtjwFCyAF6Z0OFJ4gtbm6wFMQgXGpCZLZDLfnYuDymlmDA4n7g8iCSgbmnxDuKAJdh17dCr4PvvWjZx5eD2kcuihPvWkYuk+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142900; c=relaxed/simple;
	bh=KA+lZOt0ohDk06CccvZGpOSVHWTSQlUQLLcKZY8nss4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBxN3dCI0UzQkgu9zySBhQbthdA8i6KBLTefSMBqBRcyW02vr1Y7YS9gCQymrYBb1IJ8Vc2c+RuKkC28Qti2jCWofoseGzfN1Sf8cwYBBjcPAPWniDLnevMH2/VAj0sKko2opEl68erRCOaUTJxMIzc5qV6JME5kDnbPpJsCgcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FT5IeK7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrYvZU4u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCVAr280834
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDSVBOvQvQM7TJwko7RAK7irMBdVuidkpg5F/aO2LZM=; b=FT5IeK7S3yZt/UaO
	ZhT4qLtxMeQfPZ0DlS7c/h0IxtZFx4CMTZZ3Mvu9PKHbsrw2HKlIlRe3YfUb2DOA
	RfbenHoFAggsDv8r0lUp28mvBtlbI4jThtdB3hgfrTwWoougPxyscW0I4pLChLlM
	+yDU+41OliDOM1k/GjemA7mCJZLdTZcl42fKdmaTqA39tUrWqJKRjTzrksAAOE1q
	00BR6PGpFTQtkF+73doWc5eOATOdeXMPOCwip+c7yVBxGL4cy7p9G9s9Z1mUoz49
	PEVDFAac4ecJmPupr5GmNwlWY98aGcqcTX/YzBrC5K4LFOMJAISJfe35EZTlTp6s
	8CCDxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vh23v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90510a6d1so41928055ad.0
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142897; x=1776747697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDSVBOvQvQM7TJwko7RAK7irMBdVuidkpg5F/aO2LZM=;
        b=ZrYvZU4upU2QtPlxTOtj64doaLxTTtBpiL1BbGQo+kshht5IDk+MS1F4ORDbuhfAYQ
         WyIvufT+CfCOi/9zjrkPqhctcAcypbZsHzDi6ArLOtsZYYYoNrEd6411TJVx71LoWqY3
         pvsVLa/xBZ3Xs0GMlGj7ggc3EupUTZY8FTK4b2Dt11TVRHiJEu9Siz/jDgj2PFLilHvw
         1kWYfCb8wfT6+XEgHKjkP2i8ibSZnPnV9SI92XZRnKIDKiETPCFsAYUYf+Y+idxae0D7
         x6v+rDrS8I0/6isWaP+qUogAzXB1o+dHq+gZm74LretuJvQFYG2+omwOBZd7D3T6ZltI
         Cjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142897; x=1776747697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YDSVBOvQvQM7TJwko7RAK7irMBdVuidkpg5F/aO2LZM=;
        b=HQ1hQLYJKkqzpd7nCuJQQQI86dgUFSCnN/v/2Q9SlXQRi2UCxvZkDXOdELWt6MAV41
         74MkVdokMyXU8y+hhQML2QNR2UBsTX4zwRQMfgeV4dw12vQwCNLcCgUtGCOiRmlQnwCe
         N+BXTHAiAP8VkEnAQm3iLjQL12OurrpaZzN37X+rRPC8UKIZiG5v6RXDJeNecnGW2Hh5
         rcyZoxOD4+hfk+7zWsAKbnDnmU1clzx3gGbR0LidSrVi99rDXjyn7TjuTnMC8k2cL10x
         pxo+nU/7RsKoBWR/AwOR2T9hWSH9gEfaZ9ezmOzYSdXXlUsTZFqsOY6uvFzF5NPajSqi
         gSsQ==
X-Gm-Message-State: AOJu0YwAT03S5x0wPChN1MSpOB/MB+ISAfRe/eGVOKqWBS+9po8ooNJb
	fSTs0yenkKCVvYAxQxuF1nNFNT5vusnxMTZzNzJgJ6zLhIy7YseorRpXD1wbu4ue/sYWekSxHEy
	owkX5a9Vam3mUYCfVud5ETBvIUmVPy1qQibYMYyGq+TiQhYAvT1VxAHPVNDIAwFh1mQ==
X-Gm-Gg: AeBDiev2zDv7nFhRYviZ+hF5AAzEi9qtHPt0elXN1N9OgzdFe5yfCBvWFHHi0tv6BCd
	JIP/yv8IJPxOgTePmc3vZUbr6GMNBIWP8IzcWWn5Vx644avyk6ndORrsKYGvHgREb0RnQY48cCB
	YZxgBLjKcFp8DLo4bnz5Z2/TX1qr5M+K5Vns9MuGHdB9l6g9ZQ4TaVc++MXasYx9lvzZDXpX2DT
	gU+5qP6pzffHhA4uzSpuJIBQZUv8JneJA9WyEzKzPAHZtwy2Cghdr5B9sQlV84KQzPy6sylTqF/
	rrIzFEBmDVo17A786mutkh0xJzij7nYJroRGKkY4CsdsOws/xUm144DerriQ+lmT1aUtZQYuHzO
	WOwV1mNh6RmIXAU7XSqYXh1oKQSI+kOl8UXntzbVWNhpvndoSIVWqwqY=
X-Received: by 2002:a17:902:e750:b0:2b4:5fdf:f91f with SMTP id d9443c01a7336-2b45fdffbd7mr56204465ad.4.1776142896966;
        Mon, 13 Apr 2026 22:01:36 -0700 (PDT)
X-Received: by 2002:a17:902:e750:b0:2b4:5fdf:f91f with SMTP id d9443c01a7336-2b45fdffbd7mr56204065ad.4.1776142896414;
        Mon, 13 Apr 2026 22:01:36 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:01:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:07 +0530
Subject: [PATCH 11/11] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-11-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=5012;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=KA+lZOt0ohDk06CccvZGpOSVHWTSQlUQLLcKZY8nss4=;
 b=fAuZlJyQ8jYLV/AChmcCwI75/hx6WaYbH4RdS29pH0A1H5JDe6dgqR7V7bt2MnXpHNzbubIRB
 OQca/yvtp+MCEgfu9CHT5NmMfqFQxgmY6wDymtLzYI5zIxUsC2uR45c
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 4G4TJj-MAPyeWUSRJVdJ4GHL7GiFruSO
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69ddca32 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 4G4TJj-MAPyeWUSRJVdJ4GHL7GiFruSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX+53RxHKhSZSR
 pwi09znrrrrzOKXzuPShUquonc25nKsNjjExle1njnWxdUpXtqGMBekwhOxLVYwRKXLZmxpU37c
 4VYCq4R0FE/uhfof5mxW+IXSDusukiJsbfWUh8hRHlhwUZTtYHBdadMQY3XJNMi2WjjtIVrcR4W
 vyj22DbGu208PQ74yGm+q7k+DwC2vCKbnOBOYgpEDMli5w+DgBveq9vIbVWWW5Q+iq9jYlkGlZ2
 CSAgGga9puFPFUMLNV9MK9QPumjw9yw43d9qzqEougYY2lLbvl0T944dmqMS0bLynnKZlN/bfKV
 kmIe2bn9HvDiJNLLMzF8uRN0TacL1GIPA6zNp0so8NWGvSNJFR8NBvJ/iX+j7mDDLq8CylKEQfj
 t499ZXvmrY4OstPWbAIbbRGVTR7mNW1kNckYwlCUd0SRdl3FwJQK9P6KMzKsvXE/jzIDGE5nL4Y
 OuWgiJfDI5ASJP9Pqtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58703-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,a400000:email,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16F0F3F5A35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous plaforms, thus different
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
index f23cf81ddb77..e139b2d2e33e 100644
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
+				      "iface_ctrl",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "iface1",
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
+			iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
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
+				      "bus_ctrl",
+				      "core",
+				      "vcodec0_core",
+				      "bus1",
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


