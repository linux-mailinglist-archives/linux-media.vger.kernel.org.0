Return-Path: <linux-media+bounces-23436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB29F245E
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 15:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71E8A7A1180
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 14:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E6718FC7E;
	Sun, 15 Dec 2024 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="h5+u3p4m"
X-Original-To: linux-media@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD523DE;
	Sun, 15 Dec 2024 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734272319; cv=none; b=t3qWi0JfI8GwVl5RHSJarCijtJzVwjIYpUr57Q68jlF9FLKn1wPRn+zDOqy7dZL0KPV+b6yJkVk0nWSqUUJ4cCcHttLICcGNnZoK/86IFDyvf/jzfoLZ7wosfcuMZ5wEy+1/bI6+a19V2dFqeNA+U5fCWlOofzdUV57UxFJqV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734272319; c=relaxed/simple;
	bh=/sQHi6EZ4SoGEI6OhVIEguxc8UYM7q7N+ZeX60FnSf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=geTChf4upVK4XZ5djHoHrkNO6IyR/occ0xZsVVXHzI15racr2n/Bh37LUvNHHInncHbc0k26QEeeY/95XiBYadzZUWN3VwCwCRzMxQ4pxgwOv3twquzZt4baLekeBlORQldLBb3xcCarbyyWw+YAsspITexkOtptV+VOA/n7tBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=h5+u3p4m; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734272315;
	bh=/sQHi6EZ4SoGEI6OhVIEguxc8UYM7q7N+ZeX60FnSf4=;
	h=From:Date:Subject:To:Cc:From;
	b=h5+u3p4mVmI8VSuTB8sy16GNtMXccShfSjcouttepq1GVWJaFukCusQWfcYp5yMLe
	 yt5fpEaHGAxXF4jXodULXBxIoAtrXSMFxfjS1GJTmosD1D9nY1EJho5czsUK8JQ1pI
	 3XDXtB3qe0MrjIIvdIhL1irLkpPPU0f+tv17JPq4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 15 Dec 2024 15:18:33 +0100
Subject: [PATCH] media: i2c: imx208: Use const 'struct bin_attribute'
 callback
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241215-sysfs-const-bin_attr-imx208-v1-1-0ad57556c5d7@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIADjlXmcC/x3MwQqDMAwA0F+RnBdoyorir4iMrks1B6s0ZVTEf
 1/Z8V3eBcpZWGHsLsj8FZU9NdCjg7D6tDDKpxmssU+y5FBPjYphT1rwLenlS8koW7VmQONdT4F
 CdMZDG47MUep/n+b7/gH4h5U0bQAAAA==
X-Change-ID: 20241215-sysfs-const-bin_attr-imx208-0a571c1cf50a
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734272314; l=1045;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=/sQHi6EZ4SoGEI6OhVIEguxc8UYM7q7N+ZeX60FnSf4=;
 b=4puP4VZkfMc3OxiC/DEPmiF+KY7Dzs433AeMufeS/DOv1oiHyfM7OO177wyUIDQM8EkdNe9dP
 f8kJkeVNPm/B4LX7qT1ahIOeXUIlAeqTZSCfiqTGsYjOJKktTg7hLEH
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now provides callback variants that explicitly take a
const pointer. Make use of it to match the attribute definition.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/media/i2c/imx208.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 2184c90f7864d4f69855e57cdcdd87396b77df87..2b5a6ce7b1ae6ee120c1aacd9bef62c2078af833 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -814,7 +814,7 @@ static int imx208_read_otp(struct imx208 *imx208)
 }
 
 static ssize_t otp_read(struct file *filp, struct kobject *kobj,
-			struct bin_attribute *bin_attr,
+			const struct bin_attribute *bin_attr,
 			char *buf, loff_t off, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(kobj_to_dev(kobj));

---
base-commit: 2d8308bf5b67dff50262d8a9260a50113b3628c6
change-id: 20241215-sysfs-const-bin_attr-imx208-0a571c1cf50a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


