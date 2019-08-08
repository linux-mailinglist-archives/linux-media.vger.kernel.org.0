Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5092C85E1E
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732098AbfHHJWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 05:22:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:18711 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731955AbfHHJWd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 05:22:33 -0400
X-UUID: 293a75625e4944979a3483e8beb6bada-20190808
X-UUID: 293a75625e4944979a3483e8beb6bada-20190808
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0707 with TLS)
        with ESMTP id 1359669213; Thu, 08 Aug 2019 17:22:23 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 8 Aug 2019 17:22:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 8 Aug 2019 17:22:24 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V1, 0/2] media: ov8856: DT bindings and sensor mode improvements
Date:   Thu, 8 Aug 2019 17:22:13 +0800
Message-ID: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
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

This series adds DT bindings and some more sensor modes for users to use.

From the latest ov8856 datasheet, it is proposed to adopt the resolution of 1632*1224 and 3264*2448,
together with Bayer Order of BGGR. Thus here we provide two more scenarios.

In addition, the hardware version of ov8856 is also distinguished from one OTP SRAM register R700F.
PLL register R3614 requires to be correspondingly updated.
For instance, 0x20 is suggested for 1B camera module.

It is emphasized that I2C still actives while device is to runtime suspended.
This makes ov8856_suspend function need to remove the operation of stoping streaming.

Finally, ARM and device tree matching were added as an alternative.

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for OV8856
  media: i2c: Add more sensor mode for OV8856 camera sensor

 .../devicetree/bindings/media/i2c/ov8856.txt       |  41 ++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov8856.c                         | 624 ++++++++++++++++++++-
 3 files changed, 663 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

-- 
2.9.2

