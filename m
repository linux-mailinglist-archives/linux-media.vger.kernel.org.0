Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C376D399F41
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 12:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhFCKwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 06:52:04 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:56707 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229807AbhFCKwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 06:52:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id okvUlbPUxIpGyokvYlROyF; Thu, 03 Jun 2021 12:50:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622717418; bh=lsYA4/HazoH42o8O2bSTXaZGOfubqp8ND4ni+yA+AYg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qJ/75ZEy3cjTeWNO04sXTSy/gPk0UCnyb97P63478k4hWdnvj3cIMDEsa8p1JRwnC
         1CMmheyKAHTft/6GMRp6C9fXAYsvrMfv18HJ056Hg44Fv4bV92Jl+hk/nSjuSPw6pZ
         qbM5qrE1wDk0L8HOluBNWlBPPXp7MR/yLUQ6ZAqRmM6NW0xZ37IZjPn0aab+WT6vB0
         2P9hHZPR8a4vCjp4mNKEPbgSVbFiWxnBHqVQGzxUMK6JUF5yLf22S61XwO/6Xuh+bY
         B9MUtktW4CakPFr3puLR1yNSG19pzxNBJiddR+aB6CwqsSL6mplxAYXd8weqpW10FH
         hEJ9BWRtkfHLw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        John Cox <jc@kynesim.co.uk>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] vb2_queue_change_type, hevc fix and atmel-isc
 series
Message-ID: <57e15ed1-61c7-0240-5bf3-115de3bbec9c@xs4all.nl>
Date:   Thu, 3 Jun 2021 12:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFsJYB6Qze2fUb5YTigmDcyvsbBBXkXjbm2OHEadJGk7lK+xaYkG3EQI+BkBZJq3HQYBX+W7rkxNNCIx5DWJdelN0UafW25nH69uezsaJdhg7AzgeGbN
 MtbICdYi9yKTCW+WNFcknoNkhKM1K3Rd+UFGu0FlVOFK8S2SmWduqNsiQzyxTjLXjL1x0xWvioj1b3xrHNNzTGLsskGuTlO6kg4T7Wsle/bYkqB1oA+cld/p
 c1rBtzwSPviEV9MFBTHmtk4LFQfRmql3cyEC0ETWKlpLQBaFOHyGGvzlXY2bWusOF83mmFamWnhim/8QgaFPFA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 80c1c54a2aa3c5177f73fc5d505668df56fb28b6:

  Merge tag 'v5.13-rc4' into media_tree (2021-06-02 10:59:50 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14h

for you to fetch changes up to c975bf843c20b4875f91e9eaf863c5431824bfa5:

  MAINTAINERS: add xisc files to isc driver entry (2021-06-03 12:45:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Eugen Hristev (33):
      media: atmel: atmel-isc: specialize gamma table into product specific
      media: atmel: atmel-isc: specialize driver name constant
      media: atmel: atmel-isc: add checks for limiting frame sizes
      media: atmel: atmel-isc: specialize max width and max height
      media: atmel: atmel-isc: specialize dma cfg
      media: atmel: atmel-isc: extract CSC submodule config into separate function
      media: atmel: atmel-isc-base: add id to clock debug message
      media: atmel: atmel-isc: create register offsets struct
      media: atmel: atmel-isc: extract CBC submodule config into separate function
      media: atmel: atmel-isc: add CBC to the reg offsets struct
      media: atmel: atmel-isc: add SUB422 and SUB420 to register offsets
      media: atmel: atmel-isc: add RLP to register offsets
      media: atmel: atmel-isc: add HIS to register offsets
      media: atmel: atmel-isc: add DMA to register offsets
      media: atmel: atmel-isc: add support for version register
      media: atmel: atmel-isc: add his_entry to register offsets
      media: atmel: atmel-isc: add register description for additional modules
      media: atmel: atmel-isc: extend pipeline with extra modules
      media: atmel: atmel-isc: add CC initialization function
      media: atmel: atmel-isc: create product specific v4l2 controls config
      media: atmel: atmel-isc: create callback for DPC submodule product specific
      media: atmel: atmel-isc: create callback for GAM submodule product specific
      media: atmel: atmel-isc: create callback for RLP submodule product specific
      media: atmel: atmel-isc: move the formats list into product specific code
      media: atmel: atmel-isc: create an adapt pipeline callback for product specific
      media: atmel: atmel-isc-regs: add additional fields for sama7g5 type pipeline
      media: atmel: atmel-isc-base: add support for more formats and additional pipeline modules
      media: atmel: atmel-isc-sama5d2: remove duplicate define
      dt-bindings: media: atmel-isc: convert to yaml
      dt-bindings: media: add microchip,xisc device bindings
      media: atmel: atmel-isc: add microchip-xisc driver
      MAINTAINERS: update ISC driver bindings file
      MAINTAINERS: add xisc files to isc driver entry

John Cox (1):
      media: hevc: Add sps_max_sub_layers_minus1 to v4l2_ctrl_hevc_sps

Tomi Valkeinen (3):
      media: videobuf2-v4l2.c: add vb2_queue_change_type() helper
      media: vivid: remove stream_sliced_vbi_cap field
      media: vivid: use vb2_queue_change_type

 Documentation/devicetree/bindings/media/atmel,isc.yaml      | 114 ++++++++
 Documentation/devicetree/bindings/media/atmel-isc.txt       |  65 -----
 Documentation/devicetree/bindings/media/microchip,xisc.yaml | 129 ++++++++
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst   |   3 +
 MAINTAINERS                                                 |   4 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c             |  14 +
 drivers/media/platform/Makefile                             |   1 +
 drivers/media/platform/atmel/Kconfig                        |  11 +
 drivers/media/platform/atmel/Makefile                       |   2 +
 drivers/media/platform/atmel/atmel-isc-base.c               | 381 +++++++++---------------
 drivers/media/platform/atmel/atmel-isc-regs.h               | 133 ++++++++-
 drivers/media/platform/atmel/atmel-isc.h                    | 122 ++++++--
 drivers/media/platform/atmel/atmel-sama5d2-isc.c            | 300 ++++++++++++++++++-
 drivers/media/platform/atmel/atmel-sama7g5-isc.c            | 630 ++++++++++++++++++++++++++++++++++++++++
 drivers/media/test-drivers/vivid/vivid-core.c               |  44 ++-
 drivers/media/test-drivers/vivid/vivid-core.h               |   1 -
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c        |   2 +-
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c            |   8 +-
 include/media/hevc-ctrls.h                                  |   3 +-
 include/media/videobuf2-v4l2.h                              |  16 +
 20 files changed, 1628 insertions(+), 355 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/atmel,isc.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
 create mode 100644 Documentation/devicetree/bindings/media/microchip,xisc.yaml
 create mode 100644 drivers/media/platform/atmel/atmel-sama7g5-isc.c
