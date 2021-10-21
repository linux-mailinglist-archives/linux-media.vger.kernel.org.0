Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0D4436CF1
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhJUVq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbhJUVqZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F33C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:06 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g141so932688wmg.4
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vz+RGnr815S40szO261I+Y15bFOsQiW7l3SOXVgc2UI=;
        b=ew8s2YykeErG3e3hvnogp2+L3WcwL/bgXmBCqSu7hUA8pr6xubRa8tV4Lh9T0JuAg1
         28JUh8oi7DKuequIbSo3aLyOS/LHdG3L/k2t5untsnklbAAwiobdQ7BZQKnaKq2wPcCS
         euAd7sYlYbgHxknaEE78iLdwIjQl8mE8hmD1qjuZNHkpOPU6KDdz7LbIqviOW9OE5uxR
         M0ERGn/u40zAw9wcwfAMkGxqNulh889N00kbyIH7YdZAk2VfK2jFbA8k/UufmqAEfDSq
         SEBm8UO6nyJe0KW6jaTBcnuj0q29XCKO+ZAtrKWGZoB50KkK54hzoq2RaT5sCuHkNerd
         DF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vz+RGnr815S40szO261I+Y15bFOsQiW7l3SOXVgc2UI=;
        b=ms9u7kQgsd4RAcwczgnSidatfeN+9aU6vUJV40LSurXbpm6ZA+79K4Z82ymXewQI9q
         xQnr6bTvUJYfcuThnJPP2ZExspStJXny45LTqKjQfItiwHuLmOnpXNPvmawIcxdKkslY
         +h1dXNFA///HV+eyDQ1YgwiKRDfSf/claF8rAk94zLtOffc2NNAMdXUNGb3ymQ/L9rG4
         MMJFFnzylN8h72mCo/Y1j7f2CbYvJYPiXA60n2ipqW8lZBRfT/mYFl/5Y9ryoLjWy9X0
         QBv7ldohz1YeyBwXpIpwNts4nOYY6gWC35uPnutTVVTUKDuAay6HmWQ1X/5dI7yuhsyu
         5ETQ==
X-Gm-Message-State: AOAM530J8Olx2pNozPaYFIMFPZWCecDbpw2hbJ52ebccTtzmV5sxzXaD
        tF96J68a0XPq76zsL975BvJr6GTmvSI=
X-Google-Smtp-Source: ABdhPJw1L8tBE5IIPT8Ggqm5MMqyTdrT7/2i5B4TdSoTVt1b0pxNMBmJ+idSjyAeqEs/PN8eXqHy5Q==
X-Received: by 2002:a05:600c:2505:: with SMTP id d5mr9432891wma.36.1634852645425;
        Thu, 21 Oct 2021 14:44:05 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:05 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 11/16] media: i2c: Add controls from fwnode to ov8865
Date:   Thu, 21 Oct 2021 22:43:26 +0100
Message-Id: <20211021214331.1188787-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls to the ov8865 driver by attempting to parse them from firmware.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 16c5ce80353c..5fec1e35eea5 100644
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
@@ -2576,6 +2577,15 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
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

