Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF7351B1E0
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379029AbiEDWej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379016AbiEDWec (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:32 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69A22B1A9
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b19so3785968wrh.11
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2eDW0BkW1kWUmwBj+d757dRPQwwJ5Jr+wGnJbIglmFg=;
        b=InoEXzoXVvu7ohM2j2+wJT8HuS+AQnwtelUDMJXdtwPo4rsaT2HwDPEpIPsA98xvgN
         YG183eMB3JGFl25kN+yj652N3M1SEMgKkRX6LkZkjf9kAW0mZuEfKuGeg+VDLUS/0/cA
         a+4YcQc26Dw0cj5SgjBLZmNLVp2GnYJK9dEIJHJv79azvMCj4/9ajsjokB4YY6iwbCsC
         45H8g1mS/9m2KPcfm9D8DswxmkR5AcVSMYyaPOJu26h01t6+yfRcVLIxGtVx3BmK0nf4
         HTywfu76dU5xTP0lu/q9xGXkQ4/SOsvHjGKcYX5AhUop+2+WG2o1S1w3EPQ9VcTTXGrV
         kAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2eDW0BkW1kWUmwBj+d757dRPQwwJ5Jr+wGnJbIglmFg=;
        b=EQxUbRSp1X/dfvtr4Po2+e1jWDd08hirruXNyn9hOMjiw2eWkhsg9Yj9Ql19oAl5B6
         5RwGwyunovTvTM9f1F/ezebNC2oV3XAlrj9EEflt4XScQypNZ/YgiWpbNelQ+UfzfBWU
         wIkxPSyXOgD6COQ/7jcUFTjMCqyFqauKaAro545vr7agWueuF6eL3mWu5NhAH4luFX/4
         oTm6gQYIZi9PnT8gUma28OyocqZe4uaetJBiRpgTx+OyEq14OyG219DZ8fifUNHSXhBn
         8w1bc3Z2qfqqrzD8zsXuLnf/NqHHyz+Q76Jn+5sZLmka/3bG+7Qjn7xvXpKtU/fN/WxF
         3blw==
X-Gm-Message-State: AOAM530Gpk6iDgOncPFgr+EZ5de0swgxHFp0KhDIqV4THb/baEyk4i5d
        na7GeOP0P07o8u/FgZ+nSh1m74TWzKk=
X-Google-Smtp-Source: ABdhPJx1e1vcc9pEHZm7rmVpoiyyVBt83QaVuvecgsh1f2nsh/1B+RBf5ZBvWFp8x1Y9K/2buQG9HA==
X-Received: by 2002:a5d:60c3:0:b0:20c:4fa3:c63e with SMTP id x3-20020a5d60c3000000b0020c4fa3c63emr18371944wrt.191.1651703453398;
        Wed, 04 May 2022 15:30:53 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:53 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 14/15] media: i2c: Add hblank control to ov7251
Date:   Wed,  4 May 2022 23:30:26 +0100
Message-Id: <20220504223027.3480287-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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

Add a hblank control to the ov7251 driver. This necessitates setting
a default mode, for which I am simply picking the first available.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index b7d89ad49887..003a7a5ae038 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -61,6 +61,8 @@
 #define OV7251_ACTIVE_WIDTH		648
 #define OV7251_ACTIVE_HEIGHT		488
 
+#define OV7251_FIXED_PPL		928
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -139,6 +141,7 @@ struct ov7251 {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *hblank;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -1490,6 +1493,7 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	s64 pixel_rate;
+	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
 	ov7251->ctrls.lock = &ov7251->lock;
@@ -1524,6 +1528,13 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ov7251->pixel_clock)
 		ov7251->pixel_clock->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	hblank = OV7251_FIXED_PPL - ov7251->current_mode->width;
+	ov7251->hblank = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (ov7251->hblank)
+		ov7251->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
@@ -1619,6 +1630,7 @@ static int ov7251_probe(struct i2c_client *client)
 
 	mutex_init(&ov7251->lock);
 
+	ov7251->current_mode = &ov7251_mode_info_data[0];
 	ret = ov7251_init_ctrls(ov7251);
 	if (ret) {
 		dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
-- 
2.25.1

