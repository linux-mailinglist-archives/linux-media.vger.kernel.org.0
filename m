Return-Path: <linux-media+bounces-57998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBHiGZAIz2kNsgYAu9opvQ
	(envelope-from <linux-media+bounces-57998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:23:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D632F38F6CB
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 02:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB2C9304D650
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 00:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5AB222599;
	Fri,  3 Apr 2026 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGPwJe9r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7911F8723
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775175808; cv=none; b=igOBZQcp2J88Ej5JXyMwjH6rwaNnUjcYG6L4VYcAy8yMPXJkGRgGJ3GkYlL3HX3m3dxptC63DjJB3DldmRs1gx+OSV70yejTaM8mTiA1hhPOLJc84ShOIbkbtq5h2RDIV7atZd5bqDvN0FP8x9ljU/y8syWAgKvG1YVZpQwE4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775175808; c=relaxed/simple;
	bh=MHysRRh3hIUZ58zqF7zneS9FyZKt7+ftsdeVzCtr4Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfBG5IvOT9lM4pmXnOQCiTXsrTS4BW2qpjY46mkSE8e2U8ZR4ftgx14TsSF6tjw9pmF0V6JiEePpdi1c2zPkE5mFKYq5EGoxJ6PdGPFSWIzeFyFjAkeR4hJhAy9qE7xBiOQQq566y2fhWszKzJ7B8D5qdgEWHo+IrVcPXXMS6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGPwJe9r; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b392f1846so14942591cf.3
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 17:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775175805; x=1775780605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gcgUlRJBBlinNi9TlCHjloLPOB6uLf9+TDA/1HPzAQ=;
        b=bGPwJe9rHVD8cXDrfzHewMJk/6czAVa/L6yxISxCWeZMO8MfCmUyQbGu48FbrHdPa4
         H1UTlga6Vme4M7UKb4DIu/rgFhUIGeCKUu0NVvrOUFKY0JAAvUJyqgcgIEV4JjSynSgW
         yQ2mr+3tOA3381n19IAwMW5GvcAceS1MkQoR5wGR538b8LTVc8DclX49470Gu56Qw9s4
         kfPd4HxKkUrG6YJJSuFnEaOco2+Gr2DcJ4FWjEh+4zm39LymZOl2+fZ6bj544/rqO4yF
         p/YkoouKIUCvUgngtcrEfbbOjI58Ov87uKKgYquem6epe1170SToUY5VpdK1xR1BBtZH
         qDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775175805; x=1775780605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gcgUlRJBBlinNi9TlCHjloLPOB6uLf9+TDA/1HPzAQ=;
        b=px/qVYCBVDIxd1w9trbzO0DiocK/gfI2ceIJpREJX3PQXNAr02gyi3dgUIF8SJs/NO
         hbwh0U2/pzd6QiqxgQZIiKS5wIiRZ8zm1v+BUNmCgFNM54kxEDBr6dPtZEOnbzK67awh
         nX3RYG/9fnVTqHzZHdEZJFf4PDEDdNh1GSmu1pgwhEQuNRqJcSkbKhMct548dv4U/ViU
         atXEhz73itKOuANVlJdYyy7ymsJb+ejX+nyk/qJ43Puy3ZZRKW2frpHpdbWurSNhkhAv
         frw5udybpyjd256fTL31VJM4I0p8XlUsL7gAFG6HAsSWIRALBoYjl0+hy8XAVRigzYZB
         rueQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqmh+JzEe0eNgGRGi6XZeAPw3MnA+N7Mg+XAfKnpuWFzelUF5xxluHoHINmoWx0E8jKwCxVRrjS/fmMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZ/JWAX1/R2w9HdoXhcIx0ysUz7VirMaWH75/tBNT/hjod8uz
	lWyX4AFY7Pfw3kRpdD0rOS3VZhDRcL6nTwXb8pX7EUNy2Pu6S66j2QI764wuL2HazK8=
X-Gm-Gg: ATEYQzxyI1b9NLrYriYFUGcb80BWsgIShDVaEUFociu+DfoRE1gI0arU7pLWe33edzK
	YaptGbYk1E8qFDf0HiYg6TiFLf/8EiTmYmGoSNZci7FzGmmBMWQOQyYD948DsJAdcnG0ILt2aaS
	jBEY+DRn2d0KNg+NyMdeqVEuct4mCNPfG3RBmMKFQb+z5jupKxupf7LM/09LwNwDSKTsOkFLpQO
	QD80uKbZEbTool8zrb3rK6vZGdRKcCXeCdBoia6UpSRaZQj0SaJmohkXb+k8YlPX7CjyyEjC/uA
	h3p91Ox11DTD3nGleQM3Z1vCpUeA9nEHYUSBd9gTknI/dIg1COomkECDzd87q1asQCN3OX/Sqdc
	5G1OJJ96ceAAV/8YiHkQMwsUe5kZqvG1CSHYgswh7s08eQ4yctO7tj5IEPvPKjQ7Syb7smsWoXO
	bWzuO1iZLERjFBoEZyd1dXduME5yw=
X-Received: by 2002:a05:622a:684f:20b0:509:238f:ad92 with SMTP id d75a77b69052e-50d62894aa8mr17321391cf.24.1775175804180;
        Thu, 02 Apr 2026 17:23:24 -0700 (PDT)
Received: from localhost ([165.85.38.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b88914csm35692941cf.23.2026.04.02.17.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:23:23 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v4] media: atomisp: gc2235: fix UAF and memory leak
Date: Thu,  2 Apr 2026 20:23:19 -0400
Message-ID: <20260403002319.12771-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-57998-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D632F38F6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gc2235_probe() handles its error paths incorrectly.

If media_entity_pads_init() fails, gc2235_remove() is called, which
tears down the subdev and frees dev, but then still falls through to
atomisp_register_i2c_module(). This results in use-after-free.

If atomisp_register_i2c_module() fails, the media entity and control
handler are left initialized and dev is leaked.

gc2235_remove() unconditionally calls media_entity_cleanup() and
v4l2_ctrl_handler_free(), but these are not initialized at every
error path in gc2235_probe().

Replace gc2235_remove() calls in the probe error paths with explicit
unwind labels that free only the resources initialized at each point
of failure, in reverse order of initialization.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes since v3:
- Replaced goto out_free/gc2235_remove() with explicit unwind labels
  to release only initialized resources at each failure point
- Replaced the "Fixes" tag with the original commit for the driver

Changes since v2:
- Replaced gc2235_remove() calls in remaining two error paths with
  goto labels to unwind only initialized resources
- Added Fixes tag

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..998c9f46bd068 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -809,7 +809,7 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
 	if (ret)
-		goto out_free;
+		goto err_unregister_subdev;
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_csi_cfg;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+		ret = dev->ctrl_handler.error;
+		goto err_ctrl_handler;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -838,14 +836,23 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		gc2235_remove(client);
+		goto err_ctrl_handler;
+
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret)
+		goto err_media_cleanup;
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	return 0;
 
-out_free:
+err_media_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+err_ctrl_handler:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+err_csi_cfg:
+	dev->platform_data->csi_cfg(&dev->sd, 0);
+err_unregister_subdev:
 	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
-
 	return ret;
 }
 
-- 
2.50.1 (Apple Git-155)


