Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B4539C515
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 04:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhFECbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 22:31:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:35073 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231565AbhFECbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 22:31:19 -0400
X-UUID: 947f8efeb46944859320c995a0578351-20210605
X-UUID: 947f8efeb46944859320c995a0578351-20210605
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 573427133; Sat, 05 Jun 2021 10:29:30 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Jun 2021 10:29:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Jun 2021 10:29:21 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
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
Subject: [PATCH v5,0/6] Support H264 4K on MT8192
Date:   Sat, 5 Jun 2021 10:29:12 +0800
Message-ID: <20210605022918.4213-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Change notes:
v5: rebase on Linux 5.13-rc4

Alexandre Courbot (1):
  media: mtk-vcodec: venc: remove redundant code

Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 34bits dma address for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support MT8192 H264 4K encoding

 .../bindings/media/mediatek-vcodec.txt        |  2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 92 +++++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 17 ++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
 5 files changed, 80 insertions(+), 36 deletions(-)

-- 
2.18.0

