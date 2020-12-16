Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DA32DC12F
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 14:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbgLPNZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 08:25:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9624 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgLPNZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 08:25:13 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwnP0MHxz15TRF;
        Wed, 16 Dec 2020 21:23:53 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:24:20 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: dvb-usb: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:24:50 +0800
Message-ID: <20201216132450.15367-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index d3288c107906..710c1afe3e85 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -3074,8 +3074,8 @@ static int nim7090_tuner_attach(struct dvb_usb_adapter *adap)
 	struct dib0700_adapter_state *st = adap->priv;
 	struct i2c_adapter *tun_i2c = st->dib7000p_ops.get_i2c_tuner(adap->fe_adap[0].fe);
 
-	nim7090_dib0090_config.reset = st->dib7000p_ops.tuner_sleep,
-	nim7090_dib0090_config.sleep = st->dib7000p_ops.tuner_sleep,
+	nim7090_dib0090_config.reset = st->dib7000p_ops.tuner_sleep;
+	nim7090_dib0090_config.sleep = st->dib7000p_ops.tuner_sleep;
 	nim7090_dib0090_config.get_adc_power = st->dib7000p_ops.get_adc_power;
 
 	if (dvb_attach(dib0090_register, adap->fe_adap[0].fe, tun_i2c, &nim7090_dib0090_config) == NULL)
-- 
2.22.0

