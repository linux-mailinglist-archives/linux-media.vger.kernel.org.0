Return-Path: <linux-media+bounces-63012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKaGLB9DGWqNuAgAu9opvQ
	(envelope-from <linux-media+bounces-63012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:41:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2B5FEAF8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89EDE3087966
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAE33AFCF9;
	Fri, 29 May 2026 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0ZOZFzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Svrt4n1b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB17D3AFCED
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040127; cv=none; b=l4x+niw87mSpJLmIyrU9hltWQ3uPfdBo1VLd5aEMDlBVsLKzK5POJoit3ROTiJiaDTjU4A4qeqvjuF4Jy4MKNB/1XPqyQcVoeBY0vNayCMfoQps54GxB2nqYFd9EqyYCF4n9GzoeYhNa2xdA9/RdA+L3VM09piN5MVUrtz+2Eyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040127; c=relaxed/simple;
	bh=Z3jmT+5DfDbtefTsEq0HcQ8NM+0bjrB7Z2SRBSLkDvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kahYPIsbbFzJBu1VY37yJthvb9f3lgfRDCDqBLbXAv58loTT8wFp/TJD5k15J7F8hZLgwVfPdR7f6YDENnnLWlyctvVlsICZpmE+f2620jsnjwqaVr/imXucn4ss3EzJ1dveWMmZjHjIhhpyBRdaNQ8eUj14X/kAY/MDT0X2NMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0ZOZFzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Svrt4n1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6MDdP1931874
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wcziErf74PUqYWqIL74Ij1ldf0hZwn7bK+Cy9LC+LdE=; b=j0ZOZFzX05dkexu3
	t0lyqqpUkwzD6cIGYN5BZ4y+V3+rh6ZRaNTwe7DQZkSLDRXcfxbPcKscwuKO70db
	RNvdvnjvWaw2k7Dn2S7ytJtKat7AQ5FHLAfzd2lOiuVuSYj8hmaNn9MRBWW8fwJ2
	muRGqPFLKtuqhBjTnP8FrGj/qT/3TIzAbEjxT9rSWSTEWgOiCt6kXu569Q8KeaUV
	Ixxu4rGFVvU8vcqi3ZbDEFKYmyNZVp1ezVU+r81+Ux9g72ABfVsN4ZYtFvnCdPrd
	BHKLt4IbSFewnS7s6BtKIAD/t0S/MjZKWm1+xz2OqLUYhciVMAHDZq83Jkdmho1n
	rE480Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxab91a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso106261605ad.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040124; x=1780644924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcziErf74PUqYWqIL74Ij1ldf0hZwn7bK+Cy9LC+LdE=;
        b=Svrt4n1b54sfCBbFXRMFghkMvw17k+yzxHs1nHYvIeWm07f22grVBWfbfhuIX7vvo1
         1K82TefthR/BHUBF6T9cvLRYYRfx7LLFGXP/yOSUzwjH4mjb78fcZT+2uphyEErO+VCB
         Vid7CVcyKJwm2mBj3AVNvxf2f1Sep4HFnqvcgtpQGTYljg/F/uhJA4k25fHElUhY+mI/
         6PSfNiHGChhJPcSF0iGQRFhqT63LloR1q4t8FrDO2tAeQIeyitrvs3CPOm+VWZXb9ljd
         ra4ir0SAgvwFkHKS8NDCmGecSmp8o+LwhaHaNd1JOl0er4gu451v878+JioVXmbHwQBu
         ksBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040124; x=1780644924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcziErf74PUqYWqIL74Ij1ldf0hZwn7bK+Cy9LC+LdE=;
        b=GgvXFAYmU4bMoyuLGh14hsJWXxTHW9RGMp1N5upm4kIHrgLFXWzXFQmjfVlb2nQSzQ
         Jv7X7O9laSZ880qF0+eFW39Z4SjTIdQGBJHOaisMXOgBUt21b4Mo3AgfgXtfltiBy7cz
         7lIH79kKw/+I1aiKcwaWPpdvwf49Pbo+9ROYmRRvcTOweQwcTAkb1X+d49sCoNKT/Ezm
         i6hnsW6ydbecLTl3J1TquYFl4k8GZWzExDE43NkZHwj/LCjkIyyPeWNxc5NFlaPWFWZH
         YO8c0nxZhsMfezzg2zvc3PZ2wJD4FDb6bLNczFclJ0HZZifIV3bmm7AV+djOoKZqFN1/
         00qQ==
X-Gm-Message-State: AOJu0YwTmvYlwN5/qsUhvhIpqYMf1Q9jJjhYZtxUQRbhnc6D9yrlt9wR
	wgf5XmSYAm6BelfEFlJIlfk2m3rG7N9o83HXmsiqnCcAbD0DqM44npx+dO2U6N7ie2/JKlSiJ1R
	H6hsY5pLmfyfugbDrTUcldJeypmS8xYIqZVSCjbV4XquJry0dUKsrjlEik7QZLQk0D+snbEKH0Y
	5t
X-Gm-Gg: Acq92OF+RCHswnpP8sYDQ1bGw6HmWiAY/odS4857i2uEw3Pwn2xMyWnPJ/V1c0vjMJd
	/UW/UqdsU8pChF646tBuaZNdHnTYpjH+4Ufdx3C3GjBeE0p2Mq8FGLquP00od4JIoK7Vkauyh25
	ckPzbTkcAjdOgtRiqsVuJ4lZ7chbJQRT34zziaE5ktWeqI8uQrUrGZ2kZo1oenvPAWs0RP4MKA9
	4QuVIA+4SBLDAR0crrtNFFh1WgIbHHd8K7LTNRwfdpWdXkVRExZt1AeXzXgYwbaYpZ9Ni9CB/pI
	wvdHRsocY4ax38lY1banLe8/o+Psn6o8kVb+6PUsBLuQshIMZgbkV8t0Z8H3h0W7C+EoqsGTn8b
	7l78htw0voKM3p9nNKzz/WAgDd/St6FHqGQMc25huWZae0g9yaj4PHfBJIJRUEU52PIKcG7Vczb
	AH8EUb82jo1ze9nna4zrUca6W1Kgc4Q5Q=
X-Received: by 2002:a17:903:181:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf2050afd4mr23605575ad.2.1780040123494;
        Fri, 29 May 2026 00:35:23 -0700 (PDT)
X-Received: by 2002:a17:903:181:b0:2bd:c925:3a16 with SMTP id d9443c01a7336-2bf2050afd4mr23605195ad.2.1780040123013;
        Fri, 29 May 2026 00:35:23 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:22 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:35:00 +0800
Subject: [PATCH v8 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-3-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=5454;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Z3jmT+5DfDbtefTsEq0HcQ8NM+0bjrB7Z2SRBSLkDvY=;
 b=WBmYDUleRCNVON0Lzq3Wa/HptYM0NmtZqWa1+BdqRgzobRlJNpP3j4BlydXObsES16IkCaXXs
 WsboxyfP05XCBflxpE/3Mo0cNk9buK8nV8wdtOh3OsHXr/ebemJC39G
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: H-y7VUwShgUTcW7THgp2nG-aKJPdHCr0
X-Proofpoint-ORIG-GUID: H-y7VUwShgUTcW7THgp2nG-aKJPdHCr0
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a1941bd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7846H_0ANTkhO8RSUocA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfXzEzy6O/0SEOb
 qgygpxcWyu8BTIRfE6+hSi1qkHtvCSCmjOSN79e3eQ9x6N0/XLQmhpOyAT3ON8QDb95XLqXsyER
 sWEL45gNhuTZ0cPSvEyOClY/nlQe9/ILMAZl07WIRUO7pVTx24mvYFi6kAqZnxCm/VeHVJP0y9E
 SX6zP3xyFyOEkts2ABaK+n8pXK0zqmUzNc/J6jXuOTlB2co2ZgfDiXo/n39AyH5nHo6XItd3lFe
 J6wCAH+PDjMAXhgawpYFQU2YYB5qVTZIdInUmraLBv9AyTP9fNy6pivQAFg6JvTnmy6LfphRlO+
 wzqbPHJl5EQW2p+Fx1DxZYSZXZn8PRJPzUaKsKZvUupFS+sXuZjcJ4O9AuJb632dv+DjASTa522
 pItPlnNOvgZ7qo5ZZ7+sAaZL1xvSEQ7ahmCfphIgxnu2uilGZpIKPnkTXazVzOQrwKrD6A6x3Cm
 xTk6AdA7H1XDgy9Ft+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-63012-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80A2B5FEAF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 42 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
 4 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 972fd4dd021cda6359cc84c444e2a77f41ab7ddb..8201c4723ed16c6440eb95c6ea623ae9af4e3cc5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -59,6 +59,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c249ff8275414a355339ec8edb6856f292b5cff2..541ddc40e3aeef349f1ae68e216d398b3b4fba78 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -16,6 +16,7 @@
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
@@ -29,6 +30,12 @@ static const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu30_p1_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p1_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -217,3 +224,38 @@ const struct iris_platform_data sm8750_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - clk_tbl and opp_clk_tbl for x1p42100
+ * - different firmware
+ * - different num_vpp_pipe
+ */
+const struct iris_platform_data x1p42100_data = {
+	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index d36f0c0e785b7de0e3527e0a824942db0fb79133..9f8113ec7a508a5a26cf275408165d34684d3e0b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -385,6 +385,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0


