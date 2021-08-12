Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37243E9DD7
	for <lists+linux-media@lfdr.de>; Thu, 12 Aug 2021 07:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhHLFOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 01:14:54 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:36380 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhHLFOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 01:14:53 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d10 with ME
        id gVEQ250013riaq203VEQm2; Thu, 12 Aug 2021 07:14:25 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 12 Aug 2021 07:14:25 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        mansur@codeaurora.org, swboyd@chromium.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: venus: core: Fix a potential NULL pointer dereference in an error handling path
Date:   Thu, 12 Aug 2021 07:14:22 +0200
Message-Id: <e8017bbe72a9cd7f663fb42ada5eb1e174b807bd.1628716867.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The normal path of the function makes the assumption that
'pm_ops->core_power' may be NULL.
We should make the same assumption in the error handling path or a NULL
pointer dereference may occur.

Add the missing test before calling 'pm_ops->core_power'

Fixes: 9e8efdb57879 ("media: venus: core: vote for video-mem path")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/qcom/venus/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 91b15842c555..84cd92628cfd 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -472,7 +472,8 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
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

