Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933403D2DC8
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbhGVTyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 15:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbhGVTyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 15:54:01 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3021DC061575;
        Thu, 22 Jul 2021 13:34:36 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d12so7210132wre.13;
        Thu, 22 Jul 2021 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGfNPzr1gE/pmw2DJmPe2VzUTwaf4gzOMzWZ5kc+WcA=;
        b=pohVws68g8dDugN+8Ckyic30nOcpw662cgNlg2LoOUWpLq9W7/b5cpcYlBCa6wANtI
         diU5M/mXeCRdX1N7tKzBYSsgzZGoShl6Sd37uYA5xeV+TJzdIZPgKG90fKXjSDLrxUd4
         Jsshw/jMg1MpZaM1GJJr8gPfZLIZZFAwkMkyDQXB9YVDGRHGhKSPk6DrXKv7HSYSxTgx
         TBA8kPTawYh14y+qBjiLv7t+58N5Mf4VDDA0/a0S8DzeSmRc/3MuMUtf/msEGBzC4BCn
         D9aVBm/QhVagaG20zkBcqbOVY7kBNXu7uvfaPGrfiuERlJnsiADeySX0jZhv4mtqQzYA
         4rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGfNPzr1gE/pmw2DJmPe2VzUTwaf4gzOMzWZ5kc+WcA=;
        b=CfzhzVDLHg814qfxUGUWaE58tekuO5d2Qcd9b4Z4lxUX0i39ymBWetpqcjlfbLBofK
         1xLy2iA/nCr5Lmy+PGz7sXxkYzyR/vtF7im25pvqDInhiN+zx081yTfqP+HfHFa1POfN
         AvbyPNKneqKworXpIVFDLr659I2r8f7HfYPVSdKLLB8dmwijhDunTr++zrkd6Gw3FM3N
         WfNr7ob+B8wvJS6MPscH/oSIU1CVl78NZ/J3+5fGyNVdxN2TWHQCqIeNy1jesuEidFuM
         y0Bj9+GCuUv2bP9eVWZ8vh2IUvvqGJfnxHHs5Cm3WawN5eV+oqvI73E1bDPKngYSI2hb
         lKfw==
X-Gm-Message-State: AOAM533m3sF43ZXosoirZZ0wnDgs0kuOiZGecxJCG1ntfJfhg0tInYoI
        /6X9+aQQlntcl54xnanF3UU=
X-Google-Smtp-Source: ABdhPJxpI+UKEJmljycF/UrHfPNtBWUTZ1jPKGIcDqsoDHp1Epa+hJ9qAMEahjsAEYsCGF7fwlMgvw==
X-Received: by 2002:a5d:456d:: with SMTP id a13mr1738806wrc.255.1626986074884;
        Thu, 22 Jul 2021 13:34:34 -0700 (PDT)
Received: from valhalla.home ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id b16sm31036455wrw.46.2021.07.22.13.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:34:34 -0700 (PDT)
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
Subject: [PATCH 09/13] media: i2c: cap exposure at height + vblank in ov8865
Date:   Thu, 22 Jul 2021 21:34:03 +0100
Message-Id: <20210722203407.3588046-10-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722203407.3588046-1-djrscally@gmail.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Exposure limits depend on the total height; when vblank is altered (and
thus the total height is altered), change the exposure limits to reflect
the new cap.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/i2c/ov8865.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index e1d3c0d50fdc..941b0f94f249 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -662,6 +662,7 @@ struct ov8865_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
 
 	struct v4l2_ctrl_handler handler;
 };
@@ -2455,6 +2456,18 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
 	unsigned int index;
 	int ret;
 
+	/* If VBLANK is altered we need to update exposure to compensate */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max;
+
+		exposure_max = sensor->state.mode->output_size_y + ctrl->val;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exposure_max,
+					 sensor->ctrls.exposure->step,
+					 min(sensor->ctrls.exposure->val, exposure_max));
+	}
+
 	/* Wait for the sensor to be on before setting controls. */
 	if (pm_runtime_suspended(sensor->dev))
 		return 0;
@@ -2511,8 +2524,8 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
 
 	/* Exposure */
 
-	v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16, 1048575, 16,
-			  512);
+	ctrls->exposure = v4l2_ctrl_new_std(handler, ops, V4L2_CID_EXPOSURE, 16,
+					    1048575, 16, 512);
 
 	/* Gain */
 
@@ -2693,6 +2706,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	u32 mbus_code = 0;
 	unsigned int hblank;
 	unsigned int index;
+	int exposure_max;
 	int ret = 0;
 
 	mutex_lock(&sensor->mutex);
@@ -2740,6 +2754,12 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank, 1,
 				 hblank);
 
+	exposure_max = mode->vts;
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum, exposure_max,
+				 sensor->ctrls.exposure->step,
+				 min(sensor->ctrls.exposure->val, exposure_max));
+
 complete:
 	mutex_unlock(&sensor->mutex);
 
-- 
2.25.1

