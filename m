Return-Path: <linux-media+bounces-61392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOMRJDxWBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E385318A5
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF689306741B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68843EE1E6;
	Wed, 13 May 2026 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E30dtbGg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77043FE342
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669055; cv=none; b=VX9DhPoeWszhpLJU09p3iSRlKeVWmot2UCD2YTg9dxMohj7LUbQod1g9TAvI/5hInzc4CDxXc9q4tcHjVnfbWWJpmXFxVe+gIopIBI8mcktvjNTGXzRLpcKJ6m7mzZWS1WmO/Q05KQBXjj5jT0uYeWjBLzqgZOhyBJ+6jCs9vMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669055; c=relaxed/simple;
	bh=5XCORmoRb6GHcmShviuFCNFDG0+1/1zKMr21GMDicjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnWVGLJ7EySU0DqNse13UZ+59XQQ+e5poeuAC58tiKCxmStQ5ECCn3SAd3BHpmBKLcKKKD71or195Iqd0PQGZ8ifII7SXBOyD/9WKUx5LUDo0zq/EYs6SCBgqeWJBjKM6k4cjvvMPglnswyqjOzQfQHbpIW10zk5K0ZmW7ld2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E30dtbGg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669054; x=1810205054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5XCORmoRb6GHcmShviuFCNFDG0+1/1zKMr21GMDicjg=;
  b=E30dtbGg75olw09vZjpy41CPHpv/dSy0998+osBWOrqucl2YYeJLIndp
   ytpIzns6kqdRRUr6wiSCzB2PRNM59Ktc9E98BQsTdzG1MZQh/bkSWJ+E2
   lhCXAh97F4Y7Ci6m8YUYm7Qg9pzo1tIOudigq4uSwZYj6yG163E4tYepJ
   JX5DEA9So6eo2phocD3zr4ujn9f8GcXEwDa2NYbWe0hWkrFlH1nvNs1eq
   NmFwfKayH9xmivNg+qymWuvdEx9Oo5cYPkumKvBcF0K9GCYMHR0IYejuD
   nCnbeh6COpTUaLsadomyV5/WXYMY5Amosb6XyqJSnTYi/i53769aXk2/U
   A==;
X-CSE-ConnectionGUID: I8JrCwE6S4urnRJek7VK4A==
X-CSE-MsgGUID: xiGJ56GJTiC6W+Jis0eh9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464497"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:12 -0700
X-CSE-ConnectionGUID: lypMi5qESdaPtBcuB6Y8Yg==
X-CSE-MsgGUID: KZxEj6GuRsWJ5gdQaO6HiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599295"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E66C3121DBC;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S2E-3j8k;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 15/17] media: ti: cal: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:56 +0300
Message-ID: <20260513104358.2252605-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 56E385318A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61392-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,ideasonboard.com:email];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c | 25 +++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 00a71dac0ff4..8a81fecc00af 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -9,6 +9,7 @@
  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -872,7 +873,8 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				       struct v4l2_mbus_frame_desc *fd)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
-	struct v4l2_mbus_frame_desc remote_desc;
+	struct v4l2_mbus_frame_desc *remote_desc
+		__free(v4l2_subdev_free_frame_desc) = NULL;
 	const struct media_pad *remote_pad;
 	struct v4l2_subdev_state *state;
 	u32 sink_stream;
@@ -893,24 +895,19 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		goto out_unlock;
 	}
 
-	ret = v4l2_subdev_call(phy->source, pad, get_frame_desc,
-			       remote_pad->index, &remote_desc);
-	if (ret)
-		goto out_unlock;
-
-	if (remote_desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		cal_err(phy->cal,
-			"Frame descriptor does not describe CSI-2 link");
-		ret = -EINVAL;
+	remote_desc = v4l2_subdev_get_frame_desc(phy->source, remote_pad->index,
+						 V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (IS_ERR(remote_desc)) {
+		ret = PTR_ERR(remote_desc);
 		goto out_unlock;
 	}
 
-	for (i = 0; i < remote_desc.num_entries; i++) {
-		if (remote_desc.entry[i].stream == sink_stream)
+	for (i = 0; i < remote_desc->num_entries; i++) {
+		if (remote_desc->entry[i].stream == sink_stream)
 			break;
 	}
 
-	if (i == remote_desc.num_entries) {
+	if (i == remote_desc->num_entries) {
 		cal_err(phy->cal, "Stream %u not found in remote frame desc\n",
 			sink_stream);
 		ret = -EINVAL;
@@ -919,7 +916,7 @@ static int cal_camerarx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 1;
-	fd->entry[0] = remote_desc.entry[i];
+	fd->entry[0] = remote_desc->entry[i];
 
 out_unlock:
 	v4l2_subdev_unlock_state(state);
-- 
2.47.3


