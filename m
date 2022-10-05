Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700205F5773
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiJEP2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiJEP2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:53 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3074057899
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:51 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u10so26366396wrq.2
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y3WPiNu5a72VVLHY7+nk24MwdU+a1fkv2slymEUonvs=;
        b=DXPMptmXpBWr0T81d2qzoVjWfLmgIAFeiVvzM8QWu7GBXBPLCz5Z/hx1/oujyHssbc
         9GCSR4Ne0EvkqNWBwUJWskkC5kaMk7EqZtjkS5vqrHJ6bmqYrl5FNBQX/h3nu/TLiTgF
         jMKsTBZWhN9UuRbd3lmrlwUwSBBwDGOr6PUTcnGibSEMvMiehfIJ5Pdi0LsNiZAJmaN7
         RaE87Ek6+DwIHlbA+Y/F4o6haE9cIFCkXDJw0i5NgXryhGtkGWZqH9eKho8IG6J2cEAk
         9fdifi4rYc96gsFKR+kHhbfSu7apUYp5JZI+wgC1XzeO9ZOupHlgEn//7SbCQqWGPE7E
         KGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y3WPiNu5a72VVLHY7+nk24MwdU+a1fkv2slymEUonvs=;
        b=raCb7Es3FCJEg9soQU0RMmIEboA5LEoNkMCiqQkZtCt9Ud4ACMjbGx9RobzQIlnyEA
         Y1h+DF/NHR13SNreMucvjZhKln8H7M6/5cWmMdK80utg07RVV+oOd+ikaIBvkz7hB7A3
         fvcRniufYpHw5isw5oa3l7agMtZo8MSmBGXmTqhStzSOwHIb78qnDgRp4TGVJl0TyxT6
         5Vsi3KrCZFYshPwaTfPvqSoLxFlWGQEbLckoWb/qkW09S+AiCZsOK97HnOcrr/s1D1GM
         vNOpX0ScIEa/P5qCdfA2nVvejday+xPdUMxF9uGiJ3C521vNkXFdzszWmAOf6NJ3XHag
         BK9g==
X-Gm-Message-State: ACrzQf15Pw0oDSQ3sRZraO/2MXTJUV9/jrTynxA+rPgNBv9g4SlTVg8l
        RRdYnpSZI6DOmR0G4O6S2zpqN2O8YFdbkw==
X-Google-Smtp-Source: AMsMyM7owYbO/RjyLRLlfG4LVO395pk7axHDBWaN4CpThSj0uFk+OXhfgqGuRy5mReqnE7nkqBZ7VQ==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr207089wrt.514.1664983729727;
        Wed, 05 Oct 2022 08:28:49 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:48 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 04/16] media: i2c: ov9282: Remove pixel rate from mode definition
Date:   Wed,  5 Oct 2022 16:27:57 +0100
Message-Id: <20221005152809.3785786-5-dave.stevenson@raspberrypi.com>
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

The pixel rate is determined by the PLL setup in the common
registers, not by the mode specific registers, therefore
remove it from the mode definition and define it for all modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 1c77b77427f0..798ff8ba50bd 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -53,6 +53,10 @@
 #define OV9282_LINK_FREQ	400000000
 #define OV9282_NUM_DATA_LANES	2
 
+/* Pixel rate */
+#define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
+				 OV9282_NUM_DATA_LANES / 10)
+
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
@@ -92,7 +96,6 @@ struct ov9282_reg_list {
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
- * @pclk: Sensor pixel clock
  * @link_freq_idx: Link frequency index
  * @reg_list: Register list for sensor mode
  */
@@ -103,7 +106,6 @@ struct ov9282_mode {
 	u32 vblank;
 	u32 vblank_min;
 	u32 vblank_max;
-	u64 pclk;
 	u32 link_freq_idx;
 	struct ov9282_reg_list reg_list;
 };
@@ -118,7 +120,6 @@ struct ov9282_mode {
  * @inclk: Sensor input clock
  * @ctrl_handler: V4L2 control handler
  * @link_freq_ctrl: Pointer to link frequency control
- * @pclk_ctrl: Pointer to pixel clock control
  * @hblank_ctrl: Pointer to horizontal blanking control
  * @vblank_ctrl: Pointer to vertical blanking control
  * @exp_ctrl: Pointer to exposure control
@@ -138,7 +139,6 @@ struct ov9282 {
 	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
-	struct v4l2_ctrl *pclk_ctrl;
 	struct v4l2_ctrl *hblank_ctrl;
 	struct v4l2_ctrl *vblank_ctrl;
 	struct {
@@ -269,7 +269,6 @@ static const struct ov9282_mode supported_mode = {
 	.vblank = 1022,
 	.vblank_min = 151,
 	.vblank_max = 51540,
-	.pclk = 160000000,
 	.link_freq_idx = 0,
 	.reg_list = {
 		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -1006,11 +1005,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						1, mode->vblank);
 
 	/* Read only controls */
-	ov9282->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-					      &ov9282_ctrl_ops,
-					      V4L2_CID_PIXEL_RATE,
-					      mode->pclk, mode->pclk,
-					      1, mode->pclk);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
+			  OV9282_PIXEL_RATE);
 
 	ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 							&ov9282_ctrl_ops,
-- 
2.34.1

