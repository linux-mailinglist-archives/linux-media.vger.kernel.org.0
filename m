Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C4E44DE48
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 00:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbhKKXLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 18:11:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:36630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230308AbhKKXLr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 18:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADD7D6162E;
        Thu, 11 Nov 2021 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636672137;
        bh=T4wr7TRf+TISBf7dovqtq8hbh8HWQzrGfXkIAf5Qr2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eQ+1VvyNJI2c3bfWG4FXckAxETzL1lovyiVThD3+BQsIZotOTn/T8x7Z2NIBFXC2h
         NAzr9Xp+w/MRoDqWNLOAVZSgNQZe6nPxXlJwmkddfRL2QPewwN4skE1G4Bo11s0OnS
         8d/JZ3wZI8AH7sS/A0S0JJSsQ8A3ZplN6+NpdQSiIcT1PyEr3QRKomQcIyvjieQgDI
         lffSJ43VLqDmOvpXSJR8/kUVJHjUfdBO22rSkhdgHP5IP4iMnVaPB/xx8/T71oPkjg
         iDorgYaZqQj/XFDLvQZCZDCveQaAJfvOQEMg8YP364YzKOxwUePKLYjd71oxNgEK0a
         kffjd/eywQ73w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlJBe-000I7E-4E; Thu, 11 Nov 2021 23:08:54 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Ding Xiang <dingxiang@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: [PATCH 3/3] media: atomisp: handle errors at sh_css_create_isp_params()
Date:   Thu, 11 Nov 2021 23:08:53 +0000
Message-Id: <f1157236eacdaab3def9b7d18f1c2e7ef9a3699d.1636672052.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636672052.git.mchehab+huawei@kernel.org>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The succ var tracks memory allocation erros on this function.

Fix it, in order to stop this W=1 Werror in clang:

drivers/staging/media/atomisp/pci/sh_css_params.c:2430:7: error: variable 'succ' set but not used [-Werror,-Wunused-but-set-variable]
        bool succ = true;
             ^

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index dbd3bfe3d343..3cc5b82a8a31 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -2473,6 +2473,10 @@ sh_css_create_isp_params(struct ia_css_stream *stream,
 	succ &= (ddr_ptrs->macc_tbl != mmgr_NULL);
 
 	*isp_params_out = params;
+
+	if (!succ)
+		return -ENOMEM;
+
 	return err;
 }
 
-- 
2.33.1

