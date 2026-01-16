Return-Path: <linux-media+bounces-50836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61364D2D30E
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 995A8301907B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32DD34DCC7;
	Fri, 16 Jan 2026 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pg/8+jaD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3gfF0Je"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D135295D
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548472; cv=none; b=QsGIzeM6mnpMopUzlC7Vim46QzpdIUAbJ+yYOMGS9mqeZeLtpgIIUCRKN7PwpNKcRmjWnXz9XSQOA7qfTgo4D6j8b9p51Mf6+gRq1bo4hGPIxEfRm2nmutsTzzNRlx87p22stQHsyBkkTfkVS8AfJgkmCpN+3O70rmPQ2lxKcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548472; c=relaxed/simple;
	bh=CLwtGbYMk7JPP0q90MTX23YSmAwj3tjnRTfHx1oOcwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9/CzmYooVEDPfndzlOihpgqWdr/fRoepJ5fVOsbLY9tJW4S2/6hWnI5ICWRXU+QMmzWsmQX24ZdZd1mns66tcEgVlT/JORLRxMQ2C92+S8FMTME5c9Ae7ySSowuk6saTRRhcvWffr7kzrfq9JQ/s92VK38SAUn7uwurq5VD0iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pg/8+jaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3gfF0Je; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMcgp94100630
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=; b=Pg/8+jaDveFD4Lrw
	f7e3NY6djZyZlaQNPfS6yvwZF+iLu8hJ0Gf6d+WOJk8pwmXkCEz2rMZV9+TFxtuj
	tuAOkB2ror5Rn4iVl2wFLlmVgJGjMOn2rWVfv1+N4X9Mz295NlYoFuSRAMy27+i0
	Vt2yj41lEVWAOWJtPzQdHojuKDahZG+PDqsayMbVsq8drFvrI+SMiGgscne0HpVz
	Z6kOVFZ0CLKB+P4o6tC8fIu6MfV2NqUp+Nq0JHrvHOfX2Z00479wbDuuY137C0Zn
	bW6VtBO8QhYca8LUzM2i5ulSVmNOWikgKwWayyj7bRGWlK/W578sh0sfuZ1cs08R
	il6Rig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97517ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so798145385a.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548469; x=1769153269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
        b=I3gfF0Jeq1ub/VlBf8F+F2JlXprOdRZ0n8lZUehz0FsG7l6wFxTNP2feEsthSmgNU2
         zJ6uqbuYtGf96ZYKUsVcW0Om5uqIaa6E+BdQzK9E2Gh67SN74uZkXov31mgS8jf/kxkq
         +NApYoIjAz6o5I4aSl/JivxM/L9dKqyPX5/I63C1spV62TFDxVSM2IEA2U9sYckZ+AXV
         3oXKmPTgEapFyKthMJXj/phtCwb6x/BXY29e37JTPxRKpFiNHotkEyi2B1Z3i1Jj6c6K
         CJVJ2Gk2cOzo2Mgvr+Zbd3J8nkbGXDwwjWRRaOdMYBVtgEaQ/HbEQZWX66irc/e/+e51
         UvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548469; x=1769153269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZ0iwrehLKaUcajId2K+vtohdRW3UYKAHqXQkWw5X5E=;
        b=rRRowB9EUi3iZNx/464v7Nsmm50uqaIfAyTLxNCF6svNrFkPwWofRPdRee5evGIuqF
         xZNV9iNaGh0GPsrjNcvqvy1ybJh3h0YNKulzLDvAdS+t11Aj6SYBQkScJatgaZozPjj6
         R4uKmRfXdXOwm0JNCJUbr0QNECz4FIi9rXpZPy0hi3F9v0rGNbVtk+Y7TQ7b3y0wi44O
         hZudLOWBluKsNDyNQQMCtbktWxGjgIQt2pu/Qfxl4ONWU2sB/I8ZbAvqMOAKASBGynsX
         RxKGIaqctKy5VVoKo4P2vq6G/wOGDwtWzNmUxN1GNlB5BJJ9OHnT2Jme38rqhWrpyf9U
         eLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtnjGASWElqZLIqZqpmsxTyErB7nZesJ7eJBQlfMPh0/WGaKZFbgn1MYVO8T77rUoxNM0LkPqDZdPqaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYd9vLzi0kqIGaxXBskteqrcusOCIm0UCzfYc16epUwU+hxSv
	qiplQb6axm/uws3xCk1wXUDlqjPWbkFdkcFR0sv4o+N/FhVRLD7WtfsEgYZBVmz9fl6TGRsZFb7
	OpM8tJq7pUX2e8KfYGoOY9kfrgQLVgHux35JNPaeE/pbnfrUtSVz2SRK3KXn8kqA/2w==
X-Gm-Gg: AY/fxX54F6xlhTIyU0ohyoT1O8C56ZvichZP15czVOLC1hBH80rONIHmVGdbMCXvPX7
	nFAZXXjpm1qrpV/1P0LxYzhXOZ6G0n99KFzT2E0igI1jAnjusnel1ZFAOthPynMDwBZqUWeMmJ2
	nvJaVHgykg1djttYixiyQdW/c9HV9stpxxi2ZJjQc2AV4E0jlnqRdHVup9C0eVAdeFg2+mHdDvu
	K78JpkYooEviqKip3F5dfkudxmDUuC2sNwn26thZYxwyomNtBOYxQVZ0edyff3cS+rq9pjHZQvT
	xZXGSJ6ZX8vIv4X+aG771BRdvVUdiZxUGVgd4d/Agczuw3AJ7JvqmTcbKAEpprgVSPOvM9uAE4b
	kV7tVd/IxWRQGZUHPlHPGIEyQii3vL+49+lQzRK3H/RWEXl1Rt2MrqZezqisZwutO9i1SeOAwaU
	lkFHZ2xjNJjT1fQrWjm0kw3Nk=
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c6a6965342mr275659185a.75.1768548469343;
        Thu, 15 Jan 2026 23:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:2915:b0:8b2:e638:7dce with SMTP id af79cd13be357-8c6a6965342mr275658285a.75.1768548468955;
        Thu, 15 Jan 2026 23:27:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:40 +0200
Subject: [PATCH v3 6/9] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-6-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CLwtGbYMk7JPP0q90MTX23YSmAwj3tjnRTfHx1oOcwo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehqux+edbq6z3a9Wwtvn4DrpEkdkreFomTW/
 0GyHvpNqbOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1fzFB/9pnnNJp6fEXrEne1FHN5Ync/IFqS/ZFBzmZieZpTw/pBAe6HMkip31brV2LXiZyM2Spbl
 Z3uUdfVSWgBHzCAZL4Y1BpMnHaNKQ7nyZv9GFFzTBAVkAfIJcKZL+8G1E/JjV/ocDcwhqkFXJmQ
 4LT/65d5sIOcB/eau8UROFDkSi3pqw3BXmISQZYQBi6EfhycwuUQRjyKtOOu76s6Vf0pCQq61qj
 hDwfOJFu576VddZN/81TifqFo3cReZLLZtJM8al0buBeDbOMisdEC05Uze8bf1wFlQWeK+VyvTp
 YWYaZQQe4wnVYjcyMoTZvBSVA+9vK233vviPiZIBfYvd/rk4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXxzCjK52/wKl+
 RBMf3D+y5T0N/LoESuPc6o37jpS09Q/lXUaDfPQc/ZmHWvXT7lGeR+YEoGpzwHBrzAwPKiARc/B
 FiD2BGY+h9jzLoKPQBJ3OdhUqOsokrm/ZN3bm1dKSK7OOzp++W1XYVfev7bEeAXiashjdNk9POz
 SrbenO68QQpYGFEEAHZNqVTns9TlQp/pW9X8wEwAoq5Prtslr9l6qGfR9sxwe4kcjzKKOOgbaUR
 3ISfx8cKEeBD8a0L3w8DRhGAH+SO2Fsh7gTlbUCnT9PhUg0zGTBq8pHvY8Pldd4tI0YiyHsm8RI
 9jPMN8Gk9FnEDERpkj2autZrZr7WR1rIEhNXM994AjsSThCRMSqJyv+dXDY6DGPHJ5kZMnEGhZv
 ac86hUtPTtmQfaR/gMJyDfu23J1ojhYXH70IWNBQpgQHISubQEbzPiM/m2fA3v7mSk/RmQi1gY1
 SM7a+KFDLm+m4hKk1NA==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969e876 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZfhpKNcX5NDMFmjZw4qtEvYEstNsj1Yx
X-Proofpoint-ORIG-GUID: ZfhpKNcX5NDMFmjZw4qtEvYEstNsj1Yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 6dc0cbaa9c19..a4d9efdbb43b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -170,7 +170,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -180,7 +180,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -190,7 +190,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(qcom_ubwc_swizzle(ubwc) & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


