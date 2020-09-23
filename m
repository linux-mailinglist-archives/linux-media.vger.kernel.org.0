Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAD9275327
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 10:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIWIWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 04:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:33744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbgIWIWG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 04:22:06 -0400
Received: from mail.kernel.org (ip5f5ad5c8.dynamic.kabel-deutschland.de [95.90.213.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C567A238A1;
        Wed, 23 Sep 2020 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600849325;
        bh=DmXoYTsrp+5X+VdcYTdixz0bMYx13NlME21W5hL9F0k=;
        h=From:To:Cc:Subject:Date:From;
        b=P5z88MhpNjVgVXiObYz3irhiottc6m/gxZCLppZ9IO1aU3TmCojaGwmOcVEXe+GTS
         HLKacSOzaqgbHwxfCeK2W32r0Dc0roB+V0a9yLUKL+18JNvpUnkBjfBA4bn3kyzS5P
         nQ/9A7ZS+ZRIKMqlxdVnksyasjb/yC4GOKkgZGmk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kL02L-001F20-7o; Wed, 23 Sep 2020 10:22:01 +0200
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
Subject: [PATCH 1/2] media: atomisp: fix gcc warnings
Date:   Wed, 23 Sep 2020 10:21:59 +0200
Message-Id: <8e3d5d4baf0781974a224e284e837665c0d26f92.1600849288.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Depending on the gcc version, after changeset
72a9ff3bf7fb ("media: atomisp: get rid of -Wsuggest-attribute=format warnings"),
we're now getting two warnings, which are breaking the Jenkins
CI instance at https://builder.linuxtv.org:

	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function ‘__set_css_print_env’:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:860:50: error: assignment to ‘int (*)(const char *, char *)’ from incompatible pointer type ‘int (__attribute__((regparm(0))) *)(const char *, char *)’ [-Werror=incompatible-pointer-types]
	   isp->css_env.isp_css_env.print_env.debug_print = vprintk;
	                                                  ^
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c: In function ‘atomisp_css_load_firmware’:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:893:49: error: assignment to ‘int (*)(const char *, char *)’ from incompatible pointer type ‘int (__attribute__((regparm(0))) *)(const char *, char *)’ [-Werror=incompatible-pointer-types]
	  isp->css_env.isp_css_env.print_env.error_print = vprintk;
                                                 ^
	cc1: some warnings being treated as errors

So, we need to partially revert the patch.

Fixes: 72a9ff3bf7fb ("media: atomisp: get rid of -Wsuggest-attribute=format warnings")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_compat_css20.c  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 28796ec177e3..85b39de7bc28 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -166,6 +166,13 @@ atomisp_css2_dbg_ftrace_print(const char *fmt, va_list args)
 	return 0;
 }
 
+static int  __attribute__((format (printf, 1, 0)))
+atomisp_vprintk(const char *fmt, va_list args)
+{
+	vprintk(fmt, args);
+	return 0;
+}
+
 void atomisp_load_uint32(hrt_address addr, uint32_t *data)
 {
 	*data = atomisp_css2_hw_load_32(addr);
@@ -857,7 +864,7 @@ static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
 		isp->css_env.isp_css_env.print_env.debug_print =
 		    atomisp_css2_dbg_ftrace_print;
 	else if (opt == 2)
-		isp->css_env.isp_css_env.print_env.debug_print = vprintk;
+		isp->css_env.isp_css_env.print_env.debug_print = atomisp_vprintk;
 	else
 		ret = -EINVAL;
 
@@ -890,7 +897,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 
 	__set_css_print_env(isp, dbg_func);
 
-	isp->css_env.isp_css_env.print_env.error_print = vprintk;
+	isp->css_env.isp_css_env.print_env.error_print = atomisp_vprintk;
 
 	/* load isp fw into ISP memory */
 	err = ia_css_load_firmware(isp->dev, &isp->css_env.isp_css_env,
-- 
2.26.2

