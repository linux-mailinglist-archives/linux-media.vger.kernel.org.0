Return-Path: <linux-media+bounces-53964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNYMDLGao2kwIAUAu9opvQ
	(envelope-from <linux-media+bounces-53964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BB1CBBAD
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5E66305EE5C
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7505D2D948A;
	Sun,  1 Mar 2026 01:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uckhP7tB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25626ED35;
	Sun,  1 Mar 2026 01:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329294; cv=none; b=Opk91VZNfxwqueQ9K1zh9LKvG22OgOLZ721E+NdPZxFByqicINKcvRZU3vn1x7cW4oSFJLksHr0Gy2403aNKMQtMphVMkHcvPr00rcaNkdjIAwujCCQYCPMy4ddE2cGA6p2NS6kgfSlCNu9YYkF8XRxklF/bDlYNkCh495i0XNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329294; c=relaxed/simple;
	bh=kx9VKQf65mEICE/6rvKPcDAG1Bw9NNvOSmXijTKZ/70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUPUYOOdu3c+s1yb8lzotZ1dlUNtS7ElMPx0H7x5Ldrd6zK4mPY0CR5P8293VO6OpkKOq2wTgUeYGG4wxlObIL20qCtltpmnqVndCw4Z/3CE50d8N/S7oYzz4mTouxoQ21XAL32UYQC4Ye7Sd6B7LDbjcx9Vv8GZWmDbKL70Du0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uckhP7tB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F325C19421;
	Sun,  1 Mar 2026 01:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329294;
	bh=kx9VKQf65mEICE/6rvKPcDAG1Bw9NNvOSmXijTKZ/70=;
	h=From:To:Cc:Subject:Date:From;
	b=uckhP7tByWPdPnelaZBB0ydwlmEUNSMB6JXRff/n2FAn+5wEgZ66QW5rfRYutAOgm
	 aBWbIyobPPvoc6sjmCBSsVddvNgckhiEHzH33Gl1WVgeZkXvfnIm/ZUWrpZoUYLY7p
	 7hBGE5rtREsIhk9nnOYj3TUpEJm+nXAYcjo/Db1I9Pto3rcu3WKJ+YqGaDEyC62+N4
	 yZEAOpvvrCU6lkf46+EUXBng+/0qhWDfXDv5z2KGcINjyK/y4HyIolxahDL1PjbuOB
	 ZsbZifmA6agYCebGZEFlMnD3hXYZMXrUsecBAgumN+xBPw6SZ6DqDR9Stf4w9w+Xz9
	 77IO8DLU4Suzg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jai.luthra@ideasonboard.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:32 -0500
Message-ID: <20260301014133.1703196-1-sashal@kernel.org>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53964-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,raspberrypi.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: DD6BB1CBBAD
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c063632b494b02e891442d10f17e37b7fcfab9b3 Mon Sep 17 00:00:00 2001
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:29 +0530
Subject: [PATCH] media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode

The pixel rate for VGA (640x480) mode is configured in the mode's table
to be 58.333 MPix/s instead of 55 MPix/s, so fix it.

Fixes: 911f4516ee2b ("media: ov5647: Support V4L2_CID_PIXEL_RATE")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/CAPY8ntA2TCf9FuB6Nk%2BOn%2By6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com/
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c0f1121b025e5..bf5b0bd8d6acb 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -582,7 +582,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 2560,
 			.height		= 1920,
 		},
-		.pixel_rate	= 55000000,
+		.pixel_rate	= 58333000,
 		.hts		= 1852,
 		.vts		= 0x1f8,
 		.reg_list	= ov5647_640x480_10bpp,
-- 
2.51.0





