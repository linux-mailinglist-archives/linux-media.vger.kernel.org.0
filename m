Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9A74210CF
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 15:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237350AbhJDN60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 09:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235525AbhJDN6J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 09:58:09 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0515AC06135F
        for <linux-media@vger.kernel.org>; Mon,  4 Oct 2021 06:52:34 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id XOOKmlVNIMjraXOONmWRic; Mon, 04 Oct 2021 15:52:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633355551; bh=BOJDPJ3rsL1cV6oVSK9+lha07XjW98Iod/Ia52r7yMI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cfc/R4JpUOjQyIsAY8crntsdV5mZAoElw82wVxmzQTy0Nb5A/srWMmxsBFtYL/Ill
         2RWbJXO7THtiizdZRQBK4hlXe3yU9E2jCCUhf8VnRsICYIFfVBt3jlK8tLHK0RiJKv
         tXq8FarbC/UlQJgIryswITnVAYitxDbDvEMMywb/vKqTi3WIwVwCZjOnp0JQdqhqwj
         xrToglDNN+kDGB/idfTxa9R298rJyeFfGnrUfrqmmZ433n57JlTZkROPtR+G6xcjnn
         jcJpC0nDVpqvHe3+Arx/Ts9/wCr9X6XIHM1lyqD0bbGIGpLEF/+4U7IwKE9X6MkW+U
         Use+m2YDIFStw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Various fixes
Message-ID: <2b37b3f6-0dd4-3977-fd97-1c5281985b8a@xs4all.nl>
Date:   Mon, 4 Oct 2021 15:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFlxtnNbo64Z2WUUPGivDs3F+RlNyOYQd6cuNOefEb/yc+V4t1ZLzVLTF9f83uWOC5NUZWdkeYctc32wPp8Aka1iMmkUn2i6n5PQgIe5gtzCKk8I6C+U
 1chgrfWqgQTdZmivTOrBR49iJoY0jk+6ADckpLaPmrQM7luFWVfOgwdSd5ysHxHZqjf5kMOLv54CXOffxH/Mp7LhiDeA/pu7IFM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c52e7b855b33ff2a3af57b1b1d114720cd39ec7e:

  Merge tag 'v5.15-rc4' into media_tree (2021-10-04 07:52:13 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16g

for you to fetch changes up to 8a99f5847660a1b0a305c22bf6d5ab280fba5469:

  media: imx-jpeg: Remove soft reset between frames encoding (2021-10-04 12:38:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: omap_vout: use dma_addr_t consistently

Benjamin Gaignard (1):
      media: hantro: Auto generate the AXI ID to avoid conflicts

Colin Ian King (1):
      media: em28xx: Don't use ops->suspend if it is NULL

Dan Carpenter (1):
      media: vivid: fix an error code in vivid_create_instance()

Irui Wang (1):
      media: mtk-vcodec: MT8173 h264/vp8 encoder min/max bitrate settings

Jammy Huang (1):
      media: aspeed: refine to avoid full jpeg update

Jernej Skrabec (2):
      media: cedrus: Add H265 10-bit capability flag
      media: cedrus: add check for H264 and H265 limitations

Krzysztof Kozlowski (1):
      media: imx: drop unneeded MODULE_ALIAS

Mirela Rabulea (3):
      media: imx-jpeg: Fix possible null pointer dereference
      media: imx-jpeg: Fix occasional decoder fail on jpegs without DHT
      media: imx-jpeg: Remove soft reset between frames encoding

Nadezda Lutovinova (1):
      media: rcar-csi2: Add checking to rcsi2_start_receiver()

Niklas Söderlund (2):
      media: rcar-csi2: Cleanup mutex on remove and fail
      media: rcar-csi2: Serialize access to set_fmt and get_fmt

Randy Dunlap (1):
      media: CEC: keep related menu entries together

Rikard Falkeborn (1):
      media: hantro: Constify static struct v4l2_m2m_ops

Vladimir Barinov (1):
      media: rcar-vin: add GREY format

Yajun Deng (1):
      media: v4l2-dev.h: move open brace after struct video_device

 drivers/media/cec/Kconfig                              |  4 ++++
 drivers/media/platform/aspeed-video.c                  | 17 ++++++++++++++++-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c             | 30 +++++++++++++++++++++++++-----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c |  6 +++---
 drivers/media/platform/omap/omap_vout.c                | 18 ++++++++++--------
 drivers/media/platform/omap/omap_vout_vrfb.c           |  2 +-
 drivers/media/platform/omap/omap_voutdef.h             |  2 +-
 drivers/media/platform/rcar-vin/rcar-csi2.c            | 27 ++++++++++++++++++++-------
 drivers/media/platform/rcar-vin/rcar-dma.c             | 15 +++++++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c            |  4 ++++
 drivers/media/test-drivers/vivid/vivid-core.c          |  2 +-
 drivers/media/usb/em28xx/em28xx-core.c                 |  5 +++--
 drivers/staging/media/hantro/hantro_drv.c              |  2 +-
 drivers/staging/media/hantro/hantro_g1_h264_dec.c      |  2 +-
 drivers/staging/media/hantro/hantro_g1_regs.h          |  2 ++
 drivers/staging/media/hantro/hantro_g1_vp8_dec.c       |  3 ++-
 drivers/staging/media/imx/imx-media-csi.c              |  1 -
 drivers/staging/media/sunxi/cedrus/cedrus.c            | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h            |  1 +
 include/media/v4l2-dev.h                               |  3 +--
 20 files changed, 158 insertions(+), 35 deletions(-)
