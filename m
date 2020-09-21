Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E30602723FC
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIUMfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:35:40 -0400
Received: from mail.ispras.ru ([83.149.199.84]:43718 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgIUMfj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:35:39 -0400
X-Greylist: delayed 330 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 08:35:38 EDT
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 75A3240D403E;
        Mon, 21 Sep 2020 12:30:07 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Antti Palosaari <crope@iki.fi>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: dvb-frontends: rtl2832_sdr: set error code in probe
Date:   Mon, 21 Sep 2020 15:30:06 +0300
Message-Id: <20200921123006.8016-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If rtl2832_sdr_probe() encounters an unsupported tuner it cleans up
everything and returns 0. This can result in various bad things later.
The patch sets the error code on the corresponding path.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 720756728f2d..ef6feb299d46 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -1411,6 +1411,7 @@ static int rtl2832_sdr_probe(struct platform_device *pdev)
 	default:
 		v4l2_ctrl_handler_init(&dev->hdl, 0);
 		dev_err(&pdev->dev, "Unsupported tuner\n");
+		ret = -ENODEV;
 		goto err_v4l2_ctrl_handler_free;
 	}
 	if (dev->hdl.error) {
-- 
2.26.2

