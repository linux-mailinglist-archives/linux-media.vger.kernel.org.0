Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E879536267
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 19:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfFERYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 13:24:55 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35950 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFERYz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 13:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OJgpRGZ4V78wrKDgNSwW5jvsVQFfSek4Sk0Ri8iY5Hc=; b=ClVDj/DG3vPrrVdSqmzi2LUst
        SeyqBZezMFNDqmdo/y6fNQ0naijuBSuA7OXojh7TnojfKw/0wLYrM0vgN06MHgAQLaTva+a6Cpsnk
        TzSiS5TBw4hadFxTlt/rqzNusGDjKgtadAJ/pNE1hS8YqfeeLis4xg9iJ9p/qkGk7BBAIDpXXyf3u
        c9NPv6P3gZtHzL1QV7vvp9+8nUOKY+NVXXSa4ccxwxqu/h9P/q6E6/hXho542rs0MgADbJOGPJfFA
        SOdGIXiDA+0vwY45nZilLqjpAyH5CZ1mqsz0L9rcMKMqGKtDeYqgbihklQhUwlPfW1weP4bP7PhU1
        98Ayna29A==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYZed-0004IN-1B; Wed, 05 Jun 2019 17:24:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hYZeP-00014Y-Un; Wed, 05 Jun 2019 13:24:37 -0400
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Colin Ian King <colin.king@canonical.com>,
        Zhouyang Jia <jiazhouyang09@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ira Weiny <ira.weiny@intel.com>,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] media: add SPDX headers to some files
Date:   Wed,  5 Jun 2019 13:24:35 -0400
Message-Id: <0cc49d8131d9f37ac6d5a01df7f76e1beec275a2.1559755445.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add SPDX headers and fix MODULE_LICENSE() when needed on
some files I co-authored.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/i2c/tda7432.c                   |  4 +++-
 drivers/media/pci/bt8xx/bttv-audio-hook.c     |  3 ++-
 drivers/media/pci/bt8xx/bttv-audio-hook.h     |  2 ++
 drivers/media/pci/cx88/cx88-alsa.c            | 14 +++-----------
 drivers/media/pci/cx88/cx88-blackbird.c       | 14 +++-----------
 drivers/media/pci/cx88/cx88-core.c            | 14 +++-----------
 drivers/media/pci/cx88/cx88-i2c.c             | 11 +----------
 drivers/media/pci/cx88/cx88-video.c           | 14 +++-----------
 drivers/media/usb/gspca/zc3xx-reg.h           |  2 ++
 drivers/media/v4l2-core/v4l2-dev.c            |  7 ++-----
 drivers/media/v4l2-core/v4l2-ioctl.c          |  7 ++-----
 drivers/media/v4l2-core/videobuf-core.c       |  6 ++----
 drivers/media/v4l2-core/videobuf-dma-contig.c |  6 ++----
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  6 ++----
 drivers/media/v4l2-core/videobuf-vmalloc.c    |  8 +++-----
 15 files changed, 35 insertions(+), 83 deletions(-)

diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
index 06a78c2cdaab..5cdeb6408a8d 100644
--- a/drivers/media/i2c/tda7432.c
+++ b/drivers/media/i2c/tda7432.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-1.0+
+
 /*
  * For the STS-Thompson TDA7432 audio processor chip
  *
@@ -9,7 +11,7 @@
  *
  * Copyright (c) 2000 Eric Sandeen <eric_sandeen@bigfoot.com>
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
- * This code is placed under the terms of the GNU General Public License
+ *
  * Based on tda9855.c by Steve VanDeBogart (vandebo@uclink.berkeley.edu)
  * Which was based on tda8425.c by Greg Alexander (c) 1998
  *
diff --git a/drivers/media/pci/bt8xx/bttv-audio-hook.c b/drivers/media/pci/bt8xx/bttv-audio-hook.c
index 8febe7358a8f..4f9943312caf 100644
--- a/drivers/media/pci/bt8xx/bttv-audio-hook.c
+++ b/drivers/media/pci/bt8xx/bttv-audio-hook.c
@@ -1,8 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * Handlers for board audio hooks, split from bttv-cards
  *
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
- * This code is placed under the terms of the GNU General Public License
  */
 
 #include "bttv-audio-hook.h"
diff --git a/drivers/media/pci/bt8xx/bttv-audio-hook.h b/drivers/media/pci/bt8xx/bttv-audio-hook.h
index c61b9ac4f4e3..d6a1a5a60a56 100644
--- a/drivers/media/pci/bt8xx/bttv-audio-hook.h
+++ b/drivers/media/pci/bt8xx/bttv-audio-hook.h
@@ -1,4 +1,6 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0
+ *
  * Handlers for board audio hooks, split from bttv-cards
  *
  * Copyright (c) 2006 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/pci/cx88/cx88-alsa.c b/drivers/media/pci/cx88/cx88-alsa.c
index b683cbe13dee..05e0d15d61a8 100644
--- a/drivers/media/pci/cx88/cx88-alsa.c
+++ b/drivers/media/pci/cx88/cx88-alsa.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  *  Support for audio capture
  *  PCI function #1 of the cx2388x.
@@ -7,16 +9,6 @@
  *    (c) 2005 Mauro Carvalho Chehab <mchehab@kernel.org>
  *    Based on a dummy cx88 module by Gerd Knorr <kraxel@bytesex.org>
  *    Based on dummy.c by Jaroslav Kysela <perex@perex.cz>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
  */
 
 #include "cx88.h"
@@ -104,7 +96,7 @@ MODULE_PARM_DESC(index, "Index value for cx88x capture interface(s).");
 MODULE_DESCRIPTION("ALSA driver module for cx2388x based TV cards");
 MODULE_AUTHOR("Ricardo Cerqueira");
 MODULE_AUTHOR("Mauro Carvalho Chehab <mchehab@kernel.org>");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_VERSION(CX88_VERSION);
 
 MODULE_SUPPORTED_DEVICE("{{Conexant,23881},{{Conexant,23882},{{Conexant,23883}");
diff --git a/drivers/media/pci/cx88/cx88-blackbird.c b/drivers/media/pci/cx88/cx88-blackbird.c
index 6c0bb9fe4a31..a7ef9090dbd4 100644
--- a/drivers/media/pci/cx88/cx88-blackbird.c
+++ b/drivers/media/pci/cx88/cx88-blackbird.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  *  Support for a cx23416 mpeg encoder via cx2388x host port.
  *  "blackbird" reference design.
@@ -9,16 +11,6 @@
  *        - video_ioctl2 conversion
  *
  *  Includes parts from the ivtv driver <http://sourceforge.net/projects/ivtv/>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
  */
 
 #include "cx88.h"
@@ -37,7 +29,7 @@
 
 MODULE_DESCRIPTION("driver for cx2388x/cx23416 based mpeg encoder cards");
 MODULE_AUTHOR("Jelle Foks <jelle@foks.us>, Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_VERSION(CX88_VERSION);
 
 static unsigned int debug;
diff --git a/drivers/media/pci/cx88/cx88-core.c b/drivers/media/pci/cx88/cx88-core.c
index 60988e95b637..282daae74d48 100644
--- a/drivers/media/pci/cx88/cx88-core.c
+++ b/drivers/media/pci/cx88/cx88-core.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  * device driver for Conexant 2388x based TV cards
  * driver core
@@ -8,16 +10,6 @@
  *     - Multituner support
  *     - video_ioctl2 conversion
  *     - PAL/M fixes
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
  */
 
 #include "cx88.h"
@@ -40,7 +32,7 @@
 
 MODULE_DESCRIPTION("v4l2 driver module for cx2388x based TV cards");
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 
 /* ------------------------------------------------------------------ */
 
diff --git a/drivers/media/pci/cx88/cx88-i2c.c b/drivers/media/pci/cx88/cx88-i2c.c
index 48be0b0ad680..cfb084ea3bf2 100644
--- a/drivers/media/pci/cx88/cx88-i2c.c
+++ b/drivers/media/pci/cx88/cx88-i2c.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 
 /*
  *
@@ -10,16 +11,6 @@
  *
  * (c) 2005 Mauro Carvalho Chehab <mchehab@kernel.org>
  *	- Multituner support and i2c address binding
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include "cx88.h"
diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
index e1549d352f70..23d902dccdaa 100644
--- a/drivers/media/pci/cx88/cx88-video.c
+++ b/drivers/media/pci/cx88/cx88-video.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  *
  * device driver for Conexant 2388x based TV cards
@@ -9,16 +11,6 @@
  *	- Multituner support
  *	- video_ioctl2 conversion
  *	- PAL/M fixes
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
  */
 
 #include "cx88.h"
@@ -42,7 +34,7 @@
 
 MODULE_DESCRIPTION("v4l2 driver module for cx2388x based TV cards");
 MODULE_AUTHOR("Gerd Knorr <kraxel@bytesex.org> [SuSE Labs]");
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_VERSION(CX88_VERSION);
 
 /* ------------------------------------------------------------------ */
diff --git a/drivers/media/usb/gspca/zc3xx-reg.h b/drivers/media/usb/gspca/zc3xx-reg.h
index 26f6153b687f..6a8d430e5bed 100644
--- a/drivers/media/usb/gspca/zc3xx-reg.h
+++ b/drivers/media/usb/gspca/zc3xx-reg.h
@@ -1,4 +1,6 @@
 /*
+ * SPDX-License-Identifier: GPL-2.0
+ *
  * zc030x registers
  *
  * Copyright (c) 2008 Mauro Carvalho Chehab <mchehab@kernel.org>
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 29946a2b2752..2b45234f757e 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1,14 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  * Video capture interface for Linux version 2
  *
  *	A generic video device interface for the LINUX operating system
  *	using a set of device structures/vectors for low level operations.
  *
- *	This program is free software; you can redistribute it and/or
- *	modify it under the terms of the GNU General Public License
- *	as published by the Free Software Foundation; either version
- *	2 of the License, or (at your option) any later version.
- *
  * Authors:	Alan Cox, <alan@lxorguk.ukuu.org.uk> (version 1)
  *              Mauro Carvalho Chehab <mchehab@kernel.org> (version 2)
  *
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b4c73e8f23c5..6383cde3154c 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0+
+
 /*
  * Video capture interface for Linux version 2
  *
  * A generic framework to process V4L2 ioctl commands.
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License
- * as published by the Free Software Foundation; either version
- * 2 of the License, or (at your option) any later version.
- *
  * Authors:	Alan Cox, <alan@lxorguk.ukuu.org.uk> (version 1)
  *              Mauro Carvalho Chehab <mchehab@kernel.org> (version 2)
  */
diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
index bf7dfb2a34af..c166f4264115 100644
--- a/drivers/media/v4l2-core/videobuf-core.c
+++ b/drivers/media/v4l2-core/videobuf-core.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * generic helper functions for handling video4linux capture buffers
  *
@@ -7,10 +9,6 @@
  * (c) 2001,02 Gerd Knorr <kraxel@bytesex.org>
  * (c) 2006 Mauro Carvalho Chehab, <mchehab@kernel.org>
  * (c) 2006 Ted Walther and John Sokol
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2
  */
 
 #include <linux/init.h>
diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drivers/media/v4l2-core/videobuf-dma-contig.c
index 65e2655d22b7..cef5dd97871c 100644
--- a/drivers/media/v4l2-core/videobuf-dma-contig.c
+++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * helper functions for physically contiguous capture buffers
  *
@@ -8,10 +10,6 @@
  *
  * Based on videobuf-vmalloc.c,
  * (c) 2007 Mauro Carvalho Chehab, <mchehab@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2
  */
 
 #include <linux/init.h>
diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
index 870a2a526e0b..240da4a9b5a5 100644
--- a/drivers/media/v4l2-core/videobuf-dma-sg.c
+++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * helper functions for SG DMA video4linux capture buffers
  *
@@ -12,10 +14,6 @@
  * (c) 2001,02 Gerd Knorr <kraxel@bytesex.org>
  * (c) 2006 Mauro Carvalho Chehab, <mchehab@kernel.org>
  * (c) 2006 Ted Walther and John Sokol
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2
  */
 
 #include <linux/init.h>
diff --git a/drivers/media/v4l2-core/videobuf-vmalloc.c b/drivers/media/v4l2-core/videobuf-vmalloc.c
index cb50f1957828..248fda9bc68b 100644
--- a/drivers/media/v4l2-core/videobuf-vmalloc.c
+++ b/drivers/media/v4l2-core/videobuf-vmalloc.c
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
 /*
  * helper functions for vmalloc video4linux capture buffers
  *
@@ -6,11 +8,7 @@
  * into PAGE_SIZE chunks).  They also assume the driver does not need
  * to touch the video data.
  *
- * (c) 2007 Mauro Carvalho Chehab, <mchehab@kernel.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2
+ * (c) 2007 Mauro Carvalho Chehab <mchehab@kernel.org>
  */
 
 #include <linux/init.h>
-- 
2.21.0

