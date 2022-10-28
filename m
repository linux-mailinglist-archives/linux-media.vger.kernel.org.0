Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40CC61173D
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiJ1QPW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiJ1QOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688121403B
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:47 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so6915554wms.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr2TVk4TNRJvSE84hpR4ns23TzYz3TaLu+r26zV4uIQ=;
        b=qFHJ4x0w67xgjI2Kzr5cTswtW6bZjG2/u1R8tUHazfT7ceDay2MbyCNomPRjVqAWQs
         a8TwencStdtHP1hgPGIuNcUTuVnZJhMF672w0e41p7IjgHD6PReTzITcj8r2q/QW6G6g
         FgkcQThFL2wujqaPm6+ETEFQRlC0GLRE9Tky35sWTXFVuCiUsY8bYO1S0j9gLDTWeQSC
         +IzIaveAfBHyHYFkNmcOSe9S+GbK6aa9OtvjNmdKLX5z+/OI8ayi3iRTt7BZF/KUv/Pz
         9Ay5hnJJRJSkihsONNINgNstXu1J6jVoDu+/c67IpsS6DU9gp0pf4ULDK0+j8SEP5Ays
         tpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr2TVk4TNRJvSE84hpR4ns23TzYz3TaLu+r26zV4uIQ=;
        b=MFV/uFg0I8p/jWxiAfKdpY5+K64st6WagPCLrwk1GETp4xhLdGTCWwPFNaRlQIhIeE
         OF1EHPQySfJlcJNpTJFdpQaZzy6X05Wl3A5vM/RfzPF/vqCYgX85oTiC19COVGdCzd0L
         AKd9f33OoXYg8X6m6PCrXbtnZF3vaNxkwEds5Ak+R4EIooVzVBBlaCcCqPmKGI1sn6s0
         C62psX6v/HV+x7i3pcIS41VM0DJ1mupepOlsc2/nRUmhYvYv9zMPNdiHiLw1jb9HGUKl
         oC2dSOvs5n3Qylc8BVbODs3TjCyJXqIssRxvyTktcEjJKQSLkbjbD00+tqjFGSXp6jTR
         s/hg==
X-Gm-Message-State: ACrzQf1tlYSXW9LsnMwEU9tK2uZuN17a+zU/N8uO/fC0CdRVWbWwI+a7
        OUTeHKesVHEgZ8ZlChqC/msmIw==
X-Google-Smtp-Source: AMsMyM6fIwVzThA6MdhZ6vRLEc/EyOIFnMQjfO1KzKiGBdY4ZvBDswP0d/cFPx94hw0iziv1DowjcA==
X-Received: by 2002:a05:600c:4f0f:b0:3ca:31ba:d77c with SMTP id l15-20020a05600c4f0f00b003ca31bad77cmr10270618wmq.36.1666973566018;
        Fri, 28 Oct 2022 09:12:46 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:45 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 04/16] media: i2c: ov9282: Remove pixel rate from mode definition
Date:   Fri, 28 Oct 2022 17:08:50 +0100
Message-Id: <20221028160902.2696973-5-dave.stevenson@raspberrypi.com>
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

The pixel rate is determined by the PLL setup in the common
registers, not by the mode specific registers, therefore
remove it from the mode definition and define it for all modes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index ead3a4f22ef8..123aa20951b7 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -52,6 +52,10 @@
 #define OV9282_LINK_FREQ	400000000
 #define OV9282_NUM_DATA_LANES	2
 
+/* Pixel rate */
+#define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
+				 OV9282_NUM_DATA_LANES / 10)
+
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
@@ -83,7 +87,6 @@ struct ov9282_reg_list {
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
- * @pclk: Sensor pixel clock
  * @link_freq_idx: Link frequency index
  * @reg_list: Register list for sensor mode
  */
@@ -94,7 +97,6 @@ struct ov9282_mode {
 	u32 vblank;
 	u32 vblank_min;
 	u32 vblank_max;
-	u64 pclk;
 	u32 link_freq_idx;
 	struct ov9282_reg_list reg_list;
 };
@@ -109,7 +111,6 @@ struct ov9282_mode {
  * @inclk: Sensor input clock
  * @ctrl_handler: V4L2 control handler
  * @link_freq_ctrl: Pointer to link frequency control
- * @pclk_ctrl: Pointer to pixel clock control
  * @hblank_ctrl: Pointer to horizontal blanking control
  * @vblank_ctrl: Pointer to vertical blanking control
  * @exp_ctrl: Pointer to exposure control
@@ -128,7 +129,6 @@ struct ov9282 {
 	struct clk *inclk;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
-	struct v4l2_ctrl *pclk_ctrl;
 	struct v4l2_ctrl *hblank_ctrl;
 	struct v4l2_ctrl *vblank_ctrl;
 	struct {
@@ -259,7 +259,6 @@ static const struct ov9282_mode supported_mode = {
 	.vblank = 1022,
 	.vblank_min = 151,
 	.vblank_max = 51540,
-	.pclk = 160000000,
 	.link_freq_idx = 0,
 	.reg_list = {
 		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
@@ -968,11 +967,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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

