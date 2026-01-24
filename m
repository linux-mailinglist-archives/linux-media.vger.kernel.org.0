Return-Path: <linux-media+bounces-51450-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IW3A1p4dGmn5wAAu9opvQ
	(envelope-from <linux-media+bounces-51450-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 827D57CD6F
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB720301486F
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2A92459FD;
	Sat, 24 Jan 2026 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf+9izdT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A03C3EBF1E
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240657; cv=none; b=hYOAFA2uu+phhH7nTw68kA7i2pqInyBvFyRMkH7yHyVZ9G9ECkly9zJJSCso1QHsHgFbbF8UHYMXC9qd9lGV++ghMM2Ozu/5GHuhlZCnjACcYaY9Mthzy0XJeWmUjfDMN/PNWnrKQWmSur57WbfOj712i1mrc/RbAq+a3TOuGhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240657; c=relaxed/simple;
	bh=w3P5UaFUfsZUfAO+uNCaXTxoFZ0xRxkSAj3MazeZtBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsMo3R4xgxoKh6Rbl7C0tnC5VFWRAcrNjIRIuY8h8SmzNd1CdWUOTJq6dqcdfjNMewOQnpceSTyB2ofHQ5cKm9OH91F5O8s15rC5xWbWhdKe1tSP/YvkoVracfd3hcxMiWawjyzJMhV8hoB0SoAp3l1gMK1QeF7ZffGtfwBnbvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf+9izdT; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c1e4a9033abso1634811a12.3
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769240655; x=1769845455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9pKeIh90uj8LHBnwSOS8GNjdB1fiRxxTOxEB+RwaKI=;
        b=Mf+9izdTVOtTwrJcCmuKxeNSxOiavTMxrR2fS5xkVRuUH07a58ScvGvLGaufDsOAyM
         9ojzlpNLTEFpN02BJkOlj7suqA9u8mSaLOO5lNNbVvRn8zg8RzIMQ2oDWxXCk7ZrheZK
         3kPLQgJSSFoLXYwZMOzBVNN/ws8h7srtO/NHhxt1uz0wu3bKHIxq1YsfhegWBeFBB0n4
         b/B4UhJRqlxvkIUJg7jO75kud9K7sW1ogpGoGMfN9rt9jwALEGhqhYIQXCrEhsoVeMGt
         Sj0bMA9WM11bGxzcSoifXXhNiMnTIf+eAipkrUDDSjQPyIcMJia3fA2htj5Gkna34fDW
         Q1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769240655; x=1769845455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9pKeIh90uj8LHBnwSOS8GNjdB1fiRxxTOxEB+RwaKI=;
        b=wTl7jWkVOgV8V0p9HnpnN4B4YApqAomd+Eo/1yvDZl986RYBhKCsnnDA7XRRTs9R9Q
         wjeCGmEPHWRCKPqURISMPzQ4AwVuTU9/VbtJ4oTSG4bFoTxkwWvOmLJyDZkLELIwK7DL
         +hpUFTGpK21DxxW8x9Renm8et1p85PdwflO4wb570XLz2hp649x4lxcjkxn3MLTpE/hU
         hkHNwWxWht38BceSTe782SJKV6FcxZrMav6/fZitO+0uPcADW8r3QL12hIhByX7wk7BN
         UmLADY3yy3nnO9TkTC6xMrkYVsMxoTcTjcBlq3l2NG/lGbn8jsJBJy8nTH9t6Pg3lKcR
         5FxA==
X-Gm-Message-State: AOJu0YyZoLWdGL+C0yX0hwEyg71RTXc4zvJhwEO/SBqmZrzpeNceKHUa
	ctTtYLbNWHnNrN/DUJyz5S5qzbBYpPNC8KVZrHjcFFKY3gJw52tmbKiFYwQa0h0E
X-Gm-Gg: AZuq6aI3U0Y9hKcsKNMhRqQ+GLrPcBd/VgnVHfGMB1Ux4vlF4SFSLb57hKxi2/wfmCd
	+KM9LPib17uxgfL1fDzuXC5ZXizMFLIT2Oc52EkFjju3gC2W9LF1sXDin+fyxkjXmJOKMHvq1fi
	Ggx/hHjIR0/8aOQQj2/lobfJGPUOKO1+ZPQV0bhlg3cIgggqM0bV1fDQtRzE1la4lAhNGn32gyj
	HR36EvWxTtXMd6e2BqOYybAF4GptXEnOaedEwn3zn2vmtb86jwzGk5n5QuTAJu9huTug2BX81os
	Tl98TJfeI5ff4TuW1k0jDYRj/OaFLomyuUtew99psrp3Ubk3lG30c3yt7GukHQrhl5NPJoe9oMm
	MvWS1Gn7oW1MpWwfoRQQr0ZRPyBribQ2EJnasm9O7vB+MrmS2k4izZD4lYHQtZjKxVKzQzYLnRM
	W680wkQxzATWUvUcq206JlzLwHsBj0SUrav7o=
X-Received: by 2002:a05:6a20:b7a7:b0:38d:ee68:2c35 with SMTP id adf61e73a8af0-38e6f829c64mr5201612637.78.1769240655346;
        Fri, 23 Jan 2026 23:44:15 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42a626sm3653985a12.31.2026.01.23.23.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:44:15 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: hansg@kernel.org,
	bod@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: Fix race condition in remove and relax reset timings
Date: Sat, 24 Jan 2026 13:13:40 +0530
Message-ID: <20260124074402.7165-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124074402.7165-1-bjsaikiran@gmail.com>
References: <20260124074402.7165-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-51450-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 827D57CD6F
X-Rspamd-Action: no action

The ov02c10_remove() function has a race condition where v4l2_ctrl_handler
and media_entity resources are freed before the device is powered off.
If userspace (e.g., PipeWire/WirePlumber) accesses the device during
removal, this causes a Use-After-Free leading to kernel oops with
"Execute from non-executable memory" errors.

Fix by reordering cleanup: disable runtime PM and power off the device
BEFORE freeing v4l2_ctrl_handler and media_entity resources.

Additionally, relax reset timings to prevent CCI I2C timeout errors.
The sensor microcontroller occasionally fails to boot within the
original timing windows, causing "master 1 queue 0 timeout" errors:
- Assert reset delay: 2ms → 5ms
- Post-reset boot delay: 5ms → 20ms

These two fixes address different but related stability issues that
manifest during camera initialization and removal.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d36032e1..b86cae3d2b74 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -692,9 +692,9 @@ static int ov02c10_power_on(struct device *dev)
 
 	if (ov02c10->reset) {
 		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(2000, 2200);
+		usleep_range(5000, 5500);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5100);
+		usleep_range(20000, 21000);
 	}
 
 	return 0;
@@ -864,14 +864,14 @@ static void ov02c10_remove(struct i2c_client *client)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	v4l2_subdev_cleanup(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov02c10->dev);
 	if (!pm_runtime_status_suspended(ov02c10->dev)) {
 		ov02c10_power_off(ov02c10->dev);
 		pm_runtime_set_suspended(ov02c10->dev);
 	}
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
 }
 
 static int ov02c10_probe(struct i2c_client *client)
-- 
2.51.0


