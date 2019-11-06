Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53145F15A6
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 13:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbfKFMCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 07:02:08 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33208 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731225AbfKFMCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 07:02:07 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f1:970a:5c8b:9def:467e:dc3f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CFE3128DC3B;
        Wed,  6 Nov 2019 12:01:58 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-media@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org,
        zhengsq@rock-chips.com, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v9 0/4] Rockchip ISP Driver
Date:   Wed,  6 Nov 2019 09:01:28 -0300
Message-Id: <20191106120132.6876-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm submitting v9 of the Rockchip ISP driver to staging this time.

The main reason is that people are already using it from the mailing
list (including libcamera), and having it mainlined makes the workflow
easier. Also, it is easier for other people to contribute back (with code
or testing the driver).

We plan to actively work on this driver to get it our of staging.

I squashed the patches in a single commit. The previous series
splitted the commits by files, but since they had dependencies
on each other, it was harder to review.

This patchset is also available at:
https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v9

Libcamera patched to work with this version:
https://gitlab.collabora.com/koike/libcamera
(also sent to the mailing list)

Thanks
Helen

Changes in v9:
* dphy
	- Move to staging
	- replace memcpy by a directly assignment
	- remove unecessary ret variable in rockchip_dphy_init
	- s/0x1/1
	- s/0x0/0
	- coding style changes
	- dphy_reg variable sizes
	- variables from int to unsigned int
	- rename functions to start with rk_
	- rename dphy0 to rx
	- fix hardcoded lane0 usage
	- disable rx on power off
	- general cleanups of unused variables
	- Move to staging
	- Previous patch series had a patch for file and the last commit would
	add the Makefile bits to make it compile. But one file was dependent on
	each other, so it doesn't make much sense to have a patch for each file
	and it doesn't make it easier to review.
* capture.c
        - replace v4l2_{dgb,info,warn,err} by dev_*
* isp_stats.c
        - replace v4l2_{dgb,info,warn,err} by dev_*
        - remove LOG_ISR_EXE_TIME ifndef's
        - constify ops structs
        - s/strlcpy/strscpy
        - add missing mutex_destroy() calls in rkisp1_register_stats_vdev error path
* rkisp1.c:
        - replace v4l2_{dgb,info,warn,err} by dev_*
        - fix error returned in link_validate
        - remove s_power() callback
        - add regwrite/regread wrappers
        - add macros RKISP1_DEF_SRC_PAD_FMT/RKISP1_DEF_SINK_PAD_FMT
        - several minor cleanups
        - s/RKISP1_ISP_PAD_SINK([^_])/RKISP1_ISP_PAD_SINK_VIDEO\1/
        - merge tables rkisp1_isp_input_formats and rkisp1_isp_output_formats
        - in_fmt and out_fmt as pointers
        - simply struct rkisp1_isp_subdev to work correctly with try format
        - fix crop/fmt propagation
* dev.h / dev.c / regs.c / regs.h / common.h
        - replace v4l2_{dgb,info,warn,err} by dev_*
        - s/pr_info/dev_dbg
        - s/int size/unsigned int size
        - remove module param rkisp1_debug
        - coding style fixes
        - fix error in subdev_notifier_bound, check dphy before assigning to sensor->dphy
        - remove subdevs fixed size array from rkisp1_pipeline
        - remove sensors list, as it can be identified from the media topology
        - Kconfig: add COMPILE_TEST in the dependency
        - use v4l2_pipeline_pm_use and remove _isp_pipeline_s_power() and _subdev_set_power()
        - remove struct rkisp1_pipeline and retrieve pipeline information from the media framework
        - remove remaining rk3288 code
        - cache pixel rate control in sctruct sensor_async_subdev
        - remove enum rkisp1_sd_type

Please see a more complete history of changes at
https://patchwork.kernel.org/cover/11066499/

Helen Koike (3):
  media: staging: phy-rockchip-dphy: add Rockchip MIPI Synopsys DPHY
    driver
  media: staging: rkisp1: add Rockchip ISP1 driver
  MAINTAINERS: add entry for Rockchip ISP1 driver

Shunqian Zheng (1):
  media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format

 MAINTAINERS                                   |    6 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 drivers/staging/media/Kconfig                 |    4 +
 drivers/staging/media/Makefile                |    2 +
 .../staging/media/phy-rockchip-dphy/Kconfig   |   11 +
 .../staging/media/phy-rockchip-dphy/Makefile  |    2 +
 drivers/staging/media/phy-rockchip-dphy/TODO  |    6 +
 .../phy-rockchip-dphy/phy-rockchip-dphy.c     |  400 ++++
 .../bindings/media/rockchip-isp1.txt          |   71 +
 .../bindings/media/rockchip-mipi-dphy.txt     |   38 +
 .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |   23 +
 .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |   22 +
 drivers/staging/media/rkisp1/Kconfig          |   13 +
 drivers/staging/media/rkisp1/Makefile         |    7 +
 drivers/staging/media/rkisp1/TODO             |   20 +
 drivers/staging/media/rkisp1/capture.c        | 1869 +++++++++++++++++
 drivers/staging/media/rkisp1/capture.h        |  164 ++
 drivers/staging/media/rkisp1/common.h         |   98 +
 drivers/staging/media/rkisp1/dev.c            |  439 ++++
 drivers/staging/media/rkisp1/dev.h            |   67 +
 drivers/staging/media/rkisp1/isp_params.c     | 1604 ++++++++++++++
 drivers/staging/media/rkisp1/isp_params.h     |   50 +
 drivers/staging/media/rkisp1/isp_stats.c      |  494 +++++
 drivers/staging/media/rkisp1/isp_stats.h      |   60 +
 drivers/staging/media/rkisp1/regs.c           |  224 ++
 drivers/staging/media/rkisp1/regs.h           | 1525 ++++++++++++++
 drivers/staging/media/rkisp1/rkisp1.c         | 1246 +++++++++++
 drivers/staging/media/rkisp1/rkisp1.h         |   97 +
 .../staging/media/rkisp1/uapi/rkisp1-config.h |  815 +++++++
 include/uapi/linux/videodev2.h                |    4 +
 30 files changed, 9383 insertions(+)
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Kconfig
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Makefile
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/TODO
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.txt
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/capture.c
 create mode 100644 drivers/staging/media/rkisp1/capture.h
 create mode 100644 drivers/staging/media/rkisp1/common.h
 create mode 100644 drivers/staging/media/rkisp1/dev.c
 create mode 100644 drivers/staging/media/rkisp1/dev.h
 create mode 100644 drivers/staging/media/rkisp1/isp_params.c
 create mode 100644 drivers/staging/media/rkisp1/isp_params.h
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.c
 create mode 100644 drivers/staging/media/rkisp1/isp_stats.h
 create mode 100644 drivers/staging/media/rkisp1/regs.c
 create mode 100644 drivers/staging/media/rkisp1/regs.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.h
 create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h

-- 
2.22.0

