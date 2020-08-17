Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E27224780E
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 22:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgHQUYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 16:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHQUYN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 16:24:13 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D87C061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 13:24:13 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id j10so8424298qvo.13
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 13:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pfLdDmHZ9Oq4dli862u1wqzVulaHAyd0p4fZEPAjxZc=;
        b=iE35JFJwt4efMnXYRKXitn1DhZ5fDwLIZlXuOy/AcltJyT50MsVLtamlQ1GCffuOfL
         BVnSdO7Km8CGkAwRtWrk/G9yt2G1V5Z7EK+HXnuJpMihvHAYIXfmPGj6AokjGWII1f0D
         a1brgX5ov1RpD71dX+xdSmS+T3LCviIrHLVT3uW0pB76Ac77G+tASuQ/ISt1VnKzapBr
         dXudUFl17xkD2IbfUwvSexlHQG+LVZGaBOhtFi0wI0idupmf2j3AleZ8ya8i1q+4kFx7
         LNiVfStFZndpuE/zkoQcN68zAbAX7JSdL56cPcZmO7hON7MEHf+oQFRnk7Zj6HS+KdDg
         LyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pfLdDmHZ9Oq4dli862u1wqzVulaHAyd0p4fZEPAjxZc=;
        b=f/68nM4UAk67dvi+LTVTORJ1Q9GufpbEUK/wl/qraiWAwI9zfirz37JXlM44R6YNMv
         3QU8OpNZMj1gRbrXct9zyIKZcoQzjj4Jdx2prhZNFwKYMCjS4/Spdmsum5n/EDISAOTo
         Ao6i+fi+MPhb8w/jtx7x93xkllMPZ+BkN0eyix0IqD1enF8IfN88XyxreneYI0sj9E5E
         XCskAI+6Rq61AVuC273qqNBs4V34pG6dR28CzLn7ZkuYD95rSCNVM0Yk30HG8XvVcOtA
         5euMzVm1mSGAJlMHt8Z7iP81Ja/XozqslY7hUnpVZqvBxE9Tpgpp9XZwC219/6PsVBqb
         kL6A==
X-Gm-Message-State: AOAM532xxVPsdeRt30vGWZ6WvKzEDzMVO+b+bg524bR/14UwrZ5TAj0y
        0Is9YvXgHKWIy3Lc+p3jgZY=
X-Google-Smtp-Source: ABdhPJzbdW5TbJzjCy9d+vjhJ/CM2Z0Rqz1aBWfyfGOy8fkjrb6ilILsJJQY+iqUwG2yVntZUgfIbw==
X-Received: by 2002:ad4:564d:: with SMTP id bl13mr15404154qvb.60.1597695852929;
        Mon, 17 Aug 2020 13:24:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:4fb::1000])
        by smtp.gmail.com with ESMTPSA id a3sm20038393qtj.21.2020.08.17.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 13:24:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: fsl-viu: Do not redefine out_be32()/in_be32() for CONFIG_M68K
Date:   Mon, 17 Aug 2020 17:23:56 -0300
Message-Id: <20200817202356.11598-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following W=1 build warning is seen on a m68k:

drivers/media/platform/fsl-viu.c: At top level:
drivers/media/platform/fsl-viu.c:36: warning: "out_be32" redefined
   36 | #define out_be32(v, a) iowrite32be(a, (void __iomem *)v)
      | 
In file included from ./arch/m68k/include/asm/io_mm.h:25,
                 from ./arch/m68k/include/asm/io.h:8,
                 from ./include/linux/io.h:13,
                 from ./include/linux/irq.h:20,
                 from ./include/asm-generic/hardirq.h:13,
                 from ./arch/m68k/include/generated/asm/hardirq.h:1,
                 from ./include/linux/hardirq.h:9,
                 from ./include/linux/interrupt.h:11,
                 from drivers/media/platform/fsl-viu.c:17:
./arch/m68k/include/asm/raw_io.h:32: note: this is the location of the previous definition
   32 | #define out_be32(addr,l) (void)((*(__force volatile u32 *) (addr)) = (l))

Avoid the out_be32() and in_be32() redefinitions when building for CONFIG_M68K
in the same way we currently do for CONFIG_PPC and CONFIG_MICROBLAZE.

Reported-by: kernel test robot <lkp@intel.com> 
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/fsl-viu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 84633a3b8475..4f2a0f992905 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -32,7 +32,7 @@
 #define VIU_VERSION		"0.5.1"
 
 /* Allow building this driver with COMPILE_TEST */
-#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE)
+#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
 #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
 #define in_be32(a)	ioread32be((void __iomem *)a)
 #endif
-- 
2.17.1

