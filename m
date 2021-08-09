Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B776A3E4FA1
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 00:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbhHIW71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 18:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhHIW70 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 18:59:26 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80126C0613D3
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 15:59:05 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h13so23494922wrp.1
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtQ0UVLo3Cg4U1KcWjY50/YjcZqa3dRnlreBGiZao6A=;
        b=nZtS8fqtORUZEhZPlud2gyHnUT00BIhqqgtOjnVOBklGdi6ptNJHKiRdYqwHc/L7nQ
         1b94HeKGsBufJPeju4zgYObTBNL/fDvyp4ybiUgEJZv3+gHL0sHwG3Pbvh5ykDjxMJGz
         EJ/2+wBs1bZi1EDfYRe7wT8Ikt/EQiQwhrtGMbitfcKBO8dnoWlhz2cbZYUDCKyIV4fm
         FXDN2siE/dE0fk0hx0BnEf8oVVlL5bFmMmXp7e136H34VSgb9Vq2mBYEB/1TIA/OWcJU
         W2Etw9dsj599LfXJXL1ITmSUIXilAxSWwnjXyYhHcJMesLRc7zaN2uNkotZeh8bLuWYw
         YdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtQ0UVLo3Cg4U1KcWjY50/YjcZqa3dRnlreBGiZao6A=;
        b=achFCeYNpTmkY4QWhztM5Xj8SrQRVKgs3P80h1w8+YLDANwR5Oxv5nt4YWf2QRHKL8
         wGw9fzTuYoqbLYhCdHvuOMdvNIUjfXfeyHtEw12MQZjVF2OFhVWBSbySK98r2dIpbv6O
         cdMCUAO+OWZf+H/Kd313DaeR/Y6oH2LGNh3T/cW4jciBzCpSE2gv7YJps6QTu4+FGTMT
         V2S0c/rMppqkvHbxqZHq92CIwATF4kSuAK6GrFNmaOzWTyCg6wAxeGCJs4pEj1wrUxmc
         jSWUHsEOw5pOVnxF9UQWjdEIQtJB6sKgbbCA4faMqsfPv/bMSQsn9wQcNuT4l2gRfiAa
         LO8w==
X-Gm-Message-State: AOAM5316YD92zr6Ga4F+LkyqmaeO6l7QWSxgLlafBo4vXNEwpzgIgfDd
        hBym/XES1+a9C1WrCDsL1oA=
X-Google-Smtp-Source: ABdhPJxaB5eV5SrrORcqyp8cQjeBBioOTUWFkr/qYCXxMF5QwGGglXu98Kuart0xdBLbR5P5w+NVrQ==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr28128237wri.260.1628549944204;
        Mon, 09 Aug 2021 15:59:04 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v12sm20437957wrq.59.2021.08.09.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:59:03 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     djrscally@gmail.com, sakari.ailus@linux.intel.com,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 06/12] media: i2c: Switch control to V4L2_CID_ANALOGUE_GAIN
Date:   Mon,  9 Aug 2021 23:58:39 +0100
Message-Id: <20210809225845.916430-7-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809225845.916430-1-djrscally@gmail.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_CID_GAIN control for this driver configures registers that
the datasheet specifies as analogue gain. Switch the control's ID
to V4L2_CID_ANALOGUE_GAIN.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov8865.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 8c2b7d3cbc8c..a97e355c1e07 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2143,7 +2143,7 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
 
 /* Gain */
 
-static int ov8865_gain_configure(struct ov8865_sensor *sensor, u32 gain)
+static int ov8865_analog_gain_configure(struct ov8865_sensor *sensor, u32 gain)
 {
 	int ret;
 
@@ -2453,8 +2453,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			return ret;
 		break;
-	case V4L2_CID_GAIN:
-		ret = ov8865_gain_configure(sensor, ctrl->val);
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov8865_analog_gain_configure(sensor, ctrl->val);
 		if (ret)
 			return ret;
 		break;
@@ -2499,7 +2499,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Gain */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 128, 8191, 128, 128);
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128, 128);
 
 	/* White Balance */
 
-- 
2.25.1

