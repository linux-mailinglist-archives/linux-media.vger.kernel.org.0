Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C73438C02D
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 09:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbhEUHDO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 03:03:14 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50553 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230257AbhEUHDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 03:03:14 -0400
X-UUID: e343d66a90cf40b5a507c0856315c43b-20210521
X-UUID: e343d66a90cf40b5a507c0856315c43b-20210521
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 389252559; Fri, 21 May 2021 15:01:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:01:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:42 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
CC:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,0/6] Support H264 4K on MT8192
Date:   Fri, 21 May 2021 15:01:33 +0800
Message-ID: <20210521070139.20644-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Change notes:
v4: rebase on Linux 5.13-rc1

Alexandre Courbot (1):
  media: mtk-vcodec: venc: remove redundant code

Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 4GB~8GB range iova space for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support MT8192 H264 4K encoding

 .../bindings/media/mediatek-vcodec.txt        |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 89 +++++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 17 ++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
 5 files changed, 78 insertions(+), 36 deletions(-)

-- 
2.18.0

