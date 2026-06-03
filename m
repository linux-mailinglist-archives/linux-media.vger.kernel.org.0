Return-Path: <linux-media+bounces-63616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +CFRCV06IGqNywAAu9opvQ
	(envelope-from <linux-media+bounces-63616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C2763896B
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:29:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PhCIyTtk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bg6cIz7w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63616-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63616-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ABB030D42CC
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF382397329;
	Wed,  3 Jun 2026 14:21:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0A4779B3
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 14:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496489; cv=none; b=DaAjpo7tQUTCeAwWttohE6acpdwBuBR8ktBEDgEd2pSP5eZzCFK4izCQVhwtAE+jQKhPAqJRHJtGwuq8RAklgX4FfFZelpLPn7huLk8wLlmqzWFH8HRIlap0OPImR6x4ioOKvJ9Jpaa6GBIg71rTBcujOZHGV00vrHrCHq1paa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496489; c=relaxed/simple;
	bh=n9tw5p4iSejXhjQapjH2LFH1zlMXxIR7tImZi/c9gwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9uTm6tujlGF1IidSM+xgCBoVCMVy8E0uYh8rnOXApp2QXe/ZNlCsFq3GPPd5omhAOzCjQ52BODbuGmuH+cImntB7xDSN5fdxxSiphvpchpyM0tnQ7lnWFgMF2yLCY3lNQdtiB6B8mcndveM3VVOHQ5TrHQMddL+3++86lrnne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhCIyTtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bg6cIz7w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395rDf780736
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 14:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=; b=PhCIyTtkRzae5Ul/
	R/7BFwyR3yriFzyEjMf7zPIVr5d4TbQGi9kr2dXEkQZ9rdRzEQ3ET1tpS6IXnSXH
	4RmgI24TPgV+P2psI8psyAHUEWequu5CPDLp62lew0Ncs8u3KXiL9brg+7wi9nqm
	0bUo3PBuhlaQp6qECGPg4WBJ4uHz8mRCRGuEX/ZB8IlocpNcEJ4LgV2XurBmFVf0
	uJdS/HD0HYDvssLuZUW9TtpE//LUB9WHmqJdrLl9iSsImyOokaoLk0yUF4z0BvcT
	3zLOM78tCwea+30oRLFG0DjZr5Jc81rzMmDx9HONL5oxVLZx64ps68cOERfzwcD6
	FQL3SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb16tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 14:21:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf243973c2so40376855ad.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496486; x=1781101286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=;
        b=Bg6cIz7wk5FHyWuNTkuAkKHf3eTTBZv0E6ktHSuRXYDuzj8hn84nhGeqNNt+6J9jGc
         vVzW3Y6yhS1Z7oA9NT3iizEeTtbuSX3RJq0/JIOl9/zzxUXYz4ifa6uja1ywOjJKpp4X
         UtUM060LCXAKXL5oVvjZvA0J7APcDKqjuL7VWMOHXLtowsqbj/OSbx2W5oCNvDDY1H0f
         YKOzC2NnRU030hYiGWPE6w1gux+L5M8+Tbq7bayXw3gVODIdtbpA6t9+8EFJOfe/7cAV
         nH6rW5GbiuwRkwXeke7bobJYAXAc9oVVUKe+gGbUB59a1xa9KTKx/c/HZ7HauIxYSF7R
         5Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496486; x=1781101286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RzuIcF1SoVoBc6jwuYuHvPur7dxWQoBybR01NlwvIYQ=;
        b=JDf4jH0UtGSZRS8Vfs5VcLI+tqpHJQ/iFoJ6oRmJTB6/jlkVCXZ92nqtXZTMRTO/dO
         GSkYy6aHtk2LwXqcMhhotw3bboct34hMm0W7NxdS9ZA/0pk3zr8w105yPmIzNRoKigkG
         JW18f2GMqoayzzfMhlGm/UUeZmLg/zkwwZyQTYuSseu7zqEKYeiGaCC7lse+yr7kCRZm
         avbwbCL2xzC99Bh8jYZcBRqxBNeU7VUxrTnGbSO2LvzcjWHKNzMbi3H5Ai3c0qmxJCX7
         +0X0po3WUvW2LE3DRB3HBCfKCQZsWM+yLpwfdA7GiiDijNP3ZqOBSpwjoFNbeBtnQzfa
         D6DA==
X-Forwarded-Encrypted: i=1; AFNElJ9C7hyjoOTqNmCxK2R6qqwbGV1/H/7887A6i4ohojGqsoPn/p5ZnOtRBZmQSHVfN89TEg7bHcKimc7m3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWFACXPLq4Xf9fVzuKjANLRXRn2APajWLIzLmgkjjv+O5zz17
	HS1uyKtRqMU2E114avv69M3A7jJAEbVLSrU6/rCv71Tj9A/VtTm+7cPizEtaVy4Y8iGRWp2OYzD
	lDxxXMnQCmXs1puPfRecsOMrur5CjZOrnPcesCuEJZK8i4TpDK9F10jtkHug0vxrNiw==
X-Gm-Gg: Acq92OEeAVuv25ORYAJq8eJ5h2iIbAmi59sY++cTSz5EkJvDBveiZjkbemkXYEux8pE
	XQ48n1a3UIb753pz5i1G+nQGTpLmlk6pP1lT4fB+PGXScnojcNFGX0tTGWtuOFXicGQ8xpVasOM
	fogvb9q6spcrq0OOCpc6U2LJLPK05gdEVGNb2XOJuML8fZcde0OS+Nkkf874+Le6NpSZ7hFMHrG
	tOAKVU+P7ogUSkpAjAEzZcw5MufFL1304twavdu4unuBVXLRwDnYhHEVR3o82Muw0+mDOSbVezJ
	Vp3zsjEhzOFWjjPvN1uYVFfxx/ARFX3b66dj3hiq1IdgQmM+qvaxXcgT/Lwh8NSWT0047KT0VOm
	Fl12jqFgdil9bP/EgWRKmgTMfi9Cy0RNvC3U4T/hkfWB2p1ScuV/RdRaeBpz0a0FqvA==
X-Received: by 2002:a17:903:1252:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c163a256f9mr38533985ad.2.1780496485697;
        Wed, 03 Jun 2026 07:21:25 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:2c0:a57c:ebff with SMTP id d9443c01a7336-2c163a256f9mr38533435ad.2.1780496485164;
        Wed, 03 Jun 2026 07:21:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:21:24 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:49 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-11-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=4631;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=n9tw5p4iSejXhjQapjH2LFH1zlMXxIR7tImZi/c9gwo=;
 b=RI+ITw2Asp8AXPj0keMrIraI51fgqjmdc5g1Ueprr7b1xjDe6FzeeM9+HdCEVCgGe8ofKew/r
 KZL/pieDZqWDQTE+yEy609ZRRNdIMZoc3uIIfZwC4/oFcgq8Znc278E
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: yo2nuJLFSI-w8zD-DQDkYBaf4jgcs1rk
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a203866 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=scTG0D64rx7uByHHbCoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yo2nuJLFSI-w8zD-DQDkYBaf4jgcs1rk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXwUm94dnv5qlI
 reMK8fO4I2cQnqORolEPN9AeBd/PkMhHUpZN39iggkcnbkurqkNfsghocDuONh2R4itlJxvoFdH
 aweg1iTzZZLJ8UEBvp1pDxosllNmH24GSxRfbNySAJeRbl+8gxDnjUYO/6OxBzzV5Ms+i7cmEo3
 toIHKjUiLrnRqTnEXQKH8wineNOj00bQYeb/kcZY6QjWx+yjuhM6kIc0oaFMkTD6cCvTo93//G5
 5KTVGFsIFd7z2kpbpEgJbMdn4BSrofhg6xM12SFIZSsccca4CGXlWiNEXO0sTki9oL0TnCFTdIQ
 nbMjJJcSaBJEfa4+GOk+7j2ibVLPG4fgxKoOVzDVmK8fdkCNBtdQ2f6iEjHeQVlehVOIGX4umJ+
 9to9uvjY998Sofoa0d2LkkyVqtR/enwJrZAO+3XJECxI+P4AjODhYUKRlmUR0oKA0hE0YPRxQHE
 ZlY7Ml6UTWdzqEhWEew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63616-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1C2763896B

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..42bcd03c4d3e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/media/qcom,glymur-iris.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -4788,6 +4789,123 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0xaa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
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
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
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
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


