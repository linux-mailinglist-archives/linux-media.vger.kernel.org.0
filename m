Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694AA63AD9B
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 17:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbiK1QXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 11:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbiK1QXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 11:23:06 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29CBDD6
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:05 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso8751997wmp.5
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 08:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V87pvfKhrv5gIkXbg/DXD1PcrOJHnwhO9GAYmRp4+zA=;
        b=E/jhnUSzBKmINQ4pedMBsGRtiF5y0NrqpStQ8SZjFD2m1NlxkLbufPVhY24YmrgW0i
         ep1EiWXoq3W1GNfRybuc260Vak8elUkPMZE13xHWzlJ8DHfGTGnrcH6mThmR/MdnXLph
         RPsfxleNJ8kNBNDKm8ebhAX32L6ltGdVsTkw4povHSGtJLVt019jVyHykz82qtSV4XkH
         VmaLGgJ/Znj2wY64imH5Bjg8uADf5ayEYD7ltSScKzTdsgoNBFxD573piR7zgfCn99bG
         yDJNuswoxN2cIbce7P/jTY/LdXiLSrlL6MRDL4LaaM9dfVwcQeflvCi5g4Nl54EZ3Y4i
         YilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V87pvfKhrv5gIkXbg/DXD1PcrOJHnwhO9GAYmRp4+zA=;
        b=rVMk0e9YBgFeeZ7cf6sJZ8dkKbD6y4cE2dCof2ZWSjfsmEtVDsBtTbLu/tvYVFq0jB
         DJ8RyzysdFTW+H0f2dE8byhmNGici+0+R0tqZ09Qi8yZSLmmtsONzGKHEmgc/xW7h1Wj
         za80d2tByoPErn/ygG2fy0LWs/rcPOH9PUSUO2ycXUl+lSWQU+RCVGDY0Go6071XVuik
         9CUiGeTYrO0bgCng5ipYViP7w2NyHino2P+67ar1k3snobYtbFhzJf7Bu6Ga1QFivV9g
         6Q6OTuyi07D/DO83vg/raZdEe8w6iffJb3xQ0c7NW1TFv73fFmBVHh/oQxUsGeeIUZUN
         fW+A==
X-Gm-Message-State: ANoB5pnPJE2io4Ca/OtwmceEs6QbfmVcHcu+7+MRMeaOyIQOwcsCgDmY
        siDS+FanVf8oh0xfE/RMEekU1g==
X-Google-Smtp-Source: AA0mqf7KE+NjUPJMbYl0HWjIn+iUTPOmkOTdQynF+faqgZEzj03jcg4FUHKTimlyoMOG5qSylrSZRA==
X-Received: by 2002:a05:600c:2057:b0:3c4:5c4:1df1 with SMTP id p23-20020a05600c205700b003c405c41df1mr40145913wmg.103.1669652584344;
        Mon, 28 Nov 2022 08:23:04 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id o15-20020a5d474f000000b002421a8f4fa6sm2353530wrs.92.2022.11.28.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:23:03 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 1/3] media: i2c: ov9282: Fix missing documentation in structures
Date:   Mon, 28 Nov 2022 16:22:47 +0000
Message-Id: <20221128162249.536455-2-dave.stevenson@raspberrypi.com>
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

Fix missing documentation entries for members of structures,
as flagged by smatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 4ee93daa23c6..a8ab523b6a40 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -130,6 +130,7 @@ struct ov9282_reg_list {
  * @vblank_min: Minimum vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
  * @link_freq_idx: Link frequency index
+ * @crop: on-sensor cropping for this mode
  * @reg_list: Register list for sensor mode
  */
 struct ov9282_mode {
@@ -152,13 +153,16 @@ struct ov9282_mode {
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
  * @inclk: Sensor input clock
+ * @supplies: Regulator supplies for the sensor
  * @ctrl_handler: V4L2 control handler
  * @link_freq_ctrl: Pointer to link frequency control
  * @hblank_ctrl: Pointer to horizontal blanking control
  * @vblank_ctrl: Pointer to vertical blanking control
  * @exp_ctrl: Pointer to exposure control
  * @again_ctrl: Pointer to analog gain control
+ * @pixel_rate: Pointer to pixel rate control
  * @vblank: Vertical blanking in lines
+ * @noncontinuous_clock: Selection of CSI2 noncontinuous clock mode
  * @cur_mode: Pointer to current selected sensor mode
  * @code: Mbus code currently selected
  * @mutex: Mutex for serializing sensor controls
-- 
2.34.1

