Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A84F27A43
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 12:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfEWKWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 06:22:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:32507 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726429AbfEWKWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 06:22:17 -0400
X-UUID: 87f410f3d5a44aac8648adfca8faf497-20190523
X-UUID: 87f410f3d5a44aac8648adfca8faf497-20190523
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1620421820; Thu, 23 May 2019 18:22:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 May 2019 18:22:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 23 May 2019 18:22:07 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <menghui.lin@mediatek.com>,
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Subject: [PATCH 0/3] media: suppport ov02a10 sensor driver
Date:   Thu, 23 May 2019 18:22:01 +0800
Message-ID: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Hello,

This is the OV02A10 sensor driver, which would be used in camera features on CrOS application.

The driver is implemented wth V4L2 framework.
1. Async registered as a V4L2 I2C sub-device.
2. A media entity that can provide several source pads and sink pads to link with other device like Seninf, ISP one after another
   to create a default overall camera topology, image frame or meta-data from sensor can flow through particular path to output
   preview or capture image or 3A info.

Dongchun Zhu (3):
  media: i2c: ov02a10: Add ov02a10 camera sensor driver
  media: i2c: ov02a10: Add CONFIG_VIDEO_OV02A10
  media: dt-bindings: media: i2c: Add bindings for ov02a10

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   43 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1067 ++++++++++++++++++++
 4 files changed, 1123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2

