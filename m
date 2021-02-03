Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E87930D55E
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 09:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhBCIim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 03:38:42 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:49422 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232310AbhBCIil (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 03:38:41 -0500
X-UUID: 0396deb487114d1798b04ebf8273baa1-20210203
X-UUID: 0396deb487114d1798b04ebf8273baa1-20210203
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1038476239; Wed, 03 Feb 2021 16:37:56 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:37:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:37:54 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>
CC:     Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/5] Support H264 4K on MT8192
Date:   Wed, 3 Feb 2021 16:37:47 +0800
Message-ID: <20210203083752.12586-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
This patch dependents on
"dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder node" [1]

We need "name" and "core_id" variable in device private data to indicate
current encoder driver.
Please also accept this patch together with [1].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2021-January/021165.html
---
Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 4GB~8GB range iova space for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support H264 4K encoding on MT8192

 .../bindings/media/mediatek-vcodec.txt        | 28 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 58 ++++++++++++++-----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 19 ++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 ++
 5 files changed, 95 insertions(+), 15 deletions(-)

-- 
2.25.1

