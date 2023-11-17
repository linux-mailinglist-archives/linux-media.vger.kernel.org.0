Return-Path: <linux-media+bounces-475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A837EEFCF
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 11:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64F861C20A23
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B66182A3;
	Fri, 17 Nov 2023 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUL5nsYF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E400C4
	for <linux-media@vger.kernel.org>; Fri, 17 Nov 2023 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700215940; x=1731751940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27DrjwHuNqWWVJsYjcUMVNBMCodLFrXYhkqNhTzmSuU=;
  b=JUL5nsYFkyjYNoZ/Z7ya1qLxCnPQBHPZgr+6sKBXC4hOYXL4q+l8/Vjo
   gIpj1P1PG53t5HSBlU7TxptfgaGX7h+czVkTjvmwG3NIKd4cRc6E3S+we
   mhfU8Wg3FqO3iId9wqsr+nx550OmCWqUkGTzxoBtT7mWg0dRIrmQp/GUJ
   LQbmv+KTekZlvBrR/ebHwQC318qGeYV8P1KpqEfwIzirjsZzSoUuxuh+Q
   Jzizri17UNyk4OVqobCHmFxIK9VAA/LBU/9JhklG2gewisXt3L8uF+3I4
   p+rw/SB2492zJ0Ni9gSCtKMrizxCayXyXxkqODtbkV2OgkTvwyF/8Fucu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457771917"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457771917"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715494795"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="715494795"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 02:12:17 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6477C120F2A;
	Fri, 17 Nov 2023 12:12:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1r3vpG-005cA4-0d;
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
Subject: [PATCH v9 4/9] media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
Date: Fri, 17 Nov 2023 12:11:34 +0200
Message-Id: <20231117101140.1338288-5-sakari.ailus@linux.intel.com>
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

Now that v4l2_subdev_state_get_format() always returns format, don't call
alternative v4l2_subdev_get_pad_format() anymore.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a6f480ef7881..9eef170934c5 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1587,14 +1587,7 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
-		fmt = v4l2_subdev_state_get_format(state, format->pad,
-						   format->stream);
-	else if (format->pad < sd->entity.num_pads && format->stream == 0)
-		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
-	else
-		fmt = NULL;
-
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	if (!fmt)
 		return -EINVAL;
 
-- 
2.39.2


