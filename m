Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2D0359D8F
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhDILki (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbhDILkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 07:40:37 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8068C061760;
        Fri,  9 Apr 2021 04:40:24 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id g10so2607817plt.8;
        Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=M4xX2WWfEqm7PGNI70AcSFeFug982FHKb8Dt0b/QqpQ=;
        b=vSPUmZpmgYYgSkQNzGePiVkKAonQ6CSFAsAIqewjEWD2/5cYOPYSu/TYwYBaiys5N4
         1O9MgUNs11EfINvx5nlt2nODwsba9ow5TPW0At8E+pmJvg/VqagcB5X6DXFdQe7Fi0/N
         T3EGOWO3SnShUixUDlgLU65CEwka8aDhSmooz812PueEg9EMd9nUhkzYnAMLhDcwkBV+
         m4gzV+zTSZzWB1zk8VRvrMnIXFy440Ccbg0XLxSwj3CEq6HFP1Kp0WGVCKVdrQ0BBZj+
         hcNz4OucUSws3F/aGP3hrPcwShgGhsGgAnxeEaqAFB9Cil1ZIQRLY1uKyQPzoK79A2ph
         pWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=M4xX2WWfEqm7PGNI70AcSFeFug982FHKb8Dt0b/QqpQ=;
        b=WNt+94Gxpfn+a1SlLmuVas4/xsSy8udfHyiSZRGosnd8IK8L/3lvoQzN6ct5Vo69cq
         uFgdym0uGINIknWoWwL9l8iZzGdkeS7Gc/13OqCDdN0IHsGCKLfyXYg2FJIq9maayaSz
         Aha7GhKGaOZX7uKtxzob8PA8DG4frRr6TrW6iMgLwP3bLPICGhBT+aFOxqpvETMNjyWy
         WZANuPapHgby+sahjEi8NqIfmo/S84TT7ldEWwooaInFPk/f/qhNJhKHI7NPg7xr2Hzj
         ++QW+pCPRDcF8bL6wq4+OfMtoO030GOd8kTrw3wMGlyX8ojWZ3qMMtpnn150XnmbRJm4
         Wc/Q==
X-Gm-Message-State: AOAM533Tx/bccBmSdLsJEsaBSPD+2BMlGFc01HOjidoer4EqTwPTiZtf
        gvJD7T6EKODZPQeVGwMwQfGOBa19oPM4Mw==
X-Google-Smtp-Source: ABdhPJwAVbX2Y/sOadYxvegw/IWh+DXCxN78WniKOnFyUpKbrR5bSRAfnvOhochMc31hJCXxFerTxQ==
X-Received: by 2002:a17:902:db05:b029:e9:ab78:51fd with SMTP id m5-20020a170902db05b02900e9ab7851fdmr3319055plx.22.1617968424384;
        Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id x22sm2108568pfa.24.2021.04.09.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 04:40:24 -0700 (PDT)
Date:   Fri, 9 Apr 2021 17:10:17 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3] staging: media: zoran: remove and move statement in next
 line with '*'
Message-ID: <YHA9IdZVRr4kbVJ0@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed and moved statement in line in long(multi-line) comments and
added '*' before it to meet linux kernel coding style for long (multi-line) comments

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v2:- made style changes in code according to linux kernel
coding style for long comments.

drivers/staging/media/zoran/zr36050.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 703064009c6b..b89afa239b0c 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -24,7 +24,8 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
+/*
+ * it doesn't make sense to have more than 20 or so,
  * just to prevent some unwanted loops
  */
 #define MAX_CODECS 20
@@ -311,7 +312,8 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
 /* ------------------------------------------------------------------------- */
 
-/* SOF (start of frame) segment depends on width, height and sampling ratio
+/*
+ * SOF (start of frame) segment depends on width, height and sampling ratio
  *			 of each color component
  */
 
@@ -343,7 +345,8 @@ static int zr36050_set_sof(struct zr36050 *ptr)
 
 /* ------------------------------------------------------------------------- */
 
-/* SOS (start of scan) segment depends on the used scan components
+/*
+ * SOS (start of scan) segment depends on the used scan components
  *			of each color component
  */
 
@@ -432,7 +435,8 @@ static void zr36050_init(struct zr36050 *ptr)
 		sum += zr36050_set_sos(ptr);
 		sum += zr36050_set_dri(ptr);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
+		/*
+		 * setup the fixed jpeg tables - maybe variable, though -
 		 * (see table init section above)
 		 */
 		dprintk(3, "%s: write DQT, DHT, APP\n", ptr->name);
@@ -551,8 +555,9 @@ static void zr36050_init(struct zr36050 *ptr)
  * =========================================================================
  */
 
-/* set compression/expansion mode and launches codec -
- *  this should be the last call from the master before starting processing
+/*
+ * set compression/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
  */
 
 static int zr36050_set_mode(struct videocodec *codec, int mode)
@@ -581,7 +586,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 		ptr->name, norm->h_start, norm->v_start,
 		cap->x, cap->y, cap->width, cap->height,
 		cap->decimation, cap->quality);
-	/* if () return -EINVAL;
+	/*
+	 * if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
 	 * we allow invalid startx/y and norm for now ...
 	 */
@@ -603,7 +609,8 @@ static int zr36050_set_video(struct videocodec *codec, const struct tvnorm *norm
 
 	ptr->real_code_vol = size >> 3; /* in bytes */
 
-	/* Set max_block_vol here (previously in zr36050_init, moved
+	/*
+	 * Set max_block_vol here (previously in zr36050_init, moved
 	 * here for consistency with zr36060 code
 	 */
 	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
@@ -661,7 +668,8 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
 		if (size != sizeof(int))
 			return -EFAULT;
 		ptr->total_code_vol = *ival;
-		/* (Kieran Morrissey)
+		/*
+		 * (Kieran Morrissey)
 		 * code copied from zr36060.c to ensure proper bitrate
 		 */
 		ptr->real_code_vol = (ptr->total_code_vol * 6) >> 3;
-- 
2.30.2

