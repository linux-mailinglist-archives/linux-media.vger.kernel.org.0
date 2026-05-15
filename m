Return-Path: <linux-media+bounces-61665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMJuIhMCB2qVqgIAu9opvQ
	(envelope-from <linux-media+bounces-61665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:22:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A55454E519
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91D8F30AEB55
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C71E4779A8;
	Fri, 15 May 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmamHBiU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNl287hz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A0447CC70
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842623; cv=none; b=dz68HS+OYNCYpKKySv3MimxmnuFyhxFGrSwLNHvvpkBK/D0fnFWHO+9rHRI74PMJeGNAEkhG0vLNbVPBfCy66IbR6r7cnJ0NaEQqIISTPXQi7a6lNNuOV343qYYPj+F7OjesgBJBWHZs/KmESR8M5TnU4Ora/g4O+ZQF0oIimBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842623; c=relaxed/simple;
	bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3JGkX5R3lT6LF+sCByybvN0YUFE5pHDCezrKf5EkA1ZmcvkZVJdg4JQDCJg/WvjG/TOJRom8BzxmNawiJeQWaCUilktXyOYE3b44RaghurXL4Pg0YZ+T4s8O5m6jKT5SH1NkXrLXwT2cG57rkrhx3AH7YktDJnZcUAUNjsNGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmamHBiU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNl287hz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59pQT1847949
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=; b=TmamHBiUCpcvT+bV
	k9/Dt6e5yKaYYEetpkxbWyYxXEa1mCojMJEUujMi0xvyrwwANppk40A7V3uw5HrV
	Muc66vTQjRNYBJzzQ0XZeUkvQRRC19uYzXUah4IQFWot68RQd3dbo1k8/IwwtT85
	HbrnWp1bDmfpSGsMCRg8QupRo0+oBA/1yX0yHuWzfzZ7LFWUEwNf9DdrwIlszP4I
	mqy3VH5pOeRQmgToz1d0jgISz7elvBE6GjTgaFEJ/EkW8OYRfxdHgP42HUMGajN1
	Np3n/rIw1q6z08nywoCCWwSDOeL/vZxYOkNT9TeICtZ/OfKU1WurVWAinLfyhT6T
	/jH4ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2w48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 10:56:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514a182b90dso81196001cf.1
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842619; x=1779447419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=CNl287hzFGpllY205PviIFH8Tz6oTJ9DYoccm660Wjwkyg/TY5bjBFn96b+/ioP6c8
         VkFU8MR7MqKYdiJmjQEi+6VPXzq1xuQAGEmGciXy0Uz6XVLMdv5FvjwR/CfSjY8Q8Zo+
         K9f9+vaFNbH+nsBrIqRiErv7LrgwaIwl/uRt/cDlbvEgyNvba/1ufkk5TpmHgKm8R8Sn
         08N6iBSt4hoJgEydoZIWB28M+9ugkct7Wv4BaRGLiFXx+k88tcZHVcmvmQGKTIpNATSm
         Q1yDvst0leZsrwNbe+Nyy3d9Pn9sYiFS4PrUBLxfYLbVEZMoIDmfXcVETUX1KN2pNvD6
         0Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842619; x=1779447419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=PT99xb/R5XmgtQ+e2qCf6xZGn9nO3gMteZLQjDlJqwuyDUxqXQIKenmNHo3TQX52vF
         yEBCDrnRenfo6lTrBYFUtQCpqU5waO80hDdDuRDWz9U2g3JtKZeNNoFL+KcHzlDlQiPx
         akWGzeLhU4WmhzHKtfjymDgSh+nSsdvE6vOxGssdT/GFl1VT+4yzAHGbMH8OS4yq8vAb
         iA66ITpbqCuKojUAUkvlqji6/YcQOUZ94J+0Izozc7VmAy2GV1F8hts661w+9sEPfZz0
         yX2bclbk107u6+zntEIJ4M3luPPbJGzSrwaRZlA6k6HgFyPMhbNuFFm96gelVNGbFfG+
         6BjQ==
X-Gm-Message-State: AOJu0YwDB8+fr01Z0NjnzCSqufaUa4oJnfXhIhnt/BDmxRCDDyMab1Bt
	tjSRYehqx0iUfM1J/qoKib+HVNavSAHju+rtgqhTC+NjGJ+pzWPuMs9omXQ0STspdTYKWBm5jUY
	9XytPGDFv414W0jjZC14QElOfsoaCbRQKC+QcJxZk2V0/y6Y5xva5nqyhIRzlKptsWpy4ZFIR/w
	==
X-Gm-Gg: Acq92OGNEsHxGmckZpeLf0b4kXng3zWRykGIK1FORQm5oC4tWEPy67CA5ghTP5outRE
	4qyujNYUjMWnZYdxwN3+kFK3gNsBF+B8kaTEHYxvVCUn6Ge5jvgR7X1LX8eQMoCRk0SXy0LPRm9
	N+cdmANRmnNZgogq3R+RiX4neZXhDcIeb/GZg1Z25pq3nX9A03Sn8VbzSWYj1HHKAlPmrRVBYin
	DiN6WZUbc9hpXT7LcXcee7PmW5VCFjqRZ1a7zvaOMWIIw+3zLU4vyYbgLbodYuHPfQeTMmOIAyG
	PTx5dsubHjLMn3Vaj8x6L5amr0HlhGwLj/Kol3TiYFpRkT4ryToFuRBKJfgfLe9OBQ6tlx5xRxw
	mvg82nKYiDNRD81qApS5CbMIVbakUe0juKKcUGTeIY1bVA16my47OnuQjOyvyyvWQIbm9Vqg5tL
	mj2sC7ATtg1e4nwOI8tgyeQAfDIrtO7XCMbu0=
X-Received: by 2002:a05:622a:130a:b0:50e:6139:492b with SMTP id d75a77b69052e-5165a06ccafmr47953961cf.23.1778842619046;
        Fri, 15 May 2026 03:56:59 -0700 (PDT)
X-Received: by 2002:a05:622a:130a:b0:50e:6139:492b with SMTP id d75a77b69052e-5165a06ccafmr47953551cf.23.1778842618544;
        Fri, 15 May 2026 03:56:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:39 +0300
Subject: [PATCH v7 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-5-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvxHDAV9jTPR5FZSKOzZA8OzZfY8tlB6uEN3
 ryOipukXtqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1efeCACDezYq3TG6JLKt1K6Alroa0bxa+EWl/jJdxUW5WrwExPID6Y+RSeoGObuzhHDgI/73mWQ
 FQiUkHj5TBk6D8kW54JopZLnsxXBfsDxEF8CVa3hOTtgGFzjcN+sbwLF5riH3XtJAOOcONqjdeY
 /ju21E07iM4BS9dZveuuO/zaCPRsvMg77Cjnzz9Nq0F1dK3q0ALV8tOvJYPkkPDVFiGxRJB/mJp
 e8VWYqfKXFje/nB67HFGyBGcCn+AIlaSY3D/0iDhtXIiMMBX6Wb34A00teVhaX2acLAikj3HSX6
 +zywAxv10qYCl3oFOIMxZQXl0A9L5Oa5OX6MCP3p1oFh8DJt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fbfb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=kSuwpvhy9FmzT4U0:21 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX255jx3uNWE/Z
 kExag1p3LobdNs/ncrerhdaPhLispOVzkM73uPH6KrevESx7nrHfVNkLdIETI/A88vGdzLVz0te
 WKyphaYmIkCwLvEizmY60XMupP0+KJkEW7pkLgyMmBYwHvItUXETFsLy3SurElkx9HCSPZA2M/0
 sggzsKYovOfQ/H4OxmQBE4PUFXmPh9qmGY0etP89OcbKTnRdwCqslfazlyz2MVeMvzMMpp8WtvA
 n7ZOHHPJ2rzSy8T9UC0Wy2p7xsSGmqnaeJ2Zs0pDkBd1ha3rEPSEqHsmfcAwUm5ovVuvcdSER8b
 1D1sGqx27dfL+1r6FZtrMJnUEsjwdmorpCj8fla+/anGDfPumTR+yFdDXeBFDtr0C026CS4MVjp
 ZxdyCE+q6fKquVzt7+C4S196/FCAIUTpU38QuyFgYO/LgxEO1KFrDTLur3nABiCIJf0LUlz7yIF
 DHox5Nzu7/D5QGQRkLw==
X-Proofpoint-ORIG-GUID: t9pCpIJ2n1ytuxg8A56aj4QOaOXIigw_
X-Proofpoint-GUID: t9pCpIJ2n1ytuxg8A56aj4QOaOXIigw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110
X-Rspamd-Queue-Id: 2A55454E519
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61665-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,abf0000:email,qualcomm.com:email,qualcomm.com:dkim,aa00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..2148a140f162 100644
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
@@ -2747,6 +2749,85 @@ usb_2_dwc3: usb@a800000 {
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


