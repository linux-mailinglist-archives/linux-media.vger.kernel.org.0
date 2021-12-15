Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38651475340
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 07:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240328AbhLOG7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 01:59:36 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:33818 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S240111AbhLOG7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 01:59:35 -0500
X-UUID: d5b03fa50e894d04b14890c5d20a2845-20211215
X-UUID: d5b03fa50e894d04b14890c5d20a2845-20211215
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1132211518; Wed, 15 Dec 2021 14:59:29 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 15 Dec 2021 14:59:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:59:26 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Steve Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 00/12] media: mtk-vcodec: support for MT8192 h264 decoder
Date:   Wed, 15 Dec 2021 14:59:14 +0800
Message-ID: <20211215065926.8761-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for mt8192 h264 decoder. Firstly, need to refactor
power/clk/irq interface for mt8192 is lat and core architecture. Secondly,
add new functions to get frame buffer size and resolution according to decoder
capability from scp side. Then add callback function to get/put capture buffer
in order to enable lat and core decoder in parallel. Then add to support MT21C
compressed mode and fix v4l2-compliance fail. Next, extract H264 request
api driver to let mt8183 and mt8192 use the common code, at last, add mt8192 h264
slice api driver.

Patches 1 refactor power/clk/irq interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5~6 enable lat and core decode in parallel.
Patch 7~10 Add to support MT21C compressed mode and fix v4l2-compliance fail.
Patch 11~12 extract h264 driver and add mt8192 h264 slice api driver
----
Dependents on "Support multi hardware decode using of_platform_populate"[1].

This patches are the second part used to add mt8192 h264 decoder. And the base part is [1].

[1]https://patchwork.linuxtv.org/project/linux-media/cover/20211215061552.8523-1-yunfei.dong@mediatek.com/
----
Yunfei Dong (12):
  media: mtk-vcodec: Add vdec enable/disable hardware helpers
  media: mtk-vcodec: Using firmware type to separate different firmware
    architecture
  media: mtk-vcodec: get frame buffer size from scp
  media: mtk-vcodec: Read max resolution from dec_capability
  media: mtk-vcodec: Call v4l2_m2m_set_dst_buffered() set capture buffer
    buffered
  media: mtk-vcodec: Refactor get and put capture buffer flow
  media: mtk-vcodec: Refactor supported vdec formats and framesizes
  media: mtk-vcodec: Add format to support MT21C
  media: mtk-vcodec: disable vp8 4K capability
  media: mtk-vcodec: Fix v4l2-compliance fail
  media: mtk-vcodec: Extract H264 common code
  media: mtk-vcodec: Add h264 slice api driver for mt8192

 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  49 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 162 +++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |   6 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  14 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 245 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  27 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c |   6 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   1 +
 .../mtk-vcodec/vdec/vdec_h264_req_common.c    | 303 +++++++++
 .../mtk-vcodec/vdec/vdec_h264_req_common.h    | 247 +++++++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 402 +-----------
 .../mtk-vcodec/vdec/vdec_h264_req_lat_if.c    | 620 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  28 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  36 +
 .../platform/mtk-vcodec/vdec_msg_queue.c      |   2 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  55 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  15 +
 include/linux/remoteproc/mtk_scp.h            |   2 +
 21 files changed, 1672 insertions(+), 556 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c

-- 
2.25.1

