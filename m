Return-Path: <linux-media+bounces-6665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1D87597C
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 22:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A57287D96
	for <lists+linux-media@lfdr.de>; Thu,  7 Mar 2024 21:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB7D13B7A3;
	Thu,  7 Mar 2024 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DDXw7RjT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D32E13AA23
	for <linux-media@vger.kernel.org>; Thu,  7 Mar 2024 21:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709847668; cv=none; b=C66xUiRfIvIvhujPNNp1BRjnmPrEnoPRB2Y6XXTXZtqFZkUYZuNCR8M7n3RYPmIWvWL2M5xQEVUMzOOcEsGWou7wi9UCnySHXPZaVveDwnbcktxXm/IeftA1i1ovY8LKSppleVkSJ5+4CNkLTAi2kKhkSUUBcbhF9qbqIh/RSMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709847668; c=relaxed/simple;
	bh=590zllsULqQeS+FbVxO+t0DlvqHEC5CsOgSJCahcl/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5vxoy/k9DC/0rExOL0zs6RHHVlJiUZrdo1cB+m7rByHLlWdtzw5I9amYA6+LFGyffJf7Egb73ZjQjtiSkwM1qoa0PR7fJ0/p8svOcfKRCJyIQ3Xy9UHkNWIGm4qo4+LCOcrbSFn4nWWHLkJFkWR0ncuqz+PWi/dJEXy8Wggg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DDXw7RjT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from umang.jain (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C1F5DC9;
	Thu,  7 Mar 2024 22:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709847640;
	bh=590zllsULqQeS+FbVxO+t0DlvqHEC5CsOgSJCahcl/k=;
	h=From:To:Cc:Subject:Date:From;
	b=DDXw7RjTryyJbpWPYdgo3frXy5azv8AleHTvCX5FECxQL8zRsqqVVlGBG1G7Nt3OA
	 6OsYSpnyE0yrP4ybJWY0DuTMAeYHjFc78WTRWm0ViK3dSk61Ijf6tU5pIzE8OvGujy
	 yxzkwLyk4Slu+9lGnsbFT8c0d7nwkVh2m11LzRo8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/2] media: i2c: Add imx283 camera sensor driver
Date: Fri,  8 Mar 2024 03:10:41 +0530
Message-ID: <20240307214048.858318-1-umang.jain@ideasonboard.com>
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
 drivers/media/i2c/imx283.c                    | 1573 +++++++++++++++++
 5 files changed, 1700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 create mode 100644 drivers/media/i2c/imx283.c

-- 
2.43.0


