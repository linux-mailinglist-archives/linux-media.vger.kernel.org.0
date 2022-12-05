Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 670ED642B93
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiLEPZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbiLEPY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:24:59 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72EB620F47
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:22:14 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d1so19067815wrs.12
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+jHFMZScyfUNZiOOh7s/dn912ZUyLRMHPvPbt4Ppd0=;
        b=op5dhnZz5wVG6btVFp7KctZ7K36AsBYcn2FpH+WBS8nDgeMTugq5BycqmRr36/7AGv
         Pz1VUq+PDWG/b+cibKAhN5xtAjduUHk/fByzapmXaGAugK03HGgZkvMrPGGkPcA6o4GF
         JTIxilb4lMIzFgwy7N0sNA+3ZTd4Vl9EMP80LjyWq2QcqqVWKqmyFWkJwqBz/hz6tgtW
         v19RpvRmuSzCa4nzyC1WD1c98Ed1x/g/QttNCgv0XDRKpHZ15FoUwKldwh1UgeZJCxmE
         /+sDHFfVSI6urbQSQcwZxjhCPsi3gcpsdkhExO7nH9+j5u73/uKDV9z3LwOk/AvmxkgX
         90jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+jHFMZScyfUNZiOOh7s/dn912ZUyLRMHPvPbt4Ppd0=;
        b=arj122dcJ/n+tFVuiqRkAvoCWYcpQr+Me8lEZQvduFRswIaW5RI36SJu1IineezMZ9
         VTifOJ20nrLwl0pC+pPqQGr+DMdM2zswYYVBom9XNcslOq+uhRy4iKL8FaQ8y/apI/pS
         BHMzzttg/WWb0h07M8WL3XZboc9v9lilQnI2TAWaK4tr6W8uwEE3w9eE+FSJAbr6oxtA
         I2oo+esXOWY+e9XC2BRXo8VAuBrIwLGovfbJwLZMyzNI5D79p4FrY1C7QB1nMhhjffof
         6wxJIel2aOoeoMfJeZb1CwKTMYs6TCZAyn9m9//4z8PlGUTBy6nzzGSwjfa0hBkVKqpU
         QFjw==
X-Gm-Message-State: ANoB5plejhJCNRL41I4dp3QKkztMJpDWFZElQ8RSCXWZUNVppOJQK1mP
        p3gLxoGDlZ65j0uk+loxpW/KAQ==
X-Google-Smtp-Source: AA0mqf7mngfRA8tqWuKE4iisQQvWROLKrf2EKzkzNtIUTOVlCbifO/S8VcOtOQJ6MuHiCo6e1xgxQg==
X-Received: by 2002:a5d:510b:0:b0:241:fe9d:fbf4 with SMTP id s11-20020a5d510b000000b00241fe9dfbf4mr32357487wrt.412.1670253732834;
        Mon, 05 Dec 2022 07:22:12 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id fc13-20020a05600c524d00b003d04e4ed873sm25144905wmb.22.2022.12.05.07.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:22:12 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Jimmy Su <jimmy.su@intel.com>, linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 4/5] media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Date:   Mon,  5 Dec 2022 15:21:48 +0000
Message-Id: <20221205152149.1364185-5-dave.stevenson@raspberrypi.com>
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
 drivers/media/i2c/imx355.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b46178681c05..25d4dbb6041e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1617,8 +1617,12 @@ static int imx355_init_controls(struct imx355 *imx355)
 
 	imx355->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (imx355->hflip)
+		imx355->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 	imx355->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (imx355->vflip)
+		imx355->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  IMX355_ANA_GAIN_MIN, IMX355_ANA_GAIN_MAX,
-- 
2.34.1

