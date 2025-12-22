Return-Path: <linux-media+bounces-49305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EBACD51A7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81F5530456F3
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5424A334C34;
	Mon, 22 Dec 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZThSW7JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0rSErXe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE8334C1F
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392138; cv=none; b=NuDuwTM4EvXpJP5gSpMrQ6ijnRHfetE5q/S5hCtMg2vMHalJSRpxTDtnpnZgVah1p1ujsUi8VfBguMTJysGON36ozmfTzPQXUSZF3g/KAAeIq1KaQ98/LWme++ifZjoDvyMloBvEzupO3kxL2kRRLubknKSrsQDYQ7WrNi6AhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392138; c=relaxed/simple;
	bh=UEB1ndKJpzQUI7ZztCA3PLVCCqqAYdAdEWs19wyUOGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MF2j+ktv5tkHvObgpqsHSwrd2ilxf8XXCjx1AxsOLFWUY3xFhQP+zEzJEvfwu5ysz88Pgo9JTFcOWSLHfvi0s68NkGrI+09lMxN2I5fOFqlhpy7tyXRc7eBSoj7PROg0bf3dHOLdFLpreIXyon3wuZSoZrRKs1RNnOVtEBst8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZThSW7JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0rSErXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM86mIF038127
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	np7aEWtDEICnPx8/bq0OY944c2iyFnV90P3wVJaHy0c=; b=ZThSW7JYPvmdF/ih
	zDBAu3va4Gd7rqH4ptWxs0OKtkOpM9CiPkNkTsEA/TUqD9GSxQDXOXvTOv/WNyKY
	7ztbUyytsqmNKZmqv4apGhbvlYFNE4fjO8xeKmOAHr/+LtU8AeyX+aQlf9bc8uX4
	DUzF4ftECl4Knh3HSztSfetwmtn1NCpGGfozrrJj+QiKal7N6SPp0VQJubWLBPVG
	7UTO8gn0mir2ms7VEFq07QqxlpiGWcsFMU2i1zhxXA+MqZBZy554DOOpSA09Jr+N
	yI1Rv5F9MNLcefVsljrGcK0NHI3ZqrAnkhGulWP38qU06rRbaMg6uWg1EG/7GaKj
	uAhfqA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux49re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:28:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so1290931885a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766392135; x=1766996935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np7aEWtDEICnPx8/bq0OY944c2iyFnV90P3wVJaHy0c=;
        b=O0rSErXeKKv8y5I5n7CDOEiDFIbomByE9YWW3rRuCF952e0LYojhBbUSXZMkyAWGJE
         XNR+k6uxOOuAWKsvjJoez4NNpPDzoOBf+dSQs0pwfRgotiFIGsHnr+NBHrQvWQV46KcM
         zoFVA7Ac7g9kpO+bw84JtZgrnbIcGxur8HKPGbCzU6gLTxYdWO31fWQQGZZUZtzsQI/k
         ZZcUyKVm8EFeKTp0ViSu3kFiZdRifOGlczL/irbyPES270qU83pCjVTSXLJ8z3L4VecG
         OV7BU47YIiix/dYyYFpRQR/2Kbfh9cf489SjGbSPo3Cs2Mgoi+tlIELXES+hYKz3nGrt
         K4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766392135; x=1766996935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=np7aEWtDEICnPx8/bq0OY944c2iyFnV90P3wVJaHy0c=;
        b=FIVj5/J1o9xsB8X8sjSPV7HNvp3xXbhVBx9nRKMyMeO6NUgwJdu1fB9/LWVHvztBCk
         kPUSKupcnceMciApbBGrrThs34MyDhJPIjDZr6MiNzFoFklc+und3kzzMuIOiAZiiqAl
         iZ4cnYELi3OrzBBohm07AA47tJIIqfV5U3q3ZLl2WLfdOwtK/H+bedeCc43QcvN7qnWv
         8uuRc+yYCfW6OuvqOT72fYQ6FIpOw8PpgB9hygCij6f/3y+7L8bdbsqOzt6Phqrz8plJ
         C6tPse7y/veomIzrQE5qCiL7zgxB2T7RYZOlRevQmQUDIDYWpnPWGa0ZjjXWW1d+j268
         jE0g==
X-Gm-Message-State: AOJu0YypOZ9aqz2/G5caNsoB6VbrFIbchqFRkaobaOs98x9CtZUj10yz
	09tC8nH2M6IZdRTZLmKRxeIn/QrB6z3r+4KPdnigyxSisYMqeryeOPTotw5j0hoFQu3W6vWw7Ov
	cy8OeZ8AY+nrmlMidTMh3DB+LjLma/oeLDFCKfU8pAI/QsDa0I5jYP1lm/Dd8cKAvF9Ygn+rKQw
	==
X-Gm-Gg: AY/fxX58JSFXYWBxI2hPsyJTmjWcCy072R3srXaIb3Yhwv2NG9GnvnZBEQtWBfblqVy
	Onb04Xl3tya9VZ/lz662wzOFNMV30n08dkGpAtxOoyRmuXMeUD+Aeybg2tGuCqJj7ns6Wp6MR8f
	A31zf8np4TKrAo8rhAThc8ny/ndfmJIxApadUbv/5k2O1SKA70TzrbamKsY4V5T7qls//jDeG/y
	DK31K89OkDHJNDeY79rHw+jYhBLM6JxsfvkL4+ln29/c/pT0GDcZsld6bEHBD/ltm5oDStDDnOa
	aoPXq/qkhCxWrvNH2JGRe+88QPo6UQIgsKKzkLT59zASNtiyO1vazaHQYIkt79r48gJQuT4cLVQ
	UIKwSMs0Bx8+gHyLT7PNPEJV22nyLHsIQsRADQYrohwdoS2unPI9uz6YsAN5N02fHWI9WDOyY8K
	1w
X-Received: by 2002:a05:620a:1a0c:b0:8b2:e565:50b5 with SMTP id af79cd13be357-8c08fd03785mr1471382285a.60.1766392134607;
        Mon, 22 Dec 2025 00:28:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFshUE/YE60g5obLvlBU3U7Mg5fJoiJ/45Egolz3tkNf4kTUkIYLit9zl5Vvymx/GfC6kVqew==
X-Received: by 2002:a05:620a:1a0c:b0:8b2:e565:50b5 with SMTP id af79cd13be357-8c08fd03785mr1471380185a.60.1766392134096;
        Mon, 22 Dec 2025 00:28:54 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f8572sm764046585a.25.2025.12.22.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:28:53 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:28:39 +0800
Subject: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766392123; l=17078;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UEB1ndKJpzQUI7ZztCA3PLVCCqqAYdAdEWs19wyUOGU=;
 b=3psd4l4ZyOaZliPo+AtCQN8lSByUfqX8PLdZCinUf4AtsGdgFfdg4Bgsp5DlsQnJqWk0DD9ZQ
 8q5LNox0TLSD/Qp3Y9rwE0jAcF8L2mXHNLY/wYpkr42ntNl79onfyW4
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: dxYUBxzRk9fZiGTe6YTREGBQRCK6rnxI
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69490147 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aFcfZ3UtOBUUIK6fB1MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dxYUBxzRk9fZiGTe6YTREGBQRCK6rnxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3NSBTYWx0ZWRfX56MrQCxsfCg5
 SG+uGZNcar4HZaq8NRJIXPiIBD5oEDF+yoHzyNLgqUg/KokHiuno5AIKVgt/E17Pw2I+961np/5
 2dLDNGVurjYY0JqAVtLuTJXmzO7tkH04Y9T6OYhuEw0EBYIAgfYmRakz0L+j6NdtRL6ox1IG9yZ
 SPStW6m/fuont02y5ItFovKaUdnejSfEgdYVD3weLlgrovT8xxwO1gzB57JDrfEyTQ/YQhmATja
 /gqF/droveezRT79is4yQPKkaoGhFs1K8Ul8e+13O54chQFaVzymUD0alhHMhjmSB36iSkbn+47
 pMju3lg6UZZg13Ni7cVNAQZdzdkeKfW0WzhO9ceqyLtCwQgkzYXr5y2rNVrcVUsQBwt5Qhu9pGt
 Nrs4Fyfjvb+RsN068g2fD0nVIOMngoDWtmKtu70omekvmr4SenmRLw1dbYRMBzCl0gc1b1ukFCO
 Ye4qU0MzJjaL4XX6dmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220075

Add bindings for the Camera Subsystem on the SM6150 SoC

The SM6150 platform provides:
- 2 x VFE (version 170), each with 3 RDI
- 1 x VFE Lite (version 170), each with 4 RDI
- 2 x CSID (version 170)
- 1 x CSID Lite (version 170)
- 3 x CSIPHY (version 2.0.0)
- 1 x BPS (Bayer Processing Segment)
- 1 x ICP (Imaging Control Processor)
- 1 x IPE (Image Postprocessing Engine)
- 1 x JPEG Encoder/Decoder
- 1 x LRME (Low Resolution Motion Estimation)

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm6150-camss.yaml          | 439 +++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..aa2e44c94b9c0231f6d2f1a30c1e434c0313117f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm6150-camss.yaml
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm6150-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6150 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  This binding describes the camera subsystem hardware found on SM6150
+  Qualcomm SoCs. It includes submodules such as CSIPHY (CSI Physical layer)
+  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
+
+  The subsystem also integrates a set of real-time image processing engines
+  and their associated configuration modules, as well as non-real-time engines.
+
+properties:
+  compatible:
+    const: qcom,sm6150-camss
+
+  reg:
+    items:
+      - description: Registers for CSID 0
+      - description: Registers for CSID 1
+      - description: Registers for CSID Lite
+      - description: Registers for CSIPHY 0
+      - description: Registers for CSIPHY 1
+      - description: Registers for CSIPHY 2
+      - description: Registers for VFE 0
+      - description: Registers for VFE 1
+      - description: Registers for VFE Lite
+      - description: Registers for BPS (Bayer Processing Segment)
+      - description: Registers for CAMNOC
+      - description: Registers for CPAS CDM
+      - description: Registers for CPAS TOP
+      - description: Registers for ICP (Imaging Control Processor) CSR (Control and Status Registers)
+      - description: Registers for ICP QGIC (Qualcomm Generic Interrupt Controller)
+      - description: Registers for ICP SIERRA ((A5 subsystem communication))
+      - description: Registers for IPE (Image Postprocessing Engine) 0
+      - description: Registers for JPEG DMA
+      - description: Registers for JPEG ENC
+      - description: Registers for LRME (Low Resolution Motion Estimation)
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+      - const: bps
+      - const: camnoc
+      - const: cpas_cdm
+      - const: cpas_top
+      - const: icp_csr
+      - const: icp_qgic
+      - const: icp_sierra
+      - const: ipe0
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  clocks:
+    maxItems: 33
+
+  clock-names:
+    items:
+      - const: gcc_ahb
+      - const: gcc_axi_hf
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: soc_ahb
+      - const: vfe0
+      - const: vfe0_axi
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1
+      - const: vfe1_axi
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: bps
+      - const: bps_ahb
+      - const: bps_axi
+      - const: bps_areg
+      - const: icp
+      - const: ipe0
+      - const: ipe0_ahb
+      - const: ipe0_areg
+      - const: ipe0_axi
+      - const: jpeg
+      - const: lrme
+
+  interrupts:
+    maxItems: 15
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+      - const: camnoc
+      - const: cdm
+      - const: icp
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf0_mnoc
+      - const: hf1_mnoc
+      - const: sf_mnoc
+
+  iommus:
+    items:
+      - description: Camera IFE 0 non-protected stream
+      - description: Camera IFE 1 non-protected stream
+      - description: Camera IFE 3 non-protected stream
+      - description: Camera CDM non-protected stream
+      - description: Camera LRME read non-protected stream
+      - description: Camera IPE 0 read non-protected stream
+      - description: Camera BPS read non-protected stream
+      - description: Camera IPE 0 write non-protected stream
+      - description: Camera BPS write non-protected stream
+      - description: Camera LRME write non-protected stream
+      - description: Camera JPEG read non-protected stream
+      - description: Camera JPEG write non-protected stream
+      - description: Camera ICP stream
+
+  power-domains:
+    items:
+      - description:
+          IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description:
+          IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description:
+          Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description:
+          Titan BPS - Bayer Processing Segment, Global Distributed Switch Controller.
+      - description:
+          IPE GDSC - Image Postprocessing Engine, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+      - const: bps
+      - const: ipe
+
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSI PHYs.
+
+  vdd-csiphy-1p8-supply:
+    description:
+      Phandle to 1.8V regulator supply to CSI PHYs pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-2]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-camcc.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb3000 {
+            compatible = "qcom,sm6150-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>,
+                  <0x0 0x0ac6f000 0x0 0x3000>,
+                  <0x0 0x0ac42000 0x0 0x5000>,
+                  <0x0 0x0ac48000 0x0 0x1000>,
+                  <0x0 0x0ac40000 0x0 0x1000>,
+                  <0x0 0x0ac18000 0x0 0x3000>,
+                  <0x0 0x0ac00000 0x0 0x6000>,
+                  <0x0 0x0ac10000 0x0 0x8000>,
+                  <0x0 0x0ac87000 0x0 0x3000>,
+                  <0x0 0x0ac52000 0x0 0x4000>,
+                  <0x0 0x0ac4e000 0x0 0x4000>,
+                  <0x0 0x0ac6b000 0x0 0x0a00>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite",
+                        "bps",
+                        "camnoc",
+                        "cpas_cdm",
+                        "cpas_top",
+                        "icp_csr",
+                        "icp_qgic",
+                        "icp_sierra",
+                        "ipe0",
+                        "jpeg_dma",
+                        "jpeg_enc",
+                        "lrme";
+
+            clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_BPS_CLK>,
+                     <&camcc CAM_CC_BPS_AHB_CLK>,
+                     <&camcc CAM_CC_BPS_AXI_CLK>,
+                     <&camcc CAM_CC_BPS_AREG_CLK>,
+                     <&camcc CAM_CC_ICP_CLK>,
+                     <&camcc CAM_CC_IPE_0_CLK>,
+                     <&camcc CAM_CC_IPE_0_AHB_CLK>,
+                     <&camcc CAM_CC_IPE_0_AREG_CLK>,
+                     <&camcc CAM_CC_IPE_0_AXI_CLK>,
+                     <&camcc CAM_CC_JPEG_CLK>,
+                     <&camcc CAM_CC_LRME_CLK>;
+
+            clock-names = "gcc_ahb",
+                          "gcc_axi_hf",
+                          "camnoc_axi",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "soc_ahb",
+                          "vfe0",
+                          "vfe0_axi",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1",
+                          "vfe1_axi",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "bps",
+                          "bps_ahb",
+                          "bps_axi",
+                          "bps_areg",
+                          "icp",
+                          "ipe0",
+                          "ipe0_ahb",
+                          "ipe0_areg",
+                          "ipe0_axi",
+                          "jpeg",
+                          "lrme";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf0_mnoc",
+                                 "hf1_mnoc",
+                                 "sf_mnoc";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite",
+                              "camnoc",
+                              "cdm",
+                              "icp",
+                              "jpeg_dma",
+                              "jpeg_enc",
+                              "lrme";
+
+            iommus = <&apps_smmu 0x0820 0x40>,
+                     <&apps_smmu 0x0840 0x00>,
+                     <&apps_smmu 0x0860 0x40>,
+                     <&apps_smmu 0x0c00 0x00>,
+                     <&apps_smmu 0x0cc0 0x00>,
+                     <&apps_smmu 0x0c80 0x00>,
+                     <&apps_smmu 0x0ca0 0x00>,
+                     <&apps_smmu 0x0d00 0x00>,
+                     <&apps_smmu 0x0d20 0x00>,
+                     <&apps_smmu 0x0d40 0x00>,
+                     <&apps_smmu 0x0d80 0x20>,
+                     <&apps_smmu 0x0da0 0x20>,
+                     <&apps_smmu 0x0de2 0x00>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>,
+                            <&camcc BPS_GDSC>,
+                            <&camcc IPE_0_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top",
+                                 "bps",
+                                 "ipe";
+
+            vdd-csiphy-1p2-supply = <&vreg_l11a_1p2>;
+            vdd-csiphy-1p8-supply = <&vreg_l12a_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


