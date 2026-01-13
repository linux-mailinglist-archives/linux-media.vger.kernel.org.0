Return-Path: <linux-media+bounces-50516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC74D17888
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:13:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FEB6303AE87
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A63C3815D5;
	Tue, 13 Jan 2026 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZAovOSOk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C43806DB
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295254; cv=none; b=fafwaq3Zc3IOwepsvwuwMl1NzjqGGS9Bsc60C7jb8rWq2b2OrZWCymNpiyE0R07SPAsIrynkNWt4MkZ1pEfCx9Kfapp+79XCBpfupnXvuan9nOBydsWIJgSvSU4J6YdlNPlQagpwN2XW+cI0kBEZQWwsONG4V50xUBVbKR2Pdco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295254; c=relaxed/simple;
	bh=REklIFVXmRlmq0LmpKSuw9wuteAuE3Gnu30O2/rYrz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lVf5ErFVnexCxXVwH2ZtL3Vy9/UX+Sy6jOUmbGaoGZhX8ZVE+GxiWsNl4cbW6ksalu7vuSvcogdYchOLRW/dY2yBq7ajnj4wIHUoMN5Luev5VCEsxs3QkknwNLkVDJw88xhDQ3Ow4rhRLVqtKZjMzf9yGRcSDoJ1do9L9fU81B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZAovOSOk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F3092E0;
	Tue, 13 Jan 2026 10:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295224;
	bh=REklIFVXmRlmq0LmpKSuw9wuteAuE3Gnu30O2/rYrz0=;
	h=From:Subject:Date:To:Cc:From;
	b=ZAovOSOkmmoqGenK0eDXUjaXi/qu4VyIRySq5dMefq7AD7lZTe4MoopCttupYMCn4
	 uosUxgLoWMW9UBDKqwgP6q43wSx2GIhq6cGOJCJCHeAVsKLaDXz/p5IUbIyo7+0YXL
	 6p16S0nSILshDC3w3VLuWvgHDe1QzFZZww7UpwUQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 00/10] media: Add support for Raspberry Pi 4 ISP
Date: Tue, 13 Jan 2026 14:35:20 +0530
Message-Id: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEKZmkC/yWNwY7CMAxEf6XKGa9ck7ZpT/wH4pA4LviQFhKoV
 kL8+2bpbd5I8+ZtimSVYqbmbbJsWnRdKrSHxvDNL1cBjZUNIXU40hGChY1v+gAtdxjEMRGT65F
 NndyzzPr71Z0vO2d5vKr1uZcmSSn+a52a6uyxxW53QknAycNGgGCjFz/YkSWOJ43iy7qE1ef4w
 2v6fwq+CNSc9Dk1bsZgmcVa186BqO+O/TjUIrqIES3SwKEVZy6fzx9wuhzv8gAAAA==
X-Change-ID: 20250923-b4-vchiq-isp-7e8c22c2860c
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>, 
 Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4557;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=REklIFVXmRlmq0LmpKSuw9wuteAuE3Gnu30O2/rYrz0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgs5e+Ch/lz2cxZ3hmn5Jqqf9Mdi/IOSjDsbo
 Hu4jFLRoQGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLOQAKCRBD3pH5JJpx
 Ra60D/43niiXSmYxhdDtI6hfPiYhB0BeImTed2qZwjNkP9fNh0t2n83b8VPuKVdvYTvBGuy6Qzr
 5/5KDmIhkg8A226QPMtsvt5jR+jGh7BgLvjp9gJ8zvQJQ4/SLxlwMqEGW0XvJPga3vMpTUIz8GU
 i2RfEFVGgT1LM5EEsZBZxlMqZSPCTnRma5H0p84AV8SMMrSPfJzu4j1K5ij+pwiLUa85u+LKhPv
 Yy8puKCXWjPKcDORqxA+famD3XHZinOURNxismgcMk3np2H4x9HJwUZujTIxFgcGJpShdsEoer7
 h/O+7Xxb0CXttS7hry3qGp+FdnH1tFQBCb3dTzTxJ/7fE8Awv6FiStw76NSJLQOLJ/tKM+4+FhI
 btI1nr89zhlAXmb7UQrADgLjdqOR7VeGJxqoFBHyvpKl9DIrJnFJr2yD+wTVykvbhVgZCTjPdOP
 FduQ7oEbJl/5P9PG6uDurCjQ/IJdMVoP+4VnEVWTdxnIFgyuuBWHrDUfI+Dk5p8SagusZgFRkaQ
 wivM1kayUHJH5lNK9jADMjPh5IPyF741y7VYrryaAuEEXVNuAyABPd5HhYG7+oD3tRSAgJ3eUaN
 ym8ge9nL+hStM9U+m6l1PgUvpW4U1sM0oF6N8mmWe8lbFQ5xjVnU+uNUMyZumzAt8Qsi8drrdQI
 ua/A014B4pxbtVg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds support for the ISP used in Raspberry Pi 4 (and earlier
variants) by adding the bcm2835-isp V4L2 driver.

The underlying hardware for the ISP is accessed through the VideoCore
VPU, via the VCHIQ/MMAL interface that was recently destaged under
platform/raspberrypi. The ISP driver, and thus this series depends on
VCSM CMA driver for shared memory support (for lens shading buffers):

https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com/

The ISP driver introduced in this series has been taken from the one
present in the downstream raspberrypi 6.12 tree, squashing together
various commits, along with minor cleanups and renaming directories. For
testing it with libcamera, please use this branch that supports upstream
unicam and the correct base ID for ISP controls:

https://github.com/jailuthra/libcamera/tree/pi4-upstream

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Dave Stevenson (1):
      media: videobuf2: Allow exporting of a struct dmabuf

Jai Luthra (5):
      platform/raspberrypi: vchiq-mmal: Move headers to include/linux
      platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
      platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
      platform/raspberrypi: vchiq: Add helpers for vchiq driver data
      media: platform: broadcom: Move unicam driver to subdir

Naushir Patuck (4):
      media: uapi: v4l-ctrls: Add CID base for the bcm2835-isp driver
      media: uapi: v4l2-core: Add ISP statistics output V4L2 fourcc type
      media: platform: broadcom: Add bcm2835-isp driver
      platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq

 Documentation/admin-guide/media/bcm2835-isp.rst    |  127 ++
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/pixfmt-meta-bcm2835-isp-stats.rst    |   35 +
 MAINTAINERS                                        |   12 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
 drivers/media/platform/broadcom/Kconfig            |   23 +-
 drivers/media/platform/broadcom/Makefile           |    3 +-
 .../media/platform/broadcom/bcm2835-isp/Kconfig    |   14 +
 .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
 .../broadcom/bcm2835-isp/bcm2835-isp-ctrls.h       |   73 +
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1836 ++++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
 .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |    0
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
 .../linux/raspberrypi}/mmal-common.h               |    2 +
 .../linux/raspberrypi}/mmal-encodings.h            |   68 +
 .../linux/raspberrypi}/mmal-msg-common.h           |    0
 .../linux/raspberrypi}/mmal-msg-format.h           |    0
 .../linux/raspberrypi}/mmal-msg-port.h             |    0
 .../linux/raspberrypi}/mmal-msg.h                  |    0
 .../linux/raspberrypi}/mmal-parameters.h           |   86 +
 .../linux/raspberrypi}/mmal-vchiq.h                |    0
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/linux/raspberrypi/vchiq_bus.h              |   10 +
 include/media/videobuf2-core.h                     |   15 +
 include/uapi/linux/bcm2835-isp.h                   |  347 ++++
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    1 +
 34 files changed, 3252 insertions(+), 30 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
prerequisite-message-id: 20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com
prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
prerequisite-patch-id: f65e3f6e8db823fcfc37421da10a76f92cf56d9d
prerequisite-patch-id: dbfc2fc4237c738e499e802be972dd8f2736a714
prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


