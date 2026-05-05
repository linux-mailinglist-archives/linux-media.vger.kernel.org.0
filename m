Return-Path: <linux-media+bounces-60353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMGLHMGX+WmX+AIAu9opvQ
	(envelope-from <linux-media+bounces-60353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:09:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C64C78DD
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4203C3037E39
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10B540F8E0;
	Tue,  5 May 2026 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOUqkoS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ut2Az3A0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C340759D
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964522; cv=none; b=q7lqc4c7zH5sZP53zgghq1m2/TboFehnwnrPMYEw5vnnCUIme3cq66qkjnq7szbhGCfdhKtAAc4a5orIm+O5FzrkvH0AbMmZxf3fmniWl7LxDgOBQUiD32gaMVLYI+vqm0VximkKzIcFqK1ZmSLBBOAFpWActan9lqNNimXw8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964522; c=relaxed/simple;
	bh=RTc/vH0vt6hY/PLcGoh+fAhXOnRXNDvqwH0e2EW2IiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwQBYGxtZdFWggG3HyCvoJRwFnGeHW5R3o8wwscaeuQt6GFwDqYYZfkiHrERHUo+UfljPtulV9fKOIwOHcS7NvXvIeGZzgbpPVtpTe+p7np5ZWgkFbXCLIWSEw0Sqr1rTeE8/ZMGMT4t448q3HblR0R+GA/AgqNXzMWxHHtsNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOUqkoS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut2Az3A0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64500Hl11346341
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 07:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCm+mAfWcg0BGWf4HLB6gdhaUA9jwfO1VsKytcd9sLw=; b=aOUqkoS/py4oK1TI
	SbfE/nDLRbQEfYd+02eiTVJ4QI4xf5KAtXuNeDMvAMMGDHWYmSkIUgY224i2gwES
	Uk8E4LBjdiCxNxDAdku83IBgqB8fXQMeZl6Y8al70G7RmIrFPT4sZhA6UJnwN6nC
	iivw23ifmkQMSDTQD3rd0NVdUEgpNDvKdz5Xpc9azAOZFswSod64AS4Y9Vw9syRc
	oR15Q9Oc1ta/0Ds9ffxmRrdwNq4P+VHaLUn7LxAL9mRFSs8J4CA1PSbv5+hLMhYM
	DICQ1hF+a+oIXdMxTwzMTve3mdS5b1oUtXVEGE10DoaMpzS6FN+x/6qwJM7yQBTS
	nNJN0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xaurt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:01:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso6301174a91.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964519; x=1778569319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCm+mAfWcg0BGWf4HLB6gdhaUA9jwfO1VsKytcd9sLw=;
        b=Ut2Az3A0fTF3/eKSV9WZ9nj4VLUO+yEZVFEAnmRPU7KKXLui808ne/DmscqIHO23YP
         T/yfT4vbVbO/4iKBHnYGJyelPdp0Sfar4R2GuNh3rNDbpqZrrOZyTgn5F8bb2wCtSMaR
         gg2xwJe2iPZ3cs1Xww0U7vU5c3tLLLOMI0swsU331yAIqziXqPGYZXLXJHodiJJe3yZW
         EmX/zsA0Hi2nyX8DUt5GpaRB8dTKa/jmVR0oSBgrIXaqbmadH6YEaHDF9MNHL8caXjjc
         qgtRp4lydKgK5eHdYdt5yPWPtQ7BMxkHY8m0/T0Mb74UGoBuQgaFC3CYZ7W8BW0ybyKx
         zZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964519; x=1778569319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zCm+mAfWcg0BGWf4HLB6gdhaUA9jwfO1VsKytcd9sLw=;
        b=nlznFHjDDFx+gAT3y3ztCYxjAibv904pXbdbuYt8lk+xSloBSO8twrJPxOypgYG5fv
         t77s6AQQK26nLN+g+3afWhAUbaqQpjsN8Lw3d+jNqrvDfxN0iykVI6nOYeeBcN3sJ0gm
         DH3XX24WJQmUj7Lkbul8YuHPSIXmhsWyVKOa2372KACkThlOvwxLWOsOjBdaLyeeZkwp
         LuaKi8a6kQ8WMkeuRDFDq04newqOarobPJV5df2cucFlSlBm/QKKJGBuYFWSYrUZ/JIR
         6bZfdBRcZIKDxY9sMdWHmzisp2vLVBXse80GJPdS3pX1Q0NtunmoCRYmPstKymPcBPMY
         Uo7Q==
X-Gm-Message-State: AOJu0YxkLLdxrAneHjaq8FgzIlPdgte0icdedZyd27eDLAU2/PTnxvik
	P39s9qpADBy4Bw1GJrJhMupDkbKSfrn+unXJhqqEQni1UvTuqxqLVY43OVvYcFqfkNE7JceTTOY
	QwtWgo1DTWrQ/HeMafg0wLf14QQuy48ClO5ie3oWDSFRdawhtE20+mAkuaPeJElPC/Q==
X-Gm-Gg: AeBDieu2i5eeUkxpyvGxIKiLxF4Es+b0EVudH5s700L7UT0TU0ubIAbk6l/Ss/LpNZz
	gFas/UquHQd0M6vaaudjVIB+qhk4wBWmTu60xLa9B8cs3ngeiHwVjI5B8sChtoh5EcEmZq8fH4t
	BSGms8GpG09R0S3jiCrj3ITtWYjvvdyMqokQaGnjJ6LO2mmB/Z/TeVlqFkMN89XEn94CHhy8XW8
	+tqIc5gSw/lbA3Uo1YU73cCKOiKTJEP/N5+empnQnkkqNoi3QLOkQ0rER9JYH4+ofEYTJ9SxKEM
	Z0A1xOLkBwyMiwqx3HBEycFjIStL9Yhl1nQsQCU4wQmPVJotO35iKVJ7k/suojkK732k4+xBfx4
	5t/Wr6MGIcrGNFuusNO6eN669/Vj9pAnOaIzDmNZzpISuGi/1VZ2E6xlQFbH6lyEyXw==
X-Received: by 2002:a17:90b:4b0b:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-365722540e7mr2033873a91.2.1777964519124;
        Tue, 05 May 2026 00:01:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0b:b0:35d:aa02:d776 with SMTP id 98e67ed59e1d1-365722540e7mr2033847a91.2.1777964518597;
        Tue, 05 May 2026 00:01:58 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:01:58 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:34 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-13-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=4957;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=RTc/vH0vt6hY/PLcGoh+fAhXOnRXNDvqwH0e2EW2IiA=;
 b=BkVRDogYbI1Vb4Nl6mFnz3VKv0fYSEXqpWs84WEDH4JCF6mdHPwbp5fcnLZuwI734JvWRCMWt
 xgPCBPTPldAAoyQNYTBTrO9L+ESdZqjeogcpooUC1f1SVOEr2kEPIxc
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f995e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Bqp15myY0c88YY_9KuaTZDUBhJ1jzhqT
X-Proofpoint-GUID: Bqp15myY0c88YY_9KuaTZDUBhJ1jzhqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX6yaV0zL6s7T0
 nSRk15fOQELTzKj+9fRSfHBbulsFw2bme3ZvAYcGiDitBT3gzXChCtvjG3qMciqnMU8mrWwR1fK
 FXTeqHRRGPzXa9Z1V4a3TWRQUA75sqvvZFqJXEE3A9kuA7ONlAVRxzZTRDwUwHniinzUHLDNnWH
 4zir29qJCj3yZWcTrZcO9ZLS6GDTpE6NOBLmhXNTueYvsv1kxHwN5M3I3KMovmIFI0dPOmXslna
 MKWgX6iOMF6coRIjKApBjfZMUEdZqMI+aTyw8rUPtGLZ3ZgqNuNROms2bXCWznaC5yOQQZq5M6h
 HmB4duIxFjiA7XbXHtIRDB2uRyDj11GUv9ostqKHoL1fmiaikYAS61pZF6NSrrCpMXdnAHJXaRX
 aEPoGdjiacscaUrrTGot35gkDzWx/bKhJ4nkUok7RckdKLBTekyK7gQ6HylYav6ypCDtXakWJQL
 FpCv2vZ2X8bYbfZOtHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: 148C64C78DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60353-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.47:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
index 35aaf09e4e2b..8d6ea857634b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
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


