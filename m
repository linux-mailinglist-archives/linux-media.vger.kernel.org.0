Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C076355119
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237995AbhDFKoc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:44:32 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:57571 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229787AbhDFKoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:44:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TjC0l4Pqx43ycTjC4lNbKY; Tue, 06 Apr 2021 12:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617705864; bh=U9js880s2lWVcDDmhDqa2vbCL3AW9bev9kFZtSGU+ko=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gF4jDXewZl++0kXw3IYMqkJepx14fVsc+CPKboRuwRsdqm7LD4DQxy/YMCXRdqY+E
         gXLJCCE4k+u78fSMGDlqUF3VR8AxwVzXaAI5Pupn0L/2uMh5V2bfDJR9VGJscIIUqi
         nncrG0sCRR7mpo8jp2xiojPmouL5M7PkEaHIhVGddAPt9Afa04OWtS6ncdyHv9pUn6
         YuN2bzqPG6y8LTB6JnJG8KVZvzhJwJ3mOcNgK4pv2HeXObTAOHYw5X8Occ0ibgA8Sr
         Y8hXF4BgE7CTqrVpAc76NApswJBByhc6znOYGwjKbN4vk1R1igTZwZjLCz9oPPe3ns
         32gYaBG2ga4lg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes and enhancements
Message-ID: <f4f3897a-c55d-162e-0ddb-5657a04789a9@xs4all.nl>
Date:   Tue, 6 Apr 2021 12:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLb8L5dK8OpWHWWRALHseZ2EXB75xw1SfY7/l6JfbzzVvuKqb/cAUHHQy3KPYvSDBr03Va7iFj5/8d+IdSeY6+rKT7xBmiNy5IXfOA19I8O3EDhk85Ih
 FpiLOIz6tig9kzzVGFtcu23yXTTDgORcc3eOOhu7BT8r1WvTMfJb48tOMg2duW0rE6FmaY4V1JpwEcbQyDGnOKqd+o1PTrbWJTk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 97b34809ec240d82c82af97626c2071a4062e0e6:

  media: staging: atomisp: reduce kernel stack usage (2021-03-23 16:55:52 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13d

for you to fetch changes up to 46c2b36f0d409a918cab39fd345295a8dbc4e833:

  media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not default to m (2021-04-06 11:40:34 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (3):
      media: cx23885: switch from 'pci_' to 'dma_' API
      media: tw686x: switch from 'pci_' to 'dma_' API
      media: tw68: switch from 'pci_' to 'dma_' API

Fabio Estevam (1):
      media: imx-pxp: Remove unneeded of_match_ptr()

Geert Uytterhoeven (1):
      media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not default to m

Hans Verkuil (3):
      vivid: add read-only int32 control
      v4l2-ctrls.c: fix race condition in hdl->requests list
      cec/core: clarify rx-arb-lost usage message

Irui Wang (2):
      dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder node
      media: mtk-vcodec: Separating mtk encoder driver

Wan Jiabing (2):
      cx231xx/cx231xx.h: Remove repeated struct declaration
      em28xx/em28xx.h: Remove duplicate struct declaration

Yang Yingliang (5):
      media: imx-pxp: remove redundant dev_err call in pxp_probe()
      media: ti-vpe: csc: remove redundant dev_err call in csc_create()
      media: ti-vpe: sc: remove redundant dev_err call in sc_create()
      media: camss: csiphy: Remove redundant dev_err call in msm_csiphy_subdev_init()
      media: camss: csid: Remove redundant dev_err call in msm_csid_subdev_init()

 Documentation/devicetree/bindings/media/mediatek-vcodec.txt |  55 ++++++++++----------
 Documentation/userspace-api/media/cec/cec-pin-error-inj.rst |   2 +-
 drivers/media/cec/core/cec-pin-error-inj.c                  |   2 +-
 drivers/media/pci/cx23885/cx23885-alsa.c                    |   2 +-
 drivers/media/pci/cx23885/cx23885-core.c                    |  13 +++--
 drivers/media/pci/tw68/tw68-core.c                          |   2 +-
 drivers/media/pci/tw68/tw68-risc.c                          |   3 +-
 drivers/media/pci/tw68/tw68-video.c                         |   2 +-
 drivers/media/pci/tw686x/tw686x-audio.c                     |  13 ++---
 drivers/media/pci/tw686x/tw686x-core.c                      |   2 +-
 drivers/media/pci/tw686x/tw686x-video.c                     |  17 +++----
 drivers/media/platform/imx-jpeg/Kconfig                     |   2 +-
 drivers/media/platform/imx-pxp.c                            |   9 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h          |   7 +--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c          |  18 ++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 108 +++++++++++++++-------------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c       |  40 +++------------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c        |   4 +-
 drivers/media/platform/qcom/camss/camss-csid.c              |   4 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c            |   8 +--
 drivers/media/platform/ti-vpe/csc.c                         |   4 +-
 drivers/media/platform/ti-vpe/sc.c                          |   4 +-
 drivers/media/test-drivers/vivid/vivid-core.h               |   1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c              |  13 +++++
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c        |  10 ++--
 drivers/media/usb/cx231xx/cx231xx.h                         |   2 -
 drivers/media/usb/em28xx/em28xx.h                           |   2 -
 drivers/media/v4l2-core/v4l2-ctrls.c                        |  17 +++++--
 28 files changed, 170 insertions(+), 196 deletions(-)
