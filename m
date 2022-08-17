Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1FBF596C7A
	for <lists+linux-media@lfdr.de>; Wed, 17 Aug 2022 11:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238702AbiHQJ4r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Aug 2022 05:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238630AbiHQJ4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Aug 2022 05:56:44 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233F071993;
        Wed, 17 Aug 2022 02:56:38 -0700 (PDT)
X-UUID: 29be9b32c3f140379a664559509f0b39-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LJK1KjOTunK2LguQ4tXHcFPk+ItsloPq/KsrHyyWyeo=;
        b=OKdq4OgMv0S4dprd1Rp6MmwxDdw2i84MK4Les30uyuepiGGUf26c9kga94oZJhnKm+njC+O260F71ss3R/hk/yd8VAoDEzlGRnQPVx09lA6EWKMAa9Vlyf7VYG02IRv3QKmQOHes4eW+zuwMoi38Cpth1HoGZb2LxB92KvuP4QY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:315a9f1c-52ad-4792-9792-ae65cfc6e204,OB:10,
        LOB:30,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Rel
        ease_Ham,ACTION:release,TS:70
X-CID-INFO: VERSION:1.1.10,REQID:315a9f1c-52ad-4792-9792-ae65cfc6e204,OB:10,LO
        B:30,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_
        GS981B3D,ACTION:quarantine,TS:70
X-CID-META: VersionHash:84eae18,CLOUDID:74be93fd-9e71-4a0f-ba6b-417998daea35,C
        OID:6d83840ab3ee,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 29be9b32c3f140379a664559509f0b39-20220817
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <moudy.ho@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 150249112; Wed, 17 Aug 2022 17:56:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 17 Aug 2022 17:56:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 17 Aug 2022 17:56:30 +0800
From:   Moudy Ho <moudy.ho@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <tfiga@chromium.org>, <drinkcat@chromium.org>,
        <pihsun@chromium.org>, <hsinyi@google.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <cellopoint.kai@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v25 0/4] media: mediatek: support mdp3 on mt8183 platform
Date:   Wed, 17 Aug 2022 17:56:25 +0800
Message-ID: <20220817095629.29911-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change since v24:
- Rebase on v6.0-rc1.

Change since v23:
- Rebase on linux-next.
- Fix compilation error.

Change since v22:
- Rebase on linux-next.
- Fix typo about MDP3 in Kconfig.
- Adjust some non-essential logs to lower levels.

Change since v21:
- Rebase on linux-next.
- Following Hans suggestion, remove redundant kernel logs and
  revise a few non-functional code to make it clearer.
- Remove API abuse to set plane size.
- Added VPU send message failure error code for previous shortages.

Change since v20:
- Rebase on linux-next.
- Move the MDP3 GCE events to the corresponding node and adjust the
  relevant driver settings.

Change since v19:
- Rebase on linux-next.
- Export the function "mdp_cmdq_send" suggected by CK.
- Fix "Macro argument reuse" reported by checkpatch.pl

Change since v18:
- Rebase on linux-next.
- Adjust copyright date of MDP3 driver.
- Functions renaming as follows:
  [1] is_output_disable() => is_output_disabled()
  [2] mdp_component_init() => mdp_comp_config()
  [3] mdp_component_deinit() => mdp_comp_destroy()
  [4] mdp_comp_ctx_init() => mdp_comp_ctx_config()
  [5] mdp_sub_comps_create() => mdp_comp_sub_create()
- Document MDP3 10-bit format descriptions in "mtk-mdp3-regs.c".
- Add error control for functions mdp_comp_clocks_on and mdp_comp_clock_on.
- Moved function "mtk_mutex_put" from function
  "mdp_comp_destroy"(renamed from mdp_component_deinit) to avoid semantic ambiguity.
- For some allocated parameters, assign a value of NULL after freeing
  to avoid the possibility of repeated use.
- Removed unnecessary timestamp pass flow.
- About parameters passed by the user in function "mdp_try_fmt_mplane", add relevant checks to
  clamp them in a reasonable range to avoid the possibility of overflow

Change since v17:
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=649104
- In response to future CMDQ api changes listed below:
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220608144055.27562-1-chunkuang.hu@kernel.org/
  adjust CMDQ flush and callback flow in MDP3.

Change since v16:
- Rebased on v5.19-rc1
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=646131
- In response to MUTEX changes, adjust API naming and parameters when
  used in function "mdp_path_subfrm_require".
- Remove unnecessary MDP3 phandle in 8183 dts.

Change since v15:
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=640926
- Split the bindings under ./soc/mediatek into a separate patch.
- Fix data abort in "mdp_auto_release_work"
- Adjust the steps in the function "mdp_cmdq_send" to make the error handling
  more reasonable

Change since v14:
- Rebase on v5.18-rc6
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=640926
- In response to CMDQ API change, replace the function "cmdq_pkt_flush_async"
  with the standard APIs of mbox
- Fix the description of "mediatek,gce-client-reg" property in MDP3-related
  bindings

Change since v13:
- Rebase on v5.18-rc4
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=636041
- Remove advanced functionality about ISP settings for direct link cases.
- Remove the software designation in the mt8183 dts and
  revise corresponding bindings.

Change since v12:
- Rebase on linux-next
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=630948
- Remove messages related to routing information in MDP3, and leave the related
  settings in MMSYS.
- Remove unnecessary phandle and redundant property in RDMA dt-binding and
  adjust the corresponding driver.
- Revise MDP3 node name in dts. 
- Removed unnecessary functions, mutex and work queue in MDP3 driver
- Fixed format mapping error for V4L2_PIX_FMT_RGB565X

Change since v11:
- Rebase on linux-next tag:next-20220316
- Depend on:
  [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=624281
- Remove redundant hardware index in data-binding suggested by Rob Herring.
- Referring to Rob Herring's suggestion to improve some descriptions in the
  RDMA dt-binding
- Move MDP3 file folder from "./drive/media/platform/mtk-mdp3" to
  "./driver/media/platform/mediatek/mdp3"
- Fixed the V4L2 and MDP color format mapping error in RGB565 which
  checked by Benjamin Gaignard

Change since v10:
- The routing table needs to be discarded, and the calculation result
  on the SCP side is used to write a suitable mux setting for
  1 input port and 2 output ports.
- Adjust dts parsing flow to remove redundant HW IDs.
- Fix memory leak caused by no free path information in function "mdp_cmdq_send".

Change since v9:
- Keep only the MDP3 driver patches and split the remaining mmsys and
  mutex patches into another mail.
- Move mutex mod settings to corresponding driver and make relevant adjustments
  for this in MDP3 driver.
- Fix compile warning reported by kernel test robot.

Change since v8:
- Rebase on v5.16-rc2.
- Refer to Angelo's suggestion, adjust the register writing format to increase
  readability and significance.
- Refer to Angelo's suggestion, adjust or reduce inappropriate debugging
  messages.
- Refer to Rob Herring's suggestion to correct the the binding file
  to make it with the specification.
- Fix compile warning reported by kernel test robot.

Change since v7:
- Rebase on v5.15-rc6.
- Revise several V4L2 M2M settings to pass v4l2-compliance test.
- Integrate those same component dt-binding documents of DRM and MDP, and
  move them under the MMSYS domain.
- Split MMSYS and MUTEX into two different files according to
  their functional properties.

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
- fix compliance test fail item (m2m cmd with -f) due to there is two problem in
  runing all format(-f) cmd:
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

Hi,

This patch is used to present Media Data Path 3 (MDP3)
which provided scaling and color format conversion.
support using GCE to write register in critical time limitation.
support V4L2 m2m device control.

Moudy Ho (4):
  dt-binding: mediatek: add bindings for MediaTek MDP3 components
  dt-binding: mediatek: add bindings for MediaTek CCORR and WDMA
  arm64: dts: mt8183: add MediaTek MDP3 nodes
  media: platform: mtk-mdp3: add MediaTek MDP3 driver

 .../bindings/media/mediatek,mdp3-rdma.yaml    |   95 ++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |   77 ++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |   80 ++
 .../bindings/soc/mediatek/mediatek,ccorr.yaml |   68 ++
 .../bindings/soc/mediatek/mediatek,wdma.yaml  |   81 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   63 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/mdp3/Kconfig  |   20 +
 drivers/media/platform/mediatek/mdp3/Makefile |    6 +
 .../platform/mediatek/mdp3/mdp_reg_ccorr.h    |   19 +
 .../platform/mediatek/mdp3/mdp_reg_rdma.h     |   65 ++
 .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   39 +
 .../platform/mediatek/mdp3/mdp_reg_wdma.h     |   47 +
 .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   55 +
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |  290 +++++
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  466 ++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   43 +
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 1031 +++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  186 +++
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  357 ++++++
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |   94 ++
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  724 ++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |   48 +
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  733 ++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |  373 ++++++
 .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |  313 +++++
 .../platform/mediatek/mdp3/mtk-mdp3-vpu.h     |   78 ++
 28 files changed, 5453 insertions(+)
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

-- 
2.18.0

