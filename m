Return-Path: <linux-media+bounces-60333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id L0YbFMqN+WlN9wIAu9opvQ
	(envelope-from <linux-media+bounces-60333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:27:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5644C7360
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47091300B9F7
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CFB3C5526;
	Tue,  5 May 2026 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAfSD7jY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5C39EF0B
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777962433; cv=none; b=DKoLhRCxa/LF4lpxmmGkNMNdC5jkKeiyfwfbmGOyHK/qsqM6Sr/BHL6otHtHh1dMMJBGxcfaxaysurREzr8kmkMqaBQWDWf/aZVS7o7gZYurtn6lolEoeq8n8qz15tXr+DOfExeXklYW/KDdRBTwfrD/EZ1q1s9A9th22bKfhq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777962433; c=relaxed/simple;
	bh=TdF8pyWgxeYwKqPJ0luBfMinauTCQ6ZvAXtM2iE9OC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAI3e7Tsesf9N9l2pDPNfbIr7+j7CmsftqUuw5d3z6nbfldombRR5ySD9TgzmzgAxZjlU8SvXWm8zmSNMPu30qywjR7Gp9UjWkjl0W5osDsHVv1VGqkRBn7c67PhOoPWjCe5ujDthfh1sDgDncLlW52AG4uo1Gydk6BMibfAjgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAfSD7jY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777962431; x=1809498431;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TdF8pyWgxeYwKqPJ0luBfMinauTCQ6ZvAXtM2iE9OC0=;
  b=WAfSD7jYmj1dc3bR5xJR7CkdzKi6Y0USCrwBYWo/vk5A3ySr4IU9SeNu
   gp7c0sMKk5jZVSSR6iZCWagZSBKkXbRBf7jh/V8unNOc/dyxehK6Cp7I8
   MzdU3NvAWo7FSxjNfk1Z+9JeMK/HClrWHbRhbEbpyAbK60o4GrtLhKiJi
   PT9nLCO7D1pJUSh7zosyl8wohKU/ZZiBXLTHPFvQ+SxiGkr6TSH7/W6jz
   XC1FnN+cZ6cwRTGi+R/aomxudGK5Bw3JdAvJ6q3StO3CoCigWzslqBNUD
   b1wzeY6hXDvMfYxKVyhJpTRF9HzYssUi54NpgbNuiSLrVd9gRPUXK9nuP
   Q==;
X-CSE-ConnectionGUID: hl/PcD7jSBubb1MvUaSU6A==
X-CSE-MsgGUID: nTJJNI+aSTirI10spjAI0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89928313"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="89928313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:27:11 -0700
X-CSE-ConnectionGUID: QjGOI9HoTiWH+LZvJJ58cg==
X-CSE-MsgGUID: XtpA3T6wR7OF5c+2ZsVefw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="231351936"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.23])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:27:09 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 310BA121CB0;
	Tue, 05 May 2026 09:27:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wK9FM-00000001keQ-1EZm;
	Tue, 05 May 2026 09:27:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 1/1] media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely
Date: Tue,  5 May 2026 09:27:08 +0300
Message-ID: <20260505062708.417646-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C5644C7360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60333-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,ixit.cz:email];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
since v3:

- Use WARN_ON() instead of WARN_ON_ONCE().

 drivers/media/v4l2-core/v4l2-subdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 831c69c958b8..3b726f044d3f 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2504,6 +2504,10 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 	u64 source_mask = 0;
 	int pad_index = -1;
 
+	if (WARN_ON_ONCE(!v4l2_subdev_has_op(sd, pad, enable_streams) ||
+			 !v4l2_subdev_has_op(sd, pad, disable_streams)))
+		return -ENOIOCTLCMD;
+
 	/*
 	 * Find the source pad. This helper is meant for subdevs that have a
 	 * single source pad, so failures shouldn't happen, but catch them
-- 
2.47.3


