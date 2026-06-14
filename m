Return-Path: <linux-media+bounces-64823-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kauMEfTdLmpG5QQAu9opvQ
	(envelope-from <linux-media+bounces-64823-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:59:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA77681A05
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ChhfB9aG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64823-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64823-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20F99301FB07
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8153C4567;
	Sun, 14 Jun 2026 16:58:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569BF2EEE88
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456284; cv=none; b=ASHbvIL1fmPARg4DcXYm/lO+d9DU+6QRP5Ljw67wyK6ZW7EKh8CzE0pAXRccvN7K9y2xeIajEi6I3kaI7dmhpE5WLerPcq+/Jg+VQoWyuVVA42vud+HOKRboHeFRSkg64qvGyYdW2SL+3ouOs8vn1CH24VETksIBrtIVXlgVxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456284; c=relaxed/simple;
	bh=vHiobahySdZAKWgpMQSFbN+MfD9fEqNMaDttSm7gZy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnjEWucv8Qo5ACNdjv/7crSB2Hklw0e0r7w6zBAwCuulXoK0d32RjztgGnIYt+bLvYAn60OEhtHWG3Un5D5erA8wCXq0GsMziXaJk6+FOMtYZzJMikdyGng5BzZhJ9t5tpkg7RM9f1PhFXpTfzF6777V+u4calx/DXcDnmD6VSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChhfB9aG; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c68190ade4so2431845ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456283; x=1782061083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlYZ8ARYCInYVGoYYyh2DszhX2UmROVygqNSfHG9s2I=;
        b=ChhfB9aG0nBuOpRE+cAcpigkZxrTq1SeVZiAxupJXqjA1lYiRE8QdUXxLO1lqPviV3
         eWLJfwzdkNVFXoBlabfTWr98QXwDOpf/RzuFy9/rYa7w5Ng/lVZHGKh+RMxLbJh6Dm3a
         QXoTvNOi2Zt4G8V400lAwzt1yNpLHAM0I+dj7hyLvgL+MIy49zYdaJECcOv4Xg10YLv/
         UgD5aqsdg3jHUc1OZrOGdIm4yjxesGTxQ+R5moVsW/YxllfNUrIFeMpdiIe19q37/mkL
         lgbDq6HlGhcH8WHnXQJfbIpI3Ic6fCHfzUqN2KCJ9e0nEDrkyLH2Wmc/+lv6KbQReA/r
         o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456283; x=1782061083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PlYZ8ARYCInYVGoYYyh2DszhX2UmROVygqNSfHG9s2I=;
        b=Ksr2NOGJxJ+whY6a8k2c9K0fg09hrsvp8nUySDaEinyEkuomlAACWOiyCvpQSHpj17
         3Huo01pQRo4/SeGAb1QmsreGBOnxLks5k++VAoo4jh1CwAylq9N/tkh+bWgEjWnG7Ck6
         VysrqHeaTUAFFUoerKaiKrY0gj6YtZ2vGoLmNmE0fgMdE/GifI+DGMgkuN3SR+yeT562
         JKZcwmkAnuXBDj21YNrav9+YcIP3N7nGsclpVaMObcT3kJ65hF06YL3bp4dHRd631iI8
         FN65qvdF+5YeShUVT77leKklhJ/kBM+PVmXI3bWYPNE1JfjlNs4UQdnfI06pVwNRFY3b
         +Chg==
X-Gm-Message-State: AOJu0Yx5bhY3hzuAtKo9uqXNiPKL9bsxMizdGiikVumhx40PLxnDUmwS
	Dv+8klMSG3Q2E5jDFOQMdpq6QJyXeeaYCln0GnN7dzDpyFWi3SBS2bwPO7wXkGHG
X-Gm-Gg: Acq92OHK0DD9Z4vgzRkbWoeQK1iIF6ApFSzrB7nEP5z9ZevU5BeAYetpfzkJTcIRSvH
	7ujfkyEPafWhk6XckGDtqIUjdEnH8FT/xgo/Cxs+zXAN4qqR5KOa/SKwY5iKesXhBwGCtqmwwZZ
	mEd3gfDPvFPDmq0q97kilrId/G1IZjhutX7uoo120yQ1rmXWXEh80MlOU1aQvYqsE7gvzaxenYg
	NWUsbqPZA7mJxbR91K8/xAR0IxLpWYI2Cim6ed05eWhNIvp8sqY6RczGMP1rnifDk4zytJeby4V
	6KaWZHAummSDL6OV8iGLHyMaQCE6cDKYr0vLOxVjXeWbpqyJ9r5VD4KtKoeefen97oSSTMveGCz
	bETw+NsT7QKSMr706GjGJgqXnqreh4P73MMjA3BJmtal2yQ/jgKOCJIVtbBpIzmNzxCkQWBeORx
	RmqFEjm3Ee1DTh8ytEvI6UVMxHVQzNePGJ0aMrQK+pLgFDnv+6ykQp
X-Received: by 2002:a17:903:2290:b0:2c1:88a1:9839 with SMTP id d9443c01a7336-2c3fb4ec546mr94846745ad.11.1781456282877;
        Sun, 14 Jun 2026 09:58:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/22] media: pci: saa7134: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:54 +0530
Message-ID: <20260614165630.3896-18-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64823-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:kees@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADA77681A05

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/pci/saa7134/saa7134-core.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 2f5b258d682b..c0e1e8ad55c8 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -798,8 +798,10 @@ static void saa7134_media_release(struct saa7134_dev *dev)
 #ifdef CONFIG_MEDIA_CONTROLLER
 	int i;
 
-	for (i = 0; i < SAA7134_INPUT_MAX + 1; i++)
+	for (i = 0; i < SAA7134_INPUT_MAX + 1; i++) {
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
+	}
 #endif
 }
 
@@ -836,8 +838,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize demod pad!\n");
 
 		ret = media_device_register_entity(dev->media_dev, &dev->demod);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register demod entity!\n");
+			media_entity_cleanup(&dev->demod);
+		}
 
 		dev->decoder = &dev->demod;
 	} else {
@@ -904,8 +908,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 
 	/* Create input for Radio RF connector */
@@ -923,8 +929,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 }
 #endif
@@ -956,6 +964,7 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 			vb2_video_unregister_device(dev->video_dev);
 		else
 			video_device_release(dev->video_dev);
+		media_entity_cleanup(&dev->video_dev->entity);
 		dev->video_dev = NULL;
 	}
 	if (dev->vbi_dev) {
@@ -963,6 +972,7 @@ static void saa7134_unregister_video(struct saa7134_dev *dev)
 			vb2_video_unregister_device(dev->vbi_dev);
 		else
 			video_device_release(dev->vbi_dev);
+		media_entity_cleanup(&dev->vbi_dev->entity);
 		dev->vbi_dev = NULL;
 	}
 	if (dev->radio_dev) {
-- 
2.50.1 (Apple Git-155)


