Return-Path: <linux-media+bounces-28160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBAFA5FFB4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850FA17583F
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F321EFF9F;
	Thu, 13 Mar 2025 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZrWnA+h"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E091EFF9D
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891423; cv=none; b=Mmyjaocmwo9P50Wl5saSAsjmqDAscCsLEJg2fI15woOUUtU9ZQKT+LvWhTbc402+pn4Ul71pzb+lu22MwxAVn4n0auv5GNtd+2ZxOubhS/gno+86FQXTA5RLCP3v+ZLkT9AVxTU0JL0FwEmbZsOKSRdtR0ubzpulmpzkI4ixawY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891423; c=relaxed/simple;
	bh=AnfT/VgwnVX8MKBEmGtPgLoAZL9LC54ZxAW0nLdpCi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBmGAAc6xCednleYzPnSEiUNxUaUAAsuZwmKuh2ep6ziYFFBATNTR0iYbyAHQOXS/I/ztE5gZlcP9m96MOBXYbX0aRn++1ESempGH7PS9EluIxiJkJONBIFdz1iXPQS8bAKXKPqMEDGS1XcrHssleVMG+FjqgkyXwIK73RuQh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZrWnA+h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sL2IrnxwVclnb0cHanolDOhIAqLkrjlLeP84z0W88T4=;
	b=DZrWnA+hbcVXgyyUvv9aqHjvLipu+ei858j4aJvwqTgYeGtdXREB9DPOzyX4cEFsOZVSyT
	NV7HVkav/JYXrlHKNuoYV6Bxw5JvICL+OtbO5sc8bswvMy4jgtLSnEhx+zB10IhPTPlMqj
	IW0dYbQF7Zk9IgzlgicgUfQYYkU00e4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-y3DL6PIKMt-J6Fj92GpmHg-1; Thu,
 13 Mar 2025 14:43:39 -0400
X-MC-Unique: y3DL6PIKMt-J6Fj92GpmHg-1
X-Mimecast-MFC-AGG-ID: y3DL6PIKMt-J6Fj92GpmHg_1741891417
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 785821956087;
	Thu, 13 Mar 2025 18:43:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 898CF300377A;
	Thu, 13 Mar 2025 18:43:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 05/14] media: ov02c10: link-freq-index and pixel-rate fixes
Date: Thu, 13 Mar 2025 19:43:05 +0100
Message-ID: <20250313184314.91410-6-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

link-freq-index and pixel-rate fixes:
- The link_freq_index is (typically) not mode specific move it from
  the mode struct to the ov02c10 struct
- Having one supported link-freq in bus_cfg.link_frequencies[] is enough
  switch to v4l2_link_freq_to_bitmap() to only require one match and store
  the first match in ov02c10->link_freq_index for use when setting up
  the controls
- Use ov02c10->link_freq_index to set the value of the link-freq control
- Note the above are no-ops because currently only 1 link-freq is supported
- Use link-freq + lane-count to calculate the pixelrate instead of hard-
  coding it to 80MHz, this corrects the pixel-rate to 160MHz for 2 lanes
- The link-freq and pixel-rate are set to a fixed value at probe() time and
  never change, drop the unnecessary setting of these controls from
  ov02c10_set_format()

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 52 ++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index ad5ab6c8a803..4b1b41f74ca2 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -16,9 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV02C10_LINK_FREQ_400MHZ	400000000ULL
-#define OV02C10_SCLK			80000000LL
 #define OV02C10_MCLK			19200000
-#define OV02C10_DATA_LANES		1
 #define OV02C10_RGB_DEPTH		10
 
 #define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
@@ -78,9 +76,6 @@ struct ov02c10_mode {
 	/* Min vertical timining size */
 	u32 vts_min;
 
-	/* Link frequency needed for this resolution */
-	u32 link_freq_index;
-
 	/* MIPI lanes used */
 	u8 mipi_lanes;
 
@@ -409,7 +404,8 @@ struct ov02c10 {
 	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
-	/* MIPI lanes used */
+	/* MIPI lane info */
+	u32 link_freq_index;
 	u8 mipi_lanes;
 
 	/* Streaming on/off */
@@ -506,9 +502,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const struct ov02c10_mode *cur_mode;
-	s64 exposure_max, h_blank;
+	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
-	int size;
 	int ret = 0;
 
 	ctrl_hdlr = &ov02c10->ctrl_handler;
@@ -518,19 +513,22 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
 
 	ctrl_hdlr->lock = &ov02c10->mutex;
 	cur_mode = ov02c10->cur_mode;
-	size = ARRAY_SIZE(link_freq_menu_items);
 
 	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov02c10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    size - 1, 0,
+						    ov02c10->link_freq_index, 0,
 						    link_freq_menu_items);
 	if (ov02c10->link_freq)
 		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	/* MIPI lanes are DDR -> use link-freq * 2 */
+	pixel_rate = link_freq_menu_items[ov02c10->link_freq_index] * 2 *
+		     ov02c10->mipi_lanes / OV02C10_RGB_DEPTH;
+
 	ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
 						V4L2_CID_PIXEL_RATE, 0,
-						OV02C10_SCLK, 1, OV02C10_SCLK);
+						pixel_rate, 1, pixel_rate);
 
 	vblank_min = cur_mode->vts_min - cur_mode->height;
 	vblank_max = OV02C10_VTS_MAX - cur_mode->height;
@@ -801,8 +799,6 @@ static int ov02c10_set_format(struct v4l2_subdev *sd,
 		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov02c10->cur_mode = mode;
-		__v4l2_ctrl_s_ctrl(ov02c10->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(ov02c10->pixel_rate, OV02C10_SCLK);
 
 		/* Update limits and set FPS to default */
 		vblank_def = mode->vts_def - mode->height;
@@ -927,9 +923,9 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 	};
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	unsigned int i, j;
-	int ret;
+	unsigned long link_freq_bitmap;
 	u32 ext_clk;
+	int ret;
 
 	if (!fwnode)
 		return -ENXIO;
@@ -950,26 +946,16 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 	if (ret)
 		return ret;
 
-	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(dev, "no link frequencies defined");
-		ret = -EINVAL;
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+	if (ret)
 		goto out_err;
-	}
 
-	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
-		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
-			if (link_freq_menu_items[i] ==
-				bus_cfg.link_frequencies[j])
-				break;
-		}
-
-		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
-				link_freq_menu_items[i]);
-			ret = -EINVAL;
-			goto out_err;
-		}
-	}
+	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
+	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
 	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
-- 
2.48.1


