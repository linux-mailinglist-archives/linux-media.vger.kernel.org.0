Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A183AC9EE
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 13:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhFRLdy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 07:33:54 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48455 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232631AbhFRLdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 07:33:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uCiqlD2qfhqltuCiul53yo; Fri, 18 Jun 2021 13:31:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1624015904; bh=Oe5G5uI/js112hAcHiFDL/pSJaUXvs6e+TJk61bptbM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=whOmvBh76JLKMjVeZY1sOvuBkN00S6BUo+/3L67IHTlBiKZl6UcOORijLdJ399Jpv
         vHccXRE2kW7FYPyoZkhdYOI9uwb/1WmBSWtYMIYnZl790fYkUEzZv7rdZiXqOqyki1
         IbJ0qZPr2lggyIPph8GOJRLvADLQxgHp0ORsKy5donOUg3W3THQ0U0JmGkz86lwDUG
         nBdVTouRP6shs6cbaoiyMLpgZBph8A5TnSJac23jwA54+UWlV9zYfyzTVhSLB3oYyr
         794Pny7XP/1/neshb54qNI53xfO050Sgepv827/qCLQ8mzFBKdRQbZKDKGujDk/uHJ
         yRE9deJXzhmjQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Various fixes
Message-ID: <56e1093d-34e9-491d-01d8-2401b58a6465@xs4all.nl>
Date:   Fri, 18 Jun 2021 13:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLwcWfxScrZxeBL8TsjRjBOfd7oxO7sZcU1JS4BQN0mXngTtQKC5iVxP/FxpYekac/9YZS3fzF+6SPmpxpWIou4tfDMLvpktR4HysZyIuRxjB0B9NMz+
 8ks6Cehxtxb5sji59l6tXnbuIFqq1tJejjVYG16G5QHnQk/2NGgQnA858FylSct+87b1vXuKp9bhjrhvO5VhKKvw//aexy0rmAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 198bb646e8553e8abd8d83492a27b601ab97b75d:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-17 12:08:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14r

for you to fetch changes up to 893948f9b4bdef7bdb27fb4fadc34e93c454f7ee:

  media: saa7164: remove redundant continue statement (2021-06-18 13:21:42 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: saa7134: switch from 'pci_' to 'dma_' API

Colin Ian King (2):
      media: atomisp: remove redundant initialization of variable ret
      media: saa7164: remove redundant continue statement

Eugen Hristev (1):
      media: atmel: atmel-sama5d2-isc: fix YUYV format

Hans Verkuil (1):
      vivid: increase max number of allowed

Herman (5):
      drivers/media/pci/tw5864/Tw5864-reg.h: fix typo issues
      drivers/media/usb/gspca: fix typo Fliker -> Flicker
      drivers/media/platform/davinci/vpfe_capture.c : fix typo Proabably > Probably
      drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c : fix typo 'in deed imporant' > 'indeed important'
      drivers/media/platform/marvell-ccic/mcam-core.c : fix typo 'gettig' > 'getting'

Jernej Skrabec (2):
      media: hevc: Add segment address field
      media: cedrus: hevc: Add support for multiple slices

Krzysztof Hałasa (1):
      TDA1997x: enable EDID support

Shuah Khan (1):
      media: Fix Media Controller API config checks

Yang Yingliang (1):
      saa7134: convert list_for_each to entry variant

lijian (1):
      media: i2c: tvp5150: deleted the repeated word

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst |   3 +
 drivers/media/i2c/tda1997x.c                              |   1 +
 drivers/media/i2c/tvp5150.c                               |   2 +-
 drivers/media/mc/Makefile                                 |   2 +-
 drivers/media/pci/saa7134/saa7134-alsa.c                  |   4 +-
 drivers/media/pci/saa7134/saa7134-core.c                  |   7 ++-
 drivers/media/pci/saa7164/saa7164-cmd.c                   |   3 -
 drivers/media/pci/tw5864/tw5864-reg.h                     |   2 +-
 drivers/media/platform/atmel/atmel-sama5d2-isc.c          |  17 ++++++
 drivers/media/platform/davinci/vpfe_capture.c             |   2 +-
 drivers/media/platform/marvell-ccic/mcam-core.c           |   2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c           |   2 +-
 drivers/media/test-drivers/vivid/vivid-cec.c              |   2 +-
 drivers/media/usb/gspca/vc032x.c                          |   6 +-
 drivers/media/usb/gspca/zc3xx.c                           | 134 ++++++++++++++++++++++----------------------
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c          |  26 +++++----
 drivers/staging/media/sunxi/cedrus/cedrus_video.c         |   1 +
 include/media/hevc-ctrls.h                                |   3 +-
 include/media/media-dev-allocator.h                       |   2 +-
 20 files changed, 124 insertions(+), 99 deletions(-)
