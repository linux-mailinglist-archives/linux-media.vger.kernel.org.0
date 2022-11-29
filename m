Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F19163CBA1
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 00:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbiK2XN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 18:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233312AbiK2XNz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 18:13:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B586DFFF
        for <linux-media@vger.kernel.org>; Tue, 29 Nov 2022 15:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669763530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cnjWHrPyGNDg03m4vSfqHnKmxySvp8MmHvyUdp7Jfkc=;
        b=ZVrV/sQzi56VsJ4LCSLR+mzDcOJcZTxxjIl85lfYZChWLEihp3341oBwltHpwEGtqvh+XY
        to9o5V+CpcXg8++UoJVJpgCB+fvgs+LvVb+9mRVoV0P7ZvsyqPMBKUo7IWjsB0BCyf9aW+
        sU9MhvX914ak8yIE3Du/EwVRm6VUMlk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-Tj2ee1xoM_Kv8xmVq-5XkQ-1; Tue, 29 Nov 2022 18:12:06 -0500
X-MC-Unique: Tj2ee1xoM_Kv8xmVq-5XkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 256D986F123;
        Tue, 29 Nov 2022 23:12:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C66EB4A9254;
        Tue, 29 Nov 2022 23:12:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 5/6] platform/x86: int3472/discrete: Ensure the clk/power enable pins are in output mode
Date:   Wed, 30 Nov 2022 00:11:48 +0100
Message-Id: <20221129231149.697154-6-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
specifying that the pins direction should be initialized to a specific
value.

This means that in some cases the pins might be left in input mode, causing
the gpiod_set() calls made to enable the clk / regulator to not work.

One example of this problem is the clk-enable GPIO for the ov01a1s sensor
on a Dell Latitude 9420 being left in input mode causing the clk to
never get enabled.

Explicitly set the direction of the pins to output to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 89894ec873f2..dc4ab7821b56 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -103,6 +103,9 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
 	}
 
+	/* Ensure the pin is in output mode */
+	gpiod_direction_output(int3472->clock.ena_gpio, 0);
+
 	init.name = kasprintf(GFP_KERNEL, "%s-clk",
 			      acpi_dev_name(int3472->adev));
 	if (!init.name) {
@@ -195,6 +198,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 		return PTR_ERR(int3472->regulator.gpio);
 	}
 
+	/* Ensure the pin is in output mode */
+	gpiod_direction_output(int3472->regulator.gpio, 0);
+
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = int3472->regulator.gpio;
-- 
2.38.1

