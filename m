Return-Path: <linux-media+bounces-64824-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7hAHU/fLmoY5gQAu9opvQ
	(envelope-from <linux-media+bounces-64824-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:05:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E6681B26
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:05:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oKW19Syg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64824-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64824-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CCA8301A1E0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0B73C819E;
	Sun, 14 Jun 2026 16:58:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A6394792
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456295; cv=none; b=iiHaDk3mDBZ2oeZObsW0Ku9q2PMWakC5VdnecS2j22dbhbO+BskvRikRc9z1Dvpobv1MLbPQRbiZJNHEjcclUsS/PLSK9V5skBQHwDq4J7u7Snpciry5HcqXqZ6/kyGO7nf83NPPh4M75Dmr5rEou8XDkpgnabxI0cmPOA/2V44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456295; c=relaxed/simple;
	bh=599zfZJAbkNxw78NPn5+kftBT5//9rsCPa8h0I//JL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwWPWX9YcYnkm68AGtAgi1gcnOzYIA5FJiGbwqojSa28eEKODnDHo/ngdTkyzsk1zaC4MfUlWZX69LLo/pn4cqL6lrztpnl/t6lp9g9iqu7GxscxCvoAVA4pU0M7+q2N1trrkP6R1SYE1kxTpzpTkAxBd9zOdi5Vv8ICQ/LNFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oKW19Syg; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c379e8ffso16390685ad.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456293; x=1782061093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc350Z+XHNdEgykOHsnv64mPEa8jP1PjaQAzRbsUDG0=;
        b=oKW19SygHSpU724lB08rMYd0zSd01MJoRXO6myqIvrtuP/VhNltXUDQF6iFL5je7k0
         w5l2mAjmyog+kyjS7ybujVSrh91huCRpTlPdRdDmD7MkN3FkcbtdNwxsk40QM3TrJdRx
         upNM6TM63+BbSghKLttX1DGlArfj+ABYsHJ75xD7oV7+trJiAaIb9shRsTdRQUrevENZ
         jzsmixdgUbvl6X80z2tK8Axu7NOrkv43aXVmI+I/iIlM1py4N8ukoVkiAi04CR4dQK2U
         e5jmpcFcdM3dPUqZR7LvaBF9r3oqzfx2dal5wWUSqYxTsJcfd8jBeyG8QqWOc8S/Noth
         DYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456293; x=1782061093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zc350Z+XHNdEgykOHsnv64mPEa8jP1PjaQAzRbsUDG0=;
        b=m//aivrXjkW4xaI6MKFf3tvWZbeiB1V+SvIKW8mvPi9WOmt8ko77GpH8GVkuy6p2mf
         PYV+2wkEBxNjsto4sErF/HONUqKe1ulVRSsTwHAmrX1c6w4EmRplamzfzPFn5BaXcKtB
         Huag3dQ4nlChhQrR5ibE5bEWUawhD0jlaI3UZpdqUsGFeXgL8TpXXaPg3E+oO8qcvZnh
         TaWo7llp4B5fx8vHvKSQ2SemFJNSrWrcLPaRN+tFBY5nMhLZyJqzDjjofD8AP0jVtc7N
         8XbpT5AfKRQ6VvNtwfrfRE0+ad5WHaecZ1mwct+0caAlQGPiKpL/VOfJX7OnWPWzPZex
         9WzA==
X-Gm-Message-State: AOJu0YxKuEJAMqP4P9kSpeHbZJaFhBfG/ZMsGdgypf7yE4X1HOk3lGnr
	KixlTCgP59YM0CCEilI+LzD0WZALURnUzQonw+AbBhruENWyKq7xpuOfnU8KwCv6
X-Gm-Gg: Acq92OEupZ3or88sMmkJnGu2L0JNIlLa7iX+v2hBXDZncK6ukqUSxq/asRHAU0V2T6b
	4cyd2DqczLJ6S/QR1YWhI4EWNgve9ZiQImTCC5nj0K66HzQ9kGSOPgRuNTebRGyU9M44gKByzy0
	8JCtcXCjj11305v6VAhrbaYwzgqvbY9IdgKl2DiX/bH1tSHLvFgS/5M5tyJioBrn9euUAciG/4W
	SukdkEVZSwOySH67oByYy2YvepRaifGxokcNLGVmM/q8RB0dMzmuBeeN1gsSg9f+2SB70ljB6We
	yeu1ozV5jedlafeIss8RgJ0lEFXtRmG2Lenm7zdFgeL0yRVRZZvoYz1hTjywucxncwpsLSeV7u2
	3v4qzK6yvFc35R8fGViuSGaLf5SO4+bGGTrvD/qwA0oTjDSyudcFSMR0r2UDNeLAd0mLyMzxrK+
	5BPGfHh7GamFBBpDsvc/zyjQuqCK9sNqiT0z/vZ2SYuEDGD0mEQeQ9DH9c+UxsFUw=
X-Received: by 2002:a17:903:298c:b0:2bf:1486:e6bc with SMTP id d9443c01a7336-2c664209c86mr79258855ad.29.1781456293525;
        Sun, 14 Jun 2026 09:58:13 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:13 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/22] media: usb: cx231xx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:55 +0530
Message-ID: <20260614165630.3896-19-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64824-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E08E6681B26

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


