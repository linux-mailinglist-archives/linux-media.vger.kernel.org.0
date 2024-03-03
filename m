Return-Path: <linux-media+bounces-6297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D786F5D0
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15B41F22B3C
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CD467C4E;
	Sun,  3 Mar 2024 15:27:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B7B67A19
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479632; cv=none; b=ejQPvBu5atP7y0QLvWnV386cMioG+EgHMlDpglpJWaMPX1squ4/gynrW6Ou/Q67UzmUaZJdGuIMFVoejFo0nIBcdgVQJEFSr5HDMQ4f1eIUrcezArckTdYrbIMw/HieO8OBl5AVihsy1pygtlKWKicslJOWtKIrpWEkWIrUCVL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479632; c=relaxed/simple;
	bh=OGhdpW6OcJjwHh5QITNmyo1TrTirXVsBVYaeSrASBn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IVD6qZFeJZjB5WHsTBX8nxQnk4uaXNYAelXK+fSXEdDUMUDhJWHmjNSqNTjWohmLkINt5UXgfHuRlJA+PBt9xOYYkJN8MJ+m0okQLXJFatmnI9yEpLbQHwQi7Z0YEn1vTaGmRrhw+Sl5Ku9Z6J6AXcji84cEwi2pBWyegoZAIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id 80F154C074;
	Sun,  3 Mar 2024 16:26:59 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 00/13] bcm2835-codec: driver for HW codecs
Date: Sun,  3 Mar 2024 16:09:55 +0100
Message-ID: <20240303152635.2762696-1-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches add a bcm2835-codec driver in order to use the hw codecs.
This makes eg playing a h264 1080p movie playable with some cpu cycles
to spare, instead of dropping frames and 100% cpu usage.

I tested with ffmpeg encode and decode, and I'm using it on my RPI4
mediabox.

I cherry-picked some patches from the rpi kernel and put these on top of
Umang's git tree (to have bcm2835-isp driver) and then rebased the whole
thing to media_stage and then squashed it a bit to these 13 patches.

The reason I put this on top of Umang's patches for bcm2835-isp is
because of common dependencies.

I know that this will not be accepted until the vchiq is unstaged, but
I'd like some comments on these patches in order to have this accepted
faster after vchiq is unstaged.

Umang's git tree I based it on: https://git.uk.ideasonboard.com/uajain/linux/src/branch/uajain/rpi4/staging-next/isp

I pushed my work on github if anyone wishes to try it out: https://github.com/alien999999999/linux/tree/rpi4-codec/media_stage/v1

Thanks in advance for any comment,

Maarten Vanraes (AL13N on #linux-media )


Dave Stevenson (11):
  staging: mmal-vchiq: Avoid use of bool in structures
  staging: mmal-vchiq: Update mmal_parameters.h with recently defined
    params
  staging: mmal-vchiq: Fix memory leak in error path
  media: videodev2.h: Add a format for column YUV4:2:0 modes
  staging/vchiq-mmal: Add buffer flags for interlaced video
  staging/vchiq-mmal: Add parameters for interlaced video support
  staging/vchiq-mmal: Add the deinterlace image effects enums
  staging/mmal-vchiq: Rationalise included headers
  staging: mmal-vchiq: Reset buffers_with_vpu on port_enable
  vc04_services: vchiq-mmal: Add defines for mmal_es_format flags
  staging: vc04_services: Add a V4L2 M2M codec driver

Phil Elwell (1):
  staging: vchiq_arm: Add 36-bit address support

detule (1):
  staging: vchiq_arm: Usa a DMA pool for small bulks

 .../media/v4l/pixfmt-nv12-col128.rst          |  215 +
 .../media/v4l/pixfmt-yuv-planar.rst           |   12 +
 .../userspace-api/media/v4l/yuv-formats.rst   |   19 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 drivers/staging/vc04_services/Kconfig         |    2 +
 drivers/staging/vc04_services/Makefile        |    2 +
 .../vc04_services/bcm2835-codec/Kconfig       |   11 +
 .../vc04_services/bcm2835-codec/Makefile      |    5 +
 .../bcm2835-codec/bcm2835-v4l2-codec.c        | 3973 +++++++++++++++++
 .../interface/vchiq_arm/vchiq_arm.c           |  147 +-
 .../vchiq-mmal/mmal-msg-format.h              |   10 +
 .../vc04_services/vchiq-mmal/mmal-msg.h       |   19 +
 .../vchiq-mmal/mmal-parameters.h              |   86 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |   40 +-
 include/uapi/linux/videodev2.h                |    4 +
 15 files changed, 4509 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-nv12-col128.rst
 create mode 100644 drivers/staging/vc04_services/bcm2835-codec/Kconfig
 create mode 100644 drivers/staging/vc04_services/bcm2835-codec/Makefile
 create mode 100644 drivers/staging/vc04_services/bcm2835-codec/bcm2835-v4l2-codec.c

-- 
2.41.0


