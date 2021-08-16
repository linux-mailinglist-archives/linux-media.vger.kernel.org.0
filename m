Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BD83ED2BB
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbhHPLA5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:00:57 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41376 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235941AbhHPLA4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:00:56 -0400
X-UUID: 78217859e08049f8b6a909ef524d1f1a-20210816
X-UUID: 78217859e08049f8b6a909ef524d1f1a-20210816
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1652081063; Mon, 16 Aug 2021 19:00:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 19:00:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:17 +0800
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
Subject: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for MT8195 two venc cores
Date:   Mon, 16 Aug 2021 18:59:26 +0800
Message-ID: <20210816105934.28265-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable MT8195 two H.264 venc cores, updates vcodec binding document.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index de961699ba0a..eb2e24c32426 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -11,6 +11,8 @@ Required properties:
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
   "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
   "mediatek,mt8195-vcodec-enc" for MT8195 encoder.
+  "mediatek,mtk-venc-core0" for MT8195 avc core0 device.
+  "mediatek,mtk-venc-core1" for MT8195 avc core1 device.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.25.1

