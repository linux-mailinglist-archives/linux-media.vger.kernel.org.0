Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 278F672C834
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 16:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbjFLOXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 10:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238086AbjFLOXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 10:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FB43AA8
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 07:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686579601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q4TwCgusytKSulbypQtYUJ/IonR429FcZB5BLgIBpv8=;
        b=emoJ7va9QXi9/Av37MEY7gHz0STe+OhyP5/TsyXLPB1U1W3I1GSXmWmN69NHXN5qnnQbTF
        UzdIk4dGRA8MkkioRbFJ6QLPag9JwShVTUOKcMTuS2dHS80O+DKrdxoXijgyf4I8JXtKAf
        z1wEA9NrXsYcl+PiQmco7ZXAldqVMmk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-1yqKf_YGNLyl0spoI3Noew-1; Mon, 12 Jun 2023 10:16:35 -0400
X-MC-Unique: 1yqKf_YGNLyl0spoI3Noew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D073C11CCA;
        Mon, 12 Jun 2023 14:16:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 869CF40C20F4;
        Mon, 12 Jun 2023 14:16:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the pin-numbers don't match
Date:   Mon, 12 Jun 2023 16:16:32 +0200
Message-Id: <20230612141632.5232-2-hdegoede@redhat.com>
In-Reply-To: <20230612141632.5232-1-hdegoede@redhat.com>
References: <20230612141632.5232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4ef60883154d..c1132bbbff41 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 {
 	struct int3472_discrete_device *int3472 = data;
 	struct acpi_resource_gpio *agpio;
+	u8 active_value, pin, type;
 	union acpi_object *obj;
-	u8 active_value, type;
 	const char *err_msg;
 	const char *func;
 	u32 polarity;
@@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 		return 1;
 	}
 
+	/* Bits 7-0 contain the type/function of the pin */
 	type = obj->integer.value & 0xff;
 
 	int3472_get_func_and_polarity(type, &func, &polarity);
 
+	/* Bits 15-8 contain the pin-number on the GPIO chip */
+	pin = (obj->integer.value >> 8) & 0xff;
+	if (pin != agpio->pin_table[0])
+		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
+			 func, agpio->resource_source.string_ptr, pin,
+			 agpio->pin_table[0]);
+
 	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
 	active_value = (obj->integer.value >> 24) & 0xff;
 	if (!active_value)
-- 
2.40.1

