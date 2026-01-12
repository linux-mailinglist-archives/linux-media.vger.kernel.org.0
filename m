Return-Path: <linux-media+bounces-50420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F85D11ABA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A732B304DAC4
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D80284B37;
	Mon, 12 Jan 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KyDWwyGB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDEA283686
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212013; cv=none; b=u0eUFi6xtBMChEmoYi+LNIp/Kv9MaJt/fjdl6AtHJG0cMcpFb3FUsS43ajnaXdUoqrxquUkF0KyG0E2EREqlfJE49XJH6xWyK4IpsRtIzQJJPvDpAiF/qzWxVVNEbkDwAqv6/LET6Hha9OLXjKBe/JoDRtEEaGuicsCnMAnhpaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212013; c=relaxed/simple;
	bh=XsO1dmyFbWwsXicqouaZgkoY6FUb7HOnTcq9rVfJ6dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ry5pBcieDUCHPUKIygVjZjDSjb/CGN7xI5zxJVSYA9uV2vdbsXu4VcPIFZJTfRbbCschmc29elZB4CBwn/14pOD936bEtY86bStShhBUjr0HinLGEUgIMUno2jXuqtve+g/zxMcNkB3NHzoTj+/1/CIRh+Q2A9XGZVce4fJlTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KyDWwyGB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212011; x=1799748011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XsO1dmyFbWwsXicqouaZgkoY6FUb7HOnTcq9rVfJ6dM=;
  b=KyDWwyGB0H5R+7n8xEnI/dPFbcVXdnrIlNRt366hdpwxmwTV86DO4oKJ
   qYsOzNqQn8rTRVoTB5Gxg04fsvQbmPJn5AaIA066kyst/Goiu4VC9qvp8
   3Q2RNNCFmVLJzxFt1o3gmDpIOC2CpSFqpLqV+xtA5F5xIx0wSMZUWA7d0
   TAe5G+X6R7Fb+yx/J554u2ztM37kl+OQZ1+JrO24TT6yuhnzlnZkdUcXq
   x0sW1sw3Wj9sxSKvDq0u4wiPSzk3+zE/l/1AuCY7N42X8o2G/zP/DxQ8q
   J3QmHaxwlbi0dMX/QCx4Yfc3ugtDKX8zaFlbXKOIjt7VSN2gaGbHlVmDh
   Q==;
X-CSE-ConnectionGUID: h9sCq3kzSzasQlEzG/s54Q==
X-CSE-MsgGUID: si9lumWtSwGtC+bVXx3W2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218803"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218803"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: RB5jCeYJQ9KxlRBUBP7EPw==
X-CSE-MsgGUID: 76zdMTRuTgGb629PY5qfog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743145"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B3C6121F88;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011m-0R4T;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 10/23] media: i2c: ov01a10: Store dev pointer in struct ov01a10
Date: Mon, 12 Jan 2026 11:59:36 +0200
Message-ID: <20260112095949.3851-11-sakari.ailus@linux.intel.com>
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

Now that the cci_* register access helpers are used we no longer need
the i2c_client in various functions.

Some code is still getting the client just to be able to get to the device
pointer. Directly store a struct device *dev pointing to &client->dev
inside struct ov01a10 to make the code simpler.

This also fixes a mismatch of using dev vs &client->dev in the
runtime_pm_*() calls in probe().

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index f7aea9740a53..7677860c28ef 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -279,6 +279,7 @@ static const struct ov01a10_mode supported_modes[] = {
 };
 
 struct ov01a10 {
+	struct device *dev;
 	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -356,7 +357,6 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov01a10 *ov01a10 = container_of(ctrl->handler,
 					       struct ov01a10, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	s64 exposure_max;
 	int ret = 0;
 
@@ -369,7 +369,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	if (!pm_runtime_get_if_in_use(ov01a10->dev))
 		return 0;
 
 	switch (ctrl->id) {
@@ -409,7 +409,7 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put(ov01a10->dev);
 
 	return ret;
 }
@@ -420,7 +420,6 @@ static const struct v4l2_ctrl_ops ov01a10_ctrl_ops = {
 
 static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	struct v4l2_fwnode_device_properties props;
 	u32 vblank_min, vblank_max, vblank_default;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
@@ -429,7 +428,7 @@ static int ov01a10_init_controls(struct ov01a10 *ov01a10)
 	int ret = 0;
 	int size;
 
-	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	ret = v4l2_fwnode_device_parse(ov01a10->dev, &props);
 	if (ret)
 		return ret;
 
@@ -523,7 +522,6 @@ static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
 
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	const struct ov01a10_reg_list *reg_list;
 	int link_freq_index;
 	int ret = 0;
@@ -533,7 +531,7 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
 				     reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set plls\n");
+		dev_err(ov01a10->dev, "failed to set plls\n");
 		return ret;
 	}
 
@@ -541,7 +539,7 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
 				     reg_list->num_of_regs);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode\n");
+		dev_err(ov01a10->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -562,25 +560,24 @@ static void ov01a10_stop_streaming(struct ov01a10 *ov01a10)
 static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov01a10 *ov01a10 = to_ov01a10(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
+		ret = pm_runtime_resume_and_get(ov01a10->dev);
 		if (ret < 0)
 			goto unlock;
 
 		ret = ov01a10_start_streaming(ov01a10);
 		if (ret) {
-			pm_runtime_put(&client->dev);
+			pm_runtime_put(ov01a10->dev);
 			goto unlock;
 		}
 	} else {
 		ov01a10_stop_streaming(ov01a10);
-		pm_runtime_put(&client->dev);
+		pm_runtime_put(ov01a10->dev);
 	}
 
 unlock:
@@ -732,7 +729,6 @@ static const struct media_entity_operations ov01a10_subdev_entity_ops = {
 
 static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	int ret;
 	u64 val;
 
@@ -741,7 +737,7 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 		return ret;
 
 	if (val != OV01A10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
+		dev_err(ov01a10->dev, "chip id mismatch: %x!=%llx\n",
 			OV01A10_CHIP_ID, val);
 		return -EIO;
 	}
@@ -764,14 +760,15 @@ static void ov01a10_remove(struct i2c_client *client)
 
 static int ov01a10_probe(struct i2c_client *client)
 {
-	struct device *dev = &client->dev;
 	struct ov01a10 *ov01a10;
 	int ret = 0;
 
-	ov01a10 = devm_kzalloc(dev, sizeof(*ov01a10), GFP_KERNEL);
+	ov01a10 = devm_kzalloc(&client->dev, sizeof(*ov01a10), GFP_KERNEL);
 	if (!ov01a10)
 		return -ENOMEM;
 
+	ov01a10->dev = &client->dev;
+
 	ov01a10->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov01a10->regmap))
 		return PTR_ERR(ov01a10->regmap);
@@ -808,8 +805,8 @@ static int ov01a10_probe(struct i2c_client *client)
 	 * Enable runtime PM and turn off the device.
 	 */
 	pm_runtime_set_active(&client->dev);
-	pm_runtime_enable(dev);
-	pm_runtime_idle(dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
 	if (ret)
@@ -818,7 +815,7 @@ static int ov01a10_probe(struct i2c_client *client)
 	return 0;
 
 err_pm_disable:
-	pm_runtime_disable(dev);
+	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	v4l2_subdev_cleanup(&ov01a10->sd);
 
-- 
2.47.3


