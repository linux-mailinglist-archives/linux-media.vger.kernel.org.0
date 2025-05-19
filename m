Return-Path: <linux-media+bounces-32821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C0ABC171
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98D393B8F9F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07405284B36;
	Mon, 19 May 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vI3YQEGX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF913F9D2;
	Mon, 19 May 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666688; cv=none; b=KNUcfRuzXCboTU+0l6FGluqgM+DfSHeZTuMczeGK7A/b19DCTX4HvoHOQCkVcQVawvUyIBJmCsFGfc03JKRbl0PJB2hcU/IwXBpc3N4470Cw8PcKVVfJxepZpULjfNuhaBJLsOrN0siXkDjxBG7P5sQoX3mSVTl3O0ojGmn2DNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666688; c=relaxed/simple;
	bh=LAUMDqcflNTaUA/Dn9CWlInk45/XJCP46J9Kp5aF0Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X3Er0cq2eDYAvNH8x23h17nIe7EDYhzf6f4EmVsBtqFc+OTFeTFK0xxkDGuZb/9s7oI03RYYU6mqI3JPGp1/FCtntKfoe+MHRwbCOr8dqNMyguEJOGGIVR6GRQFoNZSJ9ApDGu/LdnEJS9CjKDWJc5pRgZRJdUx6Of9vXEWlQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vI3YQEGX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E155BD21;
	Mon, 19 May 2025 16:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747666665;
	bh=LAUMDqcflNTaUA/Dn9CWlInk45/XJCP46J9Kp5aF0Tw=;
	h=From:To:Cc:Subject:Date:From;
	b=vI3YQEGX0p4LX+Mbzbaw8ivf1Ho9lRH6oCwDdSaOvHWM46EYtbn3Y3MyXHCrCjE1W
	 6RXlIfitP/uP+gYeduoM7gqIMg3kVhaMXLm6ItB/QvXKDbHQbMAd5xkYI5XQwHxIth
	 dVvBNO+yrafXxTG+Tajqr4XpxTMUPxiE+0hqFcYQ=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/3] Add Input Video Control Block driver for RZ/V2H
Date: Mon, 19 May 2025 15:57:51 +0100
Message-Id: <20250519145754.454005-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all

This series adds a driver for the Input Video Control Block in the
RZ/V2H SoC. The IVC block transmits input image data from memory to
the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
output video device for userspace to queue image buffers to. One
noteworthy feature is that - because it is not a part of the main ISP
drive - the IVC driver also registers a subdevice, which connects to
the media device created by the ISP driver through the usual v4l2
async framework. This requires delaying the registration of the video
device until the .registered() callback of the subdevice, so that the
struct v4l2_dev pointer the subdevice connected to can be set to the
video device.

To facilitate communication between the ISP driver and the IVC driver
we use the new media jobs framework that was posted recently [1]. The
series is also based on top of the latest version of the Mali-C55
driver [2] and some updates to rzg2l-cru [3].

Note that this is not quite ready to merge, as there's an outstanding
bug that sometimes causes the driver to hang. The device should fire
two interrupts per frame; once on completion of data transmission and
once on expiration of the blanking period. The second interrupt seems
sometimes not to arrive, and at the moment the problem is worked
around with a timeout in rzv2h_ivc_send_next_buffer(). We're working
on that issue, but because the driver lends helpful context to the
media jobs and mali-c55 series (and is probably otherwise ready for
comment too) I wanted to post it.

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20250519140403.443915-1-dan.scally@ideasonboard.com/T/
[2] https://lore.kernel.org/linux-media/20250519143409.451100-1-dan.scally@ideasonboard.com/T/
[3] https://lore.kernel.org/linux-media/20250506125015.567746-1-dan.scally@ideasonboard.com/T/


Daniel Scally (3):
  dt-bindings: media: Add bindings for the RZ/V2H IVC block
  media: platform: Add Renesas Input Video Control block driver
  MAINTAINERS: Add entry for rzv2h-ivc driver

 .../bindings/media/renesas,rzv2h-ivc.yaml     |  99 +++
 MAINTAINERS                                   |   7 +
 drivers/media/platform/renesas/Kconfig        |   2 +
 drivers/media/platform/renesas/Makefile       |   1 +
 .../media/platform/renesas/rzv2h-ivc/Kconfig  |  11 +
 .../media/platform/renesas/rzv2h-ivc/Makefile |   7 +
 .../renesas/rzv2h-ivc/rzv2h-ivc-dev.c         | 239 ++++++
 .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      | 376 ++++++++++
 .../renesas/rzv2h-ivc/rzv2h-ivc-video.c       | 703 ++++++++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc.h    | 141 ++++
 10 files changed, 1586 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Kconfig
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/Makefile
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
 create mode 100644 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h

-- 
2.34.1


