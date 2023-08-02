Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD4076C9F9
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbjHBJ6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjHBJ5y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432E1196
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nXHvhsWvUt9QlzRY0BQlGeFWwRZs8w0/lYaxHK9W8GY=;
        b=PRGhGM4XJw2W8MmFvCIO0LRWsyWDLH4th2ZVq8U+czN6Vt5MDNki/WqYjvyVNputP9L9Ck
        0Es2XfM6Tk8MBuvxMSoemE8uQ6N6WmD4ERDSVqhaniTN3V5H+JbFH5t70u3t9TLsa1UQWn
        QHj3ugkltiKVOKMKOTzTvlBZV0KaMVc=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-hpurGaDhOZ2fz5mgPfF9Vw-1; Wed, 02 Aug 2023 05:57:04 -0400
X-MC-Unique: hpurGaDhOZ2fz5mgPfF9Vw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB3D73C13928;
        Wed,  2 Aug 2023 09:57:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 595E8401061;
        Wed,  2 Aug 2023 09:57:00 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 05/12] media: atomisp: sh_css_mipi: Removed unused code ia_css_mipi_frame_enable_check_on_size()
Date:   Wed,  2 Aug 2023 17:55:59 +0800
Message-ID: <20230802095606.1298152-6-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ia_css_mipi_frame_enable_check_on_size() wasn't used by any functions.
So, it can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/ia_css_mipi.h   | 16 ----------
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 29 -------------------
 2 files changed, 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 9e50e1c619be..cd6e0111d9f4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -25,22 +25,6 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* @brief Register size of a CSS MIPI frame for check during capturing.
- *
- * @param[in]	port	CSI-2 port this check is registered.
- * @param[in]	size_mem_words	The frame size in memory words (32B).
- * @return		Return the error in case of failure. E.g. MAX_NOF_ENTRIES REACHED
- *
- * Register size of a CSS MIPI frame to check during capturing. Up to
- *		IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES entries per port allowed. Entries are reset
- *		when stream is stopped.
- *
- *
- */
-int
-ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words);
-
 /* @brief Calculate the size of a mipi frame.
  *
  * @param[in]	width		The width (in pixels) of the frame.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index b20acaab0595..16c824981c59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -185,35 +185,6 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	return err;
 }
 
-/*
- * Check if a source port or TPG/PRBS ID is valid
- */
-
-#if !defined(ISP2401)
-int
-ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words)
-{
-	u32 idx;
-
-	int err = -EBUSY;
-
-	OP___assert(port < N_CSI_PORTS);
-	OP___assert(size_mem_words != 0);
-
-	for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT &&
-	     my_css.mipi_sizes_for_check[port][idx] != 0;
-	     idx++) { /* do nothing */
-	}
-	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT) {
-		my_css.mipi_sizes_for_check[port][idx] = size_mem_words;
-		err = 0;
-	}
-
-	return err;
-}
-#endif
-
 void
 mipi_init(void)
 {
-- 
2.41.0

