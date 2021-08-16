Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915503ED2B6
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbhHPLAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:00:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41062 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235906AbhHPLAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:00:43 -0400
X-UUID: cc736ff5f1614799afeb18f3f67ef431-20210816
X-UUID: cc736ff5f1614799afeb18f3f67ef431-20210816
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1327086574; Mon, 16 Aug 2021 19:00:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:07 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/9] Enable two H264 encoder cores on MT8195
Date:   Mon, 16 Aug 2021 18:59:25 +0800
Message-ID: <20210816105934.28265-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MT8195 has two H264 encoder cores, they have their own power-domains,
clocks, interrupts, register base. The two H264 encoder cores can work
together to achieve higher performance.

This series of patches is to use enable two h264 encoder cores.
path[1..2]: use linux component framework to manage encoder hardware,
user call "mt8195-vcodec-enc" driver can get the encoder master device,
the encoding work is done by the two encoder core device. The hw_mode
variable is added to distinguish from old platform, two encoder cores
called "FRAME_RACING_MODE".

The hardware mode of two encoder cores work together(overlap, another
word called) on MT8195 called "frame_racing_mode", the two encoder
power-domains should be power on together while encoding, the encoding
process look like this:

    VENC Core0 frm#0....frm#2....frm#4
    VENC Core1  .frm#1....frm#3....frm#5

patch[3..5]: due to the component device, the master device has no
power-domains/clocks properties in dtsi, so the power/clock init function
can't use for "frame_racing_mode" device in master device probe process,
it should be called in component device probe process. Power on the
hardware power and clock on demand.

patch[6]: "frame_racing_mode" encoding need a new set of memory buffer
for two encoder cores. For compatibility, we should new a encoder driver
interface.

patch[7..9]: add "frame_racing_mode" encoding process:
As-Is: Synchronous
VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
encode done with result --> job_finish

VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
encode done with result --> job_finish
...

To-Be: Asynchronous
VIDIOC_QBUF#0 --> device_run(triger encoder core0) --> job_finish
..VIDIOC_QBUF#1 --> device_run(triger encoder core1) --> job_finish
(core0 may encode done here, return encode result to client)
VIDIOC_QBUF#2 --> device_run(triger encoder core0) --> job_finish

Thers is no "wait encoder IRQ" synchronous call during "frame_racing_mode"
encoding process, which can full use the two encoder cores to achieve
higher performance.

Irui Wang (9):
  dt-bindings: media: mtk-vcodec: Add binding for MT8195 two venc cores
  media: mtk-vcodec: Use component framework to manage encoder hardware
  media: mtk-vcodec: Rewrite venc power manage interface
  media: mtk-vcodec: Add venc power on/off interface
  media: mtk-vcodec: Rewrite venc clock interface
  media: mtk-vcodec: Add new venc drv interface for frame_racing mode
  media: mtk-vcodec: Add frame racing mode encode process
  media: mtk-vcodec: Return encode result to client
  media: mtk-vcodec: Add delayed worker for encode timeout

 .../bindings/media/mediatek-vcodec.txt        |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  34 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 120 +++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 204 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 253 +++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  38 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 213 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  13 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 +
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
 .../platform/mtk-vcodec/venc/venc_common_if.c | 675 ++++++++++++++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   6 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  96 ++-
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  11 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
 19 files changed, 1564 insertions(+), 149 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/venc/venc_common_if.c

-- 
2.25.1

