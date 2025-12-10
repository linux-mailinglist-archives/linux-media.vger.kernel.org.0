Return-Path: <linux-media+bounces-48562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EBCB2ED3
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 13:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E43E1302E978
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C79324B1F;
	Wed, 10 Dec 2025 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJQkWHl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9qcUBJU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA63246FF
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765370205; cv=none; b=dip+oxTe2z6yf3b6cVVlDBAaN5+gsqw3qfhov+sxli20y90WPKcp6Y/cusjEd9icPEVo2awCIGFETCJRLVjmhHq/Q4642rtYD0jjzZznWM9ruGfoFwGvYzi3Iot5Ex7Vp9yNcEvPSVEGUVEz1nTir6+7vGJgZ7DZ+whh7XdwmxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765370205; c=relaxed/simple;
	bh=aEjIjUunF5XAIN6bDtmzC0NadIWpOrBII8zcOHRYU+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhIJOYLrJsqQawOLhK5xAZ01Ae5VTGUvFaPYEoj3MVAYg8Ka9j9Lg6+CNl0tWxlmcBWyLw4OBLkKqfMBhxCR03bTPc48eK6WbEDwxytImH+ZZ25csYoQWA+KulzYBQgxkhRK86Z0Evd1Zxh64JGLxpLZP8Bn3uewUfYvdjP3nFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJQkWHl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9qcUBJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e2Bf1817855
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8sLP+7GFBzZqLFQda9pOcSh/ajVu+dBMXzxzsJQ6pLM=; b=dJQkWHl7agAoFSg/
	l7GvCH3J0F6DwT8uDPFapp2ImpcGVEhPKXMNYnOOjh8d7MnQZZXu3wKrx4la2apx
	Kbg4Mt8GbET5/1KRo+lG7keG0Iet4oSn428/JzZBgE7zJXWg73t+0lNJCoCZ9gan
	d1fvkpLtUKrTUN+ylfpuKNVm8yvL+UvIXiJP24CrXsGxIkLDhzDhQWuHuASXhr7N
	VDa8lvYfH2TOMhMTxxi8gKpqwihx+GSU5KF9l2qBnUihG7u0xW/+ogBbcN1iJQhl
	tC3nY33fNSnfdQqYEhwsPa5PfMLi+n5vg8qgqmAvDuPmzUgDWy9FZH6JxT4waw+M
	Yujv7w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay2e0h84r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:36:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29be4d2ef78so140778905ad.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765370201; x=1765975001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sLP+7GFBzZqLFQda9pOcSh/ajVu+dBMXzxzsJQ6pLM=;
        b=B9qcUBJUbQIlD+tHCBIKDn6Upk5PAWHVJNT9MZC3MmSo1hQI8WK2Bn7TEQUt54Nn8j
         eG5gLhrUht+wfoZjYtqFvNv3aplsK2og3LfCi1yKPCeSGYKv2EfEUQhbuiebLIjgWL0N
         pitSOG2dqU4pjjnOHhwQutVM9LvV5t92Pe7gfR1kV+F8w9uIm/b6/bZVm2NRK1XIlt91
         JsOv1H2SxugQC8ag0wXwSZD7K1gRKLsBt896xRfTX2LyGb+IzZbhdyfzsIFqux2vDdLy
         oTdUWRfu4FUvIvmU5Qq3JJ8PK9boZSp2moE4Bfu4d4jTpcM1OR0ICRFw4yacOhLjQO15
         MsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370201; x=1765975001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8sLP+7GFBzZqLFQda9pOcSh/ajVu+dBMXzxzsJQ6pLM=;
        b=v4mCuaMZL4ZfuWQMTkJ7F9Nx6zkoWSw4hwnHSYNd0XDVMGJ4YAmK9ZQeaayfB1pea+
         dty0ebmga5QzMp6iii/w8XVWxaiY8A7iFirn3IqQEcmwkx3+k4/R9BSt1TyMvMqsGRzC
         LqMTYwb4NizlsqpDiZTxk8BZ/RGSe1FXQ8nJqT4Gp1VkItDIgr6OfG1v5gzzGrl+io9g
         3OMl7ZNzvu51Rl+5o7mEz2pR8Ow4D+sXsMSIU7jMj17D4Q+tGhwGhwP8pVCsGpn3koWs
         HNl6aktJqFBQdPyH15w/K5+WY0VJLhj2oFxBtNVb/ZFtOsc8BDO8f6EAtsleXyrRYV9H
         J36Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoBbcYtjktt70KJjZSB0Ku/qpWkn0W9E4kXkQT4I3UJaxw1rcEXDo+Trrg7/54dZy0WXvaL/aPPRchaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4loV6NPiYXx8hWecItXXb1knnY+9kuMvelK+AlubjV8p9esYY
	B7LDU/zTZH/QeCQ915HjtXUBqScpXEjUPR8ZuUyM8K4PqxOIVHzainIqsSZ6I/fTscPimAoHE42
	krowEz9e3Y2BAsFh7Xc2B9iJNPTXOnzIwRl5cCAuUcqcADQStTZBuaoGmCgF7l2Y+mG9m4N4zZA
	==
X-Gm-Gg: AY/fxX47sN2Pb70FSktx8FoZD7ntJcIq6wg4m1E5VcENKSY4cfoPGmt1nbbgDGcC5K7
	3UGFlGV4h7aEHA7rAu4eWpyEcuq9OFheJH0CazH3QnMK3Ir0PksBOx/2MUHlVvNxiqfTLMqG9mk
	lW/Z2wPriHxB38goDvYXWbviwaEbhVImixyc0ySZypJ0lUCqE6iqhRJ5dJ4t62hFxb8kqVdw+rr
	u26xbmkj8GGvI5SvZkjv07QXrYirlGIxWo5t5TeEf/J9OYwteAaEYtKMMU7GfYmITU26umWcqq5
	FBK/zXD2QevYESg84cZnvruIe8bdyCN6F5arJw8s+9qVHHU4zVMsxAM78kCQG7M52Bixj2jQ9SK
	fR3Zzax5nnHOqs1vtC7DZ8X/scxlHmDnzsaap3b4itRFy
X-Received: by 2002:a17:902:ce02:b0:29e:a615:f502 with SMTP id d9443c01a7336-29ec22e7280mr23727865ad.20.1765370200678;
        Wed, 10 Dec 2025 04:36:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJg1jtakFvM1pSk2FdxKyMdTBXHszFZ/6/HgzrgWc82clz+SAzXcQmZzg+sMkQtwW+4rZmBg==
X-Received: by 2002:a17:902:ce02:b0:29e:a615:f502 with SMTP id d9443c01a7336-29ec22e7280mr23727595ad.20.1765370200159;
        Wed, 10 Dec 2025 04:36:40 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9c0sm185434615ad.68.2025.12.10.04.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:36:39 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 18:06:03 +0530
Subject: [PATCH v4 5/6] media: iris: Move vpu35 specific api to common to
 use for vpu4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-knp_video-v4-5-8d11d840358a@oss.qualcomm.com>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
In-Reply-To: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765370172; l=13761;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=aEjIjUunF5XAIN6bDtmzC0NadIWpOrBII8zcOHRYU+M=;
 b=HepDnfirv74CTbZca53QjEKtU0DQIj2p61uJhdaDpTmvWBpauYTyiVwIezqtKNReQsslVdrky
 JwX6dudN/d8AOWrmu4u02+97n80zinJFPEO9sjaR1nkMP5vjx13Pz8T
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEwMCBTYWx0ZWRfXz5nY9Hrd4UtQ
 RF2i4tBA9j9fbgz2CaOcE/Tds38fKbpJTJmD5dhM5sGDcT+7Bb++FUS6x+r1+u1N7bpyEZG3wzz
 Cis848ZFj+fnKA9KU8sprYdFmdTgUGSnX/jjh904MwUyZTszR/7sElEjUJlK200EHnMLrP9r0+Q
 EAHESRXyf8P1Q6VRr3eq7/3TQOrSvCDr0EI86fWtB+AATs7hHE8lO+G232Q8UZavfk1mrIs9jV8
 dGp93PjRiEAvu3jcM+tvUg5bhYDm/S4tpy89Fvn8ugNNdof2xZqCvHCMA/6HN6i1fFzIWRQPkC+
 DEBmhnpV51fng7zTCRCSHsI+3cF8Ae8E3IZm6ilBXcb4vefZERU6lT4mNRJOs7aGZnYkNmV6WsQ
 fGKUdTez8LQcKhFnQbSsuIsZVQDz3g==
X-Proofpoint-ORIG-GUID: GY8dJROZXWfUUFE9vb_SCDzSSIEiXRFd
X-Authority-Analysis: v=2.4 cv=G5oR0tk5 c=1 sm=1 tr=0 ts=6939695a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PEWMjObkg-UKx6eyHxAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GY8dJROZXWfUUFE9vb_SCDzSSIEiXRFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100100

Some of the sequence and calculations for vpu4 is identical to vpu35,
namely power sequence for vpu controller and the clock frequency
calculation. Move those to common file that can be shared for both vpu35
and vpu4. This patch prepares for power sequence for vpu4 which is added
in subsequent patch.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 157 +--------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 141 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 3 files changed, 151 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index cd53bcda3b3e1d6f234486df49a51150a7ec9799..fe4423b951b1e9e31d06dffc69d18071cc985731 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -16,8 +16,6 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -262,155 +260,12 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 }
 
-static int iris_vpu35_power_off_controller(struct iris_core *core)
-{
-	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
-	unsigned int count = 0;
-	u32 val = 0;
-	bool handshake_done, handshake_busy;
-	int ret;
-
-	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
-
-	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
-
-	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
-
-	/* Retry up to 1000 times as recommended by hardware documentation */
-	do {
-		/* set MNoC to low power */
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-		udelay(15);
-
-		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
-
-		handshake_done = val & NOC_LPI_STATUS_DONE;
-		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-		udelay(15);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
-
-	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
-				 val, val == 0, 200, 2000);
-	if (ret)
-		goto disable_power;
-
-disable_power:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
-
-	return 0;
-}
-
-static int iris_vpu35_power_on_controller(struct iris_core *core)
-{
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi1_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_ctrl_free_clk;
-
-	return 0;
-
-err_disable_ctrl_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	return ret;
-}
-
-static void iris_vpu35_program_bootup_registers(struct iris_core *core)
-{
-	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
-}
-
-static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 height, width, mbs_per_second, mbpf;
-	u64 fw_cycles, fw_vpp_cycles;
-	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	fw_cycles = fps * caps->mb_cycles_fw;
-	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
-
-	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
-	/* 21 / 20 is minimum overhead factor */
-	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
-
-	/* 1.059 is multi-pipe overhead */
-	if (inst->fw_caps[PIPE].value > 1)
-		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
-
-	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
-	/* VSP FW overhead 1.05 */
-	vsp_cycles = div_u64(vsp_cycles * 21, 20);
-
-	if (inst->fw_caps[STAGE].value == STAGE_1)
-		vsp_cycles = vsp_cycles * 3;
-
-	return max3(vpp_cycles, vsp_cycles, fw_cycles);
-}
-
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -418,14 +273,14 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
 	.power_off_hw = iris_vpu35_power_off_hw,
 	.power_on_hw = iris_vpu35_power_on_hw,
-	.power_off_controller = iris_vpu35_power_off_controller,
-	.power_on_controller = iris_vpu35_power_on_controller,
-	.program_bootup_registers = iris_vpu35_program_bootup_registers,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 50242fc6b4653a7d74ff64500f40eb8a859a6548..548e5f1727fdb7543f76a1871f17257fa2360733 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -8,9 +8,12 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -305,6 +308,144 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
+{
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	bool handshake_done, handshake_busy;
+	u32 count = 0, val = 0;
+	int ret;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	/* Retry up to 1000 times as recommended by hardware documentation */
+	do {
+		/* set MNoC to low power */
+		writel(REQ_POWER_DOWN_PREP, core->reg_base +
+		       AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
+
+		handshake_done = val & NOC_LPI_STATUS_DONE;
+		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+			   val, val == 0, 200, 2000);
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	return 0;
+}
+
+int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_free_clk;
+
+	return 0;
+
+err_disable_ctrl_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
+}
+
+u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 fw_cycles, fw_vpp_cycles;
+	u64 vsp_cycles, vpp_cycles;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * caps->mb_cycles_fw;
+	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
+
+	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
+	/* 21 / 20 is minimum overhead factor */
+	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
+
+	/* 1.059 is multi-pipe overhead */
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	vsp_cycles = fps * data_size * 8;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	/* VSP FW overhead 1.05 */
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	return max3(vpp_cycles, vsp_cycles, fw_cycles);
+}
+
 int iris_vpu_power_on(struct iris_core *core)
 {
 	u32 freq;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d636e287457adf0c44540af5c85cfa69decbca8b..7cf4304604cca590544a938c7e811c202cea3d93 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -33,5 +33,9 @@ int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
+int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
+int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
+void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
+u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 #endif

-- 
2.34.1


