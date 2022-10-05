Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C0F5F5770
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbiJEP2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJEP2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:49 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD0E21818
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:48 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so1064224wmb.3
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5F9oOTt1h7E4ugwjY0SVsurm2rLl+26D5GFYpF/eY4k=;
        b=KB4A72mxoRK3U+lYiEihWXQFWqQcjzjyX1SUX4ZdLH6d0YF8IYBxQPcIetUeiBLYxD
         5U1lgrO9U5JeiZaLK8iTNjXB8Us5ITgtCm399NqGonAoMpRPB+7WApksDQlDGpHR+OaV
         ZxhUHig+xDIgV+uF3dmzjU4QZr1X2zJCa7q+/WlV/mZDHS4Ef18BHVMOQ4HkuvBO9I/8
         1NC4blKEdCTUcB2dTb0yVNuANSFxr70lH96zw4WuKohPHuNoOreLCyqhMF1ZL2dPLupf
         ZlsskCL40r+e9DyJEbLw4TJtSaCG6T6C6ZnlDa3juCGggLDtCh9YaTXIykmnwjcqFLo9
         NPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5F9oOTt1h7E4ugwjY0SVsurm2rLl+26D5GFYpF/eY4k=;
        b=KMzC71KtHlBQbvGKMA32pkPkpxJeITzykWLZowffbDJRaEkg2xcIa0zZRIDJEC1EdL
         0yMG2Kl5HGflguuqmhQqMVysAJ7MTynYBdmNDr84sWiDbtoAzhYCmY7tmfgqyWreqDeW
         aW7dNlZv46sGDUea0Sro0eW5iTDFN2Fd8aK5yNLSQSEeprUSsHaKIBklhBgd4AOPKa4F
         Y95nl2NSWeeKckDapw72AsiZGiE5qMh5dTnaIvYsVDUkYcrwR73J/3Kgke8JkBTcdi4I
         UsejNLhUanggzVuWilv3GVd8wfd4RCUecFHyp4YDAq77PD31sNGbdNUUVE1ocFjPUy1b
         f3Cw==
X-Gm-Message-State: ACrzQf2M+qMrefzkXoFtUumdlRH1bJ5aCZSTFC4po0WiEyezjQdBheZG
        EPXkUjwq1+bezeaZrx21Pibrmn+LcP763g==
X-Google-Smtp-Source: AMsMyM7V7JE0fmkHdDNrKIXj9DR6+AlnFN6R3wFRVvLsrGpSLqD5e4uQKs9hG5UzKzeYQSKEcdXJLA==
X-Received: by 2002:a7b:ca46:0:b0:3b4:7ff1:4fcc with SMTP id m6-20020a7bca46000000b003b47ff14fccmr3844755wml.47.1664983726671;
        Wed, 05 Oct 2022 08:28:46 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:46 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 01/16] media: i2c: ov9282: Remove duplication of registers
Date:   Wed,  5 Oct 2022 16:27:54 +0100
Message-Id: <20221005152809.3785786-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
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
---
 drivers/media/i2c/ov9282.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 699fc5b753b4..2c13bcd59c2a 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -173,14 +173,10 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
@@ -214,8 +210,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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

