Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D878F1ABE76
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 12:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505628AbgDPKuX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 06:50:23 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41353 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505547AbgDPKty (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 06:49:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id P25YjcGoR7xncP25bj7MPI; Thu, 16 Apr 2020 12:49:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587034188; bh=boBh7/sNATu/tXrp65Y74oibJy1A6GIGH5IFK8uomHs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=g509MseQHO6qnShgMJi9UqjHDXQfmbfonwOVwDPy4ceYxmHcdCaTaMHCMUVjuHHux
         C/T0GzOTNaKKN+bcK8xnSflIXR8LAv/NpbAYpyFvCiIAEzHwsaJsXMmDovfMLLQbFn
         64Tin+1Wp/85JfpANnrofsfY7OvnVGq6BaWWU/3z6Nme+tdC632jTzjnhfwHq65GuC
         GqAmxgbO0p85lkrRKYj8Q8MKqmbKaXIVVcC1/UXtus35bbmv6fGK1Mh2HYOc3KEZBC
         Li1vx61Vo5R8mipfwQ93Hi2W9NQFNv86D7CrEnNO4DhBcNPX1qBzQOqNID9jyGGpvy
         HoXBSjJhd8WgQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Various fixes/enhancements (mostly imx/rkisp1)
Message-ID: <1fe4c654-1b2f-8d26-dd35-95031ccb713d@xs4all.nl>
Date:   Thu, 16 Apr 2020 12:49:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMVYv0h0cB1DrTIrtAtvKFpMn+xk5u3MTGvLjehu8PtrnStnKzXCjQbThSIYVDGC6k2yPo3WIA6ipkSCpRsUu0nKym1mLe+E9vR/4wEHY4ix7hIH+ufV
 vtRaaqJOIu3IDUB9aSSh7M2y98pnfFUjlyFuonKw29594k4b32zTYa58xwUsx8KzAND2t7AlY7rhf8nINe+sD/Os8RIBQFJjC+aewExKHjM+LkG44tKBP6Xy
 /72q4mSdDjM83yAhV+t+XrqS56znzovRCBluypLwWuGeZldWL/VCev0l+oL5EzZvK9VcMl4tC4xtKdo4AfqnLSOx9nO9RFhY9JMoK2HnHodLoNG4xGGUsI3Y
 HGTqZdsB
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit dacca5f0fa69f04c2e70aad9847e8250b459971c:

  media: media/test_drivers: rename to test-drivers (2020-04-16 10:38:31 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8a

for you to fetch changes up to 0ccb49f101be6e9e2ae36d4b424ed25d5010deb1:

  media: v4l2-fh: define v4l2_fh struct regardless of condition (2020-04-16 12:08:50 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (3):
      media: davinci: remove redundant assignment to pointer 'common'
      media: pwc-ctl: remove redundant assignment to variable ret
      media: gspca: remove redundant assignment to variable status

Dafna Hirschfeld (4):
      media: staging: rkisp1: remove TODO item - uapi structs compatibility
      media: staging: rkisp1: replace rkisp1_fmt_pix_type with v4l2_pixel_encoding
      media: staging: rkisp1: cap: remove field fmt_type from struct rkisp1_capture_fmt_cfg
      media: staging: rkisp1: change fields names from fmt_type to pixel_enc

Dan Carpenter (1):
      media: vicodec: Fix error codes in probe function

Ezequiel Garcia (3):
      rkisp1: Get rid of unused variable warning
      phy-rockchip-dphy-rx0: Drop unneeded CONFIG_OF dependency
      rkisp1: Fix wrong PHY config dependency

Fabio Estevam (5):
      media: imx-media-csc-scaler: Use a shorter name for driver
      media: imx.rst: Fix the MIPI CSI-2 virtual channel
      media: imx.rst: Provide an example for unprocessed video capture
      media: imx.rst: Provide the OV560 module part number
      media: imx.rst: Provide streaming examples for imx6q-sabresd

Hsin-Yi Wang (1):
      media: mtk-mdp: Use correct aliases name

Kieran Bingham (1):
      media: platform: fcp: Set appropriate DMA parameters

Laurent Pinchart (5):
      media: imx: utils: Inline init_mbus_colorimetry() in its caller
      media: imx: utils: Handle Bayer format lookup through a selection flag
      media: imx: utils: Make imx_media_pixfmt handle variable number of codes
      media: imx: utils: Rename format lookup and enumeration functions
      media: imx: utils: Constify some mbus and ipu_image arguments

Maheshwar Ajja (2):
      media: v4l2-ctrl: Add H264 profile and levels
      media: uapi: h264: Add new profile and levels

Philipp Zabel (2):
      media: imx: utils: fix and simplify pixel format enumeration
      media: imx: utils: fix media bus format enumeration

Seungchul Kim (1):
      media: v4l2-fh: define v4l2_fh struct regardless of condition

Steve Longerbeam (4):
      media: imx: Fix some pixel format selections
      media: imx: utils: Rename pixel format selection enumeration
      media: imx: utils: Introduce PIXFMT_SEL_IPU
      media: imx: utils: Split find|enum_format into fourcc and mbus functions

 Documentation/admin-guide/media/imx.rst                   |  96 ++++++--
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst |  10 +
 drivers/media/platform/davinci/vpif_display.c             |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c             |   8 +-
 drivers/media/platform/rcar-fcp.c                         |   5 +
 drivers/media/test-drivers/vicodec/vicodec-core.c         |  15 +-
 drivers/media/usb/gspca/mr97310a.c                        |   1 -
 drivers/media/usb/pwc/pwc-ctrl.c                          |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                      |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c                      |   2 -
 drivers/staging/media/imx/imx-ic-prp.c                    |  15 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c               |  14 +-
 drivers/staging/media/imx/imx-media-capture.c             |  42 ++--
 drivers/staging/media/imx/imx-media-csc-scaler.c          |  13 +-
 drivers/staging/media/imx/imx-media-csi.c                 |  42 ++--
 drivers/staging/media/imx/imx-media-utils.c               | 518 ++++++++++++++++++-------------------------
 drivers/staging/media/imx/imx-media-vdic.c                |  12 +-
 drivers/staging/media/imx/imx-media.h                     |  57 +++--
 drivers/staging/media/imx/imx7-media-csi.c                |  17 +-
 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig       |   2 +-
 drivers/staging/media/rkisp1/Kconfig                      |   2 +-
 drivers/staging/media/rkisp1/TODO                         |   3 -
 drivers/staging/media/rkisp1/rkisp1-capture.c             |  51 +----
 drivers/staging/media/rkisp1/rkisp1-common.h              |  11 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c                 |   8 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c                 |  42 ++--
 drivers/staging/media/rkisp1/rkisp1-resizer.c             |  12 +-
 include/media/v4l2-fh.h                                   |   2 -
 include/uapi/linux/v4l2-controls.h                        |   5 +
 29 files changed, 496 insertions(+), 517 deletions(-)
