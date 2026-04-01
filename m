Return-Path: <linux-media+bounces-57892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HwvG2dOzWkWbwYAu9opvQ
	(envelope-from <linux-media+bounces-57892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:57:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C693E37E449
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 18:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BCA031B4453
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB986478841;
	Wed,  1 Apr 2026 16:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKBJLMdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEFC43CEE4
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775061060; cv=none; b=inc4vJqOwnP+eFg668fo69srkTGYaj00fOxdNgtJKpFIQlDxtyQ+uW4i51xBV0Oohelxewo3dG2vtSiD+an1BwQfsstG5Cn6iivD7+k46eG3kOGlsQwPajMDyPGu1LraMM+El2pyNgr8nml4IhkDWt6GxwEgHCwoLUc+d00/Sr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775061060; c=relaxed/simple;
	bh=WFxD1dCi0gdEf1RrCRcbG6DJ80ofO47eH0nGB+1UHro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNfpJ3VHvxOTDhwaJ0o60favYGuN4ozTDvKYIWXPe5EZ9rEjtgF0dk0FP/Yx4y1I+bzfUV88ASLM+VaXC4GBJGBbJU6GZmRk2qJMfc7xiZmF4a4qwciIp56JZXo2jEKwdwzHkOrRJ0FfaFXmtH6Farfp3UjYeRv4mBduTcf8Cis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKBJLMdH; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cb40149037so782022285a.2
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775061056; x=1775665856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUNe/dYEv7kv40YpEMImc7XF/Oi4b6WN91XD+axok70=;
        b=NKBJLMdHcNJeWHIemMTlD2FFb9pYuMV3dMgg8fwgPUax/fCuwMkL53zAfDZie2eR5i
         ATTiY6kYV0hwEC22czYhXVUco0qdPNyfhxF4gUzoQz7KPzjoLSNB3dBb3wtxekKUNuGz
         Jmq/J0fc/EKwQTk28kyzbz9lA1vto/VVFkCpUcFwG1t6y8vifnQlIJ/Tc1eaa6oIZskb
         bn8fl2gzrkU/z/ykHWmbJvw63okUlrKp1uMpRhzg3vwc0c0w+oJH8jFAFtPrCHqD78LW
         vZOjaEOEsmOuuFvG6ZwAo6MmG6KugO24ojlJC/HzaWpilqJoPnNA8Hu2FgooSvDQe+hV
         G1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061056; x=1775665856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUNe/dYEv7kv40YpEMImc7XF/Oi4b6WN91XD+axok70=;
        b=lzuiS2+BTD4FJbkQFry7WqlmxSNuQ4UkSLIfAsJwabDqNUkcvCjAcdbKakIh1UttYp
         juhao5RErSLSbDApGCKfGiacEYGEiodiZDeM3cnCOv3Fy/HwfNDYWRmqXsHNzg/4j0rh
         hwpHCR1MfB05gsUKhZzkMbANqM7cgF+d+lHesJ2S5wpBs4KQCSCexppbsiomxA1cXMkc
         aZgvGGnIFJiY4n5NFt1AMbC8JkLZOHei4hx6QBD4YISLM8B02/zwav8mLlJQssReYEiW
         rgJLfh4D22+cBFr7q9nYQI6/al0QwSKEdbl5ozTH3WJVJUTR3MHj1ZeUIYFYTHIElezY
         pUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAwPUuMI5sNL+pSoA/ARWVL0FWLMrKa1lDAKbhLRzciGBGnISKiZbLyOy9ktA3r7tdGnI3hDJTeJFqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJg3LtlKmfplCvoR1B8UpoBFo/XpO0s4Vk9KRFAEJfC20ZbG0+
	aPToEP9g1TQF64FmjJSSJbhWN778WSsAvdngnKpZeoPQl9cAWVmV9UCn
X-Gm-Gg: ATEYQzz8i3IL6gNIdmaWAmDN2VIaoytBuCexlH/HK7kgKjzBqEMlvPkQfBKqtFcvmWP
	z3sTyD5iEDjVrfs4En214lqm4/sOcfr1guP3IahCyYT7oS/0D0WHqU44tHUHPBfd2+z9pv9/T8f
	3U7dD1439IdaAb5T2XxOCOEkADFAdk+03R4vvTdy0FRsYoF5rCHBzlfR8a3ucxVy3FZfLAAD1WO
	KQ1JjZv6tKXcAGcIxeIn3iUecOW/+dFkKrxKIzen6+U9SqkG/aDitXvfkTGsY/JVN47LYbSbO6K
	3rXtUs9L57xUbMMYQsX+HyTFQ/EeaYtlHd3nAPNmJ6G89wBSiSbDt21DG6va8z5bdZykPy5fcCq
	sxcO8vjhYf/tXN7NRiSZfYhRImw053Dv0w7/CC4ZxF0oqu2nWYfSbOQr+A2N8+AsdRsopvUHFP0
	+zodRZSL85DMRtd6DaTku8laiqKSFt
X-Received: by 2002:a05:620a:1981:b0:8cf:d5f3:9a1a with SMTP id af79cd13be357-8d1b5c2a262mr623888785a.51.1775061054536;
        Wed, 01 Apr 2026 09:30:54 -0700 (PDT)
Received: from localhost ([104.39.66.164])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a874459asm12496985a.39.2026.04.01.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:30:54 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
X-Google-Original-From: Yuho Choi <yqc5929@psu.edu>
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
	Yuho Choi <yqc5929@psu.edu>
Subject: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
Date: Wed,  1 Apr 2026 12:30:50 -0400
Message-ID: <20260401163050.34830-1-yqc5929@psu.edu>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57892-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,psu.edu:email,psu.edu:mid]
X-Rspamd-Queue-Id: C693E37E449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gc2235_probe() handles its error paths incorrectly.

If media_entity_pads_init() fails, gc2235_remove() is called, which
tears down the subdev and frees dev, but then still falls through to
atomisp_register_i2c_module(). This results in use-after-free.

If atomisp_register_i2c_module() fails, the media entity and control
handler are left initialized and dev is leaked.

gc2235_remove() is the full teardown path for a successfully probed
device; it unconditionally assumes a fully-initialized device.
gc2235_probe() must unwind only the resources that were actually
initialized at the point of failure.

Handle each failure path with explicit unwind labels that free only
what has been initialized. Return success only after the full probe
sequence completes.

Fixes: ad85094b293e ("media: atomisp: gc2235: Remove driver")
Fixes: e838b8c69e45 ("media: atomisp: Drop intel_v4l2_subdev_type")
Signed-off-by: Yuho Choi <yqc5929@psu.edu>
---

Changes since v2:
- Replaced gc2235_remove() calls in remaining two error paths with
  goto labels to unwind only initialized resources
- Added Fixes tag

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..eedaedc84284b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -818,18 +818,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret) 
+        goto out_free;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+        ret = dev->ctrl_handler.error;
+        goto err_free_ctrl;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -837,13 +835,24 @@ static int gc2235_probe(struct i2c_client *client)
 	dev->sd.ctrl_handler = &dev->ctrl_handler;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
-		gc2235_remove(client);
+	if (ret) {
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
+		goto err_free_ctrl;
+	}
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret) {
+		dev_err(&client->dev, "atomisp_register_i2c_module failed\n");
+		goto err_entity_cleanup;
+	}
+
+	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
 
 	return ret;
-- 
2.50.1 (Apple Git-155)


