Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94D03E4FA5
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236960AbhHIW7b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbhHIW7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6198AC0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so1132367wmi.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TnmFNtbiKQGa8at+MP7DPu15n/0g8nWr5PR8Vb/Jw8w=;
        b=KwF8Fv3bTBgIi7LPrqnAfikg13y6wbm0HDfauZDxzY8YUtSmq65p039TNTBAbXRHc6
         UDZx1s7vWNwIbVGQ82k28nFofDJb4RxLkf7AfpnTVJr1ZfnPfRhAGaAirAPsyhx4ATR0
         EpOVB++J1EAgVhRHQESD3KwZtfvZapAxwU61p02MINWHEP5Z4473fYqzh5KSCfTWVnoq
         KaowSxlvuKp/THKsGaTMzTOym4/LfWcDpP5Zs+OwMqyh2e0RtvVPZcY5NV9O9d+C0x5N
         lrLzEWmpiegv6S91v3GN0i77KwJfheaA4143EJhiMJ7YEk53ECgUyOyGu1SPomJ60xbH
         I4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TnmFNtbiKQGa8at+MP7DPu15n/0g8nWr5PR8Vb/Jw8w=;
        b=iXKZWljKfbaHyYClVPrucXo30FodnaDKVqKPrjurMl5vSSQDOOZ2jRo5tzWbkZOmnR
         e0pCrzE48JVUkrwC4yR/yTxExwjzwtW/ZFCybRq/35uskT2PSJG+X3Ihkh07ALPqrBLP
         5g3qETDD1BPIdJiyXYVYRsXJ2EWvf8cuf+56J5CegK3vCL2/Nh9wb+jJdHW9DzIrRN7K
         1HwjqV4LWyc0YN4QIpyohd9KHaGi1T+NnLzZ4Vsw9BtfqWn7u4f3fzhy6VNjmm+Q9vFQ
         hSIJ/YrklPfzFLsbd6QPjrdrx5jJKojVa93Q1Su+6T2cso0/eVfAAJ89ytpoLsoCbKNd
         yE3g==
X-Gm-Message-State: AOAM5314XcJ+nYDRvUZDH4QcvKAVBBsV/ffP2Z0FgWxk07lNasNQVX6o
        eudYvWOFuR7D5hzCUWDnb9uVE2Bo6Sw=
X-Google-Smtp-Source: ABdhPJzDZ9GOZVOnhRnCCR80yU01c0qUPTq2jPKhZeBmcpsvreCYAhzCT8qPXelE9mOdWKzOWBiTug==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr1412431wmk.50.1628549948075;
        Mon, 09 Aug 2021 15:59:08 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:07 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 10/12] media: i2c: Add controls from fwnode to ov8865
Date:   Mon,  9 Aug 2021 23:58:43 +0100
Message-Id: <20210809225845.916430-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls to the ov8865 driver by attempting to parse them from firmware.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 70747552e32a..d7926cadce70 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2519,6 +2519,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = sensor->state.mode;
+	struct v4l2_fwnode_device_properties props;
 	unsigned int vblank_max, vblank_def;
 	unsigned int hblank;
 	int ret;
@@ -2581,6 +2582,15 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 		v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 1,
 				  INT_MAX, 1, 1);
 
+	/* set properties from fwnode (e.g. rotation, orientation) */
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
+	if (ret)
+		goto error_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(handler, ops, &props);
+	if (ret)
+		goto error_ctrls;
+
 	if (handler->error) {
 		ret = handler->error;
 		goto error_ctrls;
-- 
2.25.1

