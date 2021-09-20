Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF2D410F5C
	for <lists+linux-media@lfdr.de>; Mon, 20 Sep 2021 07:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhITFsP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 01:48:15 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:23094 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232953AbhITFsO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 01:48:14 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d58 with ME
        id w5mk2500P4m3Hzu035mloP; Mon, 20 Sep 2021 07:46:47 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 Sep 2021 07:46:47 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        mansur@codeaurora.org, swboyd@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: venus: core: Fix a potential NULL pointer dereference
Date:   Mon, 20 Sep 2021 07:46:43 +0200
Message-Id: <2235101c73ad1137685a8669bfab9a86d2bd9ec7.1632116708.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to the code in 'venus_runtime_suspend()' and
'venus_runtime_resume()', 'pm_ops->core_power' can be NULL.

So make the same assumption in the error handling path of
'venus_runtime_suspend()' and add the missing check. This can avoid a
potential NULL pointer dereference.

Fixes: 9e8efdb57879 ("media: venus: core: vote for video-mem path")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/qcom/venus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e54c5d571dc..593d4cbe44e0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -470,7 +470,8 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 err_video_path:
 	icc_set_bw(core->cpucfg_path, kbps_to_icc(1000), 0);
 err_cpucfg_path:
-	pm_ops->core_power(core, POWER_ON);
+	if (pm_ops->core_power)
+		pm_ops->core_power(core, POWER_ON);
 
 	return ret;
 }
-- 
2.30.2

