Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B12751E38
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbjGMKFj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234439AbjGMKFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F07199E
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1aYxseSOr2d/dfdCoFr/Ka7XZlCqqs2xH+zw/vb04Pw=;
        b=PcMGIgidvT2n8dPEwHg3PYgl3UmqlsCZ55zf+4ue8+CqXEPYOiXVu/3mf8ybkiaCO5AWRU
        ylWoeDBeyKgHPA8JtFk16EgURMHBqzkyhUDSe6/uIAmDTDNle3sI87h1PP+FwFEKPbz8Jf
        /vETknmk2USR/jIvnwFzxba2tGQgVqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-SFMMIbHUOgu1TiQwomqeJg-1; Thu, 13 Jul 2023 06:04:16 -0400
X-MC-Unique: SFMMIbHUOgu1TiQwomqeJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5177800193;
        Thu, 13 Jul 2023 10:04:15 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0023E111E3EB;
        Thu, 13 Jul 2023 10:04:11 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 09/11] media: atomisp: Compile the object codes for a generic driver
Date:   Thu, 13 Jul 2023 18:02:29 +0800
Message-ID: <20230713100231.308923-10-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since a generic driver should support every type of atomisp, all the
codes need to be compiled. The ISP2401 flag controls the Makefile to build
the binary file for ISP2400 and ISP2401. Therefore, this section of
Makefile should be removed allowing all the necessary codes can be built.
Moreover, some parts of "removing #ifdef ISP2401" works are related to it
so they were also removed here.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/Makefile               | 12 ++----------
 .../atomisp/pci/runtime/isys/interface/ia_css_isys.h |  9 +--------
 .../pci/runtime/isys/interface/ia_css_isys_comm.h    |  2 --
 .../media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c |  2 --
 .../atomisp/pci/runtime/isys/src/isys_dma_rmgr.c     |  2 --
 .../pci/runtime/isys/src/isys_stream2mmio_rmgr.c     |  2 --
 .../atomisp/pci/runtime/isys/src/virtual_isys.c      |  2 --
 7 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 38b370124109..dcf469bf1cb4 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -150,13 +150,8 @@ atomisp-objs += \
 	pci/hive_isp_css_common/host/timed_ctrl.o \
 	pci/hive_isp_css_common/host/vmem.o \
 	pci/hive_isp_css_shared/host/tag.o \
-	pci/system_local.o
-
-# These will be needed when clean merge CHT support nicely into the driver
-# Keep them here handy for when we get to that point
-#
-
-obj-cht = \
+	pci/system_local.o \
+	pci/runtime/isys/src/ibuf_ctrl_rmgr.o \
 	pci/css_2401_system/host/csi_rx.o \
 	pci/css_2401_system/host/ibuf_ctrl.o \
 	pci/css_2401_system/host/isys_dma.o \
@@ -307,9 +302,6 @@ DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 #DEFINES += -DUSE_KMEM_CACHE
 
 ifeq ($(CONFIG_VIDEO_ATOMISP_ISP2401),y)
-atomisp-objs += \
-	$(obj-cht) \
-	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
 DEFINES += -DISP2401
 endif
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
index 711a321e9a3f..d067b9fc43c7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys.h
@@ -24,20 +24,18 @@
 #include <system_global.h>
 #include "ia_css_isys_comm.h"
 
-#ifdef ISP2401
 /**
  * Virtual Input System. (Input System 2401)
  */
 typedef isp2401_input_system_cfg_t	ia_css_isys_descr_t;
 /* end of Virtual Input System */
-#endif
+
 
 input_system_err_t ia_css_isys_init(void);
 void ia_css_isys_uninit(void);
 enum mipi_port_id ia_css_isys_port_to_mipi_port(
     enum mipi_port_id api_port);
 
-#if defined(ISP2401)
 
 /**
  * @brief Register one (virtual) stream. This is used to track when all
@@ -74,9 +72,7 @@ int ia_css_isys_convert_compressed_format(
     struct isp2401_input_system_cfg_s *cfg);
 unsigned int ia_css_csi2_calculate_input_system_alignment(
     enum atomisp_input_format fmt_type);
-#endif
 
-#if !defined(ISP2401)
 /* CSS Receiver */
 void ia_css_isys_rx_configure(
     const rx_cfg_t *config,
@@ -93,7 +89,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
 				   unsigned int irq_infos);
 unsigned int ia_css_isys_rx_translate_irq_infos(unsigned int bits);
 
-#endif /* #if !defined(ISP2401) */
 
 /* @brief Translate format and compression to format type.
  *
@@ -111,7 +106,6 @@ int ia_css_isys_convert_stream_format_to_mipi_format(
     mipi_predictor_t compression,
     unsigned int *fmt_type);
 
-#ifdef ISP2401
 /**
  * Virtual Input System. (Input System 2401)
  */
@@ -178,6 +172,5 @@ void ia_css_isys_stream2mmio_sid_rmgr_release(
     stream2mmio_sid_ID_t	*sid);
 
 /* end of Virtual Input System */
-#endif
 
 #endif				/* __IA_CSS_ISYS_H__ */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
index d80ef42c7a64..784afc82c8d2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/interface/ia_css_isys_comm.h
@@ -19,7 +19,6 @@
 #include <type_support.h>
 #include <input_system.h>
 
-#ifdef ISP2401
 #include <platform_support.h>		/* inline */
 #include <input_system_global.h>
 #include <ia_css_stream_public.h>	/* IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH */
@@ -50,5 +49,4 @@ static inline uint32_t ia_css_isys_generate_stream_id(
 	return sp_thread_id * IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH + stream_id;
 }
 
-#endif  /* ISP2401*/
 #endif  /*_IA_CSS_ISYS_COMM_H */
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
index 3fc9fed1e516..881036c67baf 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.c
@@ -15,7 +15,6 @@
 
 #include "system_global.h"
 
-#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
@@ -165,4 +164,3 @@ int ia_css_isys_csi_rx_unregister_stream(
 	}
 	return retval;
 }
-#endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
index 261c6460e970..4df0a9188ee6 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.c
@@ -15,7 +15,6 @@
 
 #include "system_global.h"
 
-#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
@@ -85,4 +84,3 @@ void ia_css_isys_dma_channel_rmgr_release(
 		}
 	}
 }
-#endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
index fb0cb183f701..b6be63746c3e 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.c
@@ -15,7 +15,6 @@
 
 #include "system_global.h"
 
-#ifdef ISP2401
 
 #include "assert_support.h"
 #include "platform_support.h"
@@ -87,4 +86,3 @@ void ia_css_isys_stream2mmio_sid_rmgr_release(
 		}
 	}
 }
-#endif
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index def8a0b1d2ec..269a81190577 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -17,7 +17,6 @@
 
 #include "system_global.h"
 
-#ifdef ISP2401
 
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
@@ -866,4 +865,3 @@ static csi_mipi_packet_type_t get_csi_mipi_packet_type(
 }
 
 /* end of Private Methods */
-#endif
-- 
2.41.0

