Return-Path: <linux-media+bounces-59162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMQkC3dN5mkgugEAu9opvQ
	(envelope-from <linux-media+bounces-59162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:59:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01D42ECC7
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECB6A321920F
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E383D9034;
	Mon, 20 Apr 2026 14:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oiKfTTc0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oiKfTTc0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1903AA500
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695372; cv=none; b=EifdZAkuGt7Wld8A/JhXK5p6xmnwzBz1arlfwkX3jpheC4/VqLtCyzWJhhNkfVgBuYW2xODv1hyX7kEwhY6RAFLvTj5dW9+ebzZ8lStqucyfAtcplDk1r1sCwffVnOaia9EIpNa3/VppTFq/CTpCV0IpEOpFlDZo4O1v3l3eg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695372; c=relaxed/simple;
	bh=nrIdXv1K6eTjewl9o0o0Gojv5qh+UkGgTm2RijB034M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kh5mJ02nvOlhZeqHWB4RfXj61dTBEXPsrKsEBoqFbdvW3RlW6ladapKY1yIdVwK6By/HsleoItYb7l2AxVWrFApMC0isaVt5EL+4ZayUuIwHLEzD1ayZm8lVgzAj69ENXkDXYH7P4XDYuWv/tgRnXZwXnpw52yj0ARW3cTcrddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oiKfTTc0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oiKfTTc0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 72E045BD2B;
	Mon, 20 Apr 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776695369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SIL+IR0ldH/P44oWoQHvkZDAd87SyKu7Irtb/rFuG3c=;
	b=oiKfTTc03spPxAykCgO9RPWT8MZNwGNMS5Gl1QML2QCvubriAYsz1FkDtJYTJ4kY19t1yA
	dz4JeBBwE+KFOKgfVxafEJM61sX2aDtvjZkBgQ7y4sv+0ad5RTsxGzbEVbZ0rfB+hsOUfs
	1gKuclcjtMUtaDGekK1mwVl3c+lY0xU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1776695369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SIL+IR0ldH/P44oWoQHvkZDAd87SyKu7Irtb/rFuG3c=;
	b=oiKfTTc03spPxAykCgO9RPWT8MZNwGNMS5Gl1QML2QCvubriAYsz1FkDtJYTJ4kY19t1yA
	dz4JeBBwE+KFOKgfVxafEJM61sX2aDtvjZkBgQ7y4sv+0ad5RTsxGzbEVbZ0rfB+hsOUfs
	1gKuclcjtMUtaDGekK1mwVl3c+lY0xU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACE4593AE;
	Mon, 20 Apr 2026 14:29:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lKEoEUk45mmVagAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 20 Apr 2026 14:29:29 +0000
From: Oliver Neukum <oneukum@suse.com>
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] drivers: media: remove V4L2_FL_USES_V4L2_FH
Date: Mon, 20 Apr 2026 16:29:17 +0200
Message-ID: <20260420142917.652245-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59162-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: BF01D42ECC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As usage of the feature is mandatory there is no point
in keeping the flag for it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 8 --------
 drivers/media/v4l2-core/v4l2-fh.c  | 1 -
 include/media/v4l2-dev.h           | 5 -----
 3 files changed, 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5db1461d2159 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -431,14 +431,6 @@ static int v4l2_open(struct inode *inode, struct file *filp)
 	}
 
 	ret = vdev->fops->open(filp);
-	if (ret)
-		goto done;
-
-	/* All drivers must use v4l2_fh. */
-	if (WARN_ON(!test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))) {
-		vdev->fops->release(filp);
-		ret = -ENODEV;
-	}
 
 done:
 	if (vdev->dev_debug & V4L2_DEV_DEBUG_FOP)
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..8741e623bd17 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -24,7 +24,6 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	/* Inherit from video_device. May be overridden by the driver. */
 	fh->ctrl_handler = vdev->ctrl_handler;
 	INIT_LIST_HEAD(&fh->list);
-	set_bit(V4L2_FL_USES_V4L2_FH, &fh->vdev->flags);
 	/*
 	 * determine_valid_ioctls() does not know if struct v4l2_fh
 	 * is used by this driver, but here we do. So enable the
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 2e0f6d2e6a78..7201f7787ce0 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -71,10 +71,6 @@ struct dentry;
  *	indicates that a &struct video_device is registered.
  *	Drivers can clear this flag if they want to block all future
  *	device access. It is cleared by video_unregister_device.
- * @V4L2_FL_USES_V4L2_FH:
- *	indicates that file->private_data points to &struct v4l2_fh.
- *	This flag is set by the core when v4l2_fh_init() is called.
- *	All drivers must use it.
  * @V4L2_FL_QUIRK_INVERTED_CROP:
  *	some old M2M drivers use g/s_crop/cropcap incorrectly: crop and
  *	compose are swapped. If this flag is set, then the selection
@@ -92,7 +88,6 @@ struct dentry;
  */
 enum v4l2_video_device_flags {
 	V4L2_FL_REGISTERED		= 0,
-	V4L2_FL_USES_V4L2_FH		= 1,
 	V4L2_FL_QUIRK_INVERTED_CROP	= 2,
 	V4L2_FL_SUBDEV_RO_DEVNODE	= 3,
 };
-- 
2.53.0


