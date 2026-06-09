Return-Path: <linux-media+bounces-64318-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lUmCAy5EKGpJBQMAu9opvQ
	(envelope-from <linux-media+bounces-64318-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:49:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD71662994
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 18:49:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TOdZnM1r;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AGYgtywc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64318-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64318-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810B2325ECCA
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29C3B6C18;
	Tue,  9 Jun 2026 16:16:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419E93B634E
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021785; cv=none; b=FMVAkVDiB0n46QWcwa46MzJfD/tEF6/JnWRbfDdWHVSQRnzKGztWHCbYV8Hav8CHR+u/QDpgytvXS8S9CnypxmzK4onPmBQuzor6YjPIVDyOA/d7Fvw7s9+CpSmgTMGyfzwTeNoCeqRVRZpuHICOcpsViuN7jBeBVgzQIQyWcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021785; c=relaxed/simple;
	bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayZef5oC3C1op+bJ7Bwb672Q1t/KWOxvulR/lcGVginAtMvg7vZnrTLt+hYIDA13LG+oR5IetBzA2vqs8G60N5tbo0byeRk6nnCpS5CVb1w9bohl5rjoNgJ+Ri2wofPP8CDfMYBbUhdZ8ruhQkdNaWkzAE9Gq4q79LPyWiQKo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOdZnM1r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGYgtywc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaTo2247973
	for <linux-media@vger.kernel.org>; Tue, 9 Jun 2026 16:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=; b=TOdZnM1r2bC54AbF
	cAXQl6KB+etV9vV153azLc+Hz8uTadbfNyPD+DmkOOjgHd79bk1wkM7uODmsJFVV
	YZ10qrbVZy1ncDMwa91TRZoWa8PiIZ4rasXSZUkNaICKnNn/htPz+/k4ldCFwgUT
	sdUdZM51GC2en66TeDOtEpEDE1uJuYTNcn26lGACqWTP5FmiRPM/Lbb7uiO+T0da
	23uXF4phM+He5hdH6xapuvjZ86azRBbmQHiDtfYuLuDmyf7ZB0m3y7wrIJjgszDu
	96+XuMIiIYOR4UcrtIfGki7rv4QYHI/ECbOgFHiomcWN+qirSuiOe5rovypWhuYU
	NX23mQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetspy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 16:16:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec338so6669626a91.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781021782; x=1781626582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=AGYgtywc362trBVVu8Q/wcue8MrJ9USp/yGz803ZNoCpwh6TNmYhp89vTCKgRJ8Tel
         A8fsUblnNzlCtUY/WLyL28zGcaFX4XTco53vXjzqWcvrWlALEEq/7VcWCJe23vO9LOen
         TClfaE118fL+UAz4A8xnFeJA4Xye0ZFUnFClo89s9B1/kmKhir40pQaXYg8easclmmWE
         x7uO5XXQDIUI/uVt97ohkcXoNnUZJra6A6uUc+uItGv9NgmvxvbT1yO4rizsDeArCxOC
         qiekaAO7NXQBulhtVGiIVG5oLmxHF0zRfaaRyfPhQg8Cm14WrT16nDtzLERFc/zlnNtp
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021782; x=1781626582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEsM5geSJx7r9+ui4cXhoCdcaAtYGtGt0TWvN9cfDdU=;
        b=AmRRGtHLF5PWXovQKzDFXXa2+uoAvJElrFXwyHkaUvsjVnQl+/CB/mOfGO+4A1Lsf0
         gI2JhJnTpXYwg79MiCPul+M1RaJ+p9EmlX8Tb7gwCQEcu1rBWKLqo9HAoeVtGMZdtVVy
         voXZ1ZFPsaCfLjrekAr1VVmGVeOsDz9pk44cgaehyxATEIVWQTXFwFc0UB8CAfM0AfT6
         b0B8mpw6eY0QX7f92B+084Rwb4lNV8A5zItsZkKm6Wa3cZslQ78SZNdqRys7hk+q/IxC
         A+y4JFfLN389geVrVj7e1hcdkgCZliDOJsp4HhE74DdU1X2EsEnUpI2PjDemEAe3ijNG
         rdng==
X-Forwarded-Encrypted: i=1; AFNElJ/hJRzAnEWT5todQci9Kpn0mGpCIYIxdaDAzj+G5HhN2T/pxtPXxgJByRu2gLK6tot4PHPjJDPRyg2YqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ct+OOyYgCnpo6Ft37zxLwEKrDvZoW8HA3SmnBoIbAinG2Tl1
	pJZM+b86F17b5+cGx0y4JRv1gq+Ds2AmeX05BzM9t+9nMmNr4Jq+d2KAjl9ylfCWl20Gu+srfOv
	WD35+vz010FOw6u9BPgz28K47VR3w/ro5jWZ2ypedrs0ummaUrb7jgwYPvu+3gMLHgw==
X-Gm-Gg: Acq92OGCqb/6zpKQjIARk7SySlpVXJNckssBhcUHZ8i58qUqkHTamSLuC3ENGDAz2T6
	Xnedgj8X/neM54Szo1oBaMC61GjUigIodMOrG1iYwtyGyehcOMR7/QGcBaUbBCqljestCBHyeH0
	V9a4LuZJk70y/qzkvHTtgweaR0TRm6JWc1Tlxus242i4qd5GDAu7s+irYI2yLg4T5RKiNIdwZYp
	h0sTw2owYebbxtRxQOYrpJqfQRp8UvBidiF50RLo23srQRcmJXj7MD8I0YGua03WIHxkjHqqS39
	93WxPAEPiGHW5/wduTOeKTPf+qqdGX2ILl5FYTzd2FrO57Mn1qM1sWP4cM10uw/tZcB7IXW17aP
	GkYRHSqFF/nCt7xsGvmYU4yrK3t3BXRmN9bWNPWoGKwuo+r6hiIE/GbZa1HgeK02KBUk=
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196341a91.25.1781021781902;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:369:1dcf:4a46 with SMTP id 98e67ed59e1d1-370f086eacbmr23196273a91.25.1781021781302;
        Tue, 09 Jun 2026 09:16:21 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm20391897a91.15.2026.06.09.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:16:20 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 21:45:41 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
In-Reply-To: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781021767; l=2734;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=SeMHQ2hd9piekHYmbkCfwtXupgl21jV0AZlQflkeoo0=;
 b=8sqWNhZ55ELFDqp3tcm6eGUmS3CCVb8wag5VZYLr/ynKFiRzX2Cz+jprGsrR3QdTozhCQQ3QY
 DxZeOClK28hC+0puj2vMwWajvsk+5e4ObZBAMHTBwkcjns06zi5hwan
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a283c56 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=R7IlRtgiQXbz3SMwMBcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1NCBTYWx0ZWRfX9hvdF3pKiCqh
 GczDVNx7G6rEhfI23oxUy7kZOgdORroEeMdyM1jvYIeZqLN8f6fAHk1iretjx7+KdDqnzvperJb
 MvrBpk0Sfsrm4JS6EbgEqM42dZtE4ODbYIfI8NSRtY8PxdaOdOgngMJ4f6bSdMSsIGpVjmcj3GP
 xdEx+8U44g6jW4QF5N9ZAKx4KdC3Wun86N76O9IUGc+w8ct4NI5ORRHx5C75h4RtjMbpdNwUQJJ
 x9/rmTXISdP8hzlLeOdzIoPrhARLCmlwpkMXK/DxWEyBFL2XEzQ/JjeK+IpszWehKmGcrYGUa0P
 HeFOzwbCrdbJPS0xLF0jKOVYSe0uO6GaNTIyp0yxtROHSBLk+6YryORKw5HoxRsVdj3QR7hYddj
 jRg/U7I6itkEueSuHHDJ6VZAWjsHaDnqctJk1qImF0/s8UaXYQ5+ZtWaZOwsDyorWC3wBYFmM8M
 /4YZkuChz98M0QkUvpA==
X-Proofpoint-ORIG-GUID: pOweHg80LWkNnWuE_UcgYbng-M3S-28z
X-Proofpoint-GUID: pOweHg80LWkNnWuE_UcgYbng-M3S-28z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090154
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64318-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CD71662994

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aaa34d32f3c3eaabdb8727a497b501..b77cc9d7d65a6876b4aa058c4e0de8c89cea81d0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-iris", "qcom,qcm2290-venus";
+			reg = <0x0 0x5a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x0020>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1


