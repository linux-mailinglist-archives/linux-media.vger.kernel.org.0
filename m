Return-Path: <linux-media+bounces-53905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM9gB7iUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D323E1CA472
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 275B33025272
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17556274B32;
	Sun,  1 Mar 2026 01:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CL0ULl8m"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806D72594B9;
	Sun,  1 Mar 2026 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328045; cv=none; b=OKRSvWr6d/QWG+RLB9I58l34wQ124dKpGJo9ThVx7QNSRsezsPoNPmRBWZ0w4mviMYpjYWZVnXBeSCd+S4+Zv93cH4GhOFATlXRSZym7R+cb43PRhDJhuMbmw+Zm77AjMQgZumv+CJ0FZdZRPOFhJuT05QUGTFTWCgkeL4w8KJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328045; c=relaxed/simple;
	bh=7YfL+j5ENfoW3/bmh03pNrNVnz9b5W+bwhzAYGL0yDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c55hKWLguAm3S8rVFNLZfYbhLovF1xgEl1K6hu2lQf224/lZHzotpFSILVRAy7jni6fTCOUPecDYcUle9hjuKUJcj7LO+WdNJFmCkaBeHWYMo9yYrQgHGlys+AQkhpko8wvgs6WDBkOKuQ4UpTVAd+VWmCs+nzJfERvwpSWW1mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CL0ULl8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724E9C19421;
	Sun,  1 Mar 2026 01:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328045;
	bh=7YfL+j5ENfoW3/bmh03pNrNVnz9b5W+bwhzAYGL0yDU=;
	h=From:To:Cc:Subject:Date:From;
	b=CL0ULl8moTGSft8FQTA9bKxlXd1By8noYG/QWYXXDK1nMhBfiiXtx0+dhHgwUJMMx
	 Rcb78RvYPVTRDJDT2Q1+0rsTWhEnoPJ3Lzgcrt+brvomSMvkT2DakJICFoa7OGWo/d
	 ++ylDadBhxZrA3TIg8AOvTy13gWsSU+QWzNNdXN3qyANr8sFOi3mqBvLCDnboyuRm6
	 3DtnP3pmDqjKVYXWUB/iQd4/eb1YtbW5RUdSxrcKkJa6j/w8/s1kAg/VYLRfq0+UCX
	 wlE9/n6LA8vncw9gnfDgeo2mf97KJLMX3TgAXUQO+o1WlO3UbfLoxa8EI/6NZFSDp+
	 WRBYybElooHCQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct minimum VBLANK value" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:43 -0500
Message-ID: <20260301012043.1676380-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53905-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D323E1CA472
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1438248c5a82c86b4e1f0311c3bb827af747a8cf Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:27 +0530
Subject: [PATCH] media: i2c: ov5647: Correct minimum VBLANK value

Trial and error reveals that the minimum vblank value appears to be 24
(the OV5647 data sheet does not give any clues). This fixes streaming
lock-ups in full resolution mode.

Fixes: 2512c06441e3 ("media: ov5647: Support V4L2_CID_VBLANK control")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index d9e300406f58e..191954497e3db 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,7 +73,7 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-#define OV5647_VBLANK_MIN		4
+#define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
 #define OV5647_EXPOSURE_MIN		4
-- 
2.51.0





