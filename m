Return-Path: <linux-media+bounces-64825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 910gJ73dLmoY5QQAu9opvQ
	(envelope-from <linux-media+bounces-64825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C466819D9
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MIdRA6Oo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64825-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64825-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D5B43008276
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA7B3CAA2F;
	Sun, 14 Jun 2026 16:58:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D9A3C98B7
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456299; cv=none; b=AqBGPdJnBCElO752Jpo6GCLdLPxqojfvwM41QCfgyFVvTw0Itc1jDvB9fSHbkZycQCAu6Ezat5WJ5vDCiRd1ax4A5gIz13mI/wE9EG7JJ4tnz5fo1bf8Zc94eAxPF255TpOV8zcsP/W8fb7ngCC+qedO9e0kdu79lQum5xnFvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456299; c=relaxed/simple;
	bh=6BLfx3k/fCodQVzAj+Lom4ebu1O8ZhSi0TevNjpof2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ix1z5ScAVMU5yOIVtYjVgXytgB1QYovOgH7e+3IBa/169gcPD8yZkHiFmFnw3OzAGZVuw5pg51Ctvm2/XyQVkAKbzY2iRquX28tWOVY6RgD2ruzWZDXwb7+OTfcM1Uy0asyGUHZHMueYexuWOIYzvC9O837AvBXeDHw+AvK7kkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIdRA6Oo; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c168baac83so11275195ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456297; x=1782061097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEaZ0qrTzljcueJLN9W3Ve3AoI5SNdLgoSasxNY4Atc=;
        b=MIdRA6OoN5uJVftpYBF+elsfe+OtiU4R2RdT5jZ9r+LcrBpoe3RNBh+d0fndDK1Ha7
         GQYtWN1bIEkHa5lKDNjiYVephRVRDlGTbs06PcC9eOyVR3hXhnzv6tefBp67/z8kQQle
         LAsmWmKcSyPf58IyYhiLb5CF3ypeZ7Fo5FCh0b2XCka1iS8thIj6yfXVifyTKb8odmub
         5elhb/jxoFxCx+GYk+l+kmRXlarYuv9Ymetu8SAh1Mcud3KT3Rx1Ckfckk88xlUfKmoH
         Jbhnluz9N7A0tIyTaP7YDjJTPGGJrWxpP5YulO6NvZZD7bXQUMc870MCZy5uKQ+cgB8v
         2p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456297; x=1782061097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bEaZ0qrTzljcueJLN9W3Ve3AoI5SNdLgoSasxNY4Atc=;
        b=AT315MeVGIYQbhnxW1gNDFsZWiOfsuDashsYHouZy9enWZBkO8cBp4mClxtJURhykG
         AGW6iqFQwki6sx7lsMQ7HNKvtyS24VKdjeSn5bRH7zSbeqLjxQtmMutVTdlxXYKxGskE
         S3mO/ZV425CogcJQralTU3ZURaV9nMCfjcekBnd4tzQD9RgT4IPMfROtn5DKuhh87RUT
         eUssOQmGREnemqUah11AhE1GVuXjltg8k/aOX6hB27b6+6fJD3zOunh9FviGkIvTePcv
         I1mstUqOHxb26bK6bDhjYE+EKiYnBEnRbU904ve5uLEtkJy5OKvTaYLo6jy3YLPdIWVj
         uvAQ==
X-Gm-Message-State: AOJu0YxDRxCv6dK2nYNocdHU0Jg02iZI7zvcOP+EpESu7Cn+faEu5g/E
	6dibabGUga/POIJsvBqECdzHOSiIHU1exdxnFzUmhDlcmMFE4zlj6CwLl3wYoNYk
X-Gm-Gg: Acq92OFdOGqwVcyEnL4CX30Ns1tkx37yv0wXiKn98QdtRrgfeOZr+mlXh3ZmcVXjvhJ
	Y2fixB2C+ta8QuNvwu7QazVJMowpPgXGKOXjVwoNG1lBkxN0aodyItuiulacekf8kGXRUMNkMH+
	M0zv7o6D2z9e0UqSj4BGhVYHbGNXiXU7hhA3g3a3zUQs4HgoYQ0rEsqXnO6jMZ6YszZvr355VR7
	m1d02QGyx6j9GJ6J4xSbMr06vBH1R1YtlewD2CumNQNftpSZejqLMuHpx+sR28FKC7sgMMO4iZB
	yWbq6RFBkHY2tVNZrE9uZ414kCQdnzSDJWmWfvYlySoIwPE7OTfc2ac3+LPJkjBXQwpg2p9Nf3b
	Mb8zq2SGl/JuQjX3sUaCXwJEfPKoJJXApfblPzpYuIA4TW/uym2/B414Cc8pR4S/kfvraHTeG3c
	17metDluVJ/bohJC2CeFFs5wyP+LmRiGeuql2e4+LltaD45+W2D4TT
X-Received: by 2002:a17:902:d2ca:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c40ff3a3e9mr122864435ad.3.1781456297348;
        Sun, 14 Jun 2026 09:58:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:17 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/22] media: usb: em28xx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:56 +0530
Message-ID: <20260614165630.3896-20-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64825-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74C466819D9

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4a0ce9c5ee4b..70baf93aa8f8 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1006,6 +1006,7 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
 		if (!INPUT(i)->type)
 			return;
 		media_device_unregister_entity(&dev->input_ent[i]);
+		media_entity_cleanup(&dev->input_ent[i]);
 	}
 #endif
 }
@@ -1136,9 +1137,11 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 				"failed to initialize input pad[%d]!\n", i);
 
 		ret = media_device_register_entity(dev->media_dev, ent);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"failed to register input entity %d!\n", i);
+			media_entity_cleanup(ent);
+		}
 	}
 
 	if (dev->board.decoder == EM28XX_BUILTIN) {
@@ -1157,8 +1160,10 @@ static void em28xx_v4l2_create_entities(struct em28xx *dev)
 			dev_err(&dev->intf->dev, "failed to initialize decoder pads %d!\n", ret);
 
 		ret = media_device_register_entity(dev->media_dev, v4l2->decoder);
-		if (ret < 0)
+		if (ret < 0) {
 			dev_err(&dev->intf->dev, "failed to register decoder entity %d!\n", ret);
+			media_entity_cleanup(v4l2->decoder);
+		}
 	}
 
 #endif
@@ -2403,11 +2408,13 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 			 video_device_node_name(&v4l2->vbi_dev));
 		video_unregister_device(&v4l2->vbi_dev);
 	}
+	media_entity_cleanup(&v4l2->vbi_dev.entity);
 	if (video_is_registered(&v4l2->vdev)) {
 		dev_info(&dev->intf->dev, "V4L2 device %s deregistered\n",
 			 video_device_node_name(&v4l2->vdev));
 		video_unregister_device(&v4l2->vdev);
 	}
+	media_entity_cleanup(&v4l2->vdev.entity);
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
 	v4l2_device_unregister(&v4l2->v4l2_dev);
@@ -2961,6 +2968,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	if (ret) {
 		dev_err(&dev->intf->dev,
 			"unable to register video device (error=%i).\n", ret);
+		media_entity_cleanup(&v4l2->vdev.entity);
 		goto unregister_dev;
 	}
 
@@ -2995,6 +3003,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		if (ret < 0) {
 			dev_err(&dev->intf->dev,
 				"unable to register vbi device\n");
+			media_entity_cleanup(&v4l2->vbi_dev.entity);
 			goto unregister_dev;
 		}
 	}
-- 
2.50.1 (Apple Git-155)


