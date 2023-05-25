Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD67711705
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242277AbjEYTPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 15:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbjEYTPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 15:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B311702
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685041467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5E+wv57I+Cweh/lUUslprHQqaBNepL0KFdc/bDsD5bw=;
        b=i4UDEcEYJ+p9yUIUu6xo/qUmOcMo5SnEUkC3fRr35/sjAh3CGJdC04/gnO2Oq6T2lWhMFV
        F+xqAw5e30iGaWFGFKwWOGZcntbDozXqPtBpvAmNRX1gMU0hFHHo3NB+IFRClUY5iaUnja
        dqdZIoCqrcHRiX92ffwGEERRdUibL3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-uenAK2WTO9yc13IaGIiNyg-1; Thu, 25 May 2023 15:01:15 -0400
X-MC-Unique: uenAK2WTO9yc13IaGIiNyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC9358032F1;
        Thu, 25 May 2023 19:01:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3FEBA40C1258;
        Thu, 25 May 2023 19:01:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 5/5] media: Move gc0310 sensor drivers to drivers/media/i2c/
Date:   Thu, 25 May 2023 21:01:00 +0200
Message-Id: <20230525190100.130010-6-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
References: <20230525190100.130010-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp gc0310 sensor driver has now been fully converted to
a standard v4l2 sensor driver. Move it to drivers/media/i2c/
to reflect this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/Kconfig                              | 10 ++++++++++
 drivers/media/i2c/Makefile                             |  1 +
 .../i2c/atomisp-gc0310.c => media/i2c/gc0310.c}        |  0
 drivers/staging/media/atomisp/i2c/Kconfig              |  8 --------
 drivers/staging/media/atomisp/i2c/Makefile             |  1 -
 5 files changed, 11 insertions(+), 9 deletions(-)
 rename drivers/{staging/media/atomisp/i2c/atomisp-gc0310.c => media/i2c/gc0310.c} (100%)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0e5a69d5d7ff..8f55155afe67 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -47,6 +47,16 @@ config VIDEO_AR0521
 	  To compile this driver as a module, choose M here: the
 	  module will be called ar0521.
 
+config VIDEO_GC0310
+	tristate "GalaxyCore GC0310 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor-level driver for the GalaxyCore
+	  GC0310 0.3MP sensor.
+
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 2a68bfb621b0..1376b0558228 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_VIDEO_DW9719) += dw9719.o
 obj-$(CONFIG_VIDEO_DW9768) += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
+obj-$(CONFIG_VIDEO_GC0310) += gc0310.o
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/media/i2c/gc0310.c
similarity index 100%
rename from drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
rename to drivers/media/i2c/gc0310.c
diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index e726101b24e4..16b6b808d4a7 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -49,14 +49,6 @@ config VIDEO_ATOMISP_MT9M114
 
 	  It currently only works with the atomisp driver.
 
-config VIDEO_ATOMISP_GC0310
-	tristate "GC0310 sensor support"
-	depends on ACPI
-	depends on I2C && VIDEO_DEV
-	help
-	  This is a Video4Linux2 sensor-level driver for the Galaxycore
-	  GC0310 0.3MP sensor.
-
 config VIDEO_ATOMISP_OV2680
 	tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
diff --git a/drivers/staging/media/atomisp/i2c/Makefile b/drivers/staging/media/atomisp/i2c/Makefile
index 8d022986e199..5c5c8acd73cf 100644
--- a/drivers/staging/media/atomisp/i2c/Makefile
+++ b/drivers/staging/media/atomisp/i2c/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_VIDEO_ATOMISP_MT9M114)    += atomisp-mt9m114.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC2235)     += atomisp-gc2235.o
 obj-$(CONFIG_VIDEO_ATOMISP_OV2722)     += atomisp-ov2722.o
 obj-$(CONFIG_VIDEO_ATOMISP_OV2680)     += atomisp-ov2680.o
-obj-$(CONFIG_VIDEO_ATOMISP_GC0310)     += atomisp-gc0310.o
 
 obj-$(CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER) += atomisp-libmsrlisthelper.o
 
-- 
2.40.1

