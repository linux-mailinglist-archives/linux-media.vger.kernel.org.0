Return-Path: <linux-media+bounces-44456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E1BDACF4
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E5F3355CE2
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162D930B522;
	Tue, 14 Oct 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzxikEZG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74662286415
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463654; cv=none; b=BtRUT2BsR3mk1L8Tw4ikJFc7GJiuGFsCix4SBq5AYYrNhXN2st9ji463hXSRnwR0fvyk1fUSiq38qVwh8hLH3xgybd/hcYJDHLJNqVfMxfbJrd/PPzxFTdZXL/xW4532E4XVW4y8GP/LDLfba+4DESn1lieTdhK8y9xDSu7oFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463654; c=relaxed/simple;
	bh=/kCWQk/7rPE05bTZYcU+aB/Ul9IVjTFJMh7stdIiprg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJ9HhL/eVocJjReOuQuo8jLt4wFxmqv2JiBBh1uAYJaI7xGjEWKGbkZNH+tPXDMeXbSqXBVFNPsGUg+A8C9a+FZ7FBt0mDo6RATCxvu9w6sexWNubQqLnalvETD6JyelhbwS/tzEKQrELIXpDz3FAaQ+7ZbxlStFXfnmPADd5mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzxikEZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A40C4CEF9;
	Tue, 14 Oct 2025 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463654;
	bh=/kCWQk/7rPE05bTZYcU+aB/Ul9IVjTFJMh7stdIiprg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzxikEZGT3apibznZLJql0H4Yr/OyBkG8Z/tw14v0E0kl7dbkyc2TKXHEVwhcqkI8
	 IRCdreXzp4hJzH7VbDJ3RIU8E3hKRvpo2muZ9Q9kYu4VseQsDZLV1NblKREiZ6Cli1
	 lADtp2pd/5aTKYnZdIFPPlVv2zV2EsHsaf//J60qvuVW5ArKvbyATM/P8bQrWzcyCd
	 V1deXjyCgzLVQdPCaDBIwhD1CnfisJxkr0LWP9IdnOWriLvAU3rLgrdKkXn+lyPXvW
	 MtA7+ydAxsAEkbxrrOG1Hyi3rry8oQu1tV3fNnz5GRnRst9j9cxU1G+ILRaCKur4NO
	 5XmxaPMciivHQ==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 09/25] media: i2c: ov01a10: Remove overly verbose probe() error reporting
Date: Tue, 14 Oct 2025 19:40:17 +0200
Message-ID: <20251014174033.20534-10-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many of the functions called from ov01a10_probe() are expected to never
fail and they should all already log some message if they fail. Remove
the unnecessarily verbose dev_err[_probe]() calls from the error-exit
paths in probe().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index d17a04f4ca5b..52e1f3e0e4e5 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -782,16 +782,13 @@ static int ov01a10_probe(struct i2c_client *client)
 
 	ret = ov01a10_identify_module(ov01a10);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to find sensor\n");
+		return ret;
 
 	ov01a10->cur_mode = &supported_modes[0];
 
 	ret = ov01a10_init_controls(ov01a10);
-	if (ret) {
-		dev_err(dev, "failed to init controls: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ov01a10->sd.state_lock = ov01a10->ctrl_handler.lock;
 	ov01a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -800,16 +797,12 @@ static int ov01a10_probe(struct i2c_client *client)
 	ov01a10->pad.flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ov01a10->sd.entity, 1, &ov01a10->pad);
-	if (ret) {
-		dev_err(dev, "Failed to init entity pads: %d\n", ret);
+	if (ret)
 		goto err_handler_free;
-	}
 
 	ret = v4l2_subdev_init_finalize(&ov01a10->sd);
-	if (ret) {
-		dev_err(dev, "Failed to allocate subdev state: %d\n", ret);
+	if (ret)
 		goto err_media_entity_cleanup;
-	}
 
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
@@ -820,10 +813,8 @@ static int ov01a10_probe(struct i2c_client *client)
 	pm_runtime_idle(dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register subdev: %d\n", ret);
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	return 0;
 
-- 
2.51.0


