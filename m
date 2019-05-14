Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5423C1C2F5
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfENGOD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52439 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725946AbfENGOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:02 -0400
X-UUID: 993d09c4983b42c69673ac2e7ffff995-20190514
X-UUID: 993d09c4983b42c69673ac2e7ffff995-20190514
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 2073706049; Tue, 14 May 2019 14:13:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:53 +0800
From:   Stu Hsieh <stu.hsieh@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stu Hsieh <stu.hsieh@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 00/13] Add mediatek mipicsi driver for Mediatek SOC MT2712
Date:   Tue, 14 May 2019 14:13:37 +0800
Message-ID: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add mediatek mipicsi driver for Mediatek SOC MT2712

Change in v3:
- Move register setting to the bottom of this patch series
  and merge the patch "[media] mtk-mipicsi: add pm function" to
  "[media] mtk-mipicsi: add mediatek mipicsi driver for mt2712"
- Remove the patch
  "[media] mtk-mipicsi: add the function for Get/Set PARM for application"
- Add max width/heigh condition in patch
  "[media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi"
- Rename the patch name from
  "[media] mtk-mipicsi: add mediatek mipicsi driver for mt2712" to
  "[media] mtk-mipicsi: add the check for non-supported color format"

Stu Hsieh (13):
  dt-bindings: media: Add binding for MT2712 MIPI-CSI2
  [media] mtk-mipicsi: add mediatek mipicsi driver for mt2712
  [media] mtk-mipicsi: register the soc_camera host
  [media] mtk-mipicsi: add the check for non-supported color format
  [media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi
  [media] mtk-mipicsi: add function to support SerDes for link number
  [media] mtk-mipicsi: enable/disable ana clk
  [media] mtk-mipicsi: enable/disable cmos for mt2712
  [media] mtk-mipicsi: add ISR for writing the data to buffer
  [media] mtk-mipicsi: set the output address in HW reg
  [media] mtk-mipicsi: add function to get the format
  [media] mtk-mipicsi: add debug message for mipicsi driver
  [media] mtk-mipicsi: add debugfs for mipicsi driver

 .../bindings/media/mediatek-mipicsi-camsv.txt |   53 +
 .../media/mediatek-mipicsi-common.txt         |   19 +
 .../bindings/media/mediatek-mipicsi.txt       |   54 +
 drivers/media/platform/mtk-mipicsi/Makefile   |    4 +
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 1627 +++++++++++++++++
 5 files changed, 1757 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-camsv.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi-common.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
 create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
 create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c

-- 
2.18.0

