Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0721564B893
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 16:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236225AbiLMPgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 10:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236228AbiLMPgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 10:36:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D32220DB
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 07:36:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K9-0003Le-FE; Tue, 13 Dec 2022 16:36:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K7-004HIG-GV; Tue, 13 Dec 2022 16:36:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p57K7-004nvu-JJ; Tue, 13 Dec 2022 16:36:03 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] media: Drop empty platform remove functions
Date:   Tue, 13 Dec 2022 16:35:49 +0100
Message-Id: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Lshk6ruhxAdzgdCZ495y2kSJ95eo5l0bgzVmIeoDI3o=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmJvFHY6M7H/InfuCyV8XiGYHYkHznZjDNdYljrwp HQdgXGqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5ibxQAKCRDB/BR4rcrsCUC9B/ 9B0AmHOd5QwswXGJsG8TfFHSxNqX9JkAroYOU2PEmX85Eye5fQfc5fh/Flkfkgl/UkB73s7mCv2TPD 7z6Z5VRB3BJ1FFzPReex2slu+20DR/nLeAY31dzrfvt0OB4NGXBpUeMrGmkr6MyCXY8uvPmnwyOMff iRpLjBIISa12DvmhCaiTDs14sW6c+09OtCuo0UycBIWRH4INq7Qa/Fn2DAgdpkppZ7lKthFjJVuVR+ Koe0KQ2wxLCeKPdLe/mOPQDiyngnUdyxamIqXfceNG+nXwUmfX7szPRy8oCsGrV/+SXfhh/ueHoux+ KXQx2l6C4LYn1B+nDhgUZ0HyLqu6HR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

this series removes all platform remove functions that only return zero
below drivers/media. There is no reason to have these, as the only
caller is platform core code doing:

        if (drv->remove) {
                int ret = drv->remove(dev);

                if (ret)
                        dev_warn(...)
        }

(in platform_remove()) and so having no remove function is both
equivalent and simpler.

Uwe Kleine-König (4):
  media: ti/davinci: vpbe_osd: Drop empty platform remove function
  media: ti/davinci: vpbe_venc: Drop empty platform remove function
  media: rc/ir-rx51: Drop empty platform remove function
  media: chips-media/imx-vdoa: Drop empty platform remove function

 drivers/media/platform/chips-media/imx-vdoa.c | 6 ------
 drivers/media/platform/ti/davinci/vpbe_osd.c  | 6 ------
 drivers/media/platform/ti/davinci/vpbe_venc.c | 6 ------
 drivers/media/rc/ir-rx51.c                    | 6 ------
 4 files changed, 24 deletions(-)


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

