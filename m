Return-Path: <linux-media+bounces-50422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D58D11AD2
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A48A30537BC
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4873C28A3F8;
	Mon, 12 Jan 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfIlXI0S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C339D284670
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212015; cv=none; b=J274RMd/RL8q7f6QWjBcrkLL/o14yhFTXH/tfWbKhgnJ+wQqIz3ohb2Th+POqjnqIAY9D/50HUg0zdf5zFYM6eEST8bcRzXrK4XrNfzUzm6fFs3/bB2a8CIE1+udV7M1X4xewdn+DXXo8+uyc0Gev80xlWahuOGY3EQO90hUsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212015; c=relaxed/simple;
	bh=haNl4zEs3Ly3I43IVlN9BQcj6yvhor/TbGpNlWxpWQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmW7wGqozp4HBIE650vK66kH8C167bbdj6Luu3knq0RuR2Qw9Z4x+ILZ52sUhhKaP/FwXxYWxZdd6JcibqQIOIq+c/xHd1PD6HxNDx+shKM40s/JczUVgdXS5CB4THAtX4wxJma57MwXad3YWP/zdnROD3THGVjy39PAqIT+XQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfIlXI0S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212014; x=1799748014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=haNl4zEs3Ly3I43IVlN9BQcj6yvhor/TbGpNlWxpWQI=;
  b=VfIlXI0SIl6xselUWYvZhYLFxpacNQ0I16ZCo0o8kkUR+YwY5ojU76FM
   /FnYqsjcdcIQikKJ0m709eoFXr6DfN78wgA3YxY2JHLylrwSs/uGEYPqG
   uJlKse7R7mjQCCPywtwzfGwWYbeCWnKOFi2GrU0aCbccxTubixBuFGcmw
   NrbaQg5kqX3Igah7XsritBe6B6fbnFQ+Xr/FhRtNGW+B6h0hj6Li5msg1
   zozVKRhu2H+/KIzMYNCrEgyRfyLj1vMbKySpa/VHNM4FKC7PiJogmtSnf
   j5ugCdSHkJXy9YSBpi9r/Ig74tjFWqBluhvp8qLOyVbYuVuVjmnjrXQGj
   Q==;
X-CSE-ConnectionGUID: hAmoY2rKRoyvK31ehKuIuw==
X-CSE-MsgGUID: yy4dMJsuRby5+Io4XGWQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218811"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: 77oUG4lLSwStnbodnWbfgA==
X-CSE-MsgGUID: KqdF0rzFSBCB+so/grQoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743167"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4FD9B121FC6;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012L-0nFZ;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 17/23] media: i2c: ov01a10: Remove struct ov01a10_reg_list
Date: Mon, 12 Jan 2026 11:59:43 +0200
Message-ID: <20260112095949.3851-18-sakari.ailus@linux.intel.com>
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

After the conversion to the CCI register access helpers, struct
ov01a10_reg_list is only used inside struct ov01a10_link_freq_config.

Simplify things by embedding the ov01a10_reg_list members directly into
struct ov01a10_link_freq_config.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 349fd3d06df5..1af0af00df24 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -98,13 +98,9 @@
 #define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
 #define OV01A10_BAYER_PATTERN_SIZE	2 /* 2x2 */
 
-struct ov01a10_reg_list {
-	u32 num_of_regs;
-	const struct reg_sequence *regs;
-};
-
 struct ov01a10_link_freq_config {
-	const struct ov01a10_reg_list reg_list;
+	const struct reg_sequence *regs;
+	int regs_len;
 };
 
 static const struct reg_sequence mipi_data_rate_720mbps[] = {
@@ -237,10 +233,8 @@ static const s64 link_freq_menu_items[] = {
 
 static const struct ov01a10_link_freq_config link_freq_configs[] = {
 	{
-		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_data_rate_720mbps),
-			.regs = mipi_data_rate_720mbps,
-		}
+		.regs = mipi_data_rate_720mbps,
+		.regs_len = ARRAY_SIZE(mipi_data_rate_720mbps),
 	},
 };
 
@@ -550,12 +544,12 @@ static int ov01a10_set_mode(struct ov01a10 *ov01a10)
 
 static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 {
-	const struct ov01a10_reg_list *reg_list;
+	const struct ov01a10_link_freq_config *freq_cfg;
 	int ret;
 
-	reg_list = &link_freq_configs[ov01a10->link_freq_index].reg_list;
-	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
-				     reg_list->num_of_regs);
+	freq_cfg = &link_freq_configs[ov01a10->link_freq_index];
+	ret = regmap_multi_reg_write(ov01a10->regmap, freq_cfg->regs,
+				     freq_cfg->regs_len);
 	if (ret) {
 		dev_err(ov01a10->dev, "failed to set plls\n");
 		return ret;
-- 
2.47.3


