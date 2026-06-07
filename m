Return-Path: <linux-media+bounces-64046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuFaCAA8JWo4EwIAu9opvQ
	(envelope-from <linux-media+bounces-64046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:38:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB764F3CC
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 11:38:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JjoYRAeX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64046-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64046-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2776830154AA
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 09:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E72386422;
	Sun,  7 Jun 2026 09:35:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C76377EC5
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 09:35:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780824936; cv=none; b=qXvWf2oOrtWVQov7CZf/IsPkDRTNl8t0L4Pm8AUNDGltPrpPI0tlPG2nZTaDY/f4wGizBFgbgytAKIxZ39nYGq6xgnH8KK/lxbsxzrlL4N1REnpnG3OkY9dIrQMSosPsZ5IeeT/SGcdOj1JhILHHfkiZOEYka3sTfnH2fJh12n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780824936; c=relaxed/simple;
	bh=zLCqfI2KUraSLz9KH/5Y26s/yPLc/CEzNqtohR4IRGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ClfDjy6DbtwOe3fxC6ny2KsTjT7Z/WH84sSGAmt68AswOgUXjv9znMB5RqHhMTnRdMpJ4IYj1jEEUa0R+s1l/FIrz2xYfKQilxlwweiWh3nIHnvsL52awpuobhnxtEn3D1mRlo2MgIGIlAOarWahGJxUMyokaoKP+qFzyPrHQE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjoYRAeX; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf30d530bdso34388265ad.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780824935; x=1781429735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXqLiv0ryX+iiE206r6yDGnu8izLUzYrW1MXuiWNlgg=;
        b=JjoYRAeX747mNq+tudHCTVgGJjHYO5BxvBu4mjyaDP3v5iTRv+L0hIZX4cSbdoThxz
         YeLOf8egpQFGH7mhIiC14dQ30KCWczitaetYZCEi/a2UVLmKHbVvQlvGbGcuY7toqacL
         x0GMI+FsudFP+GBPZjPmUmFsSZw6/fHhnZHXVgD2AsF75GzrhNkklM3ljE+XUewZ/Dit
         FWzQa/z7XWSfRssHTMiClCKe1lJCH0yvB1pbRAWyNJwRfRYw4hVyqRDY+YXRLUapU+gb
         TdgO3vUreXGxH2KJ69EfItgmC5U1OJW4evO/4FBhR2KtpF5MQf3IrEwUZ+/rlugkZy9f
         Bh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780824935; x=1781429735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXqLiv0ryX+iiE206r6yDGnu8izLUzYrW1MXuiWNlgg=;
        b=T/2zgN0dNfB7kzgxq0BeVE+ysVy7aJV7AMa/WLOqGEU7yxqlNB3COA4lGdAQ9yvMLJ
         luyhVYzC6i9RcUTPl9eWlTGNPoHW7VzPtShtCO9GJ4h75Fsmg3+W4QiB4IUtHqDiuhSs
         GU+GI8txeimhmEwYW0cn3TR1EcNNpFwvX5Qw2ndDkIZkmwx/OuLoOvjyUI2AqpWpW26g
         hdsbZ3UUb3NDa2L8v/OqJjVy6zONosQIkqTVRP4V/T2Cv1l/LipozPyk7dbfO3BKV+F2
         1rsLARdg1Vi/II6HoGGWFsI9Y/5Y7GmUlVV6LK9IX0DHbJpZLSStNCJ//rP8DMDtkNTC
         K62w==
X-Gm-Message-State: AOJu0YyT7nVD3VDz3z96+5zt8q8uNOw5uN/G9N9yfmYYFs180WO48V0d
	lTmU2M4bRf1OYbuCRR4Gr/c3UfJgsdvaYgllPKVD0JOZj+354E3sQDrl
X-Gm-Gg: Acq92OFxOpLNJHLJYJfNI0HMojhQcnB1YdzPhFEeNMb8xl4tXwgYdhsyY6iimUCltCD
	8PyPV96CEoq5Xo0Sb9IeSiKk4C2w6cgjXjoJRURmZUScTYn1AqQkzSQDqNSjed2H4pxcBgoWYov
	TjAiTDSJO786eUD9wTFZC44PdUVhqLmpIYQZuUswS1BVST3BdRMGQTWcTHMj1c2tizzBytRzfBH
	mtgnsMST8r3u0fnYVsOQ+gS8mEZhHc0G6/SIiNRIhRPTVzO2ewBYu2Dl70ecLAu21z6odWJRCK9
	bhjdo0X1CwDO2DO1XvSLxct6v6L5WFjNYKL1mtC1gWyqHsXTVNopXF9u8B7nLAuFYAdiDpiC+ex
	XUJbDXfidaJH4kP9twyQDVQzM7IU7S4PGVJCqkDBCs8bIBIFRiQscZtk92TmIiTwwGGC767C3Jb
	R8kDs53J0iJnk5pq8KADpk1zqbT51Y3adtBc3QBdRTqaBZxbXFGsF2
X-Received: by 2002:a17:903:2389:b0:2bf:305a:312a with SMTP id d9443c01a7336-2c1e820985amr130015775ad.22.1780824934589;
        Sun, 07 Jun 2026 02:35:34 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:5d57:2cec:64ac:50a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm150845545ad.29.2026.06.07.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:35:34 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: bt878: check register mapping in probe
Date: Sun,  7 Jun 2026 17:35:30 +0800
Message-ID: <20260607093530.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64046-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2BB764F3CC

bt878_probe() maps the device register window and then immediately clears
the interrupt mask through btwrite(). If ioremap() fails, the register
write dereferences a NULL mapping.

Check the mapping before touching the registers, and unmap it again on
later probe failures after the IRQ or DMA buffer allocation paths fail.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/pci/bt8xx/bt878.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 62a6c4a80..245a5f0ef 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -445,6 +445,10 @@ static int bt878_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	bt->bt878_mem = (unsigned char *) bt->bt878_adr;
 #else
 	bt->bt878_mem = ioremap(bt->bt878_adr, 0x1000);
+	if (!bt->bt878_mem) {
+		result = -ENOMEM;
+		goto fail1;
+	}
 #endif
 
 	/* clear interrupt mask */
@@ -486,6 +490,12 @@ static int bt878_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
       fail2:
 	free_irq(bt->irq, bt);
       fail1:
+#ifndef __sparc__
+	if (bt->bt878_mem) {
+		iounmap(bt->bt878_mem);
+		bt->bt878_mem = NULL;
+	}
+#endif
 	release_mem_region(pci_resource_start(bt->dev, 0),
 			   pci_resource_len(bt->dev, 0));
       fail0:
-- 
2.51.0


