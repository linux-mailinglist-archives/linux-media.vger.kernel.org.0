Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD70C2BA07F
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 03:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgKTCea (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 21:34:30 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:55690 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726985AbgKTCe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 21:34:28 -0500
X-UUID: 6f86debced76427e9da06cb20af6fb03-20201120
X-UUID: 6f86debced76427e9da06cb20af6fb03-20201120
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <daoyuan.huang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 152737837; Fri, 20 Nov 2020 10:29:18 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 10:29:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 10:29:08 +0800
From:   Daoyuan Huang <daoyuan.huang@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
        <randy.wu@mediatek.com>, <moudy.ho@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH v4 0/4] media: mediatek: support mdp3 on mt8183 platform
Date:   Fri, 20 Nov 2020 10:29:02 +0800
Message-ID: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 396CC85A8D0E16EE1F5570B1027F9616E51282698A71B637A4F9EBCC55A77EA42000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

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

daoyuan huang (4):
  [v4,1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  [v4,2/4] dts: arm64: mt8183: Add Mediatek MDP3 nodes
  [v4,3/4] media: platform: Add Mediatek MDP3 driver KConfig
  [v4,4/4] media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mt8183-mdp3.txt   |  208 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  116 ++
 drivers/media/platform/Kconfig                |   17 +
 drivers/media/platform/Makefile               |    2 +
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
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  281 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  504 ++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   54 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1420 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  155 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  269 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   86 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  795 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   42 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  748 +++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  373 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  313 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   79 +
 28 files changed, 6455 insertions(+)
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

