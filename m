Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101B2275329
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 10:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgIWIWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 04:22:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgIWIWF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 04:22:05 -0400
Received: from mail.kernel.org (ip5f5ad5c8.dynamic.kabel-deutschland.de [95.90.213.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0406E235FC;
        Wed, 23 Sep 2020 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600849324;
        bh=jLE0auYGkt+7QEDu1/gRGx9UABSeW0dI/eNeyaaSz88=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g3jvSufxvkEVJHt2kCMIYZ8ZFbP+NR8TpIuCsdUaI5rTHLLiJRyEVEFfNXvCjWk07
         tMuz5h+5LNMYi1p2vwFPQE0M34dFZeruUMyIOH6C1H6262Df7SO2iTjoVjSfYh5cX2
         YCGC0gcWRj1sHLPpSlDRYMyRu0Tg/h5koCNetC+I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kL02L-001F22-92; Wed, 23 Sep 2020 10:22:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: atomisp: cleanup __printf() atributes on printk messages
Date:   Wed, 23 Sep 2020 10:22:00 +0200
Message-Id: <01cc2ec6ea044731e939e5e47f7e115b86f49465.1600849288.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <8e3d5d4baf0781974a224e284e837665c0d26f92.1600849288.git.mchehab+huawei@kernel.org>
References: <8e3d5d4baf0781974a224e284e837665c0d26f92.1600849288.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are still some warnings produced by -Wsuggest-attribute=format,
like this one:

	drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c: In function ‘dtrace_dot’:
	drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:2466:2: warning: function ‘dtrace_dot’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	 2466 |  ia_css_debug_vdtrace(IA_CSS_DEBUG_INFO, fmt, ap);
	      |  ^~~~~~~~~~~~~~~~~~~~

Also, on some places, is is using __atribute, while on others it
is using the __printf() macro.

Uniform those to always use the __printf() macro, placing it
before the function, and fix the logic in order to cleanup
all such warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 +++----
 .../atomisp/pci/hive_isp_css_include/print_support.h     | 3 +--
 drivers/staging/media/atomisp/pci/ia_css_env.h           | 4 ++--
 .../atomisp/pci/runtime/debug/interface/ia_css_debug.h   | 9 +++++----
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c   | 3 +--
 drivers/staging/media/atomisp/pci/sh_css.c               | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_internal.h      | 8 +++-----
 7 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 85b39de7bc28..faa0935e536a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -159,15 +159,14 @@ static void atomisp_css2_hw_load(hrt_address addr, void *to, uint32_t n)
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
-static int  __attribute__((format (printf, 1, 0)))
-atomisp_css2_dbg_ftrace_print(const char *fmt, va_list args)
+static int  __printf(1, 0) atomisp_css2_dbg_ftrace_print(const char *fmt,
+							 va_list args)
 {
 	ftrace_vprintk(fmt, args);
 	return 0;
 }
 
-static int  __attribute__((format (printf, 1, 0)))
-atomisp_vprintk(const char *fmt, va_list args)
+static int  __printf(1, 0) atomisp_vprintk(const char *fmt, va_list args)
 {
 	vprintk(fmt, args);
 	return 0;
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
index 749f5c3725bd..540b405cc0f7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h
@@ -20,8 +20,7 @@
 
 extern int (*sh_css_printf)(const char *fmt, va_list args);
 /* depends on host supplied print function in ia_css_init() */
-static inline  __attribute__((format (printf, 1, 0)))
-void ia_css_print(const char *fmt, ...)
+static inline  __printf(1, 2) void ia_css_print(const char *fmt, ...)
 {
 	va_list ap;
 
diff --git a/drivers/staging/media/atomisp/pci/ia_css_env.h b/drivers/staging/media/atomisp/pci/ia_css_env.h
index 9808ff9e0492..6b38723b27cd 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_env.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_env.h
@@ -75,9 +75,9 @@ struct ia_css_hw_access_env {
 /* Environment with function pointers to print error and debug messages.
  */
 struct ia_css_print_env {
-	int (*debug_print)(const char *fmt, va_list args) __attribute__((format (printf, 1, 0)));
+	int  __printf(1, 0) (*debug_print)(const char *fmt, va_list args);
 	/** Print a debug message. */
-	int (*error_print)(const char *fmt, va_list args) __attribute__((format (printf, 1, 0)));
+	int  __printf(1, 0) (*error_print)(const char *fmt, va_list args);
 	/** Print an error message.*/
 };
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 0f9b7eb17647..5e6e7447ae00 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -129,15 +129,16 @@ enum ia_css_debug_enable_param_dump {
  * @param[in]	fmt		printf like format string
  * @param[in]	args		arguments for the format string
  */
-static inline void
-ia_css_debug_vdtrace(unsigned int level, const char *fmt, va_list args)
+static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
+						       const char *fmt,
+						       va_list args)
 {
 	if (dbg_level >= level)
 		sh_css_vprint(fmt, args);
 }
 
-__printf(2, 3)
-void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...);
+__printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
+					const char *fmt, ...);
 
 /*! @brief Dump sp thread's stack contents
  * SP thread's stack contents are set to 0xcafecafe. This function dumps the
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 4f637e7219a6..05ce0f73f5ae 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -2454,8 +2454,7 @@ ia_css_debug_mode_enable_dma_channel(int dma_id,
 	return rc;
 }
 
-static
-void dtrace_dot(const char *fmt, ...)
+static void __printf(1, 2) dtrace_dot(const char *fmt, ...)
 {
 	va_list ap;
 
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index c50b5fba7b86..e8c5caf3dfe6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -111,7 +111,7 @@ static int thread_alive;
 
 struct sh_css my_css;
 
-int (*sh_css_printf)(const char *fmt, va_list args) = NULL;
+int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args) = NULL;
 
 /* modes of work: stream_create and stream_destroy will update the save/restore data
    only when in working mode, not suspend/resume
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 415353ceb7f6..3c669ec79b68 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -907,10 +907,9 @@ struct host_sp_queues {
 #define SIZE_OF_HOST_SP_QUEUES_STRUCT		\
 	(SIZE_OF_QUEUES_ELEMS + SIZE_OF_QUEUES_DESC)
 
-extern int (*sh_css_printf)(const char *fmt, va_list args);
+extern int  __printf(1, 0) (*sh_css_printf)(const char *fmt, va_list args);
 
-static inline void
-sh_css_print(const char *fmt, ...)
+static inline void  __printf(1, 2) sh_css_print(const char *fmt, ...)
 {
 	va_list ap;
 
@@ -921,8 +920,7 @@ sh_css_print(const char *fmt, ...)
 	}
 }
 
-static inline void
-sh_css_vprint(const char *fmt, va_list args)
+static inline void  __printf(1, 0) sh_css_vprint(const char *fmt, va_list args)
 {
 	if (sh_css_printf)
 		sh_css_printf(fmt, args);
-- 
2.26.2

