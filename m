Return-Path: <linux-media+bounces-56696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCoYOdIewWmqQwQAu9opvQ
	(envelope-from <linux-media+bounces-56696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:06:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494372F0D5C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6B1F3093E39
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 10:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA75F3914FC;
	Mon, 23 Mar 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YU56LoHl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10536E48E
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263417; cv=none; b=KvA0OVuRB03dsmUinpWpHrbIPFmbqkn6FKyQ4ISFW1USNgksMXmX8CNBb67mHvIDPWgihsYEGpI95qmusj+wWiUHbJ0Mlw87C92BVJDvK6Qp6T7+o+4HOvz/6GVIFwjFPfHzJtsU3iIgvXGx6pQe+NQPUQZq9YBb8tny3O84XgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263417; c=relaxed/simple;
	bh=3A39sZV5B+ImR0ngJcVwmAu9gQchxCPLP/n9JSTCs10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZ2Vw134osZQfHk3I2W29aUCPqlBarnnhsCDZu+f6SaWiiV27nI+VAmFEoeoOTc4gSgYylRtPrBVuBOhHFSxuJeLoRTpRJ+K/no6/CgwutOnYAkVKCWrS/e5vxAO57RiGMXNqBysoxFNQZcs+rBsVE9eil2sSl0qc/5kOFCiUPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YU56LoHl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774263415; x=1805799415;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3A39sZV5B+ImR0ngJcVwmAu9gQchxCPLP/n9JSTCs10=;
  b=YU56LoHlfJ7WS85fd6UXQUJylsoIj+o2fmdlWP4+GbW9OJ01QqvCpd/m
   z1YKEkuU5plDZxk6m7H6L6Iwkhc2sRltE0EZ54Wa8TC7+9XPr6WGEppUL
   7PWMGyChXsIxAeIPxnjl21J+l9Xhe4YfcgpeKs2KkAKzrCKCb8TAeMVes
   IxD2SV23cbsTlVsvvoLksGIlzVLORGCp1Y6TtnDb7tMEzJSHdB1xiOfrM
   qNp1UNQkJqVOEtNKG7L+TLpBmXSzNbBRGsKicsmnN27Nq2d0lmln92/5v
   paevddAsJh5ZPBks2XxVyepiPbv8dxsHL6khoBRVuZICUq3rHxJbA4arc
   w==;
X-CSE-ConnectionGUID: di+GVSFMQmekwGryFTpWQg==
X-CSE-MsgGUID: sxef2ukvQRa2ov/A095Pyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74966320"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="74966320"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:56:55 -0700
X-CSE-ConnectionGUID: R3UnLYpuTx+IFPQSwd4ngw==
X-CSE-MsgGUID: gxdPZe2FTceqc87iq01lEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219637114"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:56:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 138A7120832;
	Mon, 23 Mar 2026 12:56:56 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w4cxr-000000037Uq-1tcI;
	Mon, 23 Mar 2026 12:56:55 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 1/1] media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely
Date: Mon, 23 Mar 2026 12:56:55 +0200
Message-ID: <20260323105655.743792-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56696-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,ixit.cz:email];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 494372F0D5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If a sub-device does not set enable_streams() and disable_streams() pad
ops while it sets the s_stream() video op to
v4l2_subdev_s_stream_helper(), enabling or disabling streaming either way
on the sub-device will result calling v4l2_subdev_s_stream_helper() and
v4l2_subdev_{enable,disable}_streams() recursively, exhausting the stack.
Return -ENOIOCTLCMD in this case to handle the situation gracefully.

Reported-by: David Heidelberg <david@ixit.cz>
Fixes: b62949ddaa52 ("media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams()")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v1:

- Better patch description.

 drivers/media/v4l2-core/v4l2-subdev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..f8ea4afc6cbb 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2334,11 +2334,13 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
 
 	/* Fallback on .s_stream() if .enable_streams() isn't available. */
 	use_s_stream = !v4l2_subdev_has_op(sd, pad, enable_streams);
-
-	if (!use_s_stream)
+	if (!use_s_stream) {
 		state = v4l2_subdev_lock_and_get_active_state(sd);
-	else
+	} else {
+		if (!v4l2_subdev_has_op(sd, video, s_stream))
+			return -ENOIOCTLCMD;
 		state = NULL;
+	}
 
 	/*
 	 * Verify that the requested streams exist and that they are not
@@ -2435,11 +2437,13 @@ int v4l2_subdev_disable_streams(struct v4l2_subdev *sd, u32 pad,
 
 	/* Fallback on .s_stream() if .disable_streams() isn't available. */
 	use_s_stream = !v4l2_subdev_has_op(sd, pad, disable_streams);
-
-	if (!use_s_stream)
+	if (!use_s_stream) {
 		state = v4l2_subdev_lock_and_get_active_state(sd);
-	else
+	} else {
+		if (!v4l2_subdev_has_op(sd, video, s_stream))
+			return -ENOIOCTLCMD;
 		state = NULL;
+	}
 
 	/*
 	 * Verify that the requested streams exist and that they are not
-- 
2.47.3


