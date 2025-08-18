Return-Path: <linux-media+bounces-40163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C053B2AA8C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 16:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B4D1BA359D
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84A2343D78;
	Mon, 18 Aug 2025 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuiL6eHC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF6322C76
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526492; cv=none; b=WZoMKDNOfo89RoPj4H3vmtbOV+gZ0uroMrJJ5RvNKn7WXW6xwb+zHw1Fyw1gLgxkVPcqNivxntLnyiFxxn9+yzRceeItjRNjLkqbJzIPqvphJF0Tey5aNml3oBfg5uEWwQhom3E807fpgh+u5JtG3jkZTjxP8lDFOSUi7O+qtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526492; c=relaxed/simple;
	bh=ru3fXmuyEwVsiOaS/Fmonf+OqbMaVFoTw2oIDDTy6Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I8gsQJl93X+1AHrc/GBbf07docOnVehI1fEnIFYJfKXY4kPlFBiunqSZlaDgI/1HOMg65Ff2ISNk+c+5lB8Tv3k2YU68IVRogCfnnQMNQcye2T9WxLkaj8bBCwbZlvQ0xfnAfjMKIZ6CrBd/XiSflM88LojKZRRZ2qPwgeP8w8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuiL6eHC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755526491; x=1787062491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ru3fXmuyEwVsiOaS/Fmonf+OqbMaVFoTw2oIDDTy6Hw=;
  b=RuiL6eHCeb4lSdoifSty1A3WKGMeFMIXq43xxYnXlJyhuhmEhdL347Ra
   D81AjzVyScZM63Pqiy0tiI2J75nlie6BRvks1OYWCyHLxTgCfd11LCdtU
   B/51lFw02eaI2C+8UDFG6k+kLzyQlXbT5PQugFYe96CiyR6muL3NkI5mL
   5Lu0ucgtoxXBeKoHVhK7VsAcCq6NcQ9zmftLL7X07OxQDEtKDLrK/f/RM
   c+nE6uHiHR91j2neuhQ02ORUi8TYG7VRfvt1Ym9jSFGidDwBTe2Moagcc
   ahYH1/9g/z3l24UqPJ6xx6HTbjNLgGdjcJiqqtIHdGszuPNojP2l9rhI9
   g==;
X-CSE-ConnectionGUID: jnFvOUksSPWxcQH8a7OO2g==
X-CSE-MsgGUID: /XU/c0KESQ28UYAQlv1RTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57606977"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57606977"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:50 -0700
X-CSE-ConnectionGUID: 5NVvXaLLTQ69m8EGbxmNNw==
X-CSE-MsgGUID: 7dmTQipiQYS82qXPS0nYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166755392"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.252])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 07:14:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F2E0F1201E5;
	Mon, 18 Aug 2025 17:14:44 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uo0dI-004rv6-2l;
	Mon, 18 Aug 2025 17:14:44 +0300
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
Subject: [PATCH 1/2] media: amlogic: c3-mipi-csi2: Call v4l2_get_link_freq() on source pad
Date: Mon, 18 Aug 2025 17:14:43 +0300
Message-Id: <20250818141444.1160565-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
References: <20250818141444.1160565-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call v4l2_get_link_freq() on the source pad so we can remove the
workaround allowing doing that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index 1011ab3ebac7..d56525d5fd74 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -389,12 +389,12 @@ static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
 }
 
 static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
-				    struct v4l2_subdev *src_sd)
+				    struct media_pad *src_pad)
 {
 	s64 link_freq;
 	s64 lane_rate;
 
-	link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
+	link_freq = v4l2_get_link_freq(src_pad, 0, 0);
 	if (link_freq < 0) {
 		dev_err(csi->dev,
 			"Unable to obtain link frequency: %lld\n", link_freq);
@@ -434,7 +434,7 @@ static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
 
 	pm_runtime_resume_and_get(csi->dev);
 
-	c3_mipi_csi_start_stream(csi, src_sd);
+	c3_mipi_csi_start_stream(csi, csi->src_pad);
 
 	ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
 	if (ret) {
-- 
2.39.5


