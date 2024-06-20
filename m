Return-Path: <linux-media+bounces-13789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D84910226
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16125282723
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6AC1AB352;
	Thu, 20 Jun 2024 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SMuTJexp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528A421A19;
	Thu, 20 Jun 2024 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881687; cv=none; b=WFlhSW4swFGwwz2yITuTSGW2uu535cOWLi44SMIoRXLDR7nj7Fuk375rI7cWYgyW0HYYOyYhJ0Sz1p4iH2XZDdqxh6gEwcChHHUdj2egQkGuBlBKDOxY3sjqy79j6HNMZFN4aXwhuEennhYNvjcX5R3FC/iWRFP7tFfP4tUOjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881687; c=relaxed/simple;
	bh=u8NWosi2Lfda1VfSjmVjhQi59L4+kIJps6GW/2+SxCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0kbQtZjL/zl3xzgZX1FjyKBfUSznyJfkZt3vtUtWGtnIEl8507CWPHKUHBWB35UZ4WY8mQEg2rzO7VCbURR9UgjuCEsUBKoAQUgxLvaks96rNTBsjjn+BvePZWp68+Owfokq78Wyxco8GaJyV/QGvdwFd6+R7RY5ebTrriIXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SMuTJexp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-144-210.elisa-laajakaista.fi [91.158.144.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2570C66F;
	Thu, 20 Jun 2024 13:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718881665;
	bh=u8NWosi2Lfda1VfSjmVjhQi59L4+kIJps6GW/2+SxCI=;
	h=From:Subject:Date:To:Cc:From;
	b=SMuTJexp2Jhc4PklTL2y7U89jOYvIuLaeClmA7s2oRvHhVA/SBjI9Zqz5NQLWbTG1
	 FgVvAiwfV+zqOCKtEINMnQszIpPsbGsJYffy3PzJ2N3lGQcaPMmyWT6b3ybkgFp1DT
	 EoZqyfWocwoxaA7h7F3Pq+/3QUrJwGVsY+VkK5aA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/4] media: raspberrypi: Support RPi5's CFE
Date: Thu, 20 Jun 2024 14:07:49 +0300
Message-Id: <20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUNdGYC/2WP0U7DMAxFf6XKMy5J2rWlQoj/QHtIE3fzRJISZ
 9XQtH8n6wQvPF776vj4KhgTIYuxuoqEKzHFUIJ+qoQ9mnBAIFey0FK3slEtpEWBnRFUq6dOD1O
 vVStKe0k402UjfexLPhLnmL438Kru01/G8MdYFUgwtnMvnZxnrd07OTQcwxRNcrWNXuxvD3bCr
 3ORy48DYjKMUPae8lh9UjhfwKMjA5zNAZ+94YzpruWR2WxfjNXrJrBrlBxkL/u6aXfdAApOxsY
 l1j4GR/8M3orC7Qe1uywiJwEAAA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Naushir Patuck <naush@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 20240531080707.34568-1-jacopo.mondi@ideasonboard.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4295;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=u8NWosi2Lfda1VfSjmVjhQi59L4+kIJps6GW/2+SxCI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmdA2NZBmM5pX3EATZVL9ApWxEjJmQvvPKcEH9i
 PVKm0iJwA2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZnQNjQAKCRD6PaqMvJYe
 9YohD/4rtkOMnOUmEuoBWMa9wW+Zqc8fhkItKCHRfTq+KPTUgya7Q5Iiien2AvnaDmYUWdiTzmT
 geVbQG8O7iKkbuK7bQamyS6sokcPzBdbX1xKk7uwWEKkORaaQGfuTuqQAHdlU6bqlz18SbYeC34
 Gg35T9h5G5eqEYrK1zN8BSudEQmNnZk/a27nTicTBTEzZpojo+2kYHtkqRrvDlH+I6kz6EmkWi6
 b4ZEy2WP2jDKrbaQUUNiErb1VkdmQdOTqlkhBGPlAyXp0cNxSJKgnkj+UJifMfzF5YBPza+8l/o
 q3AlI173/j+smJgjFv218mtj4GSVTxo53X++ws4WYOdOZaTVwY2Z58DM+7zsM3F05+hKOPbUBFP
 YqXPDMeND+t1BJ7nR315qRnVPIZy9l/AExeFUF5q198+rsfhAOMHjD/2sbpsBIBTjd/u3YezQ9P
 qIEKgpljofHTqzjqiQJoDERU0vKYU9cN5wuhwpDdgWC3T9nh/oSy/2uUq/Kg+rZuT9612fCecsK
 rPD/lM22qNeDmqnAJBK7EiEWiDj+j3YFvaOhskv3LHr10J6YPRRs34+ZUtmKS1sQTGClMWQPknI
 OLFVRqKM0j2pVGfdfuksuy/MDcFmDTn+JFwV1kzIrUG9dzOtPTFxtXspaF9JW7Cfy+hY/JUs/hx
 ecKgDgz5PgRuG7w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series adds support to the CFE hardware block on RaspberryPi 5. The
CFE (Camera Front End) contains a CSI-2 receiver and Front End, a small
ISP.

This series is based on linux-media-stage with Jacopo's "[PATCH v9 0/8]
media: raspberrypi: Add support for PiSP Back End".

To run this, you need the basic RPi5 kernel support plus relevant dts
changes to enable the cfe and camera. My work branch with everything
needed to run CFE can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git rp1-cfe

A few notes about the patches:

- The original work was done by RaspberryPi, mostly by Naushir Patuck.
- The second video node only sets V4L2_CAP_META_CAPTURE instead of both
  V4L2_CAP_META_CAPTURE and V4L2_CAP_META_CAPTURE like the other nodes.
  This is a temporary workaround for userspace (libcamera), and
  hopefully can be removed soon.

I have tested this with:
- A single IMX219 sensor connected to the RPi5's CSI-2 port
- Arducam's UB960 FPD-Link board with four imx219 sensors connected

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Change the compatible string back to raspberrypi,rp1-cfe from raspberrypi,rpi5-rp1-cfe
- Drop the references to rp1 headers in the DT binding example. This
  allows compiling the example without the rp1 support.
- Fix missing remap lines for mono formats
- Fix csi2_pad_set_fmt() so that the format can be changed back to the
  sink's format from 16-bit or compressed format.
- Link to v1: https://lore.kernel.org/r/20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com

---
Tomi Valkeinen (4):
      media: uapi: Add meta formats for PiSP FE config and stats
      dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
      media: raspberrypi: Add support for RP1-CFE
      media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)

 .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
 .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/raspberrypi,rp1-cfe.yaml        |   98 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
 MAINTAINERS                                        |    8 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   14 +
 .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
 .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
 .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2526 ++++++++++++++++++++
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  175 ++
 drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
 .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
 include/uapi/linux/videodev2.h                     |    2 +
 25 files changed, 5220 insertions(+)
---
base-commit: 954ee38d40c98001cfdc570c4d5e90bcbc456ce1
change-id: 20240314-rp1-cfe-142b628b7214
prerequisite-message-id: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
prerequisite-patch-id: 42749883104fffad151e25d8127eb84800d7e9ca
prerequisite-patch-id: 433ce52b6b1b72f2c29e4474d72cd5106b73c075
prerequisite-patch-id: b9b3006cd03bb4e41e03f735d97e19081a32be02
prerequisite-patch-id: abeb8c40020f0ca6140afc141e535abc86a4773b
prerequisite-patch-id: 4ddf121ee47eeadeb370a5fbabc82ca6f6caa23b
prerequisite-patch-id: ee469d3c346f55483733a04d89e87d02126501cc
prerequisite-patch-id: 9467d5cd306aa29842128294a5f76f184b72eab7
prerequisite-patch-id: e6dbee90dfbd984bd55cbe3db56d9d8de4dc86ae

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


