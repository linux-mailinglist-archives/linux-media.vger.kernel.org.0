Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1597C249A72
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 12:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgHSKf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 06:35:29 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:38353 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726466AbgHSKfY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 06:35:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8LRAkbdU3uuXO8LRBkgRDC; Wed, 19 Aug 2020 12:35:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597833322; bh=DZtNip5OqMIsU2EqwyRIZjaVXFCAIvSWtEjWXc2JH1o=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pYBPibjtAvuwd8kIUhk9GCJq7V/ojQgpnM7hTFB1gmZGc+YaUtiWRPrCz0Fdu+plj
         6ApautNLp/NMi+fnJe4pIrqS5g/Ur6ZfoVBMbHsBKKVe5sDB2YdMzezBQQ5xJXSp3o
         AKVbs6RVUW/pLD8gftLWZ3MNHAOMq0sxtrg1rTh1L0CA6EsMmFGi6cu5oaebIkYAr0
         +mHCwKd/DcpyvzDY+FXyXrOjgF/PXvnN1N5UEQ4FV1MS+dfCcX3EvOw+lZ9ke4B9Rb
         ZHfXRgTsUKesCnEXCGJFUHXf4aFebn/coF/C6S7Y49jn1a5yOjOpLrlVqFhBeNPi9K
         6yLIclhwIAQug==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Support for Tegra video capture from external
 sensor
Message-ID: <e58bd15a-fb15-efdb-1faa-455f971ab0a8@xs4all.nl>
Date:   Wed, 19 Aug 2020 12:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI4O1nT2kXHa2tbTjufGw31sdajJlWazUVyJKPbcSV9mD0bW8jmgLK5uIlpUufmTbuWw1gXS44Uus0DQgPMjK3b2J7j0zK4/Vf1Cap0FvXdwksmrLva5
 prL4+Hp//T8dvK+XOb1maAYlU4wqg1OZXzzGoDBaTkpFId/JLmg66fj8HrmEmgIOd+SRCUqHth8h4lpWkgYKXVK7o6zt8xYhWexrEi6gTRY/Weh+B+WxES/Q
 R5GLSMTccmt7LzItVdxryP4VP9hJW7tMQJ6KEPJ8QbbDRa4m28L1qQW1HDxVLg7qidg/yr6oKFKAHmvLiAgcWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for external sensors to the Tegra video capture driver.
Tested on my Jetson TX1 board with the imx219 and imx274 sensors.

The tegra patches depend on the new vb2_video_unregister_device helper function,
so the series adding that (plus fixing wrong calls to vb2_queue_release) comes
first in this PR.

Regards,

	Hans

The following changes since commit 9a538b83612c8b5848bf840c2ddcd86dda1c8c76:

  media: venus: core: Add support for opp tables/perf voting (2020-08-18 15:55:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-tegra

for you to fetch changes up to 65f9140b063a493478d9ed8f5d1c0cf7db111332:

  media: tegra-video: Compute settle times based on the clock rate (2020-08-19 12:34:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (7):
      videobuf2-v4l2.c: add vb2_video_unregister_device helper function
      qcom/camss: use vb2_video_unregister_device()
      media/pci: use vb2_video_unregister_device()
      media/platform: drop vb2_queue_release()
      media/usb: use vb2_video_unregister_device()
      media/test-drivers: use vb2_video_unregister_device()
      staging/media: drop vb2_queue_release()

Sowjanya Komatineni (10):
      media: tegra-video: Fix channel format alignment
      media: tegra-video: Enable TPG based on kernel config
      media: tegra-video: Update format lookup to offset based
      dt-bindings: tegra: Update VI and CSI bindings with port info
      media: tegra-video: Separate CSI stream enable and disable implementations
      media: tegra-video: Add support for external sensor capture
      media: tegra-video: Add support for selection ioctl ops
      gpu: host1x: mipi: Keep MIPI clock enabled and mutex locked till calibration done
      media: tegra-video: Add CSI MIPI pads calibration
      media: tegra-video: Compute settle times based on the clock rate

 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt        |  92 +++-
 drivers/gpu/drm/tegra/dsi.c                                            |   4 +-
 drivers/gpu/host1x/mipi.c                                              |  22 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c                        |  51 +-
 drivers/media/pci/dt3155/dt3155.c                                      |   3 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                               |   9 +-
 drivers/media/pci/saa7134/saa7134-core.c                               |   6 +-
 drivers/media/pci/saa7134/saa7134-empress.c                            |   3 +-
 drivers/media/pci/saa7134/saa7134-go7007.c                             |   2 +-
 drivers/media/pci/saa7134/saa7134-video.c                              |   2 -
 drivers/media/pci/sta2x11/sta2x11_vip.c                                |   6 +-
 drivers/media/pci/tw5864/tw5864-video.c                                |   4 +-
 drivers/media/platform/aspeed-video.c                                  |   5 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c                     |   4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c                          |   8 -
 drivers/media/platform/qcom/camss/camss-vfe.h                          |   2 -
 drivers/media/platform/qcom/camss/camss-video.c                        |  12 +-
 drivers/media/platform/qcom/camss/camss-video.h                        |   2 -
 drivers/media/platform/qcom/camss/camss.c                              |   5 -
 drivers/media/platform/qcom/venus/vdec.c                               |   8 +-
 drivers/media/platform/qcom/venus/venc.c                               |   8 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c                     |   1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c                     |   6 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c                   |   7 +-
 drivers/media/test-drivers/vimc/vimc-capture.c                         |   7 +-
 drivers/media/test-drivers/vivid/vivid-core.c                          |  32 +-
 drivers/media/usb/au0828/au0828-video.c                                |  12 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c                               |  13 +-
 drivers/media/usb/usbtv/usbtv-video.c                                  |   4 +-
 drivers/staging/media/meson/vdec/vdec.c                                |   8 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c                          |   2 +-
 drivers/staging/media/rkisp1/rkisp1-params.c                           |   7 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c                            |   8 +-
 drivers/staging/media/tegra-video/Kconfig                              |   7 +
 drivers/staging/media/tegra-video/TODO                                 |   6 -
 drivers/staging/media/tegra-video/csi.c                                | 314 ++++++++++--
 drivers/staging/media/tegra-video/csi.h                                |   8 +
 drivers/staging/media/tegra-video/tegra210.c                           |  25 +-
 drivers/staging/media/tegra-video/vi.c                                 | 848 ++++++++++++++++++++++++++++++---
 drivers/staging/media/tegra-video/vi.h                                 |  25 +-
 drivers/staging/media/tegra-video/video.c                              |  23 +-
 include/linux/host1x.h                                                 |   4 +-
 include/media/videobuf2-v4l2.h                                         |  17 +
 43 files changed, 1369 insertions(+), 273 deletions(-)
