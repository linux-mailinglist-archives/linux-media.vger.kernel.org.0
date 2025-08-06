Return-Path: <linux-media+bounces-38954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6959B1C1BB
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 10:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22CA618A5359
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802F72248A4;
	Wed,  6 Aug 2025 08:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="ayaHhjpq"
X-Original-To: linux-media@vger.kernel.org
Received: from forward202d.mail.yandex.net (forward202d.mail.yandex.net [178.154.239.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFB21FF5F
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467302; cv=none; b=ZWu9RmRk6vUZagvZ/+0B4Mco9qhuYavlIF4n2kKTRNaKM+/p/COWBGyf5/ENgUpb1zjjxp7ytPwQekxACJULCQt6JRF80S5QVC00Jgnyccg0ix4Ak24OOBS5fu+vgcWvjvQ/L+uvaDg5jDqhpFgJd6SiI2iSxwMmUgihrkzqqrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467302; c=relaxed/simple;
	bh=e+bGg1JRmUrFdchGIehFzos1qKOtZPNjlU+HHKRBKq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpSTed3ZSERw16KGdRbWitZ0uOrgtjFHH9Jv1z25jn8euBV7/9plcdKkjJn/iG7BTmfnV+Dfkin8e4M89yAs70DiliB46E4Lu3Q32is6Bkhdq3iBveDJjmYWQLdrMHvX84D0SSHXGNr0UypfOJkLxPqyf0njXo40JvHIzdTRQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ayaHhjpq; arc=none smtp.client-ip=178.154.239.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward202d.mail.yandex.net (Yandex) with ESMTPS id CFB26871C4
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 10:55:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1ba9:0:640:b084:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 64838C0002;
	Wed, 06 Aug 2025 10:55:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 5tb4x7DMHmI0-QtTZbFVi;
	Wed, 06 Aug 2025 10:55:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1754466908; bh=MKm3e9+o6g1gnM3tUdD6E4EVabeR8rUA0NxAvf2EFMg=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ayaHhjpqzZoDVpVvJ977HQVnEcM4FBU0a1fwUMHcqVz3/gEjGTiq1dRuMJ5D27rd9
	 We1R+za996FrpaaZr3BYHRy0jujqB3PfemhaMMr9I01nV6Sd3GGFA/Bq30YdLI7IIA
	 7fh8ddeHhCHxi7UiIO0jmebuBitYywlRHIwlcCn8=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Subject: [PATCH 2/2] media: xc2028: hold the device if firmware loading is in progress
Date: Wed,  6 Aug 2025 10:54:09 +0300
Message-ID: <20250806075409.210489-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806075409.210489-1-dmantipov@yandex.ru>
References: <20250806075409.210489-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If firmware loading is scheduled with 'request_firmware_nowait()',
wait for completion in 'xc2028_dvb_release()' to ensure that
'load_firmware_cb()' doesn't use the device which is actually freed.

Reported-by: syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=db4326df1b9af04f68fc
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/tuners/xc2028.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 807585d2dfde..b479a0f16754 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -117,6 +117,8 @@ struct xc2028_data {
 
 	struct firmware_properties cur_fw;
 
+	struct completion fwload;
+
 	struct mutex lock;
 };
 
@@ -1329,6 +1331,10 @@ static void xc2028_dvb_release(struct dvb_frontend *fe)
 
 	mutex_lock(&xc2028_list_mutex);
 
+	/* wait for request_firmware_nowait() if scheduled */
+	if (priv->state == XC2028_WAITING_FIRMWARE)
+		wait_for_completion(&priv->fwload);
+
 	/* only perform final cleanup if this is the last instance */
 	if (hybrid_tuner_report_instance_count(priv) == 1)
 		free_firmware(priv);
@@ -1362,22 +1368,22 @@ static void load_firmware_cb(const struct firmware *fw,
 {
 	struct dvb_frontend *fe = context;
 	struct xc2028_data *priv = fe->tuner_priv;
-	int rc;
+
+	WARN_ON(priv->state != XC2028_WAITING_FIRMWARE);
 
 	tuner_dbg("request_firmware_nowait(): %s\n", fw ? "OK" : "error");
 	if (!fw) {
 		tuner_err("Could not load firmware %s.\n", priv->fname);
 		priv->state = XC2028_NODEV;
-		return;
-	}
-
-	rc = load_all_firmwares(fe, fw);
+	} else {
+		int rc = load_all_firmwares(fe, fw);
 
-	release_firmware(fw);
+		release_firmware(fw);
+		if (rc == 0)
+			priv->state = XC2028_ACTIVE;
+	}
 
-	if (rc < 0)
-		return;
-	priv->state = XC2028_ACTIVE;
+	complete(&priv->fwload);
 }
 
 static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
@@ -1426,8 +1432,10 @@ static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
 			tuner_err("Failed to request firmware %s\n",
 				  priv->fname);
 			priv->state = XC2028_NODEV;
-		} else
+		} else {
+			init_completion(&priv->fwload);
 			priv->state = XC2028_WAITING_FIRMWARE;
+		}
 	}
 unlock:
 	mutex_unlock(&priv->lock);
-- 
2.50.1


