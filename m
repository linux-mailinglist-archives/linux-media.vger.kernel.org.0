Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39724CB23B
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiCBWZi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiCBWZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:25:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52FCE61C7
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:24:53 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u10so3343306wra.9
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1Y50ekv2D/K3q84NuQjnufHy33ED2K6ErC29O+v/bo=;
        b=i8VvYzVMsyAnI/yYH+WKHQaZIhVgqL/PecJYYev9Q2q0qw0ZvHR4aANJuEB/NmAlvA
         INlqd/jv4FcER8PADK3J3Ac/jnI0u469jsaThGQcT2q24O+3Mrb0b+KBPpAGESmLYKGV
         WUWmK4Xc0hwZ0SkOjl0h+NSwSu4BLruWpOTPVMyBC8orG6xACGui30UVoPeulUHNqyVh
         dpQLh0j0NlCDvb25e1G1dTrijK7/NZqb2juL0EO/fUnhPgurjE80q+EmJN3S8UWVOngh
         zF4r3NnawBSBgod3iA5C/eLX+jME78ZOBh5xNuJYNG9fJFm4nIn9TKJTcapg2mhyizI/
         bOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z1Y50ekv2D/K3q84NuQjnufHy33ED2K6ErC29O+v/bo=;
        b=nNifw+tYvMQVCqBUkkLLgKy5zWPindojsy/jTZNfYqo7gQBWhFidnDCiQwuUjSxJGS
         3FNseSHnKPztE7hDxwmBypKfkE5a6XU8DRnDD1a/1r1fEebQLpGiOTQE7fGjnlqQQFkc
         gX02ecdISEzOzAcU19atOexivqI39SBVAiIqWr7A2zKVOHRAffNtehLcFlrGtNtlQY2K
         2hashdMBSb/nREEKR4eIohbc6jIinEb/OZEay8V13VksOzwQn1mJhq94jtKESTAG+fuC
         iLneJpYhFDKyg1lAKm0iUKaFdKpS1KSGjVeDN56Uy0yn/qZXcKLQCsI/OaTqX6vCVs/5
         TKig==
X-Gm-Message-State: AOAM533gAyqybwiwMuFpveA1OQV4nj39cDLgenCNqsWKSrVut2pDseDT
        xAODZB8RzBPjZUAuu4lYVs26tXpHQg66EA==
X-Google-Smtp-Source: ABdhPJyCYhOUmy8UikLN/jBNr8cg7Y3sSoL6sOEs74bhYP640ZrddclK2T9zjJqA4vAz5BSdASFwsQ==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id r11-20020a5d6c6b000000b001ea77eadde8mr24857926wrz.690.1646259892439;
        Wed, 02 Mar 2022 14:24:52 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b001ea75c5c218sm214526wrw.89.2022.03.02.14.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:24:52 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, paul.kocialkowski@bootlin.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com
Subject: [PATCH v2] media: i2c: Fix pixel array positions in ov8865
Date:   Wed,  2 Mar 2022 22:24:48 +0000
Message-Id: <20220302222448.1373765-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Changes in v2:

    - Swapped the ordering of the lines so the left offset is first (Paul)

 drivers/media/i2c/ov8865.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index cfc726e0ed1e..b8f4f0d3e33d 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -457,8 +457,8 @@
 
 #define OV8865_NATIVE_WIDTH			3296
 #define OV8865_NATIVE_HEIGHT			2528
-#define OV8865_ACTIVE_START_TOP			32
-#define OV8865_ACTIVE_START_LEFT		80
+#define OV8865_ACTIVE_START_LEFT		16
+#define OV8865_ACTIVE_START_TOP			40
 #define OV8865_ACTIVE_WIDTH			3264
 #define OV8865_ACTIVE_HEIGHT			2448
 
-- 
2.25.1

