Return-Path: <linux-media+bounces-49754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA5CEA439
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A3CC2302B7B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72DA318156;
	Tue, 30 Dec 2025 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gwr9UFQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gn2USVno"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2858432F74E
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114208; cv=none; b=Rn7eFXX7H5vTd8KllxkcmrY6gFRUeZZWFfOWKvmCw2TVv6+Klu41aR7lqmBgM82I7Y9DrKh6GztHx5BCwMqZ8ebvB3x/v6R4jWFFEFUe+kOgEjkFN4EnohVg6+aiT1lNoOFCV3Dd/jtwvZpOoK6yCzNoeve67n21oRcES6aqwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114208; c=relaxed/simple;
	bh=GAEYvp3W0KSl1TDifaa6L8tfxr38bL0Dcxr0BViSuq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dC7kJXok+emB3xGpFYoTt3yG29Pgp34f+4GqtzUMVwZMJBkEcnOgv135sRL0BgMgnrYCYXIL/2KbW+tFNb8ss2Tb+1V62To4lbEHMWaQbSVgpSEOUv3ftlReX9jtLxcTwgN97jwjJRmOyHewSXX/IAcOoLCzFPBJlUudKh3E7ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gwr9UFQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gn2USVno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUD7GZa2548850
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zOf0kuvuEBaHXAfQ+YC93H7I4ZGEiW36M69f0BMm6CU=; b=gwr9UFQHSpDv597F
	IgkmIyFxKeFIPjD+FfR1kA9bcGJs/dfj4NfrtuT8EE+2aZrzmue5ISA1UVWe6FqK
	Zbl7in06noFwbn9UWXDu1r1/mojSfxSp1Uk+ovd3TCvAcMeK5j9HyjRoJK0NQZdm
	Ef2Z6kfxj0cgSWC3s6bSIYhwRZPctQFIeMRX+vYT58hhl3qqvyM2uKETT3RIzx3b
	DBLzTVB5frycOpbuE8hlVRX//gemHKgrMxztG+I/T2fy9E5hO3+CyE8QUHZaJq5l
	1/ltUntp56PR7v6OwK3Yh2qGbVRSte7+YXhw9qd0p6+mahFH24Bsw2UWsJ7aA3HH
	77JtJQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399sax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:26 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64651279fbdso14881078d50.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114206; x=1767719006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOf0kuvuEBaHXAfQ+YC93H7I4ZGEiW36M69f0BMm6CU=;
        b=gn2USVnoSKoSdCH2AECuYmD5Rt9zZo3D6502DPqF9B16K2OeFcRwdzVWWJMH/OPPa3
         gOTPdS5msydWCfABI5GuYrSHgemhloddEOfxQku9rZhLPDPBwOh0CJnwRiQBsWVvti1u
         kPx8uWBibDzxflgV1LefUg9vczR9uNl+I6XTw5vpZ3kl4BLeGjN+tfZh4++Csz8/wqY+
         6iAVeAfrAN8STXFk2WEhn00RN8iQ09bxb8/nCxoNGTQskp5Pxic3HnrPyWGGGrtzK/vT
         dmnIVJOe8N75/xwNvOO3aGgILWoHLXGAht4TbF5CUuJSZAQqsy6HZGd+oBU0zDxV+Z1C
         7LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114206; x=1767719006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zOf0kuvuEBaHXAfQ+YC93H7I4ZGEiW36M69f0BMm6CU=;
        b=vZUZM8wF2wqEH+b1SnuQ9i1fDJTsnEKJjbaM1JPCzZrPsVgSoFEDtV5JPATY+03kgW
         9jwsNFjz2SpQunaU6HkkCTDwnwEl4BU5LhxUePsmeDyCnfH755dSUXg7clnnHxwzNZVh
         i+1JMEu76Vx7ydM668tv1nUDG3niKVh0fbZqwKE6x2Frl3vQSrZVTigdo00tLrY8t0qD
         h8FOTco01deM3v04PdOLNGYg0XQbc49skPUeNtdvMvFntybOPl18HgbkE3YP+GTIeDxw
         tq5jwFDC441XlOTwRbOX74tyin++BTFstkjjtAnQ793cy3msv9LFHhxGw87xijO7YZqs
         d0jg==
X-Gm-Message-State: AOJu0YxQBugn6wXxTEvrWfLh3uIs0ve/zMmynfbqJMJQZfPV8RhSlCIt
	Qw5vZIs71w6paaksugmCiEJKSy5WVuaOdw1KaczXuomoUoju5OLfULl83onLUrDkugOCIyqe3P6
	lKYDJDygcemJxfYAUOHl0U5FMKnuD0e1aILM44XqIrUiLqNrNajfB+DjBwnDv3YGCsg==
X-Gm-Gg: AY/fxX51ap2fA2ldTZb33B6fseAsF62k1WIUSRLIS+qL1/on4kUhf7/RGsQxR2dyTP7
	7GOsbLlC3IZ+i27PPgJhmB5ssS2J0cAwUJf2HQvWe3q/re9NwmgKW22f602oNdO4DFDR4nvfUn4
	kUgwegV/byatLTEwshxOl9jPkgzFhMVbWQJ4Th6H4LOQaQR0uEi74xorV3ZA0QJTXdke0snS9ht
	SoAbMioqqfKqKs0cZh8fRL75devjq5MqkVop8YHatcb/KnW+H8mb6fQx9RtqCoDGCho3pw5LbWX
	bKoqkiowJ0KYfJa6nWx6n5wd8dJy8a3iWynuDYdfArLNK5Lb9iwwCa9E7QOOnZi3qn/D7ZQI5lh
	TxpKW3WQiH6eCpV5xQGlILnRUaO8wSzI5ZzG+aF27UWJbjUEwPbbiGDZGPQiDDdGAUwvYYfUKlw
	v6lwjuX/w+FhS5p2sRD8i6R6AE/IuBDMKWITOL8KCs
X-Received: by 2002:a05:690e:2101:b0:641:f5bc:69a6 with SMTP id 956f58d0204a3-6466a8d2f31mr18696294d50.84.1767114205460;
        Tue, 30 Dec 2025 09:03:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYeOD07as/XBeCYJwqhLI3N605Dzx8wPU8dDwklpMUKRy+jTAZHIwXbzua4HPo3h3az0orUQ==
X-Received: by 2002:a05:690e:2101:b0:641:f5bc:69a6 with SMTP id 956f58d0204a3-6466a8d2f31mr18696271d50.84.1767114204901;
        Tue, 30 Dec 2025 09:03:24 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:24 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:08 +0100
Subject: [PATCH v5 11/14] media: mt9m114: Don't allow changing the IFP
 crop/compose selections when bypassing the scaler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-11-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: A9LkpAPW99qfUsAYfHvkr54Z__B8iDjt
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695405de cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=FI8FN61yIa-P2m5uk4AA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX5s5a3uro7XgQ
 FCf/06Lo6gXmY8hFAJ50RoFn3ME71obq8gTAEXYxTHfWvFF3kALgwZWsMgxBBr4J3DBQKzznGuc
 g3N2uhvVPdUrkiTFqzgHuAj7c1TyLv+P8dkwutHcVMRsl5eaNn94YGRz2Xmk+UFAssOGsN6Ymdx
 ny2tyviE6Hwkr5JoPhYX0JUrfdijFdL1oXW9BOHmshBHYvvJ4JV12BM5SSjSwBhtDe9xOGgTcj5
 xrzaKDcQYGPNFC+Xa7M3Y6nvdWSJnPwmudKFYqDKxG4I4g0t86TBKhk3pzl+fJ+/+swNZ5kwY6I
 aRjqaED9B/ysna5xWvxNVPuwXJF5UY+XSY7UOddfmBiWCI8b/hix8bP8V92L1kLJPoIAQsI85Hg
 TNJ3m8i9JU4LdtYeU5MutP9Pgpk/OpBuRCT4HaTxKK211sddGM3JgLhauNDqOriwuTu2Aoz+ZwL
 c7zbcGayzle8h/emn4w==
X-Proofpoint-ORIG-GUID: A9LkpAPW99qfUsAYfHvkr54Z__B8iDjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

The scaler is bypassed when the ISP source/output pad's pixel-format is
set to MEDIA_BUS_FMT_SGRBG10_1X10. Don't allow changing the IFP crop and/or
compose selections when in this mode.

Instead of returning -EINVAL simply return the current (noop) crop and
compose rectangles.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Move crop = v4l2_subdev_state_get_crop(state, 0); up a couple of lines
  to avoid having to call it twice

Changes in v3:
- This is a new patch in v3 of this patch-set, which comes from splitting
  up "media: mt9m114: Fix scaler bypass mode" into multiple patches
- Add src_format local variable
---
 drivers/media/i2c/mt9m114.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index d111f9e45d2d9c47de315d06ee8a6adb28700146..5e0fbc34921023e1e7a69ec3d098f936eba93ebb 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1984,7 +1984,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *state,
 				     struct v4l2_subdev_selection *sel)
 {
-	struct v4l2_mbus_framefmt *format;
+	struct v4l2_mbus_framefmt *format, *src_format;
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
 	unsigned int border;
@@ -1997,8 +1997,16 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
-	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
+
+	/* Crop and compose cannot be changed when bypassing the scaler. */
+	src_format = v4l2_subdev_state_get_format(state, 1);
+	if (src_format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		sel->r = *crop;
+		return 0;
+	}
+
+	format = v4l2_subdev_state_get_format(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
 
 	if (sel->target == V4L2_SEL_TGT_CROP) {
@@ -2043,9 +2051,8 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	}
 
 	/* Propagate the compose rectangle to the source format. */
-	format = v4l2_subdev_state_get_format(state, 1);
-	format->width = compose->width;
-	format->height = compose->height;
+	src_format->width = compose->width;
+	src_format->height = compose->height;
 
 	return 0;
 }

-- 
2.52.0


