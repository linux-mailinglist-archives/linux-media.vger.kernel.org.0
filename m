Return-Path: <linux-media+bounces-67208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q5fcM3f5T2qBrQIAu9opvQ
	(envelope-from <linux-media+bounces-67208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:41:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7F7351BB
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pWJJp0tm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YKbvhoPu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67208-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67208-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A03230A49FE
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705C3C7E17;
	Thu,  9 Jul 2026 19:37:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03D3BD657
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625837; cv=none; b=UL0pj4FKNk+w92cVe9jg+kWWsBwMNdtYZL2tvNA1EJuaxNDrlNUA5HfPfHxeB3ySQrXtCWf992ghimSVtbvbwcgGU6Plxlw4hD7dPojRjVPE1X0ebHSaiany6s5iZ4bIcsUsS6/O17h1suAyjRKHCrzYW9dI1SBFTryuV8rnD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625837; c=relaxed/simple;
	bh=qG0CtifoWxLzmdZz8yI4XFf8t73NPwMCuHjhQKaS+x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzjfbOdNoKZkAdUGWKakUOOzMSJ3fTf85ndcPPllZXK/fWPsDtnEcn5Wu0IGR+ro+GHzXhS8r3eDcpdwQMEZOww6Mp5IzrqHPqin6A/OUXHFiMHRI3JETZaAe9+o+ahGfRrQT+fN1nn/emosqP3LDyLS4ciNXHNGaW7TPe0c89E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWJJp0tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKbvhoPu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXBoS2327902
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=; b=pWJJp0tmXUcl41pu
	lk3NVqdxmyw9dXrMUTTjJwH6OFDjwHRy2V8p5vJW6ffNhCG8OZKhqtgGnX3VPEG7
	h1EWBxHUGu9JJ5qzvyRiGOL9FXVJsJDLMPxM78KOUXJydID2gv1laAQIRfkKRvok
	QmBk3o97kti1Kw/mL/477XpauOn+mQwXQlKxlYMLqfM+wWKKTsTwG5ttWJSsR9iO
	xbsPVvF6bsB9QTEKfiU2OLK1z6B4h///F5wzkarFXBpAMBZF6BpBydla9CGiFShC
	EdO36H93c2UqVOOWS/dEePxukNW3SceI4qdhNK3uhPmlWP0OeQ4uDRaxAWDXgnCh
	azwEOA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24rx7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:14 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-969289fca9dso45486241.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625834; x=1784230634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=;
        b=YKbvhoPu2KMKc6NMTJHbx0pyrAvLxei73o+Fz6KqwzQLRfUOGOAdMStFTMl1RGMxNx
         giocMQx81xLcGy5UfvX1K8aOdDR7cMX5wI7DyI73f+gLQKhSxHIkrknWVP8B8/LIwQlp
         VCl+9hWnaW3QCxRN8Fn3TYkJ01ragx1wsG91d37hP6jKYnU2aNfhxpQzEliHwuk850d8
         GU0ilrHJMe3HgMFMxnCDRdGQJ+lk4nYulpaoEDIVOgBtEqI49yPQSvT5bSgnnKr19Bc4
         xVfKBpV3psDZXEGgR4dGQUUPKgVJ3L2o/PefOCaCVa4IDgjI3d8RebiJM6CggUUjPXcb
         2UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625834; x=1784230634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJX9lwoUKGFIAtUU8K6fUvLmeUVdKnCopXdss3WRzQA=;
        b=q1lWt+VmafImBSfYfkb2xgcK3X3YCV4pcYHwkLBjlb9uPfHQHTk8Nb+/3hfAOCxs7y
         V67FKEwM+MTnlJTYwfAiq3h/Ye+UaFLYmPA0udfL6iww+8MAgpIvy84uhcpWDP7kfhmL
         AVLY5iJdq51z44twXCU21dKNKiyyo+UVZGWQ+9HvSWyPuPI8NIsXwTe9xJ5JQjgMSCox
         APHWVrJvuvIdD4YNYnp5WuVODqbYhy8Z6nLDDrG6B2p3uAX4E1OufU6hkYvtB5cNqvS8
         Th/4MvPBABvmmR4AOyHIuyyM/U9Zdfggl4f6L7LE3dyiNm6HYYNNfIGl/aLbN1ERU1UM
         xZtg==
X-Gm-Message-State: AOJu0YyZXe2KNTkhggulIoIqELnxq9KLvNsppfmQNowdmixHjb95dYi0
	plBtlJE7qFQW7DU/pPuye4V8hfGgBnTXO72s22Lpul7Uq8MDwVxzcLe5izHPqR1D1Z+HS+EF55C
	cFMtWfTQgWsObSu8us86AcI0Uz0i7yPVY4zSXpdhCh3H1vDEgxaTiwEFewYCXpWaNIw==
X-Gm-Gg: AfdE7cmVPmPiFF+nSv1bxX1T3Q3TDZQzSkZNjpS2C3nbcaKYAVp9pcymVKVN4lUIxuy
	thMCA2+HkA/qDiRDcTzpuigbRRuSVb+gnrmAcB5Sbfh1hYhkoL2T5mgK9ulgd55judT/2X4gRfE
	aTmDCMh9RYiXR1JhNigJy+hTVrLyq1momnpaI7DoQGDPm/1hUo1hw6fAt1Mn0NrNi5OVx6mOhxa
	OKQq+h9SJLlvZ0Y/id+5SEfwCTBxwXG4kdXuKnTdthE2aqstLfLLzqTFD8OyCFKg3EIfUrawDdh
	1NCvG+RbMOe8vgAnTaP4M0ERctQz3nAXwQKfE1f3koML0tiHYjzU5nM9oZwM4ZgTuyDcpVhmZvv
	wzwMRm5X9GJc9GYZlexeeCnllN+sHDdsodDNvYqzj2MZlIZHpXZY792eNfpeBO7GPO7yC5CKrWY
	emnQM34vs/a9+Hl354jGog3Y6E
X-Received: by 2002:a05:6102:3751:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-744dfc58557mr4950822137.5.1783625833620;
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3751:b0:6f0:3ba3:7d84 with SMTP id ada2fe7eead31-744dfc58557mr4950806137.5.1783625833072;
        Thu, 09 Jul 2026 12:37:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:02 +0300
Subject: [PATCH 5/9] media: iris: move the decode format list into the
 firmware data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-5-6af3ab578a7c@oss.qualcomm.com>
References: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
In-Reply-To: <20260709-iris-vp8-v1-0-6af3ab578a7c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13105;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qG0CtifoWxLzmdZz8yI4XFf8t73NPwMCuHjhQKaS+x0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hd/n2pj02XAiE+oZrq8nf+ba8+a/RprvvuR
 2u4OPNmYWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XQAKCRCLPIo+Aiko
 1d1gCACYJnJldpDjAj9E47P14U1dkuaZ+0Ffs6YHlccMOOWo2ZQvla9M9LPC+MfTA7MSrYaNKwb
 gJmj/AFB1J8iga/9sUU1fh62SGbA2U4KSM+aSOZTwubJkzD0gBAoHwu0jUMy2TDAbOJnXNJRWzj
 T7PocEHA9M/uu4cY107DS7pGVisG/LC/j9YwOcjLyaCtLuoFW8s9D8ZEJVZZGkrPBtnVYepGgZN
 RGccZCo9oyqMa6MtVQZq+Hkn82yE/3stupwPj0/C7dYOVPJpGaYPBoEbcxjNyuWTgGtYSJHT8/p
 nXf/q6h1LYLGhoTbbAXSGFonY75n3ulRfZhu0ALrdX2HASg/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: L3tsXzqVCBjn9db9m18xUgffPf_BxNsH
X-Proofpoint-ORIG-GUID: L3tsXzqVCBjn9db9m18xUgffPf_BxNsH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX/C8uj4agYTqb
 tz6GqbZCGumjaoRxSlBN1SRNbeEozGiAmcwEAAghedYdiPf2pbXla7puVVVOexXqYpWLlvqhNUd
 zEAwUSQhYyPYnXW+6yhr0NPS4ecWsI0=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a4ff86a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5FO-dSMzq3C07ddphnMA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXzH4v/haMtNLH
 fmnqY94a9TycEcSAsnoZp5qRI6QotBAhHSEj05L2CbwjF6EFQnwvzOCVuzfuq6mySvQGQGom8Eo
 XJAawDWTC+ZPMzHji2yTkqvjqimevqQapdBfiLPJcwCg9GYo1lj2qZdxXE+RNBlgXaZ82KkCNgW
 +1YRvIDFP3dJQGGsn7cl+sbOT3u1+yK/wviJiEhbngYGX8+uyRahfZa2Ty8yZqwGVbXcYi+tKv4
 7eazCOgZV39Gij6d0InX6pqUSRB8p26qXkm8EvNRXNB5smKbgPLOyAyMjEGTjz3DvcquFtpXr6k
 vKpnFtWKS38F8OLWSRviCZKfjh7RJfDUEzIGOCon//JC3q14o09DM7LSGkn1x8TJ0NvKPFEm6U0
 Niree+oysXvAkvLNe4Bq9kncHrmCS53Uh1JoUwpbTJ0sxudmqR3Ms8mnBvyqQmHTA2CKbl/OU5Z
 iq5Fvx5tzBrLyRDEqSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090193
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
	TAGGED_FROM(0.00)[bounces-67208-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65C7F7351BB

The set of supported coded formats depends on the firmware generation:
a single SoC can boot either Gen1 or Gen2 firmware, and some codecs are
only supported by one generation. The decode format list was however
kept per-SoC in iris_platform_data::inst_iris_fmts, which is too coarse
to express this - a per-SoC list cannot describe the two different format
sets the same SoC exposes depending on which firmware it booted.

Move the decode format list into struct iris_firmware_data, which is
already selected per firmware generation, and drop the per-SoC
inst_iris_fmts field. Each firmware data instance now carries the exact
set of decode formats its generation supports, so the formats advertised
to userspace always match the running firmware.

No functional change: every SoC advertises the same decode formats as
before.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c    | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c    | 21 +++++++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_common.h | 12 ++++++++++--
 .../media/platform/qcom/iris/iris_platform_vpu2.c   | 10 ----------
 .../media/platform/qcom/iris/iris_platform_vpu3x.c  | 17 -----------------
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c   |  8 --------
 drivers/media/platform/qcom/iris/iris_vdec.c        |  8 ++++----
 7 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 4f205757647a..8119c639ec24 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -419,6 +419,12 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+static const u32 iris_hfi_gen1_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+};
+
 const struct iris_firmware_data iris_hfi_gen1_data = {
 	.init_hfi_ops = &iris_hfi_gen1_sys_ops_init,
 
@@ -427,6 +433,9 @@ const struct iris_firmware_data iris_hfi_gen1_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
 
+	.dec_fmts = iris_hfi_gen1_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
 	.dec_input_config_params_default_size =
@@ -668,6 +677,9 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 	.inst_fw_caps_enc = inst_fw_cap_gen1_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen1_ar50lt_enc),
 
+	.dec_fmts = iris_hfi_gen1_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
 	.dec_input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 110b5630902f..6c1d562ab8c2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1236,6 +1236,19 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+static const u32 iris_hfi_gen2_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
+};
+
+static const u32 iris_hfi_gen2_vpu2_dec_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+};
+
 const struct iris_firmware_data iris_hfi_gen2_data = {
 	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
 
@@ -1246,6 +1259,9 @@ const struct iris_firmware_data iris_hfi_gen2_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 
+	.dec_fmts = iris_hfi_gen2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
@@ -1317,6 +1333,9 @@ const struct iris_firmware_data iris_hfi_gen2_vpu2_data = {
 	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 
+	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
+
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
@@ -1934,6 +1953,8 @@ const struct iris_firmware_data iris_hfi_gen2_ar50lt_data = {
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_dec),
 	.inst_fw_caps_enc = inst_fw_cap_gen2_ar50lt_enc,
 	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_gen2_ar50lt_enc),
+	.dec_fmts = iris_hfi_gen2_vpu2_dec_fmts,
+	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen2_vpu2_dec_fmts),
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9743573ab083..317ba48e6305 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -255,6 +255,16 @@ struct iris_firmware_data {
 	const struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
 
+	/*
+	 * List of coded formats supported by this firmware generation, used to
+	 * advertise decode (bitstream) formats to userspace. This lives in the
+	 * firmware data because a single SoC can boot either firmware
+	 * generation, and some codecs (e.g. VP8, MPEG2, AV1) are only supported
+	 * by one generation.
+	 */
+	const u32 *dec_fmts;
+	unsigned int dec_fmts_size;
+
 	const u32 *dec_input_config_params_default;
 	unsigned int dec_input_config_params_default_size;
 	const u32 *dec_input_config_params_hevc;
@@ -317,8 +327,6 @@ struct iris_platform_data {
 	const char * const *controller_rst_tbl;
 	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
-	const u32 *inst_iris_fmts;
-	u32 inst_iris_fmts_size;
 	struct platform_inst_caps *inst_caps;
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 8f01cf7f6d49..37aee82a49f4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -36,12 +36,6 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
-static const u32 iris_fmts_vpu2_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-};
-
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
 	.min_frame_width = 128,
 	.max_frame_width = 8192,
@@ -89,8 +83,6 @@ const struct iris_platform_data sc7280_data = {
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu2_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
@@ -122,8 +114,6 @@ const struct iris_platform_data sm8250_data = {
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu2_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
 	.inst_caps = &platform_inst_cap_vpu2,
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index b8099d7ce556..30c95621fa0e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -50,13 +50,6 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
-static const u32 iris_fmts_vpu3x_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-	V4L2_PIX_FMT_AV1,
-};
-
 static const struct icc_info iris_icc_info_vpu3x[] = {
 	{ "cpu-cfg",    1000, 1000     },
 	{ "video-mem",  1000, 15000000 },
@@ -109,8 +102,6 @@ const struct iris_platform_data qcs8300_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_qcs8300,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -140,8 +131,6 @@ const struct iris_platform_data sm8550_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -179,8 +168,6 @@ const struct iris_platform_data sm8650_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -210,8 +197,6 @@ const struct iris_platform_data sm8750_data = {
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
@@ -247,8 +232,6 @@ const struct iris_platform_data x1p42100_data = {
 	.opp_clk_tbl = x1p42100_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_vpu3x_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
 	.inst_caps = &platform_inst_cap_sm8550,
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
index 99c839a0424f..e569817a0c80 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
@@ -25,12 +25,6 @@ static const struct iris_firmware_desc iris_vpu_ar50lt_p1_gen2_s6_desc = {
 	.fwname = "qcom/vpu/ar50lt_p1_gen2_s6.mbn",
 };
 
-static const u32 iris_fmts_ar50lt_dec[] = {
-	V4L2_PIX_FMT_H264,
-	V4L2_PIX_FMT_HEVC,
-	V4L2_PIX_FMT_VP9,
-};
-
 static const struct bw_info iris_bw_table_dec_ar50lt[] = {
 	{ ((1920 * 1080) / 256) * 60, 1564000, },
 	{ ((1920 * 1080) / 256) * 30,  791000, },
@@ -100,8 +94,6 @@ const struct iris_platform_data qcm2290_data = {
 	.opp_clk_tbl = iris_opp_clk_table_ar50lt,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
-	.inst_iris_fmts = iris_fmts_ar50lt_dec,
-	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_ar50lt_dec),
 	.inst_caps = &platform_inst_cap_ar50lt,
 	.tz_cp_config_data = tz_cp_config_ar50lt,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_ar50lt),
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9169b1335b5c..59200ca72ded 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -83,8 +83,8 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = inst->core->iris_platform_data->inst_iris_fmts;
-		size = inst->core->iris_platform_data->inst_iris_fmts_size;
+		fmt = inst->core->iris_firmware_data->dec_fmts;
+		size = inst->core->iris_firmware_data->dec_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (ubwc->ubwc_enc_version) {
@@ -128,8 +128,8 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = inst->core->iris_platform_data->inst_iris_fmts;
-		size = inst->core->iris_platform_data->inst_iris_fmts_size;
+		fmt = inst->core->iris_firmware_data->dec_fmts;
+		size = inst->core->iris_firmware_data->dec_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		if (ubwc->ubwc_enc_version) {

-- 
2.47.3


