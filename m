Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937D715D7BA
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 13:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgBNMzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 07:55:37 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59095 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728036AbgBNMzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 07:55:37 -0500
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2aVJjNhbpP9a92aVKjH8Jl; Fri, 14 Feb 2020 13:55:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581684935; bh=epojOKiVsq58vmqjqDYCtpCatWuDAuzMO5HUgS8nDTo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a41evx/eGMAfmVPkqrQEyQbiK/bLMwiTpl4yz0fBJ6tgt8vYJP5AbwrGC4JwAO4gt
         EkcflHdwJngcXIppYyjV27xlYujNb0gYic4SsBvSz+7BrrMvO7rSdeYg9WEsw6w/dQ
         wqYM81IP47BcqbZDwoioFHFJtF8mdkMd2szeEGJTijz0Vnaczf4wNYdCbCHMk7NL+e
         bQKNRYy32CixLkjRra12B+9VR/kRsk+/PWSsMrOo+tOz2mv9yRopgLgYEEgusiHmbX
         8QEvQQq2l2FgWVYHo24BDkjygxY7mvrL5ItrbuqsXjvqfIOuNFHcoOxHoVsjHrXzRE
         UtH5rn/Dnw3Zg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes, mainly hantro and rkisp1
Message-ID: <d5b15f36-305f-593f-dbb9-41463e018107@xs4all.nl>
Date:   Fri, 14 Feb 2020 13:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAkj02GQL99itnkrhJVs5ARcBTMLhPzDgCgt9Xpx3lSJnBd8GfTechQW8qU63KlhN0QyJyVUEOD88Kadpekvrqpvj6dpKA/TQVQYcSbLt6sJqW+VcXSY
 mOk1BhHNuBaeZI0HMmlClEOYm/s266qKvQ2EjsCelZY0XoP8dRX6Ob9YK7AZK8tSxR2kzZE58sQe6Su5DMm/T8RY6AAZRyWzOu2N+Fp+ZClvORZuPcXDTH7r
 LR2UgSha/FkJEmwT0ViOVhL6iIYrSEC0anoc3z8UWxNupZAfBngSIXZf484el+nWMoa3Z1NJ/2VGhZNW2FfaIX34yyiTjB79YZr9qUgGLdMGw5Jo4a43KiCl
 GTS6bwED+Utdv43nNmvZX3Ir8EKPD7xR5IFEGcEITabtIPtRY9CKBxfLxudeb+CZxjMT+rhK
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7b

for you to fetch changes up to 7306609c0443bd97a0ee5629b88c15f64b74e45b:

  media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-14 11:42:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrzej Pietrasiewicz (4):
      media: hantro: Read be32 words starting at every fourth byte
      media: hantro: Use standard luma quantization table
      media: hantro: Write the quantization tables in proper order
      media: hantro: Write quantization table registers in increasing addresses order

Cengiz Can (1):
      media: davinci: fix incorrect pix_fmt assignment

Colin Ian King (1):
      media: allegro: fix spelling mistake "to" -> "too"

Dafna Hirschfeld (8):
      media: vimc: streamer: if kthread_stop fails, ignore the error
      media: staging: rkisp1: don't lock media's graph_mutex when calling rkisp1_create_links
      media: staging: rkisp1: fix test of return value of media_entity_get_fwnode_pad
      media: staging: rkisp1: improve inner documentation in rkisp1-isp.c
      media: staging: rkisp1: change function to return void instead of int
      media: staging: rkisp1: isp: check for dphy bus before initializations in s_stream
      media: staging: rkisp1: add serialization to the isp subdev ops
      media: staging: rkisp1: add serialization to the resizer subdev ops

Dan Carpenter (1):
      media: staging/imx: Missing assignment in imx_media_capture_device_register()

Ezequiel Garcia (1):
      media: hantro: Prevent encoders from using post-processing

Hans Verkuil (2):
      mc-entity.c: use WARN_ON, validate link pads
      Documentation/media/uapi: more readable unions

Helen Koike (6):
      staging: media: rkisp1: make links immutable by default
      media: staging: rkisp1: use consistent bus_info string for media_dev
      media: staging: rkisp1: stats: use consistent bus_info string
      media: staging: rkisp1: rsz: don't ignore set format in bayer mainpath
      media: staging: rkisp1: rsz: return to userspace the crop value in bayer mainpath
      media: staging: rkisp1: isp: do not set invalid mbus code for pad

Justin Swartz (1):
      dt-bindings: Add binding for rk3228 rga

Philipp Zabel (1):
      media: hantro: fix extra MV/MC sync space calculation

YueHaibing (1):
      media: sun8i: Remove redundant platform_get_irq error message

 Documentation/devicetree/bindings/media/rockchip-rga.txt      |  5 +--
 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst     | 10 +++---
 Documentation/media/uapi/cec/cec-ioc-dqevent.rst              | 20 ++++++------
 Documentation/media/uapi/mediactl/media-ioc-enum-entities.rst | 24 ++++----------
 Documentation/media/uapi/v4l/buffer.rst                       | 53 ++++++++++--------------------
 Documentation/media/uapi/v4l/dev-sliced-vbi.rst               | 15 ++++-----
 Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst           |  6 ++--
 Documentation/media/uapi/v4l/pixfmt-v4l2.rst                  |  2 --
 Documentation/media/uapi/v4l/vidioc-dbg-g-chip-info.rst       | 12 +++----
 Documentation/media/uapi/v4l/vidioc-dbg-g-register.rst        | 12 +++----
 Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst           | 26 ++++-----------
 Documentation/media/uapi/v4l/vidioc-dqevent.rst               | 55 ++++++++++----------------------
 Documentation/media/uapi/v4l/vidioc-dv-timings-cap.rst        | 14 ++++----
 Documentation/media/uapi/v4l/vidioc-enum-frameintervals.rst   | 19 ++++-------
 Documentation/media/uapi/v4l/vidioc-enum-framesizes.rst       | 18 ++++-------
 Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst          | 16 ++++------
 Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst           | 45 +++++++++++---------------
 Documentation/media/uapi/v4l/vidioc-g-fmt.rst                 | 29 +++++++----------
 Documentation/media/uapi/v4l/vidioc-g-parm.rst                | 18 ++++-------
 Documentation/media/uapi/v4l/vidioc-queryctrl.rst             | 19 ++++-------
 drivers/media/mc/mc-entity.c                                  | 11 +++++--
 drivers/media/platform/davinci/vpfe_capture.c                 |  2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c              |  5 +--
 drivers/media/platform/vimc/vimc-streamer.c                   |  8 ++++-
 drivers/staging/media/allegro-dvt/allegro-core.c              |  2 +-
 drivers/staging/media/hantro/hantro.h                         |  2 +-
 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c             | 19 ++++++++---
 drivers/staging/media/hantro/hantro_jpeg.c                    | 76 ++++++++++++++++++++++++++++++++------------
 drivers/staging/media/hantro/hantro_jpeg.h                    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c                    |  2 +-
 drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c         | 24 ++++++++++----
 drivers/staging/media/imx/imx-media-capture.c                 |  2 +-
 drivers/staging/media/rkisp1/rkisp1-common.h                  |  3 ++
 drivers/staging/media/rkisp1/rkisp1-dev.c                     | 20 ++++++------
 drivers/staging/media/rkisp1/rkisp1-isp.c                     | 61 +++++++++++++++++++----------------
 drivers/staging/media/rkisp1/rkisp1-resizer.c                 | 27 +++++++++-------
 drivers/staging/media/rkisp1/rkisp1-stats.c                   |  3 +-
 37 files changed, 328 insertions(+), 359 deletions(-)
