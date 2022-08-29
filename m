Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5711A5A4394
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 09:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiH2HNG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 03:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiH2HNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 03:13:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E674D815
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 00:13:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2373E6112F
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 07:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198E3C433C1;
        Mon, 29 Aug 2022 07:13:01 +0000 (UTC)
Message-ID: <5e3b154a-5075-62fd-2eea-3ff3d147010c@xs4all.nl>
Date:   Mon, 29 Aug 2022 09:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Moudy Ho <moudy.ho@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.1] Add MediaTek MDP3 driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



The following changes since commit 1ff8334f0a4e0be693066aafba195d25629d77aa:

  media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver (2022-08-21 08:42:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.1c

for you to fetch changes up to 56ef9c1c2a40f25e184712fbda5ae5b6900a3de1:

  media: platform: mtk-mdp3: add MediaTek MDP3 driver (2022-08-24 10:36:22 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Moudy Ho (3):
      dt-binding: mediatek: add bindings for MediaTek MDP3 components
      dt-binding: mediatek: add bindings for MediaTek CCORR and WDMA
      media: platform: mtk-mdp3: add MediaTek MDP3 driver

 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml    |   95 ++++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml     |   77 +++++
 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml    |   80 ++++++
 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml |   68 +++++
 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml  |   81 ++++++
 drivers/media/platform/mediatek/Kconfig                            |    1 +
 drivers/media/platform/mediatek/Makefile                           |    1 +
 drivers/media/platform/mediatek/mdp3/Kconfig                       |   21 ++
 drivers/media/platform/mediatek/mdp3/Makefile                      |    6 +
 drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h               |   19 ++
 drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h                |   65 +++++
 drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h                 |   39 +++
 drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h                |   47 +++
 drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h                |   55 ++++
 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h                 |  290 +++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c               |  466 ++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h               |   43 +++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c               | 1033 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h               |  186 ++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c               |  357 +++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h               |   94 ++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c                |  724 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h                |   48 ++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c               |  735 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h               |  373 ++++++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c                |  313 ++++++++++++++++++++
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h                |   78 +++++
 27 files changed, 5395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
 create mode 100644 drivers/media/platform/mediatek/mdp3/Kconfig
 create mode 100644 drivers/media/platform/mediatek/mdp3/Makefile
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.h
