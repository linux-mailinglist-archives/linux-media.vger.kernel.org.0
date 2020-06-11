Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421E91F699C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 16:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgFKOIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 10:08:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51530 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgFKOIg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 10:08:36 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jjNsd-0006xu-Ni; Thu, 11 Jun 2020 14:08:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: make const arrays static, makes object smaller
Date:   Thu, 11 Jun 2020 15:08:31 +0100
Message-Id: <20200611140831.924488-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const arrays on the stack but instead make them
static. Makes the object code smaller by 150 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
 111083	  23692	     64	 134839	  20eb7	atomisp/pci/atomisp_compat_css20.o

After:
   text	   data	    bss	    dec	    hex	filename
 110773	  23852	     64	 134689	  20e21	atomisp/pci/atomisp_compat_css20.o

After:

(gcc version 9.3.0, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 71914d364ad9..9498aecf3be7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2410,13 +2410,13 @@ static void __configure_preview_pp_input(struct atomisp_sub_device *asd,
 	struct ia_css_resolution  *effective_res =
 		    &stream_config->input_config.effective_res;
 
-	const struct bayer_ds_factor bds_fct[] = {{2, 1}, {3, 2}, {5, 4} };
+	static const struct bayer_ds_factor bds_fct[] = {{2, 1}, {3, 2}, {5, 4} };
 	/*
 	 * BZ201033: YUV decimation factor of 4 causes couple of rightmost
 	 * columns to be shaded. Remove this factor to work around the CSS bug.
 	 * const unsigned int yuv_dec_fct[] = {4, 2};
 	 */
-	const unsigned int yuv_dec_fct[] = { 2 };
+	static const unsigned int yuv_dec_fct[] = { 2 };
 	unsigned int i;
 
 	if (width == 0 && height == 0)
@@ -2536,7 +2536,7 @@ static void __configure_video_pp_input(struct atomisp_sub_device *asd,
 	struct ia_css_resolution  *effective_res =
 		    &stream_config->input_config.effective_res;
 
-	const struct bayer_ds_factor bds_factors[] = {
+	static const struct bayer_ds_factor bds_factors[] = {
 		{8, 1}, {6, 1}, {4, 1}, {3, 1}, {2, 1}, {3, 2}
 	};
 	unsigned int i;
-- 
2.27.0.rc0

