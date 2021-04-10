Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C09E35AEDD
	for <lists+linux-media@lfdr.de>; Sat, 10 Apr 2021 17:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhDJPeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Apr 2021 11:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbhDJPeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Apr 2021 11:34:11 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9275C06138A;
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id v8so4156346plz.10;
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b5BqcJY31tpHgoOIg8xmOV3jrrzgv1cy4FkuM4zTOiQ=;
        b=CUxl1BF1GCsbKQS2vXYRlSRgpS/eHacg7Tqw/G4m7NgoJ1iTA612mVny8XU+gKX6R8
         M9cGzIl2svhO3e3mNJlOoFoPHrhRGGtTiDkbbooD48SToLnNm3GXePocG2Mz+8lfXZTT
         sO8WKMGa6tNuw5daAAyfU+q21luJc5zr3bSZLHr3mIAgLMF6vs063Ktby2jM3v2INwdR
         ck+7A82+KDcOyui26cURoKcWXEb2M6FD0zlcOGO2JbG2prgKTZAfZ2ILRjvmnXhQPxRt
         BW8UGGz/UcmEp7vgDIcu9KS5c1Of7DApPFB8csg7PS0QKFkNxqb3ALRpLsggVZSSPJ/B
         zCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5BqcJY31tpHgoOIg8xmOV3jrrzgv1cy4FkuM4zTOiQ=;
        b=FrsrUKwlDdQ6xr33pWU/1hflXvtq1CrLbbbKsR/ud+orM0Ow9b6tMaW+Q+v9aGRZ1s
         Lg5Sb3k3Ad+FmjP+16vA2eLt7oTBJqBWL26E5Llblch/BdQ8oRTzJhEYcIeQ2Z1VuBF4
         19LblzKLJAiUUQmSiIynrW5kBF1rIO9D3taRVPiRpIPsS7dUoL+UFe0VE/3Bk01slcgZ
         7QFpoOTuaAbMUu0hAiI69uJouOSnVniqcMmaQY39lt12Z0i0Z5+VDY25uQHy3smu5hZf
         V4eR/suweKiSP0FPZ9H1zra2SwoS8K9VzTLGYEJsq5NrT0kcqUDNwqRTasTRp+h35XOb
         +zBw==
X-Gm-Message-State: AOAM532YqNa/KH3gt3PC/t6dBkvvR8cp7cTEBG5xypM1QpF3VF81Qd42
        EM4/1hF49bXGBxsOnCfy/BY=
X-Google-Smtp-Source: ABdhPJzPrLqBk4EfNqN/6qhGgPl5xZQ9s9sgZg3n0tPuBPT+cWeirYICyCF7O+B/YUrDAxhUHPHfEQ==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr19999635pji.33.1618068836506;
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id w13sm1005111pfn.219.2021.04.10.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 08:33:56 -0700 (PDT)
Date:   Sat, 10 Apr 2021 21:03:48 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v3 1/2] media: zoran: add spaces around '<<'
Message-ID: <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1618066787.git.mitaliborkar810@gmail.com>
References: <cover.1618066787.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618066787.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes. 
Changes from v1:- NO changes.

 drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index 71b651add35a..a2a75fd9f535 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -30,13 +30,13 @@
 #define ZR36057_VFESPFR_HOR_DCM          14
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
-#define ZR36057_VFESPFR_YUV422          (0<<3)
-#define ZR36057_VFESPFR_RGB888          (1<<3)
-#define ZR36057_VFESPFR_RGB565          (2<<3)
-#define ZR36057_VFESPFR_RGB555          (3<<3)
-#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
-#define ZR36057_VFESPFR_PACK24          (1<<1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
+#define ZR36057_VFESPFR_YUV422          (0 << 3)
+#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB565          (2 << 3)
+#define ZR36057_VFESPFR_RGB555          (3 << 3)
+#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
+#define ZR36057_VFESPFR_PACK24          (1 << 1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

