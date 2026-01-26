Return-Path: <linux-media+bounces-51565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJKaDuded2n8eQEAu9opvQ
	(envelope-from <linux-media+bounces-51565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:32:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE3E88482
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E46F83036D47
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382CA336EC0;
	Mon, 26 Jan 2026 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQnQxhTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbSFW4VS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE85335BBB
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430421; cv=none; b=ZfpbWzjcscHh92f6t1NsYtXMIe7vF+pE7Ckp99EBXc3GpMWqUxdp44EL0g+0P4/4DeoYzf+1gk18eiE6oBnJuvqDihD9ZFcVPJbZ8BnOX3jPcMbKRh+uI7VQQvdxITqRqZVq9d0EUQ89gzPB10RbY5tAtLLhkKnBFz7Ndb3uwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430421; c=relaxed/simple;
	bh=vtFI6mihbvZCNBhpCUC4IoqyoPFGBZHbA1j3YMa1ttA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPyb32as7NY+sARvwpXRlnAlN1qYXIlAqmrqZedUM2+45f2tDOh6VcgYe3hB8nOLIG07IsS7lPng6IXu5c2kzvGgZFgQsETqVRDcNhQjN6x/xd0AwhrVTgFrWcQjNI6k0BBTlWy3wStHQb9cCWd0wtvKOGm8Vs2cNBYrAIx0DoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQnQxhTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbSFW4VS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9JL2h808500
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hdWpNZWn4nQsY52qlMev2apCckLHnrTywvI+NelvIQ=; b=TQnQxhTXNH+sN09R
	13TH5S9m0X3HT3wDKKbS3F+rWe5TiDQsfu2oijSBruWANjWUF664zhFrmSyTUEb6
	jj6+aUU9pM/Keequsue4sU9jcYNHhTjWi34rNmpHGjC+g53t9H2x54yKaSilcNe4
	5cwAfYHwf8QtgNDl+NPQcfFoJgLkjZ8P74k8VbMLOkWHxqpXEfbA32/2nzy+E5m5
	ToGuowWCb+2UH+ZQ0yXN4MRpr1NwoLx41k31zZciCUfZWL4Ge5+WU0OpGTZWwCdF
	aC7tUi2GhMZ0xIeKk99s5DkwgMTyou1XPvti7T2bSZWf3ygPqeWrL1rMHIdKELzN
	5JIiUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f4f5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so2800263a12.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430419; x=1770035219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hdWpNZWn4nQsY52qlMev2apCckLHnrTywvI+NelvIQ=;
        b=SbSFW4VSxCxJ5kKXLPJ2s+J7rWrBa1wNkARvYd5LYBGs/EYDYRSIqUKT6BlXeevKk9
         V6eVlHAjKPr8g18UUaH/82+9DhauwVWj2WJIon14TyYj8GTY6Rj/Is0SlkVV4mMCgGwM
         /yk955CVVlYfllUtsWeoCvyJfejlCOg/8NY6DDqwW5qOwqoER2SOibNP5KnqX8THBtF6
         cF01FPQalNLnDsdJc3KyMzPAQlq29bvjZTKJEGXYQSsXKbaeU+lgf3+OSrvlJElfFJlV
         u3sEmDOH0UcgMT5Fy/DgUIYM46t5p7GBDZjVTZ1nX1NQLBYpe9IMtGrGofTC8eAGnAhy
         TCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430419; x=1770035219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4hdWpNZWn4nQsY52qlMev2apCckLHnrTywvI+NelvIQ=;
        b=A8R0LgpOJwlG0Qk9Xuuku413BDUXfA+YSdUvzBkMfCEdU+3WKZTEkUdP578TnZpCXh
         w0wVAZhKzC5KcVGFD9ludxKwjDs6ZKtMEdYlL4YpbMynkX3saxY+gadYy6QK43HOUQAC
         0Rthmfjbfeo9Brrt3CJqNCCHpP+Xz67WRbW3VP6C8O9LZh4lQB/O1D3UU69xtgP4JHqn
         cRq6G7whR1lkvFJmdUHzwlhe3K+ETofJ5/1A7BwcBlTQXhaQhjJei9+3INIWL0rvfjIQ
         TOEDQAHPna9AmjnkiIftXgIXxeaGIAcOA7OPGtkBAhtwn3JDCPEw4exszT+T4sjaTUYa
         DizA==
X-Forwarded-Encrypted: i=1; AJvYcCU649HUZedap8ohd19uqjaXjC5p6O8ofsIY/uSGZcn+qizD2WtwE5j7JDWgoDG2Fv1KIIzqNGGEQjhF7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxPg0mNOpij7i31OrwaaGgdUpHtzqX1ayMYe3vn91Gz11t93F
	F5NUU98IB9r4n2ySaxe1W/ml7hPUhv4wxgUesFcxFuykhC9IHaR0DneKceeFIvAHa4GsK6F3hXD
	1eSdhh1UOzBGg8t4+LBER73IxDbSnq+WQS2MdPZNQUSuHlCq1v0V7vnQM89eL7nCZIQ==
X-Gm-Gg: AZuq6aILMf/Y5RH1qnN9aEpkSIL9ZNKA0h+kZVTaEQeEayxxMDv15Al3FUoaHs/qIMO
	JzyXeg+AcNgwX24nAHFuJN+1J8vCauhgDxwSdFN4p6fAOYSHW5PZvpkhehqOI/cXpJhQNV/g1eb
	R7nNBPlrcVoL/jw4ecukqXGh9Uk2GLG3LwKPaCraWd3fnnmXJ6+I98Khyy5Iy0ud3fARr3lowQK
	3Er/EIEDdtIiTu7R7T28DvZH7b7ujUH8ysnwEAICuMTwT8FeLkIFWeTfU4KYTUgiZHJHg0TqSAx
	EYH8FAhPdB2avD4DeJiLuKuYvMnnvEWxC40mKsn7N5wxhzEVicUnDfNYDnTCi4AdQNwdeFPUny0
	DY5kiql9GnTrNRDsROlimcICiiYpF1jY6gKPnGj9ms4XL
X-Received: by 2002:a05:6a21:6009:b0:366:14b0:4b0b with SMTP id adf61e73a8af0-38e9f22b832mr3912147637.71.1769430418638;
        Mon, 26 Jan 2026 04:26:58 -0800 (PST)
X-Received: by 2002:a05:6a21:6009:b0:366:14b0:4b0b with SMTP id adf61e73a8af0-38e9f22b832mr3912121637.71.1769430418165;
        Mon, 26 Jan 2026 04:26:58 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:26:57 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 17:55:48 +0530
Subject: [PATCH 5/7] media: iris: add context bank devices using iommu-map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=7379;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=vtFI6mihbvZCNBhpCUC4IoqyoPFGBZHbA1j3YMa1ttA=;
 b=3x2QxH2A5ItlGt1C/LKX5pg5hXXM617Hf4dTm2ITEHRf1AOwR/t0blMoLsCOT+TF3yLA0F1kY
 knM0InaGYGlAk97PqVgBsi0KbIStbOx0kDuiVyZnES783trGHhCSPWF
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69775d93 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vM_uiRQ4VLTwqj5zvH8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: V-c6Pk2337W05exET4YnUeR36Dr8yGBS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX5/FmLkeM0swk
 B5GVkLOY3pDEcEW6SGyC/DAip2Cu2WEIm7DIOHVzOIadOJ2LHYOgXJ283dDhiCp0OzWN0fndSsF
 RYkHhBZfVIGTOWOGCqwjC+l4bKLE7wEtp2NVIe51J36wdSf2sSTaaWRjZQ6AC4ooHC6p+A7IXom
 0x/MR4+yPWP78IqR9u4H6xRivB4XVLNBM4I5h9eNvI2HkpJToFtf3BUOcUprg1huRmkPvKIpu0n
 z/QEKPt2hzhqkFwWy2S2r+3f0I2VgU4B3LABLDvf6hkLRk2T+emhfS9oppxFhA19bgzHS46wJpU
 Sdy/fjtRxRvaEX+bWYL/RZi4AdPvGJvJRTrQobeNQ5u11jDigsd7IxLBAogaubbJLEO7uL/ZDgY
 Ukw2Ayt8jNUqr2VHaYs37qteeY5ldWkPYrcqkbXdY0bFkAZbra7xYjnln45B5AK2Bsp6rlQESQj
 O9MYGoNCYFV3TMSQAEQ==
X-Proofpoint-ORIG-GUID: V-c6Pk2337W05exET4YnUeR36Dr8yGBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51565-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ABE3E88482
X-Rspamd-Action: no action

Introduce different context banks(CB) and the associated buffer region.
Different stream IDs from VPU would be associated to one of these CB.
The patch ensures to handle CBs which are described as iommu-map in DT.
Multiple CBs are needed to increase the IOVA for the video usecases like
higher concurrent sessions.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      | 29 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      | 55 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  | 35 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
 4 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..d2d7c898fc8ef0de1b16aebd72681ea3c5b736ae 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -204,6 +204,33 @@ struct icc_vote_data {
 	u32 fps;
 };
 
+enum iris_iommu_map_function_id {
+	IRIS_CB_NON_SECURE_NON_PIXEL	= 0x100,
+	IRIS_CB_NON_SECURE_PIXEL	= 0x101,
+	IRIS_CB_NON_SECURE_BITSTREAM	= 0x102,
+	IRIS_CB_SECURE_NON_PIXEL	= 0x200,
+	IRIS_CB_SECURE_PIXEL		= 0x201,
+	IRIS_CB_SECURE_BITSTREAM	= 0x202,
+	IRIS_CB_FIRMWARE		= 0x300,
+};
+
+enum iris_buffer_region {
+	IRIS_NON_SECURE_NON_PIXEL	= BIT(0),
+	IRIS_NON_SECURE_PIXEL		= BIT(1),
+	IRIS_NON_SECURE_BITSTREAM	= BIT(2),
+	IRIS_SECURE_NON_PIXEL		= BIT(3),
+	IRIS_SECURE_PIXEL		= BIT(4),
+	IRIS_SECURE_BITSTREAM		= BIT(5),
+};
+
+struct iris_context_bank {
+	struct device *dev;
+	const char *name;
+	const enum iris_iommu_map_function_id f_id;
+	const enum iris_buffer_region region;
+	const u64 dma_mask;
+};
+
 enum platform_pm_domain_type {
 	IRIS_CTRL_POWER_DOMAIN,
 	IRIS_HW_POWER_DOMAIN,
@@ -246,6 +273,8 @@ struct iris_platform_data {
 	u32 inst_fw_caps_enc_size;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
+	struct iris_context_bank *cb_data;
+	u32 cb_data_size;
 	u32 core_arch;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..c1a6aac5a3d65d980c5a34ba5fa1c1dbcf790ec5 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -123,6 +123,37 @@ static int iris_init_resets(struct iris_core *core)
 				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
+static int iris_init_context_bank_devices(struct iris_core *core)
+{
+	struct iris_context_bank *cb;
+	const __be32 *map_data;
+	int tupple_size = 5;
+	int i, j, ret, len;
+	u32 fid;
+
+	map_data = of_get_property(core->dev->of_node, "iommu-map", &len);
+	if (!map_data)
+		return 0;
+
+	len /= sizeof(__be32);
+
+	for (i = 0; i < len; i += tupple_size) {
+		fid = be32_to_cpu(map_data[i]);
+
+		for (j = 0; j < core->iris_platform_data->cb_data_size; j++) {
+			cb = &core->iris_platform_data->cb_data[j];
+
+			if (fid == cb->f_id && !cb->dev) {
+				ret = iris_create_child_device_and_map(core, cb);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int iris_init_resources(struct iris_core *core)
 {
 	int ret;
@@ -139,7 +170,11 @@ static int iris_init_resources(struct iris_core *core)
 	if (ret)
 		return ret;
 
-	return iris_init_resets(core);
+	ret = iris_init_resets(core);
+	if (ret)
+		return ret;
+
+	return iris_init_context_bank_devices(core);
 }
 
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
@@ -187,6 +222,8 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
+	struct device *dev;
+	int i;
 
 	core = platform_get_drvdata(pdev);
 	if (!core)
@@ -194,6 +231,14 @@ static void iris_remove(struct platform_device *pdev)
 
 	iris_core_deinit(core);
 
+	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
+		dev = core->iris_platform_data->cb_data[i].dev;
+		if (dev) {
+			platform_device_unregister(to_platform_device(dev));
+			core->iris_platform_data->cb_data[i].dev = NULL;
+		}
+	}
+
 	video_unregister_device(core->vdev_dec);
 	video_unregister_device(core->vdev_enc);
 
@@ -277,9 +322,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(core->dev)) {
+		ret = dma_set_mask_and_coherent(core->dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a257b8ae7332242544266cbbd61a9..647f6760f2b7a6bab8a585a13eb03cf60a9c047e 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/devfreq.h>
 #include <linux/interconnect.h>
+#include <linux/of_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -141,3 +142,37 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(cb->name, 0);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		platform_device_put(pdev);
+		return ret;
+	}
+
+	ret = of_dma_configure_id(&pdev->dev, core->dev->of_node, true,
+				  (const u32 *)&cb->f_id);
+	if (ret)
+		goto error_unregister;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, cb->dma_mask);
+	if (ret)
+		goto error_unregister;
+
+	cb->dev = &pdev->dev;
+
+	return 0;
+
+error_unregister:
+	platform_device_unregister(to_platform_device(&pdev->dev));
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+int iris_create_child_device_and_map(struct iris_core *core, struct iris_context_bank *cb);
 
 #endif

-- 
2.34.1


