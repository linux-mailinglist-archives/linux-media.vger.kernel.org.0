Return-Path: <linux-media+bounces-60954-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBfPDsE0/mnYnwAAu9opvQ
	(envelope-from <linux-media+bounces-60954-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:08:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4284FAF70
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37DCA30D6810
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD45B2571C7;
	Fri,  8 May 2026 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU1m029N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2Y53Q6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CD41B370
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266955; cv=none; b=R4UdOy0jobHMFTOVNZpLnjHj/ypuJgeHeZgPjMNpfwsDkOMDeg0U5CifoPp0ItL06PFH7mQWbcA7H9WhoM+ZRyRGOtMINTFnzJ+p4XwKsuD447fz+C6XwCt5ojJXRcfLrIUD1v9zIrg7YXkPBocP+jY/okc6OmA7eSv7nyb+RtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266955; c=relaxed/simple;
	bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeNn7nMttn+T+27n51qYGwwfaXt3olDf9QZj4gWyd8R3IhKmY4vhmckj5XshDq/m/oVJlx1wtlKEGJDiW62XVbk15FovSw8reW+Cu1EDeKyEwBbvTwri+2+7nBPlNquSc/pA7CZxUYk1Afj9HoqBVr7fSYB5liMlCEWQgdCgwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MU1m029N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2Y53Q6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G31uM724739
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=; b=MU1m029NCzcq8bud
	1rBJry2xZkVvtjCxyCQGvWF1WaXKGKl3DH6KGsdRLS7EmylQxpgXUBKWH8UxZwa6
	JKfp5WuLhT3Eq5Z4K3Jef2+JV7IowyiapQFaIOkgmPv3wPjUucBnWF8VYIFRQndH
	RSW4PFMzht7K4hF4aFrwrf8y3SDvdvYPWH120bij44xJE+aF3POzp0lh5O1OwkdX
	+NP4XI7ZaNuBNzNDaiQYGsLyVIZ1kk1tG6rSfSmIt9g/mFMj5Lfvb8m6kii6omxw
	beK1thm4apr11BYp7bxlQlYr6AbGEzHFp1pnCmVCkZdRtHdyOlfxz4CgV2/Xh/04
	aLlmbQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k0ugmre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:02:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c822fba6b4cso1295697a12.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266952; x=1778871752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=F2Y53Q6KkR+EWYnQUiYwp6Gjr7giLhdcPOWu7+N/lfPQmM8BnE83sCkBcJf8zA6qvd
         /0wHGGr2Fdh5XAiG1J9VMCv5E7YaazTl6Q4f0cWBFA7S7xxXw0d2M3js5VffddNQC2Hz
         zOiIa9v4qsEODrPVA1t8a+5UuNmjiDc2SBLhwdTZcUA1IUnmS9LgNK8IrpTuOgBsmjPV
         P+9xR34dN1VNq/K2c9Ibhkgl4UsLR/ez08Mf6YDUTj/v15Ts0/F6napb3zDklb77bc3M
         UjC51IIstogaB2oV+XDyEa5QVEKkKS0ftDChY+eS1zaKCVkL+doxvZTfitLl0CYIciuT
         87BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266952; x=1778871752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=aCotrGpuSsVdT4JCdXCVHWMwyyaYEgah9rsNkTJfCzcKyfyKiivqdJC8/UUh9G6k3y
         Ww96OQri/00QfkBd/aCcnoKRZJjs6Zwb24Ws3pSC05sj+/N96k1/PJpBfoHeWa2jZTXP
         ZRxps318ysapFYghnw1oqbQF9Vc4auMV5CzCl9nuGYJxPe2Sooy7Y6gF0xU0GAaSKwS0
         cMngRNIXiETqJPVYrW7rAuhCq9jC4OhRgYEU4Pf6HvWUd1EWqxkdMueWl8EODdfae2aI
         m06dFA+XFYsUJkl3erxy/vcCiQ2lZjNI8hITdEs2Sb06rrEFaAgk2pCi3C9kY6a1DuDZ
         qAcQ==
X-Forwarded-Encrypted: i=1; AFNElJ979mhThWiwPTnnAWd/ueJ3HWXxdCZ7DmGiTYSXC6jzoZJ/DVhU0H9PQitcmsVDf2Jz0NePLVqVwqHnjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWhVVZ72VpCrLQyMgnEnYpzPz2OgyX4Llt00Gu0vpeVL5J2xZO
	3mkfuK2x9sszf4wuJjOEEkoPzTcSPjWFU5nCmI389FFj6JaCegFRQeXD5ZmXPXSibre8XWDqvNj
	64Ak6OLwx4nwrAoJEoI/4JiUeqYa8JyUFC0ugaovJVXDIY33A66HsCJv6/qMysJNkDXrLkBqQBw
	==
X-Gm-Gg: AeBDiesuPxMhhXpMltO5iVeVLs8D21CCdab19IAaDaXJl6QDAvj1rW+gjEVYZpnwJ2P
	HrmpRG8CgzJKQRyTfANVKhjmaZDQPlp9Davhbmxw04e80UAE11PdjjM6tDq/CbbtDCq2q9M2YpS
	v6RAAcdVy7FyyZAaYiBzzCwyxV0BJPAWGITFDLLgXReD9EcygycioVLxP3oyf28MRqHdTKB57D1
	ziigLwUVg/9zCDo+MyTiU4QwplpZkiK0XyH5PvIcQBA1fSPRmAPljQwyQ5gwvKVySjHtOmF2WLr
	6GGjK2C+JNZOLooisMcUjtD7LMiOHRy1+CS6CRBrx7qz1X3MRMf3xOPuz2/ZNzQX8451be+r2BP
	U0fzVU5MAmrlhFBJ0PcOsoD1jLgzew3UZUM7Utp9sLdrYZaEP1ZSG9G86+QzqbbauQw==
X-Received: by 2002:a05:6a20:728c:b0:3a0:b781:4c8b with SMTP id adf61e73a8af0-3aa5a3b4ae5mr15654090637.2.1778266951540;
        Fri, 08 May 2026 12:02:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:728c:b0:3a0:b781:4c8b with SMTP id adf61e73a8af0-3aa5a3b4ae5mr15654007637.2.1778266950964;
        Fri, 08 May 2026 12:02:30 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:02:30 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:30:02 +0530
Subject: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=4603;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
 b=htiCnMycUhTW/Y5vw5fcLiYicxLdxT/NNaRRSIKx18osZwk43fBMd9KncaKgqZw8SRXyJSlIT
 SHtVHVWIXhdDFgd/k5ijxLMYZoehFPiEUM8psXH7JzaT9//S1R1QqJG
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=dIqWXuZb c=1 sm=1 tr=0 ts=69fe3348 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: NnlQOf3aYPxgOTmxMeB0Me66VSewtUoJ
X-Proofpoint-GUID: NnlQOf3aYPxgOTmxMeB0Me66VSewtUoJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX1hvQWgeXgzPl
 T+IFCu+a7oqKcjqjmQ7plzKDLQuyaiez8hCPH0ZTsVTuFGPqRaD0RwQ/N3Who0N/eNQyyczbcvN
 ccqNy5UqwPdqg45T5PSehtp3ZSAWd91Rr/5xciiJs5lJeP85LPSNWYGpdjPF78SFRkPcyyRw0oa
 bnXg0bgVNMmiTO7f4lL+xtzmylocpgLBsyAcUip0hHyXzX+5dHA+0uKf2Pfkpl32bNdeDibUetw
 /3FLT96VevUpWbtHinPH0OQaCsXhsSyMqcy8WD1BeoAeufjNcUz14X08UQ4P0Ew4zJT3Ni1DyyF
 no0o7JsEQSPlwxITUrZC2brX2jUL9WR/FI/6qS9Lv1fYOY8cDc0V8XHVqrQDQL4XJyYGZpDUB6D
 P6Uwz2e8R/hQJUp4Qwl1GykmJqi6+Rrqn1K9aFEzY/+ERPZw9Q8zAaKnLAPBP4h2mOGgbwlTd3l
 5zAMMcFd64qq9Ua8gpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: DF4284FAF70
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60954-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ae00000:email];
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
X-Rspamd-Action: no action

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

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


