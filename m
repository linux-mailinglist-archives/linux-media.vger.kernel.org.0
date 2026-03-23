Return-Path: <linux-media+bounces-56713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGBXEXs6wWn2RgQAu9opvQ
	(envelope-from <linux-media+bounces-56713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:04:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED08F2F277B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F16E830A84F6
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FABB3AB289;
	Mon, 23 Mar 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtkYH8Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/+j7O0F"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E03AA51B
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270717; cv=none; b=WhrQTvW2WMWYsQ4cYarBA7ImJnPcxUq2ceDexHqZq+NaKDermrpdftxFQWQ1CPFY5klzm7N+oadmV/8Gtrczber8zj3gy5zrbwSE7UvG7dTRYuxB3Aq3ylAtEiN2mxKm2hMvt9Egk1T/WAoq4LyXn9cmb8bDu/1+2auydGIyVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270717; c=relaxed/simple;
	bh=O3qTqvPrEAM2Z6DMps4v+LJ+XWKaRSdRt03qEk2jEP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KySZjcK6AveOFT7xCXyzVmz67CvgLtvbqVekAJx4BGk2DUKGbrwhndXhRsLckof4Hl6pFi6KcOTEXS5zxg9KHTVPRMXtSQXjpycZI2sxqmjbAAlHvymDw74iAO/4jl6HVxTK4PEsrfVuO81iyLQweqzHSlTeG49e6+BHBeKMHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtkYH8Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/+j7O0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADvA83539911
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GuB2uDFgbIo
	dLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=; b=EtkYH8JnWZEM9Zn9vgVEGUs0ICh
	bMbqDwVxnDU2gUY2OYTvwfx5/NsF9aqMGV/NsyUTwTOQO4XYjEMSmQ2iGYzprZ5p
	9/pvYAGw/7fVvS/F+m4TiAaxfYk9/2KfDU/9/4ZJh9QXxkGn67iJeb1RBuDNGm2A
	yVDiN0XtRO5OYFwbhJMM0753qFPMxgsmqEgnQCf9GKSJA8sJvNgjiiSNr1Vs2jmY
	LGX/gUC9iubmQZRI3YQnSG4QyydAeCFFBwLs8SgknfppHJ105wMbT0RjMQVVJj/L
	+ePSFsjZD7boBcCoF2YvdeW+tEi6paM9eWvHjiR5iDzdSKZT3BAT8D9Xlvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30ha8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so5193891cf.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270714; x=1774875514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=N/+j7O0F7NjkKBw2miw9bk0jnux8S74mCyxRMJVwr3cSG+ETgQm6hXSlaPqDObWJk1
         fveXfWCYY1+cQT1P8FN+/suF7E4TQ6RGcgiBRhS7O2oYW1D+0pYafK/EZTpwHdn8AYAF
         5DysyFDKLW2eWLWqojfyQ9c8WKY248KiSyeE5TQUuRdFPUdzI0qh29G9SMyDYOn/J3/4
         fKyS0336NxIBSUm3dz01p/DhynlW6dD1eQCKRVOHeTKqFp+bWzgdOd4h1zupVmez5yi2
         dnXRFXNVzLJP8i1Tc3ptEMUCYncxFr8u+JWScLZD2Gg8poas6XysDbvMcFwBGL8febBG
         cRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270714; x=1774875514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=qPLTBIJ/9JKEm+akLwLixi1OhQb9I77/JJLfRTzgpltFSz52/ZtGN6/daSeorigfWc
         hZCEOmhqBR+VAULu0AKaLSqkDP3MZhcN5AhfF1yQOum7r3D0n+KNRyvpbL5xRABk9bjX
         GzER2J2VGRMp3p4L9AHgzLpKtFOl7HzTlmpjyfYy9dDe4Z7Jy13gse+fRnIXe9QQiCs8
         MburFYndI/vLeqtHGAIMEB96GlIRrWP2RqQQ1H+gKMFuBj4dVjXk57NhqXBXOFjA1TgP
         dFPiu0yYqa4PhcomzuErXw5AJeEZ4ckT5c5nrP8Vmi1vLYT0X7rvY5rfWRB47watJiPx
         J9oQ==
X-Gm-Message-State: AOJu0Yzw3HoMKv/kXcw+PKMnaePj0RFhWMy0rBg1wEfSKc/lnkW8o1nh
	AT6L3p9TbgcLK9VSO3Q09QfPN+LZZ5LtA0I/7uYqLcEh9J6N2x17QGAd6efucUcUDIridA1eCYe
	kpvi/nviGGUer4Mo63AIM3KDxNNhwPbCnN46pQgXv2SQZtbYhc9Zl3iaWylX95HIf1Q==
X-Gm-Gg: ATEYQzy2HcTUYAZUCAzpv5dkndVl6Z4y+z9I3Sqhk65+v9ndTmTehBbH93XBun6mp+g
	qI+rqcxOlTN26ov0a+c3N1R1bN9BwtQRh9fJ/uWoGLoEuNyYISoMIQjNoiBwpIVJphcE6UPE9IO
	1gMyoqGhgFXtyo4OKDHVvbBlVDBiGLsRuTZgIlM5hOBibLXpMYzRq1+xhbaYxCWJANQjet4Xt9L
	FobWMrMGRmU9z5CvJ8fMkRT3XV0Z7Jmmql4HUFLf/z2L5BL5en6oZ7jNS31aSrqfvCrvVLn/wfJ
	UN7Fr771RiGs6tg3xEoyYNsV8+UjWpIyI9HnY8LpMoVVBiPD3Av4Wm/uq63BaiD7OZWJfrnoORO
	LHT/Wlw0VmwGu24xiomwgAbhw0e+ffuuFz7YA8fX0I/Jr8qw1YiDqbIbzZlV9lwts/oqlqz7WNt
	Klit22ZHuinINv
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94395901cf.67.1774270713901;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94395631cf.67.1774270713493;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
Date: Mon, 23 Mar 2026 13:58:24 +0100
Message-Id: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c138fa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=mzACg6t9QVaUiISIE5MA:9
 a=2O4lf2QStkfF1PFr:21 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX64kDbTP8tSE8
 ZV+vjTITT53enPmRMLqz83vrceCK71ABu7bINJEm3FIu6uta82iFs8fUyVqBSc64JZIrYF0rWGQ
 64MA4jSA0/QNHN5+HU8NtDjWSlvVVmHeqA9CNrjlQs6K6dE/GLbu+CNzAgcShQ4oErkMVg9Tz/C
 dBHB776WeyNmhvbJmBAGGYEm4eSHITqfUQ9+n/Y5OyODShKEjLsSyNKjkwReGYFIUeG1dzBLDqR
 l5TjEJA14Yo9v/yfG0kAez1F7lASzNs+GXW1Z0ZqVksKhtt7sZB0xQfoB3dHjXlh9MLvY2aejPj
 AbW+qT8+liEKMzZtPSe9A0CrOUyvdM2I4uL6QvGXlRqWvJOSxRJwm8htvGs+dHMRVndk7xGpK6F
 NYd1L8vGriZ/sfH6EQdwDdHxvNsjgL0uodl2bFaCsiGgKwW33rvg4kTf+ET2NL9GK+LCYrRuNQN
 92li5viJxOp164jZ4EQ==
X-Proofpoint-GUID: 49LpjAYKuyr_OUMozDCTpiYPed8OaIWP
X-Proofpoint-ORIG-GUID: 49LpjAYKuyr_OUMozDCTpiYPed8OaIWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56713-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[5e00000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,5c42400:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[0.0.0.1:query timed out];
	PRECEDENCE_BULK(0.00)[];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED08F2F277B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
QCM2290. The OPE is a memory-to-memory image processing block used in
offline imaging pipelines.

The node includes register regions, clocks, interconnects, IOMMU
mappings, power domains, interrupts, and an associated OPP table.

At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
clock is shared across multiple CAMSS components and there is currently
no support for dynamically scaling it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c646..358ebfc99552 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,78 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42400 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c42600 0x0 0x200>;
+			reg-names = "top",
+				    "bus_read",
+				    "bus_write",
+				    "pipeline",
+				    "qos";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi", "core", "iface", "nrt", "top";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1


