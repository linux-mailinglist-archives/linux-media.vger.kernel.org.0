Return-Path: <linux-media+bounces-55967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPm4GoRTuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:01:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6E29F70D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF453307341C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 18:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25723E92BA;
	Mon, 16 Mar 2026 18:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OeWaQL4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQLkBME9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B3EB7F7
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687308; cv=none; b=Y3p0JKqbrqxyyo62t6cDC8Gf3P4NVX4roy5bp4cPnESGmQLrJteuSi3kUDB7qVRAc6pYxAnEimWrKRQexscmfEjI8HEkoPNZLpad57L4/rpeTcZ0aZ09/oTA2gXosSJrfLfJc9iy7L57nI1pjsmNgUI8B79OmlpdPLcHBS0AIDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687308; c=relaxed/simple;
	bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE0XDndd15z9Q0Gc0zotPx0joOccrFEK0JdtXBbkJ0u8gQXr7PikFG4T/6t/NgkLrU3ZJjDacLt6tiq3ZhQaXE//ruYzD6IXZMXiapsUQQ/AITV0PFiA607QQ6buzNWqnfQYdc2s7wFL/6KG421e6b5WA8XJUWpWT1gurBvUqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeWaQL4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQLkBME9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDC2K2041567
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=; b=OeWaQL4errCgj1ds
	fUU+HiwOwXfHbVpqzgpiIqJp7jVgyTMoweculsqNFqCHpt/xWrbz+0ZCm8euLaV/
	sBILRZWu3Rg9EAZGj5CJsznxcp7bElZ9vTlOUBbb1aP4/cc3Rfp00g7VAtNWjf8M
	IYkcPUN4fVOwqXJEBUZrwlkEUtoGEIfKRzofpSNSQyeL00PvYJhGvOOUtXUTlRGS
	dR4JdPn6Nm0lLY/jyVh5LKZzvSwOkDdxa1ZmZIMeD73UZMVKbo6YehNothdJ1okh
	HroV5/6AbZ94V0XIO1LqsjkHInCRyJJ0hIrqQe45qhKML6Tc22u6m0EItWvweulQ
	guy92w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt82g33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 18:54:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so183922585a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773687299; x=1774292099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=YQLkBME9uBUZwlCurPqJEwyVqn+0WaJV0fVtjLqyu1VFvUZ5apgEzqiE8V/CNzCKGw
         rfMqvc0KwT7rKXuCVCSdCgPJBBvMWGih0Ofdwt66PnQHNvalfWyGerstVDLms2IIsRDV
         4QPqFwQ9ZSg7uD6mPN5mrgNkSv0LOAElzYUd7iC91l/OIJ8GJ4lP+3D9x8Gs/dmxzUnc
         Z7K6IfwpAF61O5mE/0N2JG03PjgPSyf6uV48D2BzwmgwBk8nN1Co3kZ4s09kP2TyxZcl
         bmOUxjHVZR8JSdVdsE9whWd0kum79sMwRK6/7GtmlEDDC0VIvIvisD26QNKmivYBpo1v
         N66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773687299; x=1774292099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WkIxi4+/C28jrvf8ES6/SIOuPsWcpSdm1apYAbDQVp0=;
        b=fQIqzFN+ihun1bcqZbBs4vI7Dj/zBR9Kn6g75JCvyx9tu2RwruJ9QnNi3WC5qCczsS
         tUVKCJPPNLPUN79n34X6WCW1iuOJDWrB/RP+SCT8F3vs5AjnWz2hEiYBtFzQg1mf7bl1
         /cFIP7zYGyURaYVZNGJqBHQMYfesjEsTiYF9YtPOWXCiWU8LKElrok0qes0Ay/uYva5B
         eiBbcwl7POc6dK8OojhnYo5cl/Pr3PTh8b7Ln3JvJ8ZZF+3QsaqEnpd03o0j9rcDsDkM
         DnmI1+oZKdibILW3j8WpjS7Wnmdn1ItITOznqzud3nKedXOz7ROS6bgzM+djQ9v0MgNm
         VHBQ==
X-Gm-Message-State: AOJu0YxDWXQLjbB6n9FWDxaEWZ9yfrs2xpSSH+EflJ2Fn55zmslgnhy8
	tTiGTKIl3EcpTHs0itZ7+tHk8Jvd/HiQZBQydDDC55ebNFVW1XMACwTpzXBiLzPE31HqpeWdeia
	htKgaR5rM3JsWmomO8ypdtIGX+sR7AdvPwc/yhmhS/y6taedNLhPfHlWE06DUTn1QeA==
X-Gm-Gg: ATEYQzyKg/msYPMbxopLk0FIp/NTirsGhIzlrVYJqkdOUWLQcUQz7DKtyFP/ZE3aGeE
	sWkBtUnAvjhn+BWEfRWp9JChYU7OytrQ5zPijn1+X586zsv0kXi4bYKYkjuG3orR9T0Y2dWwNYO
	J4Xt9cwkU5joCP2UAhYsOUyWGA00N+w8rhT6oKLHMaxuKSANteTNLsZoO71z+pDgZZ8T3H7KcjI
	fA/L1vxMATJQ/HJuINfFI8YIUe6YMHw50oKBNY4YarnvAQRksVHnIcRTRb5YAIpW2pJDF9zlM7O
	CXXW5xcPunho5s6p01bMt/mDlaKUnf17gwJn/mFuYnCy56U3olueIrgfKhZTyrDy/1aRMmJ7uH8
	SYas1GBihGHqcIYjb6oO3ROIMuoW8QXMNY3xU2pElxv9TSX+DvV7VxQ8xY/YZ2zoUz55um30MvJ
	8p1oU5LKvOXK6RUzZdg8lNLt3jNh/txzY3b+I=
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1814192685a.31.1773687298840;
        Mon, 16 Mar 2026 11:54:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1814190485a.31.1773687298324;
        Mon, 16 Mar 2026 11:54:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm34108041fa.33.2026.03.16.11.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:54:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 20:54:44 +0200
Subject: [PATCH v7 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-iris-platform-data-v7-6-fc79f003f51c@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9196;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Knwl9TIGW90PmwXP68VpHHyknWQzY2+lfOIWG1iTcOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpuFH0FXoBQMpOrFsInDjn9JI+h1YdaBFnjCl8n
 RIJLR9Hvy6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabhR9AAKCRCLPIo+Aiko
 1fgjCACIuoWgCg8gqVjWReShqt6fCs8CArZRieQVSw/MCHr7t/SerkooLzs1JvXyp+sESEuAla9
 +nEd7KU32TiTCrLlhHs6bZjrkko593Hfmu+pDsxNDsamIy4YTE7w1078yBAvHi4MnUg1EAugTDS
 y4QttgOVl+3dyJOdMNEB22gteOsDIskJDR/WzM0feVHrGgei1L1iDNM2VyExrQogpEEwFffrsaM
 +mFIPH8D3SIqwZE2+R2vE3B1PtgdRtIoLTgT99L+/ffbD38YiD6bnnHf3W8Ot9MGiyf8+Vo+Zap
 Vc7np3QEH69iRp/FFH14gClZrxesMhaWRiA/BZmUeUM4Lbol
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BEhSebzaGNYcH76XD4MrfPZJajPh7-7-
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b85203 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=65xn1vM8G5_EQ4liwbMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BEhSebzaGNYcH76XD4MrfPZJajPh7-7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1MCBTYWx0ZWRfX9mHwyBlMwLKO
 CoHQEw04VYuMN66l5n5UTung8OEWquNyudBmXo7LUd2fEcP67rwDCIrBuXgnylKClVFWjPj48KB
 7wY73KyT0u/nrwGJ7Cz147yhMvKoj9PKT+qziZwZHgiSc8OS2PCbagywxmdp09bFrV/RjDynwAQ
 foint3C8zjpUmgiUQolufCPYxLWYifM0m5kuRmBM3cVJ+uZqS/+Q8mwXWBT52IebmTGyRXrWKcJ
 WKTIwgbUZKwOjRBk9NskymnuZmL8gZx4OdxI1+ABTkOR/gyUaGqrKi0ypGXNv20se5024C9TkN9
 RjLyQEPo8+DoDZWeHtzadn2PeCvLG2bjDIudhE1SpZYcNRMWDMfXD9x9NBLUd60pztJ0wdvfNqx
 319BM24GIqgPTojqYh2/KIlW5AzcwbioSMdSPDE/RUiwTVhyLIVwPLoKUMJVaF5OE5usHh5rVwJ
 dsTqavOy08qFoo1spSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55967-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 19F6E29F70D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The get_instance() is a callback tightly connected to the HFI
implementation. Move it into the new iris_hfi_sys_ops structure, merging
all core callbacks into a single vtable.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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
index 9aa84a1d8f95..a27447eb2519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -112,6 +112,8 @@ struct iris_hfi_sys_ops {
 	int (*sys_pc_prep)(struct iris_core *core);
 
 	void (*sys_hfi_response_handler)(struct iris_core *core);
+
+	struct iris_inst *(*sys_get_instance)(void);
 };
 
 struct iris_hfi_session_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
index 38e9d262d7df..c37adf65055a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.h
@@ -7,10 +7,8 @@
 #define __IRIS_HFI_GEN1_H__
 
 struct iris_core;
-struct iris_inst;
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen1_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen1_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 26b7feb05d15..0017ade4adbd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1076,6 +1076,19 @@ static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
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
+	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
+
+	return out;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_init = iris_hfi_gen1_sys_init,
 	.sys_image_version = iris_hfi_gen1_sys_image_version,
@@ -1083,22 +1096,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen1_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen1_response_handler,
+
+	.sys_get_instance = iris_hfi_gen1_get_instance,
 };
 
 void iris_hfi_gen1_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen1_sys_ops;
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
-	out->hfi_session_ops = &iris_hfi_gen1_session_ops;
-
-	return out;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
index 6cc6d9890c12..21ab58e0aa84 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
@@ -36,6 +36,5 @@ struct iris_inst_hfi_gen2 {
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core);
 void iris_hfi_gen2_response_handler(struct iris_core *core);
-struct iris_inst *iris_hfi_gen2_get_instance(void);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 0c98d680bf09..639b75fca1ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1315,6 +1315,20 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
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
+	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
+
+	return &out->inst;
+}
+
 static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1322,23 +1336,11 @@ static const struct iris_hfi_sys_ops iris_hfi_gen2_sys_ops = {
 	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
 
 	.sys_hfi_response_handler = iris_hfi_gen2_response_handler,
+
+	.sys_get_instance = iris_hfi_gen2_get_instance,
 };
 
 void iris_hfi_gen2_sys_ops_init(struct iris_core *core)
 {
 	core->hfi_sys_ops = &iris_hfi_gen2_sys_ops;
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
-	out->inst.hfi_session_ops = &iris_hfi_gen2_session_ops;
-
-	return &out->inst;
-}
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6b76a9046f9a..d1daef2d874b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -203,7 +203,6 @@ enum platform_pm_domain_type {
 
 struct iris_platform_data {
 	void (*init_hfi_ops)(struct iris_core *core);
-	struct iris_inst *(*get_instance)(void);
 	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index dc74da04771b..9925a893b404 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -333,7 +333,6 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
@@ -385,7 +384,6 @@ const struct iris_platform_data sm8250_data = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 19e99e1c2aff..10a972f96cbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -907,7 +907,6 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
@@ -1006,7 +1005,6 @@ const struct iris_platform_data sm8550_data = {
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
 const struct iris_platform_data sm8650_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu33_ops,
@@ -1100,7 +1098,6 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
@@ -1196,7 +1193,6 @@ const struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
 	.vpu_ops = &iris_vpu3_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 7e03d63578e1..ecd8a20fedbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -156,7 +156,7 @@ int iris_open(struct file *filp)
 
 	pm_runtime_put_sync(core->dev);
 
-	inst = core->iris_platform_data->get_instance();
+	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)
 		return -ENOMEM;
 

-- 
2.47.3


