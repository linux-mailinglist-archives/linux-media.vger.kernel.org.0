Return-Path: <linux-media+bounces-66706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qhtRJ7VaS2q2PwEAu9opvQ
	(envelope-from <linux-media+bounces-66706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:35:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5270D9AF
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:35:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hlq8kI0h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cLBjVKVB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66706-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66706-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8D33322BD67
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1593E557A;
	Mon,  6 Jul 2026 07:11:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00343E1690
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:11:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321896; cv=none; b=FDWfpq/FVzmlcrgyDsv/CmLsGcKE7U7P0xJESqWK6Ua7S7eZcwDTgvDuMRZVTb8YaIDFgPcOA3/H3Rfm5jCsuLWR1Gl+uJcwiDxh3yANKz8CsDM14EmpeRtsHq4vFtIzBofSS+XwvBoKp3TnJZ2gm6G6Zb5s4ZsW/41OjVMoE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321896; c=relaxed/simple;
	bh=TOQJxNULiklYva5GtZvPg2vR0ieetZoPJmde1SseNns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N3AZ4Hq04mPRO2ue41tyr614iR9wwJyG2ZPXisM58fcBsnYE3zmS+ZrsDKxZqAayM3zqI2VBRge0cyLoC574LJmbxepB7CT4y2XiIOSezMMoQ+7icwkELfGo93oa3fuZ2gd/nzJIlFxWH9Jma1URRWj3YBsiDmr5hYUUdnGGnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlq8kI0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLBjVKVB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dGn3615555
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 07:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=STeIGRcFLrK
	xSeTilY6t4degzcf5r4/MkwEugpmVYMI=; b=hlq8kI0hP8x7GBUXObcjV4k17PW
	hiJ7ePBh8hfcRCX01r1fz5UkzMMzUbEVfRmNcMNDx0WUnQZUJvKXHXEpQad0LUmX
	UuODIDldJXFxvRtCnKGxVn4L+z7W5wemI/KuYU3u15Elt5I6ALwrtfs0TEaG7fUp
	x1TuH+wLlMGCSvpPjnGUBIW0RNEELiA+kLPVl+suQ9dl7Kucu1Pmwea9a04DzDER
	T2TfB42Pkfw327GEgdXUDJEaRt9Oe+xDNqTTCVrDjDM2MNNZnmsuNtdCgWqBJwP/
	ipzXfFNr+Teeqbc7VCYtv1yVwVzyId98IGSYixTknx7VNUuuYh5N5lD8YrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cy1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:11:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6ed4fe99so461624385a.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321885; x=1783926685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=cLBjVKVBUSyLIOSnvzMnLD6yOW3Rc7NXOHlH8EdfqEl9VwJyODDytZJmV9WDUhOho8
         kyySCgowuQGlXPoexFSKKYvsBckk+4L3C/TBIYu1537QW0MnRzAsMAhUgBcOnec+DBO3
         wLTFD1J0Qj/m4hcz1QXK7MYDfXpPx1QX8g+xKCDtphuwdekLF+QfGA9XPY7jSu5Ewz3I
         VtEx4Cl6Qc31m2yElnNp2wtJU8Pg0zeFtPsA+BIfaoH2sHDPuj9e/68bondOi9r/ZpKe
         GcNyyfP2y0rK5JD0d1bZEMkeCKQkU+ppgqTatFrJ72pImqRPeppsl24CKLK7u1sO+WYs
         MN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321885; x=1783926685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=rF475F4UkMxvSixOecdxcvDa7JBmR/jNc3hvEX23efytlHKduqc6UlS0T2yDtH74oF
         lhb1MdKBmrPUsOg9bJ3gzOWAk6gjKGfFnUHF+ZMoZ6uHXG6XOJxJN0D2BpHDhFf+MEsz
         P/zFlU7exkGRDeyxT/lGc6YcdlDrDXdmZHykkVBLnrhQoSagbXwR2CZPUQF6m8NWm9IC
         Oyn2HWXii38t0HX0TGZkDhHc7nuXir1byuV6xywI18odRR3zts0mh901CaVGZ1tUpqYx
         04m8PwQiRccZPQyeOqse1rnw4jGWIHeTrxbu920Ab77Yl3J6hSDPRlFnayxyEQpX9h7R
         Rvng==
X-Gm-Message-State: AOJu0YyuvvwlJY+K+ZcHjTwM2zhkyJwA04xZaanNF0h8swkZ13rKYoIy
	RenvgwVK5BArYue6FILQ5QtTIQg71NuHh7WeyLsvbEQ9UFtCGY6cRySKSlp1Am1J8OWL/CTGZkA
	3qR64Vjr5EC3HkEylNEFLvptTgfeNJ1gZBf19lAkdxol0xidtQ3AlPbBdUXjI3CuFKxj7+YPgjD
	nk
X-Gm-Gg: AfdE7cmNhlEpRN4GnNhW9iofQ7Om+hh0Ry1KbXhFYCpCB0JNM2VcluvoJvvQua17DbI
	g5tVMjnL5mB6AErgQkyYV5p0UzoLWRS/GB4U3G15WFn9i3Sj7XL12U41wpnErAounyGLbHIl61L
	+jkZljVsHl8Bs1A5YXdDl7VQmuzcufmIqCJgt2v8Us1rPxne0dTQaKNslFWqtwa0czHItqjZP5Q
	h2/aFrfOrZ4rRTrBvFs/QZNTe+HU0I7VWNOAUZUbrDHunF4uikcrztA0ch3Y3gDCwmxhn+KJ0sA
	dR0PHzR06fRZ1c3chOCdpZMQ4gV71jJ0NRurdDyrGlV3poO1Cl247YOoSUj6cYB/3dDj/fpyGE1
	oKU7pmXDebp9+u8Txny/TRIvM4MPHJgV+hDI=
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274121385a.41.1783321885164;
        Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274118785a.41.1783321884602;
        Mon, 06 Jul 2026 00:11:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:23 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  6 Jul 2026 10:11:12 +0300
Message-Id: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXwNUx8jb/mfHK
 hLpsNTp9rnB2k+gpTt3eMk8bDP8aBwj39Cl6XfTzOkZ42kCKyAGuxMLn/rqlZ37D3sjqimLkisH
 6rODUzTowBQ3ojZB+GbjSURG64haVQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX+BU3MvyN5iUr
 XE4vyz3hv/r9bhn8pH55b06PKjf7Ah4Q/NxNeOnRfwTIDuHr9q/9B+2aX3mjptCRKFWMJdNUHH+
 SqWkVyxeGoCd2I9vSUrL6bZoD0CFYBO1e5BgZVbpAMKxpX3CGjqiEqGbLbZUOrbW9DyGrnq/qNz
 x4BBBg1D6t8rzZIGAfl3+9F4ygIB9uVw0uCn5+tojpPR8tvW68VdNRCCtqqQIws3KiEcJfrNBB5
 ZF06NM/TMKLzTKVi/mcmZxu04hryD2C2CSLvoSOtBF5o/cusZBNgQ/MIaWjjg0+Et4maVGE0p+Y
 iVHusbSb14ixzMsYnYh50wj6A9YmF0A3TRKDVDjzHH9TIxleh0RyxEw1mUinVK5aO/aacrL6Qqs
 5XUkIq3C83S/prXYeo3gK0TyhexnDmrmb/nOB93T3A2kR3n6GtwwHhPDQNsOmBaJnXOM8qa+1wp
 3n0vnHTTCwJAMTdy3UA==
X-Proofpoint-GUID: k5TFYgJ7UsFCdhKmo-bFACusEFJlo6Ld
X-Proofpoint-ORIG-GUID: k5TFYgJ7UsFCdhKmo-bFACusEFJlo6Ld
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b551e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=iYwodULRRiReAau0VbEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66706-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F5270D9AF

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..a089b706f60c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
 
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
@@ -4649,6 +4654,82 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			jpeg-encoder@ac53000 {
+				compatible = "qcom,sm8250-jenc";
+
+				reg = <0 0x0ac53000 0 0x1000>;
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					 <&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names = "hf_axi",
+					      "sf_axi",
+					      "core_ahb",
+					      "cpas_ahb",
+					      "cnoc_axi",
+					      "jpeg";
+
+				interconnects = <&gem_noc MASTER_AMPSS_M0
+						 QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_CAMERA_CFG
+						 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&mmss_noc MASTER_CAMNOC_HF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_SF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "cpu-cfg",
+						     "hf-mnoc",
+						     "sf-mnoc";
+
+				iommus = <&apps_smmu 0x2040 0x400>;
+
+				operating-points-v2 = <&jpeg_opp_table>;
+
+				jpeg_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-100000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <100000000>;
+						required-opps = <&rpmhpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <400000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <480000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1


