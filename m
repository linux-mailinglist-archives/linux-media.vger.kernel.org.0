Return-Path: <linux-media+bounces-62817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EelLyHVFWrRcgcAu9opvQ
	(envelope-from <linux-media+bounces-62817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:15:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C95DA72F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 738853021EE8
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654E2407CF5;
	Tue, 26 May 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9y+lIH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKGXAar0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6C405872
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815609; cv=none; b=Cod3mwdeS8Iu+XjuvCc5jnUySKIJp9Qrj2fFhSY37uCsAfC+jw1XQ2ZfVImRx+xGGbJdL7f2QR5QSuTpm6BUxipBReSXHx6+ukYJhLnXmpBb9hEkbfhBMn4Pu+o4C3yT218mR38tLsh3xQ3By1VdbAKNoBsBq+pt8FK7+8a17UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815609; c=relaxed/simple;
	bh=5j9HPHByrjfIQ9lcpGSiDGJ2ss0BLEntTz0H14pT1mE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKtmt8Vmr1HnpKZOhZnKOCbhGx8jxzNuqerKk56ltgdrXIKX18l5WQBwr3YU1MLOogw/dnhC9oA/y3jX6sH3sami7Obr3RiJwpBplFmPiuTW1no3AeUkKYMJBcvMOnuM2+bOWRpFN25/8KLLGIZICco3eYAaKFo4CDo3bpybTQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9y+lIH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKGXAar0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1AuZ2164281
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=; b=Q9y+lIH9xCTcKaBW
	AzF0h1oAqTKTvG41lwd4fV3euOSkgHjEZJRZ7G66jdsSFW4Q+E8clAX2f8VGxICZ
	wjbR9qxtgMKoOr+CFmV5ttXt3bQ2OGTheN75GcChbPcZNURn7a2v84vGEfIgcvOh
	1mSd4fAdJpgl+xwriR2yNOB4oLto8lZC+V+wH+Wd/BCKm6slGrYoFn2kyuCG/UhB
	jabnJqljcHXinvRfmy1LS65da2JtHkOXEeWtw1hys8xmY928+f4v880B7JmPI4+m
	wDhi6ivDx0P8u4HUEgAMz2IpBaq+aSKnAGqZwa1uc+dDvaA9xwAPh+Clnkib/B3k
	opyWtQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwwcf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f85179263so12515103b3a.3
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815607; x=1780420407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=YKGXAar00htXfoSDcGAEQyarHBRcidvy1ftBJjerk1z8z1hY2fIpLux6Fw2VjxJBw6
         m+vdsfweeGO1e+Fyv5MrxQKVFvchnp2xE6YS1yoWtRXmKGdf192aovcsqglRPZV7ZOGP
         YE8KNQ2AvGwakDIsXU0hz43ngAbhE9kOsNrxryXbUtJvexblYk009jvWpfAliMfG1x5M
         UOEwRl+f25LWFf1KkCXVY98/hZOoqOVmkSbKLL99+X/jw8WaiveMiGUq0qOXqF0u9h+Z
         W2RdxXuavJD+/erJ3UskU0qXl7HFe5KYpVpqd7mxgKRJWl8t6TCEsu+HD93QAamXe3Jx
         hDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815607; x=1780420407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=B50tbRCxGPD4kIjL97+jCVKwnB7tzizzLXNdXeqk82L7824ITug7tKGfSaNaX7A5j/
         qcQcz2VZ3WYW8YczsB+ii6a0rA12v9CuvhFR5ipMokjUpLEdDpIw6buqBWVf5Z4eGjrT
         bWpmta11GEYxzC5O2cF15kIv15CCj9Zpv2INLWurSPKlSOwgduT6sPhSUkSx+xtlhdl6
         iHR5y8SanYWPhAMLEYZgBtXpTZGy33Xj/1Zk3wEC+gQ4xyMKDqHaQgAU/iPHTvg9X0AU
         0iQP6Co5qKu23gegAHZdqI1WBpR5oGqnz5vKX7TUcnT+ipMb/VM/6r2V2efSYJptre+Q
         Rhcg==
X-Forwarded-Encrypted: i=1; AFNElJ+Qr/GVCl9g9W2fRqI3zNh0e+uMTf1F6YPzDIJyZKGzXzhiJ7/Et2KaygaUjexGWsUZUPORrfrd95rDog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBS7MV0SNOAWFmGRYx/rLnpFI935NTdWeYaCVfTyuYgyxBYSNj
	6m6HsC0oF1R7Vniw5Sr0K8xGJiJqcqfwsjhwffgiwFSflaeXu/XNgGDDNdNZbVd1jg67phfYohu
	D9b3p/aEUizEKlhdGFoRDGvEnQzr1PrN0UKCo8IklM6jNbo5C9patK0K31+SU2yHgrw==
X-Gm-Gg: Acq92OF467CCgj+q24u+tlcQB8StvAE1MwdFIup7SbT/Nv3KYYnSwl6EML8P3Tn0fZn
	or8Xb0udaG+Gza1f8GirRWPbgOA4SlZq9/EYtudKSkoAUOI8XYT/q7N5y8nn/VvI9AsWDIsHor8
	67zvJyxWGZUpdGgda92CVGgNs58bDkOi4cHItxnJlK3ipR1M7goqPrCciIT3G9icdZ7ZvuETBwH
	5JtGUOomwNLzL7YP0TE3UzGWv4nyYX3HCRNlEbWORz4ptmgfYVaZsVXBkoWsJRDBTEa1ZNkn3UU
	q/DzyMvD9GCFXxlxPfl++Iigpe2JSNvBub679ZIJcQwyOtH1aB2ZDcCVMyU85klxM8+zBfzOLfa
	UDdw+wX5/h2mxZ9es3nSIFPOqn0R0Crry30RGN524ympQwJeon+p8nlD2L7LE8ac=
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365426b3a.41.1779815606912;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365368b3a.41.1779815606442;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:48 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _pbFlhKGdwnth1-kssJiz945KYAZgfTr
X-Proofpoint-GUID: _pbFlhKGdwnth1-kssJiz945KYAZgfTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX5KR79DBYf0lc
 9xisLGXVJa8mLtzwFoQ6NKAhoqk167Yo3g3zf9DeD5ffUZOF4Lz84yYWYdtc8xLP/V7VCTZ+DGZ
 6SjLArs76GGDVm4kuS81cKZQkrWR/HwhaDeX0Ww5F/eTy0sRHZJ4R/x8gIY5t05HIxVCw82TVY3
 8RqeUW5jHhR8+bICcGWHzdD5RIlMwVSvqnA+l1h6nRASr6foc3BlcWLXzhfUvTxosn8hWLhkps7
 47RwhOIEkb/C4L9lpegPRfu0TGnShTTnrA2+XoGdIzhNKePWhNnbG1f9GjoFqWKtOkqUEOvGV8D
 9/aAxwTy2gGoZBeuxl6ssVxj1nSyBk0lRoMfZCHeWoW0HznXN2O8ZV/D41zttoCa83h+yu6QulP
 PkV8kvd09HSJb8SxhpGT5gvZYYkpIfEcYwXV5LPOcVcAw9mdpftklMg+RDPSPImPKGMXdMpgaz2
 uZavEIb4GkY95Adj4Gw==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15d4b7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260149
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62817-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qti.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,4ac0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 639C95DA72F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add node for the Shikra camera subsystem.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


