Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4712344119E
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhKAAOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhKAAOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:09 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D2BC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d3so25758362wrh.8
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BRADf3qIhaoSYgsOv/1Z1tOMSrTm5zFBbvc1XG3wKTg=;
        b=FJu0aqq7GcAlA2Q84GLb6fDp/LvehuE5MoxPHmDgtD6UWtvuhDr/UnVxPbrfYnsFgA
         /iBwwuPx9XTBF7jhewaJZqqskN3I2yOnWzmq20Kp5Q6h6+Vrflj9qIzyiCAHmp5yjTVZ
         G6Sl3gKKZn7/3dRuHWQHcGrrNHPRXPd4d8WlsPlIJtHq/4woKK1AuSmisOmJtEZTZag3
         4fhrf4RG0JIjiaKme4AkfmqFa0uXzX+HEC9j4CbALtwonZwO/cBTsR/6heCJF1gAWR1p
         ZJ1u9KO2uUgFwr7gu2z5OUzMXW0DGQNwbKag2QhL3S+Yf0qWXt4sZoX7BnsyjLps3vmw
         RFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BRADf3qIhaoSYgsOv/1Z1tOMSrTm5zFBbvc1XG3wKTg=;
        b=m4zLeTDbQzASufdbL2g2MFwUCCR9S9knY6OH9fppj3ffWYEvSmrUulksP4kXqH3jYO
         NqUndQUddfPHU7VxulLnWS5W+dTyCG83PYgBOseqLtmGFFcuZD4zcu7iJbjSMVE9aLxY
         EAzDCDJTed3fvS5WxJKofGD+06oKNm3bRoCgFGk68Nx/2w/cCDG1Xqo47AA9UqV0yYHU
         goR6paIroiMEBzwNUC/fMoRibPNJBEBs5+CFpcJ91Bk+8Pigrhe1wknGiGfZdJPBcMLz
         scQiY0nZUi1PHE4qSNLWchr5LgV5O2bYLya4jmStPTlMKrE4DN1uQ80+lWsAN/C3QZuH
         aemA==
X-Gm-Message-State: AOAM5327mMppSvlWPRshzmhjBiFBxqIOvbfqY3+u2WfFsEclUm1wzyTI
        aqzHV6NxIIv4eGpROMgNakc=
X-Google-Smtp-Source: ABdhPJzuOh0dDeBcoNe+sjwRYM1PTCWI6zVIGYGjZW4ygi3J2DHPnxwGoyzQ2BGSB7/ekq7Rpt6opg==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr7454160wri.222.1635725495399;
        Sun, 31 Oct 2021 17:11:35 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:35 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 11/16] media: i2c: Add controls from fwnode to ov8865
Date:   Mon,  1 Nov 2021 00:11:14 +0000
Message-Id: <20211101001119.46056-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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
index 99548ad15dcd..dfb5095ef16b 100644
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

