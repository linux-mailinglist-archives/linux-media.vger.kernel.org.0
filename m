Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26785751E2B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbjGMKEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234570AbjGMKEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99344271C
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KlWx6kDyWobCiLLjoRh2n4jR1/usV6E+i8uFNdA00+E=;
        b=WoJ+1sLQLC72L3Yg2RL/NG+yws95VlirVPq4GQX4joEsTKtiGS96VekhzPg6oRXCSxP/rQ
        oFfIUjJxgY9XXooGV3Mk4vhKrXZW2ljll3d4xlLiTEunHr+7WcRizbhaGXY6ILTHINT2/2
        /zjjzM+z9NJNMrKhkMGr0TNphZI9DbY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-y1521lq6Nk6J19bC3kUmZA-1; Thu, 13 Jul 2023 06:02:59 -0400
X-MC-Unique: y1521lq6Nk6J19bC3kUmZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32FDE185A792;
        Thu, 13 Jul 2023 10:02:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B8BE11120ABB;
        Thu, 13 Jul 2023 10:02:54 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 02/11] media: atomisp: Make two individual enum to define the MIPI format
Date:   Thu, 13 Jul 2023 18:02:22 +0800
Message-ID: <20230713100231.308923-3-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The original mipi_format_t represents the MIPI format settings for both
atomisp with the same name and the enum member was controlled by #if
defined(ISP2401). However, if we want to make this driver generic, this
enum should be individually defined for them.

Since the format type is redefined, the format setting function
ia_css_isys_set_fmt_type() should be reworked for ISP2400 and ISP2401
called ia_css_isys_2400_set_fmt_type() and ia_css_isys_2401_set_fmt_type()
.

Additionally, the function called is_mipi_format_yuv420() isn't used by any
functions so it can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../hive_isp_css_common/host/input_system.c   |  13 -
 .../atomisp/pci/isp2400_input_system_local.h  |  68 +++---
 .../atomisp/pci/isp2400_input_system_public.h |   2 -
 .../atomisp/pci/isp2401_input_system_local.h  |  74 +++---
 .../media/atomisp/pci/runtime/isys/src/rx.c   | 226 ++++++++++++------
 .../pci/runtime/isys/src/virtual_isys.c       |   6 +-
 6 files changed, 224 insertions(+), 165 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 09aca4e3db22..7a74c679ed92 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -186,19 +186,6 @@ void receiver_get_state(
 						_HRT_CSS_RECEIVER_BE_IRQ_CLEAR_REG_IDX);
 }
 
-bool is_mipi_format_yuv420(
-    const mipi_format_t			mipi_format)
-{
-	bool	is_yuv420 = (
-				(mipi_format == MIPI_FORMAT_YUV420_8) ||
-				(mipi_format == MIPI_FORMAT_YUV420_10) ||
-				(mipi_format == MIPI_FORMAT_YUV420_8_SHIFT) ||
-				(mipi_format == MIPI_FORMAT_YUV420_10_SHIFT));
-	/* MIPI_FORMAT_YUV420_8_LEGACY is not YUV420 */
-
-	return is_yuv420;
-}
-
 void receiver_set_compression(
     const rx_ID_t			ID,
     const unsigned int		cfg_ID,
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
index 8701abc4c991..847ad7554eb7 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_local.h
@@ -168,40 +168,40 @@ typedef struct acquisition_unit_state_s	acquisition_unit_state_t;
 typedef struct ctrl_unit_state_s	ctrl_unit_state_t;
 
 typedef enum {
-	MIPI_FORMAT_RGB888 = 0,
-	MIPI_FORMAT_RGB555,
-	MIPI_FORMAT_RGB444,
-	MIPI_FORMAT_RGB565,
-	MIPI_FORMAT_RGB666,
-	MIPI_FORMAT_RAW8,		/* 5 */
-	MIPI_FORMAT_RAW10,
-	MIPI_FORMAT_RAW6,
-	MIPI_FORMAT_RAW7,
-	MIPI_FORMAT_RAW12,
-	MIPI_FORMAT_RAW14,		/* 10 */
-	MIPI_FORMAT_YUV420_8,
-	MIPI_FORMAT_YUV420_10,
-	MIPI_FORMAT_YUV422_8,
-	MIPI_FORMAT_YUV422_10,
-	MIPI_FORMAT_CUSTOM0,	/* 15 */
-	MIPI_FORMAT_YUV420_8_LEGACY,
-	MIPI_FORMAT_EMBEDDED,
-	MIPI_FORMAT_CUSTOM1,
-	MIPI_FORMAT_CUSTOM2,
-	MIPI_FORMAT_CUSTOM3,	/* 20 */
-	MIPI_FORMAT_CUSTOM4,
-	MIPI_FORMAT_CUSTOM5,
-	MIPI_FORMAT_CUSTOM6,
-	MIPI_FORMAT_CUSTOM7,
-	MIPI_FORMAT_YUV420_8_SHIFT,	/* 25 */
-	MIPI_FORMAT_YUV420_10_SHIFT,
-	MIPI_FORMAT_RAW16,
-	MIPI_FORMAT_RAW18,
-	N_MIPI_FORMAT,
-} mipi_format_t;
-
-#define MIPI_FORMAT_JPEG		MIPI_FORMAT_CUSTOM0
-#define MIPI_FORMAT_BINARY_8	MIPI_FORMAT_CUSTOM0
+	MIPI_FORMAT_2400_RGB888 = 0,
+	MIPI_FORMAT_2400_RGB555,
+	MIPI_FORMAT_2400_RGB444,
+	MIPI_FORMAT_2400_RGB565,
+	MIPI_FORMAT_2400_RGB666,
+	MIPI_FORMAT_2400_RAW8,		/* 5 */
+	MIPI_FORMAT_2400_RAW10,
+	MIPI_FORMAT_2400_RAW6,
+	MIPI_FORMAT_2400_RAW7,
+	MIPI_FORMAT_2400_RAW12,
+	MIPI_FORMAT_2400_RAW14,		/* 10 */
+	MIPI_FORMAT_2400_YUV420_8,
+	MIPI_FORMAT_2400_YUV420_10,
+	MIPI_FORMAT_2400_YUV422_8,
+	MIPI_FORMAT_2400_YUV422_10,
+	MIPI_FORMAT_2400_CUSTOM0,	/* 15 */
+	MIPI_FORMAT_2400_YUV420_8_LEGACY,
+	MIPI_FORMAT_2400_EMBEDDED,
+	MIPI_FORMAT_2400_CUSTOM1,
+	MIPI_FORMAT_2400_CUSTOM2,
+	MIPI_FORMAT_2400_CUSTOM3,	/* 20 */
+	MIPI_FORMAT_2400_CUSTOM4,
+	MIPI_FORMAT_2400_CUSTOM5,
+	MIPI_FORMAT_2400_CUSTOM6,
+	MIPI_FORMAT_2400_CUSTOM7,
+	MIPI_FORMAT_2400_YUV420_8_SHIFT,	/* 25 */
+	MIPI_FORMAT_2400_YUV420_10_SHIFT,
+	MIPI_FORMAT_2400_RAW16,
+	MIPI_FORMAT_2400_RAW18,
+	N_MIPI_FORMAT_2400,
+} mipi_format_2400_t;
+
+#define MIPI_FORMAT_JPEG	MIPI_FORMAT_2400_CUSTOM0
+#define MIPI_FORMAT_BINARY_8	MIPI_FORMAT_2400_CUSTOM0
 #define N_MIPI_FORMAT_CUSTOM	8
 
 /* The number of stores for compressed format types */
diff --git a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
index ad7448744519..6477be44a815 100644
--- a/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
+++ b/drivers/staging/media/atomisp/pci/isp2400_input_system_public.h
@@ -48,8 +48,6 @@ void receiver_get_state(
 
  \return mipi_format == YUV420
  */
-bool is_mipi_format_yuv420(
-    const mipi_format_t			mipi_format);
 
 /*! Set compression parameters for cfg[cfg_ID] of RECEIVER[ID]
 
diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
index 7c7297b9c146..361a615bbcad 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_local.h
@@ -22,45 +22,45 @@
 #include "isys_irq.h"
 
 typedef enum {
-	MIPI_FORMAT_SHORT1 = 0x08,
-	MIPI_FORMAT_SHORT2,
-	MIPI_FORMAT_SHORT3,
-	MIPI_FORMAT_SHORT4,
-	MIPI_FORMAT_SHORT5,
-	MIPI_FORMAT_SHORT6,
-	MIPI_FORMAT_SHORT7,
-	MIPI_FORMAT_SHORT8,
-	MIPI_FORMAT_EMBEDDED = 0x12,
-	MIPI_FORMAT_YUV420_8 = 0x18,
-	MIPI_FORMAT_YUV420_10,
-	MIPI_FORMAT_YUV420_8_LEGACY,
-	MIPI_FORMAT_YUV420_8_SHIFT = 0x1C,
-	MIPI_FORMAT_YUV420_10_SHIFT,
-	MIPI_FORMAT_YUV422_8 = 0x1E,
-	MIPI_FORMAT_YUV422_10,
-	MIPI_FORMAT_RGB444 = 0x20,
-	MIPI_FORMAT_RGB555,
-	MIPI_FORMAT_RGB565,
-	MIPI_FORMAT_RGB666,
-	MIPI_FORMAT_RGB888,
-	MIPI_FORMAT_RAW6 = 0x28,
-	MIPI_FORMAT_RAW7,
-	MIPI_FORMAT_RAW8,
-	MIPI_FORMAT_RAW10,
-	MIPI_FORMAT_RAW12,
-	MIPI_FORMAT_RAW14,
-	MIPI_FORMAT_CUSTOM0 = 0x30,
-	MIPI_FORMAT_CUSTOM1,
-	MIPI_FORMAT_CUSTOM2,
-	MIPI_FORMAT_CUSTOM3,
-	MIPI_FORMAT_CUSTOM4,
-	MIPI_FORMAT_CUSTOM5,
-	MIPI_FORMAT_CUSTOM6,
-	MIPI_FORMAT_CUSTOM7,
+	MIPI_FORMAT_2401_SHORT1 = 0x08,
+	MIPI_FORMAT_2401_SHORT2,
+	MIPI_FORMAT_2401_SHORT3,
+	MIPI_FORMAT_2401_SHORT4,
+	MIPI_FORMAT_2401_SHORT5,
+	MIPI_FORMAT_2401_SHORT6,
+	MIPI_FORMAT_2401_SHORT7,
+	MIPI_FORMAT_2401_SHORT8,
+	MIPI_FORMAT_2401_EMBEDDED = 0x12,
+	MIPI_FORMAT_2401_YUV420_8 = 0x18,
+	MIPI_FORMAT_2401_YUV420_10,
+	MIPI_FORMAT_2401_YUV420_8_LEGACY,
+	MIPI_FORMAT_2401_YUV420_8_SHIFT = 0x1C,
+	MIPI_FORMAT_2401_YUV420_10_SHIFT,
+	MIPI_FORMAT_2401_YUV422_8 = 0x1E,
+	MIPI_FORMAT_2401_YUV422_10,
+	MIPI_FORMAT_2401_RGB444 = 0x20,
+	MIPI_FORMAT_2401_RGB555,
+	MIPI_FORMAT_2401_RGB565,
+	MIPI_FORMAT_2401_RGB666,
+	MIPI_FORMAT_2401_RGB888,
+	MIPI_FORMAT_2401_RAW6 = 0x28,
+	MIPI_FORMAT_2401_RAW7,
+	MIPI_FORMAT_2401_RAW8,
+	MIPI_FORMAT_2401_RAW10,
+	MIPI_FORMAT_2401_RAW12,
+	MIPI_FORMAT_2401_RAW14,
+	MIPI_FORMAT_2401_CUSTOM0 = 0x30,
+	MIPI_FORMAT_2401_CUSTOM1,
+	MIPI_FORMAT_2401_CUSTOM2,
+	MIPI_FORMAT_2401_CUSTOM3,
+	MIPI_FORMAT_2401_CUSTOM4,
+	MIPI_FORMAT_2401_CUSTOM5,
+	MIPI_FORMAT_2401_CUSTOM6,
+	MIPI_FORMAT_2401_CUSTOM7,
 	//MIPI_FORMAT_RAW16, /*not supported by 2401*/
 	//MIPI_FORMAT_RAW18,
-	N_MIPI_FORMAT
-} mipi_format_t;
+	N_MIPI_FORMAT_2401
+} mipi_format_2401_t;
 
 #define N_MIPI_FORMAT_CUSTOM	8
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index af153c3fb86d..b58f4fd4a35c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -211,142 +211,160 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 }
 #endif /* #if !defined(ISP2401) */
 
-int ia_css_isys_convert_stream_format_to_mipi_format(
-    enum atomisp_input_format input_format,
-    mipi_predictor_t compression,
-    unsigned int *fmt_type)
+#if !defined(ISP2401)
+static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
+					 unsigned int *fmt_type)
 {
-	assert(fmt_type);
-	/*
-	 * Custom (user defined) modes. Used for compressed
-	 * MIPI transfers
-	 *
-	 * Checkpatch thinks the indent before "if" is suspect
-	 * I think the only suspect part is the missing "else"
-	 * because of the return.
-	 */
-	if (compression != MIPI_PREDICTOR_NONE) {
-		switch (input_format) {
-		case ATOMISP_INPUT_FORMAT_RAW_6:
-			*fmt_type = 6;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_7:
-			*fmt_type = 7;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_8:
-			*fmt_type = 8;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_10:
-			*fmt_type = 10;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_12:
-			*fmt_type = 12;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_14:
-			*fmt_type = 14;
-			break;
-		case ATOMISP_INPUT_FORMAT_RAW_16:
-			*fmt_type = 16;
-			break;
-		default:
-			return -EINVAL;
-		}
-		return 0;
-	}
-	/*
-	 * This mapping comes from the Arasan CSS function spec
-	 * (CSS_func_spec1.08_ahb_sep29_08.pdf).
-	 *
-	 * MW: For some reason the mapping is not 1-to-1
-	 */
 	switch (input_format) {
 	case ATOMISP_INPUT_FORMAT_RGB_888:
-		*fmt_type = MIPI_FORMAT_RGB888;
+		*fmt_type = MIPI_FORMAT_2400_RGB888;
 		break;
 	case ATOMISP_INPUT_FORMAT_RGB_555:
-		*fmt_type = MIPI_FORMAT_RGB555;
+		*fmt_type = MIPI_FORMAT_2400_RGB555;
 		break;
 	case ATOMISP_INPUT_FORMAT_RGB_444:
-		*fmt_type = MIPI_FORMAT_RGB444;
+		*fmt_type = MIPI_FORMAT_2400_RGB444;
 		break;
 	case ATOMISP_INPUT_FORMAT_RGB_565:
-		*fmt_type = MIPI_FORMAT_RGB565;
+		*fmt_type = MIPI_FORMAT_2400_RGB565;
 		break;
 	case ATOMISP_INPUT_FORMAT_RGB_666:
-		*fmt_type = MIPI_FORMAT_RGB666;
+		*fmt_type = MIPI_FORMAT_2400_RGB666;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_8:
-		*fmt_type = MIPI_FORMAT_RAW8;
+		*fmt_type = MIPI_FORMAT_2400_RAW8;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_10:
-		*fmt_type = MIPI_FORMAT_RAW10;
+		*fmt_type = MIPI_FORMAT_2400_RAW10;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_6:
-		*fmt_type = MIPI_FORMAT_RAW6;
+		*fmt_type = MIPI_FORMAT_2400_RAW6;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_7:
-		*fmt_type = MIPI_FORMAT_RAW7;
+		*fmt_type = MIPI_FORMAT_2400_RAW7;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_12:
-		*fmt_type = MIPI_FORMAT_RAW12;
+		*fmt_type = MIPI_FORMAT_2400_RAW12;
 		break;
 	case ATOMISP_INPUT_FORMAT_RAW_14:
-		*fmt_type = MIPI_FORMAT_RAW14;
+		*fmt_type = MIPI_FORMAT_2400_RAW14;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_8:
-		*fmt_type = MIPI_FORMAT_YUV420_8;
+		*fmt_type = MIPI_FORMAT_2400_YUV420_8;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_10:
-		*fmt_type = MIPI_FORMAT_YUV420_10;
+		*fmt_type = MIPI_FORMAT_2400_YUV420_10;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV422_8:
-		*fmt_type = MIPI_FORMAT_YUV422_8;
+		*fmt_type = MIPI_FORMAT_2400_YUV422_8;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV422_10:
-		*fmt_type = MIPI_FORMAT_YUV422_10;
+		*fmt_type = MIPI_FORMAT_2400_YUV422_10;
 		break;
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
-		*fmt_type = MIPI_FORMAT_YUV420_8_LEGACY;
+		*fmt_type = MIPI_FORMAT_2400_YUV420_8_LEGACY;
 		break;
 	case ATOMISP_INPUT_FORMAT_EMBEDDED:
-		*fmt_type = MIPI_FORMAT_EMBEDDED;
+		*fmt_type = MIPI_FORMAT_2400_EMBEDDED;
 		break;
-#ifndef ISP2401
 	case ATOMISP_INPUT_FORMAT_RAW_16:
 		/* This is not specified by Arasan, so we use
 		 * 17 for now.
 		 */
-		*fmt_type = MIPI_FORMAT_RAW16;
+		*fmt_type = MIPI_FORMAT_2400_RAW16;
 		break;
 	case ATOMISP_INPUT_FORMAT_BINARY_8:
 		*fmt_type = MIPI_FORMAT_BINARY_8;
 		break;
-#else
+	case ATOMISP_INPUT_FORMAT_YUV420_16:
+	case ATOMISP_INPUT_FORMAT_YUV422_16:
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+#endif /* #ifndef ISP2401 */
+
+#if defined(ISP2401)
+static int ia_css_isys_2401_set_fmt_type(enum atomisp_input_format input_format,
+					 unsigned int *fmt_type)
+{
+	switch (input_format) {
+	case ATOMISP_INPUT_FORMAT_RGB_888:
+		*fmt_type = MIPI_FORMAT_2401_RGB888;
+		break;
+	case ATOMISP_INPUT_FORMAT_RGB_555:
+		*fmt_type = MIPI_FORMAT_2401_RGB555;
+		break;
+	case ATOMISP_INPUT_FORMAT_RGB_444:
+		*fmt_type = MIPI_FORMAT_2401_RGB444;
+		break;
+	case ATOMISP_INPUT_FORMAT_RGB_565:
+		*fmt_type = MIPI_FORMAT_2401_RGB565;
+		break;
+	case ATOMISP_INPUT_FORMAT_RGB_666:
+		*fmt_type = MIPI_FORMAT_2401_RGB666;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_8:
+		*fmt_type = MIPI_FORMAT_2401_RAW8;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_10:
+		*fmt_type = MIPI_FORMAT_2401_RAW10;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_6:
+		*fmt_type = MIPI_FORMAT_2401_RAW6;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_7:
+		*fmt_type = MIPI_FORMAT_2401_RAW7;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_12:
+		*fmt_type = MIPI_FORMAT_2401_RAW12;
+		break;
+	case ATOMISP_INPUT_FORMAT_RAW_14:
+		*fmt_type = MIPI_FORMAT_2401_RAW14;
+		break;
+	case ATOMISP_INPUT_FORMAT_YUV420_8:
+		*fmt_type = MIPI_FORMAT_2401_YUV420_8;
+		break;
+	case ATOMISP_INPUT_FORMAT_YUV420_10:
+		*fmt_type = MIPI_FORMAT_2401_YUV420_10;
+		break;
+	case ATOMISP_INPUT_FORMAT_YUV422_8:
+		*fmt_type = MIPI_FORMAT_2401_YUV422_8;
+		break;
+	case ATOMISP_INPUT_FORMAT_YUV422_10:
+		*fmt_type = MIPI_FORMAT_2401_YUV422_10;
+		break;
+	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
+		*fmt_type = MIPI_FORMAT_2401_YUV420_8_LEGACY;
+		break;
+	case ATOMISP_INPUT_FORMAT_EMBEDDED:
+		*fmt_type = MIPI_FORMAT_2401_EMBEDDED;
+		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF1:
-		*fmt_type = MIPI_FORMAT_CUSTOM0;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM0;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF2:
-		*fmt_type = MIPI_FORMAT_CUSTOM1;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM1;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF3:
-		*fmt_type = MIPI_FORMAT_CUSTOM2;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM2;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF4:
-		*fmt_type = MIPI_FORMAT_CUSTOM3;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM3;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF5:
-		*fmt_type = MIPI_FORMAT_CUSTOM4;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM4;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF6:
-		*fmt_type = MIPI_FORMAT_CUSTOM5;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM5;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF7:
-		*fmt_type = MIPI_FORMAT_CUSTOM6;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM6;
 		break;
 	case ATOMISP_INPUT_FORMAT_USER_DEF8:
-		*fmt_type = MIPI_FORMAT_CUSTOM7;
+		*fmt_type = MIPI_FORMAT_2401_CUSTOM7;
 		break;
-#endif
 
 	case ATOMISP_INPUT_FORMAT_YUV420_16:
 	case ATOMISP_INPUT_FORMAT_YUV422_16:
@@ -355,6 +373,62 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
 	}
 	return 0;
 }
+#endif /* #ifdef ISP2401 */
+
+int ia_css_isys_convert_stream_format_to_mipi_format(
+    enum atomisp_input_format input_format,
+    mipi_predictor_t compression,
+    unsigned int *fmt_type)
+{
+	assert(fmt_type);
+	/*
+	 * Custom (user defined) modes. Used for compressed
+	 * MIPI transfers
+	 *
+	 * Checkpatch thinks the indent before "if" is suspect
+	 * I think the only suspect part is the missing "else"
+	 * because of the return.
+	 */
+	if (compression != MIPI_PREDICTOR_NONE) {
+		switch (input_format) {
+		case ATOMISP_INPUT_FORMAT_RAW_6:
+			*fmt_type = 6;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_7:
+			*fmt_type = 7;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_8:
+			*fmt_type = 8;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_10:
+			*fmt_type = 10;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_12:
+			*fmt_type = 12;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_14:
+			*fmt_type = 14;
+			break;
+		case ATOMISP_INPUT_FORMAT_RAW_16:
+			*fmt_type = 16;
+			break;
+		default:
+			return -EINVAL;
+		}
+		return 0;
+	}
+	/*
+	 * This mapping comes from the Arasan CSS function spec
+	 * (CSS_func_spec1.08_ahb_sep29_08.pdf).
+	 *
+	 * MW: For some reason the mapping is not 1-to-1
+	 */
+#if defined(ISP2401)
+	return ia_css_isys_2401_set_fmt_type(input_format, fmt_type);
+#else
+	return ia_css_isys_2400_set_fmt_type(input_format, fmt_type);
+#endif
+}
 
 #if defined(ISP2401)
 static mipi_predictor_t sh_css_csi2_compression_type_2_mipi_predictor(
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 8fc7746f8639..def8a0b1d2ec 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -689,7 +689,7 @@ static bool calculate_be_cfg(
 		cfg->csi_mipi_cfg.comp_scheme = isys_cfg->csi_port_attr.comp_scheme;
 		cfg->csi_mipi_cfg.comp_predictor = isys_cfg->csi_port_attr.comp_predictor;
 		cfg->csi_mipi_cfg.comp_bit_idx = cfg->csi_mipi_cfg.data_type -
-						 MIPI_FORMAT_CUSTOM0;
+						 MIPI_FORMAT_2401_CUSTOM0;
 	}
 
 	return true;
@@ -856,10 +856,10 @@ static csi_mipi_packet_type_t get_csi_mipi_packet_type(
 
 	packet_type = CSI_MIPI_PACKET_TYPE_RESERVED;
 
-	if (data_type >= 0 && data_type <= MIPI_FORMAT_SHORT8)
+	if (data_type >= 0 && data_type <= MIPI_FORMAT_2401_SHORT8)
 		packet_type = CSI_MIPI_PACKET_TYPE_SHORT;
 
-	if (data_type > MIPI_FORMAT_SHORT8 && data_type <= N_MIPI_FORMAT)
+	if (data_type > MIPI_FORMAT_2401_SHORT8 && data_type <= N_MIPI_FORMAT_2401)
 		packet_type = CSI_MIPI_PACKET_TYPE_LONG;
 
 	return packet_type;
-- 
2.41.0

