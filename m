Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4780F359023
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 01:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhDHXFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 19:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbhDHXFm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 19:05:42 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33B5C061761;
        Thu,  8 Apr 2021 16:05:28 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id z16so2464245pga.1;
        Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=n86d8I0VVSWF4Xuv5hVTXdKVgAMp4Cd1RqhEoJubX0Y=;
        b=QhgPRZJuZUrw6Lzc1Yw4KS8Vt59PLm4jF7notnmmmapKWK1ZBf9rR0aL1diuN1t/+7
         ndtZWza9MAqx9XEMHSMFlLvSffSVGsWIMCaRhcKlxT+EVjaFe7FfddBn5ndsnrbp5B/F
         0QmkZNKWyJZu2ufVkFQynSL7k2cBT+BqLMGf3HtYSijqWgcoNXXZEBuZRBue20zEYK0E
         NjoFubxirjFAyw1b4QTXLDMaOduuyZwt7GPPWjCVAZZO/MynFUkTkybt4YAfWXWis5mw
         CnSYvVL2bxTe+tcrn5KwVgj4Z2dnouXn8yavbhc9KEQQhvltwPDIlDktVAy8xfs+KYgi
         dIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=n86d8I0VVSWF4Xuv5hVTXdKVgAMp4Cd1RqhEoJubX0Y=;
        b=D6qT/Rr/A+RwoY9QXT5cwPnxZTZGd3Vwcd7ISP7K138rWzXhldM+/4k11J+1iDQykL
         82J50F+/etb30ztKtBXuWiENPu3TRVr3E7FMzK4m4LIHSWUCfIv2+T+LbQBxdCMaQVL6
         NEilqxRJGFYYH2dV8GYDMDqIOJzx+pjAhtj5CyS930lmI9uXc8MV49nd/JQ+ClmbZd/V
         I5R+9iRdtsTqGr26vAYluYgpfGxLBLDrqLvbYz2OeWWjTP1vT3KCpvJ18IGDo731TivT
         d+Q5fWEzXmnXskG2RT6sigWZe5wPA9Zccnd1UUupovp/j7bccKh5a/SzI1MFApPsTFWF
         woIw==
X-Gm-Message-State: AOAM530yVBpnNIsMNMTqAZxIh3L14JE1oeVUsubR7dYwJ7RX/5DJrgEl
        Ghwtm3Z4hjqveI8yYXNv5yg=
X-Google-Smtp-Source: ABdhPJyPvr1g+T662ZAFkvaFPPWDXEVYlB0QwtSqqlR1cZuOSZE05byi9KcRIyN77YUftw7m+dEPlg==
X-Received: by 2002:a63:e913:: with SMTP id i19mr9948560pgh.426.1617923128228;
        Thu, 08 Apr 2021 16:05:28 -0700 (PDT)
Received: from kali ([152.57.243.224])
        by smtp.gmail.com with ESMTPSA id f5sm384469pjo.3.2021.04.08.16.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 16:05:27 -0700 (PDT)
Date:   Fri, 9 Apr 2021 04:35:14 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: media: zoran: add '*' in subsequent line
Message-ID: <YG+MKk9C/fTd7vj4@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added '*' in susbsequent lines for block comments to meet linux kernel
coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36050.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 2826f4e5d37b..663ac2b3434e 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -25,7 +25,7 @@
 #include "videocodec.h"
 
 /* it doesn't make sense to have more than 20 or so,
-  just to prevent some unwanted loops */
+ * just to prevent some unwanted loops */
 #define MAX_CODECS 20
 
 /* amount of chips attached via this driver */
@@ -43,7 +43,7 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
 	} while (0)
 
 /* =========================================================================
-   Local hardware I/O functions:
+ *  Local hardware I/O functions:
 
    read/write via codec layer (registers are located in the master device)
    ========================================================================= */
@@ -80,7 +80,7 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 }
 
 /* =========================================================================
-   Local helper function:
+ *  Local helper function:
 
    status read
    ========================================================================= */
@@ -95,7 +95,7 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
+ *  Local helper function:
 
    scale factor read
    ========================================================================= */
@@ -112,7 +112,7 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
+ *  Local helper function:
 
    wait if codec is ready to proceed (end of processing) or time is over
    ========================================================================= */
@@ -133,7 +133,7 @@ static void zr36050_wait_end(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
+ *  Local helper function:
 
    basic test of "connectivity", writes/reads to/from memory the SOF marker
    ========================================================================= */
@@ -174,7 +174,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Local helper function:
+ *  Local helper function:
 
    simple loop for pushing the init datasets
    ========================================================================= */
@@ -192,7 +192,7 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
 }
 
 /* =========================================================================
-   Basic datasets:
+ *  Basic datasets:
 
    jpeg baseline setup data (you find it on lots places in internet, or just
    extract it from any regular .jpg image...)
@@ -294,7 +294,7 @@ static const char zr36050_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
 /* =========================================================================
-   Local helper functions:
+ *  Local helper functions:
 
    calculation and setup of parameter-dependent JPEG baseline segments
    (needed for compression only)
@@ -303,7 +303,7 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 /* ------------------------------------------------------------------------- */
 
 /* SOF (start of frame) segment depends on width, height and sampling ratio
-			 of each color component */
+ *			 of each color component */
 
 static int zr36050_set_sof(struct zr36050 *ptr)
 {
@@ -334,7 +334,7 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 /* ------------------------------------------------------------------------- */
 
 /* SOS (start of scan) segment depends on the used scan components
-			of each color component */
+ *			of each color component */
 
 static int zr36050_set_sos(struct zr36050 *ptr)
 {
@@ -378,7 +378,7 @@ static int zr36050_set_dri(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   Setup function:
+ *  Setup function:
 
    Setup compression/decompression of Zoran's JPEG processor
    ( see also zoran 36050 manual )
@@ -531,13 +531,13 @@ static void zr36050_init(struct zr36050 *ptr)
 }
 
 /* =========================================================================
-   CODEC API FUNCTIONS
+ *  CODEC API FUNCTIONS
 
    this functions are accessed by the master via the API structure
    ========================================================================= */
 
 /* set compression/expansion mode and launches codec -
-   this should be the last call from the master before starting processing */
+ *  this should be the last call from the master before starting processing */
 static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
 	struct zr36050 *ptr = (struct zr36050 *)codec->data;
@@ -707,7 +707,7 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 }
 
 /* =========================================================================
-   Exit and unregister function:
+ *  Exit and unregister function:
 
    Deinitializes Zoran's JPEG processor
    ========================================================================= */
@@ -732,7 +732,7 @@ static int zr36050_unset(struct videocodec *codec)
 }
 
 /* =========================================================================
-   Setup and registry function:
+ *  Setup and registry function:
 
    Initializes Zoran's JPEG processor
 
@@ -813,7 +813,7 @@ static const struct videocodec zr36050_codec = {
 };
 
 /* =========================================================================
-   HOOK IN DRIVER AS KERNEL MODULE
+ *  HOOK IN DRIVER AS KERNEL MODULE
    ========================================================================= */
 
 static int __init zr36050_init_module(void)
-- 
2.30.2

