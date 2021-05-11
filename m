Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3537AA2E
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhEKPFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 11:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:37394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhEKPFw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 11:05:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBAED61396;
        Tue, 11 May 2021 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620745485;
        bh=QN33XNL4eU4wfIvNKbVPaGGaRPresFBOIcGCOpOsiYc=;
        h=From:To:Cc:Subject:Date:From;
        b=pO0wreEAr5IngwB3qFnJeEzTE5D5lQfQm188kdLrwLyruwH9AvHxU8fDMOaeGgJtd
         Bb+snQ4uoKnntAWnOjEruRSl5olljR3mGFo96rs04OxJZpxGFMI7B17CjR2+r8QZtv
         /hj2RUUVKshRVK5O8W0HCDfdPw+7/RtlPvwWNJ/YNsGPCJCM6Gv34b/atmVzk8q3c2
         XKPs0WbCO7dDUYTusE2RRgEwZ3FSpFo1CXHVgwAV1vdkitCQqxB3GLL6ywYIUA/qYX
         rImQGfJo8zSR4ndqonZsDCGdpAa4uYZlrjwHTypWn1A/UdFzB1QnTOrgKdjTNbT/N9
         qjXv2gNYs79+Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgTwB-000k6n-A1; Tue, 11 May 2021 17:04:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] media: exynos4-is: remove a now unused integer
Date:   Tue, 11 May 2021 17:04:42 +0200
Message-Id: <29dd19e3ac7b2a8671ebeac02859232ce0e34f58.1620745479.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The usage of pm_runtime_resume_and_get() removed the need of a
temporary integer. So, drop it.

Fixes: 59f96244af94 ("media: exynos4-is: fix pm_runtime_get_sync() usage count")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos4-is/media-dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index e025178db06c..3b8a24bb724c 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1284,7 +1284,6 @@ static DEVICE_ATTR(subdev_conf_mode, S_IWUSR | S_IRUGO,
 static int cam_clk_prepare(struct clk_hw *hw)
 {
 	struct cam_clk *camclk = to_cam_clk(hw);
-	int ret;
 
 	if (camclk->fmd->pmf == NULL)
 		return -ENODEV;
-- 
2.30.2

