Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707062B9F26
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 01:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgKTAP3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 19:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbgKTAP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 19:15:26 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03922C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 16:15:25 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id n132so7437969qke.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 16:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OJWY4ky/g1+RSJ3xkBdXjM8dFL5nU7Dn9gzwCm6klp8=;
        b=vTmM9AqA9ldi+pKe442NzcsFba4cC/C+KFg1zYrsXJmjLIyRMn7OvcgLmlNKYrP1RQ
         O7ikDUAkjtnim2reuTf9FaVn6q56egedvQNzAPY86WRNIj4xoPQ0q5/xG1/0FJ6JlBTR
         v4r1jqOBfN5riwXt29joUZsqwOE+N9Fy5Lnt/rI75eW/o01Dh1iM1HDYjCyY0ZaOfj7l
         0g/3pmOUclmh5dsNdB0pmANKsh3ft2A8U3FCgEoMv4hdHzKXKsnfz5SODcP1uPWRMYwc
         SwDwhvnQDgpS+BsPQVRClTskEX/+lgL+SMM0R7ABI5TLV3beVJCXyb7rzAhdzOwFyHUk
         sI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OJWY4ky/g1+RSJ3xkBdXjM8dFL5nU7Dn9gzwCm6klp8=;
        b=hX3eBrcU4fThk6sPRTS9/EFxd0UyA11FPR4ACbA1M9VIyS6gUceUhOIxvRzfznd1ge
         gomrA4HOcKEVKszKzdJ6A8maU10CALsgmgmzgqsZpzm9YLFIKjLVUKa/TE4QS8vKpE/7
         xZiYCCiZiSiSsw3xZVVut0lthqyDpDWaOyBKSlTxy3V2iV60MS9wQkDKnZQKKGERzSqK
         ggu6/ye0ogV0G/GT/Jd6tVFAP6TM26m3sxNQqoykeZ8rsiJ6Q03U33VbcRwDSTEG0BlP
         jowzxhX9DOtbhLddsE/H60jVwTWLMYECmmOkromviB1qYtURdpbi4YHDJYpt5WDApZNu
         Iuew==
X-Gm-Message-State: AOAM5337bdAfURO7BtB5L60elV6LcUbKYIpZLNwBAV6snMNsFEkdo+EB
        nSfOCZG7Q7PhKsx/ZJSGsXk=
X-Google-Smtp-Source: ABdhPJzqXzKZ/YiJYxpmKK/dX/0R1bmGGfWT/09ZWlCl3uJ6rtIPEAEF8IDuDKlzNoaslLviCIKOfw==
X-Received: by 2002:a37:e47:: with SMTP id 68mr13367372qko.375.1605831324137;
        Thu, 19 Nov 2020 16:15:24 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:9ce8:56e7:5368:ece8])
        by smtp.gmail.com with ESMTPSA id h65sm1016615qkd.95.2020.11.19.16.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 16:15:22 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil@xs4all.nl, benh@kernel.crashing.org, paulus@samba.org,
        geert@linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: fsl-viu: Use proper check for presence of {out,in}_be32()
Date:   Thu, 19 Nov 2020 21:15:09 -0300
Message-Id: <20201120001509.15155-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

When compile-testing on m68k or microblaze:

    drivers/media/platform/fsl-viu.c:41:1: warning: "out_be32" redefined
    drivers/media/platform/fsl-viu.c:42:1: warning: "in_be32" redefined

Fix this by replacing the check for PowerPC by checks for the presence
of {out,in}_be32().

As PowerPC implements the be32 accessors using inline functions instead
of macros, identity definions are added for all accessors to make the
above checks work.

Fixes: 29d750686331a1a9 ("media: fsl-viu: allow building it with COMPILE_TEST")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
[fabio: adapt to mainline]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/powerpc/include/asm/io.h    | 14 ++++++++++++++
 drivers/media/platform/fsl-viu.c |  5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 58635960403c..fcb250db110d 100644
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
index 4f2a0f992905..bb6c291ed6dc 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -31,9 +31,10 @@
 #define DRV_NAME		"fsl_viu"
 #define VIU_VERSION		"0.5.1"
 
-/* Allow building this driver with COMPILE_TEST */
-#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
+#ifndef out_be32
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
+#endif
+#ifndef in_be32
 #define in_be32(a)	ioread32be((void __iomem *)a)
 #endif
 
-- 
2.17.1

