Return-Path: <linux-media+bounces-60334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F2tASWO+WlN9wIAu9opvQ
	(envelope-from <linux-media+bounces-60334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:28:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 709954C7379
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E03983020FF0
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32703C9EFB;
	Tue,  5 May 2026 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="leXi1OVu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EB039EF0B
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962526; cv=none; b=QEkYThKDNavCnH/Xixj8rjoo1QXGuYkn/5eYT2k4ZxB5u0e659t3MLomL4CBenIO3ItasNUetUj0hCTn22V0BBSeSA9sXDIohxEsgq73FRppB5fEEsBWE9q+UHyNKGaCoifqNzWPlTrNRZdW1sQ+6t+UZ+zM97PmM94LbRs5HH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962526; c=relaxed/simple;
	bh=Z5q9kbpu+YVibmPZ3irN56OC9K7TS0y54QdFeo2dXQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptxR0HL+1Vifg4EPDVsIiFsWlnP8f+ZRJsMqLjY2dkFwxYrKsYbgDFLk/l2wHjgoJJQEZcS0m0i/mbZexI2DzQwlVbfioBInkcvobKQ7RpSi8lrLjfMipgTETz3bk5SDYk+7eld3m/ylvRN511p0y6oHi4E43g6PuBKoaHC2FvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=leXi1OVu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777962525; x=1809498525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z5q9kbpu+YVibmPZ3irN56OC9K7TS0y54QdFeo2dXQY=;
  b=leXi1OVuP5yfcYL/DAmY5PFeID8v94cvW67jHKrG0tSg/w8Kuo4kDcqL
   eLKKxoOOHbsT6IFyyf7chlZRfXBmoAHbmOnirhizMkTWITH7Mw6q2dQXr
   9wOjGJFRX+/iWdll+BX4NNDSyyfn4+hx3AsX6yDM9W13rp99b+EXeJixP
   0VXhHqhPWf220xkfyhnIVK5UjYtOvB+2uy4rnp6B5xsiEk1gqVs4QRcmP
   f9myL1e3O8ikZhzk05B4nyhaOKHE0n3IYpuOwY1a4C4LqpPOzhppONzGv
   qrTCr+KrthzvbtX4eesABtHAzoLQWrx2/l/C4EWFWAk9/3XmhW7RcI5/H
   A==;
X-CSE-ConnectionGUID: crBh2DWVRqCFokRqVz1/zg==
X-CSE-MsgGUID: kMS7o9UWTnKpkv+1gK0jCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89414633"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="89414633"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:28:44 -0700
X-CSE-ConnectionGUID: f/rTviV7QnKIlHjeHIrqtQ==
X-CSE-MsgGUID: QdCo8/JESOOREf4e9T61Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="259392988"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.23])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:28:42 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB225121CB0;
	Tue, 05 May 2026 09:28:42 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wK9Gr-00000001kfs-3mGW;
	Tue, 05 May 2026 09:28:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v5 1/1] media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely
Date: Tue,  5 May 2026 09:28:41 +0300
Message-ID: <20260505062841.417736-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 709954C7379
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60334-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,intel.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
since v4:

- Send correct patch (v4 was the same as v3).

- Use WARN_ON() instead of WARN_ON_ONCE().

 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..d00d27d49060 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2504,6 +2504,10 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 	u64 source_mask = 0;
 	int pad_index = -1;
 
+	if (WARN_ON(!v4l2_subdev_has_op(sd, pad, enable_streams) ||
+		    !v4l2_subdev_has_op(sd, pad, disable_streams)))
+		return -ENOIOCTLCMD;
+
 	/*
 	 * Find the source pad. This helper is meant for subdevs that have a
 	 * single source pad, so failures shouldn't happen, but catch them
-- 
2.47.3


