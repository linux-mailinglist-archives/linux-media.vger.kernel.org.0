Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171EA6D31D1
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjDAPBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjDAPBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCE820620
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fu7akkSrLzuIcCNp6h4mKqSfsMWoS6+H12wTLO1rBuc=;
        b=AwOU2EzRTP8uqHdfP6KvWG9qoFOBXexizeuC2YSKY9DluAZhk2LsdkDi7D4boEP1y46Qs7
        jSEqvaGrZfeZpZhqGu42Na/BKn4kK8v3j1OiL20eryp72Y6LExUqwG6A4Sb6c4/bfdADvo
        izsGYqJq0KpUF0ZIU94SbSl8yvlnKEk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-kMV-mPxANJiEzGhDF2hl3w-1; Sat, 01 Apr 2023 11:00:30 -0400
X-MC-Unique: kMV-mPxANJiEzGhDF2hl3w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEDAF3815F66;
        Sat,  1 Apr 2023 15:00:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3B4E4483EC1;
        Sat,  1 Apr 2023 15:00:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 28/28] media: atomisp: gmin_platform: Add Lenovo Ideapad Miix 310 gmin_vars
Date:   Sat,  1 Apr 2023 16:59:26 +0200
Message-Id: <20230401145926.596216-29-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The _DSM used to get sensor variables like CsiPort returns the wrong
csi-port for the front OV2680 sensor on the Lenovo Ideapad Miix 310
add a gmin_vars DMI quirk / override setting the right CsiPort.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index f83de0ffaf16..efcfc133311f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -304,7 +304,17 @@ static struct gmin_cfg_var surface3_vars[] = {
 	{},
 };
 
+static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
+	/* _DSM contains the wrong CsiPort! */
+	{ "OVTI2680:01_CsiPort", "0" },
+	{}
+};
+
 static const struct dmi_system_id gmin_vars[] = {
+	/*
+	 * These DMI ids where present when the atomisp driver was merged into
+	 * drivers/staging and it is unclear if they are really necessary.
+	 */
 	{
 		.ident = "BYT-T FFD8",
 		.matches = {
@@ -341,6 +351,7 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = i8880_vars,
 	},
+	/* Later added DMI ids, these are confirmed to really be necessary! */
 	{
 		.ident = "Surface 3",
 		.matches = {
@@ -348,6 +359,14 @@ static const struct dmi_system_id gmin_vars[] = {
 		},
 		.driver_data = surface3_vars,
 	},
+	{
+		.ident = "Lenovo Ideapad Miix 310",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
+		},
+		.driver_data = lenovo_ideapad_miix_310_vars,
+	},
 	{}
 };
 
-- 
2.39.1

