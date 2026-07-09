Return-Path: <linux-media+bounces-67177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F7inEAypT2r8mAIAu9opvQ
	(envelope-from <linux-media+bounces-67177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F702731E2D
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:58:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QVA9WGru;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eDnwKjUw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67177-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67177-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB353312CC71
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9933136DA1C;
	Thu,  9 Jul 2026 13:42:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A7367B69
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604561; cv=none; b=WleJOz1uIRlh5VbZ2sNPSPgbicY/g1oqMjIP8XvAZdy6HEmh49e1365uPhQWIinOtUsJixyYW+957DVWiaVkLAFvZK8iWvFvsIXPaaEESEVdrMdlTs5PdYizP5jMKyai7woWkD/yVYIdjvKizHiZhSoe3IjMehh95UZl8c9ePEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604561; c=relaxed/simple;
	bh=GCPQH5w7/rXEPgF8XRrkLM5FeWe4gnAiLc0TkpPcUyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uXbV//7aRJonbzxsFrm4L5gxReUOksLgEjrMHxfp0YUYIsFYX+0KOGJZDfJT32J6oA9eDzSf1wV+U7mPEYqbQQ3QswXEy3cXhZLWOWMUqDGA795SUQjWDzwt+jGidpEyuLp9K6cgjx4MHPARPvI/gxNYRWpR19bPNzPfxk2TvSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVA9WGru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDnwKjUw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNmj41628983
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQE6+MJPCd5uGV3zgYdDWhDG5MkonRZ+C3JpR8S7zCQ=; b=QVA9WGruCmehFLUz
	R1Q7n81v0uvrs2+Tj/FL8hGaG2WZGXy6k69odoLzBZR0EjKXAeuRS/hVaQqSvMEt
	gl0ncPG0mREdQ27oyy2h8Q3CRKuZtyiOVEMQwiL0MoJII72kX+XgkL4r7o/l+DG9
	IQn+9B797l6NGvg/9S2EzHM5fcwYxviZZw2EJkhxniXWdjWeWMWOLr1kuR8jFwh1
	liGUH7wpIS8KZZMVEAIDU6wW+XuCkvVvUNDLAIRdIq0Uqh4QiI6pf4BoeGIKxG6n
	an0uwVAEi0bK8hY1sK1qWPc+gC5CKZkEw8safTMXrQexZ7TIgw8goZso51lrUN/b
	5W2/Hw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvuxmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c36621so475244137.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604557; x=1784209357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQE6+MJPCd5uGV3zgYdDWhDG5MkonRZ+C3JpR8S7zCQ=;
        b=eDnwKjUwDdHePbZWCBQJN7nhmurV9JJkGD0lHo1M5WcIkTy6IKv3aPMo5AjMaKOdc9
         X8Pis2vFJJJfnUWDVuNGVeNYIgwN0aTuN05Qg4g0yaIDSrj9/KGxEFbMP7Gqf0EDwxWf
         NtZzTnsgojDf/EWvZLddAyKzRlDrr1YnLmcyIB03+Po+45MyL0gQTdrIfLzWytFS51Vp
         dTBwBWgKd4SNmQqM7/6Rky2v2aof1KmMh7Xk4JWGmR70G/KFXb9qqtyozOhl6cOhOk8u
         qUX8op/BshKNhB294XGI7X6xGREvfLjo9ohPXXEAuK0p8+/NHC+RPgKP0ZrI79P1EX0J
         +m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604557; x=1784209357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQE6+MJPCd5uGV3zgYdDWhDG5MkonRZ+C3JpR8S7zCQ=;
        b=ZIj8boTeUOmr+EWOppzsGnQ6JGDedP2P2VKV8DdC84vM9+hktLUsO/cQalSoP8QOi/
         tskLB/wfQs7wHBpTb9lDkMw+5WE8/IUveA2mZZXncOIcHTTCGZ7J+F56A+APM/tQASzC
         Qw4ROYM0Aei7WGC5TwboliaqF6C/prqlIHQQOiTS1rQuFlJv2Ktb4OL+L/e9LAAeq47f
         UGqOhYfcbK1gPUv9DY6DCtILgBC3k9ynv972jeyXIp+2ZKzkEZoKPovRLQ15b/sn9N3L
         OdMFzQxfp/bALjqoaC01vkzrE7Oeyp6GKpKanRCCH5e6BnPPcXoQpHyyoUvLUvWnFkxw
         VVTg==
X-Gm-Message-State: AOJu0YyrHabD9oqrwXTFb9S0J3DsgrprxVJyhY7zNWf6e084VyG+//3H
	SeJpkfu/xbOtmnqyiO7LGaFu89n0vf6HaqECfbHXfb7gh8i69fhM5cywDnzcFGH8Rmz5Exytf0R
	4NThGcqwh4YAfi+CIxPILpbuhrPX73SW6l0sKfmyNELkBw7E1zxdUjP1Tr51d9k1BVw==
X-Gm-Gg: AfdE7cmtMTrlsgmIQvEwuUtEqFs45ZqoO9jKDgslUo7o0OXbPhYKxLqsCi4HvdVupzD
	tcccbNUXjd6B+imzgUgBeHg5OhxXQPaBaGgPKLGMWFVyy5sOb0DmH9hhBt9fpuIWpqAejSXszMd
	2EFuUd3PcaHizvCgD3s21WPcdcMIHgopLk7yEtyzpMmT3OXULKYcv/GMjsj7D1U6Qb+3EeOOSf4
	zodKpKBLysH4jKPED8I3fNHzVxW3T8/4Iv2uWotI5NDwNtxBgSV8gTrOr48tJ1NqABEumDc8Pop
	4GW57lkbwoGvz5H0FTxOH9bASMuFDaFu0GLVpvOuzSv0mqqu47VpsZgztq1LDp0nY+394Trfv2E
	jLaKoEUIDxQ6shGAkPs3fjB6vxCHHQZWVUrLDU3hgbGEAQgAcq0lVCfbzflSNnB0PNdSM7dMvvc
	3O4T9tF9CofkyfoxLEm8iDTI8z
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr4470929137.10.1783604557158;
        Thu, 09 Jul 2026 06:42:37 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr4470892137.10.1783604556515;
        Thu, 09 Jul 2026 06:42:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:06 +0300
Subject: [PATCH v7 15/18] media: iris: Introduce buffer size calculations
 for AR50LT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-15-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=25554;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2S7a79XvhCvdU+XnLSgvmoIce7pWK5/Yk8be0XpuOYA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5b/UrXn0qqL9Jye8p6/4/Jp7SYhncMRYQ6XVB8fXxCV8
 bn7XFxqJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmIl3EwdC1O4RF++ipG0fm
 qv5/sPNSr4PBV3d3A0H2JWWXOi5fUDo7e+EPi+oT07/zRxzflPGopKNjNl/HofMu/CLCNxJSNYy
 WGTT/NNmwb+/8+On5QTtWfpLaKibVwz2PpUnc7pylbEfKD53Va43jM1n2XGOrDn+w++hsvsBIqa
 zXi44Yxu69I97dw8z/tYSB6Xbu37uRmh56gdo2zm6rbudVBu+bu8Ug1Xf5/+3a+wVdFubXijxeX
 9Gr2ztl4hn383EG+f8EGo57LyuOcKgIfvSwpHrVK1U+7dN7JWz+xf3yn9Jdc/7iOo4989nU/piK
 NE+t6jTersjo6T5VXD1be8OtiuJPtT6JARFNdvxvpaojAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX7KpZ3KNepWH/
 v2hklcFsjKaqlWdPIUjS3GuCUItfKwMIuebYFCGFLt9Byf/a80EzdwhpAeB+DhX6P/0dDoBaU+E
 wpD74VdCiGfh8pIcUbBn5kI0OcEs8uU=
X-Proofpoint-GUID: AJxO8ByCh5UheCsD8pnwP8UOEXMslMbf
X-Proofpoint-ORIG-GUID: AJxO8ByCh5UheCsD8pnwP8UOEXMslMbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXyuxOFrGWvYbk
 EWuga/jmqxIyfmWy7k2MDVG0SfOD+MXjqRjJbR8zZC6KkVEDeaQ5ID/eO5+2dECdPie0ih1l3Uh
 uxm53s4GeUm1x2Dl8mLLjqqYX8mJWILndHBGBaHnCP44tTjjvXFsoVaRF9kzDWZ6EdvGeAdWNvm
 ArOV74fcHWyFK/y53VbU29rxXAUmJhIM6UBSVeF2+oS3QQ0SFpjtjlmEcs7XLueMzZFRApmb4LX
 nF401ixW01s2m+iPNi66rwWW/A17kkWssQiKthAfbBNcG/1l0BkGA6fcw3rEVboL2kbuHu6AtAN
 7FITdHTReaJRV7VPplE5AiLQD2nJiQuCKv7MTSpUW/5rAJIJCWHKlZc92iauoZKOElaRfxK1V9a
 r9I/xYjR9G83znF3RnxeFv3DgsqpFy2d0DBC6ZMkMlNdvRx8CohNc0sg90m7VuHqT9gvr5FHa4d
 l19RWAOdV1NurHAabXw==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4fa54e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F8FdV_JuWmuLAlCLl2kA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67177-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F702731E2D

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Introduces AR50LT  buffer size calculation for both encoder and
decoder. Reuse the buffer size calculation which are common, while
adding the AR50LT specific ones separately.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 365 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 +++
 2 files changed, 402 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 511502d4ea6c..00dbb091c54e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -50,6 +50,26 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
 	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
 }
 
+static u32 hfi_buffer_bin_h264d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 n_aligned_h = ALIGN(frame_height, 16);
+	u32 n_aligned_w = ALIGN(frame_width, 16);
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = ((n_aligned_w * n_aligned_h * 3) >> 1);
+	if (size_yuv <= 1920 * 1088 * 3 / 2) {
+		size_bin_hdr = size_yuv * H264_CABAC_HDR_RATIO_SM_TOT;
+		size_bin_res = size_yuv * H264_CABAC_RES_RATIO_SM_TOT;
+	} else {
+		size_bin_hdr = (size_yuv * 3) / 5;
+		size_bin_res = (size_yuv * 3) / 2;
+	}
+	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
+	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
+
+	return size_bin_hdr + size_bin_res;
+}
+
 static u32 size_av1d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 size_yuv, size_bin_hdr, size_bin_res;
@@ -103,6 +123,19 @@ static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pi
 	return _size * num_vpp_pipes;
 }
 
+static u32 hfi_buffer_bin_vp9d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 size_yuv, size;
+
+	size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
+	size_yuv = ALIGN(size_yuv, DMA_ALIGNMENT);
+
+	size = ALIGN(((max(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 6) / 5, DMA_ALIGNMENT) +
+		ALIGN(((max(size_yuv, VPX_DECODER_FRAME_BIN_BUFFER_SIZE)) * 4), DMA_ALIGNMENT);
+
+	return size;
+}
+
 static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 n_aligned_w = ALIGN(frame_width, 16);
@@ -111,6 +144,27 @@ static u32 hfi_buffer_bin_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_p
 	return size_h265d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
 }
 
+static u32 hfi_buffer_bin_h265d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 n_aligned_w = ALIGN(frame_width, 16);
+	u32 n_aligned_h = ALIGN(frame_height, 16);
+
+	u32 size_yuv, size_bin_hdr, size_bin_res;
+
+	size_yuv = ((n_aligned_w * n_aligned_h * 3) >> 1);
+	if (size_yuv <= ((BIN_BUFFER_THRESHOLD * 3) >> 1)) {
+		size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_SM_TOT;
+		size_bin_res = size_yuv * H265_CABAC_RES_RATIO_SM_TOT;
+	} else {
+		size_bin_hdr = (size_yuv * 41) / 50;
+		size_bin_res = (size_yuv * 59) / 50;
+	}
+	size_bin_hdr = ALIGN(size_bin_hdr, DMA_ALIGNMENT);
+	size_bin_res = ALIGN(size_bin_res, DMA_ALIGNMENT);
+
+	return size_bin_hdr + size_bin_res;
+}
+
 static u32 hfi_buffer_comv_h264d(u32 frame_width, u32 frame_height, u32 _comv_bufcount)
 {
 	u32 frame_height_in_mbs = DIV_ROUND_UP(frame_height, 16);
@@ -174,6 +228,14 @@ static u32 size_h264d_bse_cmd_buf(u32 frame_height)
 		SIZE_H264D_BSE_CMD_PER_BUF;
 }
 
+static u32 size_h264d_bse_cmd_buf_ar50lt(u32 frame_height)
+{
+	u32 height = ALIGN(frame_height, 32);
+
+	return min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
+		SIZE_H264D_BSE_CMD_PER_BUF;
+}
+
 static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
 {
 	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
@@ -185,6 +247,18 @@ static u32 size_h265d_bse_cmd_buf(u32 frame_width, u32 frame_height)
 	return _size;
 }
 
+static u32 size_h265d_bse_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
+			    NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+
+	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
+	_size = 2 * _size * SIZE_H265D_BSE_CMD_PER_BUF;
+
+	return _size;
+}
+
 static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
 {
 	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
@@ -195,6 +269,13 @@ static u32 hfi_buffer_persist_h265d(u32 rpu_enabled)
 		     DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_persist_h265d_ar50lt(void)
+{
+	return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 +
+		      H265_NUM_TILE * sizeof(u32) + NUM_HW_PIC_BUF * SIZE_SEI_USERDATA),
+		     DMA_ALIGNMENT);
+}
+
 static inline
 u32 hfi_iris3_vp9d_comv_size(void)
 {
@@ -212,6 +293,13 @@ static u32 hfi_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_buffer_persist_vp9d_ar50lt(void)
+{
+	return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE, DMA_ALIGNMENT) +
+		ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) +
+		ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT);
+}
+
 static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
 {
 	u32 size, height = ALIGN(frame_height, 32);
@@ -222,6 +310,16 @@ static u32 size_h264d_vpp_cmd_buf(u32 frame_height)
 	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
 }
 
+static u32 size_h264d_vpp_cmd_buf_ar50lt(u32 frame_height)
+{
+	u32 size, height = ALIGN(frame_height, 32);
+
+	size = min_t(u32, (DIV_ROUND_UP(height, 16) * 12), H264D_MAX_SLICE) *
+		SIZE_H264D_VPP_CMD_PER_BUF;
+
+	return size > VPP_CMD_MAX_SIZE ? VPP_CMD_MAX_SIZE : size;
+}
+
 static u32 hfi_buffer_persist_h264d(void)
 {
 	return ALIGN(SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264 +
@@ -230,6 +328,11 @@ static u32 hfi_buffer_persist_h264d(void)
 		    DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_persist_h264d_ar50lt(void)
+{
+	return ALIGN((SIZE_SLIST_BUF_H264 * NUM_SLIST_BUF_H264), DMA_ALIGNMENT);
+}
+
 static u32 hfi_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
 {
 	u32 comv_size, size;
@@ -255,6 +358,17 @@ static u32 hfi_buffer_non_comv_h264d(u32 frame_width, u32 frame_height, u32 num_
 	return ALIGN(size, DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_non_comv_h264d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 size_bse = size_h264d_bse_cmd_buf_ar50lt(frame_height);
+	u32 size_vpp = size_h264d_vpp_cmd_buf_ar50lt(frame_height);
+	u32 size = ALIGN(size_bse, DMA_ALIGNMENT) +
+		ALIGN(size_vpp, DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H264D_HW_PIC_T), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
 {
 	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
@@ -269,6 +383,20 @@ static u32 size_h265d_vpp_cmd_buf(u32 frame_width, u32 frame_height)
 	return _size;
 }
 
+static u32 size_h265d_vpp_cmd_buf_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 _size = ALIGN(((ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+			   (ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS)) *
+			  NUM_HW_PIC_BUF, DMA_ALIGNMENT);
+	_size = min_t(u32, _size, H265D_MAX_SLICE_AR50LT + 1);
+	_size = ALIGN(_size, 4);
+	_size = 2 * _size * SIZE_H265D_VPP_CMD_PER_BUF_AR50LT;
+	if (_size > VPP_CMD_MAX_SIZE)
+		_size = VPP_CMD_MAX_SIZE;
+
+	return _size;
+}
+
 static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 {
 	u32 _size_bse = size_h265d_bse_cmd_buf(frame_width, frame_height);
@@ -285,6 +413,20 @@ static u32 hfi_buffer_non_comv_h265d(u32 frame_width, u32 frame_height, u32 num_
 	return ALIGN(_size, DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_non_comv_h265d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 _size_bse = size_h265d_bse_cmd_buf_ar50lt(frame_width, frame_height);
+	u32 _size_vpp = size_h265d_vpp_cmd_buf_ar50lt(frame_width, frame_height);
+	u32 _size = ALIGN(_size_bse, DMA_ALIGNMENT) +
+		ALIGN(_size_vpp, DMA_ALIGNMENT) +
+		ALIGN(2 * sizeof(u16) *
+		(ALIGN(frame_width, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS) *
+		(ALIGN(frame_height, LCU_MAX_SIZE_PELS) / LCU_MIN_SIZE_PELS), DMA_ALIGNMENT) +
+		ALIGN(SIZE_HW_PIC(SIZE_H265D_HW_PIC_T), DMA_ALIGNMENT);
+
+	return ALIGN(_size, DMA_ALIGNMENT);
+}
+
 static u32 size_vpss_lb(u32 frame_width, u32 frame_height)
 {
 	u32 opb_lb_wr_llb_y_buffer_size, opb_lb_wr_llb_uv_buffer_size;
@@ -317,6 +459,13 @@ u32 size_h265d_lb_fe_top_data(u32 frame_width, u32 frame_height)
 		(ALIGN(frame_width, 64) + 8) * 2;
 }
 
+static inline
+u32 size_h265d_lb_fe_top_data_ar50lt(u32 frame_width, u32 frame_height)
+{
+	return ALIGN(MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE *
+		(ALIGN(frame_width, 64) + 8), DMA_ALIGNMENT) * 2;
+}
+
 static inline
 u32 size_h265d_lb_fe_top_ctrl(u32 frame_width, u32 frame_height)
 {
@@ -348,6 +497,17 @@ u32 size_h265d_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
 		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
 }
 
+static inline
+u32 size_h265d_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
+{
+	return max_t(u32, ((frame_height + 16 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
+		max_t(u32, ((frame_height + 32 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
+		((frame_height + 64 - 1) / 8) *
+		MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
+}
+
 static inline
 u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
 {
@@ -355,6 +515,13 @@ u32 size_h265d_lb_pe_top_data(u32 frame_width, u32 frame_height)
 		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
 }
 
+static inline
+u32 size_h265d_lb_pe_top_data_ar50lt(u32 frame_width, u32 frame_height)
+{
+	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT *
+		(ALIGN(frame_width, LCU_MIN_SIZE_PELS) / LCU_MIN_SIZE_PELS);
+}
+
 static inline
 u32 size_h265d_lb_vsp_top(u32 frame_width, u32 frame_height)
 {
@@ -404,6 +571,25 @@ u32 hfi_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb, u32 nu
 	return ALIGN((_size + vpss_lb_size), DMA_ALIGNMENT);
 }
 
+static inline
+u32 hfi_buffer_line_h265d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+
+	size = ALIGN(size_h265d_lb_fe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_fe_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_pe_top_data_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_vsp_left(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h265d_lb_recon_dma_metadata_wr(frame_width, frame_height), DMA_ALIGNMENT) * 4 +
+		ALIGN(size_h265d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static inline
 u32 size_vpxd_lb_fe_left_ctrl(u32 frame_width, u32 frame_height)
 {
@@ -438,6 +624,17 @@ u32 size_vpxd_lb_se_left_ctrl(u32 frame_width, u32 frame_height)
 			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
 }
 
+static inline
+u32 size_vpxd_lb_se_left_ctrl_ar50lt(u32 frame_width, u32 frame_height)
+{
+	return max_t(u32, ((frame_height + 15) >> 4) *
+		     MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT,
+		     max_t(u32, ((frame_height + 31) >> 5) *
+			   MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT,
+			   ((frame_height + 63) >> 6) *
+			   MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT));
+}
+
 static inline
 u32 size_vpxd_lb_recon_dma_metadata_wr(u32 frame_width, u32 frame_height)
 {
@@ -492,6 +689,17 @@ u32 hfi_iris3_vp9d_lb_size(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
 		ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
 }
 
+static inline
+u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min)
+{
+	return ALIGN(size_vpxd_lb_fe_left_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_se_left_ctrl_ar50lt(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_lb_pe_top_data(frame_width, frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_vp9d_lb_fe_top_data(frame_width, frame_height), DMA_ALIGNMENT);
+}
+
 static inline
 u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min, bool is_opb,
 			 u32 num_vpp_pipes)
@@ -529,6 +737,23 @@ static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
 	return ALIGN((size + vpss_lb_size), DMA_ALIGNMENT);
 }
 
+static u32 hfi_buffer_line_h264d_ar50lt(u32 frame_width, u32 frame_height)
+{
+	u32 size;
+
+	size = ALIGN(size_h264d_lb_fe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_fe_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_fe_left_ctrl(frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_se_top_ctrl_ar50lt(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_se_left_ctrl_ar50lt(frame_height), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_pe_top_data_ar50lt(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_vsp_top(frame_width), DMA_ALIGNMENT) +
+		ALIGN(size_h264d_lb_recon_dma_metadata_wr(frame_height), DMA_ALIGNMENT) * 2 +
+		ALIGN(size_h264d_qp(frame_width, frame_height), DMA_ALIGNMENT);
+
+	return ALIGN(size, DMA_ALIGNMENT);
+}
+
 static u32 size_av1d_lb_opb_wr1_nv12_ubwc(u32 frame_width, u32 frame_height)
 {
 	u32 size, y_width, y_width_a = 128;
@@ -724,6 +949,22 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 iris_vpu_ar50lt_dec_bin_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_bin_h264d_ar50lt(width, height);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_bin_h265d_ar50lt(width, height);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_bin_vp9d_ar50lt(width, height);
+
+	return 0;
+}
+
 static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 {
 	u32 num_comv = VIDEO_MAX_FRAME;
@@ -785,6 +1026,18 @@ static u32 iris_vpu_dec_persist_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 iris_vpu_ar50lt_dec_persist_size(struct iris_inst *inst)
+{
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_persist_h264d_ar50lt();
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_persist_h265d_ar50lt();
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_persist_vp9d_ar50lt();
+
+	return 0;
+}
+
 static u32 iris_vpu_dec_dpb_size(struct iris_inst *inst)
 {
 	if (iris_split_mode_enabled(inst))
@@ -808,6 +1061,20 @@ static u32 iris_vpu_dec_non_comv_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 iris_vpu_ar50lt_dec_non_comv_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_non_comv_h264d_ar50lt(width, height);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_non_comv_h265d_ar50lt(width, height);
+
+	return 0;
+}
+
 static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
@@ -833,6 +1100,23 @@ static u32 iris_vpu_dec_line_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 iris_vpu_ar50lt_dec_line_size(struct iris_inst *inst)
+{
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+	u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
+
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_line_h264d_ar50lt(width, height);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_line_h265d_ar50lt(width, height);
+	else if (inst->codec == V4L2_PIX_FMT_VP9)
+		return hfi_buffer_line_vp9d_ar50lt(width, height, out_min_count);
+
+	return 0;
+}
+
 static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 {
 	return iris_vpu_dec_comv_size(inst) +
@@ -840,6 +1124,13 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 		iris_vpu_dec_line_size(inst);
 }
 
+static u32 iris_vpu_ar50lt_dec_scratch1_size(struct iris_inst *inst)
+{
+	return iris_vpu_dec_comv_size(inst) +
+		iris_vpu_ar50lt_dec_non_comv_size(inst) +
+		iris_vpu_ar50lt_dec_line_size(inst);
+}
+
 static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
 {
 	if (is_rotation_90_or_270(inst))
@@ -1470,6 +1761,15 @@ u32 hfi_buffer_dpb_enc(u32 frame_width, u32 frame_height, bool is_ten_bit)
 	return size;
 }
 
+static inline
+u32 hfi_buffer_dpb_enc_ar50lt(u32 frame_width, u32 frame_height, bool is_ten_bit)
+{
+	if (!is_ten_bit)
+		return size_enc_ref_buffer(frame_width, frame_height);
+	else
+		return size_enc_ten_bit_ref_buffer(frame_width, frame_height);
+}
+
 static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
 {
 	return HFI_BUFFER_ARP_ENC;
@@ -1494,6 +1794,16 @@ u32 hfi_buffer_vpss_enc(u32 dswidth, u32 dsheight, bool ds_enable,
 	return 0;
 }
 
+static inline
+u32 hfi_buffer_vpss_enc_ar50lt(u32 dswidth, u32 dsheight, bool ds_enable,
+			       u32 blur, bool is_ten_bit)
+{
+	if (ds_enable || blur)
+		return hfi_buffer_dpb_enc_ar50lt(dswidth, dsheight, is_ten_bit);
+
+	return 0;
+}
+
 static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
 					  u32 lcu_size, u32 num_ref,
 					  bool ten_bit, u32 num_vpp_pipes,
@@ -1752,6 +2062,16 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
 	return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
 }
 
+static u32 iris_vpu_ar50lt_enc_vpss_size(struct iris_inst *inst)
+{
+	u32 ds_enable = is_scaling_enabled(inst);
+	struct v4l2_format *f = inst->fmt_dst;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	return hfi_buffer_vpss_enc_ar50lt(width, height, ds_enable, 0, 0);
+}
+
 static inline u32 size_dpb_opb(u32 height, u32 lcu_size)
 {
 	u32 max_tile_height = ((height + lcu_size - 1) / lcu_size) * lcu_size + 8;
@@ -2199,6 +2519,51 @@ u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type
 	return inst->buffers[buffer_type].size;
 }
 
+u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_ar50lt_dec_bin_size      },
+		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_NON_COMV,    iris_vpu_ar50lt_dec_non_comv_size },
+		{BUF_LINE,        iris_vpu_ar50lt_dec_line_size     },
+		{BUF_PERSIST,     iris_vpu_ar50lt_dec_persist_size  },
+		{BUF_DPB,         iris_vpu_dec_dpb_size             },
+		{BUF_SCRATCH_1,   iris_vpu_ar50lt_dec_scratch1_size },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size             },
+		{BUF_COMV,        iris_vpu_enc_comv_size            },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size        },
+		{BUF_LINE,        iris_vpu_enc_line_size            },
+		{BUF_ARP,         iris_vpu_enc_arp_size             },
+		{BUF_VPSS,        iris_vpu_ar50lt_enc_vpss_size     },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size        },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size        },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 static u32 internal_buffer_count(struct iris_inst *inst,
 				 enum iris_buffer_type buffer_type)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 1d07137c70cd..2085e316a6bd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -61,17 +61,26 @@ struct iris_inst;
 #define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
 #define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
 #define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
+#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE_AR50LT (8 / 8)
+#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE_AR50LT (16 / 8)
+#define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT (32 / 8)
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
 #define SIZE_SEI_USERDATA			4096
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
+#define H264_CABAC_HDR_RATIO_SM_TOT 1
+#define H264_CABAC_RES_RATIO_SM_TOT 2
 #define H265D_MAX_SLICE	3600
+#define H265D_MAX_SLICE_AR50LT	600
 #define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
 #define H265_CABAC_HDR_RATIO_HD_TOT 2
 #define H265_CABAC_RES_RATIO_HD_TOT 2
+#define H265_CABAC_HDR_RATIO_SM_TOT 1
+#define H265_CABAC_RES_RATIO_SM_TOT 6
 #define SIZE_H265D_VPP_CMD_PER_BUF (256)
+#define SIZE_H265D_VPP_CMD_PER_BUF_AR50LT (192)
 #define SIZE_THREE_DIMENSION_USERDATA 768
 #define SIZE_H265D_ARP 9728
 
@@ -81,6 +90,7 @@ struct iris_inst;
 #define VPX_DECODER_FRAME_BIN_DENOMINATOR 2
 
 #define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
+#define VPX_DECODER_FRAME_BIN_BUFFER_SIZE (1024 * 1024)
 
 #define SIZE_H264D_HW_PIC_T		(BIT(11))
 
@@ -99,6 +109,7 @@ struct iris_inst;
 #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
 #define MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	16
 #define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE	384
+#define MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE_AR50LT	176
 #define MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE	640
 
 #define AV1_CABAC_HDR_RATIO_HD_TOT 2
@@ -155,11 +166,21 @@ static inline u32 size_h264d_lb_fe_top_data(u32 frame_width)
 	return MAX_FE_NBR_DATA_LUMA_LINE_BUFFER_SIZE * ALIGN(frame_width, 16) * 3;
 }
 
+static inline u32 size_h264d_lb_fe_top_data_ar50lt(u32 frame_width)
+{
+	return 16 * ALIGN(frame_width, 16) * 2;
+}
+
 static inline u32 size_h264d_lb_fe_top_ctrl(u32 frame_width)
 {
 	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
 }
 
+static inline u32 size_h264d_lb_fe_top_ctrl_ar50lt(u32 frame_width)
+{
+	return 16 * DIV_ROUND_UP(frame_width, 16);
+}
+
 static inline u32 size_h264d_lb_fe_left_ctrl(u32 frame_height)
 {
 	return MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
@@ -170,16 +191,31 @@ static inline u32 size_h264d_lb_se_top_ctrl(u32 frame_width)
 	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
 }
 
+static inline u32 size_h264d_lb_se_top_ctrl_ar50lt(u32 frame_width)
+{
+	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_width, 16);
+}
+
 static inline u32 size_h264d_lb_se_left_ctrl(u32 frame_height)
 {
 	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_height, 16);
 }
 
+static inline u32 size_h264d_lb_se_left_ctrl_ar50lt(u32 frame_height)
+{
+	return MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE_AR50LT * DIV_ROUND_UP(frame_height, 16);
+}
+
 static inline u32 size_h264d_lb_pe_top_data(u32 frame_width)
 {
 	return MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE * DIV_ROUND_UP(frame_width, 16);
 }
 
+static inline u32 size_h264d_lb_pe_top_data_ar50lt(u32 frame_width)
+{
+	return 64 * DIV_ROUND_UP(frame_width, 16);
+}
+
 static inline u32 size_h264d_lb_vsp_top(u32 frame_width)
 {
 	return (DIV_ROUND_UP(frame_width, 16) << 7);
@@ -289,6 +325,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif

-- 
2.47.3


