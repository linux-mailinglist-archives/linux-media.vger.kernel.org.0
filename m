Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3234A483D5E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 09:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbiADIBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 03:01:45 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:52502 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232800AbiADIBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 03:01:44 -0500
X-UUID: 6d3db91b548b4d75b020c454b1d636e0-20220104
X-UUID: 6d3db91b548b4d75b020c454b1d636e0-20220104
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 25941840; Tue, 04 Jan 2022 16:01:42 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 4 Jan 2022 16:01:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 Jan
 2022 16:01:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 16:01:38 +0800
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
Subject: [PATCH v3, 00/13] media: mtk-vcodec: support for MT8192 decoder
Date:   Tue, 4 Jan 2022 16:01:25 +0800
Message-ID: <20220104080138.7472-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for mt8192 h264 decoder. Firstly, need to refactor
power/clock/interrupt interfaces for mt8192 is lat and core architecture.

Secondly, add new functions to get frame buffer size and resolution according
to decoder capability from scp side. Then add callback function to get/put
capture buffer in order to enable lat and core decoder in parallel. 

Then add to support MT21C compressed mode and fix v4l2-compliance fail.

Lastly, extract H264 request api driver to let mt8183 and mt8192 use the same
code, and adds mt8192 frame based h264 driver for stateless decoder.

Patches 1 refactor power/clock/interrupt interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5~6 enable lat and core decode in parallel.
Patch 7~10 add to support MT21C compressed mode and fix v4l2-compliance fail.
patch 11 record capture queue format type
Patch 12~13 extract h264 driver and add mt8192 frame based driver for h264 decoder.
----
Dependents on "Support multi hardware decode using of_platform_populate"[1].

This patches are the second part used to add mt8192 h264 decoder. And the base part is [1].

[1]https://patchwork.linuxtv.org/project/linux-media/cover/20211215061552.8523-1-yunfei.dong@mediatek.com/
---
changes compared with v2:
- add new patch 11 to record capture queue format type.
- separate patch 4 according to tzung-bi's suggestion.
- re-write commit message for patch 5 according to tzung-bi's suggestion.
changes compared with v1:
- rewrite commit message for patch 12.
- rewrite cover-letter message.
---
Yunfei Dong (13):
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

 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  49 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 168 +++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |   6 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  14 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 246 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  27 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c |   6 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   1 +
 .../mtk-vcodec/vdec/vdec_h264_req_common.c    | 303 +++++++++
 .../mtk-vcodec/vdec/vdec_h264_req_common.h    | 247 +++++++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 402 +-----------
 .../mtk-vcodec/vdec/vdec_h264_req_lat_if.c    | 620 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  28 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  37 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      |   2 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  55 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  15 +
 include/linux/remoteproc/mtk_scp.h            |   2 +
 21 files changed, 1681 insertions(+), 555 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c

-- 
2.25.1

