Return-Path: <linux-media+bounces-48552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 566E6CB2D04
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C558A3116285
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 11:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82BE2F616C;
	Wed, 10 Dec 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TW0LoTTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrQCNEVq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFD2F6587
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765365884; cv=none; b=EKSHl9fN2oHHPDYnczSkW51r9fJ3ItZaeL4o91e6q0v/Z8fGW/GjN19ErbsvRdtwC27ZF8BWUtQCS62KJi7JEBS1OkV26rZkNLg3BkSRw9bxO5qM6arKG6GlgX+3sXs+p+VtoIawuMYDUdF5khNeZyn5FEWxMtc+TUP+Su7nanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765365884; c=relaxed/simple;
	bh=FXUKIqsthWWyvudG+oJkzl2SQLj5wPYuhwqvhfNAqoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utHDoJu8RKTQ39bClWtvu4haRwPY9QBs1T25Zlht22iaotFlfUk4V8VBhiNJnamFNYas+oUfsIbKdpxH16g5suaMrySDzSfS0n5nK+L1ZBkqiKt+k9RAtF9bcLUBv+uQAZ7CjB1fbulLAoRqletV5/H4m7cIn0KPkD46nePysiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TW0LoTTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrQCNEVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e05x2493199
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kzd7UvnXKQF
	kJhVz2pcrda3QFTnBwb/widBA8XEE0gA=; b=TW0LoTTH0dGO5we6PPPj8jKUJfr
	pP4iNBbyX4awrf8yHOsmFXrNjR5/Wkm5JoMcbm3j+Fovz0DfsjZre7F7diKttSkQ
	aE2nt+XNPxlsHCRssIAyZ7CMsAdK36l7XxmMVORj9UyjOWdTRpz3ADMDdj8uvtwA
	QBixNzTgWYf4ebJX8kr9TsaSKJ34xujyV8DTkA+Ci9uCTGcJb7syhgXumiT+H4hG
	v9QTDOL0iisqYQX5YHQTcZtWmhZCIyNQsD32vmbw69ukh43fexogKBCvFqyjqd4k
	QtaLqbKKikTzZABCgsTDlJYBwaa3xx7FxT9Sp4GKy4kMybk9kK/S24q+NoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xws5ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 11:24:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso15478951cf.1
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765365880; x=1765970680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzd7UvnXKQFkJhVz2pcrda3QFTnBwb/widBA8XEE0gA=;
        b=ZrQCNEVqaOp6QrdkJNGjJrLR0g4Zs+JPCi2cikjw5gW0GiRLtFzCskib4L9bhC5E02
         2uoalbfvntbVxhouG5Vy0leDCDvixGZX6rpa+HY8oggJmvQfNp2vzKRTh/4PK3VfGG0B
         oNx8Adf9ik6OpOcWbUQvtIIv63pG7gYUZxFPsYyaYY6XWJTqxNfgAzVAxQX9xY5O3/G/
         SGWQYSLvd6tU+yLwzEgphB1nNNk1m9aMs1M9795k7lh2DkPajQu+/XjuxHmE4rizeE+A
         2mEk2a3LQOEoAXjV5jGj4fpQFWX5RhTgCbee0MalvKvA0rlZmlLrKRHQOriLQ/tr5OV0
         un4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765365880; x=1765970680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzd7UvnXKQFkJhVz2pcrda3QFTnBwb/widBA8XEE0gA=;
        b=SA6sqDljmq16QftmhlKCzQDoinwTpGEqFWg3hLyhHXq2lKC3IKldA9ZNNTkVcwaMYQ
         p9jmsmAIishAXMGE5r7McdhdxoukS2+lvbpSlGkDM20AF2C7m7Ex/p1wVolY+ntumotO
         /pAmZp1swTzU6LmUJVhS6zhYXLdK9PfdUwLJoH3mUv3DnZ0YxAH7vWMW21RQLC1CmIqA
         NBKE7ojz+Sfb0aZI/wU1QdfWA/VwRxWJiihpecvUznWpcXPJH3WNYY45d7pO0JKnYj0y
         77Tr7RMEnbKULC6XK9IJ1/BqBmpbs2BWWdB/I+ufb/iQtt8C791ogtxO5/KVrHbuffWM
         dgDw==
X-Forwarded-Encrypted: i=1; AJvYcCUSSj93mHCRH7vTpS9tL+7I8Dl6HjtwFf15sVPOa0/1Osxje8eQuXs1/nZ9CvSMTvus99RwCrfsjsA3YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySRkLz+Xt3wSWZnY9cJgwLqP7D+fa59d4oZ8WHgQ65k8nIcoNX
	q1hKMmLWvo82mKEsMeScs3D5mUtmutWIPC8s2y7Avf+HwjwZ8ml2f3jI+IghcjzKHyfZ+389+nN
	7Qf5KN9WINncPG8u8B62+ceJ6mfHDJEjQx7qJsc/vS3T3/1bsCqsUCG/KYxJ4Y+wkw3IZ+xfG7A
	==
X-Gm-Gg: ASbGncuV3bPFg6YHL7svirpbrUrOEEOPz/MenIzDBrp4NRbbv9NQx/kwElX5k92cZR1
	NLgHIoxGE1kQNKsAQ5TltIfz/Fhlaj3lJPdrzZ8Ijv5xSyTETvC1U87QHc4sgWeo1hfQDF7sME6
	rCsg+TF7oPQ6sIFGrz8Q+W6Pl+yn3YFVNNyiASq8yvCOyvPRtsgKq6WUfg7P9qSYBHe9E6RcBTq
	TEXk3dKE6gdUgjZ8sxmz+TYu2B1VOgk9x5FHPxLcM/XUi7YN3Q0mk8ydJ46W29TFXv18Qel/ZAx
	bPqT4wQ5yGjAh+rLy0k8rcQYIjNvZ7XiTwZGR3rfDh3iIYA4Doc9I/tyRDjKGVQ+Tf6tTanzurj
	mLTxCvQhCR69rPu+QZiAxkOuWgJMoYJnPmkOovpeS91e5zgoCrgTxgS2b1pPyjAGgPdD3n6nQCv
	V0kOZVh0tVI+DseqslLN0JJYGN
X-Received: by 2002:a05:622a:514:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1a9b7857emr71133651cf.41.1765365880592;
        Wed, 10 Dec 2025 03:24:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQPMMAVv5ADsYY8uNhG19fDP/1leyomv8BxOcbJHU/ekZS+71j2kXZcY67O1hi8mHDbFcZSQ==
X-Received: by 2002:a05:622a:514:b0:4f1:8bfd:bdc2 with SMTP id d75a77b69052e-4f1a9b7857emr71133341cf.41.1765365880201;
        Wed, 10 Dec 2025 03:24:40 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49e3fb1sm1696851266b.60.2025.12.10.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 03:24:39 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
Date: Wed, 10 Dec 2025 12:24:33 +0100
Message-ID: <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA5MSBTYWx0ZWRfX0yW92Cv7SRYw
 xcoKxogZ0wEljDOOwX48WB4xGJsAfgujfLTnMgCnn+0yYcdKPQIqaVDA4p7WPu8TNPtyq2qRqTv
 RIBuPkT87jg3EIFe116qice9Vm9FO489/T4TniM5B4WDo+nBfDt3UYRjbbthrVqNdoB3jQRJAHU
 C8yNfL63Yd1LYZfc78Dd0RdFXScKXhnYNNDy9JLipePYvRPZwQJAiFfKnO97jwKUDO/seikDdoR
 e3H37umdZJGLa8co6jiPeDPm822Gk8d5IszALwHHolJ5U/C/bIPpmBwdfIHvfhhlePU0OLli9tB
 UFLKOsoUFrf0QK2vFfEdWuk0ODCeGjGjBYNkUuylmfb3D/98YoSXWKCXrxQQGntSVVUwWwWqEFR
 Z5X68D/HJS0ZvZT5ZlOpvQgw00J7/A==
X-Proofpoint-ORIG-GUID: L30HK9rx_mQq-LDTjMX3gRS5zu_1lcNa
X-Proofpoint-GUID: L30HK9rx_mQq-LDTjMX3gRS5zu_1lcNa
X-Authority-Analysis: v=2.4 cv=F/lat6hN c=1 sm=1 tr=0 ts=69395879 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oX69UmKp2CGo4zr9RpIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100091

The ov02c10 is capable of having its (crop) window shifted around with 1
pixel precision while streaming.

This allows changing the x/y window coordinates when changing flipping to
preserve the bayer-pattern.

__v4l2_ctrl_handler_setup() will now write the window coordinates at 0x3810
and 0x3812 so these can be dropped from sensor_1928x1092_30fps_setting.

Since the bayer-pattern is now unchanged, the V4L2_CTRL_FLAG_MODIFY_LAYOUT
flag can be dropped from the flip controls.

Note the original use of the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was
incomplete, besides setting the flag the driver should also have reported
a different mbus code when getting the source pad's format depending on
the hflip / vflip settings see the ov2680.c driver for example.

Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
Cc: stable@vger.kernel.org
Cc: Sebastian Reichel <sre@kernel.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov02c10.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 6369841de88b..384c2f0b1608 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -165,10 +165,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x3809, 0x88},
 	{0x380a, 0x04},
 	{0x380b, 0x44},
-	{0x3810, 0x00},
-	{0x3811, 0x02},
-	{0x3812, 0x00},
-	{0x3813, 0x01},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
@@ -465,11 +461,15 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_HFLIP:
+		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
+			  ctrl->val ? 1 : 2, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
 				BIT(3), ov02c10->hflip->val << 3, &ret);
 		break;
 
 	case V4L2_CID_VFLIP:
+		cci_write(ov02c10->regmap, OV02C10_ISP_Y_WIN_CONTROL,
+			  ctrl->val ? 2 : 1, &ret);
 		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
 				BIT(4), ov02c10->vflip->val << 4, &ret);
 		break;
@@ -551,13 +551,9 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 
 	ov02c10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					   V4L2_CID_HFLIP, 0, 1, 1, 0);
-	if (ov02c10->hflip)
-		ov02c10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	ov02c10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 					   V4L2_CID_VFLIP, 0, 1, 1, 0);
-	if (ov02c10->vflip)
-		ov02c10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.52.0


