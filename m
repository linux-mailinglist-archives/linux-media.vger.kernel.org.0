Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417773F2150
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 22:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhHSUGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 16:06:17 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:32267 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhHSUGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 16:06:15 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d33 with ME
        id jY5V2500D3riaq203Y5V99; Thu, 19 Aug 2021 22:05:32 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 19 Aug 2021 22:05:32 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, acourbot@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()'
Date:   Thu, 19 Aug 2021 22:05:28 +0200
Message-Id: <ea6bddd4da925fcd3016cdb3fc8d40d2311c55a4.1629403336.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A successful 'of_platform_populate()' call should be balanced by a
corresponding 'of_platform_depopulate()' call in the error handling path
of the probe, as already done in the remove function.

A successful 'venus_firmware_init()' call should be balanced by a
corresponding 'venus_firmware_deinit()' call in the error handling path
of the probe, as already done in the remove function.

Update the error handling path accordingly.

Fixes: f9799fcce4bb ("media: venus: firmware: register separate platform_device for firmware loader")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b15842c555..9cb0ab7d1677 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -349,11 +349,11 @@ static int venus_probe(struct platform_device *pdev)
 
 	ret = venus_firmware_init(core);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_of_depopulate;
 
 	ret = venus_boot(core);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_firmware_deinit;
 
 	ret = hfi_core_resume(core, true);
 	if (ret)
@@ -385,6 +385,10 @@ static int venus_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_venus_shutdown:
 	venus_shutdown(core);
+err_firmware_deinit:
+	venus_firmware_deinit(core);
+err_of_depopulate:
+	of_platform_depopulate(dev);
 err_runtime_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
-- 
2.30.2

