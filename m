Return-Path: <linux-media+bounces-1803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E75808523
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 617AE1F225C6
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 10:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D16B35295;
	Thu,  7 Dec 2023 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d30qm20q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA96121
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701943619; x=1733479619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FbKbzxlY1fOi/CupiRSbnwdxQKVK9bj3kEy7jEi60Ho=;
  b=d30qm20qasXy6dEK6tQ2CT5JSal3PHZDUCKnCqmtHUccTJXzKcv1Ryem
   Ex1pE79AgO4uDuN0FQV08RCeQDUns29p1fbZELN2Bzm6XNI9Rfgh71FOg
   k8b6W8KC7JKxnUex2clkaiJMW/LAq5UC2GS0K+8Hr0Lm0FR5zNVgcRj0J
   JnLCI5WegQrEdmu+qeGFIAlXnqbk1EMDhCp/Fw8m8i9rN3PzmK5NqANiB
   jnBIq2oxn9oZiRSqCaB+s/03cTkDmd2KvNL1gUDRbgogBZFn49aM8YtMM
   UblW4DFWVhS5vKc2h1pbROCRF3xOqZYIPf6WuLMxim4Zda359UbA+G8dg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12922147"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12922147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 02:06:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895082241"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="895082241"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 02:06:56 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F1BAB11FB50;
	Thu,  7 Dec 2023 12:06:53 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rBBHB-003giS-14;
	Thu, 07 Dec 2023 12:06:37 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com
Subject: [PATCH 1/1] media: v4l: Safely to call v4l2_subdev_cleanup on an uninitialised subdev
Date: Thu,  7 Dec 2023 12:06:27 +0200
Message-Id: <20231207100627.879176-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Graciously handle an uninitialised (but still zeroed) sub-device in
v4l2_subdev_cleanup(). The list_empty() check there is unnecessary, too,
so replace that by cheking whether the lists's next field is NULL.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4fbefe4cd714..1fa1acfa5b7b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1521,7 +1521,8 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 	__v4l2_subdev_state_free(sd->active_state);
 	sd->active_state = NULL;
 
-	if (list_empty(&sd->async_subdev_endpoint_list))
+	/* Uninitialised sub-device, bail out here. */
+	if (!sd->async_subdev_endpoint_list.next)
 		return;
 
 	list_for_each_entry_safe(ase, ase_tmp, &sd->async_subdev_endpoint_list,
-- 
2.39.2


