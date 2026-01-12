Return-Path: <linux-media+bounces-50415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE4D11A9C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 283593004E1E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C395028314B;
	Mon, 12 Jan 2026 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GW3DPz+J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72B280035
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212010; cv=none; b=iPWbyM7FUaJ6k7q+RyMSa8+aP19bCVfhNe0JH6BDZ4mPgxipyjfG9fcb2pCV9m50BHceNIFpuzeAYz1v3nMJx4lEELqU59i5qvM9vdmUAXrSfTgS4vVjcgyeZ0waEIDm/3ZRt7l7ISo81cd8IJPwKxfnFWb+Qdqd3KM2EkIzxmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212010; c=relaxed/simple;
	bh=RJFGjUzyDhD4jsQEQk8YOVed01tR+OdOSOWI5NL0FgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZpmHQSJstU1pAxKIdcGAlZYMgIWM71uRKkJ5NxzmlWYMEKYOAOGlk/EeIjJgPAAzQoeG9FC7Wd8m2Icm4t2em6UDgYnQZt6AOPo72Xdamni+VFLUL+xhAQJ5QiOGUqyU3Fov1EYJkoBBVTsohjuUP/+j3GpjZstnDmsrMJhWzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GW3DPz+J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212005; x=1799748005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RJFGjUzyDhD4jsQEQk8YOVed01tR+OdOSOWI5NL0FgU=;
  b=GW3DPz+JHBtHeGYqnXvyiFhRjcXRkiwmgP7VyofVcNUn8TwAwvSJ4RTI
   rvoFlW4sZt46LxqaWKRQpvHGXynIPCI6lFU4Zpnx8B1aje+WKBpSNfesy
   vSIarvUVcianBICy7eENy2x4Hg5fjw+aeK5VLbBYjVSiCwmFbbJvCofCi
   g3IgKZS1Z36if6eeB19wTo/Lf4UPWhGCztfYVs2qenqle8fz9FiZYWMuk
   Mj3p/5huCnbWBTxfGxzaKblwoODe4/E3k7t23JSr3UNv7u2sC3AEY1fv1
   pl0fRKagReNgwcDLN30prn4WlSOPQ1rzB3we1jnqPl0BsiM3oMMcOUV/W
   Q==;
X-CSE-ConnectionGUID: WstkKNuFQHuTzojb63xDnA==
X-CSE-MsgGUID: JejkCgWyRl+gQtBL6q8vBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218795"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218795"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: 0UrrdisoQj2k83N+LlmXGg==
X-CSE-MsgGUID: S6WHtWaeTi6VSMCi2V57UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743136"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3ED28121F8A;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011s-0UNM;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 11/23] media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
Date: Mon, 12 Jan 2026 11:59:37 +0200
Message-ID: <20260112095949.3851-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Add a function to check that the number of mipi-lanes and there frequency
are what the driver expects.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 7677860c28ef..0ef4bbc93d66 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -293,6 +293,7 @@ struct ov01a10 {
 	struct v4l2_ctrl *exposure;
 
 	const struct ov01a10_mode *cur_mode;
+	u32 link_freq_index;
 };
 
 static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
@@ -426,7 +427,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	const struct ov01a10_mode *cur_mode;
 	s64 exposure_max, h_blank;
 	int ret = 0;
-	int size;
 
 	ret = v4l2_fwnode_device_parse(ov01a10->dev, &props);
 	if (ret)
@@ -438,12 +438,11 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 		return ret;
 
 	cur_mode = ov01a10->cur_mode;
-	size = ARRAY_SIZE(link_freq_menu_items);
 
 	ov01a10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						    &ov01a10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-						    size - 1, 0,
+						    ov01a10->link_freq_index, 0,
 						    link_freq_menu_items);
 	if (ov01a10->link_freq)
 		ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -745,6 +744,53 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 	return 0;
 }
 
+static int ov01a10_check_hwcfg(struct ov01a10 *ov01a10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep, *fwnode = dev_fwnode(ov01a10->dev);
+	unsigned long link_freq_bitmap;
+	int ret;
+
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(ov01a10->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(ov01a10->dev, ret, "parsing endpoint\n");
+
+	ret = v4l2_link_freq_to_bitmap(ov01a10->dev,
+				       bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+	if (ret)
+		goto check_hwcfg_error;
+
+	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
+	ov01a10->link_freq_index = ffs(link_freq_bitmap) - 1;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV01A10_DATA_LANES) {
+		ret = dev_err_probe(ov01a10->dev, -EINVAL,
+				    "number of CSI2 data lanes %u is not supported\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto check_hwcfg_error;
+	}
+
+check_hwcfg_error:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
 static void ov01a10_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
@@ -761,7 +807,7 @@ static void ov01a10_remove(struct i2c_client *client)
 static int ov01a10_probe(struct i2c_client *client)
 {
 	struct ov01a10 *ov01a10;
-	int ret = 0;
+	int ret;
 
 	ov01a10 = devm_kzalloc(&client->dev, sizeof(*ov01a10), GFP_KERNEL);
 	if (!ov01a10)
@@ -776,6 +822,10 @@ static int ov01a10_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&ov01a10->sd, client, &ov01a10_subdev_ops);
 	ov01a10->sd.internal_ops = &ov01a10_internal_ops;
 
+	ret = ov01a10_check_hwcfg(ov01a10);
+	if (ret)
+		return ret;
+
 	ret = ov01a10_identify_module(ov01a10);
 	if (ret)
 		return ret;
-- 
2.47.3


