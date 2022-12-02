Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A943640966
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiLBP2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbiLBP2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:28:08 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70801903E
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:28:03 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id w15so8285656wrl.9
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q307OwUmjrBOARnf+xhbF57KM6ddL1J7Y5GnrvOnQZ8=;
        b=iDicF9dIoGYNac8k9mSQDVSg5NVtk1RItkLZTgx3UOrn1oYND6GvvQqxVMWF9Ob0+5
         AynkKLLm2Zwj/pM40vcwkjpCHCJ6K8e+v5IyOx1ZMa5hrh2IcfJ3Ribd5qq0qQSbAKYk
         nt3Ol7N0F42S5ZIZUtbWtB63Iw+9B47e54amLCXVEKc5aN/H6e82wN+PLB/2oEY4TY6r
         WWsGrC9Zm+B3SDrxKYs78pjoeCigbhRpeMlDgz2/ixWVBq3fV2VpIeDYDVyUdYK6lLIQ
         PaLvRUqncC+Hh5NvMP5sWedoaUKn6mHcy41moeUGhp3OwZ9mbjKEiBftZ6zc3ltur/Bj
         Q+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q307OwUmjrBOARnf+xhbF57KM6ddL1J7Y5GnrvOnQZ8=;
        b=aI7ARa1ccHYzNAPaEIdndBsNskWeNve14dvPtHL8NdzQPBOli/efeG8clyAuqe6K2i
         QhKnF+CFQDzdDf1BVHNXgrZRU0qOn5q59r4MemdRC83w8C6X/ujbE/Zlz5H7UMMg4mcs
         g1leLMGzEpb0oOaoTqglysBmKFpr+6erJ3QpBKLIxoas6jAgfSA1rJVv7fNFoq6TBkvj
         g1jqo16ntnOJESLJAQgN07r1qoZcddTn49qAQ6t0N+gaHKHe+v8ldEmdseNgVAHlZnAP
         oRngimXYr/OpQaNbyf2ofchmmASolwYOft4H64xq7IRlVDbz6RtlddLVeUDvXuaHxAgl
         65PQ==
X-Gm-Message-State: ANoB5pkdTsfV13OVgSSwXa9wQukm882z1c1wHb94Cr9LmXqRu1qfWOW+
        DisPFcs3EJQpzdGwmpYYMJ3X8Q==
X-Google-Smtp-Source: AA0mqf56zlNI58TT97arpw2FMyAqGl+9zCZ7azoiUItRkp4FA4sWvek9njUxGhCS0pg97REYs7uAnw==
X-Received: by 2002:adf:e347:0:b0:236:76de:7280 with SMTP id n7-20020adfe347000000b0023676de7280mr45350558wrj.194.1669994882395;
        Fri, 02 Dec 2022 07:28:02 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id t17-20020a05600c41d100b003cf71b1f66csm8322773wmh.0.2022.12.02.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:28:02 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/5] media: i2c: imx208: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Fri,  2 Dec 2022 15:27:24 +0000
Message-Id: <20221202152727.1010207-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
References: <20221202152727.1010207-1-dave.stevenson@raspberrypi.com>
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

The driver changes the Bayer order based on the flips, but
does not define the control correctly with the
V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx208.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index a0e17bb9d4ca..64c70ebf9869 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -937,8 +937,12 @@ static int imx208_init_controls(struct imx208 *imx208)
 
 	imx208->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx208->hflip)
+		imx208->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx208->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx208->vflip)
+		imx208->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX208_ANA_GAIN_MIN, IMX208_ANA_GAIN_MAX,
-- 
2.34.1

