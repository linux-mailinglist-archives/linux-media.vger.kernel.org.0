Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E40B701B4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbfGVNuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:50:23 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55875 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfGVNuX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:50:23 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MZCvh-1hthSP1pyb-00V6EA; Mon, 22 Jul 2019 15:50:12 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [RESEND] media: davinci-vpbe: remove obsolete includes
Date:   Mon, 22 Jul 2019 15:49:58 +0200
Message-Id: <20190722134958.3355214-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TDsPCZQKsvmVIO5hEh950ODb54WKVDH46JI0vG48NQInGDcqePk
 gz4bCEku/ETTYMyoXTk2jFhA73l3ChGvUPttFhXofwW2wWWbCc4XqUn3yqOpEKQT2fOjTxq
 EY592ZUoU5a9O4DcYgGPF5386QsKYy709/wmNfiXKDPuLiyqm0swvmIGQyjvoNf/B4JF1FP
 tSmGmU226zmu+5/WxwD3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZeHOX4RFVIM=:TfjsQSMnkQtrZXLmoqZK/X
 UlYa1LrvYfjMNwK2LLuFJ4yo0iJ9yyWET/WLggXJSJpZrfpWmQckQ8J3O4T3LMC3WGT0EJLh7
 Z5gEjJHUthmYmRu9MAaFL439ZNKGq8ohqj6MhGf2BhWLhzc838I+h6cM0cU3/izLL9l02YyP2
 YXU6MyV6KLngALZBKFGlHIVMPShwOECfxzLanMIJX6Emmw2RSrXjlSkZkUu3VAam6OyhGbvO/
 zEmVQNq096RjlrNj4U1Z/QR83UZ7Rz4cMHWBEJpoKnr1N/E2EtlpHBFZXeOq1xeGch9hrJY5i
 CGxqIKTv+Hl4cvuyAb8Pb5MRG+a84Kxdl+Hff8VDV/GBMCsIp9nrMiq9glRQtUucLwYpycqWu
 KnLJCEMfNQQqtNc00vWsQwDxvofMQgf97ic8CsfaUJNYSriU5x9X0VoQFm3BKHOlh1taDVabR
 ALQlTwJYWjv7tpDsDAMz7+2FRbozYnwOUVWjhXAac9AZhIY8tXOFGVSHE13VwEdyvVsDnZhHh
 zG4IL7/cZQnuM0jnRx7ZvbbXp0l5wKoNCT1LM1NY+KIn4k2uvpWoTL9EfSNdA/NPxtbNhhT7s
 F7D98tWrr998iVzn3wKh65v8mbrknUSH3G3kgu4sg3D1t/Bzrl1HGn+TQr0OEIjuBagMbnm9P
 bmfAGGcNDnKfTZZ3ucpML6YQFd02PTj9boM/8cSU4xj5SmEbwoZKk2aTaLYq2Ysh55oc1rPV7
 Qa7QxuRS98fUoiwYgyCFcELv58jcrPvlP4iRnQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver builds fine without these, and they cause build
problems once davinci multiplatform support is enabled.

Acked-by: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Acked-by: Sekhar Nori <nsekhar@ti.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/davinci/vpbe_display.c | 4 ----
 drivers/media/platform/davinci/vpbe_osd.c     | 5 -----
 drivers/media/platform/davinci/vpbe_venc.c    | 5 -----
 3 files changed, 14 deletions(-)

diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 000b191c42d8..18f9408013d1 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -19,10 +19,6 @@
 
 #include <asm/pgtable.h>
 
-#ifdef CONFIG_ARCH_DAVINCI
-#include <mach/cputype.h>
-#endif
-
 #include <media/v4l2-dev.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ioctl.h>
diff --git a/drivers/media/platform/davinci/vpbe_osd.c b/drivers/media/platform/davinci/vpbe_osd.c
index 491842ef33c5..91b571a0ac2c 100644
--- a/drivers/media/platform/davinci/vpbe_osd.c
+++ b/drivers/media/platform/davinci/vpbe_osd.c
@@ -16,11 +16,6 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 
-#ifdef CONFIG_ARCH_DAVINCI
-#include <mach/cputype.h>
-#include <mach/hardware.h>
-#endif
-
 #include <media/davinci/vpss.h>
 #include <media/v4l2-device.h>
 #include <media/davinci/vpbe_types.h>
diff --git a/drivers/media/platform/davinci/vpbe_venc.c b/drivers/media/platform/davinci/vpbe_venc.c
index 425f91f07165..8caa084e5704 100644
--- a/drivers/media/platform/davinci/vpbe_venc.c
+++ b/drivers/media/platform/davinci/vpbe_venc.c
@@ -14,11 +14,6 @@
 #include <linux/videodev2.h>
 #include <linux/slab.h>
 
-#ifdef CONFIG_ARCH_DAVINCI
-#include <mach/hardware.h>
-#include <mach/mux.h>
-#endif
-
 #include <linux/platform_data/i2c-davinci.h>
 
 #include <linux/io.h>
-- 
2.20.0

