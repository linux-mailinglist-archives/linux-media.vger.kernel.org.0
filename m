Return-Path: <linux-media+bounces-14217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C4A919F7A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 08:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8DA1F224C2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 06:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C122E40D;
	Thu, 27 Jun 2024 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="obg/KV/j"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8124B5B
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719470592; cv=pass; b=ae92sDfRvZNKIRGQlq4DUJOxrFb86aTesiKSAJ287FpYejwfN8bP2EEFivksOv5aYsYvfV5XRP50TVJYsjYcOQ/+04lJJ6cCnervrZ+i461wkuJXUXWFK040A0hMAsDcEmS8B7cCJQQUvRAqEqZdjQ37eX9uTqjMcAbR9AWoX74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719470592; c=relaxed/simple;
	bh=HBcOt9wXkY1xSgL6wvGFYFEVxiwwbaIlxjmQ1ddKLd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1VuHyviNeUtiDRK1iaYXVqNigk6M7qHCCtc+z14yj21x2w3ev+m/J78SPbrtq5vZveE6qdoMJGtpZQNlQgKrzp22EEd4tNngzeKAsQ02AU3p7WuSVl6JjnynTIJu8/PQRzQCw4C0kEC6L3hvmX0CNpqRiPsoem5Al82Eo7DvR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=obg/KV/j; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W8psv3YB0zyTW;
	Thu, 27 Jun 2024 09:42:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719470580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RmmjpBCSBkxGxteqHbO5caLpLpyTiGV7/9566QL+4Yo=;
	b=obg/KV/jeqPbBWKPbK5IVVTip0+kzI8y0F60wxizoqpH9OxalcuPBtgnvSQOc+m+uVsoAD
	Ag7oH30kWeq9T9ug/GQhAaqZdtYFsAFSek/Nf/SPMnymxQgmi3pLtYX9lPemLd8hYhBNuo
	yxD4tz77++tNZuJRVH/PveiNDYHxh9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719470580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=RmmjpBCSBkxGxteqHbO5caLpLpyTiGV7/9566QL+4Yo=;
	b=VT42OSu4buGFfgTLEgHi5UPCj9f1ZwGmk/UKqp6JSxnHl8tQg7b2o4BZN8O5A3IhrEUOJ0
	ge9ypuBc8cbvwbosFiOKgXvlVb4eaIX6T8WYMsQzs2k3rnbGKafcBOmMM8jisbrma9Ay9Q
	ly4Hts2vgCGKv8j/yz+ZZSHtL1d78xE=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719470580; a=rsa-sha256; cv=none;
	b=r9D2ymCopf/INO5u22RfFPagODboObzstMSh21Uumrk+kWIKuRBAj5xQi6BNgfATcQuPGl
	V1Whcte2WZ9OJ2nxBSrby7WbhOobSctqimPqrM+oi3TVbZUhRgWspcFADLL95h1wLgtvNq
	IT2tY5j+lPVD//iJQT7Wfhq92qaFcCc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E88AB634C94;
	Thu, 27 Jun 2024 09:42:54 +0300 (EEST)
Date: Thu, 27 Jun 2024 06:42:54 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.11] PiSP driver, trivial driver patches
Message-ID: <Zn0J7kQiSzUQsxY-@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a new PR containing the RPi PiSP driver, with a few fairly trivial
driver patches.

Please pull.


The following changes since commit 23558d802a8e950783b956c457c002a612c09c2c:

  media: vivid: fix CREATE_BUFS support in queue_setup() (2024-06-26 17:28:31 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-4-signed

for you to fetch changes up to ec84aa3ac6310438a56d1a6a3f364a5e5bfb48a0:

  media: imx-mipi-csis: Use v4l2_subdev_enable_streams() (2024-06-27 08:53:42 +0300)

----------------------------------------------------------------
V4L2 patches for 6.11

----------------------------------------------------------------
Alain Volmat (3):
      media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs
      media: i2c: gc2145: addition of RAW8 formats support
      media: i2c: gc2145: use CCI_REG16_LE for little-endian registers

Jacopo Mondi (7):
      media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
      media: uapi: Add a pixel format for BGR48 and RGB48
      media: uapi: Add Raspberry Pi PiSP Back End uAPI
      media: uapi: Add meta pixel format for PiSP BE config
      media: uapi: Add PiSP Compressed RAW Bayer formats
      media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
      media: admin-guide: Document the Raspberry Pi PiSP BE

Laurent Pinchart (1):
      media: imx-mipi-csis: Use v4l2_subdev_enable_streams()

Naushir Patuck (1):
      media: raspberrypi: Add support for PiSP BE

 .../admin-guide/media/raspberrypi-pisp-be.dot      |   20 +
 .../admin-guide/media/raspberrypi-pisp-be.rst      |  109 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/raspberrypi,pispbe.yaml         |   63 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-be.rst    |   56 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |   54 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |   74 +
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    4 +
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/gc2145.c                         |   90 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/nxp/imx-mipi-csis.c         |   22 +-
 drivers/media/platform/raspberrypi/Kconfig         |    5 +
 drivers/media/platform/raspberrypi/Makefile        |    3 +
 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   12 +
 .../media/platform/raspberrypi/pisp_be/Makefile    |    6 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 1801 ++++++++++++++++++++
 .../platform/raspberrypi/pisp_be/pisp_be_formats.h |  519 ++++++
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |    2 +-
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   13 +
 .../uapi/linux/media/raspberrypi/pisp_be_config.h  |  927 ++++++++++
 include/uapi/linux/media/raspberrypi/pisp_common.h |  199 +++
 include/uapi/linux/videodev2.h                     |   17 +
 27 files changed, 3986 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
 create mode 100644 drivers/media/platform/raspberrypi/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Kconfig
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/Makefile
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
 create mode 100644 drivers/media/platform/raspberrypi/pisp_be/pisp_be_formats.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
 create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h

-- 
Kind regards,

Sakari Ailus

