Return-Path: <linux-media+bounces-21047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7879C02E6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 11:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7376A1C21DB4
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138BA1EF08E;
	Thu,  7 Nov 2024 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJmf04Lo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8321EF097
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976582; cv=none; b=I+fF8xBsZqkCXAD//5rUi6zYcEAhI1QH6bD+TJ1mbpwo7TbwSJKgwliS4oqNhP8qTy2m6A1/LMcA4gJpBzRA3Ul8smZxyrKhTpmjr6sj83dV2AqROq9LYmZn5lznbBQa/Cz4ioiN1ep4JM4uUciPkGhuwTNhy/rqzWr/+HRprQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976582; c=relaxed/simple;
	bh=N6gxq4txE8IMqQjnpSjB6KKPFupDl1rpCErBvTv63k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwyDQum8acmWZsJ2WWOmdtRryVcO7IpcEzdwB4t4tgV8nqmS6vfev9kFep0v7Lub9fAYICExB9PaC2D2iPCHX0ygVo09XqtgWDVpGw+pJ7Eh4jOiX3st5eaJC6+JJS8eqcG74amnFzutk3ugUPb38PEgZUtj0tsVugsjZlI6Lb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJmf04Lo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730976579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=76GaoI35Nv1l2CfX1dWTekftwF759WCk+Ljllj9qEcU=;
	b=dJmf04LosCMQmEF6cfqi+hRmD2y2UiFWkLMwXnZEZy1aN/VO+6W/jntSX6EPJ9/rbPW3LG
	CCQabLDxu9pz7FM661o9UuzByC8gI3RsrBjI7D8JaEhfg8Rlc81asQ0x0iIyiaYgpV9bon
	+/rsxFgJ8XW4hl6vtSOkeRz6hy1u6mc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-ipj-O8y0MFGpRg3-OtfEFw-1; Thu,
 07 Nov 2024 05:49:33 -0500
X-MC-Unique: ipj-O8y0MFGpRg3-OtfEFw-1
X-Mimecast-MFC-AGG-ID: ipj-O8y0MFGpRg3-OtfEFw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 200381955F77;
	Thu,  7 Nov 2024 10:49:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.177])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 18F8C1953882;
	Thu,  7 Nov 2024 10:49:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] media: i2c: Automatically select common options for lens drivers
Date: Thu,  7 Nov 2024 11:49:25 +0100
Message-ID: <20241107104926.257636-2-hdegoede@redhat.com>
In-Reply-To: <20241107104926.257636-1-hdegoede@redhat.com>
References: <20241107104926.257636-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

In commit 7d3c7d2a2914 ("media: i2c: Add a camera sensor top level menu")
a top level menu was added for sensor drivers so that all sensor drivers
would depend on I2C and so that MEDIA_CONTROLLER, FWNODE and
VIDEO_V4L2_SUBDEV_API would be automatically selected for all sensor
drivers.

All lens drivers must depend on I2C and VIDEO_DEV and must select
MEDIA_CONTROLLER, V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API and most already
do, but e.g. VIDEO_V4L2_SUBDEV_API is not consistenly selected.

Change the "Lens drivers" menu into a menuconfig option with
the necessary depends and selects. This ensures that these options are
depended on / selected consistently and simplifies the Kconfig snippets
for the various lens voice coil drivers.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411061152.VKd9JYpa-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/Kconfig | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 65cfe6cae8cc..0a30f309cd6b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -742,24 +742,25 @@ config VIDEO_THP7312
 
 endmenu
 
-menu "Lens drivers"
-	visible if MEDIA_CAMERA_SUPPORT
+menuconfig VIDEO_CAMERA_LENS
+	bool "Lens drivers"
+	depends on MEDIA_CAMERA_SUPPORT && I2C
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default y
+
+if VIDEO_CAMERA_LENS
 
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
-	depends on GPIOLIB && I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select V4L2_ASYNC
+	depends on GPIOLIB
 	help
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
 
 config VIDEO_AK7375
 	tristate "AK7375 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	help
 	  This is a driver for the AK7375 camera lens voice coil.
 	  AK7375 is a 12 bit DAC with 120mA output current sink
@@ -768,10 +769,6 @@ config VIDEO_AK7375
 
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9714 camera lens voice coil.
 	  DW9714 is a 10 bit DAC with 120mA output current sink
@@ -780,10 +777,6 @@ config VIDEO_DW9714
 
 config VIDEO_DW9719
 	tristate "DW9719 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	select V4L2_CCI_I2C
 	help
 	  This is a driver for the DW9719 camera lens voice coil.
@@ -792,10 +785,6 @@ config VIDEO_DW9719
 
 config VIDEO_DW9768
 	tristate "DW9768 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_FWNODE
 	help
 	  This is a driver for the DW9768 camera lens voice coil.
 	  DW9768 is a 10 bit DAC with 100mA output current sink
@@ -804,17 +793,13 @@ config VIDEO_DW9768
 
 config VIDEO_DW9807_VCM
 	tristate "DW9807 lens voice coil support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9807 camera lens voice coil.
 	  DW9807 is a 10 bit DAC with 100mA output current sink
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
-endmenu
+endif
 
 menu "Flash devices"
 	visible if MEDIA_CAMERA_SUPPORT
-- 
2.47.0


