Return-Path: <linux-media+bounces-34495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17655AD4ED8
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 10:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FF3A7A2779
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 08:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C6244661;
	Wed, 11 Jun 2025 08:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZUv3eQIo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1546226188;
	Wed, 11 Jun 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631791; cv=none; b=o4l2LM4gj06MBP3zgW9M+tGa3GBjMz8rvjLZ6oLMO5sZXAXYByRLN3QRUG24UOpoCmgzSVgQ+Ma3WOPr20qPLXaI7z8Y+KfWKFX1fGAQUMJdeFr7tQiDOwTvXlcUuuLAgx+31kchtp2cldr5cfDwcbPb962QdwioSvqw30piMP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631791; c=relaxed/simple;
	bh=Yw0tSDhx4H5PFErf8hbWoAVIowk3O6olILFwOUlhlsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JEbVStL1PBV9aKK7vIvwuOw4kAwF4rJ5v4+0q4O78RLV8fuSP8lUPCshNaZk1uJg/mUl2t6h/HlyALhjmoO+QWeTt5IWP3/wY/6kGaCyaQ01QySrARKIAoJ6etiPD0QUesigmEHyQkIBL8tQF0PlWHhmjAP8QNXcOvRtzJREKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZUv3eQIo; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B8FXVc030672;
	Wed, 11 Jun 2025 10:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	i3kIoHJXGkGuAMMHqDrHAUZaowwR9S+c63q8sx6H2l8=; b=ZUv3eQIoB4zoMOay
	nOsZpq7b4iVUzL0EusvBbR1d5EPJ6lbxMz6+NrbI1Nr8L64/4j1Iamnx9opo5H5W
	y4Ogd2JmKFjQm4Btwbi9QQfXgotnKrhClbXUpjyP8tGDnKwuyKQAk7X95GYR+Cf1
	AqD+HbRHuDCZtmmaz0GB7fM1mWa0wtXtzrxQ9yAKFkKVIGt+51/zpdRgwaRD0UhZ
	LKPsZceoz85kecTeRTMtZol1TpSNrNQOJGWlTojTKxSmQt0RE7E7jW5m/7YfuJR+
	wOJIEXmXQZiF2+01oCsqUt3f/E2Zo2OPT5Urj88vDd4jviDgUkXNHU7ZejBH0pIu
	pl8vLw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4750cnx3ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:49:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A80C40089;
	Wed, 11 Jun 2025 10:48:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF3E3AFF5E4;
	Wed, 11 Jun 2025 10:48:41 +0200 (CEST)
Received: from localhost (10.252.5.102) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 10:48:41 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 11 Jun 2025 10:48:33 +0200
Subject: [PATCH v3 4/4] media: i2c: vd55g1: Use first index of mbus codes
 array as default
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-fix_vd55g1-v3-4-ef4ecf15ddbc@foss.st.com>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
In-Reply-To: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01

Factorize code and prevent future errors in case of media bus codes
change. Rename VD55G1_DEFAULT_MODE to VD55G1_MODE_DEF to mimic other
macros and reduce vd55g1_update_img_pad_format() name to
vd55g1_update_pad_fmt() to stay within the 80 characters limit.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index dec6e3e231d54a742bdd08ff2a506c152bb89429..c0754fd03b1d5e947dc5e24e9f54d98a67a23376 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -111,9 +111,9 @@
 
 #define VD55G1_WIDTH					804
 #define VD55G1_HEIGHT					704
-#define VD55G1_DEFAULT_MODE				0
+#define VD55G1_MODE_DEF					0
 #define VD55G1_NB_GPIOS					4
-#define VD55G1_MEDIA_BUS_FMT_DEF			MEDIA_BUS_FMT_Y8_1X8
+#define VD55G1_MBUS_CODE_DEF				0
 #define VD55G1_DGAIN_DEF				256
 #define VD55G1_AGAIN_DEF				19
 #define VD55G1_EXPO_MAX_TERM				64
@@ -883,10 +883,9 @@ static int vd55g1_apply_cold_start(struct vd55g1 *sensor,
 	return ret;
 }
 
-static void vd55g1_update_img_pad_format(struct vd55g1 *sensor,
-					 const struct vd55g1_mode *mode,
-					 u32 code,
-					 struct v4l2_mbus_framefmt *fmt)
+static void vd55g1_update_pad_fmt(struct vd55g1 *sensor,
+				  const struct vd55g1_mode *mode, u32 code,
+				  struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->code = code;
 	fmt->width = mode->width;
@@ -1229,8 +1228,8 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
 					  width, height, sd_fmt->format.width,
 					  sd_fmt->format.height);
 
-	vd55g1_update_img_pad_format(sensor, new_mode, sd_fmt->format.code,
-				     &sd_fmt->format);
+	vd55g1_update_pad_fmt(sensor, new_mode, sd_fmt->format.code,
+			      &sd_fmt->format);
 
 	/*
 	 * Use binning to maximize the crop rectangle size, and centre it in the
@@ -1260,7 +1259,6 @@ static int vd55g1_set_pad_fmt(struct v4l2_subdev *sd,
 static int vd55g1_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
-	unsigned int def_mode = VD55G1_DEFAULT_MODE;
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	struct v4l2_subdev_format fmt = { 0 };
 	struct v4l2_subdev_route routes[] = {
@@ -1277,8 +1275,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	vd55g1_update_img_pad_format(sensor, &vd55g1_supported_modes[def_mode],
-				     VD55G1_MEDIA_BUS_FMT_DEF, &fmt.format);
+	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
+			      vd55g1_mbus_codes[VD55G1_MBUS_CODE_DEF].code,
+			      &fmt.format);
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.25.1


