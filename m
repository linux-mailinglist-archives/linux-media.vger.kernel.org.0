Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70111359CD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 14:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbgAINMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 08:12:53 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:56285 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728974AbgAINMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 08:12:53 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pXcFiRQzjrNgypXcIiTGQU; Thu, 09 Jan 2020 14:12:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578575571; bh=/NcfvUIWpFOomq8EuYr8jHBpfC+kE1s+YpLlYLhNpZk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GvW/JmAeBcS1QWk5+0wqxG24VOJsN5zouCuoXF4qf7i464Q+vPy2/LXLAuN4Ul+4V
         s6WXtg3HRCBJcli+P1iDDj7DcLDyO5+fOYi3D3ptjUsOa9D7mCVXw+lO5S8FM3+jkg
         3ql6z+bHdE4nSynLcpdYSWL8zYIU1DZdGGXEWjWNDN8S7pUl6CTvZsYUVLE2VV6h2Z
         5R42pt0/4DW8Mzl5GELgJb801nUUnHxDJfcGRWw+xO4+eW0EOnj3itM5e9hhZVpuqB
         +63LCjLvp5utxd3MGRpzHIEStVl6qfgyazmE9qtDPaZTOKv8tt5RHvKSyvB3QxAj/g
         ugEgWJg7lVGjA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Add Rockchip ISP Driver to staging/media
Message-ID: <db88364e-af39-86c3-e969-c9d995f7c5f2@xs4all.nl>
Date:   Thu, 9 Jan 2020 14:12:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI0l5ck2oY6bmVnIFEoygkjVWhATRdrqjjOwM1vo+oUu35n3kEW9bV7cz3mMciMUi7hLCfeHFO1NOW+3U1GJhrXYBqKTLILUw7CkvGaAKk8/KIDvVjfY
 dgVu1Jn4iX/1Uhb3JJ8K/H8ZhO/T3H/8Pleahq0tk7ctQh8rdQam/vTlVCFTayAWm/vfxMLdRg0fQ6Jgfay91bb9bdnpDapNbw90oE3oQaKS4nxkwF+gz1vn
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e6111647934562849ba052052ffbc673b935a9fe:

  media: cec: remove unused functions (2020-01-08 14:38:06 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-rkisp1

for you to fetch changes up to 9ee355be846a591746d150e090559c5f5774c2ef:

  MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 13:20:51 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: staging: phy-rockchip-dphy-rx0: add Rockchip MIPI Synopsys DPHY RX0 driver

Helen Koike (6):
      media: staging: rkisp1: add Rockchip ISP1 base driver
      media: staging: rkisp1: add streaming paths
      media: staging: dt-bindings: add Rockchip ISP1 yaml bindings
      media: staging: dt-bindings: add Rockchip MIPI RX D-PHY RX0 yaml bindings
      media: staging: rkisp1: add TODO file for staging
      MAINTAINERS: add entry for Rockchip ISP1 driver

Jacob Chen (3):
      media: staging: rkisp1: add capture device for statistics
      media: staging: rkisp1: add output device for parameters
      media: staging: rkisp1: add document for rkisp1 meta buffer format

Jeffy Chen (1):
      media: staging: rkisp1: add user space ABI definitions

 MAINTAINERS                                                          |    6 +
 drivers/staging/media/Kconfig                                        |    4 +
 drivers/staging/media/Makefile                                       |    2 +
 .../devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml              |   76 ++
 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig                  |   13 +
 drivers/staging/media/phy-rockchip-dphy-rx0/Makefile                 |    2 +
 drivers/staging/media/phy-rockchip-dphy-rx0/TODO                     |    6 +
 drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c  |  388 +++++++
 .../Documentation/devicetree/bindings/media/rockchip-isp1.yaml       |  192 ++++
 .../Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst       |   23 +
 .../rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst  |   22 +
 drivers/staging/media/rkisp1/Kconfig                                 |   17 +
 drivers/staging/media/rkisp1/Makefile                                |    8 +
 drivers/staging/media/rkisp1/TODO                                    |   23 +
 drivers/staging/media/rkisp1/rkisp1-capture.c                        | 1437 ++++++++++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-common.c                         |   37 +
 drivers/staging/media/rkisp1/rkisp1-common.h                         |  337 ++++++
 drivers/staging/media/rkisp1/rkisp1-dev.c                            |  574 +++++++++++
 drivers/staging/media/rkisp1/rkisp1-isp.c                            | 1164 +++++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-params.c                         | 1630 ++++++++++++++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-regs.h                           | 1264 +++++++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-resizer.c                        |  775 ++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-stats.c                          |  530 ++++++++++
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h                    |  819 +++++++++++++++
 24 files changed, 9349 insertions(+)
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy-rx0.yaml
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/Makefile
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/TODO
 create mode 100644 drivers/staging/media/phy-rockchip-dphy-rx0/phy-rockchip-dphy-rx0.c
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-capture.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-dev.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-isp.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-params.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-regs.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-resizer.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-stats.c
 create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h
