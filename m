Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DE43A3455
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 21:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFJT4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 15:56:33 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:52961 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhFJT4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 15:56:32 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d69 with ME
        id FXuX2500721Fzsu03XuYBA; Thu, 10 Jun 2021 21:54:33 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 10 Jun 2021 21:54:33 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Yasunari.Takiguchi@sony.com, mchehab@kernel.org,
        narmstrong@baylibre.com, sean@mess.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] media: cxd2880-spi: Fix an error handling path
Date:   Thu, 10 Jun 2021 21:54:31 +0200
Message-Id: <40b114d7200d2a87150249f8228b88f7a4ee15e0.1621599392.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an error occurs after a successful 'regulator_enable()' call,
'regulator_disable()' must be called.

Fix the error handling path of the probe accordingly.

Fixes: cb496cd472af ("media: cxd2880-spi: Add optional vcc regulator")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: In case of error 'dvb_spi->vcc_supply' is set to NULL
    So test for NULL instead of IS_ERR as spotted by Sean Young

v1 was part of a small serie. Patch 2/2 has been applied, so this update
is now sent as a single patch
---
 drivers/media/spi/cxd2880-spi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index 931ec0727cd3..df1335e7061c 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -524,13 +524,13 @@ cxd2880_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dvb_spi->vcc_supply)) {
 		if (PTR_ERR(dvb_spi->vcc_supply) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			goto fail_adapter;
+			goto fail_regulator;
 		}
 		dvb_spi->vcc_supply = NULL;
 	} else {
 		ret = regulator_enable(dvb_spi->vcc_supply);
 		if (ret)
-			goto fail_adapter;
+			goto fail_regulator;
 	}
 
 	dvb_spi->spi = spi;
@@ -618,6 +618,9 @@ cxd2880_spi_probe(struct spi_device *spi)
 fail_attach:
 	dvb_unregister_adapter(&dvb_spi->adapter);
 fail_adapter:
+	if (!dvb_spi->vcc_supply)
+		regulator_disable(dvb_spi->vcc_supply);
+fail_regulator:
 	kfree(dvb_spi);
 	return ret;
 }
-- 
2.30.2

