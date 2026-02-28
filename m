Return-Path: <linux-media+bounces-53847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NjBHCQKo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:30:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEF1C3F4E
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44DC23107DD4
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E2747DF8A;
	Sat, 28 Feb 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YreRKWAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjPOntQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2475147DD42
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292407; cv=none; b=PKVg3jftNVQxl/3AC59CFEm0fuWZOx1NTsaaikjcArhhuJ2qV5VQ/RP5BdmmRVmfZw+zW/C5HS9z4AEAOwmf0fMJlFADAl0CePgqT2EmAeGBPXicyF3taPq2QaGmnU0aNcUKkbqwtuZSy5om9wGI8z7ZjXBSWbBY8WUrlti+XnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292407; c=relaxed/simple;
	bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDZguBncXKiN0aU1n8yZHl5n9x+ArExNUk2OWsFULyHRvFGRTwZCGLA91pn7S2rgGgnfnJ0W5Gc9hk5Z41dumlh7QqGoUUWguZxmXU0Yfx7elIcLFWiKCs2oSX8D79JPVgcRYZZqC/YwrcAaOJgO9oor919lOLi02ZLyuC4skMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YreRKWAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjPOntQW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPQFA1896750
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=; b=YreRKWAEFXs9Z994
	eGSkzU/nLBtT9f+TFiLVBEYv3MM+4YCyrYvSSLTfbdj/r9GN8we/QNvq8Munpauz
	Ndx5kq0P5XdfMFVxW4hbCskoZ1karBqQ/YBD97Sht23Kz3PlDh0bHSbCFgHRKuLC
	i5thMXcUdFljFqgMoWCEe7HYsRRSTlctni/gzbfc5s5xJzfMnhkTnOUzc1YBH34N
	DWDpb1ye3rUh4F7vZd7WxbTGW9ZS/O/Cy4mIg29kDqd1cOClOH318O3vBAUBuBl9
	xG0a8T54LliRJavUpqPK+oblNF09ZoLXu0dnKOVszoXuJlx/mPFwiof7YyTR/Z/c
	LiNOlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn41591-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1334937085a.2
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292403; x=1772897203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=gjPOntQWQVeBYJCeLMqt4p24fbsdEAI4yrama/9JecJwykTXTG5R5OlTZhfdHe3cvM
         Cs5faYLi6ofevubh1FInx0KcsYcXnkNaWJOg76RxbTRM80R1xuhL1FNQbCyGJFOIfzG6
         nwyEK9DyPJ6w8pU4SzpBLFP3FLFvT81liKdPWmGs8u2QOkv7UYCuuxU4gFhOg0f1s2cs
         R9MuQA8/4MUllIwAA6qISCBTU6jBJA5WtV8gclEI/99BjQb8WAOgZBWPbWneKsYTjNlB
         31vObvwH1InrzfuwekhRZYspaUluXkYVmYsm8aBB0nrOujze0k7/MMYK6/sNHNdxjFdy
         zidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292403; x=1772897203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=O6OH8wiKbpx4AAdWgnKGL+dXBsvvlfwVFo5WTgvqKosBlPzSD0brxnuGbf+CCkPyzs
         Lw/dZ0+5T69Hv5StpSsg1Z3xZ7U5QR8E6O32PhKG6QgARkE4fVm7NZV42MnRuTtR/wen
         pu3ERt9CUXCb8W+aAnqxvgS/aNoi06OI2ZHME2bJZo4sO8snFM79Fs/iSpzVUmE2RVgn
         Z4ZHAMUy4zofWcfA3rtMMVGXx+X670z5PpqwgO1pZCPnMen1SoSahueiZMmaD6KDMbsE
         IVPdF0pzRtELzQ0PkjMF71rigSlBwISypFlg9UvUrvkSku6J/5hUbIirQaU4WZ7C2kIB
         Yc/A==
X-Gm-Message-State: AOJu0YxVlV32+qVCwF6eNev/X3Go0Q+mAD7lxzVsoqcTFvRT1INkkxX/
	bqvq3N169QnmViKq48GdPdnabP3LqcWkKLKKSuKY285sX5ci2rO8qZXdOQOnXi6ceI9OUOzWuaS
	fw6uXkqTwH7JcgbWTEK4G9fDgQt7unJBOxmHGVmrkgIKbj9yvWd9M7PNLODwUsaMZww==
X-Gm-Gg: ATEYQzxK770oIjHHnHm36V9vsaV9ofjcqS5TVuK3J0gaTQuclSUHo22WAYXywvupO52
	Pdb+GathALYwn1zpuOQDTk9gISneKTEV3XCZNCwchskCuukFc7HHTaK/DNrZxYDMX3GNFj9RYyI
	bifVuesw2oUBb0wON62m4UD2W2LY4dQSqPrYwtBwe1v0Ny/blCDP/fG2YHyTUK6LgYAEwqhDmUz
	SRWpwKVMG3uCAxesOlOm6pL38X+UPpjcHZhReZ9981kPwudbJ+X4ZTy6xrQ027IYJon6ar97Nu5
	wwSUjAtQnL5SbMGu7H5jeFgWcDYWHwaW1Y43zzfcxTvio3PSEFe8wDl+TV2O6xriotFpaJ+F5Fe
	o7qvqVmfEMVTDsRsPc1MHGQkOb2KqIkdU/Sxnqy/Q7YB+fMwmzI0ednp5rhBETDqaqpHNrwxXrr
	CfPSBzeRna89FwzKCGQtpCh5Y76kOlfhLg3Ow=
X-Received: by 2002:a05:620a:1908:b0:8b2:eea5:3311 with SMTP id af79cd13be357-8cbc8d94aabmr779320885a.26.1772292403375;
        Sat, 28 Feb 2026 07:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:8b2:eea5:3311 with SMTP id af79cd13be357-8cbc8d94aabmr779318085a.26.1772292402916;
        Sat, 28 Feb 2026 07:26:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:36 +0200
Subject: [PATCH v2 09/11] media: qcom: iris: move get_instance to
 iris_hfi_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-9-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8958;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ZiTvV/xSqV5gEfG9Z+a8ixlc61+tweus9qwVclge5bK
 w0ZD+h1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiLELs/3PtHOXEuoWeBDgf
 z0jezvf2RrF3U8V2p+R1Hg9lrk0x0PiQHWptJf5seYO2mvHMRbONfd1fsmman4zYEDid80qpwIl
 Flomilq8+fb1qIr6TvdT/+aGckzZ/tvvM5mOfYXBKfNHNteKHjkwz339xeYaf4ZNHFyuLkndK6a
 96KzfdzjDT9pXj3TKVCIve3HSWOlexWXxTttg2tzYYBW63iOWoNHzQulFye+pzrsoux0qLI8tWC
 zw9fZX/OmOSQNjMSTNblh+Y8PFnynaf7aeunOZf4nw3X/XDbeXsLRV6OyNWb+LxDtjQbBVowKzR
 8OO7x8nA5U5HAjW4OibdlmrJLDST1xCJMG9+Psn7z+Z9AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a30934 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JtjfGryM6G2qrIbqdVaFQvaHBRSkL2vq
X-Proofpoint-GUID: JtjfGryM6G2qrIbqdVaFQvaHBRSkL2vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX3819/u7SbFon
 70VgInctvPO3EwmU7jUSIa2bPldeSC/X9U4yBlg3wOg/N39HT/4587LmamzWoCcOwDuma7cLqEb
 TwhLlZv8avtEgyyHgbe/nx+7TlGVvCyGUFHXqWd7qV6hWLuM9ozjRh8wPZUZnPTvFjjQUImLmGM
 E6Ml4MlcgBON/UgBGfiBerdYde60xFCcuPUrtLZXoxFDtqXdWpPFyDSqTmOLOm90wbHiioy5KH0
 1KLN7ULeewcZB1Q8x2tcWfqvsrhhXVUwTJEPl4y7QfTUUXSAKekZHaHwGJhxcGV+cJJSjVWifrs
 VZbW+kC557HyXsAsCeWbcT4NJ3INKKtNryQHT87YUUjdN0KAmAf3rNmF3tYFGRZ4y8/AmR3zP4x
 V5sngJUGMmB6NQtAErWnYwXqhk0CtJmSanORJSFc1X+T4LoP0R2z60KDcuOoTB2vvzWkzYTtPOV
 XZ98bP4bb5lFbmt/Q+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280142
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53847-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: DCFEF1C3F4E
X-Rspamd-Action: no action

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_ops structure, merging all
core callbacks into a single vtable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
 9 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 21bb35261073..de181d0be320 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*get_instance)(void);
 };
 
 struct iris_hfi_inst_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 1c970243532a..0479ba442b09 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7f0e5a75a301..253edf2f62bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1028,6 +1028,19 @@ static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
 	.session_close = iris_hfi_gen1_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen1_get_instance(void)
+{
+	struct iris_inst *out;
+
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->hfi_ops = &iris_hfi_gen1_inst_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_ops iris_hfi_gen1_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1035,22 +1048,11 @@ static const struct iris_hfi_ops iris_hfi_gen1_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen1_ops;
 }
-
-struct iris_inst *iris_hfi_gen1_get_instance(void)
-{
-	struct iris_inst *out;
-
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->hfi_ops = &iris_hfi_gen1_inst_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index b981a1ba6954..f1d293759bc6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 12d286be94a8..3676af51894c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1405,6 +1405,20 @@ static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
 	.session_close = iris_hfi_gen2_session_close,
 };
 
+static struct iris_inst *iris_hfi_gen2_get_instance(void)
+{
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc_obj(*out);
+	if (!out)
+		return NULL;
+
+	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_ops iris_hfi_gen2_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1412,23 +1426,11 @@ static const struct iris_hfi_ops iris_hfi_gen2_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_ops_init(struct iris_core *core)
 {
 	core->hfi_ops = &iris_hfi_gen2_ops;
 }
-
-struct iris_inst *iris_hfi_gen2_get_instance(void)
-{
-	struct iris_inst_hfi_gen2 *out;
-
-	/* The allocation is intentionally larger than struct iris_inst. */
-	out = kzalloc_obj(*out);
-	if (!out)
-		return NULL;
-
-	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8e330ce5e726..a936ab2aedaf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	void (*set_preset_registers)(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 1906e480e2ec..622164ca9c65 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -314,7 +314,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -360,7 +359,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 09dcf01047c5..7745a3481f6c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -819,7 +819,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -875,7 +874,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -926,7 +924,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -979,7 +976,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index eddf2694e759..d4608ae756fc 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_ops->get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


