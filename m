Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599A6466543
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 15:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347408AbhLBOdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 09:33:24 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:38156 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhLBOdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 09:33:23 -0500
X-KPN-MessageId: 388d4c98-537c-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 388d4c98-537c-11ec-8a6e-005056ab378f;
        Thu, 02 Dec 2021 15:29:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:mime-version:date:message-id:subject:from:to;
        bh=I/0vW4M6UNXKWhbJg4caZS9oeKzNDYz5xVBFBlXKl8Q=;
        b=Qi0C59r6VjInMlGV6aEyOYGh11iEOly73s+TTtUbJZYMUArMnmw4AhVOCAMM2qQR+MoPdPdzUkj7l
         klMZB8CjRJg840CUn87E3Qwnjaz4JvL4ivzPGUZogwxGh5yltb3xL6xQQcptP/pPw+K/ao4ESj/pU6
         3v4UsBp1DeZhbC8AXfxIBvh5tLeYW6X5UstqLN46vsTme9ciT7YbhGQgKgzRuFR4gnuBwo5BZsyJm7
         tjygAdqux2ANePZDwunJLsTlbwNp9CGIbU4oaRJcFNuZUzTzv/8z19li0PgN+H6cMLiJZg3KSw2dvj
         lZdTT1betExT3mapX5cYbxjA6lSaVxA==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|tcB35sJ362JauOlyDy79ZTbTCKwlDYxmUQ0FtyDae90jPvtk32EziV/VmOQlNvU
 +gxOvIdmmo85hy4xA40ThLA==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 543b80fc-537c-11ec-94d2-005056abf0db;
        Thu, 02 Dec 2021 15:30:00 +0100 (CET)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.17] Various fixes/enhancements
Message-ID: <2ddc1258-8bed-df48-2dff-c08997565d6b@xs4all.nl>
Date:   Thu, 2 Dec 2021 15:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8cc7a1b2aca067397a016cdb971a5e6ad9b640c7:

  media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()' (2021-11-30 12:31:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17e

for you to fetch changes up to d1888b0bfd2ddef2e8a81505ffa200b92cc32e0c:

  media: videobuf2: add WARN_ON_ONCE if bytesused is bigger than buffer length (2021-12-02 14:44:10 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (2):
      media: replace setting of bytesused with vb2_set_plane_payload
      media: videobuf2: add WARN_ON_ONCE if bytesused is bigger than buffer length

Hans Verkuil (4):
      hantro: drop unused vb2 headers
      cec-pin: drop unused 'enabled' field from struct cec_pin
      cec-pin: fix interrupt en/disable handling
      cec: fix a deadlock situation

Niklas Söderlund (5):
      rcar-vin: Add check for completed capture before completing buffer
      rcar-vin: Update format alignment constraints
      media: rcar-csi2: Suppress bind and unbind nodes in sysfs
      media: rcar-vin: Disallow unbinding and binding of individual VINs
      media: rcar-vin: Do not hold the group lock when unregistering notifier

Rikard Falkeborn (1):
      media: s5p-jpeg: Constify struct v4l2_m2m_ops

Samuel Holland (2):
      dt-bindings: media: Add compatible for D1
      media: cedrus: Add support for the D1 variant

Zhou Qingyang (3):
      media: dib8000: Fix a memleak in dib8000_init()
      media: saa7146: hexium_orion: Fix a NULL pointer dereference in hexium_attach()
      media: saa7146: mxb: Fix a NULL pointer dereference in mxb_attach()

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml           |  1 +
 drivers/media/cec/core/cec-adap.c                                  | 38 +++++++++++++++++--------------
 drivers/media/cec/core/cec-api.c                                   |  6 +++++
 drivers/media/cec/core/cec-core.c                                  |  3 +++
 drivers/media/cec/core/cec-pin-priv.h                              |  1 -
 drivers/media/cec/core/cec-pin.c                                   | 32 ++++++++++++++------------
 drivers/media/dvb-frontends/dib8000.c                              |  4 +++-
 drivers/media/pci/saa7146/hexium_orion.c                           |  8 ++++++-
 drivers/media/pci/saa7146/mxb.c                                    |  8 ++++++-
 drivers/media/platform/allegro-dvt/allegro-core.c                  |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c                 | 10 ++++----
 drivers/media/platform/rcar-vin/rcar-core.c                        |  3 +--
 drivers/media/platform/rcar-vin/rcar-csi2.c                        |  1 +
 drivers/media/platform/rcar-vin/rcar-dma.c                         |  7 ++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c                        | 15 ++++++++----
 drivers/media/platform/s5p-jpeg/jpeg-core.c                        |  6 ++---
 drivers/media/platform/s5p-jpeg/jpeg-core.h                        |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c                  |  2 +-
 drivers/media/usb/go7007/go7007-driver.c                           |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c                         |  2 --
 drivers/staging/media/meson/vdec/vdec_helpers.c                    | 10 ++++----
 drivers/staging/media/sunxi/cedrus/cedrus.c                        | 12 ++++++++++
 include/media/cec.h                                                | 11 +++++++--
 include/media/videobuf2-core.h                                     |  9 +++++++-
 24 files changed, 132 insertions(+), 63 deletions(-)
