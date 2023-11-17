Return-Path: <linux-media+bounces-476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171E7EEFD0
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630D71C20ADD
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFA318AF8;
	Fri, 17 Nov 2023 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL5WOt6W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F253C5
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215941; x=1731751941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LkeDvVqZYe4Mrlq8PYgNiCbzx4s0xYzkJlXA3Jl3gjM=;
  b=SL5WOt6WuwlL4duBEO58iLuTU6iIlT9NS07g4kOOMnmNYp1wkzhadNtI
   kaZci10nzVSGGG64AHjzVFHygMAoeiuJZk250ePzkZ8jRHLkJFnnuM/EM
   EjFZSDL9MXBHj0Bnfdj9VFq7JWTGyyKdF/A0ebfo4uIFsqlGOgSgLqbmd
   83hy4jbLdCet4pC54F/xBGP0ePM6yS7CizvwhSa24N6U+u7UQ7AgIXZhS
   wsStdiZVAdivzbhBcA/mtOmkcjnJH3rYTLdp8w6p0wT89W2f9nMWL0h6G
   7ZWp+OsbQ/pdNlH4ykDPrO9ymoSyB2wxp9nxF0dahTftnjCoNSaDvrm07
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771924"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771924"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494803"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494803"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:17 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 54F05120E67;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005c9p-0P;
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
Subject: [PATCH v9 1/9] media: v4l: subdev: Store the sub-device in the sub-device state
Date: Fri, 17 Nov 2023 12:11:31 +0200
Message-Id: <20231117101140.1338288-2-sakari.ailus@linux.intel.com>
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

Store the sub-device in the sub-device state. This will be needed in e.g.
validating pad number when retrieving information for non-stream-aware
users. There are expected to be more needs for this in the future.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 ++
 include/media/v4l2-subdev.h           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index be86b906c985..cd3ff5b19d0c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1448,6 +1448,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
 	else
 		state->lock = &state->_lock;
 
+	state->sd = sd;
+
 	/* Drivers that support streams do not need the legacy pad config */
 	if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
 		state->pads = kvcalloc(sd->entity.num_pads,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8a345b5fa39d..46296852cb5b 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -749,6 +749,7 @@ struct v4l2_subdev_krouting {
  *
  * @_lock: default for 'lock'
  * @lock: mutex for the state. May be replaced by the user.
+ * @sd: the sub-device which the state is related to
  * @pads: &struct v4l2_subdev_pad_config array
  * @routing: routing table for the subdev
  * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
@@ -761,6 +762,7 @@ struct v4l2_subdev_state {
 	/* lock for the struct v4l2_subdev_state fields */
 	struct mutex _lock;
 	struct mutex *lock;
+	struct v4l2_subdev *sd;
 	struct v4l2_subdev_pad_config *pads;
 	struct v4l2_subdev_krouting routing;
 	struct v4l2_subdev_stream_configs stream_configs;
-- 
2.39.2


