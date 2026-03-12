Return-Path: <linux-media+bounces-55509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOSLBWbbsmlMQQAAu9opvQ
	(envelope-from <linux-media+bounces-55509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:27:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56B2746C1
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05AC030BD8AE
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A983C7DF2;
	Thu, 12 Mar 2026 15:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KuNHMZsO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxyFKixm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2E3CA4B4
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328479; cv=none; b=Tl+KL3oH4bU7+zegX3VumMOWKhdnk1fYiLVZ6O677wKdQjnP6SgvAaUDUf2AwJgc5Om3AZUtTID+xdoEKjtch9I740qHoZosyRRiVHSTkUKk+G0sDcdFn+Jjg0LmPVT6wyeOvGu1pJXlFWKkMBcQmcYFj3DCRLVfWstZOBMs7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328479; c=relaxed/simple;
	bh=eKAozrQ4xY3ezZ+7fjpNR39Vr/lnm61hf+9j71Jz9qI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQsvlEHhqTMfJy7u67IMwZbzjDdDCdzcb92fVZX4R4MuzvQI5kqEZDyFWbyJEZS2Kmv6c/gFMGi/aFP6vTMr3WfxnDTEVKuyFFav5FaJZkbiq8Z1ENzeTjXCF9vHWtmtNewpwmOFZbIwY4fOQCNeuqB0PRd7urGSe/ZSw9bZohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KuNHMZsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxyFKixm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9J00k3137406
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=; b=KuNHMZsOmzOINone
	ZFNqGNlh4Deg5591dDvy187UjtYYDeYqUjePW9nt47veIpGvsdiesj7vfat58nmL
	93Z3QE3j6ZiAw0kSy7NfTpFEeVvJukViB3n5xnIWrcyp+KLoC1lcgyemp5LVXkt4
	pur6Y8LydoQW68lpogZGpPP45O1V7wLSkB07PpG6ZRO+yWCrN5BvrFdQVdGxxor8
	Z2GoQPl4hN3XwKJeQa6G1JZjTur7BR+37sjUN7G4Kn2b4w/prKgn7RoE+styH6dP
	NBrMNpX92nxTFcCdInqZhh78Uif7JUuen+TX9uPlnnzps12G4NiVxQAi9uhd1/Ck
	u8qKJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wahur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:14:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80bea54dso656032685a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328476; x=1773933276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=;
        b=BxyFKixmnOlBCozkCZ1DYZ2xZhH8ftPN6lmQ85Avrwo2bl9esietYP/5NKy3ohWU3V
         QgPaND6H9CJ1gNmOOemZ5tv9r2lkp+rbY++qlQMKpi6lx4sx2HZ0ihk3y3RqjSFYhKJF
         XLw4vgU2V/9r1KAzFv7cEO+fbSTYwAqt5Fd4mPXVIvnmtMqn+SNPqz7tCZ248eGoCK2e
         Vt0y48mchQNdogfYMHPyqmcnUosYnXbASoviJwE1osuBF6NNV/2Abq1jpsqQKMI6fLlU
         rsQJDcwQ0YCDuxcUSwa4VoyEAEp0tjklWAxjnBM4LNK7zSbFNyPjxW91BRNREWDokUme
         Zycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328476; x=1773933276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xED7xEN4TjTNrU5iXSzFR8ZMiko58ch87aq5Y7kzU5s=;
        b=vqkdCFE7MnO7n9ZYypQVnC+zayqZsOC5Du/ZH9JK8W2Wrq2fJbueRkGxwMlOjiTZPR
         9BJRjC1nBnQxZK8i8ATWjM2CgItqF8uXwsqgZ5Xib5oiVeUR2UL31HxuklLBOS7ESA/Q
         D7RaLzaMt96VKWu2vnFhGihNaLxKqshOI2UB2+U20mK3wiUJDmz+hRBP2qdWWUSO7EBu
         Bwaj04d5wIwbvR6DwG8MPZ+VrY04WeGLUPu06foGqJ92Y/w+/08LtUvnmm2l94+kP6OH
         EL+USrj9SW1yV8FLUCjDq/PtDkRLuX4g4I4jD8oWa7DX9QoRX7jAFknViWGCwYYUW7TU
         PDWw==
X-Gm-Message-State: AOJu0Yyn1ClA3xab8aeopaXo8z7UUqpwS7IoMWExkjwXfaa1CiyAMkcD
	YPAERDTdbhxDdyu8MGmTiYbcbnrPWUMBp+f2V2dWmSSrcQczTwIpjHmakzYSmDNKPeTswB4Trwd
	Jb+PaYtyyQfEA2tCpvAonQzxh68II2K/634GLVOjpLNlsbulSANVrGvXwRv7/LMU2W9W4Wp8ku+
	9t
X-Gm-Gg: ATEYQzwoJ8aBjkdm+zH9qYXiqoQZLs2JAOCoQ+cxYKPE2Hjc0cXQXm0vRXHt1VMQhL0
	CBnyAwSOP+eqxP7WBey5h/u1i76e4CK+usxYMdU0TNVnxfzu+MV23U5m27eUGGju8qhGjT8eDZ+
	qUpgyBQKwYKvECtW4yEIGPsTToy9TNI06rCtP0WES45uYL6Mak7l602Y9JGGcIW5T7H04Jkx0M8
	DMlHsL2jlAHOrcMKUbuXcjgz4oVg85KEJrxu+4HCbpo9DO5BOAsPln/eSWH88jITUrLGokkmjF3
	ZSPByvePs7i17KSzqz0ytcDyTkwQMhAz+agVBZ63cpV/sPFVSSrwOwNS9TFAgJz3urwppt3ajRu
	Vvy+ZXI8UaKN2KF7E3wlolpQnSPYZhQAJPVRmmg+zMqV6TB2EqDGd+Kv3banBdez9EEw2JObUJ3
	rKuICDNEa3uTNss2FPhGxvZSEdwkW809Tjgnw=
X-Received: by 2002:a05:620a:2a0b:b0:8cd:85e1:e201 with SMTP id af79cd13be357-8cdb5a17fd9mr10917685a.11.1773328475574;
        Thu, 12 Mar 2026 08:14:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0b:b0:8cd:85e1:e201 with SMTP id af79cd13be357-8cdb5a17fd9mr10912685a.11.1773328475110;
        Thu, 12 Mar 2026 08:14:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm972822e87.61.2026.03.12.08.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:14:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 17:14:26 +0200
Subject: [PATCH v4 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-iris-sc8280xp-v4-5-a047ef1e3c7d@oss.qualcomm.com>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3647;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eKAozrQ4xY3ezZ+7fjpNR39Vr/lnm61hf+9j71Jz9qI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsthRIr7rtq1/pB9nZ34ZekIr3uo0Gp67FKHfs
 S0O31N+lm2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabLYUQAKCRCLPIo+Aiko
 1YXIB/9d8I3nIzLbz+CrGH34ZYe/jmWl5OkbWwNUq00+TCd9VpSBsl4WlrR2RkWQr9GdrbaKAKB
 2NM/htvljw2Aqt36Vw8sKLEyDDhEgt7vbpiW941Gx+onh0O2RTTPwFjhxQSlj2b49EwUyzAPzQY
 wP4CW3CknrAkmlRgiuspqR4Obde7stOsewr5/N1Gbj31DrW4iq9EXK63yC2pXXbE8ookYxAXSpd
 TVyM8QB+nRXaIw1Bxedn1AVty/13i/01rK3SJmdsNll4+/WEIMtAObeNNA0nhlAH81UzyWcUbh0
 2bOs8w+ccnX0j6j8zhlC6xG2JgAZk4RtTR1ncYIizwce3r/Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7yqIZuqwM4pVAaqgC72bxh5_ezyUEgoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfXwq6lgymnOdYh
 gtZg7Y0NBczIAPNgYkET8SS9SQBv61+W3NIkdUzUq0g41YOKIQMtl51kq0s1oaDL0Mwzs9fAuez
 9xg758CKcdk42jzdGpnP1H9yWpng6oyQJOYgvNb9zwCKJGP8wHzJx7bwERgH1RiAsE+IqgkwOTD
 2tS5+671YK/6LW/1MZbKF3cMggUzNWbYcVEdYzKg9AmEVXBzAV76tlmIC7EfsV1WJ+1lq/5HobS
 jPa9vGF/lQEeGUZZYPmsMqiQ/ADJIdj+w24o/R/Ofhy+nIOuKA6aMn3bpjaBGFARSBtrx6mdCb2
 ij8YyLVZVQFQTVK3Wn6iRoir6bHz/NNvt0xxw9ahjwqZbTvdoq0NdatafpJ4/cCluiVNeiEhiHs
 HaD/AwwKt75v9seG+BUmuZgtpQ8Shz7rqWiHLhZnhIF6ADw+TwXiAePFNkqEyESvTgVV3/Cbh7n
 tjRuvHg80pH5cqDZTrg==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b2d85c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=WGqYyZY0-yHm69Mv:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7yqIZuqwM4pVAaqgC72bxh5_ezyUEgoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55509-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae00000:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,abf0000:email,a800000:email,aa00000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E56B2746C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..eedf677a7070 100644
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
@@ -19,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
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
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
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


