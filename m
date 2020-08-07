Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572F923E900
	for <lists+linux-media@lfdr.de>; Fri,  7 Aug 2020 10:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHGIgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Aug 2020 04:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGIgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Aug 2020 04:36:10 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA952C061574;
        Fri,  7 Aug 2020 01:36:09 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id h7so1034733qkk.7;
        Fri, 07 Aug 2020 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5jxKv6AGUpMqPYX4rcg8Y6ClYjKX89Kxhh7saOpFoM=;
        b=dhFLyhzD15lHcsKFDPnlp0crGaMdObAVg/OSbLAsxs5pJnP6ERVO/zXRoef8cE7iZ/
         +zmq6TaIBv2tJMEXWUKBW4MKQnlq9UvYR5DwH4Iez9jRqLVK3sADUX/IamPU0Tf24PFL
         aLDEeQPQTczCr9Vx4f1669wGYqBFFZqRYfhkLp9dvBOJZSVW5b6JLcuiYe+Gu4plmvu3
         DNFuZ5U/in3smz4DVbJAPNlfxTrtiIutzI1feCdtmAbFG22C7s15zypPzQMbVcHYP+LO
         rpUSZLfJ8sVbxb1iQ/oVgIHEtqEQyEPuh2JrzJQbN7Z+TY+zwACeop9SLXcVBuR7h+Nh
         W9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o5jxKv6AGUpMqPYX4rcg8Y6ClYjKX89Kxhh7saOpFoM=;
        b=b40BDK1uXXev7SAyPAhZuDOu9AsUf8NE2+v0ltZLRrmqaYyNGvCT+cegFDZpBCu3Zz
         Qvcti9WEOHMb6nQTnlbHH/iDCNMvHpAY210vDlD2g0Z4UahqLMepwwZCA8zDkyza6Qxr
         ZEgdPp0tFKBQQgsAki5uzoULfGb7luufblUM7Zh/ok23IuT/bmlnrH1Vc0muzRfzS/Gd
         X7qurkQ5/M+Y0NZBnzvA8mxV666GLNROne9OQ+SOb4sGvbJ95IUzC5m+0CLBD+ryuwiY
         8dgs/Vex6Og5TYNpxSvuSy0aHrCFvWHcz0ZLRSfl4HG86kEDLWAletuJRF/qaHbcuQIo
         rF0w==
X-Gm-Message-State: AOAM532GM5469Hq+f8u7nDJJSLvFdSHsqrll4Wzwphk9rfaN3R1PLLJ/
        Zw1uQoytdGL48StHNH7iHLo=
X-Google-Smtp-Source: ABdhPJzLXuaNuBUAJkxY5f5H7E5+VUxW1JqrBrW9nuJ239/72kYuC86uQvEkINpqUygtjT5DHaaoQQ==
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr13215403qkg.326.1596789368992;
        Fri, 07 Aug 2020 01:36:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
        by smtp.gmail.com with ESMTPSA id c42sm7846728qte.5.2020.08.07.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 01:36:08 -0700 (PDT)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     skhan@linuxfoundation.org,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/20] media: sunxi: sun8i-rotate.c: remove useless error message
Date:   Fri,  7 Aug 2020 05:35:28 -0300
Message-Id: <20200807083548.204360-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This fixes the following coccinelle report:

drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c:751:2-9:
line 751 is redundant because platform_get_irq() already prints an error

By removing the useless call to dev_err()

Found using - Coccinelle (http://coccinelle.lip6.fr)

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 94f505d3cbad..3f81dd17755c 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -747,11 +747,8 @@ static int rotate_probe(struct platform_device *pdev)
 	dev->dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(dev->dev, "Failed to get IRQ\n");
-
+	if (irq <= 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev->dev, irq, rotate_irq,
 			       0, dev_name(dev->dev), dev);
-- 
2.28.0

