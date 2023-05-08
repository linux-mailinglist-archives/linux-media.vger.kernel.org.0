Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56BD6F9FDD
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjEHG21 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232753AbjEHG2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:28:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF67191E1
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683527238;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=++gZUZYPIG1i1gaN3QtlGHRlxFIgb4zFjFTKlDO5Gmc=;
        b=dMxt1nV29HgBLg+MZ2uRMw3QSrIow3hFz8X2AGcZ1IXH7Gm0lYCXqjIJOe8CQ9H1armWvf
        B8yJU7ol7uFhOpjMwu2+sigeHdvB7gIjbz8Nbzl5fil8LfIJJdUvFC/craSLFOTs7lb2nI
        hyXL1IvBqOVAx+48x79cldzPxNFgdSU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-uBYaNlbEPwyl_PUxWAZpmA-1; Mon, 08 May 2023 02:27:14 -0400
X-MC-Unique: uBYaNlbEPwyl_PUxWAZpmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A7AA80080E;
        Mon,  8 May 2023 06:27:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 69D5F492C13;
        Mon,  8 May 2023 06:27:11 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 4/5] staging: media: atomisp: sh_css_firmware: determine firmware version at runtime
Date:   Mon,  8 May 2023 14:26:31 +0800
Message-Id: <20230508062632.34537-4-hpa@redhat.com>
In-Reply-To: <20230508062632.34537-1-hpa@redhat.com>
References: <20230508062632.34537-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The firmware version of ISP2401 and 2400 is determined at runtime.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../media/atomisp/pci/sh_css_firmware.c        | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e7ef578db8ab..49ee88fe151d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -56,11 +56,8 @@ static struct firmware_header *firmware_header;
  * which will be replaced with the actual RELEASE_VERSION
  * during package generation. Please do not modify
  */
-#ifdef ISP2401
-static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
-#else
-static const char *release_version = STR(irci_stable_candrpv_0415_20150423_1753);
-#endif
+static const char *release_version_2401 = STR(irci_stable_candrpv_0415_20150521_0458);
+static const char *release_version_2400 = STR(irci_stable_candrpv_0415_20150423_1753);
 
 #define MAX_FW_REL_VER_NAME	300
 static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
@@ -191,8 +188,14 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 bool
 sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 {
+	const char *release_version;
 	struct sh_css_fw_bi_file_h *file_header;
 
+	if (IS_ISP2401)
+		release_version = release_version_2401;
+	else
+		release_version = release_version_2400;
+
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
 
@@ -225,6 +228,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		     unsigned int fw_size)
 {
 	unsigned int i;
+	const char *release_version;
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
 	int ret;
@@ -234,6 +238,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	binaries = &firmware_header->binary_header;
 	strscpy(FW_rel_ver_name, file_header->version,
 		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
+	if (IS_ISP2401)
+		release_version = release_version_2401;
+	else
+		release_version = release_version_2400;
 	ret = sh_css_check_firmware_version(dev, fw_data);
 	if (ret) {
 		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",
-- 
2.40.1

