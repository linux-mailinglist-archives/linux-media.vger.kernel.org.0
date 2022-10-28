Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16021611735
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiJ1QPJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiJ1QOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:35 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F3D22D5AE
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:40 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v1so7189724wrt.11
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeWWFLsBMicTh8QbfZGIQ4Lyp/QBEmA1qJ8tNk4fA4w=;
        b=l1w8Xz3nH73G79xP1RB7Zipo8S2iWY2GlxvqDwHuJdKDda5K7YljbB8xCMZYL6/vA8
         zBoPUiqjXcqeDYByGsHJ3xqtBYfyRXpx7FW8b1jsthqnJtU1vhYRbGi3yltgeUCkENVQ
         SKoeKaOYOGvigLWaU8eNs+vCjy1SPkbMKPk9vUa7CbVx8p4Xs+XjOVJVdiXsJOXnZgx0
         agcUoqP0kVfSz6SHIW7ktXcKpC//7eCdwgBDCYLU8Buh+VHdFr40zEXtqHMBHXSv0GyA
         vNdCBaNsTp7N9JODGAKWVcLCzAp2S/QiyXQgAJD5qYuApTzRcUvnIRpvzQAROX3m3aF7
         ptow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeWWFLsBMicTh8QbfZGIQ4Lyp/QBEmA1qJ8tNk4fA4w=;
        b=gxBwJ8putRce4PWZyFyy4wrig6EN4tGejfGQttldV09HCwNlCeQUbQ4HKMDgxr/1H2
         CJu+ba7IfylSkQ6pOVWl4EGz+O4Osq3lHedPvG7sbjhGheIWAAGnGWvq4rOvpEnicclo
         79i4rYNIATuqWhhG1JJyxjpVqyAsHUScmjMW025Se6s3SJggareDQi7v1yH5PJTWH49J
         eEZa2vzRS7xlUpSQYCw/ei9zVxjoL3Ea9++9EoFZjS8qCzSXmdauYuPSPS2CVd/eVY/f
         4tFkMsaSt4qckWxlUbthOaYEdSc9yutf1mpV2L06x6i1B5JZooTulM1VkbNbCJyH039u
         O6IA==
X-Gm-Message-State: ACrzQf1aBowcosjmJWH7opn6E4pD7xfg/suEevtp7bVmCDNqbJNNj8Wl
        eKNBrozsoCp3VBhAewTE8JKmIw==
X-Google-Smtp-Source: AMsMyM5Y1j6d+FnPqZtaM+34P8eUYSvh6Gns/eWEqhPw6Ks557qCsOyjI7SKmtIzgcw8/J3nX80f2w==
X-Received: by 2002:a05:6000:1b90:b0:236:9701:7ce5 with SMTP id r16-20020a0560001b9000b0023697017ce5mr52229wru.631.1666973558926;
        Fri, 28 Oct 2022 09:12:38 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:38 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 01/16] media: i2c: ov9282: Remove duplication of registers
Date:   Fri, 28 Oct 2022 17:08:47 +0100
Message-Id: <20221028160902.2696973-2-dave.stevenson@raspberrypi.com>
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

TIMING_VTS (registers 0x380e/f), EXPOSURE (registers
0x3500/1/2), and GAIN (0x3509) are all set from
ov9282_update_exp_gain as part of the control handler,
therefore they do not need to be in the main list of
registers.

Remove them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index df144a2f6eda..0c604050b4e5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -163,14 +163,10 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3030, 0x10},
 	{0x3039, 0x32},
 	{0x303a, 0x00},
-	{0x3500, 0x00},
-	{0x3501, 0x5f},
-	{0x3502, 0x1e},
 	{0x3503, 0x08},
 	{0x3505, 0x8c},
 	{0x3507, 0x03},
 	{0x3508, 0x00},
-	{0x3509, 0x10},
 	{0x3610, 0x80},
 	{0x3611, 0xa0},
 	{0x3620, 0x6e},
@@ -204,8 +200,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x380b, 0xd0},
 	{0x380c, 0x05},
 	{0x380d, 0xfa},
-	{0x380e, 0x06},
-	{0x380f, 0xce},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
-- 
2.34.1

