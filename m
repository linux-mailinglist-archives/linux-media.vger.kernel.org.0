Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B5D35A600
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 20:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234578AbhDISo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 14:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISoz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 14:44:55 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD2DC061762;
        Fri,  9 Apr 2021 11:44:42 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id f29so4585246pgm.8;
        Fri, 09 Apr 2021 11:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DEZQwU7+bR4zHFrlZFkoLnzYpfePzyjEKTTsW+6yMQA=;
        b=hWYEFRmZHHq7fkA7wJ3zyzQ33SlB4kEy087wSHjM57p38jnVLjOrnmCarDHQGPzJhU
         qEI5AEHfF+CiRpBP0a1E9vCGCIosskyPta844Nhlq0nP+jd3pnIR26+WXJOQW3JdsYX3
         cM7R0w33zniJwQjNlFXcUc0nYDz/wNrLUjzn0rPbOF/UxkLHE4jX2X6PtfCYlqVGLlma
         SggnWL6Tsbzx3lBbHcjPNlvCavJmCIaHivPMqOtGYLXpBdHB6A/x3As85EMMDBLjdY19
         lcAgzQd1PrCWtg1sopDtS0TLTCTMOamDypm7zi5tyhgZt4HbA3FJ7BAQJiNZjcLPcRIb
         sa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DEZQwU7+bR4zHFrlZFkoLnzYpfePzyjEKTTsW+6yMQA=;
        b=EvH7wzM8xVnGtSDyaUeazxRsljK1y11E1znk8HECjjRc2Uvvh/wKcmJH7f8WcjhBf6
         oW52IqOa2I0hgAKQidXaKAfnfK477678Q5SFz171xskWYIgUF+LZqbMN1G7O0qZ3rfTp
         zahGxLFhzwh73DBNL0G1xlHTalTyxjT6OVHPVITKMC+sHx45Q1xZnhhmZS/BQRhOZeHv
         hwGlu7DN432A6rqu8EHbBHXkRabZQPxt71AElqOy10GJ+1hHNAvVPhZ5iJJg0nVhXspc
         lWymFgFHMny+9seBWywveczOzcOljr3GjKmQ7/9DjL07KpqzcIqjHVPKXkwUfM6vfxfs
         ttlg==
X-Gm-Message-State: AOAM533qqwdbppJa+nhHLM7DM3pgW7KAaelvgcNUkQr4zhJuAbxjoa31
        dFPXhUiubD4JUPNidJ8oFBFbvxgFHwNCpA5b
X-Google-Smtp-Source: ABdhPJzu4bCXLSjenPJXTSJRDLycnPDpmuiYYHlU7pIMsQcYVkOsPHaxzavx0ken+t5E3ME7fIMb+w==
X-Received: by 2002:aa7:950d:0:b029:244:4dd5:cd0a with SMTP id b13-20020aa7950d0000b02902444dd5cd0amr9255389pfp.59.1617993881518;
        Fri, 09 Apr 2021 11:44:41 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id l191sm3151921pfd.36.2021.04.09.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:44:41 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:14:34 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/2] media: zoran: add spaces around '<<'
Message-ID: <YHCgksbiLv0pFF2F@kali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No changes required in this patch. 
In v1:- Added spaces around '<<' operator to improve readability and meet linux kernel coding
style

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes required in this patch. Below is the git
diff of v1.

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

