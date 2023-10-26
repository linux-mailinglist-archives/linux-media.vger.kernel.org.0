Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE377D7D41
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344229AbjJZHDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344364AbjJZHDv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:03:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0602C18D
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698303829; x=1729839829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xxsfTtlVQGlBAoDAfXRRpkkTWFLLZu22DoXXgMwMSmg=;
  b=mSmvLpqWw+Wb/4vkGhG0uZ0ZUcGdS4vyfUSWF7sLnPPSTsml+CYYn6rN
   k5d5O9ryCfz2p2wsKBqGClqUZU4VgPcaLNlEUN2y3+wGdHgTASTc6BRDJ
   6W4M/1qcBp1CZYqePOdVVmdZrUQ0S5Xcsl1DcDaGl300El4uJkodDcsnE
   21H1c4asb5N3b8bDjZa1JsGrZ+J3nNrGS5qTDn5ZlvkOSFP2xG2t3ANcM
   CXG/1L4s+UZ6NWjMgRNmAFvWqM1ATdH0R5i2V1iQXCovMUrA+SAKrT4tQ
   b9D7dmO0VTIhltnNsN73Y33wLrl4jXOmUsE32Re0wD8RXuVPyo+aQH8Au
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="451711568"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="451711568"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="902795811"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="902795811"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:01:20 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8DFD512055F;
        Thu, 26 Oct 2023 10:03:42 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v4 9/9] media: v4l: subdev: Warn on stream when accessing stream-unaware data
Date:   Thu, 26 Oct 2023 10:03:29 +0300
Message-Id: <20231026070329.948847-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Warn if the stream is set ot a non-zero value on sub-device pad state
access functions. A driver bug is required for triggering the warning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bd0d89c2996f..b7d2de6e750a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1681,7 +1681,7 @@ __v4l2_subdev_state_get_format_stream(struct v4l2_subdev_state *state,
 		return NULL;
 
 	if (state->pads) {
-		if (stream)
+		if (WARN_ON(stream))
 			return NULL;
 
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
@@ -1715,7 +1715,7 @@ __v4l2_subdev_state_get_crop_stream(struct v4l2_subdev_state *state,
 		return NULL;
 
 	if (state->pads) {
-		if (stream)
+		if (WARN_ON(stream))
 			return NULL;
 
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
@@ -1749,7 +1749,7 @@ __v4l2_subdev_state_get_compose_stream(struct v4l2_subdev_state *state,
 		return NULL;
 
 	if (state->pads) {
-		if (stream)
+		if (WARN_ON(stream))
 			return NULL;
 
 		if (WARN_ON(pad >= state->sd->entity.num_pads))
-- 
2.39.2

