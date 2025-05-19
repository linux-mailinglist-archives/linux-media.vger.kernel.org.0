Return-Path: <linux-media+bounces-32794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD0EABC041
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEA51B623D8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A832820CF;
	Mon, 19 May 2025 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qsQdoOhC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA2126AA8F
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663491; cv=none; b=ZgD/7cPhhFBn8WGKpnjUDKLifFQR1jXsFWPUyC6w85QNZS1f3pB+Khyua4SzPb+a8jTssgNXzfYPqi+mqcsKtsJe5B96xsXy8Ube/XzyyDsd88n0RsS6hRuECEfFiGidgJkfeIwYAl5cAyp1ZQ/ERMQeU0tZ37muHLA+D924WV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663491; c=relaxed/simple;
	bh=lXyS5vtLfykh7JtDXfnz6SMXnPHK0twiXY+bkQQMJBY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZdTPq4DzQl31DsRm+52Lea88DW292jSdTyBujBV+uY68Zf90UToKrvmxwcbkVQRg8xaNwo2PNy4Z0XUveGQXDu8X3C1aNSbRTRxrm6KgCTF+XaKyCfMrlrS/KZkGiic05FKeukjGTvemroeSY5cG1q+86BahN3i2+9sPrqAd4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qsQdoOhC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E06E83D;
	Mon, 19 May 2025 16:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747663467;
	bh=lXyS5vtLfykh7JtDXfnz6SMXnPHK0twiXY+bkQQMJBY=;
	h=From:To:Cc:Subject:Date:From;
	b=qsQdoOhCOdI3FbPXcVoALL11ReJ0xyLpq+B8hJJ2vyXWZzwf+dHCHAhXiY0Ou/pSe
	 JX68OHGtgZbXnxOU93znYGa3JiVuOdahnNTdShE2Rw9AiL6FuAWhMIte4/Dn7fl4E9
	 iD1AEmTIc3Pufqc1XIYlC+dI5/MT7uktHd/ROlL0=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/3] Add media jobs framework
Date: Mon, 19 May 2025 15:04:00 +0100
Message-Id: <20250519140403.443915-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all

This series adds a new API to the media controller framework, which
I'm calling "media jobs". The framework is intended to facilitate
communication between separate drivers which need to work together
to fully operate a media pipeline. For example, the need for the
framework arose when writing support for the ISP in the RZ/V2H; the
ISP is fed by a DMA engine which is not part of the same IP block,
and so is driven by its own driver (though sharing a media graph).
The ISP driver needs to be able to communicate with the DMA engine
driver to instruct it to push the next frame. Because the DMA engine
might be different on a different platform that used the ISP, direct
calls into functions exported by the DMA engine driver wouldn't be
scalable, and so this driver agnostic route was adopted. The
framework allows drivers to define the steps that need to be taken
(for example writing configuration data, reading statistics data,
writing buffer addresses and triggering data transmission) to complete
a "job" (of which the only current example is the processing of a
frame of data through the pipeline, though I expect that other use
cases could become apparent too) and to then schedule them into a
work queue once driver definable dependencies have been met. The
dependencies might, for example, be the queuing of buffers to V4L2
capture / output devices.

The framework allows precise definition of the ordering of the steps
regardless of the order in which the drivers populate the jobs. Steps
can be flagged as being placed at a particular position from the front
or back of the queue (I.E. last, or third from last) or as requiring
no particular order. This would allow the construction of a job like:

Step 0 (ISP Driver): Program the hardware with parameters
Step 1 to N-1 (Both drivers): Program the hardware with buffers
Step N (DMA Engine Driver): Send a frame of data to the ISP
... ISP processes data ...
Step N + 1 (ISP Driver): Read out statistics data from the last frame

The mali-c55 ISP driver and the DMA engine feeding it on the RZ/V2H
(called the rzv2h-ivc driver) both use the framework, and will be
posted shortly after this series with references back to it. I will
reply to this message with links to those series for convenience.

The first patch in this set is not strictly part of the framework,
but also facilitates multiple drivers with V4L2 Video Devices
sharing a single media graph. We have a requirement to delay the
start of streaming until all of a pipeline's video devices have had
their .start_streaming() operations called; these new entity ops
provide a mechanism through which each driver can inform the other
that the last video device in the pipeline has now been started.

Thanks
Dan

Daniel Scally (3):
  media: mc: entity: Add pipeline_started/stopped ops
  media: mc: Add media jobs framework
  media: Documentation: Add documentation for media jobs

 Documentation/driver-api/media/mc-core.rst | 154 +++++++
 drivers/media/mc/Makefile                  |   2 +-
 drivers/media/mc/mc-entity.c               |  45 +++
 drivers/media/mc/mc-jobs.c                 | 446 +++++++++++++++++++++
 include/media/media-entity.h               |  24 ++
 include/media/media-jobs.h                 | 354 ++++++++++++++++
 6 files changed, 1024 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/mc/mc-jobs.c
 create mode 100644 include/media/media-jobs.h

-- 
2.34.1


