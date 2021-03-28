Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CCC34BF9A
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 00:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhC1WpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Mar 2021 18:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhC1WpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Mar 2021 18:45:17 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BA2C061756;
        Sun, 28 Mar 2021 15:45:17 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id f12so8181058qtq.4;
        Sun, 28 Mar 2021 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=nsEmdX6mc+ybUXc2Qg6U7WBlqgMs1mkM3+2oHxyzbWkHy5FonGwB+0RRKYSCEShtVZ
         SkVKyu/K+4s3d5pIpfTWJA6uIrh/6ECdm8/Gt4aFrR1dG9kiG7iG8WBxHXovZTUOuXzN
         QT+yZ/uAH+6dvOxZB4Y+BHtrZ3HvUzGwpeitMHmE/iQ8yWYq7ZVcUJrfGejWTCX1t/0Q
         V16nreJSl2wLxlm8EoAr30fsv2Q0KFynXDIuZA9CiOkf0ylWNeEI3y8hJlgRjqNZD9H8
         5j+eVkqHqYpuGFnuciPIUJuimU47AWOYAkg7G6DcIvwEW7d/g1wcO5+CTliTII81l+L+
         jB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8RXOlSm03VbeMbySXyCFRFEgeMcD59AdNwl/nJLNOYw=;
        b=XiOMBjEGRr1HDoc93V2F82DVTaq+4ii3YitZNY7GCtQ6vHUw3flZXe/2Re3RKFw9xu
         PIFz7yyeZel5BunPtRaCRHWLHm17MqpZpDqGvFS68/9zE40S0QG78FGWZq6LxVV0XQgE
         rsko9ylzvdr8Ua3IwDhZ5QSK843vIHbSRjS88NppRrygyiB9UegfOqI3rEaLePIvzdPF
         VctKBpmLrjM8qe9epE2GhZe6WyfMAOqNIVjgx8t6JJmTWWeVfFNL1ipXrps7wxG+mb5l
         ilkLmV/Lleru9tdvb39sX+BN1XLEOyNMG2end+aA3vI9N9PyYUWwnlzffblXtx0b5JmF
         cr8Q==
X-Gm-Message-State: AOAM532qyw98Y3YOyh/Sidmkb1qJFZ8zdoEOcCV8XjM30ebh+OfW+BzB
        K1RwYf+opHzSQb5rfaRdWvI=
X-Google-Smtp-Source: ABdhPJxYLqkBm8dJsbUCNagLo5grTrrqPgxi2R6LQPcesM1Lc6lP/+8e4ZQAQg/MHjkCzYw22ztkXQ==
X-Received: by 2002:ac8:45c9:: with SMTP id e9mr19842001qto.178.1616971516583;
        Sun, 28 Mar 2021 15:45:16 -0700 (PDT)
Received: from localhost.localdomain ([177.189.249.24])
        by smtp.googlemail.com with ESMTPSA id q24sm11668595qki.120.2021.03.28.15.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 15:45:16 -0700 (PDT)
From:   Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
Cc:     rodrigoffzz@gmail.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: add ibuf_ctrl_rmgr.c to ISP2401 build only
Date:   Sun, 28 Mar 2021 19:43:04 -0300
Message-Id: <20210328224304.90918-1-rodrigoffzz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When CONFIG_VIDEO_ATOMISP_ISP2401 is not set, sparse shows
the following warnings:

drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:34:6: warning: symbol 'ia_css_isys_ibuf_rmgr_init' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:40:6: warning: symbol 'ia_css_isys_ibuf_rmgr_uninit' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:46:6: warning: symbol 'ia_css_isys_ibuf_rmgr_acquire' was not declared. Should it be static?
drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.c:106:6: warning: symbol 'ia_css_isys_ibuf_rmgr_release' was not declared. Should it be static?

The symbols stated as not declared are actually declared
under ISP2401 definition in ia_css_isys.h.
So, the file ibuf_ctrl_rmgr.c should be compiled only when
ISP2401 is enabled.

Signed-off-by: Rodrigo Figueiredo Zaiden <rodrigoffzz@gmail.com>
---
 drivers/staging/media/atomisp/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 1dfad0dd02d0..555f2efa35b7 100644
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
@@ -175,7 +174,8 @@ obj-cht = \
 	pci/css_2401_system/host/ibuf_ctrl.o \
 	pci/css_2401_system/host/isys_dma.o \
 	pci/css_2401_system/host/isys_irq.o \
-	pci/css_2401_system/host/isys_stream2mmio.o
+	pci/css_2401_system/host/isys_stream2mmio.o \
+	pci/runtime/isys/src/ibuf_ctrl_rmgr.o
 
 INCLUDES += \
 	-I$(atomisp)/ \
-- 
2.25.1

