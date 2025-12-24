Return-Path: <linux-media+bounces-49474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6766BCDC397
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 13:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B5F30D3E3F
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A963F3375CB;
	Wed, 24 Dec 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTJAkF5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfluANE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836533A03D
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579489; cv=none; b=osVcufh/CwlevBSURl9nG6OqhL0XAIzGFMIMbP881Br51X3AIgTIyhQucGzGtgExKTmA0AXBHH+oF2q7SMNxFqNkdRBKw9qAUveAH9VR0WMlX0X2JYDsQCPIDakJz4d7+Aa4V5EFuvMYBID7NEOpRaw9GjUCMPYoDkeNKX74fm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579489; c=relaxed/simple;
	bh=GnUWOa3VBsR4gmkhJCVwGtjntBcK89nA7VAPyOK4F4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiD6jm7yUKuB4WLWlpFEnZZju7LJk+mIx2QxirBlJp3cL/9OMSzAasbkjRwjjGkhE0GUENaHUAF7Q96R2uCeizLghX1RFFkh2Dwo6BjMP0Dbsy6ObZhbqtnKkR3JLFqs+UzkTDJAsXcXXW9wsQ8FZHFqX1OHjBzYpecaAEKA49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTJAkF5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfluANE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3iEh64134076
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2OXQlRUL7AWs+8ZQ2sk6llVByOKJ9yUAc8MgYR01bWY=; b=jTJAkF5OmpnCMpkW
	i3+DhLHSrVzg1/E3f+MSvGR/Gxu4mgvGqgJBdVtT4rYFi6D4HIYAyKa6GeDocGh9
	2BUf0Y/rXHpp92mW6YmvNcDo59Jpmn0vAON8J8Qsln0JkKV9er0iwqcTDH+6JFWw
	me+4CuvU7FnGsQvyl6BtmsQORaHmjZedlRAZavIxNmcSjfdpdifpYYP4wOg+bsD5
	KpTFzWHAvovcgeOsO4NpCul0Jec7SNobTe6V3IOzGOSkDiOrDu0LX2JT4w6cy/2k
	4kqajyXOQfBRrrXD1R5e55NGHyrmj67s1QocDxrLu0eraVKaD/3V8dJHmHnAk+m1
	5nW8nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46u1aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 12:31:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6855557aso147217941cf.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 04:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766579486; x=1767184286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OXQlRUL7AWs+8ZQ2sk6llVByOKJ9yUAc8MgYR01bWY=;
        b=DfluANE7m38DDrIRfQV1uEp0yZkbU3mUmGmoCfHPTyULeOny3SvBUpsNia6MOaElCH
         /LYxlGE2ZEsmZHizA8l6neiTVpd+MoE3F0j/PFP+ELt6uxknMxlQP3oL8k8Ld8KGvngM
         TXJX92c+KX2w6Pj8m0MVonks3SKpwZqJeBuxG+eVw3f7/HDR00Wm0Be/uj8RCEilYKGI
         8ZLXXQFp4If+uh4/AwhtmuTf9kgOFNBsPgAX6u0w3R77qz8BJlbB+qAvJ6tLefbyOTRl
         jFFCDU21FhV2rv1Ygx95DXJLmDlo0RTIjVvYixvFui/eAIVQ1XYFhfB1k+S5PPvzuhpe
         /aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766579486; x=1767184286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2OXQlRUL7AWs+8ZQ2sk6llVByOKJ9yUAc8MgYR01bWY=;
        b=BP1k1nnwZLjqmF1bTgOEFdAhYyEExc7bBFnGTAps4YDDlpIZpqpyGQNvh2AnwyBZq3
         uBvhzcMCE+Rqf460LnRCxG+ThiHZG93hGwFUWCNHkrNTneZ4g21B1INIY19DAsQwaZti
         hcYdszNWHHD8jjI7yYvyijdsO74dvRBYih3Rw+yi+grGpTjgvPUJyZTjKliHqEVj8/nQ
         mH3zOwSR4deq44L1/PJx4GmgELf/LMEJTmyic+UqAzySELQNUK0B0O0cAvlgshkj1xxO
         g+nI3sE57+Xv1omXY/1U4IlNxD5kHNFFGAmoWLymObZcfUke+JhC/knTsyIkgDMMpEaK
         WHRQ==
X-Gm-Message-State: AOJu0YymXElUw+PvYpqxUJf1Hdpv3OtwXkYCi4iqW1NP0AHc8XgG0sPj
	b5XICpnbBRchzNPE/AkAnc6P5yEaZ3/YNJMkMwnwgALQWrqrczF9o/jiAI+ZNvHodrrXfBEnP5T
	V+e5rjg6Q0fMTkc1PWXv+TzaRSaflS2837oxN2srLc1vWgKZiahA9WocGFqR+PDpTKw==
X-Gm-Gg: AY/fxX6XeFB07SSwRrEDC35u5kZKng+Q2pmXYmCnHoYPLTbEwpjn1mqDc7X1tSMAXvr
	+YiKzbQFv5ZyiygXIwxqrZQbJS7Gncbin2h6rYXPCAlXyJim4xE94zeIkUrNSMhVlzdpt+TuFNG
	qjEzmUQSOZTu80qxcKhOhsVhiMRBfTyFExTF41lTnjQomFJIevu19ve2bFN7SfegLINg4ZMBR0N
	TARZHtqkQXlpPEf7PYNfkrxbcfy7zctthv26VwwCJlHqox8L5gQ9iDaYMz4Ks30+l2aFCIVBXrB
	1Qv5qbPna9Ps24Ea4+8HpQnpryhRLmg6mh5N+I1OeHTAJWya0MPp42D+mXTwfgVm2w9fNZ+uV3Z
	DvsgLBsZ2UjcjYrdl9lUE1KwyiEsa25UV73408z9dvWFE+8mjDVwIpPc+4/z7OrvqQV4hpQr1HE
	z9mGGfTBobznmahZebhAw/1RkEvmaL2kV6CR/ORz6m
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr282721171cf.8.1766579485938;
        Wed, 24 Dec 2025 04:31:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlek0AVUOYek4yOEMcM/N3Qsy8A2nfqDeLRiVKPWR4TrVTPYIorwufCJ7RDA7tejl3X9wO2Q==
X-Received: by 2002:a05:622a:199d:b0:4ed:ae94:5f5b with SMTP id d75a77b69052e-4f35f3a046emr282720781cf.8.1766579485526;
        Wed, 24 Dec 2025 04:31:25 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b12dsm1750304066b.48.2025.12.24.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:31:24 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:31:18 +0100
Subject: [PATCH v4 09/15] media: mt9m114: Add and use
 mt9m114_ifp_get_border() helper function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mt9m114-atomisp-v4-9-60b25da7a1bc@oss.qualcomm.com>
References: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
In-Reply-To: <20251224-mt9m114-atomisp-v4-0-60b25da7a1bc@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: XRoiAReEspDTEPqVrB2-sPZpELmwOkJL
X-Proofpoint-GUID: XRoiAReEspDTEPqVrB2-sPZpELmwOkJL
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bdd1f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=i4UVPg6hQqdO0Jw5UB8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwOSBTYWx0ZWRfXyqwpVGA7Fz2r
 ayg1S+BjhtH0sfqu6Va5z9amXmbdVtFfkSLcFgY2yVRP6FUd58TOXpDpmU6wME7hrwBVfDzl1Yx
 qx7gIqaRju6jZ0ErySe18yiGl5mfL/rzrHtFH8EaJT46zx54nXqPGZ29f+kjt1Hm1ANDKXz4xAW
 G46IoKa73c3KrYdYKrnRNPsxPHK7M2vo20hfW0759lxYxS8L/bgg86ZZJhJV0iqs8TIj4qYUQHZ
 RFWECuU/mWq7svcXMGckUe8rYCUHKXP3Lq+9922cLBHNGlHTkN91g3v6ZcSjakN+Z1fwbII1Fp0
 KHT6EeMTmmpiTRZqALAa4lXajGXj/XDp+shHic6k8hHsFKYfUHpLZiP4s5MzuHYjiTXdSKvVgBE
 4Fn1jEB/fl2juKkEBsqtZTG+nBrhU3i1+bpxmw18gl6mbNiIhZBi/ttf1/Dnwq0znUnLDpY2kx1
 rlsuVZ4fzOB4cdT+KZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240109

Normally the IFP removes a 4 pixel border all around its sink format
size for demosaicing. But in RAW10 mode it does not do this.

Add a new mt9m114_ifp_get_border() helper function to get the border size
(4 or 0) and use this where applicable instead of hardcoding a border
of 4 pixels everywhere.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v4:
- Address comments from Laurent about commit message and comment wording

Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/media/i2c/mt9m114.c | 62 ++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 39f9d20221fee4f1d12c24a031d9f33c953b9a9c..c0710dbb670d4e40e13fc895cf8c84219ea43bde 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -851,6 +851,18 @@ static int mt9m114_configure_pa(struct mt9m114 *sensor,
 	return ret;
 }
 
+/*
+ * For source pad formats other then RAW10 the IFP removes a 4 pixel border from
+ * its sink pad format size for demosaicing.
+ */
+static int mt9m114_ifp_get_border(struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 1);
+
+	return format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ? 0 : 4;
+}
+
 static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 				 struct v4l2_subdev_state *state)
 {
@@ -858,6 +870,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
 	const struct v4l2_rect *compose;
+	unsigned int border;
 	u64 output_format;
 	int ret = 0;
 
@@ -872,15 +885,18 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 		return ret;
 
 	/*
-	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
-	 * and top coordinates to compensate for the lines and columns removed
-	 * by demosaicing that are taken into account in the crop rectangle but
-	 * not in the hardware.
+	 * Color pipeline (IFP) cropping and scaling. The crop window registers
+	 * apply cropping after demosaicing, which itself consumes 4 pixels on
+	 * each side of the image. The crop rectangle exposed to userspace
+	 * includes that demosaicing border, subtract it from the left and top
+	 * coordinates to configure the crop window.
 	 */
+	border = mt9m114_ifp_get_border(state);
+
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  crop->left - 4, &ret);
+		  crop->left - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  crop->top - 4, &ret);
+		  crop->top - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
 		  crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
@@ -1865,6 +1881,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
+	unsigned int border;
 	int ret = 0;
 
 	/* Crop and compose are only supported on the sink pad. */
@@ -1879,15 +1896,17 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		/*
-		 * The crop default and bounds are equal to the sink
-		 * format size minus 4 pixels on each side for demosaicing.
+		 * Crop defaults and bounds are equal to the sink format size.
+		 * For source pad formats other then RAW10 this gets reduced
+		 * by 4 pixels on each side for demosaicing.
 		 */
 		format = v4l2_subdev_state_get_format(state, 0);
+		border = mt9m114_ifp_get_border(state);
 
-		sel->r.left = 4;
-		sel->r.top = 4;
-		sel->r.width = format->width - 8;
-		sel->r.height = format->height - 8;
+		sel->r.left = border;
+		sel->r.top = border;
+		sel->r.width = format->width - 2 * border;
+		sel->r.height = format->height - 2 * border;
 		break;
 
 	case V4L2_SEL_TGT_COMPOSE:
@@ -1922,6 +1941,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
+	unsigned int border;
 
 	if (sel->target != V4L2_SEL_TGT_CROP &&
 	    sel->target != V4L2_SEL_TGT_COMPOSE)
@@ -1937,21 +1957,23 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 
 	if (sel->target == V4L2_SEL_TGT_CROP) {
 		/*
-		 * Clamp the crop rectangle. Demosaicing removes 4 pixels on
-		 * each side of the image.
+		 * Clamp the crop rectangle. For source pad formats other then
+		 * RAW10 demosaicing removes 4 pixels on each side of the image.
 		 */
-		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), 4,
-				     format->width - 4 -
+		border = mt9m114_ifp_get_border(state);
+
+		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), border,
+				     format->width - border -
 				     MT9M114_SCALER_CROPPED_INPUT_WIDTH);
-		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), 4,
-				    format->height - 4 -
+		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), border,
+				    format->height - border -
 				    MT9M114_SCALER_CROPPED_INPUT_HEIGHT);
 		crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
 				      MT9M114_SCALER_CROPPED_INPUT_WIDTH,
-				      format->width - 4 - crop->left);
+				      format->width - border - crop->left);
 		crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
 				       MT9M114_SCALER_CROPPED_INPUT_HEIGHT,
-				       format->height - 4 - crop->top);
+				       format->height - border - crop->top);
 
 		sel->r = *crop;
 

-- 
2.52.0


