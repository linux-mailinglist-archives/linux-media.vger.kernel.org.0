Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7E6EF7B5
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 10:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730499AbfKEJEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 04:04:04 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39767 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727925AbfKEJEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 04:04:04 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id RuknigAgA9P9bRukqiZ5jJ; Tue, 05 Nov 2019 10:04:00 +0100
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes and enhancements
Message-ID: <6020f449-5ab8-87a6-ff0b-6607da4796eb@xs4all.nl>
Date:   Tue, 5 Nov 2019 10:03:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIvCU6nalR2F0koxbU54OjJl7v5q+WmUlQXcNt5D4xUd5jUXFQfryrXiNwyOwzAMSYGZPdSUajTBVG/87WRC9Wm3msaFmNIG8kcF61NDobvzWT/n5I3H
 L91yJ8WcN+KqShDrVg+XhMOfh6KgV7zJy+iC8FOehyW7yOCivOeeL/trMrqG7eIiX6i2Az1FaMvOY9lnEGV1IxGWgh3qPv5+qIIKhKx8QXr607rfXpjMI+tm
 tv39O4bhFMjiTnigEvdWEQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes most of the smatch warnings/errors (one remaining smiapp
warning goes in via a PR from Sakari).

Also some improvements for handling default compound control values in the
control framework from Ricardo.

Regards,

	Hans

The following changes since commit a4260ea49547aa0c84c353f9de5998a0315d89fe:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 19:07:59 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5p

for you to fetch changes up to a9cd173233e5cbeb9f23a701c859a1776de08784:

  v4l2-device.h: fix typo: putss -> puts (2019-11-05 09:38:34 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexander Popov (1):
      media: vivid: Fix wrong locking that causes race conditions on streaming stop

Colin Ian King (1):
      media: siano: fix spelling mistake "ENBALE" -> "ENABLE"

Hans Verkuil (10):
      vivid: media_device_cleanup was called too early
      am437x: fix smatch warning
      mtk-vpu: fix two smatch warnings
      rc/ite-cir: fix smatch warning
      em28xx: fix two smatch warnings
      ti-vpe: fix smatch error
      ov6650: fix smatch warning
      mantis: fix two smatch errors
      vivid: add vivid_create_queue() helper
      v4l2-device.h: fix typo: putss -> puts

Nícolas F. R. A. Prado (1):
      media: vimc: Make capture devices and subdevices use different link_validates

Ricardo Ribalda Delgado (6):
      media: v4l2_ctrl: Add p_def to v4l2_ctrl_config
      media: v4l2_ctrl: Add const pointer to ctrl_ptr
      media: vivid: Add an area control
      media: v4l2_core: Add p_area to struct v4l2_ext_control
      Documentation: v42l_core: v4l2_ext_control
      media: v4l2-ctrl: Use p_const when possible

Seung-Woo Kim (1):
      media: exynos4-is: fix wrong mdev and v4l2 dev order in error path

 Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst |   5 +
 drivers/media/common/siano/smscoreapi.c             |   4 +-
 drivers/media/common/siano/smscoreapi.h             |   4 +-
 drivers/media/i2c/ov6650.c                          |   2 +-
 drivers/media/pci/mantis/hopper_cards.c             |   4 +-
 drivers/media/pci/mantis/mantis_cards.c             |   4 +-
 drivers/media/platform/am437x/am437x-vpfe.c         |   1 -
 drivers/media/platform/exynos4-is/media-dev.c       |   7 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c            |   4 +-
 drivers/media/platform/ti-vpe/vpdma.c               |   2 +-
 drivers/media/platform/vimc/vimc-capture.c          |   2 +-
 drivers/media/platform/vimc/vimc-common.c           |  85 ++++++++--------
 drivers/media/platform/vimc/vimc-common.h           |   4 +-
 drivers/media/platform/vivid/vivid-cec.c            |   7 +-
 drivers/media/platform/vivid/vivid-core.c           | 261 +++++++++++++++++++++---------------------------
 drivers/media/platform/vivid/vivid-core.h           |   1 +
 drivers/media/platform/vivid/vivid-ctrls.c          |  14 +++
 drivers/media/platform/vivid/vivid-kthread-cap.c    |   8 +-
 drivers/media/platform/vivid/vivid-kthread-out.c    |   8 +-
 drivers/media/platform/vivid/vivid-sdr-cap.c        |   8 +-
 drivers/media/rc/ite-cir.c                          |   2 +-
 drivers/media/usb/em28xx/em28xx-i2c.c               |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                |  19 ++--
 include/media/v4l2-ctrls.h                          |   4 +
 include/media/v4l2-device.h                         |   2 +-
 include/uapi/linux/videodev2.h                      |   1 +
 26 files changed, 232 insertions(+), 235 deletions(-)
