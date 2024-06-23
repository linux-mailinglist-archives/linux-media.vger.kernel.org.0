Return-Path: <linux-media+bounces-13978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EB913984
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 12:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E452EB21FEA
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 10:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B53F7E0F2;
	Sun, 23 Jun 2024 10:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="cFt9unkR"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C8863D
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719138178; cv=pass; b=DiACDPPzqTLQPF+lj1qgkpLPHZUGVuaJshAYshiy2PBsf+HNilgxW78IzpCCU4sdJUQ9qigvhnMtaBpA5I/M7ZTVByjWBkRuZXIHjypZGyo9eeDuKV/qPR++FUW1AYJsD9sz0n4vv9+Kx49cqKfuVbf0aFCguWfQNjxXdDBDhe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719138178; c=relaxed/simple;
	bh=ijomAiHz3bFkAb8KYPsmyVKcHnhhf7dFaI1B24AXjTU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gscpzY/qhTv8gxl+OjQtWSd5MDIdDSj4UxUqDM9ynzMBd39BFKGnCLenOtw3gol0nDuRL7MtnO1YQDbg2tUKfRs6Y9k+Q0K6ifg8+TpwNxLyybeq8AvX7bnplUbJI6cGoxJT5eTCkzf7s9v7AO+H65PCU7IuKZrnZ3R3ustjBTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=cFt9unkR; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W6RxS47XRzySt
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 13:22:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719138172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=DDutMOUpsMaLM4SfTCg9pcIJdbR2ZYGgP3fleCSrIDQ=;
	b=cFt9unkRv5N+AlXUjeLurvFLR4uRjOZgpfetV2TU8QPVcTC5pFSWg2jqe0GMWwF54ZWQZ3
	ikc8b7ASAKoWdCpu9rSqIVU0miRPZFGVJzCknnGK1LtJPmsuJT+b8EOMHDBUxPE/rVISfC
	c5NB20lXkUEr7mjpCHP1B1eWsyHh8yA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719138172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=DDutMOUpsMaLM4SfTCg9pcIJdbR2ZYGgP3fleCSrIDQ=;
	b=Qe51vem++3JckkSntGqsOzhYngFB5A0u+7XyNqUlXa4KuRDMRfY/VYAEpptbIPxjLgIpQw
	stPf4pys9yEnjZr6BBXkii0wRpTSr0hGmhA7pi6Xcd1bwW41kL6EdJePlEN2NtLGnCRDkG
	1utzZxi09rdDdk0dwixgom+tqTjMykY=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719138172; a=rsa-sha256; cv=none;
	b=uHy+m6oN561GYn4SWZbWczjMTIJU4bbZOdacyAE/DP24YcOg12g0TGAPB0tyD1f5igFWUF
	uMD65vIcrezwDmM1kFgXUFFLFwXj7FxRgdJO/lgw0XDSV+rd/TolCCNzXPRlzqpBdF6PJ7
	rTUxswMqVx2DVjogUKiQIyIMzpX0a3o=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 42ABD634C94
	for <linux-media@vger.kernel.org>; Sun, 23 Jun 2024 13:22:50 +0300 (EEST)
Date: Sun, 23 Jun 2024 10:22:50 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] New drivers
Message-ID: <Znf3erGgLvqxG6Ug@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here's a bunch of patches, mostly new drivers: RPi PiSP BE, GC05A2 and
GC08A3. Also ipu6 documentation fix and MAINTAINERS change are included.

Please pull.


The following changes since commit 7fc65b78b465b8511a503491e7c3116d46dc6c72:

  media: platform: mtk-mdp3: Add support for MT8188 MDP3 components (2024-06-20 11:47:48 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-3-signed

for you to fetch changes up to 25698102a2785b65aebf74b227c31e6f9825655d:

  MAINTAINERS: delete email for Anton Sviridenko (2024-06-23 12:14:44 +0300)

----------------------------------------------------------------
V4L2 patches for 6.11

----------------------------------------------------------------
Jacopo Mondi (7):
      media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
      media: uapi: Add a pixel format for BGR48 and RGB48
      media: uapi: Add Raspberry Pi PiSP Back End uAPI
      media: uapi: Add meta pixel format for PiSP BE config
      media: uapi: Add PiSP Compressed RAW Bayer formats
      media: dt-bindings: Add bindings for Raspberry Pi PiSP Back End
      media: admin-guide: Document the Raspberry Pi PiSP BE

Naushir Patuck (1):
      media: raspberrypi: Add support for PiSP BE

Samuel Wein (1):
      media: Documentation: ipu6: Fix examples in ipu6-isys admin-guide

Wolfram Sang (1):
      MAINTAINERS: delete email for Anton Sviridenko

Zhi Mao (4):
      media: dt-bindings: i2c: add GalaxyCore GC08A3 image sensor
      media: i2c: Add GC08A3 image sensor driver
      media: dt-bindings: i2c: add GalaxyCore GC05A2 image sensor
      media: i2c: Add GC05A2 image sensor driver

 Documentation/admin-guide/media/ipu6-isys.rst      |   14 +-
 .../admin-guide/media/raspberrypi-pisp-be.dot      |   20 +
 .../admin-guide/media/raspberrypi-pisp-be.rst      |  109 ++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/i2c/galaxycore,gc05a2.yaml      |  112 ++
 .../bindings/media/i2c/galaxycore,gc08a3.yaml      |  112 ++
 .../bindings/media/raspberrypi,pispbe.yaml         |   63 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-pisp-be.rst    |   56 +
 .../userspace-api/media/v4l/pixfmt-bayer.rst       |    1 +
 .../userspace-api/media/v4l/pixfmt-rgb.rst         |   54 +
 .../media/v4l/pixfmt-srggb8-pisp-comp.rst          |   74 +
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |    4 +
 MAINTAINERS                                        |   25 +-
 drivers/media/i2c/Kconfig                          |   20 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/gc05a2.c                         | 1359 +++++++++++++++
 drivers/media/i2c/gc08a3.c                         | 1339 +++++++++++++++
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/raspberrypi/Kconfig         |    5 +
 drivers/media/platform/raspberrypi/Makefile        |    3 +
 drivers/media/platform/raspberrypi/pisp_be/Kconfig |   12 +
 .../media/platform/raspberrypi/pisp_be/Makefile    |    6 +
 .../media/platform/raspberrypi/pisp_be/pisp_be.c   | 1809 ++++++++++++++++++++
 .../platform/raspberrypi/pisp_be/pisp_be_formats.h |  519 ++++++
 drivers/media/v4l2-core/v4l2-common.c              |    2 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |   13 +
 .../uapi/linux/media/raspberrypi/pisp_be_config.h  |  927 ++++++++++
 include/uapi/linux/media/raspberrypi/pisp_common.h |  199 +++
 include/uapi/linux/videodev2.h                     |   17 +
 31 files changed, 6871 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.dot
 create mode 100644 Documentation/admin-guide/media/raspberrypi-pisp-be.rst
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc05a2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc08a3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/raspberrypi,pispbe.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst
 create mode 100644 drivers/media/i2c/gc05a2.c
 create mode 100644 drivers/media/i2c/gc08a3.c
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

