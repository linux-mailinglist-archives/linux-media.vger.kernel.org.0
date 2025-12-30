Return-Path: <linux-media+bounces-49751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A06CEA403
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C9B90300384D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2CA32F754;
	Tue, 30 Dec 2025 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDyPXCKl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2K5/tG/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A87081E
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767114206; cv=none; b=IBcuFPhooRzfaQ2rWtMokRRyLh6NOgYxbek+KTyeRW2oJ1aKjpmS6hf66/esdvHcdRdVNDSW/Q7KtJC6YpcrJR85mZxGjcDNuN5JsuFYxN6oGnRPz+GVu8ZKXg/Tdq/YxzZdEKxIzUYXnHKwtMFOwAoh1TnhNPTd2yUnVR11nV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767114206; c=relaxed/simple;
	bh=pUcV1dbBTQOxDk0ARdiNFmxLQfbTJhPxGeN+tE1pFF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PCnO5bM2/pa85hDlJWBgfSHG0DMuUu+Uq0xOR151Tx0godrvuGQZgXTL5WrBI6OAlRFRAxtxa7Z0aMMfoc5gIqayEmAzxvvurZ6y3y/kmwlWmM2AdwV+biwu+QdcVyCd5fYhwAnAqxhcSPXDDU3PT+KQEyqghVpbSIyo5yXkUrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDyPXCKl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2K5/tG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDQuWl2546886
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/WEOACPXuz2v8eCCxwXJfIP8bRHqqSF490HJaExyDI=; b=oDyPXCKl+D8PLMpb
	QDz+bzO7J1np1ugrveEAllXfS7IL32+eTuJZM26g6C9lLkmhmLMhCQk2abO3LJqR
	xV2PLYaF3wmYdMmPhk2WoM0t26IWQXS8olwrQYnpGFaesJcGw718sEqywwaV2ixQ
	cmCaKxd2fuljLZIbl6eBWNCuMi/fvxqA40wGdGOoy+UHQcpUrfYe9e10a5ZiYkI3
	6EC9spOoEg16IJF2GShiQRpOA6tnnBfIBs4pyc17Za5B8JIi06eArZ/kxABqg+mO
	JmHfkTVvlY0Cwti+xduGYNV4xrEVfEtz32cJzw9jHfr27um071qiKXTm1yR5fsUn
	WfSqbw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc7399san-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:03:23 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64680de9f05so10748338d50.3
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 09:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767114202; x=1767719002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/WEOACPXuz2v8eCCxwXJfIP8bRHqqSF490HJaExyDI=;
        b=a2K5/tG/3Oqd8ZM64pyiQ9SLT1HbiuZkPF/hTIQTUcDt9zils4ZNKBcoCkIPg1VYUG
         pb31WYfqxuW+HIi+ikySFU9GJWO51GmIF9UCcPd1ixiGDZ770f0VrMP+Fe7mbWTHuh/M
         S/EQhCXc2ezj8vlKzGnVXv08/exPZvpSvbcLlZVXjZ/oG3plfhPaE4UBeb5xcKZjlLVX
         gCVLLsYv8TL/crRpzG7/Rhd997LaFkuMOVbjz44tPI6Uff50Ec8fQVYw47Gsbep4OcFZ
         7HJ9/rIZBstvB/RRiuX9n66YHnBLWsa5jW0RWfePBSLTqG9VOj4J5BRSCjmXM7q1+JQ1
         8oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767114202; x=1767719002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/WEOACPXuz2v8eCCxwXJfIP8bRHqqSF490HJaExyDI=;
        b=REGy/zg2rLWwjT5eyT3Jkob/S8MNsXyfc5d5HPAs/SZMg7QLE18++HqC2IBFJG+ZgF
         0Zq/iXgDk15Wt3Bmbkw3GvaMU751PicaN0cbgdPUyS87A9UNrbl/VevhYxopi4/CPlVw
         2HrO0uy0MvgPbhxqv1JUtNcuvp2BjTbKrvLk1MY69eqLeWrTM230HJhBe1JauZ+9sz9n
         3gSoL4JWyNJcCu8Zti/ukhglbr4RVd9vZOt46v97X5Tb2vLXxIuPUrHNuFkhq0LwMBgT
         BVqABVNvGILaGwIToPZk04z8BfS7aEXviMZA1oQp12IzD2YE7PRxtqrgQHRFp1uw9uZV
         u6dw==
X-Gm-Message-State: AOJu0YwSp4srg/+ABHa2OuY1VB4jMjtECRS1YG0uw2ZREpIc4EckRGZb
	PrLxOrqfWjel2VB6UC08xGQqEevZTGWim6t7PyMCuYgiiw8Hr7vwjkCAB2DGoIE7aw7bMV4Y5XW
	QmTeo+HwGf826nQu580/SUl/G+KTizdler8F7clov7XSLjcX+uxbnRJI76QMDzS5xmA==
X-Gm-Gg: AY/fxX57mepi937JQgKO69zUcyun9kj67zg7r9HtbjoVuIrgKxT7Z/eVsB77aRrk6nZ
	BRXXhb2jtF1KcwN02Cb2KYYq6MgwY4cOpdOm+2CQtJMCj6cOjtrrS2Z35ujcW1zj5nsTQa+ef2q
	vT0mCVia4PvUAVr8WjVmwYOKb4jvHZ5JLRNcw+nn34kAmL0ovbJ6XAiPvYpKpzUW1yoJP83kmH2
	7KQFmzpQTC1jr7iv4ifGhWe+t1vYS34651SNX+JQmtb/AizxIymmcJWFrgKjmuEt1UJAU1ZH2tS
	FWpM3dcjREyQdg8zNi6K6jTHLWabUdOGoSjY6YLustV20AYTvkskn897oUpZjRqJlCMfWahQFvu
	+SmKaP0FlsKvURlO/EJcT652McO8yf46x1wtykEWqj+C3LGZNk2gxrvo559sWuRebuS7EEMeVdq
	HIv9eVPjO9JAry9ykqNd9lZqH5BJ9SO8EpteJaf/Re
X-Received: by 2002:a53:e18c:0:b0:644:4625:8853 with SMTP id 956f58d0204a3-6466a847258mr20117770d50.34.1767114202319;
        Tue, 30 Dec 2025 09:03:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy7BfSa3UN/TFpEWlcJ/RfJR8aNQfRjlb1bnTg8p5j/l85AX6oqRJWvGcHnoWq+bCokGLRzw==
X-Received: by 2002:a53:e18c:0:b0:644:4625:8853 with SMTP id 956f58d0204a3-6466a847258mr20117746d50.34.1767114201901;
        Tue, 30 Dec 2025 09:03:21 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a5bdb9sm3776086266b.7.2025.12.30.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:03:21 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:05 +0100
Subject: [PATCH v5 08/14] media: mt9m114: Add and use
 mt9m114_ifp_get_border() helper function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-mt9m114-atomisp-v5-8-763539e76094@oss.qualcomm.com>
References: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
In-Reply-To: <20251230-mt9m114-atomisp-v5-0-763539e76094@oss.qualcomm.com>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: T8yM0khM4WCdKWkzXAk1XxMjmU8Lkvtn
X-Authority-Analysis: v=2.4 cv=HrV72kTS c=1 sm=1 tr=0 ts=695405db cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=i4UVPg6hQqdO0Jw5UB8A:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1MyBTYWx0ZWRfX/XbzAdn6TpaJ
 yilUxGf4S7itY+/WVnB97bWmr8pSwaN/81TuMY7aHdzIUMS7V4drgJndEHrfK1L9ZAinTdz9bSc
 w7//5ww80XmF2F/HLIOFSPtjubdNp1T9ztv3ByAgTjdOdRRVaqLuzYiZQyCuwstRCeU/t1qTANZ
 GKGMjCuHaN6DmG7irRB7mCyMJIwvE4GL6l56kbzOc3iKrKXcRW22Niki66/BG5kVm0924wSl+Sy
 ncunCZitDWR3KfH7ehn96J0XJxU0NlZjnbSqtbSDypqzck9XqhQ/7IamuYbK2C26iv4nuoBLZ7s
 9K35xmr9Ri8PZdEFP1cieNUOW2oSmnpJApuAVAEtiBkTPghzVrcZQopYeGzD+Y7rJEo7S+pvTc7
 BvL115Zi0QVWB8vLuKy0RxPmQupjhU9RoOD8rGohSe6p2INBBW+WQP6eGrTneFvPqoYgBGmJGum
 5Y/4XdMHrM4ee7H01AQ==
X-Proofpoint-ORIG-GUID: T8yM0khM4WCdKWkzXAk1XxMjmU8Lkvtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300153

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
index 948074e976bb124470d6a8677a24e096c3033f71..4529320ab920145dd7055eec87a9bcb52e91a54b 100644
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


