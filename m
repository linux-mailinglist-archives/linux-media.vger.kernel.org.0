Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700694A9002
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 22:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbiBCVdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 16:33:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbiBCVdx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Feb 2022 16:33:53 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F62C061714
        for <linux-media@vger.kernel.org>; Thu,  3 Feb 2022 13:33:52 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u15so7592803wrt.3
        for <linux-media@vger.kernel.org>; Thu, 03 Feb 2022 13:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9AfkjUnVxeNqVoeugHaThJw3JxIMcLbLETWwcQCrwo=;
        b=iMvPW2xTGl5uctkSBLQfxFVeHuQ6zqsB5u7/yvuoTzUK+ipzWzCgE++748Oi+ZUYZj
         sWESeRObmk0ZeIpoH2sgff752HF4EYaUTx8zF6LgqPyaFaqzag5AWZDB4SfrLYQPUmuf
         4oYlURkjRylAqDHMqNrdhsrIi0KewgztNE16xfr1Zg5buLbRC3NAktk8g3ALwD4tM3Gx
         TAG5OK+R24kQO7NyIlLckYTksulz4s5AOnvj1sfY6eBKVSSg8pc6EuwHRdI063vpvcQF
         MhNcO1fy5tbGvSa59QUQUTt16h2rrmfaEi9buIjOMBWdWzy8DqI82EHkTwTcXdNCaDd8
         Nkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9AfkjUnVxeNqVoeugHaThJw3JxIMcLbLETWwcQCrwo=;
        b=NSJ+qW49h1v+pYt62alJk+Oe3zhv7VInwyQ+JLqaBm8g2AyAtU2CAM1FA0+b8cdIf5
         8QrV6iCsr4FpcwWhGiF0YcxPAuT/lcXT+dBTAONHoFk0cNlf5H3nCbbrV0r/lpIqLFNZ
         KNJnh+WNqZzh0PEa79CCU57DJSLhk4Ga+mb15ZI/jBnz9brRMYgoI98eQ8RLK+/CloSf
         6SiBD2z2yWASnBLZgUSK7EPNblFVI7SJulHb1sPhY1YPdw2YJeFnGtEKfGuCj9lr4xlK
         XYE1wsNdYb/d8WgcKTyHPKJRqdDuEVNmcdYt7EbQZr/khEOGhUgcgCpsunQgydUvJ6vu
         5PvA==
X-Gm-Message-State: AOAM533dlZbEJgw1l1DR58jsnTi7Ptj8CpBkDjepzpISMePI2D2JSRAT
        oRtGwgeUSmZlWClJKg2tChb6oA4Nwi/jjA==
X-Google-Smtp-Source: ABdhPJxnu2jQcw+ml6eE/KcH+1bU8DFNLu79Bwrp4AzHLmJ5vcxWxckA1/+agRl0fLlblfNbkuuHFA==
X-Received: by 2002:a05:6000:2aa:: with SMTP id l10mr7709525wry.191.1643924031477;
        Thu, 03 Feb 2022 13:33:51 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id t4sm21283223wro.71.2022.02.03.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:33:51 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, paul.kocialkowski@bootlin.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH RESEND] media: i2c: Fix pixel array positions in ov8865
Date:   Thu,  3 Feb 2022 21:33:44 +0000
Message-Id: <20220203213344.863433-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865's datasheet gives the pixel array as 3296x2528, and the
active portion as the centre 3264x2448. This makes for a top offset
of 40 and a left offset of 16, not 32 and 80.

Fixes: acd25e220921 ("media: i2c: Add .get_selection() support to ov8865")

Reported-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Apologies; sent to the wrong list initially

 drivers/media/i2c/ov8865.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index d9d016cfa9ac..53e21ae8e886 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -457,8 +457,8 @@
 
 #define OV8865_NATIVE_WIDTH			3296
 #define OV8865_NATIVE_HEIGHT			2528
-#define OV8865_ACTIVE_START_TOP			32
-#define OV8865_ACTIVE_START_LEFT		80
+#define OV8865_ACTIVE_START_TOP			40
+#define OV8865_ACTIVE_START_LEFT		16
 #define OV8865_ACTIVE_WIDTH			3264
 #define OV8865_ACTIVE_HEIGHT			2448
 
-- 
2.25.1

