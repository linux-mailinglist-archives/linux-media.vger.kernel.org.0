Return-Path: <linux-media+bounces-62129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOA2AxJTDGqmfAUAu9opvQ
	(envelope-from <linux-media+bounces-62129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:09:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841C57E5CA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1A89305A6BD
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9BE4B8DCC;
	Tue, 19 May 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6rlGuQT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B423F1AC9
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191983; cv=none; b=FluseBha01PEFUl3NCR1dVLbBiCjuv9+znkYH92EiPdxFuyp9vrrhZWRsr1ukcWeCItwpO8QsYGepJodZCtceuIVK7lW5IJrvxJm7b5Mfo2gawybXTSpHNlhz0o+JHrzqtL8QMhaTuG6ONIWkqNrdn7BsQ3KLWHGvldXp9GOHXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191983; c=relaxed/simple;
	bh=XYvPbPia3sJeNhMXOOXdRbCsODOVjcUVz9//LHsFWc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwd5pBExSlhCunM88xka1aM2A4TzOwKjpHuxYjSPgdCuA7sRCSDdMj5L1Agoo5nWqHYIHdTIvj4ed+MM4krD1d2GuQPVlancHP4vKwHls94IyjlqcwMHQ4sjvFD4hPUi6wzKeg2FQB1XYXKZuVXulIoV0UtpDYbEebjIJIuFSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6rlGuQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACD6C2BCB8;
	Tue, 19 May 2026 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191983;
	bh=XYvPbPia3sJeNhMXOOXdRbCsODOVjcUVz9//LHsFWc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6rlGuQTQW05IwK5frlcTtPU3tluPNOocjkJqSI6VJqJgNCvLssp3jSOj5w/tnnNa
	 szWe2fSe9Pf0LZXVCNJupPatr5llJAiG1e3d8IsNO5kqeQ34WfsnBLZ3l+hfdoqnEW
	 XuTWZrikuUtfslcApqYgT0DRp7W3g/U9EtrR9ufY23TIJsydBQr3cyIZxiS/jL4EVp
	 wCEA80VqUB6JeBlo8b1eEaCbMoMyksCGYrb2mVRAz+gIsz5SeNmnqXXrFI1blHq0nm
	 HBl17CLDq8e5sBjPlVeCEV4cMv+GGZdFJS61T5xYIYJGW6/arFppQ3pCGEtRsLycPC
	 21P2833zJgZFw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 1/3] media: em28xx: use v4l2_device release callback
Date: Tue, 19 May 2026 13:54:41 +0200
Message-ID: <426cf3f75786e5074d722343fe503960d721c242.1779191683.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779191683.git.hverkuil+cisco@kernel.org>
References: <cover.1779191683.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62129-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0841C57E5CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


