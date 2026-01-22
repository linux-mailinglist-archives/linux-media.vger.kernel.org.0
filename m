Return-Path: <linux-media+bounces-51344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGvCDEQDcmmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:00:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9779A65A1A
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B4E880B5F7
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CF63A35DA;
	Thu, 22 Jan 2026 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXCFtWKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgAPMvA9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B599442EECE
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079014; cv=none; b=JXyuUD8mXUbehFxNcbtDawovLPMDYOPthpTLqt2C6vfqcCT/ZDSphe4+BO9Tm62Wad0qtwRq96YXLcWCgYAib9mWOaJZJzs6XnS/6rx30aHvFJaIdXqcDhqekENJSTz5Y2hSLKxGek3oLQQkwduMt2azPkWEKc+B8fSW7oyU5tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079014; c=relaxed/simple;
	bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ahzimf6elhGSYvSxJIe9KYZyaSEmYpkLqkxhnJ4YSkwwOCavKAWsxViS1KnrdtsZiXynEc7q43MrT+LXvJmllBBYdNmLVHcmIKD0A9o1VW1fNGs4+QUcQntXqPONAYDKGLE39iwUDX+P9BxiscgiXlJ+vyItVxXZ1RnsYmZtpkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXCFtWKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgAPMvA9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8h6aU646221
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=pXCFtWKStN+tJu7A
	slfXABaU/YsMvnGguwvei3HFptmC3STtQRjRQuArIpsmd71xtHvBIupXnvrDEhk/
	HMhyW10V9h3wfCpcQqgx0R2S35qM1i9UTiZlWSFIM596axDZown207KKE39Ouz5s
	znemym+CjIADeKUXiCvJk94/7uhiHaD2dtpcpG0x+ELAfeAm9Lwu1GxZIpBSOogR
	7HhOmno+IEyqC2UrMmKZ1KdhmYxhD8SAPbVANDLhebjdJxnGXgI64wJROYIHW+6B
	suXkBJNTTIg0ed7gt1AgUIb1d52GYWxS+H7VGBkwgOvoreIYeksJxBqaNH2T+LNc
	WXtJ/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9stmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-502a8fa0a28so29130581cf.2
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079009; x=1769683809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=CgAPMvA932sYvrYekyMptjY1NumFE+wVn8q2oI+v30zCaGm/IqgQdKGNqZjD7lkkZi
         aV22NtlNepNrCw8ITJwYcexzaKlXnB+ltwxL47r7SoQPcpARcxjQN+Zw63K0jovFWoa5
         g+k7+tdMyKA1U9XG7ptR4YNtLnOz4jdqC4saAYdAqOK/XfZrcHtVHYabvvlIo3tboyYt
         /u3m0qh9P7Azn6u2YpKJlS7JP9ixEO56FUspmGHgVAuk2durUhgH2wJmD/TqzJFKSUk8
         OuBsn8rgCi89XyWybu9qbKh4MapQenH2vmDIkI138VwCCPx32pwumg2fNsh79sNvGXZO
         D4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079009; x=1769683809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=FN3LFX3rurYiEVRSAQog2ZqKRszYQxRocKin12Q6biQo8KrdleDd0QtbXvq9LhQzO6
         yA+F1AnguPzMbb3H71RKP9sz4Maiq4VrZXomDF5uVNJfzQdknkpY0uQ6pgmqbpK6F06+
         T7OXs3U8ivK+Iyv3ln/AOG7rpjrW/P9lPZLOdALafw3hr8rveLOz91JdH8FG+Br4aG1p
         FZb5vd1IyrQcEcphMGA0iKF7tbhRbGwb5NRHe49Qnlg8NEcNurv25QbYIUq/9y7qg668
         Ix7wyDRekKvhSAjdDgtWthbf8Ix1QPJ+6b0KEbd/PNULTEBUQrubhB00kV/eVdgY7pAQ
         2dhA==
X-Forwarded-Encrypted: i=1; AJvYcCUwIfbgDRDlpn2gUXtfLYlsJ1iE8uokj57oiSpYw7P3XBDKbMEs+hFtfKUQsjon/m1lWhEgtWGid3uHrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4Nb5enV8uv9hxaXMFrEJvZqukkM6qthIFENffh2in6lNrsAT
	EIAh5h4KGUPttAwEyJAc2zffntxzkrjQq0M6QHOoaOf6b9PmDjCwVcYdmAOmF1VnzXYuv4Xl+fD
	8c210wb+YQ9z8cVmHlR3BF66vmXufzHymQxs7a9m4EDEomoiqa+zhu1Iw+by9ZR+q2A==
X-Gm-Gg: AZuq6aK+GWcmbsXggJHdo4sQyU8Gx+0xPCkZ3WhcNreozEW4IeedAVMhkOb1vx/7wQ3
	KoQzUN2f+KrHElnW9FT4qkblhTeK0+YCOWyNMJNFa2SFhTBF6JiS/a0ifPXZDRClNMv2/u4pSz1
	YKe6rEhDkCLoLDQRSy55tqtE8ZYUsjrHTE/GZ6j4vDYiec9aWoqErveGLy8kcxZexQ2Qb4IWRYq
	gCU0J32gA8UeZl/Hu9SU8wDAS8ds4ro7+6257reKmN5AwxnPYjjBlCh5zFHTK6bLM+0rASLRCAr
	I+tMtAJcwpXaX7Vdosq1/1v0PsIta8yZL8JoMlKG8S3a9R8fQEPsqrkhzUw4y3T46YGHY5osyzV
	NLopfDU9CuqVuZ7uXWdkovoyUnw7l8gc5i41NUL5lpnNe/eytbZrr5+0cmHMAQUpeFfN7xnsyFr
	a4
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886731cf.22.1769079009359;
        Thu, 22 Jan 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a05:622a:180e:b0:501:3c88:131 with SMTP id d75a77b69052e-502a1e05425mr286886531cf.22.1769079008952;
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:50:08 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-4-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=8b2oOOOPX2SdYaNULjliR8pcPHELaBMrn0YzW4Aoq5mhdvzr1KSJ9jHs5y541HZm1Mu/hUPLU
 0xawCuOjhDaDEslehWSigU9NBuW0C/AQjJkIfSeruRcugbj2FeHIBZz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 5uLYIAVHvEpEYB3U8carlqwI0TJ3B_uQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3OCBTYWx0ZWRfX+tZRMIbYxnp/
 c+xWE5pWGDBlZgsSGX6akaLLoLJppHsTSlt9fzJ2kT7AyGor3x4g2N9QnlHb3qR2iHQK0tUGnLW
 VRELzHlSwu87zdl9qp8s+nWjkSr0+2f9kpxFDZqj2+7oiBWQtOzZNdd6kjus8I6nsGELYce817Q
 19knYeTn/I0qJbVRAYIxkHjbpPSxz6h71ra+pYWZlPRgRRBESwAM0zpk43XRf631Dbu3HqOW9v0
 ceCkxsrYWaewpJmEIIpYxwIfsi9ER/l2gZgTOdEb7voB6qrkO9wu9dOJ4SS/v51Y4JiYx01q4Cn
 dn+sXxlKS9KIAQdIv9/2Dhp1c3SZpOu9PP//gGcVvq/MKbDl0l9vOAUr9Qi+TvOuPFoNMdGzTIr
 9wXhhivlyL8FMV3aXPNVvwehXUl6iDGMs7tUXHnr7EMkzHW1K5IzUaqJcIqQ8u4GvRR64iprxQd
 vnry9a4prhqgpXmm7JA==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=697200e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 5uLYIAVHvEpEYB3U8carlqwI0TJ3B_uQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-51344-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,0.47.77.96:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9779A65A1A
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


