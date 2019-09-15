Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283E0B2EBE
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2019 08:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfIOGuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 02:50:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:44063 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725613AbfIOGuS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 02:50:18 -0400
X-UUID: 2295e692c5af4d4692fc9cdcf5fef292-20190915
X-UUID: 2295e692c5af4d4692fc9cdcf5fef292-20190915
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1650005843; Sun, 15 Sep 2019 14:50:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Sep 2019 14:50:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 15 Sep 2019 14:50:06 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V4 0/4] media: support Mediatek sensor interface driver
Date:   Sun, 15 Sep 2019 14:50:00 +0800
Message-ID: <20190915065004.20257-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1585134051E855BDBEBE7F5BF01A47B56D3C3368540B3F6FF779A1A833F610DB2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is the RFC patch adding Sensor Inferface(seninf) driver on
Mediatek mt8183 SoC, which will be used in camera features on CrOS application.
It belongs to the first Mediatek's camera driver series based on V4L2 and media controller framework.
I posted the main part of the seninf driver as RFC to discuss first and would like some review comments
on the overall structure of the driver.

The driver is implemented with V4L2 framework.
1. Register as a V4L2 sub-device.
2. Only one entity with sink pads linked to camera sensors for choosing desired camera sensor by setup link
   and with source pads linked to cam-io for routing different types of decoded packet datas to PASS1 driver
   to generate sensor image frame and meta-data.

The overall file structure of the seninf driver is as following:

* mtk_seninf.c: Implement software and HW control flow of seninf driver.
* mtk_seninf_def.h: Define data structure and enumeration.
* mtk_seninf_reg.h: Define HW register R/W macros and HW register names.

[ V4: use recommended coding style, re-arrange and remove redundant code, change endpoint parsing method ]

  media: platform: mtk-isp: Add Mediatek sensor interface driver
  media: platform: Add Mediatek sensor interface driver KConfig
  dt-bindings: mt8183: Add sensor interface dt-bindings
  dts: arm64: mt8183: Add sensor interface nodes

 .../bindings/media/mediatek-seninf.txt        |   30 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   14 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-isp/Kconfig        |   17 +
 drivers/media/platform/mtk-isp/Makefile       |    3 +
 .../media/platform/mtk-isp/isp_50/Makefile    |    5 +
 .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
 .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1011 +++++++++++++++++
 .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   59 +
 .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    |  853 ++++++++++++++
 10 files changed, 2000 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h


