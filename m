Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37CED6D31CF
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjDAPBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjDAPBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBB32031D
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cb6G5JbVFv+EPtm+OowTpy5n4KazA/zY4dcxtvzMYS4=;
        b=ZeLlZhhJBQZNgQtih6HYM0uV0Cp45qfmCqwhk8WWa77dWFq/muQQ4AgYDLcR4UPUQbItep
        o/WIOHx5lA2gS7ueW9CL8nwbiuOoqGZuQBn166tBZRPeCrbgwdKXNCa4Z5FYd9Kb8a03t/
        gngN/LUuhJa2wqfDepK3uKRYr6Rg3Iw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-vSFLvIQPPuKahXq27mIAYw-1; Sat, 01 Apr 2023 11:00:28 -0400
X-MC-Unique: vSFLvIQPPuKahXq27mIAYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07B662A5955F;
        Sat,  1 Apr 2023 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C621400F59;
        Sat,  1 Apr 2023 15:00:26 +0000 (UTC)
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
Subject: [PATCH 27/28] media: atomisp: gmin_platform: Make DMI quirks take precedence over the _DSM table
Date:   Sat,  1 Apr 2023 16:59:25 +0200
Message-Id: <20230401145926.596216-28-hdegoede@redhat.com>
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

On some devices the _DSM sensor-info table contains wrong info,
move the DMI quirk handling up to above the _DSM table check
to allow DMI quirks to override wrong info in the _DSM table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index f8d8a34d7e7f..f83de0ffaf16 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1353,37 +1353,22 @@ static int gmin_get_config_var(struct device *maindev,
 			       const char *var,
 			       char *out, size_t *out_len)
 {
+	struct acpi_device *adev = ACPI_COMPANION(maindev);
 	efi_char16_t var16[CFG_VAR_NAME_MAX];
 	const struct dmi_system_id *id;
-	struct device *dev = maindev;
 	char var8[CFG_VAR_NAME_MAX];
 	efi_status_t status;
 	int i, ret;
 
-	/* For sensors, try first to use the _DSM table */
-	if (!is_gmin) {
-		ret = gmin_get_config_dsm_var(maindev, var, out, out_len);
-		if (!ret)
-			return 0;
-	}
-
-	/* Fall-back to other approaches */
-
-	if (!is_gmin && ACPI_COMPANION(dev))
-		dev = &ACPI_COMPANION(dev)->dev;
-
-	if (!is_gmin)
-		ret = snprintf(var8, sizeof(var8), "%s_%s", dev_name(dev), var);
+	if (!is_gmin && adev)
+		ret = snprintf(var8, sizeof(var8), "%s_%s", acpi_dev_name(adev), var);
 	else
 		ret = snprintf(var8, sizeof(var8), "gmin_%s", var);
 
 	if (ret < 0 || ret >= sizeof(var8) - 1)
 		return -EINVAL;
 
-	/* First check a hard-coded list of board-specific variables.
-	 * Some device firmwares lack the ability to set EFI variables at
-	 * runtime.
-	 */
+	/* DMI based quirks override both the _DSM table and EFI variables */
 	id = dmi_first_match(gmin_vars);
 	if (id) {
 		ret = gmin_get_hardcoded_var(maindev, id->driver_data, var8,
@@ -1392,6 +1377,13 @@ static int gmin_get_config_var(struct device *maindev,
 			return 0;
 	}
 
+	/* For sensors, try first to use the _DSM table */
+	if (!is_gmin) {
+		ret = gmin_get_config_dsm_var(maindev, var, out, out_len);
+		if (!ret)
+			return 0;
+	}
+
 	/* Our variable names are ASCII by construction, but EFI names
 	 * are wide chars.  Convert and zero-pad.
 	 */
-- 
2.39.1

