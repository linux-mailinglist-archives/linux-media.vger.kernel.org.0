Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02876320B7F
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 16:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhBUPjh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 10:39:37 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173]:35385 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhBUPj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 10:39:28 -0500
Received: by mail-pl1-f173.google.com with SMTP id g20so6071153plo.2;
        Sun, 21 Feb 2021 07:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ztDsdAIBTtQ1nkN7dw6CYE5xnJ1DaXEAMZjHk0Yhkkw=;
        b=CLzlTYsr6Eu0qk/JsV6OjIPnc1bglXxs2lXVLQ2nP5+4Q/o4TKStFUjlHIk9mqkenX
         vtz+/hSTVrnfQDTDfd9tc4ulnGFIzYOP00TaBOg6SxAFbMcT/MUstsnsalUtDHq5Plh0
         45BM3CGMW8NhqMbRRrEux5naceAZiRVg0MpS9NV72Fa/3e2oNGREVcmyDezFo+8CEYBo
         fLrDflOEg+o/JDki4cSzQNYDwhiAc4yAwMXW7LLVAUgKv2eX9y7nxxR4t696Q7XSb0qT
         xnT3Ytu9//uLT8k/z1FqNZ+icpNV2ypQQpvPlS3z2eGJj3mfbzXJcstD+7usMGxsv62O
         8r5A==
X-Gm-Message-State: AOAM532ecjwAImnmOpDBbn2B/y2zWjrQ6ZvUx4f4SzRU5ZiDso3JTYtQ
        1PR2yzwhPY2m24Y6h4yt9Y0=
X-Google-Smtp-Source: ABdhPJy7ew3irN+CjCeSThYxeb8w3rsTyMjhsPtQX1cWNgJT0jqJxGKKKXDh1DmGmsMnGXZx5F5UGQ==
X-Received: by 2002:a17:902:c114:b029:e3:b2e7:d410 with SMTP id 20-20020a170902c114b02900e3b2e7d410mr15102746pli.16.1613921925678;
        Sun, 21 Feb 2021 07:38:45 -0800 (PST)
Received: from karthik-strix-linux.karthek.com ([192.140.154.12])
        by smtp.gmail.com with ESMTPSA id o20sm14636124pjt.43.2021.02.21.07.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 07:38:45 -0800 (PST)
Date:   Sun, 21 Feb 2021 21:08:40 +0530
From:   karthik alapati <mail@karthek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp: don't compile unused code
Message-ID: <YDJ+gDMyBeNp0Jft@karthik-strix-linux.karthek.com>
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

