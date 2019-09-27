Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15533BFFE9
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 09:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfI0HSd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 03:18:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:60099 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725804AbfI0HSd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 03:18:33 -0400
X-UUID: b5a11b71a0954674abcd460858f3a2da-20190927
X-UUID: b5a11b71a0954674abcd460858f3a2da-20190927
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 633643062; Fri, 27 Sep 2019 15:18:29 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Sep 2019 15:18:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Sep 2019 15:18:25 +0800
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
Subject: [PATCH] media: ov5695: Add suport for registering sensor-related
Date:   Fri, 27 Sep 2019 15:18:23 +0800
Message-ID: <20190927071824.18675-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series modifies the interface of async register V4L2 sub-device invoked in probe function for OV5695 CMOS sensor.
The Omnivision OV5695 image sensor would be used in camera features on CrOS application.
5.0 Mega Pixel MIPI Camera Mdoule also supports auto-focus control (AFC) with embedded AF VCM Driver.

Here we use v4l2_async_register_subdev_sensor_common() instead of v4l2_async_register_subdev()
to register a sensor sub-device to the asynchronous sub-device framework and parse set up
common sensor-related devices, such as actuator.

This function is just like v4l2_async_register_subdev() with the exception that calling it will also parse
firmware interfaces for remote references using v4l2_async_notifier_parse_fwnode_sensor_common()
and registers the async sub-devices.

After applying this change, we can see the VCM move when changing the scene.

Dongchun Zhu (1):
  media: i2c: ov5695: Modify the function of async register subdev

 drivers/media/i2c/ov5695.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.2

