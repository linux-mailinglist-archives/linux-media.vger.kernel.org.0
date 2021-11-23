Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737064598DD
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhKWAET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhKWADt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:49 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB004C0613DD
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:37 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id n29so35661259wra.11
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIlmIyIn/GiySb/nhjHxa+6YJSRna71Nk7IiTYJOcqQ=;
        b=pSYrtLiaNHS4ZmjKKU+fQugneIQDW822IBmjhDUo/xIsrcrbco/1YhP/FNMqjyHP0h
         UFJZ1bnLJOiKepVcyl9gUOgqC+sMQrzma881aSMkv86UXoxnrnJZDsm53UcKR9+twx2U
         PWWCrqPIO6jVjZlWRiVTyAXR+HQHo69HDqhr3kb3ZGJAzG7G42b2SpOm21pMHacdfwI1
         a5/kisExMtKkJ62/ZfzK6eJ2e7Xjkhf7u5f2eYSGciKeweSSKZ8vSghl3UvM1X6im+Kp
         ySfhrDs7IceSpoJ5iXkuu+BZzLaFOFvtmg773CfUEiHQ4I5xBEXPJHaAzUk1X5kToyiG
         dTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIlmIyIn/GiySb/nhjHxa+6YJSRna71Nk7IiTYJOcqQ=;
        b=20sgiaHc+mKfYqr19vJlW+aJcPk7pqvCcGWfRF7kxheFNLy+5xo6q9k0GUQ+/8WdPQ
         ynJ0gpOi7WacF4LKUhdeVzri3tx0jqhS8sY/jknAVawNTY+4UGP9d96SDRQhuCHhQR1j
         54SPBHeb74MIfS4d0RxnxH9DDjr8Gjs0ey3lKOk3+GZxkVMel/3WtNLiBIM+TzvtPIcj
         WdP5U4WEkskns90J+38xXD1gqzooOvaw2HnnPhWxM189oyVHn8349hdH+KsuhTrAQKNy
         X7AXze8yIb1sUJEp3zBqDNjw0n93EU4eOfTm7uGfdkjyMvXPrCTHsrtmXwqXvqhYWOnr
         NjlA==
X-Gm-Message-State: AOAM533DfKAa4/QTmn3zS7Gsm+82O3iiWQZbH0DTcA2/sHt/28oNV2fh
        TA7GhlRpVf0dF5H98P2/ZIee+d26WM4=
X-Google-Smtp-Source: ABdhPJz0aClkMViTPSEgYR3H3Tua6RMhAqUVjP59aBCzLRhzYvvTT/uxcf7CRPP4De17NLnynL8Zcw==
X-Received: by 2002:adf:e682:: with SMTP id r2mr1683519wrm.281.1637625636576;
        Mon, 22 Nov 2021 16:00:36 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:36 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 13/17] media: i2c: Add controls from fwnode to ov8865
Date:   Tue, 23 Nov 2021 00:00:13 +0000
Message-Id: <20211123000017.43187-14-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls to the ov8865 driver by attempting to parse them from firmware.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 811438c44b58..45b569f1e7c0 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2515,6 +2515,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = &ov8865_modes[0];
+	struct v4l2_fwnode_device_properties props;
 	unsigned int vblank_max, vblank_def;
 	unsigned int hblank;
 	int ret;
@@ -2578,6 +2579,15 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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

