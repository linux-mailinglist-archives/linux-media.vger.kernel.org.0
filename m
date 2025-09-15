Return-Path: <linux-media+bounces-42519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CEB57086
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D89189AF0C
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8CD22877C8;
	Mon, 15 Sep 2025 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SOWsV4v3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447F1A5B9E;
	Mon, 15 Sep 2025 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757918427; cv=none; b=mySPuC5IBLdn2HZoxXh2OFWNm+yyMAhIrS6ZSxv+GnCK2glfDHd1tx2TJjaEmM5q93NUWaodxsEMhCPfM4j2QOq7J9mbPGbx++LQb6vqTiRwZhHC6ZqHxyyqsfEMYKAmM2Eh/0FS3AorqVztJYPY69HWBXi9bmd8bJoz0b+fXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757918427; c=relaxed/simple;
	bh=1oATAxVL9L8+W4Wm3xhU3r66jDl8E04elcLrcxGUIqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Swy0CldI4Li9POhlx0l/P3SH+uBZyrI3lUc6xMdgUa9sWgEVKQi3w43NZpol6NmAcoE5TtmusJx7viqTRFw0bDWsAboFaDpgE5iAkMDwXbk1BQzuG77KN6p0IBEzWPW9F3nAPNhlQTXm1uTACoKlPX3GzEQi3nzwegTESG9XorM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SOWsV4v3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61A5BC71;
	Mon, 15 Sep 2025 08:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757918346;
	bh=1oATAxVL9L8+W4Wm3xhU3r66jDl8E04elcLrcxGUIqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOWsV4v3s9N3Dr5pzUODuvmtOkJW63u83wkDuwuPQqKkF/esIPz6fp/eA6LAlolIo
	 SUfRI6pNuqJsew1Tp2FBEiRTMtDGBPmOgCN/ZIpKCJzYj1t5sB63OfWR+KZap3+8B+
	 hBn0Pwcy14JHK9WCyPIgsS28N7cCuSb9KQUJ3vaY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Sep 2025 12:09:14 +0530
Subject: [PATCH v3 8/8] media: imx335: Switch to {enable,disable}_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-imx335_binning-v3-8-16ecabf2090d@ideasonboard.com>
References: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
In-Reply-To: <20250915-imx335_binning-v3-0-16ecabf2090d@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3419;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=1oATAxVL9L8+W4Wm3xhU3r66jDl8E04elcLrcxGUIqw=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBox7SWA1eJ64lhrSMyPgpk82+aL4IDQKaIJJ5bO
 c4z/bY40+mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMe0lgAKCRBD3pH5JJpx
 RUpsD/wOIEEjjLU6ju09e/DaXSkUC963kgjfoXImdsa+OknPcGwx7N1sKmnIIfPusA+6odip+5b
 YFQwMqrCui8acoANCajSHi/x/zBRchmA9XBC+U/9/gN1IAxj7ejNbTosDOKNEkg3uyGKfMqd84r
 JO4XxUVJGP0BJPRGOzcC4lP64ZK8PvDJbS+cSuFYoe3rp7sSES+pkrC5N5i/+/s6F4/vHV3eDSB
 fng06pwgIbVNuyqjWlCPdiGb9DxK8UKZJnYK1iolxtglwNV/sdPzeaUkM/y6rWiWM3ijbxG5Q5y
 KMotxWLa0MKA0nPTQltspr1DPZ1Wv5dP8YzSLgnN5ssiXHOAt7QdMA8hPlLEAxDtoEhqqbhchPk
 aLhGTDxB1LvQjR6XQQYkGYd2iUkSdQQc+Mm+OxxZiml2CXgjAlvN+GhC2W5kJrhzTBOKPwgr/m9
 OKjMXjhmqMCUCIdIYK3/fOC3KtDOkXT7G6BmHKP/qWA4iVDqZm0wCV5oKAYmRBCmKCiajurWrn3
 QIM/hRrHfuci5TewvlPCZ+hK69aM4OjFyxjEO84DYjIVc02cPo3LBlGTWdxoQ9HXU/SJC1ObL6j
 VKStLlGWwk4O1l64K/NcjTNolZVGloV80d+sD0Sgov6Do6gZ4NtDXiMnvkLZaWBG/af0zyv4vx/
 eRlIdIhzDuxHbfw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Switch from s_stream to enable_streams and disable_streams callbacks.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 53 +++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index e320c7e6fcede823bd67bae617c24196cbbed8c6..ebdd6ef534499a1d518977675c16a78c31c71c6d 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1019,13 +1019,19 @@ static int imx335_set_framefmt(struct imx335 *imx335)
 }
 
 /**
- * imx335_start_streaming() - Start sensor stream
- * @imx335: pointer to imx335 device
+ * imx335_enable_streams() - Enable sensor streams
+ * @sd: V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: The pad to enable
+ * @streams_mask: Bitmask of streams to enable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx335_start_streaming(struct imx335 *imx335)
+static int imx335_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
+	struct imx335 *imx335 = to_imx335(sd);
 	const struct imx335_reg_list *reg_list;
 	int ret;
 
@@ -1099,37 +1105,24 @@ static int imx335_start_streaming(struct imx335 *imx335)
 }
 
 /**
- * imx335_stop_streaming() - Stop sensor stream
- * @imx335: pointer to imx335 device
- */
-static void imx335_stop_streaming(struct imx335 *imx335)
-{
-	cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
-		  IMX335_MODE_STANDBY, NULL);
-	pm_runtime_put(imx335->dev);
-}
-
-/**
- * imx335_set_stream() - Enable sensor streaming
- * @sd: pointer to imx335 subdevice
- * @enable: set to enable sensor streaming
+ * imx335_disable_streams() - Disable sensor streams
+ * @sd: V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: The pad to disable
+ * @streams_mask: Bitmask of streams to disable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx335_set_stream(struct v4l2_subdev *sd, int enable)
+static int imx335_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct imx335 *imx335 = to_imx335(sd);
-	struct v4l2_subdev_state *state;
-	int ret = 0;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable)
-		ret = imx335_start_streaming(imx335);
-	else
-		imx335_stop_streaming(imx335);
+	int ret;
 
-	v4l2_subdev_unlock_state(state);
+	ret = cci_write(imx335->cci, IMX335_REG_MODE_SELECT,
+			IMX335_MODE_STANDBY, NULL);
+	pm_runtime_put(imx335->dev);
 
 	return ret;
 }
@@ -1249,7 +1242,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 /* V4l2 subdevice ops */
 static const struct v4l2_subdev_video_ops imx335_video_ops = {
-	.s_stream = imx335_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
@@ -1259,6 +1252,8 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.set_selection = imx335_get_selection,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx335_set_pad_format,
+	.enable_streams = imx335_enable_streams,
+	.disable_streams = imx335_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx335_subdev_ops = {

-- 
2.51.0


