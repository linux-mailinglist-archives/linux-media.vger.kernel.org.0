Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2057F42A217
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 12:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhJLK3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 06:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbhJLK3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 06:29:21 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD3DC061771
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 03:27:15 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id aF01mkD078cVwaF04m8apm; Tue, 12 Oct 2021 12:27:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634034433; bh=lP8lqE2Bv9OrUzpkF2Q1sgLiaN6QfQKH2vzQOrP8FsU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hKVycfUbr9Y9J/mn9N+ASZMP6wRx1MnNTRh2oxpjgqGk0qpchIGxHOoZ0DKAic5DJ
         p1Kb9QzEuuYcsm+yKVUbkAIUOzWcuKlG/2IPJgT299mQ/YQYxFpv3E9+3rKebqh6uY
         UWlNKYqgdIlP7YIKkU/UFOL3+r4+k1KXClfrUfGm8FGA+6P+U2k1R8N8QwF6yDNnNl
         LyMLY16SOJFlx6MD4d4K+x21Prdk2dxEDwxMZvuOjQRlg7DdiNvxa8vHeo9gYPaciP
         Cx/qnO0zpyY7F2oY1YLnk7ExKkK72cm7XQrOhh7K/FszBpXQlxf1W1FPAaGLvqWKa6
         URO86iRHEy+Ow==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Various fixes/enhancements
Message-ID: <3be5a55b-a986-4555-b4f8-74a51c09c65c@xs4all.nl>
Date:   Tue, 12 Oct 2021 12:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNu95uzi2u0G/las9ggUz/AFWGZ5Y7jhJ7ettdublsQWTOWOZMEF/OwWVO4zBLzW+Rl4Bq4fezZKdf+m3YsNoUKvk4BRTlcbSQlrYrxQMeR2LqqXe6rN
 EHB1M8djsrfr55mMLdrFaODV07YU1ob/FXMLm9O6r0rmbYIYwHkZRM9zFdDhO/jFhkH+aL1h5cD7NddOmYpqvpc8/3D1ZO57S84=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16j

for you to fetch changes up to 72ea5a0e23e4282dc4df899577ef62f822aec741:

  media: ivtv: fix build for UML (2021-10-12 12:00:08 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: i2c: select V4L2_ASYNC where needed

Chen-Yu Tsai (2):
      media: rkvdec: Do not override sizeimage for output format
      media: rkvdec: Support dynamic resolution changes

Daniel Almeida (1):
      media: cedrus: fix double free

Hans Verkuil (2):
      vidtv: move kfree(dvb) to vidtv_bridge_dev_release()
      gspca/gl860-mi1320/ov9655: avoid -Wstring-concatenation warning

Jammy Huang (1):
      media: aspeed: add debugfs

Jeff Chase (1):
      MAINTAINERS: update maintainer for ch7322 driver

Jernej Skrabec (1):
      media: cedrus: Don't kernel map most buffers

Krzysztof Hałasa (4):
      TDA1997x: replace video detection routine
      Add ADV7610 support for adv7604 driver - DT docs.
      Add ADV7610 support for adv7604 driver.
      i.MX6: Support 16-bit BT.1120 video input

Mirela Rabulea (1):
      media: imx-jpeg: Add pm-runtime support for imx-jpeg

Randy Dunlap (1):
      media: ivtv: fix build for UML

Scott K Logan (1):
      media: saa7134: Add support for Leadtek WinFast HDTV200 H

Sergey Senozhatsky (1):
      media: videobuf2: always set buffer vb2 pointer

Vladimir Barinov (1):
      media: rcar-vin: add G/S_PARM ioctls

 Documentation/devicetree/bindings/media/i2c/adv7604.yaml |  13 ++---
 MAINTAINERS                                              |   2 +-
 drivers/gpu/ipu-v3/ipu-csi.c                             |  31 ++++++++++--
 drivers/media/common/videobuf2/videobuf2-dma-contig.c    |   3 ++
 drivers/media/i2c/Kconfig                                |   2 +
 drivers/media/i2c/adv7604.c                              |  15 +++---
 drivers/media/i2c/tda1997x.c                             | 119 ++++++++++++++++++++++++-------------------
 drivers/media/i2c/tda1997x_regs.h                        |   3 ++
 drivers/media/pci/ivtv/ivtvfb.c                          |   4 +-
 drivers/media/pci/saa7134/saa7134-cards.c                |  53 ++++++++++++++++++++
 drivers/media/pci/saa7134/saa7134-dvb.c                  |  29 +++++++++++
 drivers/media/pci/saa7134/saa7134.h                      |   1 +
 drivers/media/platform/aspeed-video.c                    | 100 +++++++++++++++++++++++++++++++++++++
 drivers/media/platform/imx-jpeg/mxc-jpeg.c               |  73 +++++++++++++++++++++++++--
 drivers/media/platform/imx-jpeg/mxc-jpeg.h               |   2 +
 drivers/media/platform/rcar-vin/rcar-v4l2.c              |  21 ++++++++
 drivers/media/test-drivers/vidtv/vidtv_bridge.c          |   5 +-
 drivers/media/usb/gspca/gl860/gl860-mi1320.c             |  87 +++++++++++++++++++++-----------
 drivers/media/usb/gspca/gl860/gl860-ov9655.c             | 169 ++++++++++++++++++++++++++++++++++++++++----------------------
 drivers/staging/media/imx/imx-media-csi.c                |   5 ++
 drivers/staging/media/rkvdec/rkvdec-h264.c               |   5 +-
 drivers/staging/media/rkvdec/rkvdec.c                    |  40 +++++++--------
 drivers/staging/media/sunxi/cedrus/cedrus.c              |   1 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c         | 113 +++++++++++++++++++++++------------------
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c         |  30 ++++++-----
 drivers/staging/media/sunxi/cedrus/cedrus_video.c        |   1 +
 26 files changed, 677 insertions(+), 250 deletions(-)
