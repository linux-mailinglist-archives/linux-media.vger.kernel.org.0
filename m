Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B12536C291
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbhD0KPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235410AbhD0KOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6276C61404;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=WwdunTEPlspSuJNcgiz5VlTq6QqTmYyotSIBFOxVREY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RtG8MWksBzzoyJ8f1T9mM9i2iWpOVxFMvdgZaznoqwOeoaF1BGLfN6hdQkAjTBmXG
         gb2wIhkMmOHaazVy75eeYno7XXgjTuDTo4qPz5ka6axbr96x+nj53BWjICe1um51TZ
         Ab2SEYW4bxlYb/EMBtKfknyNbdcyMBUMtn5cwqNvF53cmJ5coNHnmf55kcZuBwLfMK
         mdDcHBUCnS+i68sJTKVTgsL5OowpThLKgObLrRLqqp+Cgl4+UL2N7VTRjneXXG7SGn
         lbHNJ4HV7xV5mgvyn2gVH0+z2vWQ74G6QvtkK+B9ULi1pNuLp56InWHUaMNVebMj97
         HV5QK/JmPrKRw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j5e-1q; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 22/79] staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:49 +0200
Message-Id: <9b52f8d9709e32ac129563f508beaec8ab321409.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 025fdc488bd6..1dc680d94a46 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 
 		mipi_csis_clear_counters(state);
 
-		ret = pm_runtime_get_sync(&state->pdev->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&state->pdev->dev);
+		ret = pm_runtime_resume_and_get(&state->pdev->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto done;
-- 
2.30.2

