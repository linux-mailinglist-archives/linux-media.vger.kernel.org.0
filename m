Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF9F6933D9
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 21:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjBKUzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 15:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBKUzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 15:55:04 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4433917CEE
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:03 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id m14so8557547wrg.13
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LEk+3I8tLTaJcTzxXh+sG2f5X4KnT3+1I9n4yLUKP4=;
        b=gPGlAtlCLpkwbgu6KX1FGlif0Vt/MnM54jAg6H6AfBAZXt6RYJ2bwSt4tSozDEKkxY
         O8EXzcZ8d8IPHGRE0oIUy6a8kdP4UERUdLJFbufqnRN4s9vDDP4RbiUUfv+h+RAtbL2c
         OaOySUuS6doBgU+DD/X2UQM/d60DcldOEEhKGNPycZuOquInPLrx9wUIIhiHEBYEB90D
         eFZOxb01BA+AwB16PJmHXXVBWHp06bORVPHLUMe96u9WW3zaeiv0H/3+B6YRfNKFFH0x
         NHym08yyruMrAWW22MpkBApemliZJwIVmTT8iTVmUA0UfzI6xnLCe/kVc4k2kPKiKxs/
         v1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LEk+3I8tLTaJcTzxXh+sG2f5X4KnT3+1I9n4yLUKP4=;
        b=gysJ/Zyqjg5K4/L9HDD9Je5QR0qpeoGX0tddpp16g1okEmGoYr/f4JTcgWAGm8FGZV
         PS7ZD+Jo1TZz9Ds20s/TNSymABxqBjg0L9RIQZ7o1rDRQ7NrMmqIngWT3r4k5MmGbtVj
         fjJpoGZel6Rpzg5wdBDLT01mt4uLuzQQwey/9v96GhM0KbvIagjjMTkH/N9ubDik2Ey4
         LWzrR5wao/54hJ0b/10mpaVL7dy5k6LKVT+U30CXhKw+9lNidFDnE8hUxexLPkbXVtxE
         xc2FK24VWygqcxTa9ptIxmLaq4IXEXiEfaw/J4BLXmiWcLWwYkKE63wjMIv5TiFGMipU
         FZBQ==
X-Gm-Message-State: AO0yUKXmzc3lPPf9pE+SIMkEKmJW5VMQTFj6hbfXKzrci+K9sdyIur3N
        W135wuosVNAYApLH0yNmMxd2Omxp0yCymapus5o=
X-Google-Smtp-Source: AK7set/SPxJdaPEVT34o1esbXMidIX4ml1sMI487Iz13STGy1XB5OPtllzO6FfcXDTKL5YOhwRmbAA==
X-Received: by 2002:a5d:6601:0:b0:2bf:eec5:3912 with SMTP id n1-20020a5d6601000000b002bfeec53912mr15505005wru.34.1676148901842;
        Sat, 11 Feb 2023 12:55:01 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm5095531wrx.91.2023.02.11.12.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:55:01 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] media: rcar-vin: Fix NV12 size alignment
Date:   Sat, 11 Feb 2023 21:54:32 +0100
Message-Id: <20230211205432.493102-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When doing format validation for NV12 the width and height should be
aligned to 32 pixels.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index cc6b59e5621a..23598e22adc7 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1320,9 +1320,15 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		if (!vin->scaler)
 			return -EPIPE;
 	} else {
-		if (fmt.format.width != vin->format.width ||
-		    fmt.format.height != vin->format.height)
-			return -EPIPE;
+		if (vin->format.pixelformat == V4L2_PIX_FMT_NV12) {
+			if (ALIGN(fmt.format.width, 32) != vin->format.width ||
+			    ALIGN(fmt.format.height, 32) != vin->format.height)
+				return -EPIPE;
+		} else {
+			if (fmt.format.width != vin->format.width ||
+			    fmt.format.height != vin->format.height)
+				return -EPIPE;
+		}
 	}
 
 	if (fmt.format.code != vin->mbus_code)
-- 
2.39.1

