Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E627E46FF
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 18:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343833AbjKGR3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 12:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343825AbjKGR3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 12:29:30 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EC49C
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 09:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699378167; x=1730914167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iBXHfi+JOdqhCFcq9kHtOv+0A+r2uAckM9siHHVhA5A=;
  b=ZU/sqckJilTuEwA9CaxJ6plcK73kk+egw7vZ8+YkFv3YOj78kK9ot7df
   Xvy1XOXpXcyzytRaJxa4NTDJvmKDpXvJPSoNn7PJXnuzRw10LGd2HITpQ
   NrdVAzd9RwWnt2ApE0kI81BUVI5XPvVjzOq83gCtuW+1V7/OUe2heUmFn
   V+HWiUGugZDsZ8n4AN5+4WxMIP+HRRKTCrlq7Nr2Hy9tR9jm9mO0uMWuA
   qLrvHXcVn4hz72Mcu6nA1VMUT+16v8JhzoM2wDWSsYwiZAzoAF6n0N3DU
   AzW6hP11A4MteV8OmoiOqG1YI3Z8nx5Fug+/4LQ3DXQh+9f7Z1Bz304rc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389368985"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="389368985"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="853441225"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="853441225"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 09:29:23 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 01D451202B6;
        Tue,  7 Nov 2023 19:29:21 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v7 8/8] media: v4l: subdev: Return NULL from pad access functions on error
Date:   Tue,  7 Nov 2023 19:29:01 +0200
Message-Id: <20231107172901.1302019-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
References: <20231107172901.1302019-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 5298226b6a4d..57ef4fce1186 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1684,16 +1684,8 @@ __v4l2_subdev_state_get_format(struct v4l2_subdev_state *state,
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
@@ -1726,16 +1718,8 @@ __v4l2_subdev_state_get_crop(struct v4l2_subdev_state *state, unsigned int pad,
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
@@ -1768,16 +1752,8 @@ __v4l2_subdev_state_get_compose(struct v4l2_subdev_state *state,
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

