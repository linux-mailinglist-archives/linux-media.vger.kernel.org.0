Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAEB73375B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbjFPRW3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbjFPRWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB55211D
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686936100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HjSnv7Ibd5FnBvbYxqcgkAkDcrG7809d3zsbMAfQcY0=;
        b=PYwJlnrxgkutjogKaQyTe3MiSByIRGb8QSkylPvD9BSbzt3d0XMNbwd0aTp1kbnc5Y8kzW
        VmIO1fKQiM1pXV+O5H4EzFuBliivEUaVbAPRPkVrLXJBsqyY9C7oflBn/kzO7d8Q4KuL7U
        Bl9d8ze5UYmSlH5Op/NKDWfw8gY1J50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ii8kzJ3pO5eb90_u9yxQdA-1; Fri, 16 Jun 2023 13:21:39 -0400
X-MC-Unique: ii8kzJ3pO5eb90_u9yxQdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA0FF185A791;
        Fri, 16 Jun 2023 17:21:38 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.38])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CB89A40C95E1;
        Fri, 16 Jun 2023 17:21:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>
Subject: [PATCH v2 4/6] platform/x86: int3472: discrete: Add alternative "AVDD" regulator supply name
Date:   Fri, 16 Jun 2023 19:21:30 +0200
Message-ID: <20230616172132.37859-5-hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-1-hdegoede@redhat.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an "AVDD" regulator supply name alias to the supply-map which
gets registered for the INT3472 GPIO regulator.

This is necessary for the ov2680 driver which expects "AVDD" rather then
"avdd". Updating the ov2680 driver to use "avdd" is not possible because
that will break compatibility with existing DT / DTB files.

Tested-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 1 +
 drivers/platform/x86/intel/int3472/common.h            | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index a5c60b86f5de..61aeca804ba2 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -248,6 +248,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
  */
 static const char * const skl_int3472_regulator_map_supplies[] = {
 	"avdd",
+	"AVDD",
 };
 
 static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index fd2a3d3884fa..9f29baa13860 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -28,7 +28,7 @@
 
 #define GPIO_REGULATOR_NAME_LENGTH				21
 #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
-#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				1
+#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
-- 
2.41.0

