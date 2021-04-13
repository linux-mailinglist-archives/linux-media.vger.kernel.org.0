Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043DC35E74A
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 21:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348120AbhDMTum (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 15:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348070AbhDMTul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 15:50:41 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3816C061574;
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id b17so12710592pgh.7;
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xuSm7lduvaNieNDTtoqbp4d4Yshagez+v52iHy5UOJg=;
        b=eFmB2glJriyWzg8p5ap5w+1U0RcYO2BC0Ga/uhAsjZJRbnNPvA+vHTkBbKE6c75bgY
         oglGjlVL5y+n6GUS9sPMp+UWd939RbhrUcqzFyqvbz0vJx4WDi3AlBjSLwe+p+zOfwtB
         XCgDxmS4Yi9U2ABrBRhKX46x3AwnHUCoMQQthsYml0JLTRWRn4xbVpFqKMUwJdA5ru++
         zeYutmRaNc9P5d6dCVHwFfOLWgGGX2mei5uBc0tC99t5VEL3XjiPtnbdNaspn1MA6SeA
         djQF0iXzr+kpVAkFSo7/W7QK5IgrEZ/RShE4ueoHKqXzfNE7O62ZBZSdWuGZXvGosEo+
         +9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xuSm7lduvaNieNDTtoqbp4d4Yshagez+v52iHy5UOJg=;
        b=Ont5L6bOTGR35A8pL14ql3wRRkPpFQ97LRlgZNfmz2T4D7bTkI4XYL77sNhwdofPdv
         nrdk/cHpOeR7vPpv7wCtZAqnZ9DZnHOyM1E5tgl4Hltxmm3wXlb/7XBrb/hdD6t3V2/n
         uMSfeRb6Uxnm1tZWB78UhrkKaRPRHqeqRn1GWpe2gWtAhyoJHXGUEFt1pQgVVH+kfx4A
         Uuptnbw/2u24yknu6jp6Q9oHukkaCLerczFM5+WVF+EkbTG2UjU+3x8WrlJFLgRcZtLz
         RqhsMQJbcZVMSrugfvz7DvWVIVIsTBSvOJzKPyyDfhCsFcqGhRuRwQaw2zteNTqnFlAR
         PNvA==
X-Gm-Message-State: AOAM531jdeB8cnOdv8Zp07EN8Nz6WJIZkY7DypB5i54tmnst1tSpC3gI
        wUwD4Yb/J1muvQDZW1oy+x4=
X-Google-Smtp-Source: ABdhPJzF9lSPapn0zS9nxnfdhmu58sA5DNzZCVas/BZDZGyPeyWS6jcTw5Od1DhnRnUzjRdVZYnvEA==
X-Received: by 2002:a63:1717:: with SMTP id x23mr33416121pgl.89.1618343421478;
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id q13sm91536pgp.37.2021.04.13.12.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:50:21 -0700 (PDT)
Date:   Wed, 14 Apr 2021 01:20:16 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v4 1/2] staging: media: zoran: add spaces around '<<' operator
Message-ID: <b0c00d95962a836d16a9ab2a0ee66d99f548b15d.1618342050.git.mitaliborkar810@gmail.com>
References: <cover.1618342050.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618342050.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added spaces around '<<' operator to improve readability and meet linux
kernel coding style.
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v3:- No changes.
Changes from v2:- No changes.
Changes from v1:- No changes.

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

