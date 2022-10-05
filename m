Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201D95F5775
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiJEP25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbiJEP2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507205247F
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id n12so6902766wrp.10
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=9XLxy8qWLotes+30GGmVyXT6iU1B7jM466UQuPj2CMY=;
        b=cGk73AXwcKo8TtqNQzrtLwjkdEe+B4xu4EQQfsFqbR3XyYIJqjpOM0TDDVlHf2ZIxo
         Gge7xDEZP7tgW5AhaePMyqgFP+JOwCvEDTefMwgmIcDK9deKtoRQDV4yPlWvckxyo/pB
         K9TMl+UvrAu1AGEwWS2PAqkqq3O1p5YsaLu00b6D9aQNCheRXOCdAbr7Ol/M91l41bEK
         14Tecbq1sEf37S1L+EtzLpIN2YkCLgnpIZ12f60ukj2sYboJdesCjD7JIAtI0+trdYuT
         ygWLUvt0lgc+mBEepkh4G0A619Eta2Tj5BxnXnrx9pAFoTmeNV0EhT7kavXulJEdvfSX
         sh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9XLxy8qWLotes+30GGmVyXT6iU1B7jM466UQuPj2CMY=;
        b=rfHvaf50QZTdTzhsQ8ypHRfBpryM0Geyw/fB+DRd4HiV+QVdxhDiIU1qSlHSDh0nNu
         kOBt/zChFjc8Fd/SSdM75GnJbxuG3gjs9xvn6m65O7znGDUHTNTky1yR6D9TBuDCjLAx
         z9SG4FBoM8s4VJpZkBmcJAadLJgj9fq/Af3+tG+rgkvfaUhYmlVfFiFpK0Lgj6PpxDkF
         AiEkjfsxsZgzpI4m5Lnqf5zjBFQRW3P2mfq+KwhYnnTSE04X/SlCxRd/GmL3/O91fnNK
         DYATALheSrAsmY/iQ1GzV92iWdCvzoZrbtoR5DIL62sPnhDxetXfBfmbEQW8dG5HEDJK
         Q7dg==
X-Gm-Message-State: ACrzQf2zqx6luPbI+Whzer6qlJeBzUgngaTywiProNsZZep+vAoVT+rf
        0/4nnJKLhjTCI/KbGtY3IFRzfKAiOyCn7A==
X-Google-Smtp-Source: AMsMyM4Rn1apvRkeXE7iUqiA/osVcSUWOI41jiD2hwl5+pDbZVu2oRMp/AwrBhSjx6Y14HLLUWAqbQ==
X-Received: by 2002:adf:efce:0:b0:22e:38b8:fe41 with SMTP id i14-20020adfefce000000b0022e38b8fe41mr178427wrp.391.1664983731620;
        Wed, 05 Oct 2022 08:28:51 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:50 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 06/16] media: i2c: ov9282: Correct HTS register for configured pixel rate
Date:   Wed,  5 Oct 2022 16:27:59 +0100
Message-Id: <20221005152809.3785786-7-dave.stevenson@raspberrypi.com>
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

The calculations from pixel rate, width+hblank, and height+vblank
do not give the correct framerate - it's half the speed it should
be.

Whilst not documented as such, the TIMING_HTS register (0x380c/d)
appears to be in units of 2 pixels.
The default is 0x2d8 (728) which can not be valid as-is when the
frame is 1280 active pixels wide. Doubling to 0x5b0 (1456) results
in the correct timings.

This driver isn't using the default frame width + hblank, so
use 0x02fd which is half of the width of 1280 and hblank of 250
which is reported to userspace. With this the frame rate calculations
work correctly.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index f7823d584522..1cd6cb4addfb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -242,8 +242,8 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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

