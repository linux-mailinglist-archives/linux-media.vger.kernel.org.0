Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AB42B8CBD
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 09:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgKSIB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 03:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKSIB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 03:01:58 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A79C0613D4
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 00:01:57 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id u81r2300N4C55Sk0181rmj; Thu, 19 Nov 2020 09:01:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfet5-003lB0-JL; Thu, 19 Nov 2020 09:01:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfet4-00Gz1m-Gy; Thu, 19 Nov 2020 09:01:50 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] media: fsl-viu: Use proper check for presence of {out,in}_be32()
Date:   Thu, 19 Nov 2020 09:01:49 +0100
Message-Id: <20201119080149.4047795-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When compile-testing on m68k/randconfig:

    drivers/media/platform/fsl-viu.c: In function 'viu_start_dma':
    drivers/media/platform/fsl-viu.c:253:2: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
    drivers/media/platform/fsl-viu.c: In function 'viu_stop_dma':
    drivers/media/platform/fsl-viu.c:266:15: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]

Fix this by replacing the checks for PowerPC, Microblaze, and m68k by
checks for the presence of {out,in}_be32().

As PowerPC implements the be32 accessors using inline functions instead
of macros, identity definitions are added for all accessors to make the
above checks work.

Fixes: 29d750686331a1a9 ("media: fsl-viu: allow building it with COMPILE_TEST")
Fixes: 17621758e53f0e6b ("media: fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Hans Verkuil <hans.verkuil@cisco.com>
---
Compile-tested on m68k, microblaze, and powerpc.
Assembler output before/after compared for powerpc.

v2:
  - Add Reviewed-by,
  - s/definions/definitions/,
  - Update for commits 6898dd580a045341 ("media: media/platform:
    fsl-viu.c: fix build for MICROBLAZE") and 17621758e53f0e6b ("media:
    fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K"),
    which added checks for Microblaze and m68k (the latter is not
    sufficient, cfr. the report from the kernel test robot).

v1: https://lore.kernel.org/lkml/1528451328-21316-1-git-send-email-geert@linux-m68k.org/
---
 arch/powerpc/include/asm/io.h    | 14 ++++++++++++++
 drivers/media/platform/fsl-viu.c |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 58635960403c058b..fcb250db110d8e2b 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -194,6 +194,20 @@ static inline void out_be64(volatile u64 __iomem *addr, u64 val)
 #endif
 #endif /* __powerpc64__ */
 
+#define in_be16 in_be16
+#define in_be32 in_be32
+#define in_be64 in_be64
+#define in_le16 in_le16
+#define in_le32 in_le32
+#define in_le64 in_le64
+
+#define out_be16 out_be16
+#define out_be32 out_be32
+#define out_be64 out_be64
+#define out_le16 out_le16
+#define out_le32 out_le32
+#define out_le64 out_le64
+
 /*
  * Low level IO stream instructions are defined out of line for now
  */
diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 4f2a0f992905b4b3..d8a6dd4ffbad56d6 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -32,8 +32,10 @@
 #define VIU_VERSION		"0.5.1"
 
 /* Allow building this driver with COMPILE_TEST */
-#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
+#ifndef out_be32
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
+#endif
+#ifndef in_be32
 #define in_be32(a)	ioread32be((void __iomem *)a)
 #endif
 
-- 
2.25.1

