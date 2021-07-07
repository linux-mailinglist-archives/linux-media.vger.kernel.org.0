Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EA23BE2F9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhGGGZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:01 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49382 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230263AbhGGGY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:24:59 -0400
X-UUID: 87359ab336e54140974126ad410e9b71-20210707
X-UUID: 87359ab336e54140974126ad410e9b71-20210707
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1821048477; Wed, 07 Jul 2021 14:22:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:14 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 00/14] Using component framework to support multi hardware decode
Date:   Wed, 7 Jul 2021 14:21:43 +0800
Message-ID: <20210707062157.21176-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds support for multi hardware decode into mtk-vcodec, by first
adding component framework to manage each hardware information: interrupt,
clock, register bases and power. Secondly add core thread to deal with core
hardware message, at the same time, add msg queue for different hardware
share messages. Lastly, the architecture of different specs are not the same,
using specs type to separate them.

This series has been tested with both MT8183 and MT8173. Decoding was working
for both chips.

Patches 1,2 rewrite get register bases and power on/off interface.

Patch 3-5 add component framework to support multi hardware.

Patches 6-14 add interfaces to support core hardware.
----
This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].

Multi hardware decode is based on stateless decoder, MT8183 is the first
time to add stateless decoder. Otherwise it will cause conflict.
Please also accept this patch together with [1].

[1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
----

Yunfei Dong (14):
  media: mtk-vcodec: Get numbers of register bases from DT
  media: mtk-vcodec: Refactor vcodec pm interface
  media: mtk-vcodec: Use component framework to manage each hardware
    information
  dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
    dt-bindings
  media: mtk-vcodec: Use pure single core for MT8183
  media: mtk-vcodec: Add irq interface for core hardware
  media: mtk-vcodec: Add msg queue feature for lat and core architecture
  media: mtk-vcodec: Generalize power and clock on/off interfaces
  media: mtk-vcodec: Add new interface to lock different hardware
  media: mtk-vcodec: Add core thread
  media: mtk-vcodec: Support 34bits dma address for vdec
  dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
  media: mtk-vcodec: Add core dec and dec end ipi msg
  media: mtk-vcodec: Use codec type to separate different hardware

 .../media/mediatek-vcodec-comp-decoder.txt    |  93 ++++++
 .../media/mediatek-vcodec-decoder.txt         | 169 +++++++++++
 .../media/mediatek-vcodec-encoder.txt         |  73 +++++
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   4 +
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 286 +++++++++++++++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 193 ++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  51 ++++
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  69 ++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  30 ++
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 266 ++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      | 136 +++++++++
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
 25 files changed, 1582 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h

-- 
2.18.0

