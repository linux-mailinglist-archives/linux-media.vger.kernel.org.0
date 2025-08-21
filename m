Return-Path: <linux-media+bounces-40564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7CB2F79E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272FF3AE040
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 12:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C3C31064D;
	Thu, 21 Aug 2025 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYendqm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02217266EFC
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 12:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778337; cv=none; b=dxpq8CqzuPxvdxwLf5QS6mLCh8WS5ljQonzjlR23Orwbga0oLy/d5vCzXB42qr7e+pau+GNV3PhACGf+xYdxJpedLCs01VHWrR4QpAuXI2ne6gphv3JOe4IFuI22sOG3odzaD7FhbckcQrZsUq62fFSvhHB6SGgxvlhrLtTKY4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778337; c=relaxed/simple;
	bh=ETOx8JMXUB88bvodRkCFvrcQhQNw6oklIR6YRmm+7yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwaU4B8m03oId8xPL8cp1NyYCiFLptO6HwqHaWMkrXnIIpkkY5+NaPrBeIN17G5AGYwCQ6uRsRIDdf1TflxdTDjlOT2JcRpJm9AAxo/iefMiZ6qncSnewNvi4WaDOmvRUF6uspSXpm3HY+Su0yqxqd8ZqwEfT5U4oAWnIjiAskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYendqm5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755778336; x=1787314336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ETOx8JMXUB88bvodRkCFvrcQhQNw6oklIR6YRmm+7yo=;
  b=HYendqm5X+zBpHtlxxYodpq70tdJSuAWveMfkM3QHqNX9UolY6QQAVGL
   k7cXGbNw9/v49bxur8gkVzkbgk7J8PTwRmNWKqh/Eii7aNq7Gb3as185d
   0BL9rVvhDC2y0eF4jDJ/AAqPB0KNsB6hspzdvNXv3rwtLKIBLox9VWHs2
   50IbdGHv6JiuJDHtNha/IQIGZOFj5xP6/AtOY2XoFftDG6nrGu+/FbXeF
   lA4KmP3AwuiT66Yw3viV8L15tcYsPf+XZEfzxdMasA66eo0zflR30a6In
   iv759AsfbFYSAGRwyUJjaFuwLCX08IOA3SMWRK/df8VE7IY0uEWXjBMEt
   w==;
X-CSE-ConnectionGUID: qDNnjsAXSBGvB9Pmf86kUw==
X-CSE-MsgGUID: +m7h2FPWQCqjbJ8u66lv8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57089501"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57089501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:12 -0700
X-CSE-ConnectionGUID: pyn/VrIJRSKJ1IitL4Agbw==
X-CSE-MsgGUID: i2fBxdutQuGaciKQs3qzYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="192077011"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:12:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 19D2912083F;
	Thu, 21 Aug 2025 15:12:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1up49I-00000002Jri-0UEZ;
	Thu, 21 Aug 2025 15:12:08 +0300
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
Subject: [PATCH v3 3/3] media: v4l2-common: Update v4l2_get_link_freq() documentation
Date: Thu, 21 Aug 2025 15:12:07 +0300
Message-ID: <20250821121207.552993-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that v4l2_get_link_freq() obtains the link frequency primarily
by calling the get_mbus_config sub-device pad operation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-common.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index ab0ce8e605c3..c387deffbdd0 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -567,9 +567,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
  *	 times two on D-PHY, 1 on parallel. 0 otherwise.
  *
  * This function is intended for obtaining the link frequency from the
- * transmitter sub-device's pad. It returns the link rate, either from the
- * V4L2_CID_LINK_FREQ control implemented by the transmitter, or value
- * calculated based on the V4L2_CID_PIXEL_RATE implemented by the transmitter.
+ * transmitter sub-device's @pad. It returns the link rate, primarily obtained
+ * through the get_mbus_config sub-device pad operation or secondarily through
+ * either from the V4L2_CID_LINK_FREQ control implemented by the transmitter, or
+ * value calculated based on the V4L2_CID_PIXEL_RATE implemented by the
+ * transmitter.
  *
  * Return:
  * * >0: Link frequency
-- 
2.47.2


