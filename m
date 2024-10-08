Return-Path: <linux-media+bounces-19239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF79947B1
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DA0AB23DCA
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61701DEFD7;
	Tue,  8 Oct 2024 11:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oOErOqMJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC101D618C;
	Tue,  8 Oct 2024 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388204; cv=none; b=K+/kesClMdTMWIom2Q/s2b2uBo9fa8jR+cNDp+0D9EK5PQdM6EeO6Ta0+7cERq6oKk9iToLmctW698Z2MnZpmIqFup8/e8z9IpfAFQcM3jAYR1nsP/5otjMDRxt2CFcABaQo6f/ltdg2sri7qiyi5JY1y04kYhKr4M8XL6wa+f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388204; c=relaxed/simple;
	bh=aBT9XJInmCyIxEXaR/76joWX1ch3qVUvo8eMVa9f79A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U8bERls7fYaB4HPoG7UZ093043oA35wckJk97wPz3Twvy4bz7CqQ2zbQPdmcsXXUEoUOrSKachNtHCDs2oC86q4bhnk/2bKhcYG/FWO0Payrp3JeuXRRfKvOmYbBM6KO6x6G0FyUYL4SD1k/uPnRDg/xgsXS7pYKTm85051gdR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oOErOqMJ; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4987rebW032450;
	Tue, 8 Oct 2024 13:49:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4t/KgWTC6P/GkukrI5HGWXPIG8jDuBJo3wAhaRLViWU=; b=oOErOqMJ0At/XZ4P
	lx6bdqWErTlFfpTW3XNDLpG/ULG/Y3CfVF2+msW6LYcvbjYF8X+xoQ33m9P6NhnY
	I7WHk1WlUisGxr12IAGS6aPoSUvtSghaqXbLJmweYRYbvFl/wtMfKhLtmJ5dovx1
	V3SY0/iEAk6FfFS3jwUankduRkX/+N75aQiloZOtVQwM3BUZmn0C1tJQgGqs7tdr
	jimlg/250DqIBHwioS5Banwp+sD6xLNeu9N1lShI0/X+7TTC5hWmcPimvMcHk9ZI
	VvhX8jdaYtzyxzSYX4YI6MqZ11zupezz5lM4T/sQhiwSsD5WqRACWAt22aTmw87o
	/3zriQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xtq5ub8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:49:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A8E04004C;
	Tue,  8 Oct 2024 13:49:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B813C263D0C;
	Tue,  8 Oct 2024 13:46:36 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:46:36 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:46:06 +0200
Subject: [PATCH 2/4] media: i2c: st-mipid02: use enable/disable_streams pad
 ops
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-st-mipid02-streams-v1-2-775c2d25cef9@foss.st.com>
References: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
In-Reply-To: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Alain
 Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add pad enable_streams and disable_streams ops in addition to
v4l2_subdev_s_stream_helper. Moreover, use functions
v4l2_subdev_enable_streams and v4l2_subdev_disable_streams to
control the source subdev.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/st-mipid02.c | 43 +++++++++++++++++-------------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index bc637a651a22..1821a8fdd618 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -100,6 +100,7 @@ struct mipid02_dev {
 	/* remote source */
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *s_subdev;
+	u16 s_subdev_pad_id;
 	/* registers */
 	struct {
 		u8 clk_lane_reg1;
@@ -447,15 +448,19 @@ static int mipid02_configure_from_code(struct mipid02_dev *bridge,
 	return 0;
 }
 
-static int mipid02_stream_disable(struct mipid02_dev *bridge)
+static int mipid02_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
 {
+	struct mipid02_dev *bridge = to_mipid02_dev(sd);
 	struct i2c_client *client = bridge->i2c_client;
 	int ret = -EINVAL;
 
 	if (!bridge->s_subdev)
 		goto error;
 
-	ret = v4l2_subdev_call(bridge->s_subdev, video, s_stream, 0);
+	ret = v4l2_subdev_disable_streams(bridge->s_subdev,
+					  bridge->s_subdev_pad_id, BIT(0));
 	if (ret)
 		goto error;
 
@@ -472,10 +477,12 @@ static int mipid02_stream_disable(struct mipid02_dev *bridge)
 	return ret;
 }
 
-static int mipid02_stream_enable(struct mipid02_dev *bridge)
+static int mipid02_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct mipid02_dev *bridge = to_mipid02_dev(sd);
 	struct i2c_client *client = bridge->i2c_client;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
 	int ret = -EINVAL;
 
@@ -484,7 +491,6 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 
 	memset(&bridge->r, 0, sizeof(bridge->r));
 
-	state = v4l2_subdev_lock_and_get_active_state(&bridge->sd);
 	fmt = v4l2_subdev_state_get_format(state, MIPID02_SINK_0);
 
 	/* build registers content */
@@ -498,8 +504,6 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	if (ret)
 		return ret;
 
-	v4l2_subdev_unlock_state(state);
-
 	/* write mipi registers */
 	cci_write(bridge->regmap, MIPID02_CLK_LANE_REG1,
 		  bridge->r.clk_lane_reg1, &ret);
@@ -524,7 +528,8 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	if (ret)
 		goto error;
 
-	ret = v4l2_subdev_call(bridge->s_subdev, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(bridge->s_subdev,
+					 bridge->s_subdev_pad_id, BIT(0));
 	if (ret)
 		goto error;
 
@@ -539,23 +544,6 @@ static int mipid02_stream_enable(struct mipid02_dev *bridge)
 	return ret;
 }
 
-static int mipid02_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct mipid02_dev *bridge = to_mipid02_dev(sd);
-	struct i2c_client *client = bridge->i2c_client;
-	int ret = 0;
-
-	dev_dbg(&client->dev, "%s : requested %d\n", __func__, enable);
-
-	ret = enable ? mipid02_stream_enable(bridge) :
-		       mipid02_stream_disable(bridge);
-	if (ret)
-		dev_err(&client->dev, "failed to stream %s (%d)\n",
-			enable ? "enable" : "disable", ret);
-
-	return ret;
-}
-
 static const struct v4l2_mbus_framefmt default_fmt = {
 	.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 	.field = V4L2_FIELD_NONE,
@@ -642,13 +630,15 @@ static int mipid02_set_fmt(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops mipid02_video_ops = {
-	.s_stream = mipid02_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops mipid02_pad_ops = {
 	.enum_mbus_code = mipid02_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mipid02_set_fmt,
+	.enable_streams = mipid02_enable_streams,
+	.disable_streams = mipid02_disable_streams,
 };
 
 static const struct v4l2_subdev_ops mipid02_subdev_ops = {
@@ -694,6 +684,7 @@ static int mipid02_async_bound(struct v4l2_async_notifier *notifier,
 	}
 
 	bridge->s_subdev = s_subdev;
+	bridge->s_subdev_pad_id = source_pad;
 
 	return 0;
 }

-- 
2.25.1


