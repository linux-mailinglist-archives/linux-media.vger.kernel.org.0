Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CD32C4207
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 15:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgKYOSG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 09:18:06 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:45446 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729987AbgKYOSG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 09:18:06 -0500
X-UUID: 955b66b6351244349e312d70a2ee7487-20201125
X-UUID: 955b66b6351244349e312d70a2ee7487-20201125
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1438091549; Wed, 25 Nov 2020 22:18:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 22:17:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 22:17:56 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
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
Subject: [PATCH v16 0/2] media: i2c: add support for OV02A10 sensor
Date:   Wed, 25 Nov 2020 22:17:54 +0800
Message-ID: <20201125141756.13770-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

OminiVision OV02A10 is a 2-megapixel 10-bit RAW CMOS 1/5" sensor which has
a single MIPI lane interface. This is a camera sensor using the I2C bus
for control and the CSI-2 bus for data. 

The driver is implemented with V4L2 framework.
 - Async registered as a V4L2 sub-device.
 - As the first component of camera system including ISP processing pipeline.
 - A media entity providing one source pad in common and two for dual camera.

Also this driver supports the following features:
 - Manual exposure and analog gain control support
 - Vertical blanking control support
 - Test pattern support
 - Media controller support
 - Runtime PM support
 - Support resolution: 1600x1200 at 30FPS

Changes of v16 mainly address comments from Andy, Rob, Tomasz and Sakari.
Compared to v15:
 - Move the property 'ovti,mipi-clock-voltage' under the endpoint node
 - Update the hardcoded masks with the GENMASK macro.
 - Replace fwnode_property_read_*() with device property API.
 - Fix other review comments to improve readability.

Please review.
Thanks.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: document OV02A10 DT bindings
  media: i2c: add OV02A10 image sensor driver

 .../bindings/media/i2c/ovti,ov02a10.yaml           |  159 +++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   13 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ov02a10.c                        | 1013 ++++++++++++++++++++
 5 files changed, 1194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 create mode 100644 drivers/media/i2c/ov02a10.c

-- 
2.9.2

