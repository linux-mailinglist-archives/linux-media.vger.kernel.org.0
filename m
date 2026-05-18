Return-Path: <linux-media+bounces-61999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FR6N0EVC2o5/wQAu9opvQ
	(envelope-from <linux-media+bounces-61999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:33:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615D56DB09
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 15:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97B8B30166FC
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C2481670;
	Mon, 18 May 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrMJcsS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340043FF1B4
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111063; cv=none; b=iQcmbu82IM4lJWDq9eER7KRVlq71xPjjUnsMQL2BeB8misxIR543vx8CJU/2CdRewmLXHsY+HhkAbOlFVLIrqoPTRvDvj27YA1TQImolwooolnnjLHFIoyGSfff30Sn54vZuA+chpbMl6aVXsRIC0ky9b5VqjEwlb6ULTjN0CJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111063; c=relaxed/simple;
	bh=fNDkdg1th08wSvBrCKMPVzuubzHvT54TjiWW/JRQei8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Cjnwx/7qeBFMi2HzJFz5fHJRQki9nRB4AMQSwqGtnSlXm373S6m0ZMGosgQsgcHPuxPRGiir7LZOHF0azoyBEJkZJpL3VVeEG4NwzoUTuMnaQoLP71h5r9Occ+DsWukFQnA6YB3HIq18RGViGpfD1IiL6gNegMoTjwUU7/9FIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrMJcsS6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b458ca2296so16257265ad.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111061; x=1779715861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yAI0jmmafbRoW0vPpmk4MEUcDdrrX1KvUtB3nDkkls=;
        b=jrMJcsS62LSDmwYVeoUxkEFB5q3IZUjvpchNBim5PAxZk1mw19mtjQIskCgqPZwIx8
         4qgHNeG/yP6h+gsKMjf94YrTm1JX1ENXdXEsdduLS5QUUWtxHdJUvLxCqAG+i0ypoiYX
         rc8HUbilZ22EIGfrGdtBWTDepnVnSC4cvwPug/R3t4QZtBW7B7dI4C8gXal3PHh0anao
         EB0mKn/pOLD1P75gk2ye0+Lw2VbirbDwU2YkcfyBeOJEWFlj8ca6p0Pk3nUg1Q5S36My
         5dcDZmG7naFx979Xon5Kjydyrx/hATlPr+W3sfTwdArkAnx7lUZnE1Imn9ahHrmcReF5
         7CgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111061; x=1779715861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yAI0jmmafbRoW0vPpmk4MEUcDdrrX1KvUtB3nDkkls=;
        b=EbaQjDUZRW/Uoy2VOtRDNGObP8pWhNQRh/95KMLe3JBIl8+DtPOFu62tnAivrGRp/B
         YhTDH/yrvbF6eXXLlFIjWWEdXaz752xCQDUo9XYt7k1bRfynV+u3AxhZ0u9tzu0H/wGC
         Jr9jKl3ouXUl5GeSleHa/Yr04I63CWPD3EhtRbK7gtm0fQ3ub+ikwNT568j1n53K6vph
         M/gHKR97UncuI96nayyhElPOqQKYI+Ao6ubEi6zmJfbrei/228bQIDmmAZS1LDm4OknD
         R3QyMga2PLUj/WBdpJOZ/JOsz+YTiiECaGUMePm1sXKpflN3QVCUGrWvD1cQUXODcaeS
         auXw==
X-Forwarded-Encrypted: i=1; AFNElJ/niNwfqXig4+v3/YnmOqoze9wUrADfWo71i5tmbi2WDUzOE3lKLbJdLCIrjWaKXdI5wo4CYfTl88GnoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66reESqgLxOgC79zmJw3UYAP+Spa66VDGxlWIGZ4nk9xs51Ud
	+kFezYXjLoRXsprt4LGneatbj/FWUp5Fd3vLefsw6kubrcv9+GUFmsP8
X-Gm-Gg: Acq92OGKP3Vmp+dwyXW383Rdcs6t54g7wHi7S9HzxVR+ESrAQNCmOTNWSiesu2jzhq0
	pYE93iRpAU39EYOLiVYHJdGX4Et7nf8td++xFS8Br1oRsDBddBiWn/mhOXjPD50AMqGXIWzX6P+
	zSoIoW8i5CgaV5v2CndPrIYQlZNCAEj4nkiNDvetqTfptVmiomYkSYN/EPw4z4fhD3p4RICj4m3
	9rrdHe/XJtMPxgZsUnq/m1yDZVfcwcErY+REdV7OMNoDvaYd7K1weAQcUqUDwoMaS76Kz5uayK3
	5Vu5UIBFJUe/EyltfD/T4YdGXVoMggukq7U2oeGRnwdhIe8hKmU0VoyGEcQ6U75blt1i+6sxqhB
	1TiAREtHDhFwwievQlqrl7YSN5awOpLu6W5MTipiPhZdkDF1CmjVy16JFouJ5/wjsl07Y6NKeB6
	R1z01JZzmqy0pc3g==
X-Received: by 2002:a17:903:2c04:b0:2b0:c45a:bc2 with SMTP id d9443c01a7336-2bd7e851025mr163691635ad.16.1779111061414;
        Mon, 18 May 2026 06:31:01 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm66413545ad.20.2026.05.18.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:31:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Daniel Niv <danielniv3@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7164: avoid double free on video register failure
Date: Mon, 18 May 2026 21:30:51 +0800
Message-ID: <20260518133051.1010695-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3615D56DB09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-61999-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,ideasonboard.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

saa7164_encoder_register() allocates a video_device and releases it from
the fail_reg error path if video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  saa7164_encoder_register()
    -> fail_reg
       -> video_device_release(port->v4l_device)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free port->v4l_device through
vdev->release(). saa7164_encoder_register() then releases
port->v4l_device exactly once from fail_reg. Restore video_device_release()
after successful registration so the registered device keeps its normal
lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: c759b2970c56 ("media: media/saa7164: fix saa7164_encoder_register() memory leak bugs")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 64380741b984..e23b44d1fc3b 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -1081,6 +1081,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 	}
 
 	port->v4l_device->ctrl_handler = hdl;
+	port->v4l_device->release = video_device_release_empty;
 	v4l2_ctrl_handler_setup(hdl);
 	video_set_drvdata(port->v4l_device, port);
 	result = video_register_device(port->v4l_device,
@@ -1090,6 +1091,7 @@ int saa7164_encoder_register(struct saa7164_port *port)
 			dev->name);
 		goto fail_reg;
 	}
+	port->v4l_device->release = video_device_release;
 
 	printk(KERN_INFO "%s: registered device video%d [mpeg]\n",
 		dev->name, port->v4l_device->num);
-- 
2.43.0


