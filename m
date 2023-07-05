Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C326F748FDE
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 23:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjGEVdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 17:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbjGEVcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 17:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB70B1BDC
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688592645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=POvUSrAQeac4J46aC8T80jZksu0kSO/4Ef80qxnycQc=;
        b=TYLsJl4lfQF+/RshZkWvzhPy1Y8M1DgAogFTMlMYMZs9jKe5ePadJ+8OwpumFuqqfolKZ2
        F/Q4WcRi+TVOTy5PWIAtypqVdW9ZoIRgB9XZenv8fiLPXHVV/4QB/Ij5QLmckAc8Mqazpx
        5Jo+MnXe6PjDYqNf7xbmLPl3J91440I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-iJZWaImkPFOKPelEcLb0Pw-1; Wed, 05 Jul 2023 17:30:41 -0400
X-MC-Unique: iJZWaImkPFOKPelEcLb0Pw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDAF51C4FD82;
        Wed,  5 Jul 2023 21:30:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE0C40C2063;
        Wed,  5 Jul 2023 21:30:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 11/18] media: ipu-bridge: Move ipu-bridge.h to include/media/
Date:   Wed,  5 Jul 2023 23:30:03 +0200
Message-ID: <20230705213010.390849-12-hdegoede@redhat.com>
In-Reply-To: <20230705213010.390849-1-hdegoede@redhat.com>
References: <20230705213010.390849-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move ipu-bridge.h to include/media/, so that it can also be used by
the atomisp code.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c                    | 4 ++--
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                | 3 ++-
 {drivers/media/pci/intel => include/media}/ipu-bridge.h | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename {drivers/media/pci/intel => include/media}/ipu-bridge.h (100%)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index db67a75ae1b7..277711db867a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -5,9 +5,9 @@
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
-#include <media/v4l2-fwnode.h>
 
-#include "ipu-bridge.h"
+#include <media/ipu-bridge.h>
+#include <media/v4l2-fwnode.h>
 
 /*
  * Extend this array with ACPI Hardware IDs of devices known to be working
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 26c4c1375990..51a6d7cc44d2 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -22,6 +22,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/vmalloc.h>
+
+#include <media/ipu-bridge.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -29,7 +31,6 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-sg.h>
 
-#include "../ipu-bridge.h"
 #include "ipu3-cio2.h"
 
 struct ipu3_cio2_fmt {
diff --git a/drivers/media/pci/intel/ipu-bridge.h b/include/media/ipu-bridge.h
similarity index 100%
rename from drivers/media/pci/intel/ipu-bridge.h
rename to include/media/ipu-bridge.h
-- 
2.41.0

