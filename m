Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041D239A0BD
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 14:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhFCMZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 08:25:29 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47529 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229747AbhFCMZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 08:25:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id omNwlbsteIpGyomNzlRcyj; Thu, 03 Jun 2021 14:23:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622723023; bh=pTIIsyeMEAQbauAkVJezIlR1z+E9AnKet34lgkeI5aI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kkrWIYtV9ypq0QorXtRgQlLCzOBXJr77eCempf1HS1fy+lYiuyPuvSZ/v805DXhQI
         PRMQErvZc7zHlaXdhAJTjlwQChw4TGGyEWc93zb1Pm6spHmat2NzCuN9iQpZbv6OCg
         /6hvPT1N34XaiNvkWXku7mzGbXXTlHDVEd0s0kLR4B+vYRZgq5Mf5hxH+T9zNfrbDK
         CRSvxpRn+joxZxkjLYabVAH+GwxgRjlQNbfS9udOXSMkFCzcdWJZMY3ejffIUae4hp
         Yn9FCNs8aOiwVgVk4ZLc/eTfIyOUsMrVdATak/S0bQyx1NjB5GiR3B39/XZMIZWCfH
         AzQLxAmOCTssw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Add HANTRO G2/HEVC decoder support for IMX8MQ
Message-ID: <22b74c83-28af-ff86-0b3e-94e4e48d447a@xs4all.nl>
Date:   Thu, 3 Jun 2021 14:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfG51fF3tAJ7b3UY5OCb3vhyRrbzInj2eBOnXlxsQkcObjOP7q01SIzO8A+UesWArjbbm4iLElCyaHgf82dGz0ut7wNV5FpbY1Tknbbt3bedHn3Wxb2d3
 QuvtBX6/uya8uuhEGlTf76/FTQYRfGnXU3Qr64pNxhF9RuoR/F4MOdkhk9TIC4uhTJWH+jSecH9AfqDflvBMYx+/bb/uqiW+w0dUxGJdnC7STm7gl4j+CCem
 jXWs6psnO+JrEVHmwgCC0Oi9gphRRJ/W9JGnnYFVDdE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note: there is one checkpatch warning about an undocumented DT compatibility string:

WARNING: DT compatible string "nxp,imx8mq-vpu-g2" appears un-documented -- check ./Documentation/devicetree/bindings/
#29: FILE: drivers/staging/media/hantro/hantro_drv.c:591:
+       { .compatible = "nxp,imx8mq-vpu-g2", .data = &imx8mq_vpu_g2_variant },

This will go through another subsystem, as this is related to power domain changes, see:

https://lore.kernel.org/linux-media/20210407073534.376722-1-benjamin.gaignard@collabora.com/T/#m6bd571fee94b1b1fa5c5d3fa6315ae5c9f4c8fad

Since that's independent of the HEVC support, and this is still staging, I did
not want to hold back this series.

Regards,

	Hans

The following changes since commit 80c1c54a2aa3c5177f73fc5d505668df56fb28b6:

  Merge tag 'v5.13-rc4' into media_tree (2021-06-02 10:59:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14i

for you to fetch changes up to 2ffad592bcb47fed6fffd287060c98d910560b6e:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-03 14:10:57 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (9):
      media: hevc: Add fields and flags for hevc PPS
      media: hevc: Add decode params control
      media: hantro: change hantro_codec_ops run prototype to return errors
      media: hantro: Define HEVC codec profiles and supported features
      media: hantro: Only use postproc when post processed formats are defined
      media: uapi: Add a control for HANTRO driver
      media: hantro: handle V4L2_PIX_FMT_HEVC_SLICE control
      media: hantro: Introduce G2/HEVC decoder
      media: hantro: IMX8M: add variant for G2/HEVC codec

 Documentation/userspace-api/media/drivers/hantro.rst       |  19 ++
 Documentation/userspace-api/media/drivers/index.rst        |   1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst  | 108 ++++++--
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst |   6 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                  |  21 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                  |   4 +
 drivers/staging/media/hantro/Makefile                      |   2 +
 drivers/staging/media/hantro/hantro.h                      |  13 +-
 drivers/staging/media/hantro/hantro_drv.c                  |  99 ++++++-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c          |  10 +-
 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c         |   4 +-
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c           |   6 +-
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c          | 586 +++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_g2_regs.h              | 198 ++++++++++++++
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c          |   4 +-
 drivers/staging/media/hantro/hantro_hevc.c                 | 333 +++++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                   |  71 ++++-
 drivers/staging/media/hantro/hantro_postproc.c             |  14 +
 drivers/staging/media/hantro/hantro_v4l2.c                 |   5 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c                |  96 ++++++-
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c      |   4 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c     |   4 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_vp8_dec.c       |   6 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c                |   6 +
 drivers/staging/media/sunxi/cedrus/cedrus.h                |   1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c            |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c           |  12 +-
 include/media/hevc-ctrls.h                                 |  46 +++-
 28 files changed, 1612 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/userspace-api/media/drivers/hantro.rst
 create mode 100644 drivers/staging/media/hantro/hantro_g2_hevc_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_regs.h
 create mode 100644 drivers/staging/media/hantro/hantro_hevc.c
