Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B19358E96
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 22:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhDHUjY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 16:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhDHUjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 16:39:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1FBC061760;
        Thu,  8 Apr 2021 13:39:12 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id d5-20020a17090a2a45b029014d934553c4so2862725pjg.1;
        Thu, 08 Apr 2021 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/L7A3l46tNABUmGq61qq6UpeuB+FYzbiNc0Yan16neA=;
        b=EwDXlZrtDBcn1kmjhbjlnompQxgc+bbs+bYgDfMiDzrFJ94mKNOX1TEvsKhTafxSQ7
         gi11uKhdIR2lqzhqyvJkFrEMnPLLFipZ18nx+Tx5WpFSTf1+kaADZaB3uqtiyCgXFdwE
         pAh2IEO1qgBCdb1UVuKMoiaNRvNxfLg0zP2XBosCWQInzx+ANb9KYuTiiDwU7uYsU7Fo
         TPNLCYmUekzGGFkcoq64rT8xDGowGdzRm/Ei6+6PACZE4N3QC9v4xZkSOlqTb1y2OVce
         eb92xWSEAbwd524KsdZX8+XCFaY+dP0iP7rlDB+fsYZFwj2b3NO03i8rAWzD+KkGiCMI
         G4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/L7A3l46tNABUmGq61qq6UpeuB+FYzbiNc0Yan16neA=;
        b=kEEJDZcwKXoXnioXJfni1fxmkbW0oAdG0d+VoGynGp5rEfughBUoak2hgeceq4YkR0
         COw/Y0ixAdPS2keTQTP13ad2dXwvRUdEKkxFyHUUWwTpxbHdF9DbS2dUogRVoKHWYNxT
         dPz7T/49zMQVslD2htOw818dq+qNdVl2qjqTFbllC0q2yNusMa6Sqk3Q63O8cHtKzkTz
         1Q6YwePnxzXtQMZxZG2U3V2GAAYgFAj9MpSQksZoMCx4J7TpsX2oYJbHSJl2g3TJ+1g7
         mVA1b+aK7vzCh0zVky4oxOU5GVD1oLvAoHQm3zE6jBAUJNjKkdEM4jGM9HyBdAJhF8/8
         JN8Q==
X-Gm-Message-State: AOAM532aQS+K9w60YdifFuPMqHsLXeauC/s2zWGM+VOnSQyOdrjnbpcA
        c1Jnyf81SbI4m068OkJZE5c=
X-Google-Smtp-Source: ABdhPJw0TdUMwYSHaKKvvRCxUme6TrxQBpONY4bga2EFyFtosnFHSNkJ+jdNS5lpJvYQFyORFbgOQA==
X-Received: by 2002:a17:902:6946:b029:e9:4dcc:9966 with SMTP id k6-20020a1709026946b02900e94dcc9966mr9601041plt.6.1617914351540;
        Thu, 08 Apr 2021 13:39:11 -0700 (PDT)
Received: from kali ([152.57.11.236])
        by smtp.gmail.com with ESMTPSA id t10sm259255pjy.16.2021.04.08.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:39:11 -0700 (PDT)
Date:   Fri, 9 Apr 2021 02:09:03 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH 2/2] media: zoran: replace bit shifts by BIT() macro
Message-ID: <ac8ec2b70ac2cc7c541c05a1d9a8db1fe79df793.1617912177.git.mitaliborkar810@gmail.com>
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617912177.git.mitaliborkar810@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
This BIT() macro from linux/bitops.h is used to define ZR36057_VFESPFR_* bitmasks.
Use of macro is better and neater. It maintains consistency.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/zoran/zr36057.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index a2a75fd9f535..93075459f910 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -8,6 +8,8 @@
 #ifndef _ZR36057_H_
 #define _ZR36057_H_
 
+#include <linux/bitops.h>
+
 /* Zoran ZR36057 registers */
 
 #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
@@ -31,12 +33,12 @@
 #define ZR36057_VFESPFR_VER_DCM          8
 #define ZR36057_VFESPFR_DISP_MODE        6
 #define ZR36057_VFESPFR_YUV422          (0 << 3)
-#define ZR36057_VFESPFR_RGB888          (1 << 3)
+#define ZR36057_VFESPFR_RGB888          BIT(3)
 #define ZR36057_VFESPFR_RGB565          (2 << 3)
 #define ZR36057_VFESPFR_RGB555          (3 << 3)
-#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
-#define ZR36057_VFESPFR_PACK24          (1 << 1)
-#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
+#define ZR36057_VFESPFR_ERR_DIF          BIT(2)
+#define ZR36057_VFESPFR_PACK24          BIT(1)
+#define ZR36057_VFESPFR_LITTLE_ENDIAN    BIT(0)
 
 #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
 
-- 
2.30.2

