Return-Path: <linux-media+bounces-53979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDJTFRWdo2nFIQUAu9opvQ
	(envelope-from <linux-media+bounces-53979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:57:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CD1CC629
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90A19306A822
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D5B31A575;
	Sun,  1 Mar 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNSvczQN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6B430BA3;
	Sun,  1 Mar 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329787; cv=none; b=Anasq5oE1CzkwgAWhMRb2wEpLV3zNWCSpHfxZDEKC5HSQ9dOQq/a76QPlavQIQtm3L0eH/RmfBU69XfU9DCoZHT5g+/AVzZIuh/JHP94SnEH4War0DBo/0OG4tI2cKKGZU65Wig4zQdTbURlgfrtZw3CjiXt5ucF9G6+rk1wrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329787; c=relaxed/simple;
	bh=F9SiNzGwIJZQdGWyWeuvwgSCxx24WXSz260Mfb70vb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cm3Pyc2ELkRRDahtybdqlQTF1nKZC3XDU58ylQH1hb7hLu0FhzEBp3hBB8TBxYHpYZo3gVTThRWb2Kr/k/GPMO83jXgFh9IjxX+zOH1yKVWJI0C2N/bQeFwVKfcDX/FRW9NJnfel6H2j4x+ZP5XlZ6W6b8kCezGbuz7KKt4KF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNSvczQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A152C19421;
	Sun,  1 Mar 2026 01:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329787;
	bh=F9SiNzGwIJZQdGWyWeuvwgSCxx24WXSz260Mfb70vb8=;
	h=From:To:Cc:Subject:Date:From;
	b=mNSvczQNkY7WfBURGuVPs3fO79p+AV+4H0F9oNpZJf2rfn6obm0gfk/7BDVItoSCV
	 QOVKnBF8U7d7PoxPB3jLYno0JvQYpXqSYPFP2d8gtijGZi/yOuIJ2//SHy88T7MGsq
	 8xzgZ3bOVy6P9Vb8+NOqJbAMosG0nHp9OKkkCkVRxMXC3Sqmthpfdsk7BMq54EF9i4
	 +roI4mxzA+sa0J1gSVdRByJFD26LJ3JQuKPXblbVQNHFiyuems/At8sPuyd/hPpXVZ
	 Kh5NKeLfr7tkzha957hNNki9s2AJBSCMdFb8hytbRI2oWNb+Pr28k7xcIQrtEZlGXH
	 FA4xOtqolxSYg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct pixel array offset" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:44 -0500
Message-ID: <20260301014945.1714567-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53979-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,intel.com:email,raspberrypi.com:email]
X-Rspamd-Queue-Id: D11CD1CC629
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a4e62e597f21bb37db0ad13aca486094e9188167 Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:26 +0530
Subject: [PATCH] media: i2c: ov5647: Correct pixel array offset

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
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
index f9fac858dc7ba..d9e300406f58e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-- 
2.51.0





