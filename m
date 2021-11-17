Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B73345462F
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 13:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbhKQMM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 07:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234767AbhKQMM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 07:12:56 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F53C061570
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 04:09:57 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nJl9mOF9E1HGJnJlCmpW4S; Wed, 17 Nov 2021 13:09:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637150995; bh=uNznrHFvWzpKXoyw2OGQJFDTFT7lL2Njj8S9a45pfCo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iuduN5zMcEIzW1XtoVfGbUpb3ZWncdzyb8DNAWHaxkfgMsTO3lOchEZqkJe0a2TN3
         nRUnOsrV+b20efobGoJcKOcEFery5z9IvLOjg2i47KpFBKQuNw8b0Tp3uT94UDpkbJ
         n4SdxjRD6laTJE5VV5sjBzuS6VolRh3TDi3cQ3DNABETfktpqNS0OfXYqAKszi53A6
         X2NN8BR0Q8IOPcKMcFdhW7TT4XdF+O7XGgg01PWoTFaSfyLhI64aTT9VbMyBqwoUKT
         jQ8BE0kQb+8BkzYYXNtTbrdnUFlg7r5SLu9x2CgLB9/KVdavpjm6QDU9PvpIOoV9rQ
         FPRMoyPFZOyKA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] VP9 codec V4L2 control interface
Message-ID: <f05bda76-2fb0-bdd8-13c3-e52fbdfb7596@xs4all.nl>
Date:   Wed, 17 Nov 2021 13:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGMjcSDI39vAr3u7/WkvpQ2zis/FHTsmvcgWEYnKxvlemVOBzWfcwivQwOBnEBdX3qUO4p7w0kJqtKfK9WWP0a4KucR4qbPeKKFpuijuKmgCnqaD+Any
 1/SW7dWpf4x/Wgd5N+saXahVZEBta2jGIMqg/Y3pt2AeUP2VOHoA3sTMH3kTW/pErXJ8WAO/JWTMnJKxHWOeSxKRizsXGLgiotvDKe71VNVC8GpyrahTGGEL
 QgsUgvOEbOtaKTx4SNVDxnPA81dihHfJwsDyDiFbVDhWD8H81wvChU+plrW7pB550Alm1T6yQnrCUqMxeCVdsScLDgxxJVwJUqNcTiqdXz7M5hAUi6QZQx35
 mOjBAo2fc0psHY2MzFhoSpgzLfSyoz2khRZ2X3ydOW8zZaP1Z3eKgrQO27XMsLVvK/4+hk/X
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This series adds support for VP9 stateless codecs, implementing this in the hantro
and rkvdec drivers.

After this is applied only support for stateless HEVC codecs remains a staging API.

Many thanks to Andrzej, Ezequiel and others who worked on this and tested the
drivers!

Regards,

	Hans

The following changes since commit 96977c97e2c76f48d5e1f28ff5c6cd6f83a91ced:

  media: atomisp: get rid of #ifdef ISP_VEC_NELEMS (2021-11-16 11:49:43 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17c

for you to fetch changes up to 9eeba750c194e2ff9e21f2bbfee00181e45b3770:

  media: hantro: Support NV12 on the G2 core (2021-11-17 12:57:36 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrzej Pietrasiewicz (8):
      media: uapi: Add VP9 stateless decoder controls
      media: Add VP9 v4l2 library
      media: rkvdec: Add the VP9 backend
      media: hantro: Rename registers
      media: hantro: Prepare for other G2 codecs
      media: hantro: Support VP9 on the G2 core
      media: hantro: Staticize a struct in postprocessor code
      media: hantro: Support NV12 on the G2 core

Ezequiel Garcia (4):
      hantro: postproc: Fix motion vector space size
      hantro: postproc: Introduce struct hantro_postproc_ops
      hantro: Simplify postprocessor
      hantro: Add quirk for NV12/NV12_4L4 capture format

 Documentation/userspace-api/media/v4l/biblio.rst                    |   10 +
 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst |  573 ++++++++++++
 Documentation/userspace-api/media/v4l/pixfmt-compressed.rst         |   15 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst        |    8 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst          |   12 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions        |    2 +
 drivers/media/v4l2-core/Kconfig                                     |    4 +
 drivers/media/v4l2-core/Makefile                                    |    1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                           |  180 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                           |    8 +
 drivers/media/v4l2-core/v4l2-ioctl.c                                |    1 +
 drivers/media/v4l2-core/v4l2-vp9.c                                  | 1850 +++++++++++++++++++++++++++++++++++++
 drivers/staging/media/hantro/Kconfig                                |    1 +
 drivers/staging/media/hantro/Makefile                               |    7 +-
 drivers/staging/media/hantro/hantro.h                               |   41 +-
 drivers/staging/media/hantro/hantro_drv.c                           |   23 +-
 drivers/staging/media/hantro/hantro_g2.c                            |   26 +
 drivers/staging/media/hantro/hantro_g2_hevc_dec.c                   |   71 +-
 drivers/staging/media/hantro/hantro_g2_regs.h                       |  132 ++-
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c                    |  980 ++++++++++++++++++++
 drivers/staging/media/hantro/hantro_hw.h                            |  115 ++-
 drivers/staging/media/hantro/hantro_postproc.c                      |   81 +-
 drivers/staging/media/hantro/hantro_v4l2.c                          |   20 +
 drivers/staging/media/hantro/hantro_vp9.c                           |  240 +++++
 drivers/staging/media/hantro/hantro_vp9.h                           |  102 ++
 drivers/staging/media/hantro/imx8m_vpu_hw.c                         |   38 +-
 drivers/staging/media/hantro/rockchip_vpu_hw.c                      |    7 +-
 drivers/staging/media/hantro/sama5d4_vdec_hw.c                      |    3 +-
 drivers/staging/media/rkvdec/Kconfig                                |    1 +
 drivers/staging/media/rkvdec/Makefile                               |    2 +-
 drivers/staging/media/rkvdec/rkvdec-vp9.c                           | 1072 +++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.c                               |   41 +-
 drivers/staging/media/rkvdec/rkvdec.h                               |   12 +-
 include/media/v4l2-ctrls.h                                          |    4 +
 include/media/v4l2-vp9.h                                            |  233 +++++
 include/uapi/linux/v4l2-controls.h                                  |  284 ++++++
 include/uapi/linux/videodev2.h                                      |    6 +
 37 files changed, 6101 insertions(+), 105 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-vp9.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2.c
 create mode 100644 drivers/staging/media/hantro/hantro_g2_vp9_dec.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp9.c
 create mode 100644 drivers/staging/media/hantro/hantro_vp9.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
 create mode 100644 include/media/v4l2-vp9.h
