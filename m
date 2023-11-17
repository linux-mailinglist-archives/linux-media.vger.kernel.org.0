Return-Path: <linux-media+bounces-494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1347EF17E
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 12:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC51281A3F
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35C02E622;
	Fri, 17 Nov 2023 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoDqadAE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBA9D4F;
	Fri, 17 Nov 2023 03:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700219684; x=1731755684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A9/YvkwCnHZnNCqK8j9jReosCqqZSDqKlSJZVgPOZyA=;
  b=KoDqadAEe7LI82XApf2ITN8iO9n+9Z6gxcuUxXF1Xl+s6KLjIjYIOVnh
   Dwx1sMfJH0YGaXzriT9ORDT+5TOAZu/4OCORYMR/KB6Pim9WyZ5p5kFOU
   Uj21UEvc/qw43L5RRzxoc46ftbYrEa5Z5djt5emhZI0dyPiZ+RJbDdWSa
   gwfrShGBlgcR8xE3+vqoI164YOlYcHPqp3UkK/EyUAXXa7yhKUD+eK6ix
   iMYEBmF09pUsDVwmPGLLAKzNlmzPDIYO5Ue2mjzWtTDxXsI44KEVwTaef
   NBh9VAm8qCMofhRmLzm/JwekRWlM0gYDFRY6iTnWOJ46/s1IT8FFqNgJp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9941643"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="9941643"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:14:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769201203"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="769201203"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 03:14:41 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D372D120F2C;
	Fri, 17 Nov 2023 13:14:37 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-acpi@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	rafael@kernel.org,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 5/7] media: ov8858: Use pm_runtime_get_if_active(), put usage_count correctly
Date: Fri, 17 Nov 2023 13:14:31 +0200
Message-Id: <20231117111433.1561669-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231117111433.1561669-1-sakari.ailus@linux.intel.com>
References: <20231117111433.1561669-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pm_runtime_get_if_active() to get the device's runtime PM usage_count
and set controls, then use runtime PM autosuspend once the controls have
been set (instead of likely transitioning to suspended state immediately).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov8858.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3af6125a2eee..a99b91700a8d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1538,7 +1538,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct v4l2_subdev_state *state;
 	u16 digi_gain;
 	s64 max_exp;
-	int ret;
+	int ret, pm_status;
 
 	/*
 	 * The control handler and the subdev state use the same mutex and the
@@ -1561,7 +1561,8 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	if (!pm_runtime_get_if_in_use(&client->dev))
+	pm_status = pm_runtime_get_if_active(&client->dev);
+	if (!pm_status)
 		return 0;
 
 	switch (ctrl->id) {
@@ -1601,7 +1602,8 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	if (pm_status > 0)
+		pm_runtime_mark_busy_autosusp(&client->dev);
 
 	return ret;
 }
-- 
2.39.2


