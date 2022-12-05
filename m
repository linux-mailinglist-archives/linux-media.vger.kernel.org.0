Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582D4642B94
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbiLEPZ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiLEPZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:25:00 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7101A20BFF
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:14 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id y16so19125284wrm.2
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jW/wraYzdeVh5VN6Plj6mY5qgvxc6yfVXPI0v0RffG8=;
        b=pxT3QuEFaoyxydtMf1y6iaI+cyLUMfjibZVa4ik2l2fDGq2tqQoiCt68EvrEWGEhYF
         lZVF+cyG9lY1L9z03QG1IK86BXAbmiGC69f8R9scCn69iK9v5fvD34dQUR7xyA2qxUfa
         2yM1KBLo62rbmk4boVkcgSqLe3K/eKCdBeWuBE9crJETOvlfUu57x2qYc9P0C0jzHvWw
         Cx2xyiWsbTz0659TI7l8rAntnJUmElLobmFZ2H0m+mJHFNerXLTC1U7+XbKW1SaQTIDV
         Jw25hMCKjjOuIQvqpa+gqF6cdb+jQZbVJBPGTuB2XPR17BfGda1zVD6k6SfpL6WMqNx/
         WEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW/wraYzdeVh5VN6Plj6mY5qgvxc6yfVXPI0v0RffG8=;
        b=CiUvFJWsybZ3zfe7FbW4hILZs0V5/x8NWljGSpyBHwPO01NmhmJG43w7KS4WPcubB5
         JDrtouketFCG1wdVZub4gg3kC7/vW4pqgUMeKPUQShragpljgk22GAsSqSCKgidwGPOw
         1H2KU3jJu47jk9mdRGjpT+mHLXsaYbfTD44Sv4vB6SKxEM1yeVZVy/yT9tjoMpbMUrUa
         pP770qV+205oijssHG1knx5Kidknw+yq3CyLGDORlHT8RBvLgyIqyRbXukoRouU3pKav
         vydDyQI5sbJWuE8U36g+a80RfFN8FqdIycp+XjwqvlDQ4tUj7wJTUx5aLK1UP4cLhOLB
         t5Cw==
X-Gm-Message-State: ANoB5pnPMJ8xnkx8BfU8hYyg0p0IYUGLeqcq0lwx97FwPfSabFD+MLvP
        zpefS5g5KvUklbUeDJMdqBk8jA==
X-Google-Smtp-Source: AA0mqf6U348ZFOAy8ENh041iW1hN7Fiobz6Mc+oenTnGyPpiQbIzcgFolNufEWQZRRH3iR57U/IyQw==
X-Received: by 2002:adf:de08:0:b0:242:1d2c:9d78 with SMTP id b8-20020adfde08000000b002421d2c9d78mr20515260wrm.490.1670253732168;
        Mon, 05 Dec 2022 07:22:12 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:11 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 3/5] media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Mon,  5 Dec 2022 15:21:47 +0000
Message-Id: <20221205152149.1364185-4-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/imx319.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 245a18fb40ad..45b1b61b2880 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2328,8 +2328,12 @@ static int imx319_init_controls(struct imx319 *imx319)
 
 	imx319->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx319->hflip)
+		imx319->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx319->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx319->vflip)
+		imx319->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX319_ANA_GAIN_MIN, IMX319_ANA_GAIN_MAX,
-- 
2.34.1

