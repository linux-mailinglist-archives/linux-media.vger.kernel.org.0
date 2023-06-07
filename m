Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D427872665A
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 18:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjFGQsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 12:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjFGQsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 12:48:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9806B1FE8
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686156473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PEOKFOFrbRdx9pBrGkN34+/qQxhlf8T7klWH+p3apsU=;
        b=BFU7XQdPuJsgRS/BIQG3H308qB9vyj7wqNe8g3fmNqY6D/C4r/FzYL46/s3O23TxJdwsIu
        yJ+JOZQVnhwIdwhC0mDU2PTqYe3lafOTUuSkvEQ4Ccd435Caicpa40rPnfs5rztAnlo0hR
        4xjZvE2Y2WOSNO+A9Ytc/cLNhvKH5LU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-VcVg7s04OQKTbqElM42YBw-1; Wed, 07 Jun 2023 12:47:48 -0400
X-MC-Unique: VcVg7s04OQKTbqElM42YBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 308EA8028B1;
        Wed,  7 Jun 2023 16:47:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFE0EC0448E;
        Wed,  7 Jun 2023 16:47:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 17/28] media: ov2680: Add support for ACPI enumeration
Date:   Wed,  7 Jun 2023 18:47:01 +0200
Message-Id: <20230607164712.63579-18-hdegoede@redhat.com>
In-Reply-To: <20230607164712.63579-1-hdegoede@redhat.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add an acpi_match_table now that all the other bits necessary for
ACPI support are in place.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2680.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 9fa92b4f1307..190c58caae11 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -900,11 +900,18 @@ static const struct of_device_id ov2680_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ov2680_dt_ids);
 
+static const struct acpi_device_id ov2680_acpi_ids[] = {
+	{ "OVTI2680" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov2680_acpi_ids);
+
 static struct i2c_driver ov2680_i2c_driver = {
 	.driver = {
 		.name  = "ov2680",
 		.pm = pm_sleep_ptr(&ov2680_pm_ops),
 		.of_match_table	= of_match_ptr(ov2680_dt_ids),
+		.acpi_match_table = ov2680_acpi_ids,
 	},
 	.probe_new	= ov2680_probe,
 	.remove		= ov2680_remove,
-- 
2.40.1

