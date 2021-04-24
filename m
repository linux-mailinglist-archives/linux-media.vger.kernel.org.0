Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE2E369F67
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237564AbhDXGrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233222AbhDXGqP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 988E561921;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=nPYpAR91E3rgdblnM1RIaAoqqFVi+fAvcFwJJ6A4j/g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mHzW6qPLIQqB2uwPDJp/8R1VccrSiQvXRuCla39AS/M3blJ1oCDm1z3zn9/TlJvnr
         /NC2/AnWDs4A8Inm1sFGkTqRVhRUZkKrYDwh/BeOLE6/iZZdy+bAgbMerPbRQ0GYD4
         KdOWBdryMjstTkssIbgB0ei3ZMcmamu3F8/HR94bZStuXsQ9ZA3x+fUMPUtHeQQJFQ
         xUDfCSZRkKbV7DhJioYfT9NpYsl1I5eRKL7XK7BmAbXJs5zWJ8HqgVjH990ySSMQiT
         gUhtrioSoeSlV5YCZZfWxBrmwv87SoCpvsFVvH6HjMk464l66bACEHHEMcC8yS/V11
         392srckTHkHBg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfD-PD; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 31/78] media: i2c: imx219: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:41 +0200
Message-Id: <816d2715a45a20a491ade611d081123be271256e.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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

