Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94023F140C
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 09:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhHSHKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 03:10:37 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:59548 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231766AbhHSHKg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 03:10:36 -0400
X-UUID: e730cd5dbab8412fb02c42e9bac1bcf2-20210819
X-UUID: e730cd5dbab8412fb02c42e9bac1bcf2-20210819
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 312520947; Thu, 19 Aug 2021 15:09:57 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 15:09:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Aug 2021 15:09:55 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
        <drinkcat@chromium.org>, <acourbot@chromium.org>,
        <pihsun@chromium.org>, <menghui.lin@mediatek.com>,
        <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
        <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>,
        <hsinyi@google.com>
Subject: [PATCH v6 0/5] media: mediatek: support mdp3 on mt8183 platform
Date:   Thu, 19 Aug 2021 15:09:49 +0800
Message-ID: <20210819070954.16679-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v5:
- Rebase on v5.14-rc6.
- Move MMSYS/Mutex settings to corresponding driver.
- Revise the software license description and copyright.
- Remove unnecessary enum. or definitions.
- Optimize platform/chip definition conditions.
- Use general printing functions instead of MDP3 private ones.
- Fix compile warning.

Changes since v4:
- Rebase on v5.13-rc1.
- Remove the CMDQ flush flow to match the CMDQ API change.
- Integrate four of MDP's direct-link subcomponents into MDP controller node
  from syscon node to avoid illegal clock usage.
- Rewrite dt-binding in a JSON compatible subset of YAML
- Fix a bit of macro argument precedence.

Changes since v3:
- Rebase on v5.9-rc1.
- modify code for review comment from Rob Herring, cancel multiple nodes using
  same register base situation.
- control IOMMU port through pm runtime get/put to DMA components' device.
- SCP(VPU) driver revision.
- stop queuing jobs(remove flush_workqueue()) after mdp_m2m_release().
- add computation of plane address with data_offset.
- fix scale ratio check issue.
- add default v4l2_format setting.

Changes since v2:
- modify code for review comment from Tomasz Figa & Alexandre Courbot
- review comment from Rob Herring will offer code revision in v4, due to
  it's related to device node modification, will need to modify code
  architecture

Changes since v1:
- modify code for CMDQ v3 API support
- EC ipi cmd migration
- fix compliance test fail item (m2m cmd with -f) due to there is two problem in runing all format(-f) cmd:
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

Moudy Ho (5):
  soc: mediatek: mmsys: Add support for MDP
  soc: mediatek: mutex: add support for MDP
  dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  dts: arm64: mt8183: Add Mediatek MDP3 nodes
  media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mdp3-ccorr.yaml   |   58 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |  241 +++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   66 +
 .../bindings/media/mediatek,mdp3-wdma.yaml    |   71 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   71 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  110 ++
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-mdp3/Makefile      |    7 +
 drivers/media/platform/mtk-mdp3/isp_reg.h     |   27 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  281 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  508 ++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   47 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1357 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  148 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  300 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  802 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  747 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  314 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
 drivers/soc/mediatek/mt8183-mmsys.h           |  235 +++
 drivers/soc/mediatek/mtk-mmsys.c              |  164 ++
 drivers/soc/mediatek/mtk-mmsys.h              |    9 +-
 drivers/soc/mediatek/mtk-mutex.c              |  106 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   81 +
 include/linux/soc/mediatek/mtk-mutex.h        |    8 +
 34 files changed, 6564 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
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

