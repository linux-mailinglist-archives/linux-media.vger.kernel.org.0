Return-Path: <linux-media+bounces-50886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F46D31286
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 890C1308E4F2
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5703721B192;
	Fri, 16 Jan 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iC/gb9BC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC41D6DB5
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566927; cv=none; b=IuF61HtWsc/E35J8WYFdLGzaJtrH9GBRXqFyaLVh2L2InReC0LZ2Z5124tR1HLw6QWsi5LWEcE2floTrjokzD2Bb1YRwPQP0OBmBvx52/wOYgRzI5VB+EiD5cpXFqLjAcT0NbK4ReVaDuJEaiXrQZr7pDCD6JEcXYxnPNtAn3lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566927; c=relaxed/simple;
	bh=qTH8fEUpqHuZ3zXJBP6ACV+xIPxTUHehgoQbYnoaBOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDgGc6nx9fYcMdoWWWOMZQ+JgaMS/HHiVumr6uGrqMxoA9sMyee32/78nNe8bRCjUwJpNWwtUPO7V1HL7K2XIpi/m18bsMZQyvZMsItvp8s5FOPo0whag12CAuEjs7XDeqHS/66qH7QVPW3mU0SeDl1zsSXJdCSpvbmMBAitI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iC/gb9BC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566921; x=1800102921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qTH8fEUpqHuZ3zXJBP6ACV+xIPxTUHehgoQbYnoaBOI=;
  b=iC/gb9BClhgWg8uSQpLpTe5MB/vHkE/AEvBcfS8MKwzq2vB/uXbl/QZ7
   GzD5rXxmPcEp06Cb2vU2hlByq2LxTyYNHj1Wu2AJM59lddzoudilvaJCG
   mW3NUvIiZL9CmKx6sF/teG7XmxZZ0Tfb6KF9wibbyuZ8OPtTr+xQrXFnL
   AxZAKbMam8oPCUUVi2oAuolGfuPpll6PRCo2Y0GB0voPofFi2KKzJsttN
   7v/akqnI7DM4SLNM5OLE/Xi46hJ7090j3or1mLAsFm5DJ64B2g+T3ONcN
   19Nq1eU6wE7QTcfKTr/KOIzuHgmpcdfq+/nE5Ygnhzhz7Q8yDwk3doFBc
   g==;
X-CSE-ConnectionGUID: K7jP9ZBkR+iMrQu+j08lRg==
X-CSE-MsgGUID: MMG+nmxKQNyFPtZC4bfN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327485"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327485"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:19 -0800
X-CSE-ConnectionGUID: Fa0PmZ9uSpmvisAB5xmGZw==
X-CSE-MsgGUID: 1lOSVmo+Ti6fnK8kdqX5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511910"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:18 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1D6CD120A6F;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2o-00000000vUW-463e;
	Fri, 16 Jan 2026 14:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 6/8] media: ccs: Remove which parameter from ccs_propagate
Date: Fri, 16 Jan 2026 14:35:12 +0200
Message-ID: <20260116123514.220949-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
References: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_propagate() no longer stores information in the driver's context
struct. The which parameter can thus be removed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4a680f3f34e5..062c70b0a47d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2156,8 +2156,7 @@ static int ccs_get_format(struct v4l2_subdev *subdev,
 
 /* Changes require propagation only on sink pad. */
 static void ccs_propagate(struct v4l2_subdev *subdev,
-			  struct v4l2_subdev_state *sd_state, int which,
-			  int target)
+			  struct v4l2_subdev_state *sd_state, int target)
 {
 	struct ccs_subdev *ssd = to_ccs_subdev(subdev);
 	struct v4l2_rect *comp, *crop;
@@ -2278,7 +2277,7 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 	crop->top = 0;
 	crop->width = fmt->format.width;
 	crop->height = fmt->format.height;
-	ccs_propagate(subdev, sd_state, fmt->which, V4L2_SEL_TGT_CROP);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -2487,7 +2486,7 @@ static int ccs_set_compose(struct v4l2_subdev *subdev,
 		ccs_set_compose_scaler(subdev, sd_state, sel, sink_crop);
 
 	*comp = sel->r;
-	ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_COMPOSE);
+	ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_COMPOSE);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ccs_pll_blanking_update(sensor);
@@ -2571,7 +2570,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	*crop = sel->r;
 
 	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
-		ccs_propagate(subdev, sd_state, sel->which, V4L2_SEL_TGT_CROP);
+		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
@@ -3077,7 +3076,6 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		v4l2_subdev_state_get_format(sd_state, pad);
 	struct v4l2_rect *crop =
 		v4l2_subdev_state_get_crop(sd_state, pad);
-	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	guard(mutex)(&sensor->mutex);
 
@@ -3096,7 +3094,7 @@ static int ccs_init_state(struct v4l2_subdev *sd,
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
 
-	ccs_propagate(sd, sd_state, is_active, V4L2_SEL_TGT_CROP);
+	ccs_propagate(sd, sd_state, V4L2_SEL_TGT_CROP);
 
 	return 0;
 }
-- 
2.47.3


