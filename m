Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B413205A7
	for <lists+linux-media@lfdr.de>; Sat, 20 Feb 2021 15:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhBTORT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Feb 2021 09:17:19 -0500
Received: from mail-pf1-f172.google.com ([209.85.210.172]:34747 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhBTORT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Feb 2021 09:17:19 -0500
Received: by mail-pf1-f172.google.com with SMTP id m6so3792364pfk.1;
        Sat, 20 Feb 2021 06:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=4OkHhkzvFQiowFhMieNatI/2LoPDzKsla6UJw7fnLaE=;
        b=tiUmLHU0maWdpom8uKQwRrJR5xMBbebfAU/ojVt/u97akhmtJkSNoNIKNnuFeUfAux
         i98RS2RVEc7hDj0+4m9+ch6l0lvkwG6eipFtLyOLiTX8cwRxbC1kJPEsxN68Yr/7D4ws
         qLD/da/1dw7mHyyZGriuWbAwnAuOChpLgOPcm/tpGJy7P1BOeK+uhfcKdlwlDSMduj/l
         04ZBIW7eAIY8K7mITOGjyRGMtEH+13O1s7jPYAP8U/oOJjZw2zUGONPOSKWmwcAcdcIf
         o9cPbzn6mRT6TitCm0IEngOo3eQA/+1mD/Cq1c6JPhr4ie8lsp9n4xWi8/NwOleVHJmT
         duQw==
X-Gm-Message-State: AOAM5321OHi8GQhLd0DkI6UCC+f+BNUrVkT/p1XfNySv6Xu/Ef4K2pSZ
        hnVldWTtYks7VODj4Y9eSOU=
X-Google-Smtp-Source: ABdhPJxmDWIXoSSt5X6KOjyKi38zdn3BaeHf781aDGPkh5prWqaZ4E+Q+Lt6y32PoynZXEg2GazUMA==
X-Received: by 2002:a05:6a00:8f:b029:1e8:6975:395e with SMTP id c15-20020a056a00008fb02901e86975395emr6552245pfj.55.1613830598292;
        Sat, 20 Feb 2021 06:16:38 -0800 (PST)
Received: from karthik-strix-linux.karthek.com ([192.140.155.84])
        by smtp.gmail.com with ESMTPSA id u9sm5220857pgc.59.2021.02.20.06.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 06:16:37 -0800 (PST)
Date:   Sat, 20 Feb 2021 19:46:27 +0530
From:   karthik alapati <mail@karthek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp: don't compile unused code
Message-ID: <YDEZu3oniT/vUMMY@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

currently the functions defined in ibuf_ctrl_rmgr.c file are only
used by isys_init.c when CONFIG_VIDEO_ATOMISP_ISP2401 is selected
so dont't compile it when not needed, also fixes some sparse warnings

Signed-off-by: karthik alapati <mail@karthek.com>
---
is this the right patch or just compiling out those functions
by conditional comiplation is sufficient?

 drivers/staging/media/atomisp/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1dfad0dd0..51498b2e8 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -126,7 +126,6 @@ atomisp-objs += \
 	pci/runtime/inputfifo/src/inputfifo.o \
 	pci/runtime/isp_param/src/isp_param.o \
 	pci/runtime/isys/src/csi_rx_rmgr.o \
-	pci/runtime/isys/src/ibuf_ctrl_rmgr.o \
 	pci/runtime/isys/src/isys_dma_rmgr.o \
 	pci/runtime/isys/src/isys_init.o \
 	pci/runtime/isys/src/isys_stream2mmio_rmgr.o \
@@ -323,7 +322,9 @@ DEFINES := -DHRT_HW -DHRT_ISP_CSS_CUSTOM_HOST -DHRT_USE_VIR_ADDRS -D__HOST__
 #DEFINES += -DUSE_KMEM_CACHE
 
 ifeq ($(CONFIG_VIDEO_ATOMISP_ISP2401),y)
-atomisp-objs += $(obj-cht)
+atomisp-objs += \
+	$(obj-cht) \
+	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
 DEFINES += -DISP2401 -DISP2401_NEW_INPUT_SYSTEM -DSYSTEM_hive_isp_css_2401_system
 else
 atomisp-objs += $(obj-byt)
-- 
2.30.1

