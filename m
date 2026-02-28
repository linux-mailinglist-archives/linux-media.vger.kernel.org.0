Return-Path: <linux-media+bounces-53816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJPBLXCnomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D71C160A
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D94E307518E
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9D13D9033;
	Sat, 28 Feb 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgUhrDTi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCU1o/Z5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC33E8C76
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267343; cv=none; b=dOpYBFHqmT/o8mFCB0aHGnt3EjVsSJRwPRFzyw5mdKxCmBdZZUjUoA2uLqcQubeuFpN1IsEdZn45MienUYgXVuQNFQRwDtTQcYp/Ql2rNIW3DOndUyOySWB90xTX4nfHBtGQk9SXcQmBn4FZCBtZIvbCZUfbdvoGfXEvkdSb8Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267343; c=relaxed/simple;
	bh=F8z4p8A5FWhkphd/1cHX/Mm53KeEhLg9ROSzJckUOF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTvYDvXimJ7fh6I4rvUrC2SUeXMJMLP89RUtG2iWmkZdHeh3tNKT/B6GHP43/5QIaMJNPtoQfoZcgHDP7EnB/XQP6jSyEdmswvqMhktiBnqNWvf6kMDOvkv+sAkXSdB44tyhyunazuOfruiDbB/gX8XnE2aAYWA9q000EIr62Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgUhrDTi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCU1o/Z5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Nlt31820783
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J2+XSvcbwVCAyE2Y4h1wm9PEGiKOdIToKS2l2j9Z+qM=; b=BgUhrDTiPIYOahEJ
	J/xStUh4j6lId+vmdRUodB21tU0/WchGCD8a6Z9VpJxTilSA1K8HzFaIaF+FzbAN
	wUmt25U0alXKd//oTmVzVHWiDLGg7Lt+rHWjPRgrmizBt1+NSAr5RVqfxHcT4zjw
	X/msLAvAboGXSV9anRbMDrxvDZImpAXhx1MGAMKuvMD/fe7SrX8QxzjXI/SyTSDm
	e4xwibb9eBsHGTQpeVVZiZLPdkOCWM4wsMpSR8uFySA8wEjRtnGspm0aIvboX1Xz
	3rMP+cLnMz2MGv35Oy584evDnpnvlCInG63PxFjszlQ+KN1ZjEGMQftV+YUYeczj
	y1OQ+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq0jd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71304beb4so1833635385a.3
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267340; x=1772872140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2+XSvcbwVCAyE2Y4h1wm9PEGiKOdIToKS2l2j9Z+qM=;
        b=BCU1o/Z5/JUxiv464BkYKidYkDcz43MRjjFiqUEr6tRiNTHeJ9DJLw8Zfzq/9/VIJZ
         ilpG8yMPtmnX8G2jL5nXaafZD3pZMQRbPWuyxGJTqLeXzAuKcF9kqBSB27GbdcvTihr3
         kTYrdfBhCBeWbZbqlU6D24jy/8dupg9WXFvxVel//Y7FFc6mJjR5YOA6SHAoMR7cjwER
         ydc8mSgAUI9XZbF0wy5WUf65ZzaWHMaF0TSHrIBH+EwPCYX5UjWJPj6UFogBu22Df6wL
         UNVzdBC1+usu8uBZ5wC1ztRBSM3P+1HaeEEzqLQ+3BGidajWkbFcIzYjjOL6WcHkbjSE
         DbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267340; x=1772872140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2+XSvcbwVCAyE2Y4h1wm9PEGiKOdIToKS2l2j9Z+qM=;
        b=n3vnFCjlMkBst8gDpcHNnaksipuOkwJWzQduVIkSqd5bMsxvbloFBSMzTPZrfdqLcP
         V0mYza6x61fKgwu5b7U2ZFi45TUn4K5yRvYWpPkkVsUElMtw0JG43BO/Udf7JZ/Rab9x
         fw+/8Nz5DvNchd7yKK+uCwIQPxM+owWsA+c7z/xPufc0UEYn9u9plfYHLEu2XTUY4wKm
         4XEEdK7Jn4DSWW5gNfJpscZj1OrpVNF036K+byHKd2EDo4AH0+qmMFX3ZVVF9cwCLKxd
         pal3GdQeyvl1wVE9TFvmREzxboSYzhJ8HXxuQzrgwG7nBBB/pS7TJkpEVrgG1RZnVfwT
         zjtQ==
X-Gm-Message-State: AOJu0YxsJ5KF54SxavcZezFtjBg1/Bp9iqx2TjGanI3+NdYz/TrC6unG
	5OwqpLRgZBaaMngGkE+5x+QkMe33uDdn1QWMzbp67d28bKLdaRU7rMvjNYvycOg4Pj3uCWyXrFZ
	vyjFLXinPJrWj2CQ7Ag+eZYx5mcL+xH+T6KdnfMsMMG42q0Wa+XQ2sghd64B+eD0vLQ==
X-Gm-Gg: ATEYQzwelbtVxsV/j+94M+h76P0ix1F572LYVnsSbU9+8sYQ9LwwOhoPEPZm3A6J0y/
	GAFdfGvFXp4GwvejR2vdaHys/3m+7Uk/bf8RXQr9kdfiAAkRqeKE+6kRLumKzpaLOvgbQp02zv8
	NV23e6+Wkg2dP2NFGcjGlHYlGhjX6uQ217GXlTKJkeya9FyVJW3cRAP1Sh3XWYUWZ9x6/yT2kUP
	wvO89gTcZv3Dpft+jejxdOv6FgIx8+easosMRu6+IxapKU9EIbLMIOC/+H9zueVq3ius8uYyg2q
	aOpnbBX4WvJluDmA04wwpDWmgt0HUov23FkBWEsN1Y3ZFUW26TVNjWRvdTRSyzShcikHJc8L32o
	w4hMmeZC0QsNmHqKA7+/D9G9QkfbuAt4585eVoF3XAT/kvPoMZNXs77D9S7plCiAIkyqQBafLwu
	4pT1EZ/zfA78yE0qu/mDrqbotqSwryShpLrs0=
X-Received: by 2002:a05:620a:4451:b0:8b2:e986:2707 with SMTP id af79cd13be357-8cbc8e031bemr729974285a.45.1772267339727;
        Sat, 28 Feb 2026 00:28:59 -0800 (PST)
X-Received: by 2002:a05:620a:4451:b0:8b2:e986:2707 with SMTP id af79cd13be357-8cbc8e031bemr729973185a.45.1772267339215;
        Sat, 28 Feb 2026 00:28:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:28:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:48 +0200
Subject: [PATCH 03/11] media: qcom: iris: handle HFI params directly
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-3-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=21710;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=F8z4p8A5FWhkphd/1cHX/Mm53KeEhLg9ROSzJckUOF8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqc/Z7j58thKnWr93V1+0mqcz6JnQzQNkX2jj
 z2aU/uC9s+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnPwAKCRCLPIo+Aiko
 1cJKB/4qzwcS7ZwiCLgbEz4xRR+SIxoEjqBkXpu6C3meWvK9l0RLLeHr+m8gCCEiWQmbWHscSml
 ALpjsl75CYBLaf4v88MjVtj7VT8dfo3IjxLQ3F4xWNpvfUiKlenIetXlgBCFQM4dTPP536Serrn
 pPPLmpT0Jk+6TpZRmononMskvwPqadOT/FSoLkPCshguqfcHlg8eu86wcHxUeBE2jnxrmfRSJkD
 3B2B0qy33MbqBUwCM6y3zI7G75w5x+aruCPa7VuM7N25J1cby7xYEKEVrhHfZVUR1svGSI5X2XI
 NrBtlUyOKLvUzKHcpA1MZj5gJ1YKorm/xXeM2WiWvbzrkDwE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: jLdwSZXKkfc9q6m-gAhcpkGrnT1aWDR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX+s/JtgwUr7Ua
 qkemyxGJNBxAR7cp2h05yeVIyq2BSZNXEIORclThrP48FmuT3r/Y8sZ6LC839Ri81C0i5BlBvGR
 mn3NYYZN9Q8u/dAc6sMHUensHoznh/Rpc4WkVKR3Ao6Oejir8vXos5rO3dgsOAGZCxkiG5qhoR0
 nsZ/AqHSpa1o3bMcPhtXFoFUsOuGEBLhae66gFoQMod5aB+bqStsqdMKla0IV+UY8miYt/K6jE5
 EM3zJ7g2QCJEUqwizruPhapbOBjj6+wmdJnFQmShviQ59j+eCHDrUto2vOHLu00tdZ2VwfCa6O+
 6X2VrwZNsdWkN0Om1sp7aDr/OYyGi3BJCH/attKfEIHvJoC06nPOFawEbnS82E+OF3RlG+5G5IF
 anA8stQwXCFOyYyW/w2MZyovdgP9sxBQXncqW9cchPvR5/lZaHhbhR3V0Ui1VpiWx6xbvliOIAK
 eHGhBDEI9veYbigXT3w==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a2a74c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0V4xn3LT2fnV2DziLREA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jLdwSZXKkfc9q6m-gAhcpkGrnT1aWDR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53816-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 468D71C160A
X-Rspamd-Action: no action

The HFI params are set per the HFI generation, they don't change between
different platforms with the same HFI interface. Instead of copy-pasting
the same params between platform data over and over again, move them to
the corresponding HFI generation source file and drop them from the HFI
platform data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  28 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 118 +++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |  14 --
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  33 ----
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 181 ---------------------
 5 files changed, 114 insertions(+), 260 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c..d5eaf8763f6d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -978,11 +978,29 @@ static int iris_hfi_gen1_set_stride(struct iris_inst *inst, u32 plane)
 	return hfi_gen1_set_property(inst, ptype, &plane_actual_info, sizeof(plane_actual_info));
 }
 
+static const u32 iris_hfi_gen1_vdec_input_config_param[] = {
+	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
+	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
+};
+
+static const u32 iris_hfi_gen1_venc_input_config_param[] = {
+	HFI_PROPERTY_CONFIG_FRAME_RATE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+};
+
 static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	struct iris_hfi_prop_type_handle const *handler = NULL;
 	u32 handler_size = 0;
-	struct iris_core *core = inst->core;
 	u32 config_params_size, i, j;
 	const u32 *config_params;
 	int ret;
@@ -1033,8 +1051,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	};
 
 	if (inst->domain == DECODER) {
-		config_params = core->iris_platform_data->dec_input_config_params_default;
-		config_params_size = core->iris_platform_data->dec_input_config_params_default_size;
+		config_params = iris_hfi_gen1_vdec_input_config_param;
+		config_params_size = ARRAY_SIZE(iris_hfi_gen1_vdec_input_config_param);
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			handler = vdec_prop_type_handle_inp_arr;
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_inp_arr);
@@ -1043,8 +1061,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_out_arr);
 		}
 	} else {
-		config_params = core->iris_platform_data->enc_input_config_params;
-		config_params_size = core->iris_platform_data->enc_input_config_params_size;
+		config_params = iris_hfi_gen1_venc_input_config_param;
+		config_params_size = ARRAY_SIZE(iris_hfi_gen1_venc_input_config_param);
 		handler = venc_prop_type_handle_inp_arr;
 		handler_size = ARRAY_SIZE(venc_prop_type_handle_inp_arr);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..de43d90b5a2d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -599,9 +599,73 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static const u32 iris_hfi_gen2_vdec_input_config_params_avc[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_CODED_FRAMES,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PIC_ORDER_CNT_TYPE,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_hevc[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_vp9[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_av1[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_venc_input_config_params[] = {
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_RAW_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_config_params[] = {
+	HFI_PROP_OPB_ENABLE,
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+};
+
+static const u32 iris_hfi_gen2_venc_output_config_params[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_FRAME_RATE,
+};
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -630,31 +694,35 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {
-				config_params = pdata->dec_input_config_params_default;
-				config_params_size = pdata->dec_input_config_params_default_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_avc;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_avc);
 			} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
-				config_params = pdata->dec_input_config_params_hevc;
-				config_params_size = pdata->dec_input_config_params_hevc_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_hevc;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_hevc);
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
-				config_params = pdata->dec_input_config_params_vp9;
-				config_params_size = pdata->dec_input_config_params_vp9_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_vp9;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_vp9);
 			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
-				config_params = pdata->dec_input_config_params_av1;
-				config_params_size = pdata->dec_input_config_params_av1_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_av1;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_av1);
 			} else {
 				return -EINVAL;
 			}
 		} else {
-			config_params = pdata->dec_output_config_params;
-			config_params_size = pdata->dec_output_config_params_size;
+			config_params = iris_hfi_gen2_vdec_output_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_config_params);
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			config_params = pdata->enc_input_config_params;
-			config_params_size = pdata->enc_input_config_params_size;
+			config_params = iris_hfi_gen2_venc_input_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_input_config_params);
 		} else {
-			config_params = pdata->enc_output_config_params;
-			config_params_size = pdata->enc_output_config_params_size;
+			config_params = iris_hfi_gen2_venc_output_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_output_config_params);
 		}
 	}
 
@@ -849,24 +917,20 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		change_param = core->iris_platform_data->dec_input_config_params_default;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_default_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_h264;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_h264);
 		break;
 	case V4L2_PIX_FMT_HEVC:
-		change_param = core->iris_platform_data->dec_input_config_params_hevc;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_hevc_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_hevc;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_hevc);
 		break;
 	case V4L2_PIX_FMT_VP9:
-		change_param = core->iris_platform_data->dec_input_config_params_vp9;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_vp9_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_vp9;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_vp9);
 		break;
 	case V4L2_PIX_FMT_AV1:
-		change_param = core->iris_platform_data->dec_input_config_params_av1;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_av1_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_av1;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_av1);
 		break;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..00e40590d5ec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -243,20 +243,6 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *dec_input_config_params_default;
-	unsigned int dec_input_config_params_default_size;
-	const u32 *dec_input_config_params_hevc;
-	unsigned int dec_input_config_params_hevc_size;
-	const u32 *dec_input_config_params_vp9;
-	unsigned int dec_input_config_params_vp9_size;
-	const u32 *dec_input_config_params_av1;
-	unsigned int dec_input_config_params_av1_size;
-	const u32 *dec_output_config_params;
-	unsigned int dec_output_config_params_size;
-	const u32 *enc_input_config_params;
-	unsigned int enc_input_config_params_size;
-	const u32 *enc_output_config_params;
-	unsigned int enc_output_config_params_size;
 	const u32 *dec_input_prop;
 	unsigned int dec_input_prop_size;
 	const u32 *dec_output_prop_avc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index a3eebcacba7b..392f9ed94ba8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -298,25 +298,6 @@ static const struct tz_cp_config tz_cp_config_sm8250[] = {
 	},
 };
 
-static const u32 sm8250_vdec_input_config_param_default[] = {
-	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
-	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
-};
-
-static const u32 sm8250_venc_input_config_param[] = {
-	HFI_PROPERTY_CONFIG_FRAME_RATE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-};
-
 static const u32 sm8250_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_SCRATCH_1,
@@ -369,13 +350,6 @@ const struct iris_platform_data sm8250_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
@@ -423,13 +397,6 @@ const struct iris_platform_data sc7280_data = {
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
 	.max_core_mbps = 4096 * 2176 / 256 * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index f8754451ac18..5b157697d478 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -794,71 +794,6 @@ static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	},
 };
 
-static const u32 sm8550_vdec_input_config_params_default[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_CODED_FRAMES,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PIC_ORDER_CNT_TYPE,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_input_config_param_hevc[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_TIER,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_input_config_param_vp9[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-};
-
-static const u32 sm8550_vdec_input_config_param_av1[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_TIER,
-	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
-	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_venc_input_config_params[] = {
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_RAW_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_output_config_params[] = {
-	HFI_PROP_OPB_ENABLE,
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-};
-
-static const u32 sm8550_venc_output_config_params[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_FRAME_RATE,
-};
-
 static const u32 sm8550_vdec_subscribe_input_properties[] = {
 	HFI_PROP_NO_OUTPUT,
 };
@@ -944,35 +879,6 @@ const struct iris_platform_data sm8550_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1047,35 +953,6 @@ const struct iris_platform_data sm8650_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1141,35 +1018,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1239,35 +1087,6 @@ const struct iris_platform_data qcs8300_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),

-- 
2.47.3


