Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BFD3D2DC6
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhGVTyP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhGVTyC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:02 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A23C061757;
        Thu, 22 Jul 2021 13:34:37 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id o1so68847wrp.5;
        Thu, 22 Jul 2021 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vj2usC585h/5PbVMEnhZyeaPorYxZb5+19JRMHAV+I=;
        b=ogkp/bz69q7ZvB9TmeYsr0NT70lXZwtwsibF3yTuODqnwACM+p1Ag3OFNvW+nDKhoo
         LRAFdXeafgg41x386AGosqqUq1BcJFKNlEGYqEj8J1HkaeGirQFFKX0eO+eKNe4wZaIa
         GxjUP9QqlwZhBL8rZ46fyIFGjJ1gYuyHnCDtdLeqBI8sTcfV15zlJYq6HZ1ov2MMAj46
         f36l1ErxVsQFvnuddXBk/rQvNFhttQ0s+NF0nH0kZQJL4ph5pIHCYjccYTxxo/0cYe/g
         DZnMQwY5VYmRnSltCCBREJanGSkT0CA7t1kPd7TUhi1s8AJCAarrNi94WlglAGP/qNkc
         nRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vj2usC585h/5PbVMEnhZyeaPorYxZb5+19JRMHAV+I=;
        b=bVZbr1oWn2S85mOilTEQMET13dieNuoWw2Q7BLHcYJ0NrZhGtTcXH5Sg0a6mO357+h
         UQLIsbovCBjakzerWgBunkvdqpDF19NPmhgMjDFiJ0FG38j2v9CatvVFGerZf8pRYsVy
         p0yLEABDzVoEGVjoWdnujhrdNCc4ZZFCX9k1n6JV/gP7w2Tk5BHW1jBMmDPd1i1IeGwx
         zY9WyTt+Z/2X+3g1uGTKZMNDmujFqpOW5N9NBkEBjIFIbepuPrERNLubjJFs5ovLyWB+
         nLqKa7j7UGObb52yDfDdwde9FcsBnFb4Jj4KNRCz0VLJZnDSqEHxupAe9VkFsGku1jhy
         xrqQ==
X-Gm-Message-State: AOAM532kCdP205OQk98WLV1gW60CpsUExCP/Y+/0IJbfP7BtEKDyDAa/
        FUgBJ6J9CUS+PLLtqkPoeHs=
X-Google-Smtp-Source: ABdhPJxFaXxfsbFzQYu7XThABPmOHVBOlMoSQmVSh284nJFTeoZOJLRq8Q9sJasMQpV3aCvWCCqVNA==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr1850906wru.308.1626986075753;
        Thu, 22 Jul 2021 13:34:35 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:35 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)), linux-kernel@vger.kernel.org (open list)
Cc:     Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH 10/13] media: i2c: Add controls from fwnode to ov8865
Date:   Thu, 22 Jul 2021 21:34:04 +0100
Message-Id: <20210722203407.3588046-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls to the ov8865 driver by attempting to parse them from firmware.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 941b0f94f249..4954808f5416 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2513,6 +2513,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 	struct v4l2_ctrl_handler *handler = &ctrls->handler;
 	const struct v4l2_ctrl_ops *ops = &ov8865_ctrl_ops;
 	const struct ov8865_mode *mode = sensor->state.mode;
+	struct v4l2_fwnode_device_properties props;
 	unsigned int vblank_max, vblank_def;
 	unsigned int hblank;
 	int ret;
@@ -2575,6 +2576,15 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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

