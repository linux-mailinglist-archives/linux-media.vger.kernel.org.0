Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B2372E061
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 13:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242089AbjFMLJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 07:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239887AbjFMLJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 07:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BBBE52
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 04:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686654496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zCxocw+Px3HFxaNkLY3PSnPqZD3p2HVZUj2Wc41PwGk=;
        b=dZqP/i0bBEbhjFzgIZO87m47MzXFzWAeA+NbQEkc+0B4GIzvYSSTC5isf9iWUkFqPO10ZY
        /W9FvebGa9RBWbnta7wQzRdBKBklO3km1zyAX6xJ8sjkLd7upBGo9gByUcdzRo/9e6x4RB
        Glwo+ppniEYdd3Zb+0Y30UT8bmOa5Do=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-k3DL2g2TMK274c-g7EYiYQ-1; Tue, 13 Jun 2023 07:08:14 -0400
X-MC-Unique: k3DL2g2TMK274c-g7EYiYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E7FC3C0F222;
        Tue, 13 Jun 2023 11:08:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF463492CA6;
        Tue, 13 Jun 2023 11:08:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the pin-numbers don't match
Date:   Tue, 13 Jun 2023 13:08:10 +0200
Message-Id: <20230613110810.240193-2-hdegoede@redhat.com>
In-Reply-To: <20230613110810.240193-1-hdegoede@redhat.com>
References: <20230613110810.240193-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The INT3472 discrete code assumes that the ACPI GPIO resources are
in the same order as the pin-info _DSM entries.

The returned pin-info includes the pin-number in bits 15-8. Add a check
that this matches with the ACPI GPIO resource pin-number in case
the assumption is not true with some ACPI tables.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index a31964076883..850f306214c7 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -154,8 +154,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 {
 	struct int3472_discrete_device *int3472 = data;
 	struct acpi_resource_gpio *agpio;
+	u8 active_value, pin, type;
 	union acpi_object *obj;
-	u8 active_value, type;
 	const char *err_msg;
 	const char *func;
 	u32 polarity;
@@ -183,6 +183,12 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
+	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
+	if (pin != agpio->pin_table[0])
+		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
+			 func, agpio->resource_source.string_ptr, pin,
+			 agpio->pin_table[0]);
+
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
 		polarity ^= GPIO_ACTIVE_LOW;
-- 
2.40.1

