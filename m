Return-Path: <linux-media+bounces-23835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C79F842A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 20:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC1C1893101
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A21C1B041E;
	Thu, 19 Dec 2024 19:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SzPgFB7L"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243EB1AAA0A
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 19:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636342; cv=none; b=exFlFh3/9O16DP0wXyGDFd6gzm6nAY7nIZ1Wp5tqhU3VnYIiV7ZE5IeYjWT6pibZ98mFgzHUj1uYSICNCLpgFoXtNykQnFJ57ddjNvMDJHzf7G/j9om9rNJS8HIm5xAB8TNyRCLhiQX42JtthiAb3KjU8Qbm39QrIdEx93pEoiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636342; c=relaxed/simple;
	bh=fA6TPh0T5BZhzOLQelzW0UXjUDaqmQ08lURqUjCa79o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLxSPGqqWhUxWk2b0RcSc6r+t0gRRmgfRQjWrhIVa45+TAs9tflAk0KQXHQ/EUmtezudiy2AA0lRZkokErUVeGFObHkItwU/IHaHhA0UXyTxTjmH/mbTuWZo0pEueESyJuF2pnJxiq1uBG3eViG/ZdeC1RYpGh7SRORi8GBe3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SzPgFB7L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734636340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0XCrf1gGecfh3yQl/yzNXjW/LgdagMZsIMZUH1TlxQ=;
	b=SzPgFB7LcYoMuSlZx2L8BPyT1cZViExfO/NvwrarhlTPhpu3y20rkzVDlppnwH6weDZGU9
	MAJeknG4npiGJUNo6mUFDV0PkEBLABKjPtcX/lh0EotMMvl5PUY/PkH2ABDfxh0zN7GV6y
	RCIwcD80pNtbPrRm6s810hlUjH1RUSQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-zMUfRidSPCqLqHZ0QxRcvQ-1; Thu,
 19 Dec 2024 14:25:36 -0500
X-MC-Unique: zMUfRidSPCqLqHZ0QxRcvQ-1
X-Mimecast-MFC-AGG-ID: zMUfRidSPCqLqHZ0QxRcvQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22862195609F;
	Thu, 19 Dec 2024 19:25:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47F4F19560A2;
	Thu, 19 Dec 2024 19:25:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ov08x40: Don't log ov08x40_check_hwcfg() errors twice
Date: Thu, 19 Dec 2024 20:25:27 +0100
Message-ID: <20241219192527.45561-3-hdegoede@redhat.com>
In-Reply-To: <20241219192527.45561-1-hdegoede@redhat.com>
References: <20241219192527.45561-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

All ov08x40_check_hwcfg() error-exit paths already log a detailed reason,
logging a second generic "failed to check hwcfg" error is not useful, and
in case of the fwnode check failing with -EPROBE_DEFER this is outright
problematic flooding the log with:

[    4.557059] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
[    4.559636] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
etc.

messages.

The one exception to all ov08x40_check_hwcfg() error-exit paths already
logging an error is on v4l2_fwnode_endpoint_alloc_parse() errors.

Make ov08x40_check_hwcfg() log an error in that case too and drop
the duplicate "failed to check hwcfg: %d\n" error logging.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b2af533bac0a..793246f4013e 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2164,7 +2164,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						    GPIOD_OUT_LOW);
@@ -2251,10 +2251,8 @@ static int ov08x40_probe(struct i2c_client *client)
 
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
-	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
-- 
2.47.1


