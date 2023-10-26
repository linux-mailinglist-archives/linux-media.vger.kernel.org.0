Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7620D7D8083
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 12:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbjJZKSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 06:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjJZKSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 06:18:36 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74EB1A2
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 03:18:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRc-0002ne-A9; Thu, 26 Oct 2023 12:18:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-004O1r-MA; Thu, 26 Oct 2023 12:18:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qvxRb-006XTv-CZ; Thu, 26 Oct 2023 12:18:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 0/3] media: meson-ir-tx: Some cleanups and simplifications and a bug report
Date:   Thu, 26 Oct 2023 12:18:17 +0200
Message-ID: <20231026101816.2460464-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9f95QupmDD1wCm7me2TiK83K9AHR9two7YFf8SXT3Lk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlOjzppXk2Qm28MOi8I8DIbnpCyB0ZQI6nNu1X6 En+p/8ahWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTo86QAKCRCPgPtYfRL+ TgbDCACp6GwotsK5vjw8THZ109ikr4W8XvR9oyGGiiwISHzYpCWo+fg6QYTUw5jS9tCsTgMVPW9 LVWFj1dBvnEfSclJpBv1x1/uVkhn/B7aCHChSghEXTSDrDIvbr27pc4Eseeqm3T4qn+x8Qx1uha icJv0cBWx4Mj7TmFmif+Q2kTiMD0yQNFVSFjOxlSMUmfIHtr9yCsbWKs3mzn0pMhAJ+meRog9Ji Kdv8shj4rIW0wlaaRArqfmofgKsq9LqKElPtUhKeyKYhA4GEPSAPZ/meSKQtxpK5vB6u6JEZyCI 09E3Bi2/StZTqxx7MV4KOPTP9IoxmpfPTe1uj3Gyo6gPsvtT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

while looking around for drivers still using platform_driver_probe() I
found the meson-ir-tx driver. While looking at it I identified a few
patch opportunities.

I think the driver might be used to trigger a use after free problem
that is caused by the ir core. With my current understanding the
following is possible:

	1) open the ir device and keep it open
	2) unbind the meson-ir-tx device
	3) trigger calling .tx_ir = meson_irtx_transmit using the opened
	   device using write()

2) can be done using sysfs or (maybe) by module unloading. The result is
that the memory pointed to by ir is freed and the register mapping goes
away. Even meson_irtx_transmit() might disappear then. Calling
meson_irtx_transmit() then yields all kind of fun.

I didn't debug in detail so I might miss something. To fix that you have
to make sure that the callbacks don't get called any more once the rc
device is unregistered (and track that information in memory that
doesn't go away with the parent device's remove callback completing).

Best regards
Uwe

Uwe Kleine-König (3):
  media: meson-ir-tx: Convert to use devm_rc_register_device()
  media: meson-ir-tx: Simplify and improve using dev_err_probe()
  media: meson-ir-tx: Drop usage of platform_driver_probe()

 drivers/media/rc/meson-ir-tx.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0

