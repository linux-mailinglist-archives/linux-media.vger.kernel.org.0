Return-Path: <linux-media+bounces-61314-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOIUOQxtA2rF5gEAu9opvQ
	(envelope-from <linux-media+bounces-61314-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:10:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8A526F1A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74BF2301A9A7
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A73366831;
	Tue, 12 May 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="ql3IVP4u"
X-Original-To: linux-media@vger.kernel.org
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC735F185;
	Tue, 12 May 2026 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609415; cv=none; b=XSKIawLtqD6nGG4DwBPo7DjehxhowABaAwWTxOT6bcajlyQlYPzxmDg8/7mpCl2wcxVrGQTVN+513LmAA+Llled1mSDRKQtLyvFKPiQBJKUIqD/dS7ZxGMloSaB6as3SDNzhKOfOEN3zUNARlYXhyLH2y4wAw1oY4IEBUOhBv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609415; c=relaxed/simple;
	bh=dbmNzqj00M9E8ozGSSWahBG7eq8Usw3Vq6JChJl7zlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBabUMfnXbptmnsMg5SbEB1huszcX1WygTBiE2Wprsgcal5xWW6w8m3OFNQI2vBPaYzfkW2PjKOYe4QXPzfj0rtWI7aeGRc+Izz7nYTVFjysiZqotCJKvWFmhWSTnhcXxKdS4JikhpzaG07dnjliOdWeep9cxcNeJWYjx3vesEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=ql3IVP4u; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Received: from mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:494f:0:640:ed81:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id CF493C0087;
	Tue, 12 May 2026 21:10:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net (smtp) with ESMTPSA id x9PigJ7S2iE0-GGgGwotl;
	Tue, 12 May 2026 21:10:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778609406; bh=jb5bILg+ZhK9MUy4+9WQFLrMzitOSBnZe+kyjXuO+oM=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ql3IVP4uVbU8Zj91+eN7GAgAV4D28CPnnu5umZsWfsykUBcF9aXErWmJDik2JDwNZ
	 Q4SGufOWF3/HJ/x99JPtvytKfQwiaFEFy0v/xfk/r6uwOv8RsTcUqdJ7e51XfM64Tb
	 G6XF3zFoHKcWw9+6yFqFaPuwQoEShp2qgmBzmb1A=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.klg.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Melih Emik <melihemik@noirlang.tr>
Subject: [PATCH v2] atomisp: replace dbg_func parameter with dynamic debug
Date: Tue, 12 May 2026 21:09:58 +0300
Message-ID: <20260512180958.18098-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAHp75VebM9wwKpjnZKEGVvwA=TfmF4MDDuYssNAFWDnXsXyRTw@mail.gmail.com>
References: <CAHp75VebM9wwKpjnZKEGVvwA=TfmF4MDDuYssNAFWDnXsXyRTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5A8A526F1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[noirlang.tr:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-61314-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[noirlang.tr];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[melihemik@noirlang.tr,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[noirlang.tr:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,noirlang.tr:email,noirlang.tr:mid,noirlang.tr:dkim]
X-Rspamd-Action: no action

The dbg_func module parameter in atomisp_v4l2.c toggles the CSS
debug_print callback through a writable module parameter. Removing only
the parameter drops the runtime switch that users had through sysfs.

Keep the debug path available at runtime by routing CSS debug output
through dynamic debug instead. The callback remains installed, but its
output is controlled by the dynamic debug callsite. CSS error output
continues to use vprintk().

Remove the obsolete parameter, its global state and the unused get/set
helpers.

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 .../media/atomisp/pci/atomisp_common.h        |  1 -
 .../media/atomisp/pci/atomisp_compat_css20.c  | 47 ++++++-------------
 .../media/atomisp/pci/atomisp_compat_css20.h  |  3 --
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  6 ---
 4 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..145b35ad13cb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -21,7 +21,6 @@
 #include "ia_css.h"
 
 extern int dbg_level;
-extern int dbg_func;
 extern int pad_w;
 extern int pad_h;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..fb18c204266b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -25,6 +25,7 @@
 #include "sh_css_hrt.h"
 #include "ia_css_isys.h"
 
+#include <linux/dynamic_debug.h>
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
 
@@ -152,6 +153,19 @@ static int  __printf(1, 0) atomisp_vprintk(const char *fmt, va_list args)
 	return 0;
 }
 
+static int __printf(1, 0) atomisp_vpr_debug(const char *fmt, va_list args)
+{
+#if defined(CONFIG_DYNAMIC_DEBUG)
+	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, "CSS debug");
+
+	if (DYNAMIC_DEBUG_BRANCH(descriptor))
+		vprintk(fmt, args);
+#elif defined(DEBUG)
+	vprintk(fmt, args);
+#endif
+	return 0;
+}
+
 void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 {
 	*data = atomisp_css2_hw_load_32(addr);
@@ -745,20 +759,6 @@ int atomisp_css_init(struct atomisp_device *isp)
 	return 0;
 }
 
-static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
-{
-	int ret = 0;
-
-	if (opt == 0)
-		isp->css_env.isp_css_env.print_env.debug_print = NULL;
-	else if (opt == 1)
-		isp->css_env.isp_css_env.print_env.debug_print = atomisp_vprintk;
-	else
-		ret = -EINVAL;
-
-	return ret;
-}
-
 int atomisp_css_load_firmware(struct atomisp_device *isp)
 {
 	int err;
@@ -783,8 +783,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 	isp->css_env.isp_css_env.hw_access_env.load = atomisp_css2_hw_load;
 	isp->css_env.isp_css_env.hw_access_env.store = atomisp_css2_hw_store;
 
-	__set_css_print_env(isp, dbg_func);
-
+	isp->css_env.isp_css_env.print_env.debug_print = atomisp_vpr_debug;
 	isp->css_env.isp_css_env.print_env.error_print = atomisp_vprintk;
 
 	/* load isp fw into ISP memory */
@@ -3360,22 +3359,6 @@ void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
 	asd->params.config.output_frame = output_frame;
 }
 
-int atomisp_get_css_dbgfunc(void)
-{
-	return dbg_func;
-}
-
-int atomisp_set_css_dbgfunc(struct atomisp_device *isp, int opt)
-{
-	int ret;
-
-	ret = __set_css_print_env(isp, opt);
-	if (ret == 0)
-		dbg_func = opt;
-
-	return ret;
-}
-
 void atomisp_en_dz_capt_pipe(struct atomisp_sub_device *asd, bool enable)
 {
 	ia_css_en_dz_capt_pipe(
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
index 75781807544a..e1c0b7e77974 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.h
@@ -150,9 +150,6 @@ void atomisp_css_set_isp_config_id(struct atomisp_sub_device *asd,
 void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
 	struct ia_css_frame *output_frame);
 
-int atomisp_get_css_dbgfunc(void);
-
-int atomisp_set_css_dbgfunc(struct atomisp_device *isp, int opt);
 struct ia_css_dvs_grid_info *atomisp_css_get_dvs_grid_info(
     struct ia_css_grid_info *grid_info);
 #endif
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..d4374b7fc1ba 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -48,12 +48,6 @@ int dbg_level;
 module_param(dbg_level, int, 0644);
 MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
-/* log function switch */
-int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
-
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
  * exports extra. If these are kept at the 10x8 that they were on, in yuv
-- 
2.54.0


