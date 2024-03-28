Return-Path: <linux-media+bounces-6933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B55887A32A
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:08:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 283A4282F64
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF83516428;
	Wed, 13 Mar 2024 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HvHDG+fR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4FB1428A;
	Wed, 13 Mar 2024 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710313684; cv=none; b=VDFA5tQckxD02iSXw14vNtYkLqvw+HH/icYEB7jqH/qRuFbpmB3/xmm22UBY3/H9f1Flgn0tAGh1fHJbA57ff56Sz6NWCyO7bDn7/P1jWpW/nH1f8U7HgwMuN3VKF1iBaQL528eptewjtJMJsy5Q0nPkHs1Cp6nQWb6CYmV1aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710313684; c=relaxed/simple;
	bh=TIvl6Z9GIJHgfjQYrqEBZeeApqofElnPFkOg98fwHbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8g3fkA8RKR5SW2XCdn8ygfgiXFZ2DGUhtbY91NU+yeltKk3KVMcCnQF3+hBdKwjsOaej2McaBXIsGgSIn3Xyzb//4bwRTIA2CW+spyW3fngQ2Urks5Umo6kGnHNA6lf5ocVKOYQyX/yIUxzW2wCNy5kQ9M6GIop6noJ3XooXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HvHDG+fR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD797720;
	Wed, 13 Mar 2024 08:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710313656;
	bh=TIvl6Z9GIJHgfjQYrqEBZeeApqofElnPFkOg98fwHbM=;
	h=From:To:Cc:Subject:Date:From;
	b=HvHDG+fRlpauy0Zq8sdBtgd2oJXdUC40BfM5LOXfz24pOWzwVNjWhOt7Mob2VndKb
	 HPuVgin+Dy6Y3clBH2YQQzZCzZ6S5eAjFAx0GIcQHQa45QHsJHwwxhTfzBzeyHXJ5O
	 au6P1/Fba4PSMjcqQjtV9ztu0keIvuDX2TSiErQA=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	tomi.valkeinen@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 0/2] media: i2c: Add imx283 camera sensor driver
Date: Wed, 13 Mar 2024 12:36:57 +0530
Message-ID: <20240313070705.91140-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a v4l2 subdevice driver for the Sony IMX283 image sensor.
  
The IMX283 is a 20MP Diagonal 15.86 mm (Type 1) CMOS Image Sensor with
Square Pixel for Color Cameras.
    
The following features are supported:
- Manual exposure an gain control support
- vblank/hblank/link freq control support
- Test pattern support control
- Arbitrary horizontal and vertical cropping
- Supported resolution:
   - 5472x3648 @ 20fps (SRGGB12)
   - 5472x3648 @ 25fps (SRGGB10)
   - 2736x1824 @ 50fps (SRGGB12)

The driver is tested on mainline branch v6.8-rc2 on IMX8MP Debix-SOM-A.
Additional testing has been done on RPi5 with the downstream BSP.

Changes in v3:
- fix headers includes
- Improve #define(s) readability
- Drop __func__ from error logs
- Use HZ_PER_MHZ instead of MEGA
- mdsel* variables should be u8
- Use container_of_const() instead of container_of()
- Use clamp() used of clamp_t variant
- Use streams API imx283_{enable|disable}_streams (**NOTE**)
- Properly fix PM runtime handling
  (pm_ptr(), DEFINE_RUNTIME_DEV_PM_OPS,
   imx283_runtime_suspend, imx283_runtime_resume)
- Fix format modifiers, signed-ness at various places


**NOTE**
There is streams mask issue, as no routes are defined with 1 pad:
For testing, I have the following applied locally:
```
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4c6198c48dd6..38545d779620 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2115,8 +2115,10 @@ int v4l2_subdev_enable_streams(struct v4l2_subdev *sd, u32 pad,
        if (pad >= sd->entity.num_pads)
                return -EINVAL;
 
-       if (!streams_mask)
-               return 0;
+       if (!streams_mask) {
+               dev_err(sd->dev, "no streams mask, returning ....\n");
+               //return 0;
+       }
 
        /* Fallback on .s_stream() if .enable_streams() isn't available. */
        if (!sd->ops->pad || !sd->ops->pad->enable_streams)
```

changes in v2 (summary):
- Use u32 wherever possible
- Use MEGA macro instead of self defined MHZ() macro
- Properly refine regs using CCI
- Drop tracking of current mode. Shifted to infer from active state directly.
  (Laurent's review)
- Cont. from above: Pass the struct imx283_mode to functions whereever required.
- Remove unused comments
- Remove custom mutex. Use control handler one instead.
- Drop imx283_reset_colorspace() and inline
- Set colorspace field properly (drop _DEFAULTS)
- Use __maybe_unused for imx283_power_on() and imx283_power_off()
- Store controls  v4l2_ctrl handles for those required, not all.
- Drop imx283_free_controls(). Use v4l2_ctrl_handler_free
- fix reset-gpios handling and add it to DT schema
- fix data-lanes property in DT schema
- fix IMX283 Kconfig
- Remove unused macros
- Alphabetical case consistency

Kieran Bingham (1):
  media: i2c: Add imx283 camera sensor driver

Umang Jain (1):
  media: dt-bindings: media: Add bindings for IMX283

 .../bindings/media/i2c/sony,imx283.yaml       |  107 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx283.c                    | 1596 +++++++++++++++++
 5 files changed, 1723 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 create mode 100644 drivers/media/i2c/imx283.c

-- 
2.43.0


