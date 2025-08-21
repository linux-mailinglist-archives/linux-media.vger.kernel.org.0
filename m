Return-Path: <linux-media+bounces-40578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59CB2F921
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 836677AD0F7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30063320CA1;
	Thu, 21 Aug 2025 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOjqnnoC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F7B320CCB
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781208; cv=none; b=h7r3Y8XZgdrdgUSX52yyeNkjdMMcBtxPlf4ATa/k/akNLK4sAHegVyp1ZxhlX7xDmDftpiKtJvj7J2SMTYKQm/PaIdyoXJxBOPCutIJ0Iww/o5RP3jW4x+ctWbc4JJlN1CCpJjWT85p7pvSyzzDVreIVxwzgqQ0BMjqTzWTohC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781208; c=relaxed/simple;
	bh=r5iKvwNEPFLhfjSlc/+NQlSqBQ4txNFUKw46I1v9ZQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeIs+r8B9xscQbjqa8J1716Xr8xc394e1/AHlxCD4nhckjDO9IFoC6co993hKc5tarxCFdlEvf735HPhteLWh8vZqqCKpjh+Y3IggeP4fQ5prubFgt2uLaFEo9g+EGMElgawvRmKog3A2Y5ttzS1JSlYijYV7XNICjUsVA42Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOjqnnoC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781207; x=1787317207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r5iKvwNEPFLhfjSlc/+NQlSqBQ4txNFUKw46I1v9ZQI=;
  b=IOjqnnoCqqRraMzVcNw5ZEZ0uf9oi5MeaKz5+8g2gUJCvQq5ZZtvXPXV
   LnbmDtKC2MGPan+5Wlr6e10vJ+GdMrJh+elAFuVuGPu8wV7qMw4aeE8N+
   uA6StHVT9bwi7U33WmfOlkm0CE7JiW4yDZoUmxUvqIqK4zrGSmqfPGk0+
   Lmk4hx2oQuju18yy3rskwjuC0dDCekkQfOyM0Q1bFxqpb/qTnMCfLruPA
   FAjqM64apaawulKUAF4vSTgrW6aklIWPXGjDCmTJnfyPiltySRS/MZyiS
   zkn9FUg73MhTuvGixtrWqEWPWRcH3SDybX80fi2gyi8Q2w18unnr6w87r
   g==;
X-CSE-ConnectionGUID: Y6wkpDUAQJGj3JS0WeRDcg==
X-CSE-MsgGUID: zIcjWtgARKmznVnkEeR+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58018258"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58018258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:05 -0700
X-CSE-ConnectionGUID: efubGyIkSjCGkctyqJU3oA==
X-CSE-MsgGUID: h4D3th11QQKA9l88JJXAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199278781"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 06:00:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D8590120247;
	Thu, 21 Aug 2025 15:59:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up4tb-00000002K2g-3VeZ;
	Thu, 21 Aug 2025 15:59:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 1/3] media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
Date: Thu, 21 Aug 2025 15:59:57 +0300
Message-ID: <20250821125959.553681-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
References: <20250821125959.553681-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call v4l2_get_link_freq() on the source pad so we can remove the
workaround that allows calling it on a control handler.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Keke Li <keke.li@amlogic.com>
Tested-by: Keke Li <keke.li@amlogic.com>
---
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index 1011ab3ebac7..b9e4ef3fc308 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -388,13 +388,12 @@ static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
 	c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
 }
 
-static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
-				    struct v4l2_subdev *src_sd)
+static int c3_mipi_csi_start_stream(struct c3_csi_device *csi)
 {
 	s64 link_freq;
 	s64 lane_rate;
 
-	link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
+	link_freq = v4l2_get_link_freq(csi->src_pad, 0, 0);
 	if (link_freq < 0) {
 		dev_err(csi->dev,
 			"Unable to obtain link frequency: %lld\n", link_freq);
@@ -434,7 +433,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 
 	pm_runtime_resume_and_get(csi->dev);
 
-	c3_mipi_csi_start_stream(csi, src_sd);
+	c3_mipi_csi_start_stream(csi);
 
 	ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
 	if (ret) {
-- 
2.47.2


