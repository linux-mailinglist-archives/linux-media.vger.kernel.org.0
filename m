Return-Path: <linux-media+bounces-49477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE8CDC373
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C8AF3057605
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA43B33BBC7;
	Wed, 24 Dec 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Otxwk++T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFac1s6M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445BC33B96B
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579495; cv=none; b=TtWc1c9nr51y9c1jTLeV2RD8k1s657dDwsKa8iLwo2oSyLxzxXd7zs0HqLnvyTbO906ZMmPhc5QO0m9eKLARkPKfvyMoAzuv1omqyqqVpKPm/+qpOyZuh4TvIvrzur6hw6iDbjkI6voLO6rSco0PtATKIgO8ujkDKxLx58EzX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579495; c=relaxed/simple;
	bh=cWVomP9zKRf6u0DWxVAunI1OwfFHHapDxWq5Lw22DN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZFPkMYApiUo0h16Vsb0JlWzci8JK3B2sGVIFEVbExFCD72PtEVNWZVx6Od5IPa38wRCDrD84NVZCae/lN/2yVQeQB6C7CtA8POZEVRWNyIyjL79dEWDgSByzGwnoWVvCFAzV1xU8ilTUjzaZHwg0cnVkvZWlvvLx66/5C9M2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Otxwk++T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFac1s6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8wHX41206421
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P63PUFn7+yRVOLLrjL3JxfKbtV0eP4+Vc+xT8X3UBss=; b=Otxwk++TAA+sVTek
	FNMwycbpOTmZUWltM+AV/+MrE31WIIiYQv+16QiYyT1Z9mEHt5Bfse034BrK8ZC4
	JqLjuZtQ1pVituYoQ9uMjtix/dmxHGzYcne0uSw2nHwABjS9kDBBN+y4dYK8LjZu
	4+trOs3v25jSdfKrDwvKq/R7a9RP5Ag2/4/BnNfDDfARXlBBIMU05YV0H6N6hZe9
	6JiLs3hsH+4OxUSdhnKV47pLT8WO60ViGDvEmv4+zI3WKlNp3UUt/SRvvuFY4vma
	JYzeIS4Ec7nvjTM2z2Or6mFU1R5cOJn9NgKjgNPnMuEqxxhg+P6nqdcX+BZsTpu5
	c4HIkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r23nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so1922900185a.0
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579491; x=1767184291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P63PUFn7+yRVOLLrjL3JxfKbtV0eP4+Vc+xT8X3UBss=;
        b=MFac1s6MxQtd2v+d1ffb4sU/BMUVU+Ny8Om9uqeXiyigVDkMvLuf1UfNK96paRBQSH
         38xBVHqZ7OPzMThVMAZhlaxJruBs65uPXrnqCV1WUSxCYfplGOfL3XrrtXfCIQNlGxkt
         tj8YoQyQWojS2mb+zc7wFCPp68cNhyv8HkB+jReFHfOY4uAL+LEO+BCaAwWZoDB/9M92
         9ZlpL+rTMpMtOaM7XxuQyXwqIxD7ig/usmSdbgSqdq7/4rPRDDuU9tiFRxRGseL9Zk5Z
         jz2wUMt982td6qKUnBmW7VqQmpM4llZxvMJxBSc7j5TiUlQIVcoJc4hWfm0CcAtRpI6G
         pJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579491; x=1767184291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P63PUFn7+yRVOLLrjL3JxfKbtV0eP4+Vc+xT8X3UBss=;
        b=pSYhIvOT+C+FZ5bdcarYEXA28tO7h+w2+7C0JISJj5zDBw0dQEC+np5MOcye61w6wu
         6WitiEJ1l15fO7OcuXW61W0M1RFEuCVvaltTy4ib1W8rxuXIwJiRyYetK7KiVuhyL4gN
         vQedxVoFvpHvwRq7sRq+ur3hRVUaf/HR8O97O5ps5cDxLu28JtlM0DiuYnbnJeuCeSuh
         +Lp8mDwRJ6Aq840asYswxJfCvuKtvk64hw4wBvdT9YMK5R+0p9hSMbwoCmkSIPx1tKfx
         FAwuo4AbD6TQTtHBKisQESbwoxgPi2SlDVcxPFyHkmjzDSujrhqjUbgx2qxUB/adX42H
         3Xkg==
X-Gm-Message-State: AOJu0Yw0ApFZktvh7qASyO3GfcflQ4XlsdoMtEno+r/qEmxsv8OoZoWY
	KpatzEZUioO/QabuFM38VbW4J6VYjF8bv9xLOET1vxmlydfgQ1xq0yaCZNX1OVgYtvJSzpQ2UOd
	lT3eTADw0go9jeANUxE5Ft06wlXxWYawXCQbMXRrSSBijvDWfbCq1PKIL0CgMrxtxfDdS9E4qZw
	==
X-Gm-Gg: AY/fxX6pH9V6gzmmiuDYl9lzMEFQFNONpkJkqgEg4fq+1+KZypyNMt572d4Fv6sAH4E
	+LuJ2JPLsctMWsNDlANMCBu319plsEeeTen0nWAecBXoIFubgUnErD6Rmmb9jCNKkGJQnKeVWZV
	BTtrSJEH1e8NAVxmKJv1VU/NaIuPJ/I6V7DrCU2qr1h+9EmWNa/Ou8Ge+HWYWZYnWU20JhlDQvz
	U5FeZ8sa9LRO7xaa3B0HSRId5/RE4FJCxyl1TU/2DX0nIF+1VyfF9ExwjnmGg5EetoBbk6UfQHs
	gfZCCY3TrmF86+k1Zrrq+VQLRk96RZzGuSgGkfvbboONx8TdqV3bPJ2+0WmzkTUjwziCLRjkHZS
	4bxa44EGHRGT+lwMAEq9bh0ZHakb137Bd8JfUGltYYHvNYwPYeQaq6WyZs1v/Mlr/udiMMEi98R
	uINDQC2htcfvDgFrvpYKoKVymeekgIeDSk5hQhzNJf
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr242894311cf.72.1766579490921;
        Wed, 24 Dec 2025 04:31:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVGi8qrNoMP9+F4grb10LDVDGsvOdEj/9cBMbDMcbw3OsAYgQqTLzm+ik5WDUgIS9C30NqGw==
X-Received: by 2002:a05:622a:28f:b0:4ee:1563:2829 with SMTP id d75a77b69052e-4f4abdaad3cmr242893801cf.72.1766579490411;
        Wed, 24 Dec 2025 04:31:30 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:28 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:21 +0100
Subject: [PATCH v4 12/15] media: mt9m114: Don't allow changing the IFP
 crop/compose selections when bypassing the scaler
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-12-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: s97G9MRu-N_HfkuhVTKFiAzmivx1Vpoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfX+0CD3yFc8Squ
 dpu/RC7uRU/QNvj3ydbxk/GZHjJj8HJRy6i4ZJ4t+cy9EyHpcX2jo96zzQQz6eiSuPhpqVPa1Bw
 lgoUdbd8JjnqEnXhGeZ/Gu9qltmPrwPn1wrGb8D5UKbbzodamzEkcsQV0GtpEGFEd0yRr9BqVSa
 36Igmnl5IqG/aPwCPM/IVdqoODvW6GAWQaNt17Oe7ZoN9ogwL7FTsjM5DGH//uGl3T1eJ9vhXop
 ikPNNR3af+TeRBL6dyFnEY0PIgSyGkl3sjAPvrM/uNYYaih7eb4WY3drlwhetaaAlmll9C5oYTw
 yEZRlVmfW+LYcmQflvD+QSE86aUCTEjO/FS5GCBMEyN/7KO2Gnh9MZpomzji3eQXOFuqLYzo0vv
 gHmqk6Q2RCnS5TWoS+CDpnYyKqW5J9AA7UfRGeRABwjMvu+4sFKzXVaGq4PuT5UYW9/HIDjZvmU
 HDsd/h4VjjBhDV1YgOA==
X-Proofpoint-GUID: s97G9MRu-N_HfkuhVTKFiAzmivx1Vpoz
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694bdd24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=FI8FN61yIa-P2m5uk4AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240109

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
index 8e0b5bf6db621d12b36f578b6374377c69503976..447a5eb34a6137a8e87bd119401571b5592fc77d 100644
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


