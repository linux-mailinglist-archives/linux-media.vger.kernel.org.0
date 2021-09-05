Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF5E40122E
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 01:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbhIEX6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 19:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238448AbhIEX6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 19:58:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEEEC061575;
        Sun,  5 Sep 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=hIb2nK0ItXTa5MRBxU9bPeawp9abmfaSM4x8huD2VSA=; b=GXGM4Jvsk2qMYQ5VnE4ZZ7t07g
        SEaI2u4ex+d0rQLu8QOZlrcEaAm3nr86+DJPuebN9K/hDwIDeWNzsA01iJ3Uc7m+9VK0QZPEuAWid
        IYqrkWmMGNF5ghED9nFrNAA7396tM5mg+Y+nLr0mQecsMl9FGW/HGNrPIEqpY3bh/fwL4ks2Qg7IA
        d9v6YqZKsQlStMnrhMWiF5utMreLS1ht2rU0hkSKRBFmLsy8V4d5Aopyr5tPITfxjqT1W/f1CQrEI
        ya792/EM4ZZqCpRPmsNKRRsc9m692YQRkOo0TbR1ATYh5OnSzFV/mMtty8Ng7svLMHp2jq70MWGdl
        lyPhwTqg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mN20i-00Glc5-7z; Sun, 05 Sep 2021 23:57:16 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: s5p-jpeg: change "RST" to "RSET" to fix build warnings
Date:   Sun,  5 Sep 2021 16:57:15 -0700
Message-Id: <20210905235715.12154-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of a macro named 'RST' conflicts with one of the same name
in arch/mips/include/asm/mach-rc32434/rb.h. This causes build
warnings on some MIPS builds.

Change the use of RST to the name RSET.

Fixes these build warnings:

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos3250.c:14:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
      | 
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-s5p.c:13:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-hw-exynos4.c:12:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

In file included from ../drivers/media/platform/s5p-jpeg/jpeg-core.c:31:
../drivers/media/platform/s5p-jpeg/jpeg-core.h:43: warning: "RST" redefined
   43 | #define RST                             0xd0
../arch/mips/include/asm/mach-rc32434/rb.h:13: note: this is the location of the previous definition
   13 | #define RST             (1 << 15)

Fixes: bb677f3ac434 ("[media] Exynos4 JPEG codec v4l2 driver")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c |    2 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -1203,7 +1203,7 @@ static bool s5p_jpeg_parse_hdr(struct s5
 			break;
 
 		/* skip payload-less markers */
-		case RST ... RST + 7:
+		case RSET ... RSET + 7:
 		case SOI:
 		case EOI:
 		case TEM:
--- linux-next-20210903.orig/drivers/media/platform/s5p-jpeg/jpeg-core.h
+++ linux-next-20210903/drivers/media/platform/s5p-jpeg/jpeg-core.h
@@ -40,7 +40,7 @@
 #define TEM				0x01
 #define SOF0				0xc0
 #define DHT				0xc4
-#define RST				0xd0
+#define RSET				0xd0
 #define SOI				0xd8
 #define EOI				0xd9
 #define	SOS				0xda
