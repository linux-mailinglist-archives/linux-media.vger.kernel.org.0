Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB1DAC5E0
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 11:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfIGJ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 05:27:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39590 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726295AbfIGJ1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Sep 2019 05:27:44 -0400
X-UUID: 03ba12ee221e4c589f9d6aef36644b1d-20190907
X-UUID: 03ba12ee221e4c589f9d6aef36644b1d-20190907
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1797095194; Sat, 07 Sep 2019 17:27:33 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 7 Sep 2019 17:27:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 7 Sep 2019 17:27:26 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V4, 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Sat, 7 Sep 2019 17:27:26 +0800
Message-ID: <20190907092728.23897-1-dongchun.zhu@mediatek.com>
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

This patch adds driver and bindings for Omnivision's OV02A10 2 megapixel CMOS 1/5" sensor,
which has a single MIPI lane interface and output format of 10-bit Raw.

The driver is implemented wth V4L2 framework.
1. Async registered as a V4L2 I2C sub-device.
2. A media entity that can provide several source pads and sink pads to link with other device like Seninf, ISP one after another
   to create a default overall camera topology, image frame or meta-data from sensor can flow through particular path to output
   preview or capture image or 3A info.

Changes of v4 mainly address the comments from Sakari, Rob, Tomasz.
 - Remove data-lanes property in DT
 - Add link frequencies in DT to match the expect value that driver requires
 - Omit open callback as int_cfg is implemented
 - Use i2c_smbus_write_byte_data/i2c_smbus_read_byte_data instead of customed APIs
 - Use do_div to calculate pixel rate
 - Use usleep_range directly for shoter sleep case
 - Re-adjust sensor power up/off sequence
 - Re-set pd/rst GPIO inverter property according to the datasheet
 - Refine set_exposure/set_gain/set_vblanking/set_test_pattern functions
 - Fix other reviewed issues in v3

Changes of v3 are mainly addressing comments from Rob, Sakari, Bingbu.
 - Fix coding style errors in dt-bindings
 - Use macro flag to describle basic line 1224 when updating v-blanking
 - Remove unnecessary debug log in driver

Mainly changes of v2 are addressing the comments from Nicolas, Bingbu, Sakari, Rob,
including,
 - Put dt binding before driver in series
 - Add MAINTAINERS entries
 - Squash the MAINTAINERS entry and Kconfig to driver patch
 - Add rotation support for driver
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for OV02A10
  media: i2c: Add Omnivision OV02A10 camera sensor driver

 .../devicetree/bindings/media/i2c/ov02a10.txt      |   54 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1062 ++++++++++++++++++++
 5 files changed, 1136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2

