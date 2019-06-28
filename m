Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C0B598CA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfF1Kvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:51:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60229 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfF1Kvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:51:48 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MrhHm-1iJ7tB3TDo-00nh66; Fri, 28 Jun 2019 12:51:33 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: davinci-vpbe: remove obsolete includes
Date:   Fri, 28 Jun 2019 12:51:05 +0200
Message-Id: <20190628105131.3130257-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nxX3U+4ZM9iM1SCOcgx45eYQB4Et4Zv/+leVO4gmMA7AI92jFeX
 TYGYg/KjFOoYbfz/uKsDqrS2TIiaCqmwoOagcExglGofX8Pe5Q5Q+piltjM8iQ/ePFYc09Y
 Js7LavsFql/6kHhwBZc4/XHcizswY5N9/SJxP4Ya5T9kIXDiGLQmRtHP3uJZpIItAMfAVVs
 ctdRcJdy8VKHxLPbygNwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r3l2W5Lr0F0=:V0QAAh8URiEwDA35SCFCAZ
 3ibhnFD1gMsYiK/bmbzf71iEyf6jkeKI/yBqBP0KrAh04KR8+eFWm5+7B3GClLjeiIefc1Y1A
 Jb44Bc9XXldLHvAZuKcLbHtLXV6nU6QBF9KAUHajuwHV1Q6by5huuU2b11btJ8pRg+MbWQBMH
 uetx8yXyV50c4tH/dmwZsBFDUq+u+KgGTzzZ1OOWsxDq3Iv4h/ZBYHhm5eEPeMF3zoMR04se/
 +X7Y/K8LsWg2z6HvI0HjUxpDnnujn9cUkITIxFyo62zo3i8MZk4iNejWYmMTfsE95duhHznEZ
 q1dYhDtEPWjl9RN25PCFdwFUlkGf54SGLCQXyXcGYE21Zx9nCRQSDD69jiWvXVXuslPmd432O
 yyv5jzvquaE69rEHXnAtqgJWzyTryFXEjAuFk5S/Mqyc2j6lYXdDE9Lv2L2ynvUGRrlOcEqIQ
 SIgvvX54zgTnHNxv/XhBRoRrtGKJ9Y81skLorqoRXtmk9ZidOiFXHz9yJu3gkdMmQQfyG8pSd
 mdFGLVFJuMk7LHq0Z4eVTfqmdVllWh1mxddxyqkTZoV/8cDXpuhR3NTHFw8xRZF2EoeBEJGsU
 Oq8N4I02cm4kBtxNoNIisoWQEZ1GdIhua2sAlB+lCj9HvELj+ZqnVnkSstY1G+K8z5KjrNxte
 cabT/ytf8GK06GTtYayqDXsO5BWKHwayfmrYKMtMZmRKaVTZSzO/46y3ExxKEvt3oaJNbVUQh
 9liPHNqbMJnFO3B3MVbyhZR76NPLXF8xPqOpQA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver builds fine without these, and they cause build
problems once davinci multiplatform support is enabled.

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

