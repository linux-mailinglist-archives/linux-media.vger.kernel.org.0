Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A3816C0F2
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 13:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgBYMhK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 07:37:10 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59961 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725851AbgBYMhK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 07:37:10 -0500
Received: from [IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2]
 ([IPv6:2001:420:44c1:2577:a473:ad6c:dd91:35d2])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6ZSTjymQEjmHT6ZSWjWzpK; Tue, 25 Feb 2020 13:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582634229; bh=9NEO/OZq0atxtOfcqY30g2LBy8sNxgT9UbWMpjINGj8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=peeJanSRcZwh9GKj/I5c6fmY0hq+EVd0+ybclL2KqZz3EroEHo6cBQOoQJ5SQfKh6
         mMl7zXFAskpuom+F1eF2lB+xWr2M40v9gZ+faPBwEZh8MqDBE6cIYGse7BE3edUhJY
         el8SEmJ4l4kIDPS2TbG3AfYzn+VIQlW+KIHVlOizAfXSNf5aCWYu9cz1H+h9eS/phi
         TXVwLoEdqacGwY8AeMcD4tMPeCIwbZ2ZAwmEI0/f9Pe9gL8E7KFazsex5sgWCbDadI
         unIIlW0bOK6F+6EfFeZeImDIYwffa30rxF1/kR7hjzJoLNKK88EwFL1JsBUOdtH+s+
         AZxW2T2iA3vhA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes, new Allwinner A83T Rotate driver
Message-ID: <07f45cff-4c53-4892-f63a-2812d92d31a2@xs4all.nl>
Date:   Tue, 25 Feb 2020 13:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUPs/PpJ2MJf9KConeTIZVJL4h5vFhPzofN0sw5BgXs/Tv5xTLXIpBLFOqQwaoBbtycyIJzhyBGf65E8+fQhZOT9jbZOq038TFknlR7NSfcnqNltMEe
 gb6tlRDPV1CtW619ucUQr3rkNaCFK2OptgwPH5CMKk/uGxIkkdKO0ubLVOxw9GS9/fKabWeEyLVzz7cyPXIp7INB0biLuPL6og/mQ0dI8nSn+D2lVhzDJtjI
 +HE3Mvyh4mVmUseNyt90gir74KAtucITBVqlabvP5avrU2rkw2RH2n+FaztaUjykKRjqQD/g+fWZP1nCPoX5f2s56mXHVqPQODydWIxPDUk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ef0ed05dcef8a74178a8b480cce23a377b1de2b8:

  media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-24 17:53:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7c

for you to fetch changes up to 693062b8643c6877418b7b4a7f56d16bed117248:

  media: staging: rkisp1: capture: remove support to userptr memory (2020-02-25 13:29:35 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (2):
      media: staging: rkisp1: remove serialization item in the TODO file
      media: staging: rkisp1: capture: remove support to userptr memory

Ezequiel Garcia (1):
      media: Split v4l2_pipeline_pm_use into v4l2_pipeline_pm_{get, put}

Hans Verkuil (2):
      videobuf2-dma-contig.c: remove spurious 'b' in message
      videobuf2-core.h: improve buf_struct_size documentation

Jernej Skrabec (3):
      media: dt-bindings: media: Add Allwinner A83T Rotate driver
      media: sun8i: Add Allwinner A83T Rotate driver
      media: dt-bindings: media: Add Allwinner A64 deinterlace compatible

Kees Cook (1):
      MAINTAINERS: Fix typo in "TI VPE/CAL DRIVERS"

Rui Wang (1):
      media: mtk-vcodec: reset segment data then trig decoder

Takashi Iwai (1):
      media: go7007: Fix URB type for interrupt handling

 .../devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml         |  70 +++
 .../devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml          |   6 +-
 Documentation/media/kapi/csi2.rst                                          |   2 +-
 MAINTAINERS                                                                |  10 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c                      |   4 +-
 drivers/media/platform/Kconfig                                             |  12 +
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c                       |  29 +-
 drivers/media/platform/omap3isp/ispvideo.c                                 |   4 +-
 drivers/media/platform/qcom/camss/camss-video.c                            |   4 +-
 drivers/media/platform/rcar-vin/rcar-v4l2.c                                |   6 +-
 drivers/media/platform/sunxi/Makefile                                      |   1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c                        |   6 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c                       |   4 +-
 drivers/media/platform/sunxi/sun8i-rotate/Makefile                         |   5 +
 drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h                  |  25 +
 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h                   | 135 +++++
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c                  | 273 ++++++++++
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c                   | 924 ++++++++++++++++++++++++++++++++++
 drivers/media/usb/go7007/go7007-usb.c                                      |   4 +-
 drivers/media/v4l2-core/v4l2-mc.c                                          |  18 +-
 drivers/staging/media/imx/imx-media-capture.c                              |   4 +-
 drivers/staging/media/omap4iss/iss_video.c                                 |   4 +-
 drivers/staging/media/rkisp1/TODO                                          |   1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c                              |  11 +-
 include/media/v4l2-mc.h                                                    |  40 +-
 include/media/videobuf2-core.h                                             |   7 +-
 26 files changed, 1555 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i_formats.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
