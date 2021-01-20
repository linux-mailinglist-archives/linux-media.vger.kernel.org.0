Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C942FCE71
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387683AbhATKmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:18 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:42465 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731653AbhATJou (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:50 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Bl8jFR; Wed, 20 Jan 2021 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135793; bh=/CUlZ4gB273owm3WI6BFTHh2Aoe9MLl4inaEJzppNWU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=KqLm75kRMrs2OS0akafqFHRHqQ/kCWzMEntw5toy9V5RvCXZq3Qyom9dfu9sIcRyX
         xth/yN1pudL0sHpuh6cyksfurlMVaqwn7YelxjV2FkiSj4D9pHnTnIjQwSWY/IdII5
         7yjw/Rxb4w7LkdifYAM3nqAsP0htTlsIjvVdJaoZwrD2mpl1D5JmPkXWH2jBS1BtGb
         CouMP6sYTAVjE3BeN9vv5/1vXI9Ll1pAcF9O6m/HSLDPNs9OTy+hkdeYweOx5HrH8E
         ztvVqz/7023wvz9Wfxnjvn8BFU1M7v4YKy8wxp1aiAvuU0e8NvIBpmNBFXYbiN/eEU
         KHm2OlBvAHiDQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 10/14] usb/dvb-usb-v2/rtl28xxu.c: clean up code to fix smatch warning
Date:   Wed, 20 Jan 2021 10:43:02 +0100
Message-Id: <20210120094306.784318-11-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAX5slZdcEG06gClf1fIbSEcdCCiibSaO57tXMNZ1RIGZ6Bnhop5RCmAwSDRBq0pMH9u1fnxz2YJnBjddl0CUTNYr+CsDS0ZgH7HSCI/FBqqF/Lc17c1
 spMTuaX3EY59qmTlxUrh7WdPKN+QMvl/ueTCuoV7ce54KMRIJcbPGXQgqeDUKYloleGy3kY3NfG34FOIu/4gLICuUcAx8qvPQhkcY/j7Cxe5kgNgO9ercodC
 59IpAWQKL4x5TIxzCbqj6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this smatch warning:

drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1040 rtl2832u_frontend_attach() warn: missing error code 'ret'

It is actually a bogus warning since in this particular case ret isn't
meant to be set. But by reworking the code a bit the code is actually
a lot more understandable and it fixes this warning.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 35 +++++++++----------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 3952cc534b4a..97ed17a141bb 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -944,12 +944,6 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 	if (dev->slave_demod) {
 		struct i2c_board_info info = {};
 
-		/*
-		 * We continue on reduced mode, without DVB-T2/C, using master
-		 * demod, when slave demod fails.
-		 */
-		ret = 0;
-
 		/* attach slave demodulator */
 		if (dev->slave_demod == SLAVE_DEMOD_MN88472) {
 			struct mn88472_config mn88472_config = {};
@@ -964,14 +958,11 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.platform_data = &mn88472_config;
 			request_module(info.type);
 			client = i2c_new_client_device(&d->i2c_adap, &info);
-			if (!i2c_client_has_driver(client)) {
-				dev->slave_demod = SLAVE_DEMOD_NONE;
+			if (!i2c_client_has_driver(client))
 				goto err_slave_demod_failed;
-			}
 
 			if (!try_module_get(client->dev.driver->owner)) {
 				i2c_unregister_device(client);
-				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
 
@@ -986,14 +977,11 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.platform_data = &mn88473_config;
 			request_module(info.type);
 			client = i2c_new_client_device(&d->i2c_adap, &info);
-			if (!i2c_client_has_driver(client)) {
-				dev->slave_demod = SLAVE_DEMOD_NONE;
+			if (!i2c_client_has_driver(client))
 				goto err_slave_demod_failed;
-			}
 
 			if (!try_module_get(client->dev.driver->owner)) {
 				i2c_unregister_device(client);
-				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
 
@@ -1009,10 +997,8 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			adap->fe[1] = dvb_attach(cxd2841er_attach_t_c,
 						 &cxd2837er_config,
 						 &d->i2c_adap);
-			if (!adap->fe[1]) {
-				dev->slave_demod = SLAVE_DEMOD_NONE;
+			if (!adap->fe[1])
 				goto err_slave_demod_failed;
-			}
 			adap->fe[1]->id = 1;
 			dev->i2c_client_slave_demod = NULL;
 		} else {
@@ -1029,14 +1015,11 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			info.platform_data = &si2168_config;
 			request_module(info.type);
 			client = i2c_new_client_device(&d->i2c_adap, &info);
-			if (!i2c_client_has_driver(client)) {
-				dev->slave_demod = SLAVE_DEMOD_NONE;
+			if (!i2c_client_has_driver(client))
 				goto err_slave_demod_failed;
-			}
 
 			if (!try_module_get(client->dev.driver->owner)) {
 				i2c_unregister_device(client);
-				dev->slave_demod = SLAVE_DEMOD_NONE;
 				goto err_slave_demod_failed;
 			}
 
@@ -1047,10 +1030,18 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 		}
 	}
 	return 0;
-err_slave_demod_failed:
+
 err:
 	dev_dbg(&d->intf->dev, "failed=%d\n", ret);
 	return ret;
+
+err_slave_demod_failed:
+	/*
+	 * We continue on reduced mode, without DVB-T2/C, using master
+	 * demod, when slave demod fails.
+	 */
+	dev->slave_demod = SLAVE_DEMOD_NONE;
+	return 0;
 }
 
 static int rtl28xxu_frontend_attach(struct dvb_usb_adapter *adap)
-- 
2.29.2

