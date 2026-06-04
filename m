Return-Path: <linux-media+bounces-63759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcD2JKkzIWrrAgEAu9opvQ
	(envelope-from <linux-media+bounces-63759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:13:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9263DE75
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 10:13:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gn/DOa6l";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PAjTKh5x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63759-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63759-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 370E330557EC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 08:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8F13803D2;
	Thu,  4 Jun 2026 08:00:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82F35DA64
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 08:00:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560051; cv=none; b=KCfdcxb6rCssp1N2y7xet8SN1NfA/beY2b3fuKl22898pemxKg2gM+AhYi92AsgK/DyDdSNxIROkm8zSENgNMK2B8TNM34ZTFmJ7yfdpuwhxag+4rw8W/RdG26JJMS17Zbd3TWzxCsg9kBaEtT3ZVbFzLV0sSfkdeJI4Gv7fifY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560051; c=relaxed/simple;
	bh=SzeLABb6avPmxnwdiZxjcIQRHpyuZ3zU/em6a5dKzkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTuRg9w1YP+XJu4qLiYbI8KWMzcAPcBRa73A4sUb6cD6qgWV8JIs2uEYUhC9TDaBX3ncHKzwCt1ambu0J3ImS5j8OdfRTPYFRLq9H3wLNvbD4/Vx+XrUNGY8BN0t6b11w9/1kmybxcRcJed2RJW4UpgJAGy0BIoY3I+TlYyO/AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gn/DOa6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAjTKh5x; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546uuTd2477944
	for <linux-media@vger.kernel.org>; Thu, 4 Jun 2026 08:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=; b=gn/DOa6ltO/0E2Er
	8QPItmJprmlL7iwKzhkZxvTbxpQVLduGK6YCb20OMAoUGolKnqg4t6reuTUSbaij
	MeIetPTdCrghA1IWFAL06YkVE689J+criCEc6j9YyrJB9QHbGkFMbg1kkDJfU90V
	Ou7N07qMnRiJvvjuoZudOTk1jCQWKtg4baypm0Je3u2vqQVMdhUlic6HcATr+WPi
	t7eNip+lT55jlmgSpPLbQhjj19xciRe7IxFX2ypK0qMU9L9MP131JuCDkOBHgcLI
	EzLaU8MMWFn/tdrKCUNnb6H38gC5ZIY6t2PJs7vAfYhezjH0Za3qe+J3KKgwy1y1
	w/8fJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvg7n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 08:00:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so4041955ad.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560049; x=1781164849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=;
        b=PAjTKh5xBGeZ6RyeaYcKdg/FfpVjeBn/5k7POR18H/6M0pGQFcY1kf3r4rZlh6db9+
         gXIKhBk/RRBNwJnXzO3qxtTZLfYwJCmeAezzKUrelRg8Q299QWoE5KGiIE64lZrGze8P
         5hZCf+7krriOowIB0aBmEnLWGQWk7Hkzn7wtMhGXCBUwAfLf0ov/47hUHLv0P236jk7Y
         fCPPa2wWyhP6oC9EpPNaeC85M0BnG/sB3fkyP63rEQm0ezQ7uAs8pRL5OY9lzljxFORi
         iPAqZEp//B4iszmjxK7HQ2Ou0GORiOu/Pa1uKbzcRrcDzbnIMSJzmQmbL9aZWiIG1zNR
         XAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560049; x=1781164849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Xh6Cs1cbSS5zgpf/oVDf69c5gWGNxYKQYvaWj0LNpE=;
        b=aczNipbJTbPjOOmvnR6/icNUnlfxpHAev8O0PyxbpDsgik42FeLsBBL6Ta6g+juoKF
         2UMBHa8jxTMitfSEUoya5OAbH/6Cvc6A+tJjalLwUtfx5JvVafxCAZ/Y+c44scJ8Nykh
         vXmlkxWNU7JFOGV57Rpjj/rDd3m9bbpa88Kp2iR03KbYLykg4EbYzR5frAY8j1Gt9HT1
         Yf9+2ylk3FYDGv4vsX24Z8BBAmItHPyaxOXTMs5MblaZXi4Xiysw0MUDW62VNaihlRu9
         rWRVneRwZmUFKw0dorK4H7BFKB8M6l5T7JKWIzWAcZOAbYMzO2SZ9nZe4lW1u5a11vui
         xw6w==
X-Forwarded-Encrypted: i=1; AFNElJ96ate4mVPtFti0QUsfJLYNCKKmKQbanTSQhKloTrMiAxI/DFfwi4H1IYjdWUoR5fYO44iYu+VReEtOeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNxs0PzxTM9eGNCi5FhUFinPGX/X3gxlh+Pr877DOYhU5B7aD1
	KiOmqtLIU5syfQm1KqF+Ot2aMuSjrxlzD8ntGNLcgs7RMf+KL6BLSwUzAVdhjgCjjcUDgn2pyKd
	N/kVwg+oNldxquSQqS74V1Wg7LpdmAZCH/CmxjgS2KonKXUCY2KM8KNpdi/VIYBDqhw==
X-Gm-Gg: Acq92OG6IrsbaxIWR2MMp4eCAw9JgvkLFp6MGQZ61isfnPLBYGoBa+D1NF4e+s0vUmq
	WCMrqVWN6ETsiLrAskDwthw4jOlSUHA+XEp4X1xrI08QzZfvJLBk2amY2mbuP+E32PXIRHL8/cj
	856Cr7IB/R4FCYSmZH3FYxkO0no7ljx3UnMjO5e1A3nAeCC9Dsl3wsk/jAA3LpHn9ny1z69hPDL
	RtEC+YuEfKoSo+M23J4GyXLdMmOLLdJsuu90oWysaSkV6Ya1p+p9/9rBW10Owm6RLk0VxeHGcLu
	aqX9t06Tqd0cSySXkJ5TUFl3s6ube4B9il4D7AQ0EHGqKB+pkigX7P59D0bk8JfYWOnlZ45nrd2
	se0f6ydcfSOR54EopSU+liFC5zOUc0ayLTvRjwKHVLfbh46IOqrtAq8W9xFfbfL/S1mfNSuNOPY
	TH5kN+MN+Qyj+UVI4NwH/0lSa68dm/YWI=
X-Received: by 2002:a17:903:2350:b0:2c0:cd80:47c5 with SMTP id d9443c01a7336-2c1644cd26amr73082755ad.27.1780560048975;
        Thu, 04 Jun 2026 01:00:48 -0700 (PDT)
X-Received: by 2002:a17:903:2350:b0:2c0:cd80:47c5 with SMTP id d9443c01a7336-2c1644cd26amr73082245ad.27.1780560048423;
        Thu, 04 Jun 2026 01:00:48 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm49374565ad.3.2026.06.04.01.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:00:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 16:00:38 +0800
Subject: [PATCH v2 1/2] media: qcom: iris: Add gop size support for gen1
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dynamic_encode-v2-1-6e97df032482@oss.qualcomm.com>
References: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
In-Reply-To: <20260604-dynamic_encode-v2-0-6e97df032482@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560041; l=3190;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=SzeLABb6avPmxnwdiZxjcIQRHpyuZ3zU/em6a5dKzkY=;
 b=6IgiRku9dwXBEvsplda5wv++/ZeONbbq3jzp+GbUTFS80OI80vuTGPQnB1NP6dAYabQXD4f2q
 CDQBDFpERR2DJ5FYxJpcMgJpxNWmbSgtIIUHhv6oG0n0z/8yHF1fek5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: dWrRoDB5QZTTNH_dllR2SvjqXEwzgn7C
X-Proofpoint-ORIG-GUID: dWrRoDB5QZTTNH_dllR2SvjqXEwzgn7C
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a2130b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pGpWkYCgaWylbXxf8R4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NiBTYWx0ZWRfX+3zfviq716t0
 csQFB/Kt+bkvu3VEE0zxvFNOYB1Df68ifxqMLnUosZo1RFBSy0s/qQRQmLeXwlpSACvxOGHkHYL
 4EsWXdaVGFSpwur/tTPXfXV7wXHNsZQnwo2Xizj5oRPL8Azv+SjIXVgYWoKImVInFO1zPSm6pr0
 S3AFdG3DbJTz3oE2ZAKrXtKE20RuT28AAie2IgQYqTArDs3/pHB9MPaZqKviYYEDd8955QUNklW
 8fFRUi0RUkHCdI7RKHTwWz0um25v7VItgtPLk1ZJeTC4EHA9YJQOWpO9cnk3g236vRYydRB8zIT
 6gAEF5D9aL110HgK5kLGvZeFuAS1LKdkGQ6FlGL6OFkSwL0IMGI5BIEocvDuT1I4x8r5ttwOjZ+
 gnVS1hGaGMvI/2tQv4C0X6/tjeBVzv8pFWzDOkrUUZygtPtguhw/eqkxZXSKx6Pw3I1qc7nO4wb
 vETfWfB+1IzTIB/PSog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63759-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:quic_qiweil@quicinc.com,m:renjiang.han@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5C9263DE75

Add support for gop size configuration on gen1 encoder by enabling

V4L2_CID_MPEG_VIDEO_GOP_SIZE.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c        | 16 ++++------------
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 3 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f60759c4f1cb17b5c95897f0e1468f..391e1fc5f6e2ec8e9cf5ba4e0f76b2d1da3e2a35 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index ca1545d28b5310d8c45a905287dcb69f6184d9cc..eff9216bb50143c0d752051a6400605bbaf3803e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -171,7 +171,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -240,7 +242,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.step_or_mask = 1,
 		.value = 0,
 		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
-		.flags = CAP_FLAG_OUTPUT_PORT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen1,
 	},
 	{
@@ -281,16 +283,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..ff48333ad089894c3393e8ad45903c2603288eb9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -165,7 +165,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,

-- 
2.43.0


