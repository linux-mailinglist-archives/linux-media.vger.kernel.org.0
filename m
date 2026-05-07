Return-Path: <linux-media+bounces-60726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ4bF1M1/GmNMgAAu9opvQ
	(envelope-from <linux-media+bounces-60726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:46:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8134E3A7B
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BAEA30672C1
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9AF344DA4;
	Thu,  7 May 2026 06:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftVnXNLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyY8djX5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848F342177
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136149; cv=none; b=QWdmie3wGdA33NMUi6lytHd7y6P5dH7X0HNINJE3pBP2S1MmoJM3RvjnsYC+79zLFOo4FmvEcFULJIRMflcCDCGV8UYqDacuejV40EV7uDs8+WxGkM9H3/qo/QKs2mH6Dnr8Utrgdk5w3s4s4c8FZqvnkDY1OG9KJ6aNOhZdOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136149; c=relaxed/simple;
	bh=7L8xHholksLr/J5idSuzkIoCG+5CGus1ErxlOMircNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UKoE80wn9ae1igRdgVkpqxloKDiE4osFA7T4ZClZui/pJAmHpYOcu0cF9FqvCRzqpCf+WptmTRhI4pX+wx5fvPf99eFCpSM0+f54buIRQgHoRRy/dpT1BtOEY+6CvuBBAruPC7mYD2vckCwcQirD0QC9Oz6RpJ2MyGMg8mPzWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftVnXNLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyY8djX5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472Bsgb258726
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=; b=ftVnXNLwAcxTZvsw
	FxJcfhaoP+Rm71klZ+cd6ag9N4dinF8FCvQAEulK0sNnu3Mylwii6ba6wWB5zoiI
	94AT+U0xtnL2UQ1gAOxQl0yaxL3K0seK74E//pASbjm4xraFr6yh9Txhi1oNBqXC
	83m+7FRwuKnBQVYC8XSZqW7UwH8L8wl9SiKbNVfta6axnqhfJx9+WISC9DhAPlP0
	1Wsxr2olmECYgEmz0aB+Zu+vOIN8IuP73p/cEXDxKYQ2zOZv53t0lAg10Dkzyssu
	wCFkVQp2zdu5PeGEg/ON4tyqpxJCs484ua7Ste+Ht7QYiM3F1FKQ/nW+EaC24XLN
	n81yaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8rsuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:42:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso10520931cf.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136145; x=1778740945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=;
        b=WyY8djX5UQVXFvM7CLPlhCqgH4zgIkap62zWN+gY5HFE25qtPbQVy66JycgiGbhIXc
         bAouPEfD6q/QiL1dwa5/9K/s+BElmAvZL8c0CymSvm1ad+kGlbOVo3Un7wm0NcXhMQT6
         9aAC+lxc3fo6tz+Kc4KNXw19QzrHR2EIrE5gAQ/IMuRCbed7yU/Slb0XoIlcXVgIlDpF
         AZA+0sFNRUD7AEr+yylFMa7mXYdOdfWELCej9Fe5xmWOHbbQXLGrM/9/6svrl+Aa1zml
         +360zTIppL9sS/Ze9h5j/XqDk5yoog22oqYHi2xhd5dgfyMKVb/JXeya4C/9+DEQGOZz
         20XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136145; x=1778740945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRdJBhxXKG6cF3d7XsY6Pd2XP1jNeNkL4RCXQhfKXgQ=;
        b=MQnltOZ7yS3nmOjMXFZAmgu/JzCU6Gk6VVFXoDplJzBBZFX3Pz4BRI0Z69voQh2pYl
         WQI3b+XetO3zoH8GgLXIRYNBHATcFwg195YJhFUqI5xZ3ur3Id1CdHbCDTVLkSoAYwIq
         d5ku6+xGXTl0r6HQty3cCq8dgZjCxEitN7Bp26itTNeRkGus/Uial3T+IkDk6b+eWvDx
         zS1qVJAPAjSuKRdvkso0aQSmM8GjoiUuRupDAbqgjA1+BQLeN78+vrMjPl1BCBnW5Gzg
         Yc9PELbIPbKGlW1by6NlmKAzU/FWBueAMtNKUpr6QcBsgmwfZ4Y2XutefJR26SvAOLNX
         Nlhw==
X-Gm-Message-State: AOJu0YwasHSko7qkchqG6rGqFggfia5Wc1MPRAs4KXAgzveDsIRx2UEc
	uKxE8h6s1WtcJ3NZIsP1zcBvgNPvE1fTYYG8MgO2Ec2M8lXzh3dCCL2pS6TLK6vU3jgAz8+Hza8
	PziCW4577LGBEDY+cE9+RWZ/Kjtzui1mxOIjHOgDVjrdUpWgndYT1Fm1H8yLQ15ITTw==
X-Gm-Gg: AeBDievG+YhIWGlbHaPFZDuBLFgviFZhPxUshPihwgo/W0yZKgZ52SjqXzuAXX+B9+o
	1lWb7dCbziwaeiyzrO6Iehu6s0bllYX7sWKNzyB7SfvL2Ez29//sHF/XP2VZZKxgzqv0vzIfiAp
	YzOAC1ytgO7tJm8uxzGzj1ZU4TSjsjZfNCxpGMGDmzog/7MA5oYAz9K9yHTj6roAmWktCrTegIp
	LljAo9js0VO4wZgJ+CD6y4xyb6av8OcqaAdLUBz2+2Gl84SBuF/Vfs8XkKE/gNfLFUEGNTglZmf
	lU4CR5diK6C+fb/4bxaW+RBsGHJwqcBNuC1U4iXYfp/m3PrSxtAukbOpe5shhkRB27txvf2+FvD
	b/4ocLCCo15gFhpVxh4GnbLR81KL1pjmNa6Ui5niynCOTWyab0OVozvTM6WanaKhIe8vG08SIun
	/WJQ+kfP72cQ1RqbjKb4uqbhXw4wQ9BFFonLfpsxGDtYQleg==
X-Received: by 2002:a05:622a:19aa:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-51461be057cmr89098861cf.1.1778136145306;
        Wed, 06 May 2026 23:42:25 -0700 (PDT)
X-Received: by 2002:a05:622a:19aa:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-51461be057cmr89098541cf.1.1778136144864;
        Wed, 06 May 2026 23:42:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:06 +0300
Subject: [PATCH 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-6-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kvjyEAY0vC/1nZZAL450HsDlx2QzlbhCGbevXX9OZR0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YfE9tbWXO/PDQIsikv5ZvO4nBnevElf/ccJXY+48czm
 20WrHrXyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ1Fax/08wywvfbDxd2+XB
 xKYGgZqwS5X61ZtY53jc7NYssAucu/xgdlPwWcG5rj0iyyyva0cHmfZfVPxR6Bwnm9wkZMURxmV
 iZNnoY/zD6eQDh/iwXdN8GmZXmD6+e2mngsOerZs8ZM7f+Bj8mCNI22+G3S02hy6ndIXp62xedG
 9WVIrjXn2120srJX853+RYQZbW768FTZYLvj184KnPrYTws9NEqw/zMr8tOat+wX/aP5MnzVVn1
 lRdXLT9db+BUtiKOWbN8+ymsu/MUdnIeS9ygoX/As4N0wO2LtnK4+h+7pWJgChXob3fq1fuB29s
 mZgS/ss5aNp/E6nrC6y+W2tlCRq2TVS9LfBl2mX/hqfXAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: lQqp96PxYvbgN47hsPnuCKs-LnKKgOFX
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc3452 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: lQqp96PxYvbgN47hsPnuCKs-LnKKgOFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX2BFdNw8tHcwP
 i0nxQaAosooPRTXaS3JcG0D0oz99bdRap2CSrIaNEPSvujUvmY9a9ActCS4nL0dxO/WeyOuJtYs
 AkMS0ys8nPRfMOXP1qTpcGGUw1pvXfJzOq5+3aSEyLjUsfQDcUGyZbJWBCDO0s5MQVgwRSrtHI7
 L7nKSr2/u+821LzqKZYfVSpQ/5dJOVprGMjqsQvU8edSDvI7lxXCHf27JZtMmZTMd76YB9X2MES
 pdYU1U4qQRDV2sbeoMCHKBjeyg0AdRHUavw4EwXonGZQYQYSIwQk8zFOtDPwrA03m+EaCV5GXJM
 fzlljU3HJe0166dc1rlEIDO9JZwsmro6DARF9STBGdKpAmlVu4CHO5gmDFUTavbQwxjZCJfs8P/
 xbqRc1jKSzwpod2CJz8oDSecpGP0fQ7NO7jrQ599tXtph1RVhO0/QR6LAbfmuSpxt5NFy2BM152
 cgDTdJdUE748fOmddTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063
X-Rspamd-Queue-Id: CC8134E3A7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60726-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,60fps:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 7acb073f7197..51d8faf6fd1a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -283,6 +283,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 8259709ba203..238c7b17ed4f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 829dc37b4058..6e63f279efbe 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -106,6 +108,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -135,6 +138,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -172,6 +176,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -201,6 +206,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 59e4d68d042f..b8300195a43b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


