Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B502228240A
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 14:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgJCMNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 08:13:09 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54833 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725770AbgJCMNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 08:13:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OgOkkjRDFTHgxOgOnk6gtn; Sat, 03 Oct 2020 14:13:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601727184; bh=K+2GsuL91ohpYMnzFFC2m+x0TETxoYXGwyCPABbVTTU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cStmxuGaBfsJJwuUhRw/WpSkhxR8gP6/DKhzqXQbFcaHMLcJtiWZapHWLI4qe48qb
         kuaehB3k19ENvMrC5Yj8ksw810IqShoodP00y/um+qMezHG5I8XtKAkYhmzvO1Pu91
         QEDkJPA8otX+shToco1GDDaEtNfGDy4AY1Uaftt3GK7rWpT8LGJT6H0NbMEDH43AOO
         9WHC8UXrZHJRruPZmWgunVcjB6cBUlQvKolMEUWOR3/qSlaerviRnJzviC32fqjihO
         XtMxalPDJBpTMZNnxs1qmVqPgS8dKUAwaioZAFhAIvOWjE9cL/0mJHxvZyN7BnRIhR
         uSe6GPz8g2YfQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Julia Lawall <Julia.Lawall@lip6.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Various fixes
Message-ID: <6b4d935f-89fd-7256-e123-d470fed2beb9@xs4all.nl>
Date:   Sat, 3 Oct 2020 14:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOwZA7P1pOFr94fNqWdRFMXtRmZ8nqzaTaxmInsg9uSBEyyZP7X2QHKFMUIuJs2v4foU1Tvku0lO5DXkWk7udGWDMF+MOY/esKiwXPuySFsYT6mWVOwK
 44Ltcv64s9lfomVp24KfBaM3IKna+bDxkGAVGw00wwayyNZ5bAcd90h5L7lTvy35k1G+2eC2yyhDa8oJMIKAfc1zo+Pi1Tv/Qfo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit eb5f6b8ee9e4fcdda3807aff02a3df2d7ca51bbf:

  media: atomisp: fixes build breakage for ISP2400 due to a cleanup (2020-10-01 13:17:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11a

for you to fetch changes up to ab9b1faac78ff59b10dc6e48336b5c77fd9cd22b:

  vivid: fix (partially) timing issues (2020-10-03 14:04:53 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (1):
      media: zoran: fix spelling mistake and make error message more meaningful

Dafna Hirschfeld (1):
      media: staging: rkisp1: remove TODO item to document quantization handling

Ezequiel Garcia (1):
      media: uapi: h264: Add documentation to the interface header

Hans Verkuil (2):
      Fix V4L2_COLORSPACE_470_SYSTEM_BG description
      vivid: fix (partially) timing issues

Julia Lawall (19):
      media: coda: use semicolons rather than commas to separate statements
      media: em28xx-audio: use semicolons rather than commas to separate statements
      media: rtl28xxu: use semicolons rather than commas to separate statements
      media: saa7134: use semicolons rather than commas to separate statements
      media: m88ds3103: use semicolons rather than commas to separate statements
      media: gspca: ov534-ov772x: use semicolons rather than commas to separate statements
      media: s3c-camif: use semicolons rather than commas to separate statements
      media: sun4i-csi: use semicolons rather than commas to separate statements
      media: pvrusb2: use semicolons rather than commas to separate statements
      media: ts2020: use semicolons rather than commas to separate statements
      media: msp3400: use semicolons rather than commas to separate statements
      media: radio-sf16fmr2: use semicolons rather than commas to separate statements
      media: mt2060: use semicolons rather than commas to separate statements
      media: au0828: use semicolons rather than commas to separate statements
      media: dvbsky: use semicolons rather than commas to separate statements
      media: dib0700: use semicolons rather than commas to separate statements
      media: rtl2832: use semicolons rather than commas to separate statements
      media: exynos4-is: use semicolons rather than commas to separate statements
      media: bttv: use semicolons rather than commas to separate statements

Niklas Söderlund (1):
      rcar-vin: Remove redundant compatible values

YueHaibing (1):
      media: marvell-ccic: Fix -Wunused-function warnings

 Documentation/userspace-api/media/v4l/biblio.rst              |  12 ++-
 Documentation/userspace-api/media/v4l/colorspaces-details.rst |   5 +-
 drivers/media/dvb-frontends/m88ds3103.c                       |   6 +-
 drivers/media/dvb-frontends/rtl2832.c                         |  14 +--
 drivers/media/dvb-frontends/ts2020.c                          |  10 +-
 drivers/media/i2c/msp3400-kthreads.c                          |  12 ++-
 drivers/media/pci/bt8xx/bttv-cards.c                          |   6 +-
 drivers/media/pci/saa7134/saa7134-video.c                     |   7 +-
 drivers/media/platform/coda/coda-common.c                     |   2 +-
 drivers/media/platform/exynos4-is/fimc-core.c                 |   6 +-
 drivers/media/platform/marvell-ccic/mmp-driver.c              |   4 +-
 drivers/media/platform/rcar-vin/rcar-core.c                   |  16 ----
 drivers/media/platform/s3c-camif/camif-core.c                 |   6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c           |   2 +-
 drivers/media/radio/radio-sf16fmr2.c                          |   2 +-
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c          |   6 +-
 drivers/media/test-drivers/vivid/vivid-kthread-out.c          |   6 +-
 drivers/media/test-drivers/vivid/vivid-kthread-touch.c        |   6 +-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c              |   6 +-
 drivers/media/tuners/mt2060.c                                 |   2 +-
 drivers/media/usb/au0828/au0828-video.c                       |   2 +-
 drivers/media/usb/dvb-usb-v2/dvbsky.c                         |  22 ++---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c                       |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c                   |   4 +-
 drivers/media/usb/em28xx/em28xx-audio.c                       |  14 +--
 drivers/media/usb/gspca/ov534.c                               |  12 +--
 drivers/media/usb/pvrusb2/pvrusb2-devattr.c                   |   2 +-
 drivers/staging/media/rkisp1/TODO                             |   1 -
 drivers/staging/media/zoran/zoran_driver.c                    |   2 +-
 include/media/h264-ctrls.h                                    | 195 ++++++++++++++++++++++++++++++++++++--
 include/uapi/linux/videodev2.h                                |   4 +-
 31 files changed, 293 insertions(+), 105 deletions(-)
