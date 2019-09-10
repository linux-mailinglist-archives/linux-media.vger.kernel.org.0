Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5BEAEB0E
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 15:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393392AbfIJNFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 09:05:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56189 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726654AbfIJNFD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 09:05:03 -0400
X-UUID: 0e25170f0be44bab883995e496cc179f-20190910
X-UUID: 0e25170f0be44bab883995e496cc179f-20190910
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 248699618; Tue, 10 Sep 2019 21:04:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Sep 2019 21:04:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Sep 2019 21:04:47 +0800
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
Subject: [V2, 0/2] media: ov8856: DT bindings and sensor mode improvements
Date:   Tue, 10 Sep 2019 21:04:44 +0800
Message-ID: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <media: ov8856: DT bindings and sensor mode improvements>
References: <media: ov8856: DT bindings and sensor mode improvements>
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

From the latest ov8856 datasheet, it is proposed to adopt the resolution
of 1632*1224 and 3264*2448, together with Bayer Order of BGGR.
Thus here we try to provide two more scenarios.

In addition, the hardware revision of ov8856 is checked from one OTP SRAM register R700F.
PLL register R3614 requires to be correspondingly updated.
For instance, 0x20 is preferred for 1B module revision.

Mainly changes of v2 are addressing the comments from Sakari, Tomasz,
including,
 - Add clock-frequency and link-frequencies in DT
 - Re-define some macros like R3614, R3d84, n_shutdn
 - Rename OV8856_MCLK to OV8856_XVCLK per datasheet
 - Refine ov8856_update_otp_reg, ov8856_configure_regulators and ov8856_cal_delay
 - Set the bayer order in the mode struct, and directly links to register R3808, R3809
 - Remove or refine redundant log print
 - Fix other reviewed issues in v1

Dongchun Zhu (2):
  media: dt-bindings: media: i2c: Add bindings for ov8856
  media: i2c: Add more sensor modes for ov8856 camera sensor

 .../devicetree/bindings/media/i2c/ov8856.txt       |  51 ++
 MAINTAINERS                                        |   1 +
 drivers/media/i2c/ov8856.c                         | 654 ++++++++++++++++++++-
 3 files changed, 691 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt

-- 
2.9.2

