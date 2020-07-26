Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D90922DD84
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 11:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgGZJKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 05:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgGZJKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 05:10:06 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C10DC0619D2;
        Sun, 26 Jul 2020 02:10:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so7750285pgc.8;
        Sun, 26 Jul 2020 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W55/l1JBEazK4N5hQv70nA809fQUH8diXh6vKYJ/So8=;
        b=anGHIYncjeMTl4zshsSV/aAmEBzakA5HLMWpVf2oOP/cmPmoqVO0+JVevzweTTS/Do
         ZTp4H0waL/0qoY25GGhzAyn0SJAn104Npl3GeicS62ieinMin6WD7yH/bv7ezEoHmyMn
         6AkNUjwL1WQ/J6paZXKNGb2QxKUcKfX0Y9C81r0eLi7whVlr5YMXUDEUM6AaHtjKxbC6
         qrc9pP3NW2SR4iitA3wWa27Jf75naxGs6LhezEKLMq3hyGQSMd6cuZB5VmOAAGA93B0d
         Mc9ehRp3QsiZKNnhUlt8iZ8t5kmMVMzcHMnnqlczKQ/rmdUx4btc/HHJ/JAm+ZjVazqV
         kQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W55/l1JBEazK4N5hQv70nA809fQUH8diXh6vKYJ/So8=;
        b=QhZzgWKou0YiaUutcxM3gRtsG8bp9hFLTQ38zKUDadR/o7eCpvFreZPURiLj+4tl7C
         jv2DT1RCsYcrEvxn/hTPG9X2tYKHztwxkl4PuGOu06c50jb5xSqX36qGUVGJVNzgE/pe
         fF6XdKbZj3RXpWCJbivNl4wa4qiuUTQa/Dwc6pTCqIlVTmZ2VPdyuMjAjp7qQBNL5mLY
         d57d+KzDxh66+dHMwXyuOBzT1ZXaPpcOE1pq9BmaoSwQaW3UUVLV1QQFfeyxrf5k2Sqh
         A2NHtw9PJRMrYIg8kTSyt+4mdzNRYXnuKzG9/VO0QC6LOyII/MDSvmjJmdpDu8FillS6
         prxQ==
X-Gm-Message-State: AOAM533TKpdXEbIFuHOKrfr9I76BlhF94m14z8VLor6PhTaylqHGBekM
        J6U4CnhvWKWhD9E24LDJbf2pO/Nw0nA=
X-Google-Smtp-Source: ABdhPJxj/1I02FNE8PkSlNSXn49RGOhicLXpFgHxSXLoygrAG4eCmZ92+eOL5yERkeNqP/Ch7pjPUA==
X-Received: by 2002:a63:a06b:: with SMTP id u43mr15118867pgn.294.1595754605977;
        Sun, 26 Jul 2020 02:10:05 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id a129sm1608215pfd.165.2020.07.26.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:10:05 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org,
        Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
Subject: [PATCH v3 2/4] staging: media: atomisp: fix style of open brace
Date:   Sun, 26 Jul 2020 14:35:12 +0530
Message-Id: <20200726090512.20574-2-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
References: <20200726062541.11304-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patch fixes style of open brace after functions and if statements

Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v3: change patch subject prefix
v2: split patch into sequence of patches 
v1: fix all coding style issues in single patch

 .../media/atomisp/pci/sh_css_firmware.c       | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 2907aead98b7..988785ab6c95 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -81,7 +81,8 @@ char *sh_css_get_fw_version(void)
 /* Setup sp/sp1 binary */
 static int
 setup_binary(struct ia_css_fw_info *fw, const char *fw_data,
-	     struct ia_css_fw_info *sh_css_fw, unsigned int binary_id) {
+	     struct ia_css_fw_info *sh_css_fw, unsigned int binary_id)
+{
 	const char *blob_data;
 
 	if ((!fw) || (!fw_data))
@@ -105,7 +106,8 @@ setup_binary(struct ia_css_fw_info *fw, const char *fw_data,
 int
 sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 		      struct ia_css_blob_descr *bd,
-		      unsigned int index) {
+		      unsigned int index)
+{
 	const char *name;
 	const unsigned char *blob;
 
@@ -119,8 +121,9 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 	blob = (const unsigned char *)fw + bi->blob.offset;
 
 	/* sanity check */
-	if (bi->blob.size != bi->blob.text_size + bi->blob.icache_size + bi->blob.data_size + bi->blob.padding_size)
-	{
+	if (bi->blob.size !=
+		bi->blob.text_size + bi->blob.icache_size +
+		bi->blob.data_size + bi->blob.padding_size) {
 		/* sanity check, note the padding bytes added for section to DDR alignment */
 		return -EINVAL;
 	}
@@ -131,21 +134,18 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
 	bd->blob = blob;
 	bd->header = *bi;
 
-	if (bi->type == ia_css_isp_firmware || bi->type == ia_css_sp_firmware)
-	{
+	if (bi->type == ia_css_isp_firmware || bi->type == ia_css_sp_firmware) {
 		char *namebuffer;
 
 		namebuffer = kstrdup(name, GFP_KERNEL);
 		if (!namebuffer)
 			return -ENOMEM;
 		bd->name = fw_minibuffer[index].name = namebuffer;
-	} else
-	{
+	} else {
 		bd->name = name;
 	}
 
-	if (bi->type == ia_css_isp_firmware)
-	{
+	if (bi->type == ia_css_isp_firmware) {
 		size_t paramstruct_size = sizeof(struct ia_css_memory_offsets);
 		size_t configstruct_size = sizeof(struct ia_css_config_memory_offsets);
 		size_t statestruct_size = sizeof(struct ia_css_state_memory_offsets);
@@ -226,7 +226,8 @@ static const char * const fw_acc_type_name[] = {
 
 int
 sh_css_load_firmware(struct device *dev, const char *fw_data,
-		     unsigned int fw_size) {
+		     unsigned int fw_size)
+{
 	unsigned int i;
 	struct ia_css_fw_info *binaries;
 	struct sh_css_fw_bi_file_h *file_header;
@@ -260,8 +261,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
-	if (sh_css_num_binaries > NUM_OF_SPS)
-	{
+	if (sh_css_num_binaries > NUM_OF_SPS) {
 		sh_css_blob_info = kmalloc(
 		    (sh_css_num_binaries - NUM_OF_SPS) *
 		    sizeof(*sh_css_blob_info), GFP_KERNEL);
@@ -276,8 +276,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	if (!fw_minibuffer)
 		return -ENOMEM;
 
-	for (i = 0; i < sh_css_num_binaries; i++)
-	{
+	for (i = 0; i < sh_css_num_binaries; i++) {
 		struct ia_css_fw_info *bi = &binaries[i];
 		/*
 		 * note: the var below is made static as it is quite large;
-- 
2.25.1

