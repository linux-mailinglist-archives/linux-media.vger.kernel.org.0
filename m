Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C118489389
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 09:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241264AbiAJIft (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 03:35:49 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:50534 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S241374AbiAJIev (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 03:34:51 -0500
X-UUID: 060744f0e8b542d995152a10f37e3a10-20220110
X-UUID: 060744f0e8b542d995152a10f37e3a10-20220110
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1399925192; Mon, 10 Jan 2022 16:34:46 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 16:34:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 Jan
 2022 16:34:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:34:43 +0800
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
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4, 00/15] media: mtk-vcodec: support for MT8192 decoder
Date:   Mon, 10 Jan 2022 16:34:27 +0800
Message-ID: <20220110083442.32604-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly, refactor
power/clock/interrupt interfaces for mt8192 is lat and core architecture.

Secondly, add new functions to get frame buffer size and resolution according
to decoder capability from scp side. Then add callback function to get/put
capture buffer in order to enable lat and core decoder in parallel. 

Then add to support MT21C compressed mode and fix v4l2-compliance fail.

Next, extract H264 request api driver to let mt8183 and mt8192 use the same
code, and adds mt8192 frame based h264 driver for stateless decoder.

Lastly, add vp8 and vp9 stateless decoder drivers.

Patches 1 to refactor power/clock/interrupt interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5~6 enable lat and core decode in parallel.
Patch 7~10 add to support MT21C compressed mode and fix v4l2-compliance fail.
patch 11 record capture queue format type.
Patch 12~13 extract h264 driver and add mt8192 frame based driver for h264 decoder.
Patch 14~15 add vp8 and vp9 stateless decoder drivers.
----
Dependents on "Support multi hardware decode using of_platform_populate"[1].

This patches are the second part used to add mt8192 h264 decoder. And the base part is [1].

[1]https://patchwork.linuxtv.org/project/linux-media/cover/20211215061552.8523-1-yunfei.dong@mediatek.com/
---
changes compared with v3:
- remove enum mtk_chip for patch 2.
- add vp8 stateless decoder drivers for patch 14.
- add vp9 stateless decoder drivers for patch 15.
changes compared with v2:
- add new patch 11 to record capture queue format type.
- separate patch 4 according to tzung-bi's suggestion.
- re-write commit message for patch 5 according to tzung-bi's suggestion.
changes compared with v1:
- rewrite commit message for patch 12.
- rewrite cover-letter message.
---
Yunfei Dong (15):
  media: mtk-vcodec: Add vdec enable/disable hardware helpers
  media: mtk-vcodec: Using firmware type to separate different firmware
    architecture
  media: mtk-vcodec: get capture queue buffer size from scp
  media: mtk-vcodec: Read max resolution from dec_capability
  media: mtk-vcodec: Call v4l2_m2m_set_dst_buffered() set capture buffer
    buffered
  media: mtk-vcodec: Refactor get and put capture buffer flow
  media: mtk-vcodec: Refactor supported vdec formats and framesizes
  media: mtk-vcodec: Add format to support MT21C
  media: mtk-vcodec: disable vp8 4K capability
  media: mtk-vcodec: Fix v4l2-compliance fail
  media: mtk-vcodec: record capture queue format type
  media: mtk-vcodec: Extract H264 common code
  media: mtk-vcodec: Add h264 decoder driver for mt8192
  media: mtk-vcodec: Add vp8 decoder driver for mt8192
  media: mtk-vcodec: Add vp9 decoder driver for mt8192

 drivers/media/platform/mtk-vcodec/Makefile    |    4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   49 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |    5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  168 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |    6 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   14 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  284 ++-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   40 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |    5 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c |    6 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |    1 +
 .../mtk-vcodec/vdec/vdec_h264_req_common.c    |  311 +++
 .../mtk-vcodec/vdec/vdec_h264_req_common.h    |  254 ++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  416 +---
 .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  |  605 +++++
 .../mtk-vcodec/vdec/vdec_vp8_req_if.c         |  445 ++++
 .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c     | 2066 +++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   36 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |    3 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |   37 +
 .../platform/mtk-vcodec/vdec_msg_queue.c      |    2 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |   54 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   15 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |    2 +-
 include/linux/remoteproc/mtk_scp.h            |    2 +
 25 files changed, 4248 insertions(+), 582 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_req_if.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

-- 
2.25.1

