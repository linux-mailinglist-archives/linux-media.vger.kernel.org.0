Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3B944E4E6
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 11:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhKLK6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 05:58:14 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:56346 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231173AbhKLK6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 05:58:13 -0500
X-UUID: 5ea3f3fd822e4666bea50bc46969acd7-20211112
X-UUID: 5ea3f3fd822e4666bea50bc46969acd7-20211112
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1497426684; Fri, 12 Nov 2021 18:55:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 12 Nov 2021 18:55:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Nov 2021 18:55:15 +0800
From:   Yong Wu <yong.wu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>
CC:     Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
        <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
        <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
        <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Eizan Miyamoto <eizan@chromium.org>,
        <anthony.huang@mediatek.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>,
        <libo.kang@mediatek.com>
Subject: [PATCH v9 00/15] Clean up "mediatek,larb"
Date:   Fri, 12 Nov 2021 18:54:54 +0800
Message-ID: <20211112105509.12010-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MediaTek IOMMU block diagram always like below:

        M4U
         |
    smi-common
         |
  -------------
  |         |  ...
  |         |
larb1     larb2
  |         |
vdec       venc

All the consumer connect with smi-larb, then connect with smi-common.

When the consumer works, it should enable the smi-larb's power which also
need enable the smi-common's power firstly.

Thus, Firstly, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

After adding the device_link, then "mediatek,larb" property can be removed.
the iommu consumer don't need call the mtk_smi_larb_get/put to enable
the power and clock of smi-larb and smi-common.

Base on a jpeg dt-bing patchset[1] that already got the necessary R-b.

This patchset cross several tree, From [2], the media tree should be a good choice.

[1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
[2] https://lore.kernel.org/linux-mediatek/e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com/

Change notes:
v9: 1) Add return -ENODEV when the dev is null.
    2) Add more strict about the case that a iommu consume device use the ports in
    different larbs. Don't allow this case.
    3) Remove two codec interface: mtk_vcodec_release_enc/dec_pm since it only has one
    line now.

v8: https://lore.kernel.org/linux-mediatek/20210929013719.25120-1-yong.wu@mediatek.com/
    1) Rebase on v5.15-rc1.
    2) Don't rebase the below mdp patchset that may still need more discuss.
    https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/
    3) Add Frank's Tested-by. Remove Dafna's Tested-by as he requested.

v7: https://lore.kernel.org/linux-mediatek/20210730025238.22456-1-yong.wu@mediatek.com/
    1) Fix a arm32 boot fail issue. reported from Frank.
    2) Add a return fail in the mtk drm. suggested by Dafna.

v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
    1) rebase on v5.14-rc1.
    2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
    3) Remove the patches about using pm_runtime_resume_and_get since they have
       already been merged by other patches.

v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
    1) Base v5.12-rc2.
    2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
    independent patch.

v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/ 
    base on v5.7-rc1.
  1) Move drm PM patch before smi patchs.
  2) Change builtin_platform_driver to module_platform_driver since we may need
     build as module.
  3) Rebase many patchset as above.

v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
    1) rebase on v5.3-rc1 and the latest mt8183 patchset.
    2) Use device_is_bound to check whether the driver is ready from Matthias.    
    3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
   reason in the commit message[3/14].
    4) Add a display patch[12/14] into this series. otherwise it may affect
   display HW fastlogo even though it don't happen in mt8183.
   
v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
   1) rebase on v5.2-rc1.
   2) Move adding device_link between the consumer and smi-larb into
iommu_add_device from Robin.
   3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
   4) Remove the shutdown callback in iommu.   

v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/

Yong Wu (14):
  dt-binding: mediatek: Get rid of mediatek, larb for multimedia HW
  iommu/mediatek-v1: Free the existed fwspec if the master dev already
    has
  iommu/mediatek: Return ENODEV if the device is NULL
  iommu/mediatek: Add probe_defer for smi-larb
  iommu/mediatek: Add device_link between the consumer and the larb
    devices
  media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
  media: mtk-mdp: Get rid of mtk_smi_larb_get/put
  drm/mediatek: Get rid of mtk_smi_larb_get/put
  media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
  media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
  media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
  memory: mtk-smi: Get rid of mtk_smi_larb_get/put
  arm: dts: mediatek: Get rid of mediatek, larb for MM nodes
  arm64: dts: mediatek: Get rid of mediatek, larb for MM nodes

Yongqiang Niu (1):
  drm/mediatek: Add pm runtime support for ovl and rdma

 .../display/mediatek/mediatek,disp.txt        |  9 ----
 .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
 .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
 .../bindings/media/mediatek-mdp.txt           |  8 ---
 .../bindings/media/mediatek-vcodec.txt        |  4 --
 arch/arm/boot/dts/mt2701.dtsi                 |  2 -
 arch/arm/boot/dts/mt7623n.dtsi                |  5 --
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 ------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  8 ++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
 drivers/iommu/mtk_iommu.c                     | 34 ++++++++++++
 drivers/iommu/mtk_iommu_v1.c                  | 42 ++++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +---------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 --------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  8 +--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 46 +++-------------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  3 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  6 +--
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 52 +++----------------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  3 +-
 drivers/memory/mtk-smi.c                      | 14 -----
 include/soc/mediatek/smi.h                    | 20 -------
 32 files changed, 125 insertions(+), 339 deletions(-)

-- 
2.18.0


