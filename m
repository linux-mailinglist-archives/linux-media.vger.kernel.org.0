Return-Path: <linux-media+bounces-61696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOYhOWQNB2p0rAIAu9opvQ
	(envelope-from <linux-media+bounces-61696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:11:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113B54F35E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8A0320C2C3
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0F448BD36;
	Fri, 15 May 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUug+3rA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iN9DlHMo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE748A2CE
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845712; cv=none; b=dmIef5FEbuGlBcbIEwjjT8e/AmLp3dIzNaKmd/D64wd8bHbOPnB4biYqNWG6eI5etq4izVOUekuSGIp0PL28EgeTzGE7lAECfWkhiXVIPbPj6MrW+C1S4KkDR1NKJHqX5/G5rasaEEe3R9EFoQrvbwJK3dyn1StTtYPrPvRMOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845712; c=relaxed/simple;
	bh=1zDPOP1SavZgDiQyi4AT03ZJTGCF0M0Uv7ocps5TYYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSTmFsLqZ3zAQ/BoeNed2Uar17X1r/+6ua9vKbDoayvIvFdT1DhhnlfMbM65s9kwu3/CQFlxjCEo8kZEkHbe8fNkfwn5Z9Tq3x6sk4KRAGz47WXcsKf40jeuCPvpfX/i5Nlj2oyPIft04gPengov5LJ3QSoEMwduxza6irgbKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUug+3rA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iN9DlHMo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F9O7EX1714971
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=; b=EUug+3rAOONo7gEI
	alh9KKX25mPJs7TBl3phJ0ZFuiQKCKRZvcSw6iJNBqLR+guJBX6GacCM7+Za2+2o
	sx4B9KT2IzHL1Z2SoNVuEtHB3gQEjVZC6GRhx73ZAfNeTLkDej+R2wyle4FS4OV3
	7bMEjMQkLYGntC/2JpTZjc+miHMuWC+gHfk63aFZlazlHv+AAIL4vDek4jYdc1cM
	KDyzTYPtpjaog7+Khi+VXp2R8BKMnEtUlF0J6OPAq8PgeZJfN/ScAyC8J6vf1sCb
	4biNjaQHDZmHx7lbHHdeH6yoYXGZpt2TqtbuOzovGTOyd/7SyyddY39CFB7T1wMO
	PgPUMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsvg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:48:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff0bef198so186290261cf.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845705; x=1779450505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=;
        b=iN9DlHMoXrhKqtycjOgH9piSR07YYJ1aH8J87Oh09bAY1VKtAiGypO0+wFPFo6XQN7
         Ym2OF8htrWp+db+o+5hk7jwo+Xrk48Bi1oFMzfCNmiXPuUXNT9rCBCiqpBqSrtvqLg2Z
         SHM6RpIPPYL0FW94fOw5YHEWmNIORVmTbgLgTQr1/3heaK8HKqEXxWVMar3CP+y0FJ6P
         Dti5Y8kOxytntjADPU9gMrpvXwtYZkMVJCip2IdKS3B9r6VZG1b9I4LAfaik5voOVCqp
         L2befAUH3qErxQUf59/N2rgWkYuhPGyN86n3fD4l8kQxxF10PrR3p4d7go34J0bfwL2U
         mz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845705; x=1779450505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dxp8B42jWwt+tWH1V+vTuYQ+R3Qg9AEvv+6K2fYAZ40=;
        b=hokx5G71U4lmUxk1A67wy600GmVX4X4154HqWjriGIzB7fhXMKIZghN+QEyjK8HMI/
         UkWI50eacJGMGn/EOSP5U1/78jL5SMYvsW4XOR1NnLJ7G3W3fZpun0+k/nzfE0VVi7GF
         IdbQ+OIaAkIbPm9G/Mi/C+LTsFXB92vMwPwhNhJyae0A1o4EUEe7NIPGFkrWEuVCZLou
         Ac0LmZxQec7c984AcqBo7LifkcpYcCFdzQbNC1j30KhJ54whvD6Sm/TZoEM8Mi4spSr/
         Ft0Dm78DtJ5kBunTqEmE7ItoD7nLDfCGc+pi79xkNVRqtb73gM0QmejdziY6LIas1Zw2
         921Q==
X-Gm-Message-State: AOJu0Yzf/cOyG5re+T6IgBejqh9hS/TlhxQnKIYNQqBpX+JcqFS7Gmfq
	DJS9KoM8ou0bI6mmShSq9eJVw2FmOk7g4kXErD6djgfJTU72d8f+RRoHEvdjju98hCiqAoIHyLM
	h5JvIq/XFdntiWg2rkY6dgHbvVj4boJhz/sLyap+D2r68PfreBZyqDOHXhsRnj8o2uw==
X-Gm-Gg: Acq92OHnSOEXEOpTtnlbTChXX3f9pfVYPzDWb9m9zAFMp8VSU6U5ZtQUXlFj4+itc47
	nL8WU0/p28HI+dfT0YEnzzTczoDvr4xLhZv0KXzdXDQUONQTus7xY/K2S/RtbNU8lCwLbYvyx7x
	4KGlTo10t2Bm4+oc94S5pxoxsMyYErzexn+inFpP0yPPJeUyuEXjDv9piegldwgeJFrb/PXWy/G
	arCCHWfZiCTbounom2cFPN3+hv0PgIxcTggIereqtPNaJXGcbExy/Uo2KmosmNQDEAj/Bewn/cJ
	7AGb3DFyNd7FPIg0IpznECuaE7D67GfuwcbVFMXxf4PiEJtjBrHqCcUEUJHiZ2+zXhvb7krlVqH
	+2H6QDNlZzuCx4EcEyTOc0eKNWcf5gIE5aWqvd4zvOJ1KLm7xDyX8ULS/FxV68UjCl5D6tBrabI
	3UV9bHdjjobiMV4cqOZJV/wFyOk3e9rmXj/Ew=
X-Received: by 2002:a05:622a:4108:b0:50e:5cc3:6f42 with SMTP id d75a77b69052e-5165a27a8acmr45272201cf.59.1778845704505;
        Fri, 15 May 2026 04:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:4108:b0:50e:5cc3:6f42 with SMTP id d75a77b69052e-5165a27a8acmr45271651cf.59.1778845703960;
        Fri, 15 May 2026 04:48:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:08 +0300
Subject: [PATCH v3 09/16] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-9-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bF8iILLVIppNchJxOge/8BaIad5y4umYpW2shyRCvbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1zSV2dFei+cI3PFx77aEvLoXlbiMiwuBgJ
 uwUeUT7Wg+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1UYjB/9i4edjCWnCPSwKG5bbs6wnzY5ZrLjFiZkMVganeoPMWdKhaZKOiESvkPNNjQeINUY9CNd
 GCmDzLnZPuOdBl1lsK+vUtKdLLoilopHst/2wgxBHKd7Boc2uyQQRSYnKJ4rwtDrWqlp2psZecq
 /UuBhAsfIjt0pXhVhDp+4ZIueG/o7j/iCQgWFQU6bVJJVwdtL4BVY+HioLSIr9YM9+lGMjs6yYO
 S5Hy4V5BnE+NHiWSMX5f0pieP65S4jq30G/hXzTEIqwMKJTMiTmI/wr7GZKZbDijO2vGVZ3gHOs
 pLC2gnFc7H4wv/9qWa80oHwDXpFK09uzxVrIJ2Ls5ZAesgmB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a070809 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=x0nZcyIE9sK-8O7Lov0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LDlxA2CKOBkfnmInrVnNKbvpEioCpvwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX2v4RODbeHb5L
 v9uwYcfQXI6sSmQHEJdN18xcNNrPMIG/pMmT2aII3rNErFgguhHCGtEnan+aS860zgVYt+nq/RM
 gniwvZyyeQNUgMbkSSvV8F4yZ+ytt7PxXrCAxrxDqw1y+gRY/ILUALmaSOJCeJM+oblHWuQzDW1
 wgpkbUxT77RS3DhXrYLwoyLyK53Ev7g6PxcYvdzEjGbdw/LRn26zQsg6dv66SArPCw+59MZ1phI
 JoRcBTwbY/G/5+sFOOdskuk5hRhuM2+1woaGD5Xt9bMlI/Lkihc66z5qnpP2730opXo5M6zKLCB
 LZLMe/iEBo3+aEDXlZD//EoEp/F7M5QG92swJe5mJlLZSDahnmH9lHoSDvqoUqBtfV4TTro7RYG
 SiRs2Vt1gtIxhOlJkcetqOcqk7b6RLGmzZKxhH/mddHbZCAtwV7jSbQvse5Q+vx9bgoEHFKjtBH
 1CZT2H3TnChtpRFpgHg==
X-Proofpoint-GUID: LDlxA2CKOBkfnmInrVnNKbvpEioCpvwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 9113B54F35E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61696-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e1dc226066c1..4a0895bf5720 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -63,6 +63,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -283,6 +284,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..1af20b067c03
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu_ar50lt_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index b8300195a43b..f3607c0ca847 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..f00e2de5fa53 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);

-- 
2.47.3


