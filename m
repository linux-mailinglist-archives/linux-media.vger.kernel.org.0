Return-Path: <linux-media+bounces-613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174627F1904
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 17:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72739282715
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 16:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373191DDC3;
	Mon, 20 Nov 2023 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907841D52E
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 16:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9FEC433C7;
	Mon, 20 Nov 2023 16:46:24 +0000 (UTC)
Message-ID: <78ee156e-e7e7-4e09-bf59-c2003c03e948@xs4all.nl>
Date: Mon, 20 Nov 2023 17:46:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 jacopo mondi <jacopo@jmondi.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Various small media core patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A bunch of small trvial core patches.

Regards,

	Hans

The following changes since commit 1865913dd590ca6d5e3207b15099a1210dd62f29:

  media: meson-ir-tx: Drop usage of platform_driver_probe() (2023-11-16 13:56:48 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8g

for you to fetch changes up to 5156966b6896441739a6cdceaf57801d7a7c5f4e:

  media: videodev.h: add missing p_hdr10_* pointers (2023-11-20 14:27:42 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Deborah Brouwer (1):
      media: v4l2-mem2mem.h: fix typo in comment

Hans Verkuil (4):
      media: core: v4l2-ioctl: check if ioctl is known to avoid NULL name
      media: drop CONFIG_MEDIA_CONTROLLER_REQUEST_API
      media: videodev2.h: add missing __user to p_h264_pps
      media: videodev.h: add missing p_hdr10_* pointers

Jacopo Mondi (1):
      media: v4l2-common: Add 10bpp RGB formats info

Paul Kocialkowski (1):
      media: v4l2-dev: Check that g/s_selection are valid before selecting crop

 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 8 ++++++++
 drivers/media/common/videobuf2/videobuf2-v4l2.c              | 2 --
 drivers/media/mc/Kconfig                                     | 7 -------
 drivers/media/mc/mc-device.c                                 | 4 ----
 drivers/media/platform/mediatek/vcodec/Kconfig               | 1 -
 drivers/media/platform/nvidia/tegra-vde/Kconfig              | 1 -
 drivers/media/platform/verisilicon/Kconfig                   | 1 -
 drivers/media/test-drivers/Kconfig                           | 1 -
 drivers/media/test-drivers/vicodec/Kconfig                   | 1 -
 drivers/media/test-drivers/visl/Kconfig                      | 1 -
 drivers/media/test-drivers/vivid/Kconfig                     | 1 -
 drivers/media/v4l2-core/v4l2-common.c                        | 3 +++
 drivers/media/v4l2-core/v4l2-dev.c                           | 6 ++++--
 drivers/media/v4l2-core/v4l2-ioctl.c                         | 2 +-
 drivers/staging/media/rkvdec/Kconfig                         | 1 -
 drivers/staging/media/sunxi/cedrus/Kconfig                   | 1 -
 include/media/v4l2-mem2mem.h                                 | 2 +-
 include/uapi/linux/videodev2.h                               | 4 +++-
 18 files changed, 20 insertions(+), 27 deletions(-)

