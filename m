Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A2535E502
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhDMR15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:27:57 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:45737 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhDMR14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:27:56 -0400
Received: by mail-pg1-f181.google.com with SMTP id d10so12422166pgf.12;
        Tue, 13 Apr 2021 10:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=P/nF+Bi9t9pQ6aC5jnW/oRn1P0rw0LcucwwKdVoOO7Q=;
        b=AJ2+lRh++FAHgdAnQ+Nnkb5tqd304aC8IFqvS/AZJwhMOFKNZGBIZ1xp5qLno3pvvb
         yWNI4+p/oB57IFT0Phcpoqf68LZyhNGuAODWXXThLqO0AcIUN6T989AlxuycqRGvAFMA
         8vp9sJakGV4e1Z/e7oC9YjzMfKmn67FTnYjj6eSAkEytitLV6mmGgxel2LYmKh+5eSIb
         MtZdIXpG2A/D8XrSvSKWhW8wjEj9Ezhm3pmaYv0updCZH/qVYueLPEZ7kLqZzoVDP+Ds
         aD88/uzFpVzFRcc200B5wJ3043Pp9btDQzmIfMVq+1WDJ9HSlXfQ2v9M32RxgkGET6yW
         bdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=P/nF+Bi9t9pQ6aC5jnW/oRn1P0rw0LcucwwKdVoOO7Q=;
        b=IsKbfm+e/dSAtT+q7He+XI9r8oI0rxmmA7rOaXRDVQkYO7hokF1s174bCrQCkqffd+
         rPmzhz6uGY2qJCfHEVKeZXQ0ey8xRttPs0ApFZwsRW+R78a9+7w6vQVSdiHz5IwX1HmO
         qnNaMoScAJvVmbSLsDfrZjDwTOIrGeq0lbYjh9Ooj30cz3WGrKe1oL2NETdTOlQsX5Zj
         wtenVezTKmbfBayge8b7UkGjYSnvbVc/ZvDiba8vZK+J992vKNBIxBSh5BQopBiFG1BV
         2HdJdGj4nURqNr5oojWp1Eb4KukwF1LfOGBfZ7THW4zJDj4LKuU08w9nR6pHi8eULOxW
         pacg==
X-Gm-Message-State: AOAM533t7sBQSdKyNK8dpsgKhbmOkI5SJa3TF/hruaaokcFgIdVLVWA+
        1k9J/vm97aU4MGz18jPQSX0=
X-Google-Smtp-Source: ABdhPJxdBLpF9F31J5skzz8GkLMLR9rnSXMHdjss7U8h16dDV1wHhfU210soWqKhBUxBINVPy8E4EA==
X-Received: by 2002:a65:5c4d:: with SMTP id v13mr16355555pgr.161.1618334796257;
        Tue, 13 Apr 2021 10:26:36 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id k15sm13243834pfi.0.2021.04.13.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 10:26:35 -0700 (PDT)
Date:   Tue, 13 Apr 2021 22:56:25 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: Subject: [PATCH v4]  staging: media: zoran: add '*' in
 long(multi-line) comments
Message-ID: <YHXUQc+IgZ1y9TQu@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added '*' before every line inside long(multi-line) comments. Removed
'*/' from end of the comment line and added to next line as per linux
kernel coding style. Aligned '*' accordingly to make code neater.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v3:- Rebased this patch and made changes against mainline
code. 
Changes from v2:- made style changes in code according to linux kernel
coding style for long comments.
Changes from v1:- Changes made in code according to linux kernel coding
style for long(multi-line) comments.

 drivers/staging/media/zoran/zr36050.c | 192 +++++++++++++++-----------
 1 file changed, 112 insertions(+), 80 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 2826f4e5d37b..a1084aa142e7 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -24,8 +24,11 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
-  just to prevent some unwanted loops */
+/*
+ * it doesn't make sense to have more than 20 or so,
+ * just to prevent some unwanted loops
+ */
+
 #define MAX_CODECS 20
 
 /* amount of chips attached via this driver */
@@ -43,10 +46,11 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
 	} while (0)
 
 /* =========================================================================
-   Local hardware I/O functions:
-
-   read/write via codec layer (registers are located in the master device)
-   ========================================================================= */
+ * Local hardware I/O functions:
+ *
+ * read/write via codec layer (registers are located in the master device)
+ * =========================================================================
+ */
 
 /* read and write functions */
 static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
@@ -80,10 +84,11 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 }
 
 /* =========================================================================
-   Local helper function:
-
-   status read
-   ========================================================================= */
+ * Local helper function:
+ *
+ * status read
+ * =========================================================================
+ */
 
 /* status is kept in datastructure */
 static u8 zr36050_read_status1(struct zr36050 *ptr)
@@ -95,10 +100,11 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
-
-   scale factor read
-   ========================================================================= */
+ * Local helper function:
+ *
+ * scale factor read
+ * =========================================================================
+ */
 
 /* scale factor is kept in datastructure */
 static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
@@ -112,10 +118,11 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
-
-   wait if codec is ready to proceed (end of processing) or time is over
-   ========================================================================= */
+ * Local helper function:
+ *
+ * wait if codec is ready to proceed (end of processing) or time is over
+ * =========================================================================
+ */
 
 static void zr36050_wait_end(struct zr36050 *ptr)
 {
@@ -133,10 +140,11 @@ static void zr36050_wait_end(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
-
-   basic test of "connectivity", writes/reads to/from memory the SOF marker
-   ========================================================================= */
+ * Local helper function:
+ *
+ * basic test of "connectivity", writes/reads to/from memory the SOF marker
+ * =========================================================================
+ */
 
 static int zr36050_basic_test(struct zr36050 *ptr)
 {
@@ -174,10 +182,11 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
-
-   simple loop for pushing the init datasets
-   ========================================================================= */
+ * Local helper function:
+ *
+ * simple loop for pushing the init datasets
+ * =========================================================================
+ */
 
 static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
 {
@@ -192,15 +201,16 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
 }
 
 /* =========================================================================
-   Basic datasets:
-
-   jpeg baseline setup data (you find it on lots places in internet, or just
-   extract it from any regular .jpg image...)
-
-   Could be variable, but until it's not needed it they are just fixed to save
-   memory. Otherwise expand zr36050 structure with arrays, push the values to
-   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
-   ========================================================================= */
+ * Basic datasets:
+ *
+ * jpeg baseline setup data (you find it on lots places in internet, or just
+ * extract it from any regular .jpg image...)
+ *
+ * Could be variable, but until it's not needed it they are just fixed to save
+ * memory. Otherwise expand zr36050 structure with arrays, push the values to
+ * it and initialize from there, as e.g. the linux zr36057/60 driver does it.
+ * =========================================================================
+ */
 
 static const char zr36050_dqt[0x86] = {
 	0xff, 0xdb,		//Marker: DQT
@@ -294,16 +304,19 @@ static const char zr36050_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
 /* =========================================================================
-   Local helper functions:
-
-   calculation and setup of parameter-dependent JPEG baseline segments
-   (needed for compression only)
-   ========================================================================= */
+ * Local helper functions:
+ *
+ * calculation and setup of parameter-dependent JPEG baseline segments
+ * (needed for compression only)
+ * =========================================================================
+ */
 
 /* ------------------------------------------------------------------------- */
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio
-			 of each color component */
+/*
+ * SOF (start of frame) segment depends on width, height and sampling ratio
+ * of each color component
+ */
 
 static int zr36050_set_sof(struct zr36050 *ptr)
 {
@@ -333,8 +346,10 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 
 /* ------------------------------------------------------------------------- */
 
-/* SOS (start of scan) segment depends on the used scan components
-			of each color component */
+/*
+ * SOS (start of scan) segment depends on the used scan components
+ * of each color component
+ */
 
 static int zr36050_set_sos(struct zr36050 *ptr)
 {
@@ -378,13 +393,14 @@ static int zr36050_set_dri(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Setup function:
-
-   Setup compression/decompression of Zoran's JPEG processor
-   ( see also zoran 36050 manual )
-
-   ... sorry for the spaghetti code ...
-   ========================================================================= */
+ * Setup function:
+ *
+ * Setup compression/decompression of Zoran's JPEG processor
+ * ( see also zoran 36050 manual )
+ *
+ * ... sorry for the spaghetti code ...
+ * =========================================================================
+ */
 static void zr36050_init(struct zr36050 *ptr)
 {
 	int sum = 0;
@@ -419,8 +435,10 @@ static void zr36050_init(struct zr36050 *ptr)
 		sum += zr36050_set_sos(ptr);
 		sum += zr36050_set_dri(ptr);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
-		 * (see table init section above) */
+		/*
+		 * setup the fixed jpeg tables - maybe variable, though -
+		 * (see table init section above)
+		 */
 		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
 		sum += zr36050_pushit(ptr, ZR050_DQT_IDX,
 				      sizeof(zr36050_dqt), zr36050_dqt);
@@ -531,13 +549,16 @@ static void zr36050_init(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   CODEC API FUNCTIONS
-
-   this functions are accessed by the master via the API structure
-   ========================================================================= */
+ * CODEC API FUNCTIONS
+ *
+ * this functions are accessed by the master via the API structure
+ * =========================================================================
+ */
 
-/* set compression/expansion mode and launches codec -
-   this should be the last call from the master before starting processing */
+/*
+ * set compression/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
+ */
 static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
@@ -564,9 +585,11 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
-	/* if () return -EINVAL;
+	/*
+	 * if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
-	 * we allow invalid startx/y and norm for now ... */
+	 * we allow invalid startx/y and norm for now ...
+	 */
 	ptr->width = cap->width / (cap->decimation & 0xff);
 	ptr->height = cap->height / ((cap->decimation >> 8) & 0xff);
 
@@ -585,8 +608,10 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 
 	ptr->real_code_vol = size >> 3; /* in bytes */
 
-	/* Set max_block_vol here (previously in zr36050_init, moved
- * here for consistency with zr36060 code */
+	/*
+	 * Set max_block_vol here (previously in zr36050_init, moved
+	 * here for consistency with zr36060 code
+	 */
 	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
 
 	return 0;
@@ -642,8 +667,10 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 		if (size != sizeof(int))
 			return -EFAULT;
 		ptr->total_code_vol = *ival;
-		/* (Kieran Morrissey)
-		 * code copied from zr36060.c to ensure proper bitrate */
+		/*
+		 * (Kieran Morrissey)
+		 * code copied from zr36060.c to ensure proper bitrate
+		 */
 		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
 		break;
 
@@ -707,10 +734,11 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 }
 
 /* =========================================================================
-   Exit and unregister function:
-
-   Deinitializes Zoran's JPEG processor
-   ========================================================================= */
+ * Exit and unregister function:
+ *
+ * Deinitializes Zoran's JPEG processor
+ * =========================================================================
+ */
 
 static int zr36050_unset(struct videocodec *codec)
 {
@@ -732,13 +760,14 @@ static int zr36050_unset(struct videocodec *codec)
 }
 
 /* =========================================================================
-   Setup and registry function:
-
-   Initializes Zoran's JPEG processor
-
-   Also sets pixel size, average code size, mode (compr./decompr.)
-   (the given size is determined by the processor with the video interface)
-   ========================================================================= */
+ * Setup and registry function:
+ *
+ * Initializes Zoran's JPEG processor
+ *
+ * Also sets pixel size, average code size, mode (compr./decompr.)
+ * (the given size is determined by the processor with the video interface)
+ * =========================================================================
+ */
 
 static int zr36050_setup(struct videocodec *codec)
 {
@@ -773,8 +802,10 @@ static int zr36050_setup(struct videocodec *codec)
 	memcpy(ptr->h_samp_ratio, zr36050_decimation_h, 8);
 	memcpy(ptr->v_samp_ratio, zr36050_decimation_v, 8);
 
-	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
-				 * (what is the difference?) */
+	ptr->bitrate_ctrl = 0;	/*
+				 * 0 or 1 - fixed file size flag
+				 * (what is the difference?)
+				 */
 	ptr->mode = CODEC_DO_COMPRESSION;
 	ptr->width = 384;
 	ptr->height = 288;
@@ -813,8 +844,9 @@ static const struct videocodec zr36050_codec = {
 };
 
 /* =========================================================================
-   HOOK IN DRIVER AS KERNEL MODULE
-   ========================================================================= */
+ * HOOK IN DRIVER AS KERNEL MODULE
+ * =========================================================================
+ */
 
 static int __init zr36050_init_module(void)
 {
-- 
2.30.2

