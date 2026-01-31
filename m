Return-Path: <linux-media+bounces-51870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFOvDYVifWkrRwIAu9opvQ
	(envelope-from <linux-media+bounces-51870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 03:01:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D827C02F2
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 03:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0F5F30247DF
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 02:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E79B2EAB83;
	Sat, 31 Jan 2026 02:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjXsVduB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7D2DB787
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 02:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824870; cv=none; b=bV/8+5xrg20nctScsnRgd2klOnCCyHsTwImocvKnz1w/f5F2cMB3Qrs6ubYGTaLSN5DiHiIQNajUwSYR2AFzGFtFvqk3sfI7BgF+8M7gmtvNFgjEWe/sntHeZv+78P+PYcL9kpz++91Kz1yOrH08U9zE7JH9Lv2tiS7pqt8bor0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824870; c=relaxed/simple;
	bh=J2cucYUpSwkFxhZZHTc2VNySs+b/F5L3SrE4e5t5Z0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+zWvZAnP1Xk3rDSgdCPK9CFThCeSZWgRa0djPbReSnHNKJPQ87RCLKQWZgVa+H2YRDPlJbfuJWiVCz0HmSuw6oqkn0xemIwEcBMhwkFbFkwpf8WObVHoLU4fJ3J3wHrc7MrEZS5vcuqJKnpsXt2ZkMyrP5gZrKGpni8vtUjuxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjXsVduB; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124899ee9d3so2030292c88.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 18:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824868; x=1770429668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dF4n5IF6I/vDZ01cqKrK/H1loj2asnvt61WDpBLXHOI=;
        b=mjXsVduBxvLVU/ZObkRBuXwuHTOWU198M6sGcbxbKN8ycE289BftM1H/Q7Qqd3RNsK
         u6zt54vZyEp1iHhFSZlZhVJF4T81VFGAokk9sFnryD9ultr9s+l/Ja0f5fVsPR4jhcus
         k45FwzB0utQyFtCuQpwyJp2rDohbQrqtn6/bDZ45i5USF2MhKT6KPnH0/6F45L1ine2v
         Y2KOL0ONeMsCJctaTcEVp6/imgXIPh5wPSN6ohbWeaVas6pDooosNotBjiksbViiqR9N
         SvwNL1/SOTkk2xV4LsPvEO0ZCLKwJTtLKbCQde+zF7EUEi0tWfu3sVVlbnmoTFAzz6G4
         oSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824868; x=1770429668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4n5IF6I/vDZ01cqKrK/H1loj2asnvt61WDpBLXHOI=;
        b=ik17rTtbQs1tthTRCRJYwmTfRLxIsJJyfZNpGc3IDqqJIAHiHqU8LwtykfeXhkTasO
         GgMpagcHz7YmjuEVPrrakz5OdhiZOr7s38zMwauexd9j0p1O/j5OAZ8TAowTyw5YtLpF
         UCqrK4fZheB53N3n6VnX45ckmmq8z80ru67cdS3aNVkLVUuw6Qply1HG4aCG1ZcRYOTs
         RjQm691sKEYwLs3Y3cikXso+/he4zy3PHM5MJALsUdneqj8UrGewzrzwxsQXMBXPYVZJ
         GtpyiBnBC0d7OHwycozq8VtJwHTWAoqjvyskXuS8wzqr0MGG/LZLMihW/98xfrVfihh+
         Eklg==
X-Gm-Message-State: AOJu0Ywj3viD+TiNTDirbpGHmi8mKeiOZWHYtPVoUImad26g1wRPzZG3
	yLY39Ev0GafEz8SWUFBPjyChN0vaxi4n4LLOw0igavkhC1xO097yK+nlPbRxJ4EB
X-Gm-Gg: AZuq6aLqJWjFVbE7UmWpPSwl57U380k+gUpuXjCSKtYVnLMNrtyDXZnAkCCr+DquiE4
	VdJ2fsXI7w5TT0fI07PdDcDkHStLWHxdS/LMWX6QampB71qi2A1AO5dg1f68OZfIsLqDQk6NAZB
	qFtcakPMZRclwJZudwe3/AGcf8XHoyMLi5AuNVeGipBRfoFJneRQRNSvsAIhJG5/xyuiH1QGIUn
	H9eS+eEIpWGVfP5A3LoMDSzpLdwgQKQMFR8bSD8XSqW07v/um9LzYXicgWNwBab/lcYF1g7DYyp
	p1rq1dn65qnj/xvalWJIbUYkCUSl8iqpGtN2ch5jESqFQXNJaIZVtZSsUhsax+v0ZzNHzEGBLqj
	BVtciKbf2XkIBQvVpjAq1SVURRYTBW8H/5z2/OZ8owe9lWxDmJSOACQuDtm5DttFmDAAK00UM2K
	LXreGQNAgTq3KnY9WV/y0EFMnVRFjv/qaEwzJZIaSnFE/NRTH7Q9Pz64aY6R/o8pGyHgMQPgx+N
	BoDcm2oOcPzSrt/Fz7rrky6Pxd3OrwD/1LAOhS0vDnT/qRq/PwQb8JZccpfqxDt4nFJyJgxtc3m
	n+zP7svccOC+5DU=
X-Received: by 2002:a05:7022:6985:b0:122:3df:fccb with SMTP id a92af1059eb24-124b1028575mr4183085c88.10.1769824868206;
        Fri, 30 Jan 2026 18:01:08 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm12172447c88.7.2026.01.30.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:01:07 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: remove unnecessary module_init/exit functions
Date: Fri, 30 Jan 2026 18:00:47 -0800
Message-ID: <20260131020057.46029-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.dev,ideasonboard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51870-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mihu.de:email]
X-Rspamd-Queue-Id: 8D827C02F2
X-Rspamd-Action: no action

Three media drivers have unnecessary module_init and module_exit
functions that are empty or just print a message. Remove them. Note
that if a module_init function exists, a module_exit function must also
exist; otherwise, the module cannot be unloaded.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/common/b2c2/flexcop.c         | 14 --------------
 drivers/media/common/saa7146/saa7146_fops.c | 13 -------------
 drivers/media/usb/gspca/gspca.c             | 13 -------------
 3 files changed, 40 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index 8506de48ba45..1572831be5b8 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -292,20 +292,6 @@ void flexcop_device_exit(struct flexcop_device *fc)
 }
 EXPORT_SYMBOL(flexcop_device_exit);
 
-static int flexcop_module_init(void)
-{
-	info(DRIVER_NAME " loaded successfully");
-	return 0;
-}
-
-static void flexcop_module_cleanup(void)
-{
-	info(DRIVER_NAME " unloaded successfully");
-}
-
-module_init(flexcop_module_init);
-module_exit(flexcop_module_cleanup);
-
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_NAME);
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/common/saa7146/saa7146_fops.c b/drivers/media/common/saa7146/saa7146_fops.c
index a9e3bad76d54..c0166684eff8 100644
--- a/drivers/media/common/saa7146/saa7146_fops.c
+++ b/drivers/media/common/saa7146/saa7146_fops.c
@@ -417,19 +417,6 @@ int saa7146_unregister_device(struct video_device *vfd, struct saa7146_dev *dev)
 }
 EXPORT_SYMBOL_GPL(saa7146_unregister_device);
 
-static int __init saa7146_vv_init_module(void)
-{
-	return 0;
-}
-
-
-static void __exit saa7146_vv_cleanup_module(void)
-{
-}
-
-module_init(saa7146_vv_init_module);
-module_exit(saa7146_vv_cleanup_module);
-
 MODULE_AUTHOR("Michael Hunold <michael@mihu.de>");
 MODULE_DESCRIPTION("video4linux driver for saa7146-based hardware");
 MODULE_LICENSE("GPL");
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 3fc15d16df8e..f3d3f441c851 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -1701,19 +1701,6 @@ int gspca_resume(struct usb_interface *intf)
 EXPORT_SYMBOL(gspca_resume);
 #endif
 
-/* -- module insert / remove -- */
-static int __init gspca_init(void)
-{
-	pr_info("v" GSPCA_VERSION " registered\n");
-	return 0;
-}
-static void __exit gspca_exit(void)
-{
-}
-
-module_init(gspca_init);
-module_exit(gspca_exit);
-
 module_param_named(debug, gspca_debug, int, 0644);
 MODULE_PARM_DESC(debug,
 		"1:probe 2:config 3:stream 4:frame 5:packet 6:usbi 7:usbo");
-- 
2.43.0


