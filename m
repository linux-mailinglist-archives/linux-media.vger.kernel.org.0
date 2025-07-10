Return-Path: <linux-media+bounces-37260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A780AFFB0D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A26656796B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 07:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D27828936E;
	Thu, 10 Jul 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="oW+FMJI0"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684219E7D1
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133054; cv=pass; b=nhh37dCQks9Jo92XtEdg++8nPg4eXEUoL3IhBaG74FBAjDEkIryOPKPJ4tJc4JqAPbctKrKmaFKd3Q2wqCVbXDHEhZvy8RL9CQ19peVi31EIqMfEsmacPdvclYr04lSpxmgebmzPXHeX92dRDMsWOoM21GMRFqHK5/5N2YuSRxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133054; c=relaxed/simple;
	bh=19iBEFQs+MCXDVWpl5Ad7JuL4v4o4H97fGdfGTxIAjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVjkHnaoanxIuZ3ZzO5DMSQP3IWYTIjMLqg+J1MywSKyec/QOmeJc7bLEOaDohcQbNeYdu5lFMyQ+gEimLFDJakeofmxinupJP1UTc2BXQwXlW5akD2xowfdYxxNur5btCKQmVlQiml2qgM+mBqbpGenG68yurZZW5JBp4mYsuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=oW+FMJI0; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bd6BK4074zyQ8;
	Thu, 10 Jul 2025 10:37:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1752133049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rhgu94+0cEQ7CzX3EjJbhbPeHGN60qYyrH6AJHpVlf0=;
	b=oW+FMJI0xGWWuskDqk449EoEfkA397P+ylgP3RLz2zr61P46+HRdGR95nxmCqvKIRhuQZd
	4IgvXsprkUwUxh1u0lkfqUfSpI/rkWFow+Vxjn1YMUlHR+9oEn/eQ4nXBbG7U1oGA71Smt
	If8f6rnZHPyJzSL4Yu9LKM1+1rqkfto=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1752133049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rhgu94+0cEQ7CzX3EjJbhbPeHGN60qYyrH6AJHpVlf0=;
	b=PyeGBz+TcNoGNZL+ui5ByWvpBZ9gYD/HOd/rfzPKS/obb3ueHox/B3s9KDgvtiYpUAsVK4
	LFzsVfLN1oe5h1BwjGqD4keIoQsquumibk33SqV5PaMQ8ABiM/D6WxLVGFYQM9/iHS1hJQ
	zWPD92SWRdeMoDSfj02W4zxrlEFTq+Q=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1752133049; a=rsa-sha256; cv=none;
	b=Cc5YrDqWf3T/y4zG1oKvJgSD1Lw3q/mp0pasjHV/CnozbizvWX/nSU2bH9zf1pqxZpic2s
	1y/8/O8W9f1FnUIBLW7WDrvCVzTImM95cN8Hu2ny3mnb8gRLMDzOyLL1ycCqqPmfgdbWpa
	tHIw3fMm7e1MYpTgPyPu9KHVYksOU1Q=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5CDBF634C93;
	Thu, 10 Jul 2025 10:37:28 +0300 (EEST)
Date: Thu, 10 Jul 2025 07:37:28 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.17] IPU[67], sub-device framework improvements,
 camera sensor driver fixes
Message-ID: <aG9tuMFOnvwXkcE-@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

Here's a small set of fixes for various drivers, including compile fixes
for the IPU7 staging driver from Arnd. Otherwise it's small improvements
here and there, mostly hi556, imx290 and ov2659 sensor and j721e-csi2rx
drivers.

Please pull.


The following changes since commit 3e43442d4994c9e1e202c98129a87e330f7faaed:

  media: vivid: fix wrong pixel_array control size (2025-07-08 09:02:38 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.17-2-signed

for you to fetch changes up to 2ad401b4493081d64975f2e00ef1850aa67434fa:

  media: ivsc: Add MAINTAINERS entry (2025-07-10 10:21:42 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.17

----------------------------------------------------------------
Arnd Bergmann (2):
      media: staging/ipu7: avoid division by 64-bit value
      media: staging/ipu7: add CONFIG_PCI dependency

Bingbu Cao (1):
      media: hi556: correct the test pattern configuration

Devarsh Thakkar (1):
      media: ti: j721e-csi2rx: Allow passing cache hints from user-space

Hans de Goede (3):
      media: hi556: Fix reset GPIO timings
      media: hi556: Support full range of power rails
      media: i2c: Automatically select common options for lens drivers

Julien Massot (1):
      media: ti: j721e-csi2rx: fix list_del corruption

Mehdi Djait (2):
      media: uapi: videodev2: Fix comment for 12-bit packed Bayer formats
      media: v4l2-common: Add the missing Raw Bayer pixel formats

Niklas Söderlund (1):
      media: i2c: imx290: Remove unneeded assignment of subdev device pointer

Sakari Ailus (6):
      media: ipu6: isys: Use correct pads for xlate_streams()
      media: ipu6: isys: Set minimum height to 1
      media: v4l: Make media_entity_to_video_device() NULL-safe
      media: v4l2-subdev: Print early in v4l2_subdev_{enable,disable}_streams()
      media: v4l2-subdev: Add debug prints to v4l2_subdev_collect_streams()
      media: ivsc: Add MAINTAINERS entry

Yemike Abhilash Chandra (2):
      dt-bindings: media: cdns,csi2rx.yaml: Add optional interrupts for cdns-csi2rx
      media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS

Zhang Shurong (1):
      media: ov2659: Fix memory leaks in ov2659_probe()

 .../devicetree/bindings/media/cdns,csi2rx.yaml     |   8 ++
 MAINTAINERS                                        |  10 ++
 drivers/media/i2c/Kconfig                          |  38 ++----
 drivers/media/i2c/hi556.c                          |  73 +++++++-----
 drivers/media/i2c/imx290.c                         |   1 -
 drivers/media/i2c/ov2659.c                         |   3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  12 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |   2 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       | 131 +++++++++++++++++++++
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   2 +
 drivers/media/v4l2-core/v4l2-common.c              |  20 ++++
 drivers/media/v4l2-core/v4l2-subdev.c              |  17 ++-
 drivers/staging/media/ipu7/Kconfig                 |   1 +
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c     |   8 +-
 include/media/v4l2-dev.h                           |  14 ++-
 include/uapi/linux/videodev2.h                     |   2 +-
 16 files changed, 263 insertions(+), 79 deletions(-)

-- 
Kind regards,

Sakari Ailus

