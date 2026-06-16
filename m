Return-Path: <linux-media+bounces-64956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id coREFdOUMGrSUgUAu9opvQ
	(envelope-from <linux-media+bounces-64956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:12:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2F68AD67
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 02:12:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AVrVNFy/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=df6Zx6od;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64956-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64956-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4D3E311906F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737DE25B663;
	Tue, 16 Jun 2026 00:05:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9861D5CFB
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568345; cv=none; b=bediBefcQsEBUuIZmD36aUBM5WupewdLTMBijsY/mFoy1Ls6Js3ep7NDN9oBotW9GG+5NAziX/nBMbYOaTtWJCAdJnyIWLfFpLxicq4TLw9AZJjJ4uSqSR/q0Y3TUrGg1nMWBbwp1dgZd7G41QgvVJ7WWbu6izKRWG3cSvI91gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568345; c=relaxed/simple;
	bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEpqQtVZEln0Hnqa33g0QJlzaCXl71Mjl0SrSLpM+FN0+JbqwrckdNlW0KM/yv9Ypy9sJBYyKOpncg0HwDd5YXo2zcKyx8QUPZN2tWc/GGN5hvn72BuZ1Nnfxk58IbiOFgGeK5zNam1BgAzRc/L1sxL1LDrtodM9QIQ1MHFAu8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVrVNFy/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=df6Zx6od; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ1UaN1367691
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=; b=AVrVNFy/q5uNNgMD
	y+1pVvyChCIaRBhxOlMYvyHRzVjEiJOkrOvEhrfpkOvGM4vh9spCMKsINc8Slmma
	fYo6LfatAaJXHbLYa6Dsbu0kB46w6eaozRnZ3kHztDsKn/qD1BYKaaal9uP7DnCg
	E1KOFT3dRH6GBcIpdf7e3MWTV2IkMIqW+yq3gAF2pLV9yXOBjxbgQlsEJ5yruVck
	60o93tfbN2W8+3EAvBXyTgCPjzVjqeftAJhDJRj74yS1uCrd+4gRgz7ANfYv2+zo
	Q7Y3wG5I1BZKXhHPMFXhNOinPDo0gVxUEo7bFFXczSS8awGm5SVddoeL/Fh6svi1
	azuocg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteguur2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 00:05:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91565f8c589so691857785a.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568343; x=1782173143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=df6Zx6odEloYDWzu5So+EupvddhRe3+CZc1ptotHO05KGfTkbmaYZm+vXf/TxyJ8oe
         gvGU/aUT40zt3Ma2Nqb+BEuOmqpU2pukcC4hWnUlRlE/92nlVuKSFnzxtib17DQwvYTG
         p9kGo2aIGSmTnOFOk9YH7QrthCcgiSu3E6Q+EKKED/DO96oSpKB0J18q8tke2vtig5F2
         9HyWHQyarJZEvckJFv+sPhh599mXpYMlCwRGVI2nquErCp+wkvDR0KGMrFG20kf6yquJ
         d7GqjcmdGLRAiTbUMzr6tl5MCqHsYlohTUUKvZM77zlnzBSsfgCUOlYZdv0fkJuA7axZ
         ibVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568343; x=1782173143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+lsgrKk9p/S2kXHtUz8qoicwfhLPPm3xQs1fSPkm5/g=;
        b=W0eelcoO37dR8ZjKRGToIQaw/Ajbxh7nlOtrfIrFLU8D+yzagwNnT1VR8pqLBXYLaq
         DIuNZJ5eajzVWlmf5QjhFFAPfemVu93ee7PTMgI6Uk/LHHx/uvdvyiVz0K04X7mhKxk3
         sW+TFEKuFm6Tk8Bn2UtdwQbix9dq9h20hv2PSDpykRIaNJJG2BVJmhwHg5YAAqZpi+8X
         o5WWpRNOg8RGIkE6q2EXirVs/ZftTo2TunOD6epvuF3eNf6ilb8AW2BuaQlnAsS6DTVW
         U3d10tKTsZsMO9UUlwKJh7fzRqfgWtlXtOoHt6BrsrmM2hP8hkgBQbCn299pMRZWNDja
         6pYw==
X-Gm-Message-State: AOJu0Yx4nAOOiH8NNnDvxmcyVdE6ZsLJvqBdjFOYRe50AELjqLaQBjyS
	iwdYPyfCZZJz9Si2r1ZgL5Dc8JP9aJntZRhI8fgBdxMj8qNpGZA2M+yenUWQj9eu9erl/jY0TI7
	UWSISgVJ09ipvVQQSp8/dB57W0LBaZlKv6WpWLlCCDCBmjB+8hiop1NTnGj8Z2lgxjw==
X-Gm-Gg: Acq92OGsivWpMfDwKLy6Yvg1LDFZraNQsh2m6ZAE6KZfiui20da6uD7I9tzepwMphhK
	ap5iNCyGeWZJp9vmQMe4M2dn0YH+BEvIeQiD0idwaKniazw9qczMr1Ke0zutKQiXPhpLUH3JH2l
	I1k1h+5FVd/pOoLf7VnZjl2xNWugLJH5Bk2YLBJvkOmkIGDKc5s+5HNmDPd2GelGbRrDwmEgEwz
	ZLII/D1Y5bDk5KTmgCc1jBzTTdlDbydFlC9GlT9kW92u6mgngAsyHmbdm7/VeNFD7C7tmLkOFwv
	VqIR+Snx4/Kgfo0JBPI5k2ng40NMI+enqPGbVpBTFE2xaVYtkbIoP8qXGIq+UBK53Wbmn2bDoDC
	KGGLqGLK5rn9UA062XeoZmCfU/M26+ygPFiekw6ZcsdxQRhQEWfd8mMjfnGM1fQHcS1BQuF8Pke
	6VVEiMmtYom4qVhIIqZlNdMYGY3prxtHClt5c=
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237277885a.37.1781568342745;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:915:4c9b:4120 with SMTP id af79cd13be357-91c2f8a532fmr237272885a.37.1781568342274;
        Mon, 15 Jun 2026 17:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:43 +0300
Subject: [PATCH v5 16/16] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-16-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=901;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RfGmISJ4Tg+rlJIDtM2rxs9yeQZR7HuRyIw8EI1Vrgc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ+9/MTBoo8zy5/Eect8ALxjYmFFWBT0NOa
 kTUllzxVvOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1TY4CACSG/THyXnQ7tfqFwmQG82iyICvVWfIUH3JWjZhxBfxF7EDwfjQQEjMniu8MtUQH/mY5Ku
 IJxujjZ28QvOViF4qQA+7BBrvJBTmmbcHLbKuDMSkPmqSoyOk9ytPtTikyoeSU7IxBXq9iIdc3x
 UYswZ7tFZYj4YCca6WCKCdcIEawOCZoW34B+gh8V1k4upHSnp0Py70UTrTxwKiPnC75D0RaBllT
 dkCZOIoShVBp1bsjVKgjEFp68N3aCxrt37gS6IS4r+P3lWsa2Epdxedbp8Fspl8w7haGYx8bYgx
 Zvo5oyv4fJ0x5CpV4r+iNteciGNZ4uriKalKVmObd80sYGMJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX9atuWdj7q1YP
 PAP+/6H7QMVJ52OeIrjIINlQKUQ8dkmXL0vwSNCIJpD9VjfZCniShCu4JChbQ+gwQudrVJPa5cS
 YPK7oW+tj0nGjncmx9xu/1UvVKZ7+eIpE3sQuXcmD3JjiIHTp1KilpVOk46IkAkQiPSAuRIdctQ
 pendk5A7xMGPOn1GIDW4oAuPb5xYv5oi8O14wGXPCI1bLa4NRvRAc+NuDsk7bUPvXtBJsFFXb0r
 2ZSMa//NajlJWB4m7wDDujNW3XhIXLkqn+SjcZzhUW4+Sg7NXcZloIUfzCelV1hUauTLOHW0h4y
 tso9fzjN1/OYwdvlFvtDjutiLQwSr7np2wUrTsgLSIOX2oJY0ek+sJOB4dFUiUNT8UNZ+SEVpG4
 eATOB+uAyJepJsmX3zdXoehf7jITMLVbRaJ0l+LJbQVcH/Mo6nuys0XhXnWS8/kRQahq/hUuzjg
 i4IwpxuR+nrKfgOMtAQ==
X-Proofpoint-ORIG-GUID: g16chZ8bLYZ6nSI1lajcQ8aeWazC9r5e
X-Authority-Analysis: v=2.4 cv=HMvz0Itv c=1 sm=1 tr=0 ts=6a309357 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX9R8r3Bpaqmnq
 1rhsZPGeXJjI7+OZsedAdZ+yvbWH7mTvuKiv4Hl3BXRNVzs8yRNPwHgqjp/0c8VSTpxPDQqAgH7
 lWsgajrGXbCC0sfUkqP3ZXnjfYrqQgI=
X-Proofpoint-GUID: g16chZ8bLYZ6nSI1lajcQ8aeWazC9r5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64956-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6E2F68AD67

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index f57af31dbd9f..a8819470f703 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


