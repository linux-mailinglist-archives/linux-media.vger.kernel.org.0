Return-Path: <linux-media+bounces-45992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE7C1F0B4
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 09:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9A73BAFEE
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 08:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873D733F38A;
	Thu, 30 Oct 2025 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cW/RNcMW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5A21770B;
	Thu, 30 Oct 2025 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813840; cv=none; b=DwH6mtboTXV78kRZ3MqV1Jtnsnnqdlsq1JFZnpd+Rs7ndsqG+/cSvkEYsTCtH1ql1VeZFL6a5yCNDuBQeozKdKVDePJiSojPNFgVd7lvfbeatfRt5peh/DUeNNDB9vAlDflzMIUk6XG37nQi4BDAz6Oaqdodxef4TwQWGEuWx84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813840; c=relaxed/simple;
	bh=9In6pxPNUoqOT4j2XRIApFPGaJyS5HYdYnHdhN6GgAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DxYHDwww/dujChles/S0/EY30A607LSM77YNmKOkVAXY0nvsJ9e1/5SJyyD+OcuCF3Ljanqh4AhHSgwTMeKaCFoOinDBtV5CplpJwgUL2cRD1JTRpsn2upbQKG51zsQVjmVSa0DXhbsNHfiop/oWLbdlusA3d5PNKyEtM+R2Ba0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cW/RNcMW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8BE61A8F;
	Thu, 30 Oct 2025 09:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761813727;
	bh=9In6pxPNUoqOT4j2XRIApFPGaJyS5HYdYnHdhN6GgAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cW/RNcMWIn/zX0wv9XMxBNejlyKGqovK6lywqCYWy36Sb7rNzfmV7NmSZj7ETqnTN
	 UTsgcG8bnnkhl+KaTLwtRORUSoyHCCU6/1sbO4cVNfUAGLKXPOdCMtRJZBZJwVLcP8
	 HJmwVupGOaUjjUC09Y2al8Zx627n9P1Dp1lYylzA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Jain <uajain@igalia.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 8/8] media: imx335: Switch to {enable,disable}_streams
Date: Thu, 30 Oct 2025 14:13:01 +0530
Message-ID: <20251030-imx335_binning-v4-8-534f82415aa7@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
References: <20251030-imx335_binning-v4-0-534f82415aa7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Switch from s_stream to enable_streams and disable_streams callbacks.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 53 ++++++++++++++++++++++++-----------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 7e6e9950e60ae887db3a1f70e38fa7f9adfee1c5..e94d9f72027c8a32b25836239bc8d58c55c7ee7d 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1012,13 +1012,19 @@ static int imx335_set_framefmt(struct imx335 *imx335)
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
 
@@ -1092,37 +1098,24 @@ static int imx335_start_streaming(struct imx335 *imx335)
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
@@ -1242,7 +1235,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 
 /* V4l2 subdevice ops */
 static const struct v4l2_subdev_video_ops imx335_video_ops = {
-	.s_stream = imx335_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
@@ -1252,6 +1245,8 @@ static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
 	.set_selection = imx335_get_selection,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx335_set_pad_format,
+	.enable_streams = imx335_enable_streams,
+	.disable_streams = imx335_disable_streams,
 };
 
 static const struct v4l2_subdev_ops imx335_subdev_ops = {

-- 
2.51.0

