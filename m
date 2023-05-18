Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B13777084ED
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbjERPdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjERPdR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF76F9
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0vDgOF1csbbV8JUAC2wKUOa1ITLobI0eEtoniauNzX4=;
        b=RHUc6ZrGgZFRxwZEMqVfYahdnkZaHtuMVqIcNiInfCbWaeRC2Fl99/Qy9QTztd48/nkjB9
        eRlmAOR1Pjo5XFc3kEYCV93W5ieqENfWKKbCwiPxyYkyYLJIiwmxrWRqyU+yyV0YEnmRT/
        Msef/htYGF29lSVX48oKT5aB0kcqOiw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-VdRPyzJ6N-eT_SW5646OPg-1; Thu, 18 May 2023 11:32:27 -0400
X-MC-Unique: VdRPyzJ6N-eT_SW5646OPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3437480101C;
        Thu, 18 May 2023 15:32:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ABAC24078908;
        Thu, 18 May 2023 15:32:25 +0000 (UTC)
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
Subject: [PATCH 6/9] media: atomisp: gc0310: Cleanup includes
Date:   Thu, 18 May 2023 17:32:11 +0200
Message-Id: <20230518153214.194976-7-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a bunch of unused includes and sort the remainging
includes alphabetically.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 89f8c6cac581..35367d6efd2c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -16,25 +16,18 @@
  *
  */
 
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/string.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/kmod.h>
-#include <linux/device.h>
 #include <linux/delay.h>
-#include <linux/slab.h>
+#include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
-#include <linux/moduleparam.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
 #include <media/v4l2-acpi.h>
 #include <media/v4l2-device.h>
-#include <linux/io.h>
 
 #include "gc0310.h"
 
-- 
2.40.1

