Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D927AF8FB
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 11:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfIKJeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 05:34:15 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:9355 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726702AbfIKJeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 05:34:15 -0400
X-UUID: dfa9b0760f1d4aca9203bd16b526293e-20190911
X-UUID: dfa9b0760f1d4aca9203bd16b526293e-20190911
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <bibby.hsieh@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 803037160; Wed, 11 Sep 2019 17:34:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Sep 2019 17:34:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Sep 2019 17:34:08 +0800
From:   Bibby Hsieh <bibby.hsieh@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <Daoyuan.Huang@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>
Subject: [RFC, v3, 0/4] media: mediatek: support mdp3 on mt8183 platform
Date:   Wed, 11 Sep 2019 17:34:02 +0800
Message-ID: <20190911093406.5688-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

Changes since v2:
- modify code for review comment from Tomasz Figa & Alexandre Courbot
- review comment from Rob Hering will offer code revision in v4, due to
  it's related to device node modification, will need to modify code
  architecture

Changes since v1:
- modify code for CMDQ v3 API support
- EC ipi cmd migration
- fix compliance test fail item (m2m cmd with -f)
due to there is two problem in runing all format(-f) cmd:
1. out of memory before test complete
        Due to capture buffer mmap (refcount + 1) after reqbuf but seems
        no corresponding munmap called before device close.
        There are total 12XX items(formats) in format test and each format
        alloc 8 capture/output buffers.
2. unceasingly captureBufs() (randomly)
        Seems the break statement didn't catch the count == 0 situation:
        In v4l2-test-buffers.cpp, function: captureBufs()
                        ...
                        count--;
                        if (!node->is_m2m && !count)
                                break;
        Log is as attachment

I will paste the test result with problem part in another e-mail

Hi,

This is the first version of RFC patch for Media Data Path 3 (MDP3),
MDP3 is used for scaling and color format conversion.
support using GCE to write register in critical time limitation.
support V4L2 m2m device control.

Ping-Hsun Wu (1):
  dts: arm64: mt8183: Add Mediatek MDP3 nodes

daoyuan huang (3):
  dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  media: platform: Add Mediatek MDP3 driver KConfig
  media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mt8183-mdp3.txt   |  201 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  137 ++
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/mtk-mdp3/Makefile      |    7 +
 drivers/media/platform/mtk-mdp3/isp_reg.h     |   37 +
 .../media/platform/mtk-mdp3/mdp-platform.h    |   58 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   75 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  206 +++
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  109 ++
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  125 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  115 ++
 .../media/platform/mtk-mdp3/mmsys_config.h    |  188 +++
 drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   35 +
 .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   38 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  270 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  504 +++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   54 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1328 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  155 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  277 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   84 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  816 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  739 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  375 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   81 +
 28 files changed, 6389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

-- 
2.18.0

