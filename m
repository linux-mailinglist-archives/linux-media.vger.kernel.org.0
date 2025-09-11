Return-Path: <linux-media+bounces-42265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC18B52B6E
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBEAD16E93F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32512E62B1;
	Thu, 11 Sep 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b7yuYE3K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FE2DF158;
	Thu, 11 Sep 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757578554; cv=none; b=OGmlsXTuexoZONkRVE9C+w4nt87O3LGIYViQ7Fk5fcDcOy2ARWB0Yf0k+0bGgYLOXZMDAkEAOr+sTN23jl3zQrcUBQzOG2PzkTU0tVkskeQIMC4Bt3D/MX6FB6WHl/9xMiCpFC7aTPi5Mzpg5k93DNg24NljttW5lQYiydRuu90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757578554; c=relaxed/simple;
	bh=59zBBGBXVwiK8KdUtCF+f5sq/Ca4rZOdlUR6YSCmksE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckvJmBWJEDsRgo20V6nJRa5yh3O9Lbm1cHZzuU5xggkpS17kdohku0KPFiEJgaYZQL/6vBe947EJ4XoyOzbGwKu0gc27pueckpmhAhbvSpkTYCSsD6GOCtSrUxCAQpHdGd5Q+JV5/vxFyVWer/uQmbV602kVilm+LugbCDX7fe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b7yuYE3K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0FD66F3;
	Thu, 11 Sep 2025 10:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757578477;
	bh=59zBBGBXVwiK8KdUtCF+f5sq/Ca4rZOdlUR6YSCmksE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b7yuYE3KdzifpPGrkIN+DmVo9oD2tkHdZdZqHa6ZV2STwkuYNtQTS+XXB73AeZrxe
	 egZ9sZ0/x2uSXU5fGsTAC8DrkvlR4mIL+Kb08ZNaj6DcsOVifq3Q1Xkfm9VnadfqYA
	 X+Sv2MMvkyemkaGssP6zTFOWTieZOJ0dLln+F0CE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 11 Sep 2025 13:44:24 +0530
Subject: [PATCH v2 8/8] media: imx335: Switch to {enable,disable}_streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-imx335_binning-v2-8-30a28df74df6@ideasonboard.com>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
In-Reply-To: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tomm.merciai@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3358;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=59zBBGBXVwiK8KdUtCF+f5sq/Ca4rZOdlUR6YSCmksE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBowoTzE7ORwzfIdbEPtzwpnhY0b0mfq6Qhx68rM
 uQFquS1nYeJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaMKE8wAKCRBD3pH5JJpx
 RTs6D/sFYv62KI1RA7ppIgWdWrtNcDP0mRUhFtpqd/1kMk9L1UdSOEywu3yNv4yjgl/MrcsT5as
 FilZruRPT7NM0/uoJYs1+bhE0qOFZ3eGHOPOrG2GezJUtqKA0Ypzad1tHyyAr3pM1jFQWI/01Bc
 r/4KFeRGb7jtF+dwF1DOJDwN0xo+cgwstP7sFqNltc0FoHXZ8AGTaVjt+PvbAztbvhNXZI2BSdr
 y8L7eoAhldMup3Y2Kt1uGefL42nhfXo4cwKmse/DudeApgk1kFCt46wXFz4uRMEFgxuWV186vWm
 7dW3z4P8oOIfHZJQt3V23Fgo7odzRPT+iUgEV8iD1E7J0e3B2r9Uw9SDZPU3UXwXdnjwp/FKxdQ
 nvpbphug5xBjypeaPE2tJbRP1q0ibkqviJsfLI3E7h6sRTwUVKNpzxdFQ+v5z/ko0wM8EO02Gjx
 mvUq/XdQkGHNriufLNhjChw4xFl4PSOmqeT/JX9PCyEv8rtYM4GvYtPbhrSonN29rP8URMdTZ0g
 UKC0lXV+E8jgiqvbfmFSFbuxZWq9ChCxCIbdhVXkAm94U/sksiR7PmiwkEL7KGDhi2mkOrVHYS1
 o+ereArtjcoyIfk2UmSXIHaWLIZVlVuWh2f5kcQHz5nFqglrmXqERNub452/UNkYPxgp1eJ7+hm
 zw8Co9mU1GJ5pvw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx335.c | 53 +++++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index c985edab7e2a965ccd9427b013cbb3fa8778de2b..a1af70d050bca79255ac9303e8508de919bc4fdc 100644
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
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
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


