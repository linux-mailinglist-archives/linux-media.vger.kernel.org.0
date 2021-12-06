Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B293469985
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 15:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344681AbhLFO4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 09:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344644AbhLFO4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 09:56:22 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDD7C061746
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 06:52:53 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uFMFm2CAAlcdAuFMImjjyr; Mon, 06 Dec 2021 15:52:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638802371; bh=hZhse3C3bomKK3dwmsZ85S3wE+dPfl94RYsqtdhJkZM=;
        h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From:
         Subject;
        b=SjFSC0kV7cU7/1vJtCRcEcpoBtq0amhyafDmEPZyl0cU5aZqj6QHvWU0Qxh9xP4mG
         TkpYdWP7DerFfoAGQ+ZyJhjRfwa6d/XHnrZTqdrx7HdVHgtcujwEbx3FPj7qJ0AAdg
         x8pSrAAEVGg3U8LRdk/q9SCEa+afx9os6o/Ll/1kE4iUxT0bHVEJBoFeLk9R0x4tWj
         FJPy6ZBEph5HFwIp0izs/eQdzQK0KdxbDYjUmPNb1EDqwCgn7xeipZixynggJe3JKL
         3gntku3CExRVcJyXj6ghptMp7GAeC/TbwBMYzpHK8q/HrPJN16Hvs16YYa+fy6ZxBj
         HuoQg6klI6w0Q==
Message-ID: <e85c97e7-cdd1-db38-5c9a-5455cd83e6ad@xs4all.nl>
Date:   Mon, 6 Dec 2021 15:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] Mediatek improvements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO5Gc3AljK+1rZqA2EI1fgZqQFAjT5x7JAP3UEVI0jEPEfTNK8q4UcECqjvqCYqEkHSQEFLIUktXEeLwiO3pNLC2KplBYAalCaI39/9hSema7Zs2z2bt
 eF3j6W2Tow2XZdYyzvfyETHNWiwLzuoZgHPCrCpQTfSsiY9H6cuZJwH/OzNOCPGgH7FVsBiOHiwhLXQZvaruTR3QiPd/9qKcMg/LghpJe1SjE6z6cTDRLLZa
 bTQY7R9i2E2lqiAhtyI07obTddZwnvATr017oh5Y+Zwg7gMs23RpkVbCY+bgl9v1yhXMdMThxaKUtF3fG74CPljR2QIZ/F7AHIJO83WZSNLdCWoA8oc8irZV
 nNjWnQLzL8voZL3tFVuTQ2LAxquBruILauUG0Ze6rBRKQmEREN1LRuslehRdTlvuchHrHspg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This PR contains the patches from these two series (minus the dts patches):

https://patchwork.linuxtv.org/project/linux-media/list/?series=6887
https://patchwork.linuxtv.org/project/linux-media/list/?series=6698

The second series depends on the first.

The second series contains patches for different subsystems, but since they
all depend on the iommu changes, and since most of the patches are media
related, this series goes in through the media subsystem. That made the most
sense. I believe all the correct Acks are collected for this.

Regards,

	Hans

The following changes since commit b0f7d9b6d81209f87cabd45c91458dd745d84924:

  media: docs: media: Fix imbalance of LaTeX group (2021-12-06 13:23:03 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17f

for you to fetch changes up to 4a3482c6afb179e282353cdb343545b8ad985d95:

  memory: mtk-smi: Get rid of mtk_smi_larb_get/put (2021-12-06 15:41:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hsin-Yi Wang (2):
      dt-bindings: mediatek: convert mtk jpeg decoder/encoder to yaml
      dt-bindings: mediatek: Add mediatek, mt8183-jpgenc compatible

Yong Wu (12):
      dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
      iommu/mediatek-v1: Free the existed fwspec if the master dev already has
      iommu/mediatek: Return ENODEV if the device is NULL
      iommu/mediatek: Add probe_defer for smi-larb
      iommu/mediatek: Add device_link between the consumer and the larb devices
      media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
      media: mtk-mdp: Get rid of mtk_smi_larb_get/put
      drm/mediatek: Get rid of mtk_smi_larb_get/put
      media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
      media: mtk-vcodec: dec: Remove mtk_vcodec_release_dec_pm
      media: mtk-vcodec: enc: Remove mtk_vcodec_release_enc_pm
      memory: mtk-smi: Get rid of mtk_smi_larb_get/put

Yongqiang Niu (1):
      drm/mediatek: Add pm runtime support for ovl and rdma

 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt |  9 -----
 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt    | 38 ---------------------
 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml   | 80 ++++++++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt    | 35 -------------------
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml   | 72 +++++++++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/mediatek-mdp.txt             |  8 -----
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt          |  4 ---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                              |  8 ++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                             |  9 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c                              | 15 +++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                          | 36 ++------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h                          |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                               |  5 +--
 drivers/iommu/mtk_iommu.c                                            | 34 +++++++++++++++++++
 drivers/iommu/mtk_iommu_v1.c                                         | 42 ++++++++++++++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c                      | 45 ++-----------------------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h                      |  2 --
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c                        | 40 ----------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h                        |  2 --
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c                        |  1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c               |  8 +++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c                | 46 ++++---------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h                |  3 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h                   |  3 --
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c                   |  1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c               |  6 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c                | 52 ++++------------------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h                |  3 +-
 drivers/memory/mtk-smi.c                                             | 14 --------
 include/soc/mediatek/smi.h                                           | 20 -----------
 30 files changed, 277 insertions(+), 365 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
