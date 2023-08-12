Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F8D77A028
	for <lists+linux-media@lfdr.de>; Sat, 12 Aug 2023 15:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjHLNgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Aug 2023 09:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjHLNgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Aug 2023 09:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C21E5F
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691847331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LWUaS7NQlyVmUvOWsuHR6yk3H626aGt3qLjVO+tF0NU=;
        b=D6nklPxfpYyBYHFaWM6/Ii5fQJEppc9A4ZG+W0DJ1Uoa6ab/1Jkljb/USuEEozZAJ7UgRJ
        U587KWGGCruaaTufERL7xZ+7uPpHNnnPQO2PFL8XMDBhNhqPOEk6MHWwYI2WBmXafeZoIn
        kC+C6mU8ThqulaNKlFYZ+EboZIDtOtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-AePcTKvIN8GSjzc_KUEF8A-1; Sat, 12 Aug 2023 09:35:29 -0400
X-MC-Unique: AePcTKvIN8GSjzc_KUEF8A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D158185A792;
        Sat, 12 Aug 2023 13:35:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B71A640C2063;
        Sat, 12 Aug 2023 13:35:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: atomisp: Drop VIDEO_ATOMISP_ISP2401 Kconfig option
Date:   Sat, 12 Aug 2023 15:35:23 +0200
Message-ID: <20230812133523.355581-2-hdegoede@redhat.com>
In-Reply-To: <20230812133523.355581-1-hdegoede@redhat.com>
References: <20230812133523.355581-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop the VIDEO_ATOMISP_ISP2401 Kconfig option and the -DISP2401
cflags.

This is no longer necessary since all ISP2400 vs ISP2401 differences
are now dealt with at runtime.

Many thanks to Kate Hsuan for all her work on this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/Kconfig  | 12 ------------
 drivers/staging/media/atomisp/Makefile |  4 ----
 drivers/staging/media/atomisp/TODO     |  3 ---
 3 files changed, 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index 5d8917160d41..8197b345a5a1 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -26,18 +26,6 @@ config VIDEO_ATOMISP
 	  To compile this driver as a module, choose M here: the
 	  module will be called atomisp
 
-config VIDEO_ATOMISP_ISP2401
-	bool "Use Intel Atom ISP on Cherrytail/Anniedale (ISP2401)"
-	depends on VIDEO_ATOMISP
-	help
-	  Enable support for Atom ISP2401-based boards.
-
-	  Select this option for  Anniedale (Merrifield+ / Moorefield)
-	  and Cherrytrail SoCs.
-
-	  Disabling it enables support for Atom ISP2400-based boards
-	  (Merrifield and Baytrail SoCs).
-
 if VIDEO_ATOMISP
 source "drivers/staging/media/atomisp/i2c/Kconfig"
 endif
diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index dcf469bf1cb4..fcd3e51ae9ce 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -301,8 +301,4 @@ DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 #DEFINES += -DPUNIT_CAMERA_BUSY
 #DEFINES += -DUSE_KMEM_CACHE
 
-ifeq ($(CONFIG_VIDEO_ATOMISP_ISP2401),y)
-DEFINES += -DISP2401
-endif
-
 ccflags-y += $(INCLUDES) $(DEFINES) -fno-common
diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index ecf8ba67b7af..d99cc898cd99 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -60,9 +60,6 @@ TODO
 
 2. Items which SHOULD also be fixed eventually:
 
-* Remove VIDEO_ATOMISP_ISP2401, making the driver to auto-detect the
-  register address differences between ISP2400 and ISP2401
-
 * The driver is intended to drive the PCI exposed versions of the device.
   It will not detect those devices enumerated via ACPI as a field of the
   i915 GPU driver (only a problem on BYT).
-- 
2.41.0

