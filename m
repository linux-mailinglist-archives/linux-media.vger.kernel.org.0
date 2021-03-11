Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD193370B5
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhCKK7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:59:47 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46659 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232560AbhCKK7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:59:16 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KJ27lPkqXC40pKJ2BlL1GZ; Thu, 11 Mar 2021 11:59:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615460355; bh=Bqs7TriaEaWrfLeX/ub8GmcEUC7LrT6Rgq/TGaxcPlc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rA03dM1s42NBD1KOpqwy1oVzMAYCXAj6CWJOQs1gjVcMLM7lmXPlahdPhCo1uBzTL
         y0eiNLe/EVAlFArz7R69+OHlUoDtKqbrqJ/oZqHEfNI9GafBSIJBATelV7Au6ipdoB
         in2ai0cv4mbIlAGaIOrM/j8mgaXdLDzoAgx6X/xPBB1G+b2XUURVlSjKNdrdp2Z1YN
         nCQmdwYBzO2L0HxTGdi6Db0eDr/BmbcUVNyUl2dx2PUrqSZAozho7cJF8KFrzz+xpZ
         8WI+kyP507Lm8t5wHf0jjKnFVv8VKdaae7sW0C54MQ1WO+gECWnBop0v8bHwDB3Oi8
         tcCtsyi0AdyRA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
Message-ID: <42aa5be6-df5b-09bc-32fb-5be7e8e3932c@xs4all.nl>
Date:   Thu, 11 Mar 2021 11:59:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF40VSE6ebSrQ0ZfGNvxUlucI3fLBsD0RhnDJwhJJ3xdDvxckTpKtInhDk+PjSy9cFO2XPYb/3mUl5/PFm+peoLwjmeIoIece6ky1PpLCacwimUoESZr
 jBea1GvDFwFEY4ukBaIpHYTNfYq7mjzEWldXwmR8GcUHv1XW5BAG+D75WTr6SwMbtdnGEM71/yUK8TQvbgz40GDNp3qIzzS1xgqbb0B9Y23PwvmKkfugtaN0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13g

for you to fetch changes up to e42f7c2624001ad65e9f5405df36f177bb066e6f:

  Add maintainer for IMX jpeg v4l2 driver (2021-03-11 11:52:50 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Mirela Rabulea (7):
      media: v4l: Add packed YUV444 24bpp pixel format
      media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
      media: Add parsing for APP14 data segment in jpeg helpers
      media: Quit parsing stream if doesn't start with SOI
      media: Avoid parsing quantization and huffman tables
      media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
      Add maintainer for IMX jpeg v4l2 driver

 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml  |   84 ++
 Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst |   10 +
 MAINTAINERS                                                 |    8 +
 drivers/media/platform/Kconfig                              |    2 +
 drivers/media/platform/Makefile                             |    1 +
 drivers/media/platform/imx-jpeg/Kconfig                     |   11 +
 drivers/media/platform/imx-jpeg/Makefile                    |    3 +
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c               |  168 ++++
 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h               |  140 +++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c                  | 2125 +++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.h                  |  180 ++++
 drivers/media/v4l2-core/v4l2-ioctl.c                        |    1 +
 drivers/media/v4l2-core/v4l2-jpeg.c                         |   57 +-
 include/media/v4l2-jpeg.h                                   |   20 +
 include/uapi/linux/videodev2.h                              |    1 +
 15 files changed, 2805 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
 create mode 100644 drivers/media/platform/imx-jpeg/Makefile
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
 create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
