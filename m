Return-Path: <linux-media+bounces-44458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBFBDAD24
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09D0054719A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231DA30B530;
	Tue, 14 Oct 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8f+D2fE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83071286415
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463657; cv=none; b=me5eNCugHuPYj6Ry1Cjmiib57nrFSYeid32btXT/6hbzQWfoYgjuIG7gyeAECo1IGT5VV+9GrNqic+xbFstrikA4mF4ODBAJylBpWdCHqc82Vg8WIrbkH0/Qzxrhbfa9XENVgq4/r7JCnI8a3tc1Z0ttwIizSHx+n7GvMPtaQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463657; c=relaxed/simple;
	bh=N257lmbC1lryvZ44dEBP6otRC8SqHHnMb6cqgHVkPJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OM3bQz34heTBIIMUCioWhnCv43MWrCiR6OizjXihq6fEhNbxp0T5a0eO7Yw5nyffmiBhHtGJ1t2lu04KAcvka0+qUGeZM4Cpn/SLhKMNosMGHQMH5jC14VnOHpfHnkA1nCsva2PM7b8pBafW3Gsk++sS4mWu+dNBIfIPyxbuqFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8f+D2fE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A752C4CEE7;
	Tue, 14 Oct 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463657;
	bh=N257lmbC1lryvZ44dEBP6otRC8SqHHnMb6cqgHVkPJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8f+D2fEUuTFJUUYZwOdccgq0p7mD0KzlcOLG8HG29lbdvB0C4uBMNK2r85bBn2xd
	 9eeMCI8Wh5Xf0br9/8Ns6//BYeaMkmXy0WIkb0a1DNiQWyeGquvwLANnTDhkyoq3/x
	 ChIP+qKNGshD4MZrOGStj6m4QbIgLxOZ50BUmCTWxe6yrNGyGnuOwut4NVzv48AMfT
	 zsi1oVVCoNgRHLHF49yGa5PPZcb/G47MJ2vDUJznAwXPfRlYlFblqgWaDsv7Ix1/Vs
	 X3dmBMMos0gVv/QY06RU+Z23OMmN/J0B9FWsp2PqRDWt4bgDqcMVXXczxHk6a+msyJ
	 CZfM2W5CfgdXw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 11/25] media: i2c: ov01a10: Add ov01a10_check_hwcfg() function
Date: Tue, 14 Oct 2025 19:40:19 +0200
Message-ID: <20251014174033.20534-12-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a function to check that the number of mipi-lanes and there frequency
are what the driver expects.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 58 ++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index de293e2431e9..666c75b19dd9 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -294,6 +294,7 @@ struct ov01a10 {
 	struct v4l2_ctrl *exposure;
 
 	const struct ov01a10_mode *cur_mode;
+	u32 link_freq_index;
 };
 
 static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
@@ -427,7 +428,6 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	const struct ov01a10_mode *cur_mode;
 	s64 exposure_max, h_blank;
 	int ret = 0;
-	int size;
 
 	ret = v4l2_fwnode_device_parse(ov01a10->dev, &props);
 	if (ret)
@@ -439,12 +439,11 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
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
@@ -746,6 +745,53 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
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
@@ -762,7 +808,7 @@ static void ov01a10_remove(struct i2c_client *client)
 static int ov01a10_probe(struct i2c_client *client)
 {
 	struct ov01a10 *ov01a10;
-	int ret = 0;
+	int ret;
 
 	ov01a10 = devm_kzalloc(&client->dev, sizeof(*ov01a10), GFP_KERNEL);
 	if (!ov01a10)
@@ -777,6 +823,10 @@ static int ov01a10_probe(struct i2c_client *client)
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
2.51.0


