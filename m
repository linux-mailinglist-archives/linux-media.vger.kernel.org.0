Return-Path: <linux-media+bounces-23437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 392879F2462
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 15:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ED9C1885EB0
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91C818FC81;
	Sun, 15 Dec 2024 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QpMKEeOW"
X-Original-To: linux-media@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AE23DE;
	Sun, 15 Dec 2024 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734272516; cv=none; b=s4VXrpTBcotaVt15vWP9YSDzVccjpfoofz1f8OIndfq7rEbYth0Gn8t1i7j6h64l+0IQ/Tlx4l1sp2jA73B3Qv9OQknLP0kQX2pftve8IqzR+TnQub2fXUyXCE9XGOGql2eYyAeRk0sVe96HSvaz7Bs+ag8BgqgkOiWWlhnj1M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734272516; c=relaxed/simple;
	bh=u8nZPxK0i8KA1QTMFxhbt+twdVtzSqJK5KM790JBX50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EuwaMD+S20aixpJMLAPEBqqbTL2BXA3QbAmR8xXgJEu7We9ZD5g+7fA9ABOr/yozes6d+DOOuNa49bQ3ytnxkB7vbNelYCtox5Ix6n1LXYBCTS16m/58tQLBcJ1FDt0OJwudhGZLEGxe/o2dpY8NXB/ujMZ9nnDG4nd8pXedIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QpMKEeOW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734272511;
	bh=u8nZPxK0i8KA1QTMFxhbt+twdVtzSqJK5KM790JBX50=;
	h=From:Date:Subject:To:Cc:From;
	b=QpMKEeOWujiX5W/lo5O4ih4AVAKMTXYeZ2L919Oofy9oINvMjyMC9JTfPPSkwRBgz
	 EAzkRPgE+9Yc0ditoWu/zxpquMqcvhUVQSEnPCDjCSJznZdeahFNlkkj8hS4oXuPcI
	 sYODVv+WHcGyWZye0jAUYZb+fwA7Mj4povUf77uo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 15:21:45 +0100
Subject: [PATCH] media: solo6x10: Use const 'struct bin_attribute' callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-solo6x10-v1-1-373d10eb2c00@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAPjlXmcC/x3MwQqDMAwA0F+RnA2Ybu1hvzJE1KYzIK00RRziv
 1s8vss7QTkLK3yaEzLvopJiBbUNzMsYf4ziq8F05k2GLOpfg+KcohacJA5jKRk1rckd1CG5KXh
 n3St4C/XYMgc5nv/bX9cN3HheL28AAAA=
X-Change-ID: 20241215-sysfs-const-bin_attr-solo6x10-16bfd6563fd5
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734272511; l=1471;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=u8nZPxK0i8KA1QTMFxhbt+twdVtzSqJK5KM790JBX50=;
 b=B8r2vkUSXDa3q2Gsd3rWmkDsaAs6F7NXQbDLIx1dnVEaLaE+dVF8Isw0gPWTB8dNlCBsoKhzL
 ogNjeNqDw5fAed2CqVJQqOKHFysKyuz0098CzLivhZ0Di+gvyeUyrTH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now provides callback variants that explicitly take a
const pointer. Use them so the non-const variants can be removed.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/media/pci/solo6x10/solo6x10-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index 1a9e2bccc4136abce16415b00279434e12b383d9..6ec1480a6d18acdc6377214d8c4d45135a2fff86 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -362,7 +362,7 @@ static ssize_t sdram_offsets_show(struct device *dev,
 }
 
 static ssize_t sdram_show(struct file *file, struct kobject *kobj,
-			  struct bin_attribute *a, char *buf,
+			  const struct bin_attribute *a, char *buf,
 			  loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -432,7 +432,7 @@ static int solo_sysfs_init(struct solo_dev *solo_dev)
 	sysfs_attr_init(&sdram_attr->attr);
 	sdram_attr->attr.name = "sdram";
 	sdram_attr->attr.mode = 0440;
-	sdram_attr->read = sdram_show;
+	sdram_attr->read_new = sdram_show;
 	sdram_attr->size = solo_dev->sdram_size;
 
 	if (device_create_bin_file(dev, sdram_attr)) {

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-solo6x10-16bfd6563fd5

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


