Return-Path: <linux-media+bounces-44472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A97BDAD27
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92D074E9824
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D652430217B;
	Tue, 14 Oct 2025 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xj/qAibm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9930594A
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463682; cv=none; b=hNzeObhfypw1olJJ4x5pate3pDYUFaxfwJZ7kwxgOhw/LeIxIVgGfruMJ4hlqvyLIInp1WCieIzuc6Du8q16LpDNJImK+3prGg8sUpQvQNWMYQeluXffYbr6wtYPDTbuemv82MfwCB+vmL5kY23inNEDRprBlLfi4PbZYtuInzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463682; c=relaxed/simple;
	bh=wjqGM3UJTEmwcSK0gGYCtRYdYY7MNybsn3u8YfFFqE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6z52jDutImDRJx21qiHFmLGg35odnRucu44cXcrP1xFlVPK8RC+lNtj8KadeE72NO1ZvztdAoIgKUDzOvHzpr81F0hwSV+yymxZJWCPAl32vMj7fz78JzqzVT2Z9Q6uxQJF4Ox6aUVFWrSbwGZSKf5CP1z1t+2qxpGI9kfE9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xj/qAibm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFA6C4CEE7;
	Tue, 14 Oct 2025 17:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463682;
	bh=wjqGM3UJTEmwcSK0gGYCtRYdYY7MNybsn3u8YfFFqE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xj/qAibmWdoZaxUj6shv+1rYMRgF+qUHSI+7qizq73PAqGxzhFVo3Pk0Tvuba9ghQ
	 F15s6na9HwKJhwuPkXXw2Q9rPed8JxMoBXv7+YBr2ZkLNnGl4MOrIh9fQ43tChAJHS
	 Oc4AJ4tIWJ7LGpvgTzuNGSwH2kLgLrOryx0IiZ+L71WcMM/IN8WG6AL+28wbGzNajS
	 MeyG0v3DYeoLvIo6N23/STD5A61qgpv5Vx6oWpgLR1MA35YXYJC98ugvusHG80JwRO
	 jxxM/xMCgJv2yzNdTqfZZRPyHpJcT6hHPyz2/Ea2xGQEV4z4lYQlfsrbVW9yJ+6qs/
	 wHWUQwdhxO49g==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 25/25] media: i2c: ov01a10: Register tweaks for ov01a1s model
Date: Tue, 14 Oct 2025 19:40:33 +0200
Message-ID: <20251014174033.20534-26-hansg@kernel.org>
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

The out of tree drivers from:
https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c

Have a separate driver for the ov01a1s. This driver is 95% the same as
the ov01a10 driver (same sensor, different color-filters) but there are
a couple of registers for which the out of tree ov01a1s driver uses
different values.

Add a per model reg_sequence to struct ov01a10_sensor_cfg and apply
the register tweaks from the out of tree driver to the ov01a1s model.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 058ff311a289..08cab1e4be1d 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -161,7 +161,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x3815, 0x01},
 	{0x3816, 0x01},
 	{0x3817, 0x01},
-	{0x3822, 0x13},
 	{0x3832, 0x28},
 	{0x3833, 0x10},
 	{0x3b00, 0x00},
@@ -186,7 +185,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x4800, 0x64},
 	{0x481f, 0x34},
 	{0x4825, 0x33},
-	{0x4837, 0x11},
 	{0x4881, 0x40},
 	{0x4883, 0x01},
 	{0x4890, 0x00},
@@ -203,6 +201,17 @@ static const struct reg_sequence ov01a10_global_setting[] = {
 	{0x0325, 0xc2},
 };
 
+static const struct reg_sequence ov01a10_regs[] = {
+	{0x3822, 0x13},
+	{0x4837, 0x11},
+};
+
+static const struct reg_sequence ov01a1s_regs[] = {
+	{0x3822, 0x03},
+	{0x4837, 0x14},
+	{0x373d, 0x24},
+};
+
 static const char * const ov01a10_test_pattern_menu[] = {
 	"Disabled",
 	"Color Bar",
@@ -237,6 +246,8 @@ static const char * const ov01a10_supply_names[] = {
 
 struct ov01a10_sensor_cfg {
 	const char *model;
+	const struct reg_sequence *regs;
+	int regs_len;
 	u32 bus_fmt;
 	int pattern_size;
 	int border_size;
@@ -551,6 +562,7 @@ static int ov01a10_set_mode(struct ov01a10 *ov01a10)
 
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
+	const struct ov01a10_sensor_cfg *cfg = ov01a10->cfg;
 	const struct ov01a10_link_freq_config *freq_cfg;
 	int ret;
 
@@ -569,6 +581,12 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 		return ret;
 	}
 
+	ret = regmap_multi_reg_write(ov01a10->regmap, cfg->regs, cfg->regs_len);
+	if (ret) {
+		dev_err(ov01a10->dev, "failed to write sensor regs\n");
+		return ret;
+	}
+
 	ret = ov01a10_set_mode(ov01a10);
 	if (ret) {
 		dev_err(ov01a10->dev, "failed to set mode\n");
@@ -1095,6 +1113,8 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov01a10_pm_ops, ov01a10_power_off,
  */
 static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 	.model = "ov01a10",
+	.regs = ov01a10_regs,
+	.regs_len = ARRAY_SIZE(ov01a10_regs),
 	.bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
 	.pattern_size = 2, /* 2x2 */
 	.border_size = 2,
@@ -1105,6 +1125,8 @@ static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 
 static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
 	.model = "ov01a1b",
+	.regs = ov01a10_regs,
+	.regs_len = ARRAY_SIZE(ov01a10_regs),
 	.bus_fmt = MEDIA_BUS_FMT_Y10_1X10,
 	.pattern_size = 2, /* Keep coordinates aligned to a multiple of 2 */
 	.border_size = 0,
@@ -1119,6 +1141,8 @@ static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
  */
 static const struct ov01a10_sensor_cfg ov01a1s_cfg = {
 	.model = "ov01a1s",
+	.regs = ov01a1s_regs,
+	.regs_len = ARRAY_SIZE(ov01a1s_regs),
 	/*
 	 * FIXME this obviously is wrong, this needs to be changed to
 	 * MEDIA_BUS_FMT_RAW10_1x10 + reporting the proper bayer-order through
-- 
2.51.0


