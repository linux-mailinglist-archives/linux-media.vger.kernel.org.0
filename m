Return-Path: <linux-media+bounces-53980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBiOIwuho2k3IQUAu9opvQ
	(envelope-from <linux-media+bounces-53980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:14:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A01CD501
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EA823043D2E
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376C631AAAF;
	Sun,  1 Mar 2026 01:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq35Fpxp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151C274B5F;
	Sun,  1 Mar 2026 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329789; cv=none; b=ciJYhAUoJ34f5SZmDynUHWP37Lkk3cJu1nwd1JiKmRaaBHyIZAJ5tZI+NEZBpvj07jumS5R5LAoOaeH1Y5Cd8ZxaBLuMcjBtCDgrovWz7WghHaX0K485k/7oK47k7zRVmwQtPuiSmLrecuclX4LANmLF6zUP7VkxfPDBLdWOURI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329789; c=relaxed/simple;
	bh=fxscJD+3FjwsrMYyFdobRFMwymbJEEK1Vrq8wxTTGzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7kTbRDQrBTL52ucSQhynSX8EnNLKXi5eEAV5QujbDxuvA2RUckJnvdeSodgPWkOrOz3n13ebl9TWqWyGqt4petg/8b7TVSuPSc2DKeMbqal8gJvXJTy51OPaZ1gcdsf2Rxv1m1ukI8PUNtOL7oowxUBPdgZO4V3GMtm5xTFhuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq35Fpxp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D789FC19421;
	Sun,  1 Mar 2026 01:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329789;
	bh=fxscJD+3FjwsrMYyFdobRFMwymbJEEK1Vrq8wxTTGzc=;
	h=From:To:Cc:Subject:Date:From;
	b=Cq35FpxpVi1Q4Exm9Xxsbok72Ik6WujPKBwvNH0zN4GxyKwCwKyz8pd+ZBDJqg2t1
	 reoU6JnjBK5M+Lh9hXUGIXUzco1ao4QbgvZzKivJ+T2/eozrYrs+CPhbQUNoTA8uAo
	 a0o/Agrv4QvCOW5VmEl1N4Q4JGcJj1JA3sTm7/LctoCTOl+vpBFZWsG00u79MC/cvC
	 pfC0X+zyD0OzknGIzphSMY2AkbNCtK5vvMiJP7Du7SvLlhcr8lmMhsApwxjoGtxtIg
	 lpIIyVWv9+5j3jlitl4DUOh2cw/ZhankAkoABG0JeLHr4nyWO+Nl2T421WCpcz3I8a
	 X6Whd95Gb/bRg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jai.luthra@ideasonboard.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Initialize subdev before controls" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:47 -0500
Message-ID: <20260301014947.1714838-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53980-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2D9A01CD501
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From eee13cbccacb6d0a3120c126b8544030905b069d Mon Sep 17 00:00:00 2001
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:25 +0530
Subject: [PATCH] media: i2c: ov5647: Initialize subdev before controls

In ov5647_init_controls() we call v4l2_get_subdevdata, but it is
initialized by v4l2_i2c_subdev_init() in the probe, which currently
happens after init_controls(). This can result in a segfault if the
error condition is hit, and we try to access i2c_client, so fix the
order.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e193fef4fcedf..f9fac858dc7ba 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1420,15 +1420,15 @@ static int ov5647_probe(struct i2c_client *client)
 
 	sensor->mode = OV5647_DEFAULT_MODE;
 
-	ret = ov5647_init_controls(sensor);
-	if (ret)
-		goto mutex_destroy;
-
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
 	sd->internal_ops = &ov5647_subdev_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 
+	ret = ov5647_init_controls(sensor);
+	if (ret)
+		goto mutex_destroy;
+
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
-- 
2.51.0





