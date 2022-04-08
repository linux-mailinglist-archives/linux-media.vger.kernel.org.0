Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBB624F9524
	for <lists+linux-media@lfdr.de>; Fri,  8 Apr 2022 14:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbiDHMFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Apr 2022 08:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbiDHME6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Apr 2022 08:04:58 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984C5D7924;
        Fri,  8 Apr 2022 05:02:51 -0700 (PDT)
X-UUID: 3db1e63d96974302a508a6cb2b28a7b5-20220408
X-UUID: 3db1e63d96974302a508a6cb2b28a7b5-20220408
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1708684266; Fri, 08 Apr 2022 20:02:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 20:02:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 20:02:41 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
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
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9, 00/15] media: mtk-vcodec: support for M8192 decoder
Date:   Fri, 8 Apr 2022 20:02:23 +0800
Message-ID: <20220408120240.29571-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly, refactor
power/clock/interrupt interfaces for mt8192 is lat and core architecture.

Secondly, add new functions to get frame buffer size and resolution according
to decoder capability from scp side. Then add callback function to get/put
capture buffer in order to enable lat and core decoder in parallel, need to
adjust GStreamer at the same time. 

Then add to support MT21C compressed mode and fix v4l2-compliance fail.

Next, extract H264 request api driver to let mt8183 and mt8192 use the same
code, and adds mt8192 frame based h264 driver for stateless decoder.

Lastly, add vp8 and vp9 stateless decoder drivers.

Patches 1 refactor power/clock/interrupt interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5 set capture queue bytesused.
Patches 6 adjust GStreamer.
Patch 7~11 add to support MT21C compressed mode and fix v4l2-compliance fail.
patch 12 record capture queue format type.
Patch 13~14 extract h264 driver and add mt8192 frame based driver for h264 decoder.
Patch 15~16 add vp8 and vp9 stateless decoder drivers.
Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
---
changes compared with v8:
- fix vp9 build error
- fix kernel-doc fail
changes compared with v7:
- adjust GStreamer, separate src buffer done with v4l2_ctrl_request_complete for patch 6.
- remove v4l2_m2m_set_dst_buffered.
- add new patch to set each plane bytesused in buf prepare for patch 5.
- using upstream interface to update vp9 prob tables for patch 16.
- fix maintainer comments.
- test the driver with chrome VD and GStreamer(H264/VP9/VP8/AV1).
changes compared with v6:
- rebase to the latest media stage and fix conficts
- fix memcpy to memcpy_fromio or memcpy_toio
- fix h264 crash when test field bitstream
changes compared with v5:
- fix vp9 comments for patch 15
- fix vp8 comments for patch 14.
- fix comments for patch 12.
- fix build errors.
changes compared with v4:
- fix checkpatch.pl fail.
- fix kernel-doc fail.
- rebase to the latest media codec driver.
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
Yunfei Dong (17):
  media: mediatek: vcodec: Add vdec enable/disable hardware helpers
  media: mediatek: vcodec: Using firmware type to separate different
    firmware architecture
  media: mediatek: vcodec: get capture queue buffer size from scp
  media: mediatek: vcodec: Read max resolution from dec_capability
  media: mediatek: vcodec: set each plane bytesused in buf prepare
  media: mediatek: vcodec: Refactor get and put capture buffer flow
  media: mediatek: vcodec: Refactor supported vdec formats and
    framesizes
  media: mediatek: vcodec: Getting supported decoder format types
  media: mediatek: vcodec: Add format to support MT21C
  media: mediatek: vcodec: disable vp8 4K capability
  media: mediatek: vcodec: Fix v4l2-compliance fail
  media: mediatek: vcodec: record capture queue format type
  media: mediatek: vcodec: Extract H264 common code
  media: mediatek: vcodec: support stateless H.264 decoding for mt8192
  media: mediatek: vcodec: support stateless VP8 decoding
  media: mediatek: vcodec: support stateless VP9 decoding
  media: mediatek: vcodec: prevent kernel crash when rmmod
    mtk-vcodec-dec.ko

 .../media/platform/mediatek/vcodec/Makefile   |    4 +
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
 .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
 .../vcodec/mtk_vcodec_dec_stateless.c         |  257 ++-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
 .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
 .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
 .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
 .../vcodec/vdec/vdec_h264_req_common.h        |  274 +++
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
 .../vcodec/vdec/vdec_h264_req_multi_if.c      |  626 +++++
 .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2029 +++++++++++++++++
 .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
 .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
 .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
 .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
 .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
 .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
 .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
 include/linux/remoteproc/mtk_scp.h            |    2 +
 26 files changed, 4240 insertions(+), 601 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c

-- 
2.18.0

