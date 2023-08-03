Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BC676E496
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbjHCJhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbjHCJgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CD635A4
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P6MghfuQ3kvRwZzjJtE4BMBz/wpQQTEaLj+aFpwysHk=;
        b=iytb09haCZZyhozSi+ESgxT63wUKHVFKE2JHxchq2r6ixpV+AbdVn1LXHtIqksdcZFOxQD
        tjmw2dWvbIDS8p6ZmFkNBlUEWR0IEqyWlNdnCnv5A2GfDKcpV5HOiIKEVD4ZCnrHF5M07z
        DHlf9VhHcQek5OVk8vpojcCgzdSqoz4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-pRGWiDPXMkyc04aWLkzwMA-1; Thu, 03 Aug 2023 05:34:19 -0400
X-MC-Unique: pRGWiDPXMkyc04aWLkzwMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37CBC3C01C2E;
        Thu,  3 Aug 2023 09:34:19 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C6CA32166B25;
        Thu,  3 Aug 2023 09:34:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 17/32] media: ov2680: Add support for ACPI enumeration
Date:   Thu,  3 Aug 2023 11:33:32 +0200
Message-ID: <20230803093348.15679-18-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an acpi_match_table now that all the other bits necessary for
ACPI support are in place.

The OVTI prefix used for the ACPI-HID is used for various OmniVision
sensors on many generations x86 tablets and laptops.

The OVTI2680 HID specifically is used on multiple models spanning at
least 4 different Intel CPU models (2 ISP2, 2 IPU3).

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v5:
- Add some notes to the commit message about the OVTI2680 HID
---
 drivers/media/i2c/ov2680.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index d4664581b49b..0adfacc70735 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -932,11 +932,18 @@ static const struct of_device_id ov2680_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ov2680_dt_ids);
 
+static const struct acpi_device_id ov2680_acpi_ids[] = {
+	{ "OVTI2680" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov2680_acpi_ids);
+
 static struct i2c_driver ov2680_i2c_driver = {
 	.driver = {
 		.name  = "ov2680",
 		.pm = pm_sleep_ptr(&ov2680_pm_ops),
 		.of_match_table	= ov2680_dt_ids,
+		.acpi_match_table = ov2680_acpi_ids,
 	},
 	.probe		= ov2680_probe,
 	.remove		= ov2680_remove,
-- 
2.41.0

