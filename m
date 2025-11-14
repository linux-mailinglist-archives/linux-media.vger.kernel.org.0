Return-Path: <linux-media+bounces-47090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B6C5D662
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC9624E3B38
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E733D3246F4;
	Fri, 14 Nov 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dycCUcrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JN0RGHM3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE33322768
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127515; cv=none; b=NCq569LEjUJICnMN3mRT77tUZ/7xaKYapimdEmyqNZs12O8NXnrhoGKkYUlcM2kpM4spFkpGbaeKD4L1yCAqc7axsS0e/xiAIP3z748F0E0lb8L4HSN1F0/VSRYdxPovFfbZh6Lsupqk6PaSoT2y40DhCg5dE3I9RfVosWhtPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127515; c=relaxed/simple;
	bh=VE0jQr1XgPvPdJrtPrn/PKOE3cJwqZ+R10C6ISVqTkg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkZVMI0bsrPSl2Bi8dPh4TOhkRUCsIrNMMVtvn1ECJDUR7rsoypEeioRxvb+346AJu1xA41jM4kLZGW6bZ1HRuD/rGZycLAB8gVBjFYJ/OP+HSMrMeiWjA9JOeQmijAsg65/S0TAeELgSqcnf0GRUGBQXrYv6i9C2YzZ5tEqwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dycCUcrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JN0RGHM3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEBhbkA3368679
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+UG7dCVVsUR
	CyP+SKrMMs739w8RE9svmqjIeaGHEcfM=; b=dycCUcrWlghpV8ddIbv3ljKdtbt
	EHl36piq1UdLmrV2tPSznsFIajMhixMVxdRt85NUrq3gjZH7vIGal4ZDbEy/3IKN
	TaBBf5+hcbyPAS6Rziin3ErCsUpRt9NArBqZ5irlGjCaG4lxfotKVyR/99FO9c0W
	OiNARUi30AFeWVbzbXT2k5bNuHQ9G7ZQXa1zKFYJ09tLlFd881pc7VI4Md/JUB+Q
	G+G//3chfRxns3VFMVUsPAxCGVz5r19LUHzWzKumAKZlDimRUJ6OPqlDSDu9KTu+
	16xP0Nhr+KqWK6xnv5OLgcBmk6Y5RoiAKP9ba7CDzEUPikBl1exMDzk+oPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae3t9r9g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 13:38:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e89f4a502cso54064511cf.2
        for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 05:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127511; x=1763732311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UG7dCVVsURCyP+SKrMMs739w8RE9svmqjIeaGHEcfM=;
        b=JN0RGHM3exSSFXM0hh8puPit+rbX9haITJwO6BarOKlWgOiHTNzLF/SXAwFkghtXvX
         dnKJeY9pFeEqe2NDjmLtQfUw79T589NFSdeUyS1XezuxxzcfiWy+ImEIPRzMaDoB1D99
         11D5mh/lNjQDMLCaMsN0Scf84/1Qiez0TpCSal7bZmTqswtKphsDQhHapjkwTgnlqB1l
         mxcYK2KTJn5a0fcH+ro0kbROXwnyWSFraGKJa+gVtoyhM63ScXYRbCZFSphWFJHELNic
         F+6B/Aqje/3AESGs4Lij9aVl21b60vxSFDVOyfP/btuGHLGG0qCvQnVBXzdSxOgZnLre
         p2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127511; x=1763732311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UG7dCVVsURCyP+SKrMMs739w8RE9svmqjIeaGHEcfM=;
        b=f4XOsGrXsM1fDVqnBHfI02PPRjeHCHL3d1wzbtqxVMo6K+6zCWBpDhzrEQ9tpf28X2
         fKc6+gs9Af8UP3wIQ/ihLrGbcCCmR6BmTH0cpv5ElR92PGM2Avv5IIsm4rA6ARInSd0Q
         9kT2t/pRyu6Jl1LudTSSjovhPnuP0/QFNanrdAv4CzbNjAOyx+qMBqD97TpXg6PRwsOA
         lmQOFaPRccSxzv1Q5aeIH8vC2j+xEM/Y/ZnTbPc3cmjJ9FwCj0NozhcF20xl89sYBrm/
         2QQzTJ8iRzlykVNMGoHbcA10aLK9BAB1K/VqU7lTC5M6tpELsijgEglM/TY8spsI1c+5
         mioA==
X-Forwarded-Encrypted: i=1; AJvYcCV3CAmbcGj/4EKKr8fDPkD0bC2BDSxmLk30N5Be6wE6nyI5xU+i9+XMAD0Q538vdsHxK0k48FtnIAbXDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOOEzJ1qbgcqezIZLBc273dMxHCrslA4Si02sWcG3b2j+POfz
	zRih/lnNOOtJQqMcg2Eksiab6FAQnvUrIDh6ZuVDhYRLKIC/YaeL2XjhKprUAzwbxuwbpMoDE9m
	MVNk8vs8b5YV2OrNHrH6wsAngfiVk/5MKuOZUajFCzr7hHCbLUvVEHGYaRw89BULn2A==
X-Gm-Gg: ASbGncsAENOf4xVP95x9fTslMCMiULmzT4D5qdE636nCYKFwuE1W4pZVXTpS3NOpQeW
	FxT9yagEqUSXxlmsPXM1HtY0v++xjCPCQiOnIZxNqUG6252i/Zp1LLbARDbXTKcIPtyv3LlTSfO
	PwpAEihfeyU3a+GaeecNBbAAsqYKVdh0LR++C3Sc4cCRkB3nDeSvjNvI1HfauhfYAdZd4v9Nw/1
	9ndvd8xubmMmqiSc7GvrJenEz4wqPLJkyGkytU4/o5fh21w7WHrI0aigR7zAw/WknJnSpLmi+03
	u6B2na0GQoUOeyvgI9FUzNjUY2OMr27hslqolqSSptJoSIqkpPLww1voYJAbOgUTL8nOEMHzzta
	9S2JkhjsA+MX39TJvK+Znef0XzrU+oOzIXbb+V4sYPY1NTbBGQnse04DWAGhAjZLEvQ==
X-Received: by 2002:ac8:5a83:0:b0:4eb:a2ab:4175 with SMTP id d75a77b69052e-4edf2129abbmr47268691cf.39.1763127511301;
        Fri, 14 Nov 2025 05:38:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsTcwOw9SG7FV7aUrdM0DX00gqSc7vI3ixogZBE4EFn6LNaP7+Sm/xLVmLNvp8heQzHOmZGg==
X-Received: by 2002:ac8:5a83:0:b0:4eb:a2ab:4175 with SMTP id d75a77b69052e-4edf2129abbmr47268171cf.39.1763127510816;
        Fri, 14 Nov 2025 05:38:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: qcm2290: Add pin configuration for mclks
Date: Fri, 14 Nov 2025 14:38:20 +0100
Message-Id: <20251114133822.434171-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IOAPywvG c=1 sm=1 tr=0 ts=691730d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX5JUG88g0hMBm
 XjQmxiaZWe6rtqZH+7PRAN5pX0VNB0efzxTeIdL1fqacAexMm4BNljWnHay0t7dohZYgTgvitvB
 9SGciEbEmGE8zs12W9WtBVV7NReoRkt6i+riC4tZPM/w28fxsPu1FPHKYfnOlzXuO5rOhn5bo7B
 1HT52a47rwGATxNwEdjGOHY0Ut2PyK5v+exWxfWzj3KAosTLrs+GgLGDW27ov2YvvBuV+BFEQmh
 dN8hLpqkz+cIc9Uk9BSkZ4d7GnZrFwMnhIEIKAwkqb1YZePRWsh+mweh+WIDp4l17wEpv5WrK2X
 9rYfdiZ26+IST4xCUuIhZ0mAcPeoZBGV1a7+Lqzzp+5kFM1DjFwWf6S8B3OGsjaZi5wnTakur0m
 beH5lc2w58yNrB1f6R3H8KE7YZAJPQ==
X-Proofpoint-GUID: DMva6Q8JuV35H8cW7Sz3FhpJjTIx-AnL
X-Proofpoint-ORIG-GUID: DMva6Q8JuV35H8cW7Sz3FhpJjTIx-AnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140109

Add pinctrl configuration for the four available camera master clocks (mclk).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8bf5c5583fc2..e14d1f444ab5 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -597,6 +597,34 @@ cci1_default: cci1-default-state {
 				bias-disable;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio20";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio21";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio27";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
-- 
2.34.1


