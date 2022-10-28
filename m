Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D72611736
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbiJ1QPL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiJ1QOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:37 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA5214087
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:51 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id g12so7186493wrs.10
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY1mvkyRsT1CB7pwPxBqZXjc4qqLIAEDNuwW2y9MnVM=;
        b=aIpTtm3oYzBiEOn12tG6S83ibK5bpICo/U1mTVg1CVrbi6lmPHJKGl77UzTJz/7kry
         R11I8yQJ3HU4suJlUVv6seX7I6WCM4zgZP0B6Mpe1oQoHHps62jhU7ZVY/m+GJKKkG+S
         w9160P7itn4Au3FbH2cJbiOJVjfyVkF7PqJqtaAl5uAidgiCb5Z4M8oftTcJwsZhdrpS
         jkX0TfKz59xYOksHc8kZr0yH6BtmJ2Q8NjPQ1R165IfJB+akKaZQubozDyrs+7Yff9Fb
         hOSMpR30/TjgFgvXNoZFFTF8pbjiB5e0WUIpMDXSEUs/+Mn3/A96Io+Md6sHC8eXubvU
         shag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MY1mvkyRsT1CB7pwPxBqZXjc4qqLIAEDNuwW2y9MnVM=;
        b=e0Mf84TFYT2ZlKEtPMpW85TLu6AFhL8Vp39PDSHSy5DzAVQYO5wkygMuIePtJx7YAA
         rIKwLTCnVIyMlBi2Xx2R8zvcHzM0wjKPaj/a9EQqYAlGxAmlZqIEQP4Ao387sXP9d2vD
         1Bdur3nv6VUZTxs59UsxjRT6AwcfrAfepCJr/fAs9aMqnhI8YeveaFoZQyQPDypPCbO6
         p3p2YskfpRPZyBGOC/XtB/scpwiQdrhVDwqAks3keQr0+6/zN1P7iUVyHLNeDBeTrbBP
         mSEEvUgp/QWS21LASJu1Qx0cB8/C55JGeg6SpOr4Zfn3OEv6i35MH8AZVXcShYcFBIZm
         l9GQ==
X-Gm-Message-State: ACrzQf2ZKOg+YSv+lw5fiN1JnQ6DrgHtwMehOAcHCjP6JIDTRcd+942S
        b12TOmLUj/7VGqmVWXqdQYFVPQ==
X-Google-Smtp-Source: AMsMyM70ofvlmyZu0QVvbCN/pBkR3tl1lYCloAapkrVFcPQzDSqwDMmSfsZfxyaPiGe5ZgwA1qbatw==
X-Received: by 2002:adf:ffc2:0:b0:236:61e8:de52 with SMTP id x2-20020adfffc2000000b0023661e8de52mr72435wrs.59.1666973570102;
        Fri, 28 Oct 2022 09:12:50 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:49 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 06/16] media: i2c: ov9282: Correct HTS register for configured pixel rate
Date:   Fri, 28 Oct 2022 17:08:52 +0100
Message-Id: <20221028160902.2696973-7-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
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

The calculations from pixel rate, width+hblank, and height+vblank
do not give the correct framerate - it's half the speed it should
be.

The datasheet lists the default for the TIMING_HTS registers (0x380c/d)
as being 0x2d8 (728) which is less than the width of the image, so
the units clearly can't be pixels.
If TIMING_HTS is considered to be units of 2-pixels, then the
resulting value of 0x5b0 (1456) makes all the calculations correct.

This driver is reporting an HBLANK value of 250, with an image width
of 1280, so TIMING_HTS is 1530 (0x5fa) pixels. However it was also
setting the register to 0x5fa, thereby not taking into account it
being units of 2-pixels.

Correct the register value to 0x2fd so that all the timing calculations
give the correct results.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 1524189cf3e5..7e0b12b89655 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -236,8 +236,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3809, 0x00},
 	{0x380a, 0x02},
 	{0x380b, 0xd0},
-	{0x380c, 0x05},
-	{0x380d, 0xfa},
+	{0x380c, 0x02},
+	{0x380d, 0xfd},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
-- 
2.34.1

