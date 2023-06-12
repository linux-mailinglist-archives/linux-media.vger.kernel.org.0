Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC0F72C893
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 16:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238179AbjFLObM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 10:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbjFLOaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 10:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1BD3C3B
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686580081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Pz2kuqiSFQSWJR9941DFWUWhLPb+zdyjk+fsL6/Qprg=;
        b=QLZLZk7trC2r/GjUVtqNtv4lbB138tQPfb4vf3uuCVJdONvyavGjgbTdrVNXNjX8OMkZdR
        e+UW9ObtNjBie+UOleCQGaSCc/DwFg0hFxgEa9kXILA6u70eesln3Owx3lY4JX4gtHAxV4
        Zd2R7VsAJ5rsdYcVIOnO8bQ8TiKmTYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-7gjyhIGQMZKq2qLnX_JtIA-1; Mon, 12 Jun 2023 10:16:34 -0400
X-MC-Unique: 7gjyhIGQMZKq2qLnX_JtIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54EE4101A53B;
        Mon, 12 Jun 2023 14:16:34 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 606D740C20F4;
        Mon, 12 Jun 2023 14:16:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: int3472: discrete: Fix getting active_value
Date:   Mon, 12 Jun 2023 16:16:31 +0200
Message-Id: <20230612141632.5232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

acpi_object.integer.value is 64 bit, so to get bits 31-24
the value not only needs to be shifted but also masked.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index fc839a73e411..4ef60883154d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -179,7 +179,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
 	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
-	active_value = obj->integer.value >> 24;
+	active_value = (obj->integer.value >> 24) & 0xff;
 	if (!active_value)
 		polarity ^= GPIO_ACTIVE_LOW;
 
-- 
2.40.1

