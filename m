Return-Path: <linux-media+bounces-39398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14661B20046
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 09:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37FA61898055
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB612D97A2;
	Mon, 11 Aug 2025 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="lt6L3kOb"
X-Original-To: linux-media@vger.kernel.org
Received: from forward200d.mail.yandex.net (forward200d.mail.yandex.net [178.154.239.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D08A2D94B6
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897368; cv=none; b=kh4fXqtVOZC7NT5OgpuDlYqgKh6kU/iyBrBg6cNJTwMPnUP41dNZlcZzABLW5tqGLpgSipO7pr42AYFyMKVD6i8UEVOCVXtxxbs4PbKrSa2vSbpsA6RSZRLrpzcqkoaPUTInWHUaiOrL/zCicwZvb/rBhT8tMoEwSlrMz71EhtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897368; c=relaxed/simple;
	bh=VKuS6K0y8x8UCJ/Q7BgdgW9uaVPOL4QHr47uvO7NUQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMd/qsmbRr48zv4RaxBtSrnShiRZT952g7DAbpUpEsyY5+9An24dP2b1z6b0JXOEKztfRe8h/2omRrWj+DqVWW7yvkkeJhj3vVUDkZ4IqbMpsSUR1mES5ut7R/M0aiCkAQoLIQj13k3H3YsUsJkvUfjGMvbTW9hoLSlVgRCjd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=lt6L3kOb; arc=none smtp.client-ip=178.154.239.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward200d.mail.yandex.net (Yandex) with ESMTPS id C011C83150
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:23:37 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:c54a:0:640:9224:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 2D003C00E0;
	Mon, 11 Aug 2025 10:23:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id RNDqVk8Mva60-tz0tWM7f;
	Mon, 11 Aug 2025 10:23:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1754897009; bh=Qrms8tBn+JF6dOwuq3ATuAWKwY3A7Td8Fv2jWySmaC0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=lt6L3kObGk1MYl+z8L3rPWDt9vqQkTLzqXQK0ZpL0Ue53jFQFMAnXq1zFuGFstesh
	 q0VctnZRQkuxb+tTiIwRfo/br9XFusHTPe2kwuV9FexJARW4niPWHAAq4k45yEeBdO
	 ZleOZsQ/WGG+3xGSJqU43xMzyQqf2GcmAbZN8w7o=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	syzbot+db4326df1b9af04f68fc@syzkaller.appspotmail.com
Subject: [PATCH v2 2/2] media: xc2028: hold the device if firmware loading is in progress
Date: Mon, 11 Aug 2025 10:23:26 +0300
Message-ID: <20250811072326.44569-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811072326.44569-1-dmantipov@yandex.ru>
References: <20250811072326.44569-1-dmantipov@yandex.ru>
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
v2: fix smatch warning in xc2028_dvb_release()
---
 drivers/media/tuners/xc2028.c | 37 ++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/media/tuners/xc2028.c b/drivers/media/tuners/xc2028.c
index 807585d2dfde..602e66e4ba03 100644
--- a/drivers/media/tuners/xc2028.c
+++ b/drivers/media/tuners/xc2028.c
@@ -117,6 +117,8 @@ struct xc2028_data {
 
 	struct firmware_properties cur_fw;
 
+	struct completion fwload;
+
 	struct mutex lock;
 };
 
@@ -1329,12 +1331,17 @@ static void xc2028_dvb_release(struct dvb_frontend *fe)
 
 	mutex_lock(&xc2028_list_mutex);
 
-	/* only perform final cleanup if this is the last instance */
-	if (hybrid_tuner_report_instance_count(priv) == 1)
-		free_firmware(priv);
+	if (priv) {
+		/* wait for request_firmware_nowait() if scheduled */
+		if (priv->state == XC2028_WAITING_FIRMWARE)
+			wait_for_completion(&priv->fwload);
+
+		/* only perform final cleanup if this is the last instance */
+		if (hybrid_tuner_report_instance_count(priv) == 1)
+			free_firmware(priv);
 
-	if (priv)
 		hybrid_tuner_release_state(priv);
+	}
 
 	mutex_unlock(&xc2028_list_mutex);
 
@@ -1362,22 +1369,22 @@ static void load_firmware_cb(const struct firmware *fw,
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
@@ -1426,8 +1433,10 @@ static int xc2028_set_config(struct dvb_frontend *fe, void *priv_cfg)
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


