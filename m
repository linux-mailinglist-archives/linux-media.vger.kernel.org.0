Return-Path: <linux-media+bounces-61388-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WExxEi5WBGqjHAIAu9opvQ
	(envelope-from <linux-media+bounces-61388-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8D531888
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10326304840F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A373FD13D;
	Wed, 13 May 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlEEpTNW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5C3DD871
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669053; cv=none; b=iGx9IbRzy2cWSVX8YcuR+aHbUtl7yHytbIFSqlDzB9ATWfS8FM9UtUO8a0eyN5sn+CN2Miwq2nyncFhsGdPXG9bsw4F6KqzGsMr6dygXo9o5NjWkhM3M1fS7RYNHaSFFuOo+jZLvD912dYRyh/nCUewJpJlxeTTE8s88cNqIriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669053; c=relaxed/simple;
	bh=13v8+qy9P9ng+cRMne0/v++E8kaibZiREcOKfQ7hsMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzG0yR0Y418vNr0EU0I1cEuBhzGYfoYjYtMRcIqRmueFRgOAT981qZ9+rTor4ZlKbOZyweoQ+H/eizzdmpP2DFveYedpKZGznTPyDkqpjNtV80fAY18GPK253PgJmUKnxyxBvok0649h5KNtP+vssk+UuYxuOzwm3u9OmqSH39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlEEpTNW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669050; x=1810205050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=13v8+qy9P9ng+cRMne0/v++E8kaibZiREcOKfQ7hsMg=;
  b=DlEEpTNW+vdihkoxk2LQQHhBXTjwbS0xUmvncW9hHOedgojL2e4T/gan
   O4D00K34Pr6iz4GAxgN7L6D5lKNNCKvtmG9VeEC703HSCr8BM6DkOuNQ4
   1LHorlzQbUYhtlbCY6YSRchgtxtaTSS7MfDAoQY9bTsNHIIw5tkYP1gud
   HytLhFak7CNnhITym50W5URIsAuYzEYBWeV87QCPe1iROxga0nTarI8Ta
   2JdHaCtHrqSZKzXtWhGUukNa7pHA1UIN/+n0HerS9g93tYVHitR0LPZId
   IP5NxfKcGf/iOnShmy6pW0sdIKhZJKebrUQo+IOqpEbNZvohWT1qP7csY
   Q==;
X-CSE-ConnectionGUID: ER5c80hdTWSv1UQHv8Mlqw==
X-CSE-MsgGUID: 6k7UARk/Q+SiPIjRqNFhLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464473"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:08 -0700
X-CSE-ConnectionGUID: TG4YQUfmR+yzsWG/25K0oA==
X-CSE-MsgGUID: lwguWTwjRPyxYRrECKAsMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599264"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DCE25121DB4;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S1z-3ZK8;
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
Subject: [PATCH 12/17] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc()
Date: Wed, 13 May 2026 13:43:53 +0300
Message-ID: <20260513104358.2252605-13-sakari.ailus@linux.intel.com>
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
X-Rspamd-Queue-Id: 07E8D531888
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61388-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
preferred over calling the get_frame_desc() pad operation directly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 21 ++++---------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..96c899bb542a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2008 Magnus Damm
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
@@ -411,24 +412,10 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	int ret;
 
 	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
-	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
-	if (ret < 0 && ret != -ENOIOCTLCMD) {
-		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
+	ret = v4l2_subdev_get_frame_desc(cru->ip.remote, remote_pad->index,
+					 V4L2_MBUS_FRAME_DESC_TYPE_CSI2);
+	if (ret < 0)
 		return ret;
-	}
-	/* If remote subdev does not implement .get_frame_desc default to VC0. */
-	if (ret == -ENOIOCTLCMD)
-		return 0;
-
-	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
-		dev_err(cru->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
-		return -EINVAL;
-	}
-
-	if (!fd.num_entries) {
-		dev_err(cru->dev, "get_frame_desc returned zero entries\n");
-		return -EINVAL;
-	}
 
 	return fd.entry[0].bus.csi2.vc;
 }
-- 
2.47.3


