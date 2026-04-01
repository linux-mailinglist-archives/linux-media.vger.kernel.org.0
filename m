Return-Path: <linux-media+bounces-57895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKC8E41izWmMcwYAu9opvQ
	(envelope-from <linux-media+bounces-57895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:23:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3037F3A8
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 20:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A28A306D354
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 18:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B957531E855;
	Wed,  1 Apr 2026 18:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQlFlopo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED937320CD9
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 18:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775067427; cv=none; b=C2i8D/CsmW3CnDqE1jqo0dsYpVX1fGJmunsk0wdQA8wTwq2jYzqtbsKoAdm8tgWxhbJdUJVPqh1JC1L2xRpm/M16kLbwsbsVPJRv7KGpQziyOC416DtD3a1MR2iqAw3ZFB3aaM2oRC53reKFcfp6CAV/DlkxZOSGEWdE3HOEqBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775067427; c=relaxed/simple;
	bh=IX+wQq4T5DKVzSw6Vp9g1t+wnTvP/wCU3zamd2onuXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oS91fT+pGBQdj13P7CydMHtIVabSGu3O+SeD7OX4QY4nXQIHwS0Jsv5W9QkaTzNS+Tzm1t0zaIeoTnTBQg9P9lFUJ+gxLXERF6Tzs4vIogHRScVmnRSTBT3s/M1oFpNr/U72kKxs4yADEI3iKlD1GD9x4oFlF8QLZBuNyhfuf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQlFlopo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82cf976ecacso26300b3a.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775067425; x=1775672225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21SX5y/GcmnmuEOgAc+fgSaPS9NksSYjs5veJdbCAfg=;
        b=UQlFlopoYf9iq6JOJmdq3vSKShpgIsWgWAx8ZCN9Jc64x0pH+XWyx3vgr5mCbk8dG+
         FQV41iaVh7sbbEpGCvtgnLn9GdLS5YbZsGQPH/oJyVdyEkVI7fqmSpJhjHvVk9EFdbPF
         3/atNzhM/SsYQWYZgcTfd/Z8vUQbYqWjp2fHvv+IvbMF5chK3SagTwZGbWGS+aS0zMNv
         xKsd5CediUKkd9QjyZhdxpFnpYYf8AYhARuQLf4K60asj91wN3/0ug/jkoqtG3wxv1/i
         EV+ctMLfyGJ0Fn+sNW0QNvS56P2shSSkrFAEomXa4Cal7IRY0jBSVI65+3irAIE5DLXP
         s5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067425; x=1775672225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=21SX5y/GcmnmuEOgAc+fgSaPS9NksSYjs5veJdbCAfg=;
        b=ChrsKygUXN4fm2e1p9+YXo2CZOaGDMcyO86ISvcRinDLkNG3gzBBy4TyC1VzMCDz1v
         5b/YgREUPW2i+Zf2MEJN/oeWP/AO3DVKE2AJKeTAOEDL+TKm4ubVSU1KcRVKF8dtdeOc
         S3YHXXaoz7v5oECNxLIfIHzax+otAaz0N+PiUaoK0zEBcL/jydubEdfQ/cnfHmJks9+V
         PZMMkWFN6uBIYoCvQwp9QamZEcStVN+aA8GvanM3Q5L2wEgViARBkWH2x4u4ug8jps/7
         16rZeqxkJ7e+dhbldnCRDj7TYGhGlaFm1jKCDoJLFIbjciGA1Gp81su37M+vk4uybj2f
         aFzw==
X-Forwarded-Encrypted: i=1; AJvYcCVcy8jzhw1izLJTJxom+a43//A+YOArDS8eN405FopIl/xFlX8hT7ihaR4HrLAc0bjED3cklcArUhmYyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3H5OFxOkGeIeC0G+TH4gLdaqs+1Q/8Pbp8hGTJidoX2O4VsZ
	9vxJDRe+X0Cg8P/hJrcn/v771skSYdX3HAFn+vf9fdopzjJi07IBO4w0
X-Gm-Gg: ATEYQzwnFPs9QvGz9i0K26Bo0EooyY6ybPpqX0fGhFvxQCDpeltkz5hT/q7vef27GsO
	v7RmuJCCu3dnkVqRvM3jA/sRWjNaa7K+nvfwtYETEnyrBcFb49pA8iHr+03D1rCSL2GWrrlDtkt
	wj38UP8lj1HZl9KvaUQpDfYmhncseCR2Ziy2hlSYaTYgLueUmbqvebWGwCPeSQ1sg1z9iu/WeRU
	pwWi8AeTpig0PFH8GabEGntUg1V/937JbYR1T2ePJVjRJET1gTX6X/9uPp/euFN6I1Ib50dpX4N
	GnkMUey8WHbkewjXBMEM8eWGcJ1XRKm5oL5f3cR9hzRNF5sUd5AYwKmL/kif7NSJlCLCCInB0TS
	ZsJiP5bjYrceo8HpXlNWHXSzOWOmdzlsN2xOtPs+0GVC6qDT5mV2zS2X0We4byMu6ApWg3FpNMU
	0zCL+SBBCEOXB5U0qDiOMtz6FDavZl/0QD72BLHjDl5Dk8twOg
X-Received: by 2002:a05:6a00:a0f:b0:829:8041:83f with SMTP id d2e1a72fcca58-82ce88d4c86mr4873022b3a.7.1775067425265;
        Wed, 01 Apr 2026 11:17:05 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm666249b3a.54.2026.04.01.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:17:04 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: gc0310: fix probe error handling and unwind resources properly
Date: Wed,  1 Apr 2026 23:46:55 +0530
Message-Id: <20260401181657.654055-2-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401181657.654055-1-sanjayembedded@gmail.com>
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-57895-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFA3037F3A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The GC0310 probe path currently performs error cleanup by jumping to a
common label that mirrors the driver's remove() callback. This is unsafe,
as remove() assumes that the subdevice has been fully registered with
the V4L2 framework, media and control resources have been initialized.

Calling remove() from probe can result in unregistering or cleaning up
subdevice, leading to resource leaks and subtle lifecycle bugs.

Rewrite the probe() error handling to unwind resources explicitly, using
fine‑grained goto labels along with appropriate error logs. Each failure
path now frees only successfully acquired resource, without remove().

This aligns the driver with standard V4L2 sensor lifecycle expectations
and avoids incorrect teardown during probe failures.

Fixes: 1e72afb5146a ("media: Move gc0310 sensor drivers to drivers/media/i2c/")
Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/media/i2c/gc0310.c | 39 ++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 7af4d66f42a0..72a82ad4118a 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -721,7 +721,7 @@ static int gc0310_probe(struct i2c_client *client)
 
 	ret = gc0310_detect(sensor);
 	if (ret)
-		goto err_power_down;
+		goto error_power_off;
 
 	sensor->sd.internal_ops = &gc0310_internal_ops;
 	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -730,20 +730,27 @@ static int gc0310_probe(struct i2c_client *client)
 
 	ret = gc0310_init_controls(sensor);
 	if (ret)
-		goto err_power_down;
+		goto error_power_off;
 
 	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
-	if (ret)
-		goto err_power_down;
+	if (ret) {
+		dev_err_probe(&client->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
 
 	sensor->sd.state_lock = sensor->ctrls.handler.lock;
 	ret = v4l2_subdev_init_finalize(&sensor->sd);
-	if (ret)
-		goto err_power_down;
+	if (ret) {
+		dev_err_probe(&client->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
 
 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
-	if (ret)
-		goto err_power_down;
+	if (ret) {
+		dev_err_probe(&client->dev, ret,
+			      "failed to register gc0310 sub-device\n");
+		goto error_subdev_cleanup;
+	}
 
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
@@ -751,9 +758,21 @@ static int gc0310_probe(struct i2c_client *client)
 
 	return 0;
 
-err_power_down:
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&sensor->sd);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+
+error_media_entity:
+	media_entity_cleanup(&sensor->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+
+error_power_off:
 	pm_runtime_put_noidle(&client->dev);
-	gc0310_remove(client);
+	gc0310_power_off(&client->dev);
+
 	return ret;
 }
 
-- 
2.34.1


