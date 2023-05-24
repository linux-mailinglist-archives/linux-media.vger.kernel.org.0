Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1CD70F5EF
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbjEXML5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjEXMLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:11:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35F995
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:11:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 580DD63C95
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E52C4339B;
        Wed, 24 May 2023 12:11:52 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/8] staging: media: atomisp: initialize settings to 0
Date:   Wed, 24 May 2023 14:11:43 +0200
Message-Id: <20230524121150.435736-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a compiler warning:

drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:1525:13: warning: 'settings' may be used uninitialized [-Wmaybe-uninitialized]

The 'settings' variable is actually always initialized, but the
compiler isn't quite able to figure that out. Just initialize it
to 0 to avoid this warning.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index c718a74ea70a..48ba0d0bcfe5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1522,7 +1522,7 @@ static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_data)
 	const char *name;
 	bool active_low;
 	unsigned int i;
-	u32 settings;
+	u32 settings = 0;
 	u8 pin;
 
 	if (!acpi_gpio_get_io_resource(ares, &agpio))
-- 
2.39.2

