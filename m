Return-Path: <linux-media+bounces-67204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWFtOyr5T2porQIAu9opvQ
	(envelope-from <linux-media+bounces-67204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DCE735189
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:40:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iJLET862;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=enn1jeou;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67204-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67204-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F552305D5D7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4CE3C0A02;
	Thu,  9 Jul 2026 19:37:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6C3BFE34
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625831; cv=none; b=Z3jsSikhcc8AdpZO9+Na6QCNgpkIqDPd0xw7g4PFeAR4CHQy2IbyKoO+sfuCnoOH3uCLHqumh0jWgG1SbYCCX2L6F9ji0H7E3hxfMMI1uhThjVmToV3SHyJSL3pxaFmNapFVhnOWgYBaKbNMbSTKYFxtwf9mwy2UB0lLe0VVfLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625831; c=relaxed/simple;
	bh=FBlUkz7zqZiMYy8H5QLRl+G2OTj0JcohsR/X5AK8r28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfsmFHfi35alHwVw6hS7ZzrXaiypOuUpZSdH7Rv5Qi/SA1/09/r2k727dT52NzgaTtY8QO59hOzVoBo0HyaU1S0MTGMWAnhVrE5XdSMX14SHvSUufp/KM4iiaqLtE/282bralKiwsAZuE0bhpH01RLUlC0ouBKT932HJgavFmlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJLET862; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enn1jeou; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXLeH2421978
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=; b=iJLET86215g0jo84
	t4j9W+aAoUrTSxJh1Xks+G7pCfp9m7G2eIA9ZepK8lqdaPwcYhB1jmEStsKYAS5U
	RBYtctmXdB9nmpY833D91rKFQqHkT0LMaBACOMHpNiy64r9GLUNa8nbr3VjrYSuh
	kEiy1G9nRUOB0/as1MkZIHmv20CzL7KRl+ZmwVYPc1xN2k3AKOJKeSSVOZTEO4E9
	qKgnbwv4GaES9e27t4TSbHtj6CqnibB+RhteaEakPIdAtgpF6d8WsOFdYaIrcpCb
	uAj5Qh8BfIEodbEQNQFBprGIQzD0O4t92xCBJiaRpqs7yPme3WaHFYfKO1sPv+3y
	4zMywQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9bqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e80385dbso60325137.1
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625828; x=1784230628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=;
        b=enn1jeouEUWqqFDC5ZB123g6RTVHUFqEmlDKPuVN2BDyZaNNDJCerHPHDIjjqQSaBw
         NE8OIN/aVH4qEC9BFTmEMWawsrSkG7sMcM02+qzVsqBRE2lhRqV1d4NnXILyIIcxMV6U
         AkNuvFv5kZEzcM1hEuMHtVM6QVYNuE+qMnEsdG0/R8ZqX+ANdzQrmO5YfdGSPW/Tusia
         7yFOL2oddT13CHcFU4n524lZTB3n9cXXxIGZFNEQk6FwdKcH3mK4Rwlk/nU2rSvaiF18
         GTY72nmkn3AemGTkTV5o74CruCNjT81+4Pgs5ORMJtGK4IDhrrBSEqYP2XGf+uxjB7+d
         jQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625828; x=1784230628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSS41Vfl6j8OHYOJtx4KK8DHEBVoUxAPVVpyeklwTyE=;
        b=hZJVETDvyLbcQHDErC/FKf7YCfFPwfT6PShScQIx86eGmACbl3LBkHVZrtLlCPqzt3
         wcpmNsIzVVVcOOexAgMjRLq4q+LALxfqk7bmaNRakTGm+JJOU+wWSjGhic1nwQW586rN
         MfRErfvH5AU4qLQsU4mJKRLGcfCXkIhIrUh2H6NE4yOOftUL+viXAc4bSlKrQ7krRpsA
         /ZOg2O+SNNXP+hp383fTU3j33XZkZF6paUt2iMi5SmU35nbAeSrpJR7UUBIvtHXb/e9r
         O9MKqZSnogw8guHvLZ/hzdcitTxQZhooYwrB0B30wtxW1sBQvQdNZLPkF1LxdSX+Gq8j
         yXZw==
X-Gm-Message-State: AOJu0Yzlak2WbgUkJ+7fAGjnTad+nZma/W9qfTraJWGCPgSDGjhshQ8C
	z6PUAslPoZQzkxz6tlfjXLnH1E0D2Wi9iqASjGFfLnHrTcpJo71/zbSNrl9es9jlbqT0PDSscXQ
	1JaKYcY1lbwCtlglMXkHjjA144Jh3VmyWMlMyiJg51oh3Vyi5bB+OZoFgLxLrWb072w==
X-Gm-Gg: AfdE7cnCPd7doyVsZfxQYpQTscOhjDAVOFWWFDd7k8pz09s5d0UoloiEjrgxLpK9G7f
	nFyVL40vVGZsM9Sp7Jm4HVENNx6y4Z/vp/ZZB0tScQ2kBiqeuxP6n3i+pXx5ZRIEAIDkS+Rhorj
	0e0UlVUO196Neuugv9dP6MWRpKMy4GM4eRO60sJS3CDU8UBb7lwq++m0O6R8PsKysAQEAf+Bzua
	5eAZ7/sRjp1W4wkNsNm8mVSMFJxF/MKs5WXKcy5N9NMdET161tQhiysLO9kX5hLLw9RcG1xzl+N
	HO4uHqbUNumpcU7IsESr4MHZN+TfS+Ozank/6pxhLYky/NtEkSOn0p9eyOP6GySgwMU+kHx2U6s
	GLGPU8Qt/gcBFE2JJaQ4YK6ASb4ExbenP6pdJwvshQ/++ZWSWWgQCk+wyR5sewX07CFsZkwTZPF
	UoMpN1ujZO1pM2DiW3sRMnInC0
X-Received: by 2002:a05:6102:5a93:b0:73f:63c5:f550 with SMTP id ada2fe7eead31-744e019ead4mr4826467137.19.1783625825767;
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
X-Received: by 2002:a05:6102:5a93:b0:73f:63c5:f550 with SMTP id ada2fe7eead31-744e019ead4mr4826443137.19.1783625825318;
        Thu, 09 Jul 2026 12:37:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:36:58 +0300
Subject: [PATCH 1/9] media: iris: translate Gen1 profile/level to HFI
 enumerants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-1-6af3ab578a7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FBlUkz7zqZiMYy8H5QLRl+G2OTj0JcohsR/X5AK8r28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/hcMGA2t91tOHXCt+OrJgMvhEhNDEwWXwkdn
 ZbRGrgcomeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XAAKCRCLPIo+Aiko
 1XG3B/9bBf7OyQ1dJFN+Vl+awordF6M7vO+edbFRWCdaCsLhvuLBAHGRciDJMhN69AqF5jCYZdQ
 ilepO/JFX7NL5H7yV2rejgdXoxlsY+pzCUzvK/7UB20ZICRc2kLa2HzxJCAX7jzxnaimohHN4qW
 FWdFNeketHKOrQ6lS302B9md99BUycAgdQjAz50YCrfzgseKoKSFYpeqoHiHdUBOhNSN1nqfAwc
 5KeRUW0bkowXsAZql2IKf+CMdd5nhM29U8WYsLekCaJT5jbgFTyjgkTTR0xJyGtCQKz/UMSlCXy
 QjR3+5WZDVeHL0fa/o7dgzO1eJQmZvcZGPa6yN9o+/3BjU49
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX889vydKLi9ou
 S48uiwq5AZcStWuFvvIrX276qDYgXZ7QC2BRJKEBcfLhsBor5HWvJ46l4dpTMMyPrgOdS2naEAX
 HoumX8x6VsFam05so4Qhy6CBPfZT3pAVRdcn35edD/2MtvSODORf4+pU6vZP9Glj8OrId9V+ntp
 KOdDER6LQv27TMYL5ijejvg/47xoTb4jRHn6o+21WK2/afw5YEf+xXo3DuPuwMhuY7PrLZMoCnb
 EO/Af+xnJsu+leMm+8KHY895Fy209Kug/Fv5hfrwnAuV49veFCRViw0QH4ZgaYvfPXVJ/7Kx1Qi
 BBD8Y5DCbP5vYzNE195NZF1Ie+6ZSkGz+yp39fFEnR0vN09Tgo8lkL+BJqXy3aXk6/0iZ6ej5oN
 tsZeVXQA5NvQ5V36Yn4uEpttYg/xwaYa7PFTPwuPGgDuKWvxwxeJWl6/BkTqjJfNabWXHjHtSUL
 fZDaEz3bMUBvZCzqCzA==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4ff864 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aNvB8ZwWyuXJJ2m3keoA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: nnz7DFtk6JyCEH5jD3dSH7iTr8W_pX3P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfXxGiZ/2Tssd+i
 M3IaCEzWH7LhS+UzgjWDaw2WGCMJSIIzgmVvRFB79Ub0jsNknxT0ewgW6N/9dCwjIGXF4/Wp+gY
 5xH2tgK5S+2votG4KjIJdSICu/ZzKxU=
X-Proofpoint-ORIG-GUID: nnz7DFtk6JyCEH5jD3dSH7iTr8W_pX3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090193
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
	TAGGED_FROM(0.00)[bounces-67204-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28DCE735189

The Gen1 firmware expects the profile and level in the
HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT property as HFI-specific
enumerants (a one-hot bitmask), but the iris driver passed the raw V4L2
profile and level values straight through. Only the V4L2 H264 high
profile happened to match its HFI value (both 0x4); every other profile
and all levels were programmed with a wrong value.

Translate the V4L2 profile and level to the HFI enumerants per codec
before building the property, mirroring the mapping the venus driver
performs for the same firmware interface.

Fixes: d22037f3fd33 ("media: iris: Set platform capabilities to firmware for encoder video device")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 109 +++++++++++++++++++--
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  44 +++++++++
 2 files changed, 144 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index c4baabbacefd..ed9fef2aec08 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -479,6 +479,105 @@ static int iris_hfi_gen1_session_drain(struct iris_inst *inst, u32 plane)
 	return -EINVAL;
 }
 
+struct iris_hfi_gen1_id_mapping {
+	u32 hfi_id;
+	u32 v4l2_id;
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_profiles[] = {
+	{ HFI_H264_PROFILE_BASELINE, V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
+	{ HFI_H264_PROFILE_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
+	{ HFI_H264_PROFILE_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
+	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
+	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
+	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
+	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_h264_levels[] = {
+	{ HFI_H264_LEVEL_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
+	{ HFI_H264_LEVEL_1b, V4L2_MPEG_VIDEO_H264_LEVEL_1B },
+	{ HFI_H264_LEVEL_11, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
+	{ HFI_H264_LEVEL_12, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
+	{ HFI_H264_LEVEL_13, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
+	{ HFI_H264_LEVEL_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
+	{ HFI_H264_LEVEL_21, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
+	{ HFI_H264_LEVEL_22, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
+	{ HFI_H264_LEVEL_3, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
+	{ HFI_H264_LEVEL_31, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
+	{ HFI_H264_LEVEL_32, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
+	{ HFI_H264_LEVEL_4, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
+	{ HFI_H264_LEVEL_41, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
+	{ HFI_H264_LEVEL_42, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
+	{ HFI_H264_LEVEL_5, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
+	{ HFI_H264_LEVEL_51, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+	{ HFI_H264_LEVEL_52, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_profiles[] = {
+	{ HFI_HEVC_PROFILE_MAIN, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN },
+	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
+	{ HFI_HEVC_PROFILE_MAIN10, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 },
+};
+
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_levels[] = {
+	{ HFI_HEVC_LEVEL_1, V4L2_MPEG_VIDEO_HEVC_LEVEL_1 },
+	{ HFI_HEVC_LEVEL_2, V4L2_MPEG_VIDEO_HEVC_LEVEL_2 },
+	{ HFI_HEVC_LEVEL_21, V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 },
+	{ HFI_HEVC_LEVEL_3, V4L2_MPEG_VIDEO_HEVC_LEVEL_3 },
+	{ HFI_HEVC_LEVEL_31, V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 },
+	{ HFI_HEVC_LEVEL_4, V4L2_MPEG_VIDEO_HEVC_LEVEL_4 },
+	{ HFI_HEVC_LEVEL_41, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 },
+	{ HFI_HEVC_LEVEL_5, V4L2_MPEG_VIDEO_HEVC_LEVEL_5 },
+	{ HFI_HEVC_LEVEL_51, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 },
+	{ HFI_HEVC_LEVEL_52, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 },
+	{ HFI_HEVC_LEVEL_6, V4L2_MPEG_VIDEO_HEVC_LEVEL_6 },
+	{ HFI_HEVC_LEVEL_61, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 },
+	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
+};
+
+static u32 iris_hfi_gen1_find_hfi_id(u32 v4l2_id,
+				     const struct iris_hfi_gen1_id_mapping *array,
+				     unsigned int array_sz)
+{
+	unsigned int i;
+
+	for (i = 0; i < array_sz; i++)
+		if (v4l2_id == array[i].v4l2_id)
+			return array[i].hfi_id;
+
+	return 0;
+}
+
+/*
+ * The Gen1 firmware expects profile and level as HFI enumerants, while the
+ * client provides raw V4L2 values. Translate them per codec, mirroring the
+ * mapping performed by the venus driver for the same firmware interface.
+ */
+static void
+iris_hfi_gen1_profile_level(struct iris_inst *inst, u32 v4l2_pf, u32 v4l2_lvl,
+			    struct hfi_profile_level *pl)
+{
+	switch (inst->codec) {
+	case V4L2_PIX_FMT_H264:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_h264_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_h264_profiles));
+		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_h264_levels,
+						      ARRAY_SIZE(iris_hfi_gen1_h264_levels));
+		break;
+	case V4L2_PIX_FMT_HEVC:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_hevc_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_hevc_profiles));
+		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_hevc_levels,
+						      ARRAY_SIZE(iris_hfi_gen1_hevc_levels));
+		break;
+	default:
+		pl->profile = 0;
+		pl->level = 0;
+		break;
+	}
+}
+
 static int
 iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *packet,
 					  struct iris_inst *inst, u32 ptype, void *pdata)
@@ -582,15 +681,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 	case HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT: {
 		struct hfi_profile_level *in = pdata, *pl = prop_data;
 
-		pl->level = in->level;
-		pl->profile = in->profile;
-		if (pl->profile <= 0)
-			/* Profile not supported, falling back to high */
-			pl->profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
-
-		if (!pl->level)
-			/* Level not supported, falling back to 1 */
-			pl->level = 1;
+		iris_hfi_gen1_profile_level(inst, in->profile, in->level, pl);
 
 		packet->shdr.hdr.size += sizeof(*pl);
 		break;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index bb495a1d2623..2702f255bc04 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -17,6 +17,50 @@
 #define HFI_VIDEO_CODEC_HEVC				0x00002000
 #define HFI_VIDEO_CODEC_VP9				0x00004000
 
+#define HFI_H264_PROFILE_BASELINE			0x00000001
+#define HFI_H264_PROFILE_MAIN				0x00000002
+#define HFI_H264_PROFILE_HIGH				0x00000004
+#define HFI_H264_PROFILE_STEREO_HIGH			0x00000008
+#define HFI_H264_PROFILE_MULTIVIEW_HIGH			0x00000010
+#define HFI_H264_PROFILE_CONSTRAINED_BASE		0x00000020
+#define HFI_H264_PROFILE_CONSTRAINED_HIGH		0x00000040
+
+#define HFI_H264_LEVEL_1				0x00000001
+#define HFI_H264_LEVEL_1b				0x00000002
+#define HFI_H264_LEVEL_11				0x00000004
+#define HFI_H264_LEVEL_12				0x00000008
+#define HFI_H264_LEVEL_13				0x00000010
+#define HFI_H264_LEVEL_2				0x00000020
+#define HFI_H264_LEVEL_21				0x00000040
+#define HFI_H264_LEVEL_22				0x00000080
+#define HFI_H264_LEVEL_3				0x00000100
+#define HFI_H264_LEVEL_31				0x00000200
+#define HFI_H264_LEVEL_32				0x00000400
+#define HFI_H264_LEVEL_4				0x00000800
+#define HFI_H264_LEVEL_41				0x00001000
+#define HFI_H264_LEVEL_42				0x00002000
+#define HFI_H264_LEVEL_5				0x00004000
+#define HFI_H264_LEVEL_51				0x00008000
+#define HFI_H264_LEVEL_52				0x00010000
+
+#define HFI_HEVC_PROFILE_MAIN				0x00000001
+#define HFI_HEVC_PROFILE_MAIN10				0x00000002
+#define HFI_HEVC_PROFILE_MAIN_STILL_PIC			0x00000004
+
+#define HFI_HEVC_LEVEL_1				0x00000001
+#define HFI_HEVC_LEVEL_2				0x00000002
+#define HFI_HEVC_LEVEL_21				0x00000004
+#define HFI_HEVC_LEVEL_3				0x00000008
+#define HFI_HEVC_LEVEL_31				0x00000010
+#define HFI_HEVC_LEVEL_4				0x00000020
+#define HFI_HEVC_LEVEL_41				0x00000040
+#define HFI_HEVC_LEVEL_5				0x00000080
+#define HFI_HEVC_LEVEL_51				0x00000100
+#define HFI_HEVC_LEVEL_52				0x00000200
+#define HFI_HEVC_LEVEL_6				0x00000400
+#define HFI_HEVC_LEVEL_61				0x00000800
+#define HFI_HEVC_LEVEL_62				0x00001000
+
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001

-- 
2.47.3


