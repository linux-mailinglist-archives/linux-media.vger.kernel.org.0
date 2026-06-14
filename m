Return-Path: <linux-media+bounces-64861-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mQwfCp4PL2qI7gQAu9opvQ
	(envelope-from <linux-media+bounces-64861-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 745746822E5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J6uR3FfZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64861-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64861-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA64300D967
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6A331E856;
	Sun, 14 Jun 2026 20:30:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7F2F532F
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469029; cv=none; b=jq6Rm+BWItoeiScznGvpguXTJ93LUizVH6JqgZyYEqWsTEKiPrpb3Wsspsgva+roMgGezzJaytNEuq80GIJPgEgvGyPTroW+9GVM6LIv9canrSBYKNJ/IYigpFX07miyU9NmJvEhuQsgfEyLSTT2WGW6GbPZGOs6xhLT5nEtVeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469029; c=relaxed/simple;
	bh=599zfZJAbkNxw78NPn5+kftBT5//9rsCPa8h0I//JL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdfxmD+1O2wiiQo/xuGIU200s+pjo4nCJ+XOW7EdzFpn4JHoeb//IeMHwAgkmoModykCFvaKJAXvIWGYkiX2NAazC+KT7kkkW4gVKqSAZR9y3q+bd6ec0pxNRP1XOXC+fkP3T6HBijLWmRSGfYyqS+Ij9Y/+z5q3nw1bQX3t5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6uR3FfZ; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2153062a91.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469027; x=1782073827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc350Z+XHNdEgykOHsnv64mPEa8jP1PjaQAzRbsUDG0=;
        b=J6uR3FfZQ9R/kZEuNLbYDLeYKjN33oo8klDvuWQVNZ1RD+K0dS0+U4RcMTkzJepBOe
         D9RNEZ3KZsnSkQaMUKjsIaZxfG0p9TyUp4NufDL49B4inIDyIgAcDuvyaIeOmKCBY5kk
         b4IQSe2s3Kv438dsI+sbdmC/AcVeVgdSUGf0HadBS+HhS2+LM9Q2CA46USveC/Mm8l4m
         IWntWD9xCSYgJWnYGxGwYF9qSuM8W1D8zifSdrOPNZ96vheFQMF+mn7C4XlRev+fQv0Q
         29rJU267ts8LRuNJH9BmhD2pL5VxM4nWKzZWOdQ+RwqwEgE4vZpxRws3BdsXQ8/XBWxg
         oM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469027; x=1782073827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zc350Z+XHNdEgykOHsnv64mPEa8jP1PjaQAzRbsUDG0=;
        b=ZP1beFXcMygaZpS7qRZmQZsISAh/D4PONjbSobhgcG9eYyoMJS9RUH9Q73ce+xxniJ
         ZgrYT45+LcoRx+qDWIkkyLPxosaIT3TTmx3PjC5WotrKd3ouiPSHtLbxKNt82dbBVifR
         f8y8hWu73v9cM3UGb2wR5w9kRsxf87qrUdXyplso1LMGq6f0ATFZo7k7BaHJnKTG8HbR
         T0XGfgS511dfOSTuBGE9tj2J3y0Mla8jUGcJFVHYQ5XE/zMwx9wXZIE2ibGlYgrF+VVX
         DRVjVDA2H5zVsY8dFl94TsEMLhDqdHL4J/Ln7A7wKgnIndZzVeEZwke8LzNGKkybznLl
         pE8Q==
X-Gm-Message-State: AOJu0YwJiiUeF4y2m8Y1ft4UOxpcuTq01JRILYjFU7Vl4QSm/vsRvB2d
	EacIm5BLLJIEFelPNXFBZnaEHEzAr8XDBbGAYkQ0pFOyrrEZ1vJSduyLyTEApG/c
X-Gm-Gg: Acq92OHQ7IgIEX8amvb2IEStIbIO0/yMi4kQ7BH3rfeY4pKPmije8nDImbEryqGttfv
	pGSJfxfAO6mgp951/hLoSBWFA97ooguOTAV5psdtBpMKK5DvtuO7HXJnp2HTuMyjL1a0RZJKfBa
	MaFoFKlABSqNhHUs1G4UKIOaYMLNtJoW4eTha81cs8mYymN5UtoM5mKFIY2ufpt018hUvV/Bo3h
	Z808KeqeZjdoDHON3taNvGEXtmj0pSe+nGkJi43EOySuid3TDjytEL61jcElfYObIL/e9eWqZdA
	Al9r5t3c/CzRNR7kRdMEipLCiT+Gcxt+0s/p/xk2NYPIsCr/YWgcLy6A83GEIni0DpjtY0pQlZT
	n80oiruqr2v13lo2XHfatScSWkDC4kRNruOYAviq/h5ZUJtdPgkQYMxrZShMwusyse7/SIOuGHH
	3zR10tDhg6BW+iTs9CgtHG7h6i9hwKUyiLYft21kNw5sMyp7kwoGUL
X-Received: by 2002:a17:90b:50cb:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-37c2bd52987mr7558963a91.21.1781469027467;
        Sun, 14 Jun 2026 13:30:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.30.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:30:27 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 18/22] media: usb: cx231xx: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:18 +0530
Message-ID: <20260614202835.11977-19-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64861-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 745746822E5

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 2cd4e333bc4b..2b1ad969e58c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1006,8 +1006,10 @@ void cx231xx_v4l2_create_entities(struct cx231xx *dev)
 			pr_err("failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			pr_err("failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 #endif
 }
@@ -1558,6 +1560,7 @@ void cx231xx_release_analog_resources(struct cx231xx *dev)
 			video_device_node_name(&dev->vbi_dev));
 		video_unregister_device(&dev->vbi_dev);
 	}
+	media_entity_cleanup(&dev->vbi_dev.entity);
 	if (video_is_registered(&dev->vdev)) {
 		dev_info(dev->dev, "V4L2 device %s deregistered\n",
 			video_device_node_name(&dev->vdev));
@@ -1567,6 +1570,7 @@ void cx231xx_release_analog_resources(struct cx231xx *dev)
 
 		video_unregister_device(&dev->vdev);
 	}
+	media_entity_cleanup(&dev->vdev.entity);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 	v4l2_ctrl_handler_free(&dev->radio_ctrl_handler);
 }
@@ -1839,6 +1843,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 		dev_err(dev->dev,
 			"unable to register video device (error=%i).\n",
 			ret);
+		media_entity_cleanup(&dev->vdev.entity);
 		return ret;
 	}
 
@@ -1895,6 +1900,7 @@ int cx231xx_register_analog_devices(struct cx231xx *dev)
 				    vbi_nr[dev->devno]);
 	if (ret < 0) {
 		dev_err(dev->dev, "unable to register vbi device\n");
+		media_entity_cleanup(&dev->vbi_dev.entity);
 		return ret;
 	}
 
-- 
2.50.1 (Apple Git-155)


