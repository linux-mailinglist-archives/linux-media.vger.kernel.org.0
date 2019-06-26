Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A560756389
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 09:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfFZHo1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 03:44:27 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33505 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726076AbfFZHo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 03:44:27 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id g2bNh3RUP7KeZg2bQhhHnQ; Wed, 26 Jun 2019 09:44:25 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/16] media/platform: set device_caps in struct video_device
Date:   Wed, 26 Jun 2019 09:44:05 +0200
Message-Id: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIj3dZgglss+tf4PXeuCKB+HXvyTYrUKj32m1X7tI6K/ziBELb3FaqsxZxhj9nnBA9jyIwHOfHA95IwCaWb+b4cHtz/EakH0fDudTLunc/74bVfrF/mB
 BTuJt9wQXQHQXS4sv2zWxs6y5YWxHPbesfZcPLweMyN0bp5KXkxqddGXZtekGh/RkLpMWhFaU1kEOw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so convert
all platform drivers in this patch series.

Hans Verkuil (16):
  am437x/davinci: set device_caps in struct video_device
  coda: set device_caps in struct video_device
  s3c-camif/s5p-g2d/s5p-jpeg: set device_caps in struct video_device
  fsl-viu: set device_caps in struct video_device
  m2m-deinterlace: set device_caps in struct video_device
  mx2_emmaprp: set device_caps in struct video_device
  marvell-ccic: set device_caps in struct video_device
  pxa_camera: set device_caps in struct video_device
  bdisp: set device_caps in struct video_device
  via-camera: set device_caps in struct video_device
  xilinx: set device_caps in struct video_device
  sh_veu/sh_vou: set device_caps in struct video_device
  vsp1: set device_caps in struct video_device
  omap_vout: set device_caps in struct video_device
  ti-vpe: set device_caps in struct video_device
  omap3isp: set device_caps in struct video_device

 drivers/media/platform/am437x/am437x-vpfe.c      |  6 ++----
 drivers/media/platform/coda/coda-common.c        |  4 +---
 drivers/media/platform/davinci/vpbe_display.c    |  3 +--
 drivers/media/platform/davinci/vpfe_capture.c    |  3 +--
 drivers/media/platform/davinci/vpif_capture.c    |  3 +--
 drivers/media/platform/davinci/vpif_display.c    |  3 +--
 drivers/media/platform/fsl-viu.c                 |  7 ++-----
 drivers/media/platform/m2m-deinterlace.c         | 10 +---------
 drivers/media/platform/marvell-ccic/mcam-core.c  |  5 ++---
 drivers/media/platform/mx2_emmaprp.c             |  3 +--
 drivers/media/platform/omap/omap_vout.c          |  6 ++----
 drivers/media/platform/omap3isp/ispvideo.c       | 13 +++++++------
 drivers/media/platform/pxa_camera.c              |  3 ---
 drivers/media/platform/s3c-camif/camif-capture.c |  5 +----
 drivers/media/platform/s5p-g2d/g2d.c             |  3 +--
 drivers/media/platform/s5p-jpeg/jpeg-core.c      |  4 ++--
 drivers/media/platform/sh_veu.c                  |  4 +---
 drivers/media/platform/sh_vou.c                  |  5 ++---
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c    |  6 +-----
 drivers/media/platform/ti-vpe/cal.c              |  5 ++---
 drivers/media/platform/via-camera.c              |  5 ++---
 drivers/media/platform/vsp1/vsp1_histo.c         |  3 +--
 drivers/media/platform/vsp1/vsp1_video.c         | 12 ++++--------
 drivers/media/platform/xilinx/xilinx-dma.c       | 16 +++++++---------
 24 files changed, 46 insertions(+), 91 deletions(-)

-- 
2.20.1

