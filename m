Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076E834564
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727250AbfFDL0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:26:13 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:63428 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfFDL0N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 07:26:13 -0400
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-03.nifty.com with ESMTP id x54BEjxL017362
        for <linux-media@vger.kernel.org>; Tue, 4 Jun 2019 20:14:45 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x54BDaaN019787;
        Tue, 4 Jun 2019 20:13:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x54BDaaN019787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559646817;
        bh=i87f1EzLAVXjNr+Xr7KY6Eno863iAYx32VAHpgBSDhU=;
        h=From:To:Cc:Subject:Date:From;
        b=ShGen+o8KRrLorQiNuoKnRzGUmpt/AggzUoBpdSASuh6Cu4qRFrDy6BbXYaDAuu+q
         IRk5ZXVM9KDM45zAyZW7Xdq1gZ2J8emn/vuVELUqa6VxYcTXSkXA0PPg6XvyiFp3qb
         OiHsXQzvNEBPjKAwMj430y9UnmWaj6vT/VB0B5LEI3ZEru8JuCpJeOqtKb9BTmLwZ6
         1lVkxUOF3qx8xQJ/fD23CbBUM2YzYT4+YMLKYuGMYpUA+Jmsn0lLgkwCNhyqGIk+jy
         e3h0JmwYE24u3QTu3eEqSDuW7NFCFfCUt3gcppjGMZP49M8i6Zxul/ZOHbkgvY4LfY
         nSQTymT3Rhk4Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: do not use C++ style comments in uapi headers
Date:   Tue,  4 Jun 2019 20:13:34 +0900
Message-Id: <20190604111334.22182-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Linux kernel tolerates C++ style comments these days. Actually, the
SPDX License tags for .c files start with //.

On the other hand, uapi headers are written in more strict C, where
the C++ comment style is forbidden.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/uapi/linux/dvb/audio.h |   2 +-
 include/uapi/linux/dvb/osd.h   | 170 ++++++++++++++++++++-------------
 2 files changed, 103 insertions(+), 69 deletions(-)

diff --git a/include/uapi/linux/dvb/audio.h b/include/uapi/linux/dvb/audio.h
index afeae063e640..977bed135e22 100644
--- a/include/uapi/linux/dvb/audio.h
+++ b/include/uapi/linux/dvb/audio.h
@@ -52,7 +52,7 @@ typedef enum {
 typedef struct audio_mixer {
 	unsigned int volume_left;
 	unsigned int volume_right;
-  // what else do we need? bass, pass-through, ...
+  /* what else do we need? bass, pass-through, ... */
 } audio_mixer_t;
 
 
diff --git a/include/uapi/linux/dvb/osd.h b/include/uapi/linux/dvb/osd.h
index e163508b9ae8..723824ce3622 100644
--- a/include/uapi/linux/dvb/osd.h
+++ b/include/uapi/linux/dvb/osd.h
@@ -28,74 +28,108 @@
 #include <linux/compiler.h>
 
 typedef enum {
-  // All functions return -2 on "not open"
-  OSD_Close=1,    // ()
-  // Disables OSD and releases the buffers
-  // returns 0 on success
-  OSD_Open,       // (x0,y0,x1,y1,BitPerPixel[2/4/8](color&0x0F),mix[0..15](color&0xF0))
-  // Opens OSD with this size and bit depth
-  // returns 0 on success, -1 on DRAM allocation error, -2 on "already open"
-  OSD_Show,       // ()
-  // enables OSD mode
-  // returns 0 on success
-  OSD_Hide,       // ()
-  // disables OSD mode
-  // returns 0 on success
-  OSD_Clear,      // ()
-  // Sets all pixel to color 0
-  // returns 0 on success
-  OSD_Fill,       // (color)
-  // Sets all pixel to color <col>
-  // returns 0 on success
-  OSD_SetColor,   // (color,R{x0},G{y0},B{x1},opacity{y1})
-  // set palette entry <num> to <r,g,b>, <mix> and <trans> apply
-  // R,G,B: 0..255
-  // R=Red, G=Green, B=Blue
-  // opacity=0:      pixel opacity 0% (only video pixel shows)
-  // opacity=1..254: pixel opacity as specified in header
-  // opacity=255:    pixel opacity 100% (only OSD pixel shows)
-  // returns 0 on success, -1 on error
-  OSD_SetPalette, // (firstcolor{color},lastcolor{x0},data)
-  // Set a number of entries in the palette
-  // sets the entries "firstcolor" through "lastcolor" from the array "data"
-  // data has 4 byte for each color:
-  // R,G,B, and a opacity value: 0->transparent, 1..254->mix, 255->pixel
-  OSD_SetTrans,   // (transparency{color})
-  // Sets transparency of mixed pixel (0..15)
-  // returns 0 on success
-  OSD_SetPixel,   // (x0,y0,color)
-  // sets pixel <x>,<y> to color number <col>
-  // returns 0 on success, -1 on error
-  OSD_GetPixel,   // (x0,y0)
-  // returns color number of pixel <x>,<y>,  or -1
-  OSD_SetRow,     // (x0,y0,x1,data)
-  // fills pixels x0,y through  x1,y with the content of data[]
-  // returns 0 on success, -1 on clipping all pixel (no pixel drawn)
-  OSD_SetBlock,   // (x0,y0,x1,y1,increment{color},data)
-  // fills pixels x0,y0 through  x1,y1 with the content of data[]
-  // inc contains the width of one line in the data block,
-  // inc<=0 uses blockwidth as linewidth
-  // returns 0 on success, -1 on clipping all pixel
-  OSD_FillRow,    // (x0,y0,x1,color)
-  // fills pixels x0,y through  x1,y with the color <col>
-  // returns 0 on success, -1 on clipping all pixel
-  OSD_FillBlock,  // (x0,y0,x1,y1,color)
-  // fills pixels x0,y0 through  x1,y1 with the color <col>
-  // returns 0 on success, -1 on clipping all pixel
-  OSD_Line,       // (x0,y0,x1,y1,color)
-  // draw a line from x0,y0 to x1,y1 with the color <col>
-  // returns 0 on success
-  OSD_Query,      // (x0,y0,x1,y1,xasp{color}}), yasp=11
-  // fills parameters with the picture dimensions and the pixel aspect ratio
-  // returns 0 on success
-  OSD_Test,       // ()
-  // draws a test picture. for debugging purposes only
-  // returns 0 on success
-// TODO: remove "test" in final version
-  OSD_Text,       // (x0,y0,size,color,text)
-  OSD_SetWindow, //  (x0) set window with number 0<x0<8 as current
-  OSD_MoveWindow, //  move current window to (x0, y0)
-  OSD_OpenRaw,	// Open other types of OSD windows
+	/* All functions return -2 on "not open" */
+	OSD_Close=1,	/* () */
+	/*
+	 * Disables OSD and releases the buffers
+	 * returns 0 on success
+	 */
+	OSD_Open,	/* (x0,y0,x1,y1,BitPerPixel[2/4/8](color&0x0F),mix[0..15](color&0xF0)) */
+	/*
+	 * Opens OSD with this size and bit depth
+	 * returns 0 on success, -1 on DRAM allocation error, -2 on "already open"
+	 */
+	OSD_Show,	/* () */
+	/*
+	 * enables OSD mode
+	 * returns 0 on success
+	 */
+	OSD_Hide,	/* () */
+	/*
+	 * disables OSD mode
+	 * returns 0 on success
+	 */
+	OSD_Clear,	/* () */
+	/*
+	 * Sets all pixel to color 0
+	 * returns 0 on success
+	 */
+	OSD_Fill,	/* (color) */
+	/*
+	 * Sets all pixel to color <col>
+	 * returns 0 on success
+	 */
+	OSD_SetColor,	/* (color,R{x0},G{y0},B{x1},opacity{y1}) */
+	/*
+	 * set palette entry <num> to <r,g,b>, <mix> and <trans> apply
+	 * R,G,B: 0..255
+	 * R=Red, G=Green, B=Blue
+	 * opacity=0:      pixel opacity 0% (only video pixel shows)
+	 * opacity=1..254: pixel opacity as specified in header
+	 * opacity=255:    pixel opacity 100% (only OSD pixel shows)
+	 * returns 0 on success, -1 on error
+	 */
+	OSD_SetPalette,	/* (firstcolor{color},lastcolor{x0},data) */
+	/*
+	 * Set a number of entries in the palette
+	 * sets the entries "firstcolor" through "lastcolor" from the array "data"
+	 * data has 4 byte for each color:
+	 * R,G,B, and a opacity value: 0->transparent, 1..254->mix, 255->pixel
+	 */
+	OSD_SetTrans,	/* (transparency{color}) */
+	/*
+	 * Sets transparency of mixed pixel (0..15)
+	 * returns 0 on success
+	 */
+	OSD_SetPixel,	/* (x0,y0,color) */
+	/*
+	 * sets pixel <x>,<y> to color number <col>
+	 * returns 0 on success, -1 on error
+	 */
+	OSD_GetPixel,	/* (x0,y0) */
+	/* returns color number of pixel <x>,<y>,  or -1 */
+	OSD_SetRow,	/* (x0,y0,x1,data) */
+	/*
+	 * fills pixels x0,y through  x1,y with the content of data[]
+	 * returns 0 on success, -1 on clipping all pixel (no pixel drawn)
+	 */
+	OSD_SetBlock,	/* (x0,y0,x1,y1,increment{color},data) */
+	/*
+	 * fills pixels x0,y0 through  x1,y1 with the content of data[]
+	 * inc contains the width of one line in the data block,
+	 * inc<=0 uses blockwidth as linewidth
+	 * returns 0 on success, -1 on clipping all pixel
+	 */
+	OSD_FillRow,	/* (x0,y0,x1,color) */
+	/*
+	 * fills pixels x0,y through  x1,y with the color <col>
+	 * returns 0 on success, -1 on clipping all pixel
+	 */
+	OSD_FillBlock,	/* (x0,y0,x1,y1,color) */
+	/*
+	 * fills pixels x0,y0 through  x1,y1 with the color <col>
+	 * returns 0 on success, -1 on clipping all pixel
+	 */
+	OSD_Line,	/* (x0,y0,x1,y1,color) */
+	/*
+	 * draw a line from x0,y0 to x1,y1 with the color <col>
+	 * returns 0 on success
+	 */
+	OSD_Query,	/* (x0,y0,x1,y1,xasp{color}}), yasp=11 */
+	/*
+	 * fills parameters with the picture dimensions and the pixel aspect ratio
+	 * returns 0 on success
+	 */
+	OSD_Test,       /* () */
+	/*
+	 * draws a test picture. for debugging purposes only
+	 * returns 0 on success
+	 * TODO: remove "test" in final version
+	 */
+	OSD_Text,	/* (x0,y0,size,color,text) */
+	OSD_SetWindow,	/* (x0) set window with number 0<x0<8 as current */
+	OSD_MoveWindow,	/* move current window to (x0, y0) */
+	OSD_OpenRaw,	/* Open other types of OSD windows */
 } OSD_Command;
 
 typedef struct osd_cmd_s {
-- 
2.17.1

