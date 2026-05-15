Return-Path: <linux-media+bounces-61681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OTsILkEB2okqwIAu9opvQ
	(envelope-from <linux-media+bounces-61681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:34:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891C54E8AD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3244D3035110
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E9147F2C9;
	Fri, 15 May 2026 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hERO8Hl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVqIhdUS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4847ECF1
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844293; cv=none; b=XLq2XNb2AOte4wKQIC9CbGJG5VXTBJLJo8ckAChzJaV2IoiECulgjh6KdcJWQYJBbH+i3Zc0M+9lF2tbKHrahdaByPwNHuodCXkRrf1KX9jgzn6niSB5KefN3aHBtDQbjCecVPK0cSHJiwjWvlPMfXfsAnKKdohYvAGqmLEL//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844293; c=relaxed/simple;
	bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlzM4lhTtyzouuoulVohnvNaVcul+LGF2+Tg6EPaaTnJUVPLzszYdAJ/UG+6ZWa9j7JQieTIcYkHZdKZeDfsAidXPoabjdZNuLUcqTMhf0uonSubgYTYFFCwzqo6iYoxr1ruHGKypUey80dMYJCwhO5IxcFnX9uqLbqN86IqvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hERO8Hl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVqIhdUS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAmWtZ4020975
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=; b=hERO8Hl3xPxqS3SN
	t2kMhuGHwde75G4FYB8m6Sr/8ihrh6zqw4NrEOWnA08R5sKtl6tvNhahDO1P1G05
	KRYymDA5SXXN9ViRrWtJnkH0LALa/BRdKdnGgq2dJJs8XI+4SOwDukUCYbZJ1i1f
	xOyLGKBB0V/FDsKQrCNnsDktcJtak7CSBE46jqiRN/Bb+ekEaZXoNiNeBwd+qbcF
	SpySJ06RnoX/0oED/ndj7KzcwlrBnytkxJpIANi2TVDWp9KxiZDzA6eKMfXQA2ni
	g+3pIkKX1AW2UikLDHLcPCfCMjTBqlfE+syXR433DLmTzarkVtYqblrTVNK90Hfd
	a1EI3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru1k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:24:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so8688404a91.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844290; x=1779449090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=IVqIhdUSvD1ZinDENCosrlQobip2OpSCQ7sDBFjrohzMEcmr2c7RyFds7XzWgwk0lA
         Wl9iVRrYwl/opEhH9kbL/n1Q25iyhahkUHvtg7NYc4vEbkP21KGAA4/j06mI/ooXRBCZ
         nnuPnZpz6BpY1ygf5b3XGo04pyTLcELUCx/DteXDI8a4LotNBCw7ltROdv82T0OB/Hl1
         pwxH6qTCtMHokPT1vyWS1d+6APSsapIzajjp21cQk83831DUYH8rbBJV/BP8st42KEsM
         z2ynOgC2Ep8f/q/rcSau/yJu4zLHTTYNRVaYn/moJ/radcRs9slqKQ81cTK2wTf4BQvo
         SWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844290; x=1779449090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=geJxq8Fym74xZf3sPrd/0n2hwRmsRBx/QMPFY1ao6wk=;
        b=pWY5gIarTZZp706FBW0dOnCn2nC2jytkWatCCicVcEYQLZHpTF3nQVeSf1x8ncz2xm
         0iWiPQTim+QT2RvMP7upSOPxdcYnpIDe06ykWc4IEoXINNyciPdTPgFbQfkbjZkutF+4
         nTfwHCyNLlxr024eZgrMCSHXZCHBFxAIJtZQci4V9g+qhp/fdiA83j4QP/6gUO3+2cBO
         EvU5RDN0cqs0VRA/oz/HlQTY8NEx/xngxU9EBYn4W23g95chsM+cSUV33MnX1NOxpPPd
         QJd8rpyNvVAq1ctuPsJ/GicpWgv0THQYOhd9ip5C/y6KTnwKVJPw+mBaJB0yuylN/Uq2
         2yjw==
X-Forwarded-Encrypted: i=1; AFNElJ80Q/ALWCQINNQM6dqPtnPxLAhOOFSbWcW8qyoTozHbNKttbbSXpbHo38XdUcsFkkyBMjYWz25ng7PDNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9d48J/US2S4xOWfo0T1HgtF1NFRJW4xNwJ0Q5ONO38oTWeGCi
	R9W+BmpmSvVJ98f0wkHRIJleWK6ICd7cM6zxzsZkAf1Xa3TinPB4MnGjvWGIuVzw0eGPy3r5C7v
	azcUDMbkc0iv5Oc2AtDLhcm84VPj3wQgIql/srBznDQ0vJNBa1ibFg5tdjItLVrlytZCYh3TZ3A
	==
X-Gm-Gg: Acq92OFBL8YUSK/fmd/uIOV3w7k4JnQG8M2tfT54BYgYRwJ5T1bOPyz4ncY4jkyg7bz
	yz6zSNUaHnbm75A/ravQ7mhfIkcBof2aH+ccxutZGMAklQ0IX03hOU17fkJr8w89aIMEklU3G72
	vuwhf1+nEYG33npEeDY7QXi6gT8dOiRXbWtxoGIWY/V/quaEO4XJdkVxV7KNL8SRWtYJjdQHWWn
	h2gi58K7dkFnann8pwPDXX5V0Bk4THywCLoodfYFxaUDI5EqnA8pdtO1p+6tHBqvrtUvC0Bpbka
	QM5hKFi1P7cPbSXrQUpVH900Ov9riMBSr67yI8ZnWOQrxDH9gP0rr2PInn98dWp9BDJ70Yuvfqs
	7J+ZB+blPRAPHhPXI4Vh7Momuz5xjzWu6YfZjN7lUkPu77jWqR1qtriY8sxHJoMxnGA==
X-Received: by 2002:a17:90b:5808:b0:368:b881:b2da with SMTP id 98e67ed59e1d1-369519e2d13mr3830600a91.9.1778844290385;
        Fri, 15 May 2026 04:24:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:368:b881:b2da with SMTP id 98e67ed59e1d1-369519e2d13mr3830549a91.9.1778844289795;
        Fri, 15 May 2026 04:24:49 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:24:49 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:28 +0530
Subject: [PATCH v6 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-13-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
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
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=4603;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PD1gpoX4LAukVY7c9h2PcdOHpE6W9WE7RaExHqCiq04=;
 b=RafsrPim/rP3V0hWeEn1IFZtpupVqQAaWH4UDuUEcPA1FE3rDk252otVElqHF1B667wj06Lai
 xA6l+LxgTOSAz47lfmEmHmMoLAbV+wm19GnyKSFgLI8CdZ5wqWGBcvH
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: XoEWHs82lJcHB_jwzMnamOhCr590ipS9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX8UaNE7csUNGB
 0sesHgsq8GTtaUs1YyXdltVg9ASNKDBXp0PguP3OT0auY3+EbHm9qTkTNr6Q8Z5EEQ4NmgOpPOb
 cMSiF457PzWjskSyWYHKIEWzktWY5fU13hNkYH4tn5lCvHeyMaJXSEf8a99qMDKdTnD57omMtpU
 9EfaiSYK18rY8IMg9Uh1DU3CRcjTGFR5ACn/thINIhfClb1/V9HqqjlW+ILO/FGiprDN5bjafft
 JaboeCkDW6Kdl4iayz5swfBAU9ZpFr6HezvqummgFDwae0baj0VzlvlzZezmwdIeXxRsoQ3jT3V
 PS8VUewL+4tZXF2mDD+nBIDU/1E50UqtplWZQ+ybqouCiHKLpECHk5EnL2oqloqMTYy7pWGyzxu
 jGSx4qgZIGOojsE1qg7wok7C/hjHR3ad1nWwt8O4cTLNWYrH2vbCOBcUE2lfZy3OYHiiKBUuV4m
 NSKQ59uG55LIwLpRsHQ==
X-Proofpoint-ORIG-GUID: XoEWHs82lJcHB_jwzMnamOhCr590ipS9
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070283 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VYrRtalYO0MCCBblpesA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: 2891C54E8AD
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
	TAGGED_FROM(0.00)[bounces-61681-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,ae00000:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com];
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


