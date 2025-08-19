Return-Path: <linux-media+bounces-40244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23BB2BDCC
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F16C685D17
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AEAF311977;
	Tue, 19 Aug 2025 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUMoJCip"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F29221FD4
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596741; cv=none; b=mj6DxEaQMsPPBKEerlog0xVcYkjnmqWp1rSwkm9dqRvLXDPmJ9ZN6kIrsL2M5+WPjYxaU+k0o4d0HJjqmfYOBmBU4P+5p59QKuC6LnFulpdxOjugMzWVtnNV7phMAyyhacRS+zc4MYZfIPzQHkpz4+Oq9HquTZ2C3xN1J2AW+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596741; c=relaxed/simple;
	bh=1i2i/+OPK4jXbuDq9ZzXkQz5Lh2sVXv9v/4wjzBFpK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfrPoNi0PTWb1Xfy99SbJxjM8X73ALjQ0dPJwbItDNM8UayTb1utIN4mlbbzMN2ZZMN4uQ84+wNfAZGpj6G42pFT4AsBitpV+Dc8r2qs+WmJ1Mm158aKsSNqBG+OGEs16McyDm62bD4a8tFzzeeL3iGXhPxz2ipCbB5v5yNDb/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUMoJCip; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755596741; x=1787132741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1i2i/+OPK4jXbuDq9ZzXkQz5Lh2sVXv9v/4wjzBFpK8=;
  b=HUMoJCipO8N7AVIKCbbobdl0HIK6SJgQ1BaillwQjY5jFksClECiV5HO
   Zg18Zn/Xh/itaszeOcSuj/rbz6KkprgPHxk44Aap8WrZes6OZwhI2rGID
   sCwEzpM+2/+4bDOKcLCjM+/EBGDlYKWFwzEAWMqe8DKsLiUTF/IWjd2Qe
   96cXGbA5eSRd4XmKndAKIlIbLSlUn8rJTj0XLMaXk9dveyM1M02RT6+kH
   HaueDL3g4JK1A/NNT5dmEmr07uK8wdEMDNHWEx3Li0rYX9abTi7Qgf9NF
   Rdw9k5PxQULzROPrIfMP6H+rkezr5C1U+JM+QFQhJBittOv/iAM1XcyFc
   A==;
X-CSE-ConnectionGUID: /kuF3cssQUuQm2n7w4xINg==
X-CSE-MsgGUID: B2NfEU37T1uMGcvOafF8Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57691416"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57691416"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:40 -0700
X-CSE-ConnectionGUID: BmdcXX6FTKS6Tr5oYl4+4A==
X-CSE-MsgGUID: 3C45M6iGRBaUB0PC6L0QqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172045334"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.148])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:45:37 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1CF5811FC36;
	Tue, 19 Aug 2025 12:45:34 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uoIuM-000000000c0-0NCs;
	Tue, 19 Aug 2025 12:45:34 +0300
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 1/2] media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
Date: Tue, 19 Aug 2025 12:45:31 +0300
Message-ID: <20250819094533.2335-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
References: <20250819094533.2335-1-sakari.ailus@linux.intel.com>
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


