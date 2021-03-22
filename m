Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55434369F
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 03:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhCVCYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 22:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhCVCYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 22:24:45 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C18C061574;
        Sun, 21 Mar 2021 19:24:45 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id q26so3914972qkm.6;
        Sun, 21 Mar 2021 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SJ2V/Q+KOn3+lwPvdbc2L1zP9G0R/ZBcdA6MYszXVhI=;
        b=pUR/ZwbH17+AY+um1I25B3IohxTQ0UZ6S9yXyZ9lQ3yuozceN7JcISBJ5b0Cvaxer9
         qmb3TMitQLIZ8gxi9/rY/qy8l2iX/zaUf9L/M36O2l5/1o6H1PUJ4MBIQxmlB3sz9fSK
         2WDkMCRP1z/Ivgr4ebBWpX/icpAqe0epoSlz23tH+w1iP/2oFyVKxWSAbYqnb3E7OODy
         2vhdNiXc2B/KLvK2MXlMDTR084Sf2uBv3u5pI2Pl0AgXKAjeTPG1fBpQ9eByusQEkg3M
         h3jftyeXoRWIuFlkx0VLdkViAu9n7J//+xzQ055RdKDfkn2oe8efqVF1JEdYQIH73i8w
         woJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SJ2V/Q+KOn3+lwPvdbc2L1zP9G0R/ZBcdA6MYszXVhI=;
        b=eYnoY3Fqv5slhe/NK9OCaFQXZjWWT6YYwfa35aYNUdkvQUU6a1PVCwk2+6NF2rnLE4
         G6v+v/74fecmcTylzIIasvGwt5sPgRjZIQRTmATunDFnplb0d/OV3ETTcf+PmC7qiB/e
         3RKHC2TnF0ByTL7scLXyMZJEXw5u16SWnD/7M96SlVbTsrNcPkKGyerouxSqcFwWvqGL
         9qmeaMcSDlpRvkV7OAWOmDYOkGQJENYdZ11BsTYMXN8UsMa3YlGetcg3qpPb3LIGe7dE
         c5NpNF1MrM1ZgZb+z2crXmZSv7QRp4/rate6dTeujlhPB/b3uV7D8ZaDUGR89TTMuwrI
         pU2g==
X-Gm-Message-State: AOAM533rMt81/xQJvIS8O9PA+M1IF6B3jvX0ctcZTNQjRPCs9/YiIKMx
        CuyCHVtcxY54TRzMfcAicdg=
X-Google-Smtp-Source: ABdhPJzj+lXWCdrxzmCdoSw8TuIGwfcIvrcQCWxg/g3Iqc3IShmCTDTb8GQw7/Go9mW4eKJspzvhbg==
X-Received: by 2002:a37:7745:: with SMTP id s66mr8794763qkc.18.1616379884725;
        Sun, 21 Mar 2021 19:24:44 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.190])
        by smtp.gmail.com with ESMTPSA id s6sm9917482qke.44.2021.03.21.19.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 19:24:44 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, unixbhaskar@gmail.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] media: Fix a typo
Date:   Mon, 22 Mar 2021 07:54:31 +0530
Message-Id: <20210322022431.3992890-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/Sysytem/System/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/staging/media/atomisp/i2c/gc2235.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 68252b8f516d..ba5db1230033 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -218,7 +218,7 @@ static struct gc2235_reg const gc2235_stream_off[] = {
 };

 static struct gc2235_reg const gc2235_init_settings[] = {
-	/* Sysytem */
+	/* System */
 	{ GC2235_8BIT, 0xfe, 0x80 },
 	{ GC2235_8BIT, 0xfe, 0x80 },
 	{ GC2235_8BIT, 0xfe, 0x80 },
--
2.31.0

