Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCF38C033
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 09:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234791AbhEUHDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 03:03:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50841 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234713AbhEUHD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 03:03:26 -0400
X-UUID: 565b37de30d34d1f916e9ea26bc263d2-20210521
X-UUID: 565b37de30d34d1f916e9ea26bc263d2-20210521
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 7200639; Fri, 21 May 2021 15:02:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:01:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:56 +0800
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
Subject: [PATCH v4,2/6] dt-bindings: media: mtk-vcodec: Add dma-ranges property
Date:   Fri, 21 May 2021 15:01:35 +0800
Message-ID: <20210521070139.20644-3-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210521070139.20644-1-irui.wang@mediatek.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mt8192 iommu support 0~16GB iova. We separate it to four banks:
0~4G; 4G~8G; 8G~12G; 12G~16G.

The "dma-ranges" could be used to adjust the bank we locate.
If we don't set this property. The default range always is 0~4G.

Here we don't have actual bus/parent concept here.  And the iova
requirement is for our HW. Thus put the property in our node.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 06db6837cefd..b7801e3c354a 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -22,6 +22,8 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
+- dma-ranges : describes how the physical address space of the IOMMU maps
+  to memory.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
 - mediatek,scp : the node of the SCP unit, if using SCP.
-- 
2.18.0

