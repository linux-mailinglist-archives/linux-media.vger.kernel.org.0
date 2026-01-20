Return-Path: <linux-media+bounces-51096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE0D3BF81
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7AC5343A9D
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78BE38B9AE;
	Tue, 20 Jan 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzXY1gIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPwu4fRZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6436E494
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891403; cv=none; b=hE0rfHwcvIEvZaE5xcUn1ylVMQvV8z3Uz/miGZB8oT6ybfm4W+cvAHEERDcnUe4qHSsEjoh5M5Ra1+H8kMIaYuJNBAtBvWNrljF00lRzPfLubaTw63g10M4qgKhHfAZ0ZNDrBRmqVsCo7dJPVYsEPqmYnGHcEzSdHS443DSrzBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891403; c=relaxed/simple;
	bh=4xfEYBLIIh/QJTSywXNdacMhkuJaXkgcsUCelou2GvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpENB/LBM5tw4j6OBkfw2YrIs385gG0moGEo+yAil5gWMTNW+QqTlhfmqSX/uhWv+67OYIz2cBTUQjvqKyASUkSGDwfYx7EsOmzd00bgGGnA9csk+Xc2I1po+JQLCTueiv7wRxlW8nnrxsTL8CHesyb/3QUwKS/UYdR4QLTyBps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzXY1gIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPwu4fRZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JJWA85597647
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=; b=VzXY1gIzLEHPbzxw
	nGcaNdY8lpj7auVz1VRgpnBexchuDecStm8mo5pLyEThNGKlzaGbjOSTQ1bV2ImE
	LPIwba8Y4HvMYEeVHu8jV/R2tGkokEj5bObARHsLBz2IDHwpzJG2dNlpUT0d6zEl
	v8HRGSeai/mmKYeCMuQyUbSXvxU43RjMpO/zVUJQmKElZmeTmZoPJQoN8dBvX4fo
	137//SemPSzUVS9L5YfLxJQR4B5F48vLAMUkE3eGUyB3nNh4pOq6CNzHpECH0cuU
	rGQRaYbboxLIOsbouktsT0BVXQ3KOHhEnZtFR8rAjdTyQbItLLU73AsfbO1bgUGR
	/XWh7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjk7ju23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b0588c6719so4154127eec.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891386; x=1769496186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=;
        b=VPwu4fRZgNW9yvSvrcCkLmb0eX+t4Y9i9D12y0LS0QsI8BXSsC1s0a+wui83mf7aBY
         3aD3pBsKn08xDmCoACzLgbN/XxlkcCy9yVzZL6g7FgI4IDqEEPb14q7kFBuIla/Fcgwi
         Ro4PX66kmBhoo9pG+2Q6Gh8AQZPztNjHFYrTWlVf4xVOnnfQD+0Tfc2tOcZ/RfGxTJal
         IAb4gC+8rtcqLOygAgaMhsUwB6z4qnctoZI211FKkbQw+9HZejRzuldYYpkB8zOsH+1L
         I3cWaIQm5DOutAUU9qnlxvNMdF/1tw08hgsfe3VoZLSHLM7AuLNFlcYqwCvd09wvSPu2
         Jtdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891386; x=1769496186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw+wFa2Yd9QkFT6uBSJrnCvNpSFlYBtwouvuaI15GXk=;
        b=VQ6d5tkR2DL3ybj6+GOoHs5RXesO168unOynm6q6LqSn6+YS31Eg2NhijO/HMbU0Uo
         To9c9PhrOdHqOrV5uW0O9xhfcRF385bZt6UanZigNOIdT+0X9MzSQ06rbuD3oKJV0M7I
         X0R95Ft0PYbtqYlxJ8T+ZRNBf6Hk569MgH+9AKIehOhyGZzbns5wBEe9f3PmTK48Maj1
         /Na4oroalbw5Y0SxcGL5SOItlRIDQMCfMs8q14+ZDBLrl8y99QhhtFHFaxRVbpTgEanq
         rpvreFEOx8Fu8MV14dwhg07JJNEd7pNz3ZEtMAU31E5cElCf353O2mo3HR8KCIDxeNPB
         DRyw==
X-Forwarded-Encrypted: i=1; AJvYcCWccb2YdmYlbz2OY0BCnujvJaXHuGKA03xbux7BcpMm58K/ErEcvMFkZV6sCbTyX6lRPqCjz2tUH/6o6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6e6EvTGlrhPCrX70rwr6tn91DanB1lX61h0J+JcOMyzHQ7UJ
	5rKzy2mlsALsdYnrP1I5EGmkZdFjW7uSExiGt1ET8izHKg6bZSY6KEHlyHD8hG/00IWSB8IAt7T
	EVEAhac/FsoY8Gj9ydSho9NG2AD9YM6+W2HeTvvawxJwtd0krxQ4MRreBvNBxsFKNow==
X-Gm-Gg: AY/fxX5VriuQfarXsgMuEhxiYOQE87agkmVS09RrYvyIIGbZNTJNsjO1M61bmUyAIt+
	FG9rtnAd710k6orthpxp9pEw+u0VIGVc24xY2Oh8Ba+frDG4hzj8lAq7DJbjc1waagN10FHgk5k
	djAOD1ZZlJcLv6qqXNJyiEM1/QycGQAtyzn0TT1zEMU6/lbarys+3T2nq3PI9d+ZQDY9kBiUVcW
	aBB+GGXJpDxFfWb0yO3qX5xKnchrXmHFyE1oNtkRoXrc/UMyhLy/Xz+aa9tafhT8yvnPwkcS0nG
	szVgoYjH0/71N1sucrA6DEeH7bXy0pSlimTGIROx9j8TFHW7aukfxfp9lk5JCYlq/C+s5MwbcnA
	tKSEfDK4shOZ2pKMgVg97biv9J9jKkf2GKFzt6dAl3y2Z6mE9XfbnHXZTUPHQIIn1
X-Received: by 2002:a05:7022:6189:b0:11b:b471:dc8d with SMTP id a92af1059eb24-1233cfad056mr12767789c88.2.1768891385461;
        Mon, 19 Jan 2026 22:43:05 -0800 (PST)
X-Received: by 2002:a05:7022:6189:b0:11b:b471:dc8d with SMTP id a92af1059eb24-1233cfad056mr12767770c88.2.1768891384874;
        Mon, 19 Jan 2026 22:43:04 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:55 -0800
Subject: [PATCH RESEND v2 5/5] media: qcom: camss: vfe: Add support for VFE
 980
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-5-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfX4fsiDoyv1ilQ
 Q5uFlU1WJBlPiAfue2PWKXjrCqX5Da+MPBCsXMw9rpRkhFmF3HQddruCDoGPURfGlCgedhC1wcr
 14r7rwmNhzkBIyVnZTz0oP+FGMDPSxiC38eAQpotOC2x6C8CEFIBHIwLRh2h3NW9aO8MvULe9Ov
 ykhmIgRqV0HAj9+SsFADYkMqgR5KRdoDGRSY6iEADtSSjVG8D13aaAHQcbo52cNXOAMI3+G7EQ1
 IOx9ifCYwd8S1oQdimfQXsaGJCTnOBPhftCFzxiIaH0BMoXdf2cEq05jUVQ9VhosPUnHdTivWzc
 cFfi3YjB6fpG/iHTLfPHxLkf5+umC5HvuSIEwrfAZgTzyvW75hl0ee2ovQVaQtv9fW87OOJvNM/
 zICf9B8llRnYRFKe4sSTMiTXN8kpKNm/tjCvlYpGQhvRH7OG6IPW+vHkCDnzLD6y5PpTrtbhPtm
 xs2spt/V8VH13ZY5Uqw==
X-Proofpoint-ORIG-GUID: q0E51IgNWjRy86Fdg14FpIKhcGem40pK
X-Authority-Analysis: v=2.4 cv=WoAm8Nfv c=1 sm=1 tr=0 ts=696f23fa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3rR15nC7HOTWOJgZU7UA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: q0E51IgNWjRy86Fdg14FpIKhcGem40pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add support for Video Front End (VFE) that is on the SM8750 SoCs. VFE
gen4 has support for VFE 980. This change limits SM8750 VFE output lines
to 3 for now as constrained by the CAMSS driver framework.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 135 +++++++++++++++++++++
 3 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710..46d8e61b9bac 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 99630ffa1db5..fbde638db194 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -351,6 +351,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2014,6 +2015,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 005f9a243ee1..1f6bacbbb202 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4444,6 +4444,139 @@ static const struct camss_subdev_resources csid_res_8750[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8750[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe0_fast_ahb", "vfe0",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe1_fast_ahb", "vfe1",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe2_fast_ahb", "vfe2",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "cam_ahb",
@@ -5885,9 +6018,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
 	.csid_res = csid_res_8750,
+	.vfe_res = vfe_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.csid_num = ARRAY_SIZE(csid_res_8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


