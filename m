Return-Path: <linux-media+bounces-785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7F7F44F3
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 12:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04291B21097
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3755647B;
	Wed, 22 Nov 2023 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AF451035
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 11:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B68C433C7;
	Wed, 22 Nov 2023 11:34:01 +0000 (UTC)
Message-ID: <7dd00bf5-689d-4b98-a050-d183ebd494ec@xs4all.nl>
Date: Wed, 22 Nov 2023 12:33:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Marvin Lin <kflin@nuvoton.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Zheng Wang <zyytlz.wz@163.com>, Ken Lin <ken_lin5@hotmail.com>,
 Rob Herring <robh+dt@kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Various fixes and enhancements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3c9202e88ffad78f57a418bace2d25f7824a7e4b:

  media: ivsc: csi: Check number of lanes on source, too (2023-11-22 10:56:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8h

for you to fetch changes up to dc0c03b537ab01be8083a282900078c3c369b968:

  media: platform: cros-ec: Add Dexi to the match table (2023-11-22 12:08:54 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: vde: Use struct_size()

Dan Carpenter (1):
      media: qcom: camss: clean up a check

Hans Verkuil (1):
      media: ivtv: don't call s_stream(0) if not streaming

Ken Lin (1):
      media: platform: cros-ec: Add Dexi to the match table

Marvin Lin (1):
      media: nuvoton: npcm-video: Fix sleeping in atomic context

Paul Kocialkowski (1):
      media: cedrus: Update TODO with future rework plans

Ricardo B. Marliere (1):
      media: pvrusb2: fix use after free on context disconnection

Rob Herring (1):
      media: stm32-dcmi: Drop unnecessary of_match_device() call

Uwe Kleine-König (1):
      staging: media: tegra-video: Convert to platform remove callback returning void

Zheng Wang (3):
      media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the crash of multi-core JPEG devices
      media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
      media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c     |  2 ++
 drivers/media/pci/ivtv/ivtv-driver.h                 |  1 +
 drivers/media/pci/ivtv/ivtv-streams.c                |  4 +++-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 13 ++++++-------
 drivers/media/platform/nuvoton/npcm-video.c          | 30 +++++++++++++-----------------
 drivers/media/platform/nvidia/tegra-vde/v4l2.c       |  2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c      |  2 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c         |  8 --------
 drivers/media/usb/pvrusb2/pvrusb2-context.c          |  3 ++-
 drivers/staging/media/sunxi/cedrus/TODO              | 23 ++++++++++++++++-------
 drivers/staging/media/tegra-video/csi.c              |  6 ++----
 drivers/staging/media/tegra-video/vi.c               |  6 ++----
 drivers/staging/media/tegra-video/vip.c              |  6 ++----
 13 files changed, 51 insertions(+), 55 deletions(-)

