Return-Path: <linux-media+bounces-50542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC423D180EE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAF26303B166
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA00E38E5D3;
	Tue, 13 Jan 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4KXU5CZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z9jkLibX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4138BF67
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300120; cv=none; b=DCxvFRDFzwaz/yHYf71HQMa8jQFkeHy+9CZ7+UcD4dctQ4cwDNfWm36Vm/B1ZjSP20S5oMeMgqlrZZ1qlBK9qZU0mZrWwHgd1E6vhKgTBOlIiNrQaQsLL0NbTeU+nuG7vNz/beYoSQ2Xh/UC85VYTgYUFx2FINm2XoFAgPp5gYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300120; c=relaxed/simple;
	bh=HU5LADSrpxuK1KdyyUOHGH8SfXv4NloG4/q6gIT2Las=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5fYNSquMIvq7jSAjzDoIxo3udZlQ3mNyUFUL5ys4ipU+1+DQZcSP0+5OPPBcWnDhZnxQwEPgKnivTZhZ/NYt42b5zht0RImhk34tFBTEapC8vPMN9+uBrqD8D6vn1elrc0PLSZ4aBZQG4O8qGcqfA8NN4x9SrNr9Fw8HvJIv3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4KXU5CZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z9jkLibX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nNnF3734999
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IUtMrQiaUIFSrShIi4475b4BJOl1t50l20lRUfuc3xg=; b=k4KXU5CZMagTEL7Q
	NFUKsWXeFfoU9pxQ0py2VpvczutMUXYDEX3GK/I6GqBE6ujxUlpaDsJkKoisRLog
	1ZhloEcxXNTHceiLmAYcAUhx3jsueCfXKuqNOpwcr9vyGjG0oP2JnLmohale3/Wy
	CqjPc2LyszNZW9qqMsHnl4Yv5lH47xNI2CoAOudLynv3imgLE392KDXY+bNq29CZ
	6LRlQTvYzh84ZVnKsdROnEcxFZfts5Tjx00aVlbKw/CSfSoon4Ej5flWl/ZpA98r
	f9pMrBhgEIHoO0tjrnj0tHRKsvrIhd2m49gDcUGhs+7qakhug/GCDU5HpAcntWsO
	nKdfpA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng878uk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12055b90b7bso28355505c88.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300116; x=1768904916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUtMrQiaUIFSrShIi4475b4BJOl1t50l20lRUfuc3xg=;
        b=Z9jkLibXfGVw3OjaptWDwuZEb/aq/sSq6Meyn7qFU84VZnVZ9Gczg1MU2QLufgbqYs
         SJ+8CVfkvJowphZYsWborJ451Jqa5Sen1yyb6yRvjXx2LbLaRMe1RZRBnNOElYg7KXF2
         yf7W3BNl2rs85lEDoNdfktbMq7h2bzKGANdsCXqQIXRS0wt/Ez1SsvnyHRoEzH/SWrG+
         D60LobB9Gy9ym08G5zKBfsYJcv9kXI4jwdlz7exErPn9RnZ6eWfW4HYb03BdHLtwekmh
         lI6nO+UuzT/VJGCo0KJOit2Bu3ybBwsPh3ce6AwNMHs+hAqh0FVNhLuTD+w/AsxGBCFp
         Fx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300116; x=1768904916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IUtMrQiaUIFSrShIi4475b4BJOl1t50l20lRUfuc3xg=;
        b=JFv23cHXv0QtEue3K++qejNk8PGuD+Yc3NXmTO22lIA5uVSPb08gzf4pYyqjyFV7c2
         hZz5VGUN/nVtCz6D+ymg/LN4df4rGJ8ZVtztbpyjKwPzVwKKVpiiMZ0oH7My0JamiSr2
         qQ1RK2nIOPo/OgWn06aA2JvLz6W4A1ogH0k9any0hcn5VpS9+vZmsz192sPIVtxOPo14
         rbMQYccH6Gvnf+qlsSO4/DzJqMqeQG/QY25+ncOspBCb8knKyYDcSp+FY8Ry3kAQzrlQ
         SuogAh7bp1rJJwZGA8YPGgpdTNtrq12v3AUat/9C26tsos4WYxzFUk37fbXvf+w5SW0e
         wExg==
X-Forwarded-Encrypted: i=1; AJvYcCV8WGk7BTMRdpOOQX+fv8dxHlfiZ+iFzIlKrCW8I8qiXiw5Rgy0pHCLxp1C6s/c5H+ius6baqvNpWyjnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycIlCHLqozeCZyskIzAcAq7qc5ax4GyH735skCteleJtp6GR+Q
	FGQJzX9hJFlT97NRJQMKfYUaJdmJzpN6xVtVIUWH9ap64xK8d3r0VpoRwigWqfqTZwI8HzROYhJ
	xNgqHJnxPSzZ40apDKziYdvKcrWdLWzYKw8q+Yii1VVJnEqiHTNiHg9/xa82AsNvcFw==
X-Gm-Gg: AY/fxX4Nuxnx343SA+BDMghrDvXz2XpxuhFUQI8zlqip6LWkq8zzDSuSreJzGiW+RTp
	b02f1/jz7Thq3fni//kkguQ1S7IftsNyJSpfOppo0obuoGkCF8JK8tf89n2ba1J7X4cGK54/zk8
	T9Jzn1hZjF2ixYmP861mOnB99mXVDdqY1t7D0D4LtvsvTVsalvlPLKsgtbNhtwam03hNF08889X
	xyBsDkaUDgct1+/56YD3jo3v+NBmNM+94jKWmx9EyW1Z/hAASHZII7/tn6h7SHbZWfSCpGWJD3o
	lDT++PWKpVgKhuDdgOo/IVc2DRLFJlhiIylicrxfUAngiQVKk1Btt3ucdrp1L+TQvfEhxbX8UMf
	RoxodcFVjS+wu0hXy3B2s/u1SbJMniBJmfUOEgpNuSNMrcCNTBlFCuw4bcKYn9PBR
X-Received: by 2002:a05:7022:380c:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-121f8b5a33amr16338203c88.41.1768300115818;
        Tue, 13 Jan 2026 02:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV5WbVdo5rQ5sP/hDDUIAjGEGohIT6H9t3QHJLXK0wt+jUYgBKtunUDg6UvGKRrAhMzoXlug==
X-Received: by 2002:a05:7022:380c:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-121f8b5a33amr16338165c88.41.1768300115216;
        Tue, 13 Jan 2026 02:28:35 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:34 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:31 -0800
Subject: [PATCH v2 5/5] media: qcom: camss: vfe: Add support for VFE 980
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-5-e5487b98eada@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX+h4owq+6Sstu
 nlgefUOM8LFw+NhB7n6UXAH0n6dqTCo9iiKWqqHUPyqZa46kE+C4kaU/sVFMH7H6aQTpFLtOzR3
 B6UNhgiYBtANRSr6Y2MxYzWcTRcIzIst46VJwwE99C6YR+KHowcIL4OgBHraSSDejKP3Ld79Jtv
 C1E26rZzGb8TdqMXy0vLmqRGG+tbKxYVblfj/4gXlFsIJb9Zp37jqhTkNPvYKvi8K2ZQajcotyO
 ZzicjU+SAsRbQQ/pOyfvMLFvr4XG/bqt6o97H7sGFGPZv43f6cE9sGnY+wQlQPSpcLrladbhcel
 0OfFHO0BtQrDXBPTqxQnsOahEoBudfCbe35IBUX592NLuAFofOT6ENzpT9W12W0+P19wdYEHecf
 MtiGa7Wo29977ES9Re/C/l5nR+sHWjvlkZPOYgNsUpR4lpsk22p+YENjxZWDybZyVcjULgDnXDP
 9iRth+IEqq/lacfuQcQ==
X-Proofpoint-ORIG-GUID: c4sG_aF5LHeY-qSCgTzGi920aXtFPr2D
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69661e54 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3rR15nC7HOTWOJgZU7UA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: c4sG_aF5LHeY-qSCgTzGi920aXtFPr2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add support for Video Front End (VFE) that is on the SM8750 SoCs, which
is the same as VFE used in Kaanapali. VFE gen4 has support for VFE 980.
This change limits SM8750 VFE output lines to 3 for now as constrained
by the CAMSS driver framework.

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
index 399be8b70fed..b8aa4b7d1a8d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2012,6 +2013,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c52e6f7b6294..1e33d42eb550 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4262,6 +4262,139 @@ static const struct camss_subdev_resources csid_res_8750[] = {
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
@@ -5702,9 +5835,11 @@ static const struct camss_resources sm8750_resources = {
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


