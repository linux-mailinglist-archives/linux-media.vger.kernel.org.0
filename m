Return-Path: <linux-media+bounces-64754-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YzBcALgVLWoKbQQAu9opvQ
	(envelope-from <linux-media+bounces-64754-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:32:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEEA67E244
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 10:32:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Eq/2BVYI";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64754-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64754-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7E1D30144F8
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 08:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFD03A544B;
	Sat, 13 Jun 2026 08:32:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D11FC7FB
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 08:32:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339564; cv=none; b=qGto7J7JLbv6jfpjF6YNr0GzS1Mbw/xzMbMUpnp15rzbNwsts607ftXpC68N7wB6AWEhJi/XYj462LbOKmxQj3Pj37x2trKRmZEI5tZMxPoi7IVIBgZoLy1Ix+mnV3zSYch33Fa0zJdCbi1otAukOm8gZROV6+2OeHQbQpNwIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339564; c=relaxed/simple;
	bh=uPKIkZlhYoBQCHSj4lKsMmL61hDT6UcJ+fB+zDBMb6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXa0PobL0ZuwCKX3dd3oKsM9G67CkjFdtsc1D3KotQ1owLb8+rzmJbzPgS7HCKhagBk4aNeavOMNiD1k7KfT3sGrYpvbwRZQhbfgVjzVLkFN89w00tUNm6YI3XQ+uhbjpWddtamxhQM1JuJriv8FAUfQFjB/4Xxbm3sYdAiv3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eq/2BVYI; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf2247e38eso16399175ad.3
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 01:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339562; x=1781944362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yo0ZagI1wjHBIRxCvM8uk+CoeAPsq0DsPwmR+5mIpTo=;
        b=Eq/2BVYICw9UENPsbFrUiiui6PaazfbJDOpvQ16SsYgYvsKeHPJfmkONaMgwBSla9b
         gAfIKEUmEu+I5Fd+zPnj2KnBKZKUN1iYNKBwJfKXoI6/ENk0SVvCVJHh2hn27WGyTJPH
         f5RDOYvU1M5LQNdC0gZPtJvBB7tmbZ7ZANW1A6qCd5Y5lnGbj5DBJKma2+5UDuzz37fU
         3JDfEwwGwMZ0tnE6Lrf467OJKx5fD3wiciGP3sN53r9Nx4U9n4uK4nz8ljBTPfZ+ILFj
         rMN2LQ1TXldHGnEyPNCutKScyvNjxJwCCZOZCCfZkRrkXZCm09ggnURC+ul+B0WveK8G
         d5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339562; x=1781944362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo0ZagI1wjHBIRxCvM8uk+CoeAPsq0DsPwmR+5mIpTo=;
        b=aQwsv0O8PWqqNyv8MMP4dpqUw0wzr3hWywQeWuSzKvdRO0P4EI7P6PtJN5Rth6WReQ
         78yGh5Dc+5jpqDWExTz4WKo1b1IfaTbYxo2Dg9DX4iS13z6R12Szg0c9qO+bxnHVMXm5
         UlpDVYhroRkpwl1JbiFcuvfPKZWyIr4PHBDtPzP7G2iD1cN3f+zpkSqNja2fcwMYDs+g
         jtFe7GZtTdjEfQpKvKuAYJQJakiJ612P/Z/O7SkiXkDQLnQo6FtCFusnakD0l9/oF0be
         T4UMvO2QbIdZkTGMl182xlTrsE2rkc3J1IixkpwYbU2Ca1KE9HR6XuEMqr0pUerWD39d
         womQ==
X-Gm-Message-State: AOJu0Yw6C5S6kRrwAlDDPwspa3HKNlXGrYEZFhQza7TCKE1GLfXH8jg+
	w6prv7QYT6QSKVhFY5ZSHTJUFkmyWSrYG1GKVcoHMg4swurWxVXaOR6DjtDUoVDE
X-Gm-Gg: Acq92OF2TYyol5uCDF7zUnp+GEXPaDJ7huvBXb+j4hOIaBvrmwIStDFdXEWZayDKYC7
	rEnpTKp2onHwZz/w5z4GJ8FeTh2sCzBZEttkvh+oc3dYJ4J3GMY+NsVbvJbEJCMb0VDHwxSi5FA
	rpCOU3NV4g4XBLQaigFw9RjObhIJkH4GrmcGbxTiWGdwasexvRvUJxBu8vl0l4Igbcu/XM9xFLr
	rLkDCnFHZWwM5cbAAsdwo+XSLyDJs6HIyWxWOYhThT9ondGiP1q6flAXdxlgogvvMZCkFr69w6h
	USPbvfoUB5taz1bW2Ni5WCr9bNiuZjljMXd+MQf3lX2Ix1PonwGl2DMuBGMU/DT4ED3DKYvs+EU
	x9MWYiy2C4ZiFaYHhapJ8tc420AnwP1yNORSY5Gv3MdyXK9Nc2GxZI2Y2vsxiidlMzcK62p5IoF
	ksrZxZQaXH8L9B2KMtQMcDTe6P/qVon8BgklxB63j1k+Om6ZaZ/XtH
X-Received: by 2002:a17:902:e74e:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c410fbb865mr77312415ad.13.1781339561710;
        Sat, 13 Jun 2026 01:32:41 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4424sm42665865ad.31.2026.06.13.01.32.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Jun 2026 01:32:41 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dongchun.zhu@mediatek.com,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov02a10: fix endpoint parsing use-after-free and error leak
Date: Sat, 13 Jun 2026 14:02:35 +0530
Message-ID: <20260613083235.57363-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,mediatek.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64754-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:dongchun.zhu@mediatek.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DEEA67E244

The ov02a10_check_hwcfg() function calls fwnode_handle_put(ep)
immediately after allocating and parsing the endpoint. However, it
subsequently calls fwnode_property_read_u32() using the same 'ep'
handle, leading to a potential use-after-free.

Additionally, reading the optional 'ovti,mipi-clock-voltage' property
used to overwrite the 'ret' variable. If the property was missing,
'ret' would become negative, and this failure code would be incorrectly
returned at the end of the function, causing probe to fail entirely.

Fix the use-after-free by moving fwnode_handle_put(ep) to the end of
the endpoint property reading block, and adding it to the error path of
v4l2_fwnode_endpoint_alloc_parse().

Fix the error leak by avoiding assigning the result of
fwnode_property_read_u32() to 'ret'.

Fixes: cf10e09b9a4b ("media: i2c: Add OV02A10 image sensor driver")
Cc: stable@vger.kernel.org

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/ov02a10.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 143dcfe..53ff86b 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -821,9 +821,10 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 		return -ENXIO;
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
+	if (ret) {
+		fwnode_handle_put(ep);
 		return ret;
+	}
 
 	/* Optional indication of MIPI clock voltage unit */
 	ret = fwnode_property_read_u32(ep, "ovti,mipi-clock-voltage",
@@ -832,6 +833,8 @@ static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
 	if (!ret)
 		ov02a10->mipi_clock_voltage = clk_volt;
 
+	fwnode_handle_put(ep);
+
 	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
 		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
 			if (link_freq_menu_items[i] ==
-- 
2.50.1 (Apple Git-155)


