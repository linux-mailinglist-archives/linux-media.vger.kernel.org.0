Return-Path: <linux-media+bounces-67212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R5aKF7f5T2qGrQIAu9opvQ
	(envelope-from <linux-media+bounces-67212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:42:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CD7351D3
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 21:42:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=agaNMxdm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JOBJlKvJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67212-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67212-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8D230E1A3B
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 19:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523153CC314;
	Thu,  9 Jul 2026 19:37:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCEE3CF680
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 19:37:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625848; cv=none; b=kDizp5sWa6YJi1jBlMkPoyBj7mnio9MXdqMvm3gBgano8ioMQtItfEJcYTkfa6NFmyHxMOoOkFMMApB5seGNQ0FJ62S/3FME2sDwHNj6WgOBg5FMuZ7CqBcoveZJMXR5DGSQJ+Rtb2vn+8AGYvaBb1yCzkyYjUPBrTq7j7n0OWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625848; c=relaxed/simple;
	bh=mZusnoT2WUAfwc1lIqw4bcGLnT42XbUFodbSzhc24x8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfWkTSLw/QK30FcQBPVspXVpzt9OJcg7WTEIe0n0ghH/ZmydGRQwDmcJ1c2t3cLsaB0QhDhD1/PsriKw6kCNHxcrxxKj1Bm3bxoRF1aGXq5OBPpJo2+mMCnvzK4MbZ5nHChGD9AjfWTxW4CPZoxD+nWfb+gl8LoI4xr5G3nihMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agaNMxdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOBJlKvJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXBM12419955
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 19:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=; b=agaNMxdmhE8d03V2
	3FaGGDFwwNtOgOdm0+CAEMaoU4NLz5OmhflVJMqSLuskWU6k3OFPYdfca74kXreP
	lsCELT1ffvCV5w6/7L7DtDUITu83vh9TmTJ3YXcO7aFCLAXdofKzGTh9Vv6F89k7
	kHV4OkGnww3r2mUE0Xl2SzAUwlmgYi+Dfe4RvCp/zkFjK4FBBLC6CwC+N4qL9TaQ
	q07ngGeV9dR4k9gH/Jc0fFN3O3s00O+LP5FPcoVSvRvwhbc9Q+GIMKdR8Qn/64wi
	ubaLeVn48nUOUcIfEco5g/fO8EGNyDcrFkI6EhLv1JeEKycEqzcmE3+Y+wpSt6hS
	76nTiA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj9bsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 19:37:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9674fead9e3so65082241.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783625844; x=1784230644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=;
        b=JOBJlKvJakMyerpSNkJaFgc5dFmXUzDcf1CmBLyxrYCT5ZqT730JNYjMAL1s15sdI7
         juzeyPmWHP7g3PQBZcOrcOycrhY7M/eGgUyVQDCO8J+4VEF//fIGQv0NfbWuGEbwtQfX
         z3FFo5Wo86Zj7Jf9KEsbO8HuzENzlIPugL2iQmUqeCNakCvM/DjCOtEio43M+KiMfdPR
         OzHdvFPGET7T36Ew2ZSeMz/e3LVEF2xu6snWYNJP1oyH8BoTNf8yIpz7q3+TyWKYDXVg
         IPENSMiSmobhzNUZN7+ChYsN/yaAhuweVJjRhHxBGRv1vOfVEqtdsIpFYb9Zq6yLc+aq
         HT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625844; x=1784230644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF3jWljA9JWLIdXUfkTrXBIJfz/O13vMhJungOwkK2w=;
        b=IyGv2/aCJN2Zv2mgVfpGHgUlIMC45QzMckifVXhv9MO2o5QrW7ltLLqxqAmJ02g2Ot
         LHom5G76ZVC97W1ZXUzLTI35Ao44nJ4hSbYMdnuSbt/87kSB619XH0UuwuyekkFUXbVk
         7/rVwSwN3GVPq0jIY050R3im2MQvLDiAFetHMvw1FNLM+etc2y6/rsbCKCrqDMpwdjwd
         0GFIHwYCitK0Eo1viajnF197U+mMAM54w+6aVwMG6TR8Ts+40krWA+rDiX+Ule/AJ59u
         xwjTLToec1S3duI7s+0ZopFXbK/dqxuD2TmZU3BF6qSgGjpBQDTG+ziURTlnEM1Q3KeV
         oY/w==
X-Gm-Message-State: AOJu0Yzti69dX7xkijwzpqP08nYb/fwH21DJ7eNcXbMHBgn1NEl0hO5+
	AHFLH1rTcrRZkFn4siV8Z7WfhB5RrUh0iWVHBDP5CLosN8wwnZDui6QUG31nlLW+OtULk3VcZSX
	yVSz73GOMmPEZ+xAsSLQcOVnrhl7PmYdSOiwYaDPRq7zePdeUgqPLO8dTkRQi2DGSmsCtAb2bpw
	==
X-Gm-Gg: AfdE7clvFgj6mEbg6dz4dKmI87OTZA6PGc/WPnPsaYBBZ9KBV26g6OE8EaYsDCeo6dX
	OGi4BAhc7HPQNbV4e+/ICrl2rT2IPuva7atIKnxxXCGEVYELONU2b/dOYcDhoNmTdRmP/Ib4WyG
	lwuoHxu3+h/0AU81IFCpcvRUKmsg0VHLz/hARbZy6I46vnch1JR2jgC604UhrNgDKJpBOiJeI0P
	RUp2Hfucc+7Jqhk267b/yPMpkseDopCtD5c85I9Jc3IIOkxV7YdwRL8M9w49CvYlDACuztCsStd
	wS4uem72YrkYz14s+W6h7HczNdYi0vNMB2G115D1z8tzE0NYhLBn5p5wYJ3OOlLocFdXq8db/oe
	dtm3b/r/YRmqMRBeA3VrHc/77PCu4/TqoZxwQKheEkGecpqy8PH/sLOrRsaAJu6bQUNxPtS2N6e
	W4cuyVM+81Cj3yAro0aeUMjoKq
X-Received: by 2002:a05:6102:4191:b0:720:7e04:b306 with SMTP id ada2fe7eead31-744dff0ad16mr5284187137.5.1783625844026;
        Thu, 09 Jul 2026 12:37:24 -0700 (PDT)
X-Received: by 2002:a05:6102:4191:b0:720:7e04:b306 with SMTP id ada2fe7eead31-744dff0ad16mr5284168137.5.1783625843498;
        Thu, 09 Jul 2026 12:37:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa635dsm46400e87.62.2026.07.09.12.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:37:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 22:37:06 +0300
Subject: [PATCH 9/9] media: iris: add VP8 encode support on Gen1 firmware
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-vp8-v1-9-6af3ab578a7c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mZusnoT2WUAfwc1lIqw4bcGLnT42XbUFodbSzhc24x8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT/heGUvkBzb7Bx1jxhNrQPpGgkbO9rTaWLnTx
 EgCZzKlhd+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak/4XgAKCRCLPIo+Aiko
 1bJjB/0XEZz1Q1Vns9CCt4Q4yGFGVaS0GCUtCxU0F0gHluwtpuf6PjCuYvoolULXxIom7l/1M08
 Lwar9mZlKbZDJO7m/LmDKMtioJy1Ojxk3vYTf7V4E7HCZEoChBzAOAAnS8Lv7RmibsLhTU6MkJ5
 EtcQCajtm+GgLXT4lp3PBdZJCjNfLsYvCdWOIhwJ3M1aJ/zOpdINVnvbgozu/vLQ5hAhjiem1Nx
 v90X5c8qnM1JYa9h00p5Xw3LYYayMfC8LIMuFyHsGfDV9gyc1WWngMbrxA1xzF4YfBBtBF9NxZA
 Y9nKkstzX/5XwFAGJwmf2AOVi/kKWdG+907B12USxvt9C+gz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX1ZN/KOOnE4mN
 7MbxyUmj7I/B/eQluXrtUMEBiPPaSVf7h4z9TkJn0orrMYDbNdI1xVSRO9Uu1wGEPH0YpT9qV6I
 7+7wiNrABlROjo/OfJxTfJh7PPhWn6aBLZDNNxVVSGDskBWTbQ9VqO17qxzJH5AaKwritxtpF7T
 m+fJsF5zC+FlkRkcKphrnrOrY3saL0vTz787DebtUx6MEog94/H0nE8PI1HJ0ync3EUkBySRbNw
 J0ORALP8BOrXl57bym7HmbTlEVb2U2IKzcwZKJMfUDgbHHW6uHGePrkxC4q9eOdTqpAg6dfIXk8
 p4e5otLsNf54k2iyUCHPwMeqz+va8U+tCyDgnTKklpzDlY0sjDOC9n5q8prIyzUfwJxGBsxLMnP
 wTEwoGHUknD/dHhGaxqJ/2dRWl1ybBMSopD1T65qR9Jl9cwMTh6BCVYp+PVKVadSBEyMOgYkWkW
 ZFfg/OD5PWJFx310azQ==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4ff874 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HONOBwlNRYcZTqebO68A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: l1zSNYouO9N2iMrigrgJdKWrZz8RRKkL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE5MyBTYWx0ZWRfX/FuZczfitHwJ
 0+/+2BrEUkr8xtSrHmO2Yd6KDDu0dAhAo7ETNITmXrZsiLNZZNEQwlSKBc1qi3Qivalor9nc9sp
 RzQuj1TpyJTextfzCnJRF7CAo/OidBQ=
X-Proofpoint-ORIG-GUID: l1zSNYouO9N2iMrigrgJdKWrZz8RRKkL
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
	TAGGED_FROM(0.00)[bounces-67212-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: F12CD7351D3

The Gen1 firmware supports encoding VP8, but the iris driver never
advertised or wired up the codec.

Advertise VP8 through the Gen1 encode format list and register the VP8
profile control, sending the profile to the firmware through the
profile/level property. VP8 has no level, so only the profile is set.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  3 +++
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 23 ++++++++++++++++++++--
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  5 +++++
 4 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f9347c1df2b..c065ebc24d7d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -621,6 +621,9 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
 	if (inst->codec == V4L2_PIX_FMT_H264) {
 		pl.profile = inst->fw_caps[PROFILE_H264].value;
 		pl.level = inst->fw_caps[LEVEL_H264].value;
+	} else if (inst->codec == V4L2_PIX_FMT_VP8) {
+		pl.profile = inst->fw_caps[PROFILE_VP8].value;
+		pl.level = 0;
 	} else {
 		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
 		pl.level = inst->fw_caps[LEVEL_HEVC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 0451ee321840..b3c567349a6b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -150,6 +150,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_profile_level_gen1,
 	},
+	{
+		.cap_id = PROFILE_VP8,
+		.min = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.max = V4L2_MPEG_VIDEO_VP8_PROFILE_3,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_0) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_1) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_2) |
+				BIT(V4L2_MPEG_VIDEO_VP8_PROFILE_3),
+		.value = V4L2_MPEG_VIDEO_VP8_PROFILE_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
@@ -470,6 +483,12 @@ static const u32 iris_hfi_gen1_ar50lt_dec_fmts[] = {
 static const u32 iris_hfi_gen1_enc_fmts[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP8,
+};
+
+static const u32 iris_hfi_gen1_ar50lt_enc_fmts[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 const struct iris_firmware_data iris_hfi_gen1_data = {
@@ -728,8 +747,8 @@ const struct iris_firmware_data iris_hfi_gen1_ar50lt_data = {
 
 	.dec_fmts = iris_hfi_gen1_ar50lt_dec_fmts,
 	.dec_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_dec_fmts),
-	.enc_fmts = iris_hfi_gen1_enc_fmts,
-	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_enc_fmts),
+	.enc_fmts = iris_hfi_gen1_ar50lt_enc_fmts,
+	.enc_fmts_size = ARRAY_SIZE(iris_hfi_gen1_ar50lt_enc_fmts),
 
 	.dec_input_config_params_default =
 		sm8250_vdec_input_config_param_default,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 53ba48f88410..c652c61db19d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -542,6 +542,13 @@ static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_hevc_levels[] = {
 	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
 };
 
+static const struct iris_hfi_gen1_id_mapping iris_hfi_gen1_vp8_profiles[] = {
+	{ HFI_VPX_PROFILE_VERSION_0, V4L2_MPEG_VIDEO_VP8_PROFILE_0 },
+	{ HFI_VPX_PROFILE_VERSION_1, V4L2_MPEG_VIDEO_VP8_PROFILE_1 },
+	{ HFI_VPX_PROFILE_VERSION_2, V4L2_MPEG_VIDEO_VP8_PROFILE_2 },
+	{ HFI_VPX_PROFILE_VERSION_3, V4L2_MPEG_VIDEO_VP8_PROFILE_3 },
+};
+
 static u32 iris_hfi_gen1_find_hfi_id(u32 v4l2_id,
 				     const struct iris_hfi_gen1_id_mapping *array,
 				     unsigned int array_sz)
@@ -577,6 +584,11 @@ iris_hfi_gen1_profile_level(struct iris_inst *inst, u32 v4l2_pf, u32 v4l2_lvl,
 		pl->level = iris_hfi_gen1_find_hfi_id(v4l2_lvl, iris_hfi_gen1_hevc_levels,
 						      ARRAY_SIZE(iris_hfi_gen1_hevc_levels));
 		break;
+	case V4L2_PIX_FMT_VP8:
+		pl->profile = iris_hfi_gen1_find_hfi_id(v4l2_pf, iris_hfi_gen1_vp8_profiles,
+							ARRAY_SIZE(iris_hfi_gen1_vp8_profiles));
+		pl->level = 0;
+		break;
 	default:
 		pl->profile = 0;
 		pl->level = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 3c8ae1c82540..2fe1cb7928b5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -63,6 +63,11 @@
 #define HFI_HEVC_LEVEL_61				0x00000800
 #define HFI_HEVC_LEVEL_62				0x00001000
 
+#define HFI_VPX_PROFILE_VERSION_0			0x00000004
+#define HFI_VPX_PROFILE_VERSION_1			0x00000008
+#define HFI_VPX_PROFILE_VERSION_2			0x00000010
+#define HFI_VPX_PROFILE_VERSION_3			0x00000020
+
 #define HFI_ERR_NONE					0x0
 
 #define HFI_CMD_SYS_INIT				0x10001

-- 
2.47.3


