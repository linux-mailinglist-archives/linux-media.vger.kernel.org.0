Return-Path: <linux-media+bounces-480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7B7EEFD5
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1627E1F285BD
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8A718E07;
	Fri, 17 Nov 2023 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+Sc5FIA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9E9CE
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215945; x=1731751945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XMVXfYqXq8XxYJo47YYUBu3aXXDNydNH3NHuyTOczu0=;
  b=Z+Sc5FIAu1i1n75pH5ZxXxozF45NcLs6IO9m1/hdKcG7G4hw7N/50ntZ
   Kpf0F7iEdSOEUZU8SQQkSUNLY5AyllSbsmjva4z/Ms+RGvyx54hq/o4hw
   hIOahFDDabVieTiA2uGUzSfeOdtJI5YxLx6KdCmzHlXK2aVQA6DzpP+BL
   ycZB7Oi5xp1/Mq7a04Br2LTR0GvGX9Uya96eebWcJTtrqapXe0JK60yjI
   16wn5K3khlrMJF7qXv9CUfpv5MsTJvP9stEkHCA9Rw69kP5ni0h80yCbP
   QRGvvT4OnS0blESDlNDMF8iGVeP1EKNrlTXI7woTErwawwyj4KliAvHA7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771969"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771969"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494861"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494861"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:21 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C0FD120FFD;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005cAT-0w;
	Fri, 17 Nov 2023 12:11:50 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 9/9] media: v4l: subdev: Return NULL from pad access functions on error
Date: Fri, 17 Nov 2023 12:11:39 +0200
Message-Id: <20231117101140.1338288-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
References: <20231117101140.1338288-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return NULL from sub-device pad state access functions
(v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
this behaviour differs from older set of pad state information access
functions, we've had a WARN_ON() there for a long time and callers also do
validate the pad index nowadays. Therefore problems are not expected.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 36 +++++----------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 41fe9fa5c21a..985873b7981e 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1545,16 +1545,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].format;
 	}
@@ -1587,16 +1579,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].crop;
 	}
@@ -1629,16 +1613,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
 		if (stream)
 			return NULL;
 
-		/*
-		 * Set the pad to 0 on error as this is aligned with the
-		 * behaviour of the pad state information access functions. The
-		 * purpose of setting pad to 0 here is to avoid accessing memory
-		 * outside the pads array, but still issuing warning of the
-		 * invalid access while making the caller's error handling
-		 * easier.
-		 */
-		if (WARN_ON_ONCE(pad >= state->sd->entity.num_pads))
-			pad = 0;
+		if (pad >= state->sd->entity.num_pads)
+			return NULL;
 
 		return &state->pads[pad].compose;
 	}
-- 
2.39.2


