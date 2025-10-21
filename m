Return-Path: <linux-media+bounces-45154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EEBF82E8
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 21:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B839C3A619B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 19:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B7F26F299;
	Tue, 21 Oct 2025 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="WFg8b8Tj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BE2348459
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761073241; cv=none; b=oILzCol4FKlhUmwx7xxSX5n0fUHZIJb7GH6eedRrTF9Na9yk8OCh8dn3HkUHkyHPtPiXttX/k5LIIGsA9KKLCTx+iqwlLXUgnwXAYQ1jan/fM7bCCz2Xz664FX27dGIWJSCRfv/atpTF0VLlKctNsMZK1uMBNaSd8Scnjogsh3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761073241; c=relaxed/simple;
	bh=SVw5VajVisOLqc5P0MjYSlOIrjy+n7zn5M5S9V6muaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AVF9eN2h5uRbrd0vFFdz62Txq4tEsZipFSWIh5CVFMZeoxA9NxN86XCJyHpb5dpfL/+GSKup/6vjnyFcyBm+oQc/RVHvZ8aWu3RAiYYkYpzUwqmmhspFSsE/pRaCfhBYzlEZ28MpoUDdtk4JQrTDYrYo3x1QdB8phpxswB+0tmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in; spf=pass smtp.mailfrom=ssn.edu.in; dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b=WFg8b8Tj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssn.edu.in
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso5351311b3a.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ssn.edu.in; s=ssn; t=1761073228; x=1761678028; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQuePNcODnSleaf7SYTFYNuoiADvPoXlHCV+ySNuzT0=;
        b=WFg8b8TjHahrybAyxRcxp3wkm8wfS7xl2UGf+OYqnRwPYdZSh+8QeOlTrqJTzqTw/z
         egsQZIkhqOttuUZLP93UnwKNN6sKeWOWAoO2sEJ7130gUY3zPsTmusJj68utq/F/zA0O
         YNE8aftiDGfXYavVuEfN5UzjRdjQ7kLW8CjN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761073228; x=1761678028;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQuePNcODnSleaf7SYTFYNuoiADvPoXlHCV+ySNuzT0=;
        b=Lm3o5UpgcS1CCJIHog8Bl3i1/Qiix7tQZPQW4pwWVwRveuKkfh2dVL/tJWLmn4J9E1
         PxilecLQZArHkaaTM4h4i5MA1Kuu70o/0nhNhlmsalN1GL0Qm5dGakqtpx7GVl49h/oj
         cJ2845MVtk7/0n2MZkx64Jh5OKW64UBRyirPMLgZK5c7U282YWNJny22TD98DGOgI9wM
         cJHN4TUNxsvodUjuHEkP3wsR6InQK846/K+9CugVwD/qg4jcWZpoknJgqycpBTGx1J0m
         Tfq7QEXfcrtlhqFBak68pc6IbSVjSveZnzUou4euMTNtlI6AauQx7FTOZpGCjn17ZB+r
         uAdA==
X-Gm-Message-State: AOJu0Yy5DmaWIqe6zmbIJ5RLMLmK6W0uYS5/9S7Ochu7SvO4dP5hwdj8
	V7NPCEgVxoFlw4tLwtHrfEj/5OSy6v92p7QMOZeBQSQQ61oWilXr51tqpI0ZJeLCNV+5+W5E9Wr
	eEU8jt0D4Pb5ZHA4bWdIVMgMBf2H1nqnIHqcmQM/QbU8qBOFtAXLjHdWKUp0SIlQcO/7fh5AKfI
	ON
X-Gm-Gg: ASbGncu5HvSAG0xQ9jfkOylr2dZv4CcG6ogZgTz4rgfbSBVDF2MeZ1uWf5kmzBBGQEe
	hfGYfcmtCbOhHYRi0OFSuw3Gny82TULHPqOVZRDz6G+PAH/vXVgXA7Jpu8ZjO0iqaec5nfVaDJ2
	1VRww0gQeeek/UHVSJFcmNmSwqchRVVJPHC4ZZNY5S+XhntUkfsjabe1WxXxZN7TumHLvmyu5JO
	FDu4rrNZLDS9Jd4CqAe9dwmheP3u9QHleBF8k+riPT/VplPQaM0GuBP0Qb4oo7P4VIxdCJS4euQ
	X9jErF+MgxGAJVxPtJdRxkLrO4NjzqJCn44W3dvJijZAc2ioVVJDmXj6aCJ0NJigTHqnYuRwFLQ
	fXeMbZiFsaaed+ZQnfJ+AO5eHcrtHUh9NG7rzyEES3fzzl5eEYa0y/Ucav0rI5QEvmvMctH40/q
	8SWQYDwQRC75sa1Z/qDQAxOz7iB+JPYba8veUw/062pAKd2hLAt2kUTgeRxOkOfChbKNxZiSBKD
	Hvu
X-Google-Smtp-Source: AGHT+IEuvU4rm2C2+oElaDaQ7AiljBoqcSbuyBhJQNtPr4w+UTmbbmdsfk2ZrQR7we4gjves5pSL5A==
X-Received: by 2002:a17:902:f711:b0:27e:eb98:9a13 with SMTP id d9443c01a7336-290c9cbc077mr204352375ad.22.1761073228237;
        Tue, 21 Oct 2025 12:00:28 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx.. ([2406:7400:1c3:33f3:d5f3:33d1:a1e0:46bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb683d79sm1364524a91.2.2025.10.21.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:00:27 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: linux-media@vger.kernel.org
Cc: awalls@md.metrocast.net,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH] pcmcia/parport_cs: Refactor probe function and improve error logging
Date: Wed, 22 Oct 2025 00:30:21 +0530
Message-ID: <20251021190021.173748-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

- Replaced pr_notice with dev_err for proper kernel error logging.
- Added explicit cleanup of link->priv on failure in probe and config.
- Improved comments and readability in parport_probe() and parport_config().
- Ensured allocation checks are consistent (kzalloc returns checked).
- Minor refactoring for clarity and maintainability.

Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
---
 drivers/parport/parport_cs.c | 38 +++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/parport/parport_cs.c b/drivers/parport/parport_cs.c
index 8e7e3ac4bb87..c6d3f2ee03f7 100644
--- a/drivers/parport/parport_cs.c
+++ b/drivers/parport/parport_cs.c
@@ -83,19 +83,35 @@ static void parport_cs_release(struct pcmcia_device *);
 static int parport_probe(struct pcmcia_device *link)
 {
     parport_info_t *info;
+    int ret;
 
-    dev_dbg(&link->dev, "parport_attach()\n");
+    dev_dbg(&link->dev, "parport_probe()\n");
 
-    /* Create new parport device */
+    /* Allocate private driver info */
     info = kzalloc(sizeof(*info), GFP_KERNEL);
-    if (!info) return -ENOMEM;
+    if (!info) {
+        dev_err(&link->dev, "failed to allocate parport_info\n");
+        return -ENOMEM;
+    }
+
     link->priv = info;
     info->p_dev = link;
 
+    /* Enable IRQ and auto IO for configuration */
     link->config_flags |= CONF_ENABLE_IRQ | CONF_AUTO_SET_IO;
 
-    return parport_config(link);
-} /* parport_attach */
+    /* Delegate actual configuration to parport_config() */
+    ret = parport_config(link);
+    if (ret) {
+        dev_err(&link->dev, "parport configuration failed\n");
+        kfree(info);
+        link->priv = NULL;
+        return ret;
+    }
+
+    return 0;
+}
+
 
 static void parport_detach(struct pcmcia_device *link)
 {
@@ -141,10 +157,13 @@ static int parport_config(struct pcmcia_device *link)
 			      link->resource[1]->start,
 			      link->irq, PARPORT_DMA_NONE,
 			      &link->dev, IRQF_SHARED);
-    if (p == NULL) {
-	    pr_notice("parport_cs: parport_pc_probe_port() at 0x%3x, irq %u failed\n",
-		      (unsigned int)link->resource[0]->start, link->irq);
-	goto failed;
+    if (!p) {
+        dev_err(&link->dev,
+            "parport_pc_probe_port() failed at 0x%03x, irq %u\n",
+            (unsigned int)link->resource[0]->start, link->irq);
+        goto failed;
+    }   
+
     }
 
     p->modes |= PARPORT_MODE_PCSPP;
@@ -158,6 +177,7 @@ static int parport_config(struct pcmcia_device *link)
 failed:
 	parport_cs_release(link);
 	kfree(link->priv);
+    link->priv = NULL;
 	return -ENODEV;
 } /* parport_config */
 
-- 
2.43.0


-- 
::DISCLAIMER::

---------------------------------------------------------------------
The 
contents of this e-mail and any attachment(s) are confidential and
intended 
for the named recipient(s) only. Views or opinions, if any,
presented in 
this email are solely those of the author and may not
necessarily reflect 
the views or opinions of SSN Institutions (SSN) or its
affiliates. Any form 
of reproduction, dissemination, copying, disclosure,
modification, 
distribution and / or publication of this message without the
prior written 
consent of authorized representative of SSN is strictly
prohibited. If you 
have received this email in error please delete it and
notify the sender 
immediately.
---------------------------------------------------------------------
Header of this mail should have a valid DKIM signature for the domain 
ssn.edu.in <http://www.ssn.edu.in/>

