Return-Path: <linux-media+bounces-51508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPSbNdc3dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:33:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50931813BC
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61B1B3006796
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053A32571D;
	Sun, 25 Jan 2026 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rqh0klR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxHsdHhL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA32325737
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355197; cv=none; b=JZjcwoP6n45xnV8xVL/WTGIcnREPf3r31q2wReTDKvff33t2OK5jew7uc39lQmywoEyVls1vukq0tfHFiY3Y+nD4kiM0CnX0vSvJBkYnCxkmgLhjWCKOhqzvNRfFqu3bWa+C3GgMRsgWbxKt0pq10ecdSCiO12rFvlTPff+AFwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355197; c=relaxed/simple;
	bh=KR51sK/8+Hrks/YLV+YZPJvHG7uJqvASVsBsq8BP4dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0Q9Mm/3S1gPg634SGDb+lDaqeuk7YuCa4MxqkomlqLU1JqVP3C4NTyAXKol9aqdQ98ueYR26nkZ/aAtVh7HXauAUGyzXWbgfgpFEfEWPUVcgmSlbAufqm3NytyMhC25vJrTgmq+w/rY9QxCC2WnDUuRp2SZLksbYCANtS0/HGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rqh0klR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxHsdHhL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P1sTo71864940
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=; b=Rqh0klR7yXSb7Yx4
	02jRblaAZZJO198xxO/akeIxBPG7UTNT27rWirOad5mWo0Ia688q/M+VVCF+LTCR
	9Grn9PtOUops2nh1tQd+sOClZ1IxN1Cdyqfy8pGHSOuVIFKnXim3OklncN47FhFO
	jbdnN11t4TujaezY/kGU+BL/rx9nNeFSXMJ30PRfnAHTlkUtGgrc4m40xWvWiQPw
	jbe5/wWQot/yB8q9MxuHbWt8JkyBogI5KLohaTpghhvvvwALyHJ/9dx88HJ8ED0P
	+tzwT6hp7eEkGGpQA8xlPkooVTwy3NGFpNQvYgc7TVdqC5kYc9HtKJ91nd49Shf1
	27XT3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xta2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52f89b415so336908885a.0
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355194; x=1769959994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=;
        b=NxHsdHhLavmlcI4BjTrR2zSXTDyWIWcTBx6XydVzrcS9M+W/WFWGgIkzTK6BNTzwYC
         o6Hz3Orp3Lr39EOMqQFzV9LVjVHbrGvsP0tCmTINPVjy2NSo0FYlTELRjWiBJxbwWQT4
         pO0QWfKxGUylPjg5A5qD/6OycIFLkwmlxgxiRlnxPcWrKArvV8KDJvR2QaQoJ6Q4zFVd
         HsRjkx+79NX0CUwMMFmufHDJRCBYURFBgWlp78oDnxRf/tsHzrgfbxedVftQ+RzYZ9Fr
         G/mFS/9YnF8DYcw6qFMDlYGX0t80R7svOxJQwPCeqN7i7SgjsidGFc46HL1osIUitTiW
         SFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355194; x=1769959994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=;
        b=DBcfJmpjg+zIajiGwFrMkcX1bQiK3M9joNc0he8q4TlqZKDInJk7EIe0mFZnAsTJ5u
         wP1uyLtMyy6m2er7ctgkFQO1ZhQINYA+B8SFsKNB2ZsLshPHOuuF1fRIlBmK387rWG8L
         H32FJmOKBJBsRWsW60GSLxoqKMn1xmcVjLAicsj6aclYTNwwxyik/kZLZq6SoIMy+Aks
         MPINdWcwTPOeVZOu5eHUHrFtsO8aQ4GW55PcV7BQreC+V/ZEFyvYEDhYA1q9zQZPENxz
         KlY6MWTdvfbKHNZTgOjvGBggP0KG5ffTajWv4o+ZPAKubTK50zKoKumuXD/Tnhwqd0+S
         vc+A==
X-Gm-Message-State: AOJu0YyVF0imkNhW58Kk3WhEs+GEracwhb5NEWXsa/vbBkqQTiv1EvbF
	khaUApLuR/D4cyqPVdORLZtzHvnCBuNZkhFI7mgaJg9CZJ6J4J+nRsuoE3hv84I3qESR431VGoc
	8DfvSPaHgz7NtNcecox7hDccidckpOi4eCMI+ixmYgxx6DG1To+QPl/7PGEcQBmtBEg==
X-Gm-Gg: AZuq6aL7aHsTNk8hJazxQdv+SaZ27P7KZ3ewnOQN/+n/fXDF8re+5Hgoc89HEyry5C/
	V/UKbtm1F+ihbaP5IyDtutoM9opkBpuiEI2CJzrsXISB12137m0tb9RXVpMM16lu+FiC/EfyTZx
	FaWxlwoV/OxSmsb6Ysd4EIZNiwGppxdKdYoOBwNWw8/2ohRE+DzbsPyXfBjPV7wp2po/EhB7gCt
	+AeJCg4FZsqWSsZe/v7SGE/3TWIPwkmweuhAdZhMshS6Z/MKWVXDiPzzHFc7W0TWTIwgTazlT2k
	tWFazRwsnqkDIADVYLEniI31u9xeFCBTtcr5+05eOrLApmTRl2gIY3GfKKyERWO0e2f0BgF+a67
	bOMHXx2+y+X+0mkv1V3+er+3rg9W7xzu34pvIXY8dKa7yiGMGlvsfj2nQrHUSKZ/zyRxryoRszg
	CqRn/36QdIFNAo2htprkw9qC0=
X-Received: by 2002:a05:620a:1a10:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6f9654645mr210368585a.60.1769355193791;
        Sun, 25 Jan 2026 07:33:13 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6f9654645mr210365685a.60.1769355193345;
        Sun, 25 Jan 2026 07:33:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:03 +0200
Subject: [PATCH v3 6/7] arm64: dts: qcom: sm8350: add Venus device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-6-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KR51sK/8+Hrks/YLV+YZPJvHG7uJqvASVsBsq8BP4dQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjetEghfU3KklBHzmyIkcPigLO/qH6Na6l/SQ
 SZlHp03uMiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rQAKCRCLPIo+Aiko
 1dIlB/9wK7cmmdmLDtxn3hlzXhgD6ngx6fHwUXsHXKceeOWEtBxpue+yO2WNd3in3WaxXlEgN7A
 0jnpaznkNB+lGMbnrPGUOZbdLy37faVT7Lg+L//u/APitWppFKbdL3ujZjX6a6YIliJtHvI/8Bg
 Hc0NT2AWrFlmrhRRY1xz/TXvjBXZgIApU1kgo5s0E/x3INPwXw7u2Nbyqi8UZbwIPGD7FY1mcQG
 cwOvmjMTI4mjmo0+6pVoFlDDrgSL7+aUwPAVIWg7Vv3Kgbtw1u2lk8BG9ZTYLCYVJcXaWmCaSiS
 wQhZBLsK/vglcwCarj/aCj9XzLe7HM6fdvlUmaZdN4CzDElL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: RUCsV2lxLgMKxMsJVEgYx3qfqfPqFlhG
X-Proofpoint-ORIG-GUID: RUCsV2lxLgMKxMsJVEgYx3qfqfPqFlhG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX/PWkNDORqaC6
 wYs0gvv4d7zVRP+uZnAHVUXmolA6H5V0ojFRryRFmOFNwaH8UupwztBUKYaUApOSiWgiktuMhpA
 LfQUjBxS2b8ocqCrJ2sOMSlbYpBSznP2ZBVu9DCavuwCJQoIIZnVB19UYDPwtoaTRoz/+NDyyEa
 S7qs/zXiXun7UBl7v9LHkSjgJGgXGX5PBeDcNXMxGL4ubI63l1GdA3ZZNtoZYY/tGnHWFzNWqW5
 N3W7TUbcJ7mlyeuYZAXqyN79vX3rJneuX+9HSj+v+CN8Wa1xk+WFm9tKuyPyRHs9mRmodj2nyhG
 R8ZlCXTswXTTq8vFbf6iZBwDkW4WXcgZieYbn2jIhVQZOl0yMdfaunMSJzg15+bgNsBW8sDFctq
 myzVc7lZ9d9yxzbTEB4OaVApQPIqEzAZB5vtMunxppFHsmIUrtVVXsWYcCTV/2y2W+SoHqZyus1
 49q+7TJh9ngU7vrrqOQ==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=697637ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OyNfseFvsq6WzarXZFIA:9 a=nwUz52_nThrR2rjS:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51508-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,abf0000:email,qualcomm.com:email,qualcomm.com:dkim,a800000:email,ae00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50931813BC
X-Rspamd-Action: no action

Add Venus and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..7aa43e3a274f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -2745,6 +2746,78 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sm8350-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


