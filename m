Return-Path: <linux-media+bounces-67217-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iwhwGOdbUGppxQIAu9opvQ
	(envelope-from <linux-media+bounces-67217-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:41:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B389F736BAB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 04:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="lxR/G2iG";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gbsfkgCO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67217-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67217-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E718304020D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 02:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165C1316192;
	Fri, 10 Jul 2026 02:40:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116843115B8
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651208; cv=none; b=jUhiIwY9PHk5k/y2SjH7/0td5KrSrZlLjFWwTf5qdySGTMKOJGjy6osmJjzLTpyq2EHZnQXJcGoKJmBWte+oaHnaUI28/zA879t0HVioC4cVoqhyYz3nJjmH6GoxwVBSpHtuM2I4jeKca0fJuF+GSB6x8NLV27RT+MtaZUsYLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651208; c=relaxed/simple;
	bh=9NnIK1j54yTLTupsl99W5HgAeYajL/RJxQ1MtDF7790=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b21c0fLdKG777Wu2zczGinfYGNBsTiN7EzktRcsMXTBawzsWjVyT+xSh0a/Y66pi7ZHrX4Aw50/pGe91uYGRygWbFsjmjcpnU06jDfii+XeuBOyvXAskyxIa5XIWuEmj+ZssSG+XJnvr4IQmXlEzlTjp5hRF5n5lnqK5z283uUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxR/G2iG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbsfkgCO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXEmG2420608
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=; b=lxR/G2iGGfHECJrJ
	zSmuDcSfBAX1+6sFowyUDIceLlPq4jTfyyjszf8yWE8FOPDfL+eYEClQT3jsYDEZ
	Qj8KNbi8cvNcycf2uWz/9cR9ratI5Cq+AwSljiuFg+QKkrC2TXkZERRAWwlfp99j
	GWYffbcm1zMC4U9QSdtEs9arp0iahU9hcjiAFREUmdq0DZv3HIstt77Am6RnkJrt
	tu8tGyoFqlpn4/Nqdm7ZZmQdl01IF5/gHE6Dj8uNKZz3LhumMzg32JQNrOnBlXGd
	X2jAa3ps6NNDjOTaF11jcMUDmD4CSxDOg0SLAJdU4RtUKBWEPDrq89/TYWYxWO0E
	rabQ5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjahu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:40:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3881937456bso862374a91.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651205; x=1784256005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=;
        b=gbsfkgCOMTZokTcySPzwkwvJjUcuVg/12Mv6Kk8oQA0E1/bFMOvHMmuB458S2fqGBh
         +8cGT4/eAKeLaZpvTzFqSq2BomYCsbRa/vZR9bnVESBU3pDSbJdhuRuELHMTuNO2zR+S
         KDBEkp+TbHK/AM0WehjHy9BsER60kacIQrTF599cr8tbrRwjIOXwNn7E10GOr2Fsnvlh
         6T8Ngff/cGBzk4x53kGX3C0/UgkrHZyv9ytQvP68KA0INO0z4S8hETBfkTPrreXGzF9u
         /iLDuoSVNboJL8iRJbi+etKqMPpuAvflJDRi947J4CZoCbi/VyAet2bhCIINwnkQ+H3y
         kMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651205; x=1784256005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXAJyfvDbijcYUVgmSdwnLruPWsN/fjlA2uvO1ul18M=;
        b=GlV2OVGte7MU0IaxkksTaSgFrMuBqETRNt5R4xMzAxzABun+nZE2ZnXaIDPoTh46ll
         UiZAYI16PZZW+PrvsHM73xZZjYGkpUkQCg1JgBS/Qj5VmL0EbuPmVzODs8B1OZiqnx/c
         4ySraeZw4fJSklGB9UqRFQwjljSQJVbeC7R5Kenp9fW+ptd++qfb34KofVQkLfsxNaGl
         Ahnx5ijaZQVQFDQNnIcjMs/7Q/d82MQauOTI6wb5cWSEwDqlcg6YblvOA0++/vDjVheP
         ly6VX1Iy0TX9nYzLGsvQWEpKQh2av3BYxEHUMT3QZrpmQCVQgL42gXMtr3XgRRxnbgMC
         YM/A==
X-Gm-Message-State: AOJu0YwOdQ22JTV9ghrZfG3R3mMS0YykC7quDWjWAweAWQm9j+yubwYU
	QylZX5QvIETxHYvi3dtWcBgoyU+dpRCIfQjlFjnvYaUPzb96Y1S26t0UDHlEqDuqxy2wEc1D3Ox
	eUr2N007ZRKVDLXgWgG+dV/K5VPYW8pxdFnLl1cdfZESTUok5NoNsVL8jt/j/VMv4Rg==
X-Gm-Gg: AfdE7clPnVWb3ntKZX7rs1HTiHffRYsnFW2S3AOxlDI49hZDbQqm/maFfmZlPQ4NU2Q
	nrPHn/70Sa/bOcvTMgWmDdmd5Kn9gi1psf7lPOzAqXTHLAbzCtRfRcqFiFGfI8laiqJKJeTeCA3
	H0BCsAD23s5K16tXMZmhFEAGR857fLvA2AWKidbfql4Z1oNfbvO4yhT6Z1HIpRJ5Jz78RNF9+OU
	DZkoLkIXzWERytog538/UvKu0f4QOtF+qXwgbaK4eibWy20hCkw27pI3S7FN1EC8sAjMxPGLsoj
	1eOatmEIZRU7PcczB8Kkb/WIh3RNKh/q3ubYcvEPAlymTqrFjCIRhKGBsZ4UokCBW+csTV/ZcXS
	sV2ohj276/qYvmsduCCMUBvR7LFntDx9s5NVN3sjXGyYI
X-Received: by 2002:a17:90a:f948:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-38d13f6038amr1154531a91.8.1783651205142;
        Thu, 09 Jul 2026 19:40:05 -0700 (PDT)
X-Received: by 2002:a17:90a:f948:b0:380:9699:ae98 with SMTP id 98e67ed59e1d1-38d13f6038amr1154506a91.8.1783651204660;
        Thu, 09 Jul 2026 19:40:04 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm38300227eec.31.2026.07.09.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:03 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 08:09:12 +0530
Subject: [PATCH 1/2] media: iris: add Long-Term Reference control support
 for ar50lt encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra_ltr_support-v1-1-458b587268ea@oss.qualcomm.com>
References: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_ltr_support-v1-0-458b587268ea@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Gourav Kumar <gouravk@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651196; l=1879;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=eyk9z2vW5/VibGj9Ar1yvrbi2OSzHoMPb9BkI1P0FvQ=;
 b=KijEKIuL1m6xW5rvvbtw5+DDXcIivju810HsmRjHpycJXuKcbXfTQSTcLtMNDKRYquYezWMdm
 rBVpZ3+lvT/DGECrXQwSOf4acYE2jpoZJ0qux7H0F+wntjG1kuUs9OC
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfXy3sdxDACf45F
 Z3NdFjTjchuUQ+nNbn7C9TZxanQwDEApBnEcbuxNw0acNsODJ1vdWm/ErwgOTloXI5usZ9AEekW
 icACANkFh8uHWymIRzdPgaAfQXNrK2NXnSOEVKCPxpJZHgGm7pyVWqk6ffsn9uhcUJX1LIlqMcv
 n0Iq4bkhH+AVvkT73hX5W/VBGeq76ot4RjuAHNpUyfL091L0US857EgYIGG0+9+VeythlfqifrO
 ObgSPf1wck9XjBCmllVmzCbYOlKsDKFFOYnyuJ+NzzBVo+b9MVRp1UJ+apS4olsQ+Xwmqbk4F7L
 HbjItQCejfgfUig/cCwg+7ylCzC9UKz4wKG2Zr0mQq489oX1RCizuf+Hhk1hkCAw+V2DFzgQXyR
 PJHvrdYXGaIqOyob6LnZOtf6zwJMXD0zpg39pT/ZtyBw83Kv2z1tn08YBirHCE8SNB7f/nXtV+Q
 B9+ohrMT9d4TamJmmmQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a505b86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kMRPvbZiJaxPZM8SQqgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 36oR4W4Gi1JgvgYIG2Jgg8OZ2OE_Fxog
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX9JWwln8bPy13
 iwJIwLINMwidw7kKFhkA1cAmzWWw7Qd5b/bVziL5hQ251ZOowlMooG7U3O3ZcEuSRK+x/JIEgTy
 2sgXVDeN9043IlnM/iBDNFkhCEUIlNg=
X-Proofpoint-ORIG-GUID: 36oR4W4Gi1JgvgYIG2Jgg8OZ2OE_Fxog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100023
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67217-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:gouravk@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B389F736BAB

From: Gourav Kumar <gouravk@qti.qualcomm.com>

Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
The ar50lt gen2 firmware supports the corresponding LTR HFI properties.

Signed-off-by: Gourav Kumar <gouravk@qti.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index f89245269e8c..ae0512971e8a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1669,6 +1669,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static const u32 iris_hfi_gen2_ar50lt_dec_ip_int_buf_tbl[] = {

-- 
2.34.1


