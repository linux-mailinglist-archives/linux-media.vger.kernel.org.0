Return-Path: <linux-media+bounces-53822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA1OG56oomkn4wQAu9opvQ
	(envelope-from <linux-media+bounces-53822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:34:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD2E1C16DB
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 681A531B32F5
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A193E9F95;
	Sat, 28 Feb 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqW7udaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFwnnotG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80A3EBF2D
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267359; cv=none; b=PTjy2Cyh24j/qV07mDb6N4jkdxJwpwJ6y9CSQWTUoM5ogxypiixSPglScgfXlseFzIvOz038BE6pxovORhF4VmoDqzFAtcD4dtcy+H7bP0d1jRNTLcUr+Uxt1KKXBOjMWKDGJAJJre/nL0IkAIhvHXfwDtVy2efKD/+PpZsgO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267359; c=relaxed/simple;
	bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXz19SiUWuAU6TynRTIqR5G2dmXNTmniOgt8bsXVJnEOFi5W08wR7qU6gf+h38IpcHZxUWOudLF2HArk5Z2ib3DoBmVp0K8ySSQN5vERCzRPi7TnCjqjD34es8gDsCywsth+brTcYfrPO0ARLNZfebVQGmC1qhuy0OO02Qn1l38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqW7udaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFwnnotG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6NZE92377032
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=; b=AqW7udaWkVzquWKs
	5uQRGS4Jr41sOFXYXm3AwjET1VV7A/E+YSfxZW6owS/2CwVb8srLu4aFvlCU6wEp
	BvtA1nvSjApxrGFb/9KC461oR0gj0wEgY0EHylvLjE1iadS5dCGPZSuMkeC5KwlB
	ngJkoZu6jZe61lmuvah4X183f45EtJ8lq5HgQ3rUyrrjaWO/qQHRWtn3AwG735Kk
	hqyKVgHabkL5qbI38CzUdXuoJjvQpwCKDpY+nD383EqDmjTso2LVBMbchBBtiFfV
	9PN7K+SPp93u3uf4dEr1OzajzRdE0kgbyFl5WzwHwXoEa/eoEyrR7R3gLfonqzKT
	4xQYAw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd0j60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so2044299285a.3
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267353; x=1772872153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=FFwnnotGzKgV83zcyA43dFdL5lOe4beH6ftxsynHRvSw2lCFU+SWVKSwFBiYoSTE3w
         LewAFOrYG/+NwxUjhpusG6L+xhXJInt8PKER54k5JOyt4YnYa5LePkrBLuQgYYRg47Ba
         kKgqeRC0qpGXIXaAdHst7e0jKI8wGO7Sp3016rQO+AvRvHLgicf3p9xGtHtnzoaj0Iwe
         XH6UbC0GWTpbkZW2YszwrUPsIUZf6HMT9p1XBOlc1Xoz2TqjxuUdkgxVJjdDEMmYeozd
         ZYGb7dYPnfVxetn9NW8ZSfJIojmxbGNrGI8drP2LzwrNRgBFNOpkqQkgGTQ9Nsj5OqJF
         q8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267353; x=1772872153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o3RuzPJp0cLL4gWGIuH6YePBKq2/LnO2jmhoxtNAj60=;
        b=lSbIXPMmj3BJtoltkyYEe3tZIJXKdBD8OkIMY9Mt5m4Uh2uQyLS1lbgITEf+KU5HI+
         kECjsZ4rRAtn1jZa4ddVOWOoTXyviglT5VFizRZhmXlUmS4NJbaUET9MuqIdEiXDgMvY
         iWC9qNf+Lo64XJTPo5w5y65FFdKpdiH9LFpmXYo+ZTqrX6EZ9e8zDuPoUPQ3W4r1hKP7
         3wu3WnuMhPAxMZjmBnlXfag/06HZfeyd2iWS5gk25Z6ZudKVv7eof9VbpbUMl44Ldnij
         lf9v7nUZZBocfokra+KiGguiGXt+Nt86m0t1wWntPfbcEnentL3SO3DKwmYd1QmLo84E
         w8Iw==
X-Gm-Message-State: AOJu0Yz0AVh0SKXreZ2cXAoIuwsifM8Ppyrj/5ax0Rw02VOz5WxW4yyn
	EaaQASgzhvY8+jyfhTXbawjOhm9ARJiefRIyZ6QB+JqDFFoNwad6dhRUEtvtici9TF/ZvFRF0qO
	QXCj0hIYW92uCaRLMrWTgXAN0M/jtNZJObQ8iqTWjOjarhVnHT8CKOGc6Oy5zqBeQyw==
X-Gm-Gg: ATEYQzzw2pkBwUPGFsWWWU1MaYQq6ENw/9dQhYTr8Xf6XX9fvyxOsnPqEyA4tDpVKUz
	ymwMwoNzPwb05dBeQ0HSP595oZ9M7JgfapBy0iILEgXjnW77batehZe582ONTA/jbvP63J38dy9
	a2bIOG1SJlZ1j5qMV3LQCor6PIR3z3S6t8htk+QwK6/wgwPXfpTuiCay4J+uOhE+8zYHbsX29xl
	XMxFh2nGOyJH6fTeEllIG43bMZawfUfTpnEeS9y9pR/mIOc9pTyv7ktCe5W3//g1Ar70e+NFxFz
	EUFEKYJgnZYpS/YGX0OCSg1XxHpjHSl48uvFgrqccGmTLH91Z3y75wQHe5FoG3N7GEUGl4EE7Oo
	eh/ARXyA5Duf2mU72fpLFjCI3wR9oGdcaVBnB0+4hw/RV+HRXdgC3dQabAeRiEaz7MdPKy6lnGl
	yxCgrui3/cuHH3+w2pz3M5f9d4SWkPT9xmGuE=
X-Received: by 2002:a05:620a:28cd:b0:8cb:5130:cfe0 with SMTP id af79cd13be357-8cbc8df7177mr762471485a.51.1772267353415;
        Sat, 28 Feb 2026 00:29:13 -0800 (PST)
X-Received: by 2002:a05:620a:28cd:b0:8cb:5130:cfe0 with SMTP id af79cd13be357-8cbc8df7177mr762469985a.51.1772267352941;
        Sat, 28 Feb 2026 00:29:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:54 +0200
Subject: [PATCH 09/11] media: qcom: iris: move get_instance to iris_hfi_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-9-c2c53539f948@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8958;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D2ds+EqPKOCJKa58h2afy1b8aa1tTO2Jv/xccI8QzNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdAbJMTF2s0uHRL01lE0wJW8UrvgQ0folWYp
 LQztwjKVZaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQAAKCRCLPIo+Aiko
 1XF9B/4h1aaln4Zh8zEP5uPGXhQlD9beejnsHGssDHhhcB1Unhze7EvxtM4gYdw6zu/+DS+FmGk
 VARuvkTAo1dda8BaJG8eAhMOdWX+LArMwTAY65LxOiBWfQxutioBMztdkWSPXW4+xo5TYtksM9u
 LKnrNXWzgIsfeDpduww1Tt+ELOrBK7JKL/7L18HVRHk+mQCw4X43UU4HEP7Vj4757De2Ws83zpo
 wlvnS12xBpXL4Jus6fnMRc4wbXILZfXQaaOxSY8biPR8r+HpnnVISX7h3BWU2/IXULdHA/52zQi
 e7Y9sG3R+aIYlQ33w34tYmHGqT34s9u7Ege+x56ukilkrBA6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX6s3wmup4sG8i
 6MsK+X8bB3HKULgNTVoRBn3GghxcLp4E1cQBRv7O4WsuesUNPPl1d7Gu0uXYWpve+75ItTUWOOH
 MzytlKmqTbwi5M5b/sM52NI93iGOlF1IlA0wKX/V114kenpj4upFJ5XJw1RXjXdCVdT9RMewQrw
 g5NkABPqNh3IN1D/cahF1GlVdwYut4mywADwFPuejbLmzRpkqDtINzXnDiFiTpWOGeaxLEwv0qp
 HNSqRfBNInJbFNwCvLeG9LE4ULRX3YlL2OfAzuPNvzqe4lUDdqUwdu6xoRrT+CT0QRzMc+OPRDB
 CJTWiOjvtZrima/xz+2Rv2dxZJEgrC7joBXfLL7LCiVQHSrGugFfXOasL9ZSsUO16r6kfYMVnPD
 9t5IRMXUHxl9R3gHHcIo+vro+es5nLL5Id5vBtaEXsvu4AaihUDymTsw97Ie1Q6L2VnzpGxi4rO
 QaDu6d8e5XCoyugJYgw==
X-Proofpoint-ORIG-GUID: 207RzgQX8wnjlWSzPdXW5jYC8XqEwJQz
X-Proofpoint-GUID: 207RzgQX8wnjlWSzPdXW5jYC8XqEwJQz
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a2a75a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53822-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 0CD2E1C16DB
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


