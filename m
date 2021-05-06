Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5822B375696
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbhEFPYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235198AbhEFPYa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49397613C0;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=nPYpAR91E3rgdblnM1RIaAoqqFVi+fAvcFwJJ6A4j/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G2D5SjYUp1dulyJdbit5nwxPotB7SPsw8eSZ21eCcpRaLZSYJYR0TjnXhxMyskY6N
         S919sO/uR0Qak+mzvXO2cI8IJNINLib4b2Sx1a0irZIaIOAXKiwUtgKzKF0VPADhSn
         k9c9Sdn/ZLWjsANMxSd8hknFlr9AgvJlon55ycnBRp0T9enH/cnPh7DKwYT/LvdCaW
         pQ0jL4G+MzotSryLfcWSFBZKFNxuPN6G/5LfJTjwYSvf//4fR4GCQmn+DVJy9DoJvC
         cLds3tRxTpE0WenRaJLMp88URO8YT2ARcJaVPORj9qroC3DQGjLSfpfNJLZBPPlV1X
         rqDaikNanF2YQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rv0-6Q; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 07/30] media: i2c: imx219: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:03 +0200
Message-Id: <8f44c30dcb991df458e9a4c6ff833c1dcaaff897.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314098.git.mchehab+huawei@kernel.org>
References: <cover.1620314098.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx219.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1054ffedaefd..74a0bf9b088b 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1035,11 +1035,9 @@ static int imx219_start_streaming(struct imx219 *imx219)
 	const struct imx219_reg_list *reg_list;
 	int ret;
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Apply default values of current mode */
 	reg_list = &imx219->mode->reg_list;
-- 
2.30.2

