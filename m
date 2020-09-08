Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688CC260F71
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgIHKOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729104AbgIHKMf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:12:35 -0400
Received: from mail.kernel.org (ip5f5ad5ce.dynamic.kabel-deutschland.de [95.90.213.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FEAD21D79;
        Tue,  8 Sep 2020 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599559952;
        bh=VuGxZvo9yHiaoeDqVaq0mRPlaYO1KqH47p+IwFf+LRE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qzFJPKrMSr98zhIOKH91ICQ4+dUN9MrDjIB/ZpEjGHbUcxSKgLKJWASEVBm/49Lf/
         orclnub6zmuCD25OU1d74vpEhrZu+b+o/EFvWYj6mpnRE26K8k7lbpsvfx6n01vTvS
         zEoa6Wn7M/+rFAJ1GRB8eJvzsVUKZqdRU8K6wQwc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kFac1-00B3qj-5f; Tue, 08 Sep 2020 12:12:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: atomisp: get rid of -Wsuggest-attribute=format warnings
Date:   Tue,  8 Sep 2020 12:12:26 +0200
Message-Id: <6c77d765707b1e6b2901fd23d85b4d032f1a1799.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599141140.git.mchehab+huawei@kernel.org>
References: <cover.1599141140.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are some warnings reported by gcc:
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:164:2: warning: function ‘atomisp_css2_dbg_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:170:2: warning: function ‘atomisp_css2_dbg_ftrace_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:170:2: warning: function ‘atomisp_css2_dbg_ftrace_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	drivers/staging/media/atomisp//pci/atomisp_compat_css20.c:176:2: warning: function ‘atomisp_css2_err_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]

That are due to the usage of printf-like messages without
enabling the error checking logic.

Add the proper attributes in order to shut up such warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 20 ++++---------------
 .../staging/media/atomisp/pci/ia_css_env.h    |  4 ++--
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index e54242dc0888..5a730e17cc6e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -159,24 +159,13 @@ static void atomisp_css2_hw_load(hrt_address addr, void *to, uint32_t n)
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
-static int atomisp_css2_dbg_print(const char *fmt, va_list args)
-{
-	vprintk(fmt, args);
-	return 0;
-}
-
-static int atomisp_css2_dbg_ftrace_print(const char *fmt, va_list args)
+static int  __attribute__((format (printf, 1, 0)))
+atomisp_css2_dbg_ftrace_print(const char *fmt, va_list args)
 {
 	ftrace_vprintk(fmt, args);
 	return 0;
 }
 
-static int atomisp_css2_err_print(const char *fmt, va_list args)
-{
-	vprintk(fmt, args);
-	return 0;
-}
-
 void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 {
 	*data = atomisp_css2_hw_load_32(addr);
@@ -869,8 +858,7 @@ static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
 		isp->css_env.isp_css_env.print_env.debug_print =
 		    atomisp_css2_dbg_ftrace_print;
 	else if (opt == 2)
-		isp->css_env.isp_css_env.print_env.debug_print =
-		    atomisp_css2_dbg_print;
+		isp->css_env.isp_css_env.print_env.debug_print = vprintk;
 	else
 		ret = -EINVAL;
 
@@ -903,7 +891,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 
 	__set_css_print_env(isp, dbg_func);
 
-	isp->css_env.isp_css_env.print_env.error_print = atomisp_css2_err_print;
+	isp->css_env.isp_css_env.print_env.error_print = vprintk;
 
 	/* load isp fw into ISP memory */
 	err = ia_css_load_firmware(isp->dev, &isp->css_env.isp_css_env,
diff --git a/drivers/staging/media/atomisp/pci/ia_css_env.h b/drivers/staging/media/atomisp/pci/ia_css_env.h
index 8debf334c15c..9808ff9e0492 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_env.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_env.h
@@ -75,9 +75,9 @@ struct ia_css_hw_access_env {
 /* Environment with function pointers to print error and debug messages.
  */
 struct ia_css_print_env {
-	int (*debug_print)(const char *fmt, va_list args);
+	int (*debug_print)(const char *fmt, va_list args) __attribute__((format (printf, 1, 0)));
 	/** Print a debug message. */
-	int (*error_print)(const char *fmt, va_list args);
+	int (*error_print)(const char *fmt, va_list args) __attribute__((format (printf, 1, 0)));
 	/** Print an error message.*/
 };
 
-- 
2.26.2

