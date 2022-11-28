Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E29263AD9C
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 17:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbiK1QX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 11:23:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbiK1QXI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 11:23:08 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B231F24BE0
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:07 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id w15so4507316wrl.9
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=749XWNr6EDOp8iDC5ndqhi3eCGvYPunM7bPdHtc3/hU=;
        b=j3nbDv0oaOu0nVyXHNwU2cKcw+aKBEVxavDRHfoXAIXM22ynze4kgey+RQTq9mluiT
         i2oZOCgWEBkT5duT9VBXkN5HoV+fjZhsJFtM17vTMUDM+0REuiNbysMJLWAmy/bU/7Cm
         JY+zD1IrLvoUDbkIu8i7XB2ZTRw0CDu/vW7u80lIRo82unOt9B9tk1YhCmZxaQ567Igm
         NPVJ6OlpaElj3Ir0eKYEPsz09RUyUZdL9TBTYMnOyheS+cFJMfzmxa8cL29a+nJjzt3c
         7sW7Ow6RA3dSKZfzgmtfRlzkO2VFbBjYGV3wYA3sIS0OwA/9nRLLbkhtAcllp5Pl+FDR
         5T1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=749XWNr6EDOp8iDC5ndqhi3eCGvYPunM7bPdHtc3/hU=;
        b=cMUrANtNiNNJAsutl5o9xcJCiXyUCFnDUuDg6+gADGiOmtDvxZNrDt0+o3sxjBQYA1
         YVxflF0aizTLiBylVVa6oS/ifj3+hEmLq3yrLsAaUMOlFWf/6bn9eqclJvxFd6QG8DMj
         FzdZYWLkiWFQ/0Cn1tnHQKlHaZ+JpqjZuZNFEdlu0k/6Ud2ksFM+9u0kYBgMUIKsEqS7
         G2xg8qn5R1ABWFoFKCqYnHCTAFAfdu/jRBl2xgjjdp8kN6H+WAX0ErTTYMgJAiD+Q7V4
         OjwuqHzQLCsfdFQrBT7YE+sTIJRs8d0xFuO7W+X37tp4rrMtAArTBqEnIfGADuwZOGcR
         +EbA==
X-Gm-Message-State: ANoB5pmbtcjGl1EMQpiJ7gjRo2wO3QttQCGbEe1canrk8EV2nxeuXfSn
        0MZQEyT1AWh1EOg8euPUAUk6IA==
X-Google-Smtp-Source: AA0mqf6C/cYQwkOTHhd7pGLOj9Ezzh+nLgzjIuAlomI2/vDtwtmwJYb3xkZAqNQeD1tNoYfpmmckHg==
X-Received: by 2002:a05:6000:12cb:b0:236:62e3:6202 with SMTP id l11-20020a05600012cb00b0023662e36202mr31893963wrx.47.1669652586278;
        Mon, 28 Nov 2022 08:23:06 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id o15-20020a5d474f000000b002421a8f4fa6sm2353530wrs.92.2022.11.28.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:23:05 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/3] media: i2c: ov9282: Make common_regs_list static
Date:   Mon, 28 Nov 2022 16:22:48 +0000
Message-Id: <20221128162249.536455-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128162249.536455-1-dave.stevenson@raspberrypi.com>
References: <20221128162249.536455-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

common_regs_list is only used within this file, so should
be static. Make it so.

Fixes: 7195aabf8f8b ("media: i2c: ov9282: Split registers into common and mode specific")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a8ab523b6a40..94e18da55a05 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -268,7 +268,7 @@ static const struct ov9282_reg common_regs[] = {
 	{0x5a08, 0x84},
 };
 
-struct ov9282_reg_list common_regs_list = {
+static struct ov9282_reg_list common_regs_list = {
 	.num_of_regs = ARRAY_SIZE(common_regs),
 	.regs = common_regs,
 };
-- 
2.34.1

