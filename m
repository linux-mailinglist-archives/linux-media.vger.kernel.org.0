Return-Path: <linux-media+bounces-65843-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7r2VLH4YQmp/0AkAu9opvQ
	(envelope-from <linux-media+bounces-65843-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:02:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A26D6AE9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:02:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="e/TjBkNG";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65843-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65843-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFB50301A102
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 06:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEBD3B42C7;
	Mon, 29 Jun 2026 06:57:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365D3C1F24
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716239; cv=none; b=lgw+thY6HHmBi8xD3mJibKj9Sfrtrxa/9gViauouaw/AghxbP3Dwc6XBCegg+KD1+9mVAAzK9WLZ5VkTiPAW/vyuJmIT1DUbCE0olyORqAV83JOcQR9m5uArSse8yy+0M8tiMW5JXn/FxRfTQ4zGQ6VDQsgow+IR6LlG4T3cOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716239; c=relaxed/simple;
	bh=XYvPbPia3sJeNhMXOOXdRbCsODOVjcUVz9//LHsFWc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OB/AHNpdVtzoDGhEaYddaWTwz/ZBQlo560tOwxSx02r9IJOUnlAGFFQBOZldUbfC1uLcKYP0PhiPZBRsrwAqmIR7yo32kZE4epZGYJfZpkt4MaR+rByVw5ZvKXYJtN0yNlxAT7AxHxgU7Bejeru156tnPL86z4D826we3dYUsuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/TjBkNG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1901F000E9;
	Mon, 29 Jun 2026 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716238;
	bh=dIqsLu2cjEear8wotsOAyX3ffKZ2S4fxOevspMEb0rQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/TjBkNGJ+QfRBzyoq6mU2nUIS+ju+w8AJJCdb9qUNnQ+C6kAeA4snY0ang4aO+XP
	 XeUCifhnMJXIcjXfmf1nzCQ4bapJRkY0auApHqNQdYwFFlE6xu/wyWNEzvEzc77YmV
	 G1V6VgKoCMAXwj+PihXZmf+4BqyAI/QG7tlaqOZDpqYv1JgC9xJL5JLU/FK4twyFRj
	 c5rnLw8NZtcJ6FzqZ4kzVMlXKNJg8G8vV6Uzpf58sZrvyaeVSVnU9OzG7PUcQ8DLWe
	 J2MCiX6Ijhh1d4XK6zIdN03fTT/gwWLXHqUfVQL64EiUugyMatwUvEtwV3e76Op2q1
	 PybmD+m0/xVcQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 2/6] media: em28xx: use v4l2_device release callback
Date: Mon, 29 Jun 2026 08:55:50 +0200
Message-ID: <d6112407f05a79acbd6a00a45a209233c487793e.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65843-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 510A26D6AE9

The em28xx driver creates a lot of video devices, but life-time management
is really bad. Instead use the struct v4l2_device release() callback to
have a single place where memory can be freed once the last user has gone.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 66 +++++++++++++++----------
 drivers/media/usb/em28xx/em28xx.h       |  1 -
 2 files changed, 41 insertions(+), 26 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index da0422c65e5f..42f5e7547cc4 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2275,18 +2275,27 @@ static int radio_s_tuner(struct file *file, void *priv,
 }
 
 /*
- * em28xx_free_v4l2() - Free struct em28xx_v4l2
+ * em28xx_free_v4l2() - v4l2_device release callback
  *
- * @ref: struct kref for struct em28xx_v4l2
+ * @v4l2_dev: pointer to struct v4l2_device embedded in struct em28xx_v4l2
  *
- * Called when all users of struct em28xx_v4l2 are gone
+ * Called by the v4l2 core when the last reference to the v4l2_device is
+ * released. At this point no userspace file handle nor video_device node
+ * keeps the v4l2 instance alive anymore, so it is safe to release all
+ * v4l2-related resources and drop the em28xx device reference taken when
+ * the v4l2 extension was initialized.
  */
-static void em28xx_free_v4l2(struct kref *ref)
+static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 {
-	struct em28xx_v4l2 *v4l2 = container_of(ref, struct em28xx_v4l2, ref);
+	struct em28xx_v4l2 *v4l2 =
+		container_of(v4l2_dev, struct em28xx_v4l2, v4l2_dev);
+	struct em28xx *dev = v4l2->dev;
 
-	v4l2->dev->v4l2 = NULL;
+	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
+	v4l2_device_unregister(v4l2_dev);
+	dev->v4l2 = NULL;
 	kfree(v4l2);
+	kref_put(&dev->ref, em28xx_free_device);
 }
 
 /*
@@ -2354,8 +2363,6 @@ static int em28xx_v4l2_open(struct file *filp)
 		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
 	}
 
-	kref_get(&dev->ref);
-	kref_get(&v4l2->ref);
 	v4l2->users++;
 
 	mutex_unlock(&dev->lock);
@@ -2411,14 +2418,14 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		video_unregister_device(&v4l2->vdev);
 	}
 
-	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
-
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
-
 	mutex_unlock(&dev->lock);
 
-	kref_put(&dev->ref, em28xx_free_device);
+	/*
+	 * Drop the initial reference taken at v4l2_device_register() time.
+	 * The em28xx_free_v4l2() release callback will be invoked once all
+	 * userspace file handles to the video device nodes are closed.
+	 */
+	v4l2_device_put(&v4l2->v4l2_dev);
 
 	return 0;
 }
@@ -2490,9 +2497,7 @@ static int em28xx_v4l2_close(struct file *filp)
 
 exit:
 	v4l2->users--;
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
 	mutex_unlock(&dev->lock);
-	kref_put(&dev->ref, em28xx_free_device);
 
 	return 0;
 }
@@ -2711,7 +2716,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		mutex_unlock(&dev->lock);
 		return -ENOMEM;
 	}
-	kref_init(&v4l2->ref);
 	v4l2->dev = dev;
 	dev->v4l2 = v4l2;
 
@@ -2722,9 +2726,21 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (ret < 0) {
 		dev_err(&dev->intf->dev,
 			"Call to v4l2_device_register() failed!\n");
-		goto err;
+		dev->v4l2 = NULL;
+		kfree(v4l2);
+		mutex_unlock(&dev->lock);
+		return ret;
 	}
 
+	/*
+	 * From this point on, em28xx_free_v4l2() will be used to release
+	 * v4l2-related resources when the v4l2_device refcount reaches
+	 * zero. Take a reference to the em28xx device so that it cannot
+	 * be freed before the v4l2 instance is released.
+	 */
+	v4l2->v4l2_dev.release = em28xx_free_v4l2;
+	kref_get(&dev->ref);
+
 	hdl = &v4l2->ctrl_handler;
 	v4l2_ctrl_handler_init(hdl, 9);
 	v4l2->v4l2_dev.ctrl_handler = hdl;
@@ -3048,8 +3064,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	dev_info(&dev->intf->dev,
 		 "V4L2 extension successfully initialized\n");
 
-	kref_get(&dev->ref);
-
 	mutex_unlock(&dev->lock);
 	return 0;
 
@@ -3073,12 +3087,14 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		video_unregister_device(&v4l2->vdev);
 	}
 
-	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(&v4l2->v4l2_dev);
-err:
-	dev->v4l2 = NULL;
-	kref_put(&v4l2->ref, em28xx_free_v4l2);
 	mutex_unlock(&dev->lock);
+
+	/*
+	 * Drop the initial reference. em28xx_free_v4l2() will be called
+	 * once the last video_device node release has decremented the
+	 * v4l2_device refcount to zero.
+	 */
+	v4l2_device_put(&v4l2->v4l2_dev);
 	return ret;
 }
 
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 21c912403efc..90b83e4598ac 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -557,7 +557,6 @@ struct em28xx_eeprom {
 #define EM28XX_RESOURCE_VBI   0x02
 
 struct em28xx_v4l2 {
-	struct kref ref;
 	struct em28xx *dev;
 
 	struct v4l2_device v4l2_dev;
-- 
2.53.0


