Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585B73F5B85
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 12:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhHXKBX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 06:01:23 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:43050 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235900AbhHXKBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 06:01:19 -0400
X-UUID: 884c4857c37e4f31973d1d2839daf103-20210824
X-UUID: 884c4857c37e4f31973d1d2839daf103-20210824
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1553220195; Tue, 24 Aug 2021 18:00:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:00:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:00:29 +0800
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
Subject: [PATCH v7 0/5] media: mediatek: support mdp3 on mt8183 platform
Date:   Tue, 24 Aug 2021 18:00:22 +0800
Message-ID: <20210824100027.25989-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v6:
- Refactor GCE event to corresponding node.
- Fix dt_binding_check fail.
- Fix compilation errors.

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
  soc: mediatek: mutex: add support for MDP
  soc: mediatek: mmsys: Add support for MDP
  dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  dts: arm64: mt8183: Add Mediatek MDP3 nodes
  media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mdp3-ccorr.yaml   |   57 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |  207 +++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   65 +
 .../bindings/media/mediatek,mdp3-wdma.yaml    |   71 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   71 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  110 ++
 drivers/media/platform/Kconfig                |   19 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-mdp3/Makefile      |    6 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   19 +
 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h |   27 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   65 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |   39 +
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |   47 +
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   55 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  280 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  507 +++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   46 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1307 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  147 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  329 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   75 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  801 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   41 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  746 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  372 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  312 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   78 +
 drivers/soc/mediatek/mt8183-mmsys.h           |  235 +++
 drivers/soc/mediatek/mtk-mmsys.c              |  164 +++
 drivers/soc/mediatek/mtk-mmsys.h              |    9 +-
 drivers/soc/mediatek/mtk-mutex.c              |  106 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   81 +
 include/linux/soc/mediatek/mtk-mutex.h        |    8 +
 34 files changed, 6495 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_isp.h
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

