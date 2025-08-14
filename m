Return-Path: <linux-media+bounces-39878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9673B25FAF
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 10:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B6F48845CA
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 08:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864B82F067A;
	Thu, 14 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkBQet9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E622EBBA7
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161585; cv=none; b=gvR2Ij/GLGg+p6A4EZeVjfcMNryamb9BU4DdOyKh7zmbfaFf3/SZPdkQkEHvzyH5IINQ4yy8GQhI5mZavhCRTlX0xAlmUWuBI5eDjpJEjLUfXsOxAEVxEMdpKhy5ZaVeLjmDRxtVY9AmI0aJRdo9lcn5BWWR3M9ir96fPxW7rDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161585; c=relaxed/simple;
	bh=ER5Kb+8tz4fNvLOOzVyZpGvtPZZSeu4NJ+lkYxElmDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VYafUG3aeWKNneBKO/97dNyIvTZIwMj8EA9Oqt09+3nCPt/+55jAsMZFgo6s6Pvf25vN1E1KxnUehUD2T8maXqWSlLhH3u8NL/zMs7pnDx92AlmdUf94Z0lWfPjOgZsJ4X04GVejJI8r7+r/TNoJg3dssGD8u8iNaJhSjHqy480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkBQet9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN4Wtq020684
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nflzV9qq/tL
	/glhk9JNHKNEsSBm8wEvnbzo5OybERr4=; b=LkBQet9Ej4FDnCKsD53bZnxHWcU
	uylpFNxuMuaed+fineZtXzzM/85HyZaqJ/Lxp31l7bqdf519h9VfIY+6jshSesWU
	XRPa7pbcYrjgdFuqDYh5pw1I4robU7LtcNW9I8z5uvK9lSMNxwsEX0RuWNIlqSP2
	+9cq4CPTkw9ZFHtZuSiti9FPcwEALBg/49xM5iPkunvVZcRsRSJtx8PV+tFsEDHM
	j58mTc8KTr/Jw/jUc6bu5OG/v+Q0LAeyLrsmUZyTdUDft+IETJB1ZB9OgNg4MLRm
	nebMLsv6Njx196Eliwg9pQFiS68Y7WO6h9XeefXHv7nz33BMqQY0sCKcOdw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf01j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 08:53:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109be525eso20314171cf.2
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 01:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161581; x=1755766381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nflzV9qq/tL/glhk9JNHKNEsSBm8wEvnbzo5OybERr4=;
        b=M50z/eWIGQY3ucj4OgserqqEOtUfHq+jL0YmbbzcClmsVBwr6mYl6sNnaX/YsQMFDl
         RmUZZ6G+eiXMAaZyE3VX9oV8nEq+gsjJajGbObKhYhDmyRAXNdHbZqTdCtjENWqcRJeY
         kDkGlqUD951iBlWvtFy/qnJDl89tTJqo43ivw+4DVzVE2eq1jpjtA39nP/EwsQB8QrA1
         ODfORUuu447LBkIaAZgchEuiTrW0nw/7phbxihMoMgzMrMAMoht6e42D1QzgBr5R92F4
         KQRfp1GavEMOpaRCWP8Hd8Jbsyu7I9KwcBWlSGHzeoZQMxwrstBprm9pf4USzzD1tdMM
         ijsg==
X-Gm-Message-State: AOJu0Yw3v6k3nftMzoyrcSI3J0go5P0KGECBBvkJH6iLmOZg6zUU3ZaQ
	q3m7+zTFtQ4+lbEIZXcP1zkYqO8pe9YwAfbnmpemtKLpDcDrKauRwvD9j9a5LRRXOZLIvSrZDoA
	RWYlxBqt3Yom7NKJ54JFld45t3tNJCXd6kJ4HbHeM+H/xew7jxWYtuDPfUTDEdMzg8g==
X-Gm-Gg: ASbGncvcD/qaNsEMPiX4U3WJRRUjAxGqwTdTzQnwEN0S8yN3hly989PFU5bhnyumq0s
	wD6p3YpRVHYNId88hEYoS82iVA/HaCOt1HVG6C/qTG27/q7xreJ3qzZs8DCukS7CBeaupdWBt9/
	llmCrOmM6N+bRr1x+PMhxBKd2smZhgzTnH63eLrtQ4joabyWyItmW6D/gvYS4ggXvurkmyPnR9S
	rxlcl4Jv962Fme0S6GIffITi1KKdXSITP5dB2HXvjS2coBh5TVshJC8eU5ltqDk3f0g/2eseJF6
	hlHEuIGWOamiA0VlwD09Q+I9FI473eB+7q+fPjUenPPK8WZ3I2MTAZksMBEX0Y2y4b/49kHeL4q
	snrKMtCZC6YJ0
X-Received: by 2002:a05:622a:551a:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b10a958407mr32313601cf.7.1755161580725;
        Thu, 14 Aug 2025 01:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7VBqCxB491bsqiTl2g2jB8aaqDVL3tegvRTBxyZwdhXGP6AmLmu9SM3LrDj9T0Zv7gbkXyQ==
X-Received: by 2002:a05:622a:551a:b0:4b0:6d53:a0fc with SMTP id d75a77b69052e-4b10a958407mr32313361cf.7.1755161580281;
        Thu, 14 Aug 2025 01:53:00 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:52:59 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/8] media: venus: core: Sort dt_match alphabetically.
Date: Thu, 14 Aug 2025 10:52:45 +0200
Message-Id: <20250814085248.2371130-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX0+VPflUTqwoa
 NNlkbbWqU1E9E9DXNJptCIndt9BOFXVbebBEfijR1hTMwdeDnPDtU9MEBvNqC8YDQlrFQ0XEcUH
 WoYDsnTw4ybiDjJJoJQUlnra/KE1IL1e64mHbQAc5QUsblHKPB/tA2mxM/RHhZoPsgkduoWcVkd
 jtRry55zXtn/fUXxT5P9uStVLkpfIMdP3R87s5O+k6Kmq6T9htM54mwicpwna/FlItgQGR86NRq
 v0K3L7Q3grjL0Bprd8Ebr/EwQ358RcIx+8d05qxqRB9eNlWIioXVzt1BtHJzna1YmO1D+aVt0qy
 UvQvDy9P19siFMfRoFmDJnxewIqXjTJR6cC88EPxK7zZTX7zAU4DoagvMLhcbXPZML+HyRmFFL6
 OHlZlTbj
X-Proofpoint-GUID: c716xqbs6XhuPsF9l-2a6ZssA2hDd-Xx
X-Proofpoint-ORIG-GUID: c716xqbs6XhuPsF9l-2a6ZssA2hDd-Xx
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689da3ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=tkZEzfabOtbtaFzRxSIA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Correctly sort the array of venus_dt_match entries.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bc7b255357cf..0ff48c92749c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
-- 
2.34.1


