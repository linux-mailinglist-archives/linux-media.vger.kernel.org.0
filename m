Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0A070F5F6
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbjEXMMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbjEXMMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:12:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC3718B
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:12:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65896632DF
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 12:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED6FC433EF;
        Wed, 24 May 2023 12:12:00 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 8/8] staging: media: atomisp: move up sanity checks
Date:   Wed, 24 May 2023 14:11:50 +0200
Message-Id: <20230524121150.435736-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
References: <20230524121150.435736-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sanity checks were done too late, so move them up.

This fixes this smatch warning:

drivers/staging/media/atomisp/pci/sh_css_firmware.c:247 sh_css_load_firmware() warn: variable dereferenced before check 'fw_data' (see line 237)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/sh_css_firmware.c   | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index e7ef578db8ab..fb3f63938882 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -229,8 +229,16 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	struct sh_css_fw_bi_file_h *file_header;
 	int ret;
 
+	/* some sanity checks */
+	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
+		return -EINVAL;
+
 	firmware_header = (struct firmware_header *)fw_data;
 	file_header = &firmware_header->file_header;
+
+	if (file_header->h_size != sizeof(struct sh_css_fw_bi_file_h))
+		return -EINVAL;
+
 	binaries = &firmware_header->binary_header;
 	strscpy(FW_rel_ver_name, file_header->version,
 		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
@@ -243,13 +251,6 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		IA_CSS_LOG("successfully load firmware version %s", release_version);
 	}
 
-	/* some sanity checks */
-	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
-		return -EINVAL;
-
-	if (file_header->h_size != sizeof(struct sh_css_fw_bi_file_h))
-		return -EINVAL;
-
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-- 
2.39.2

