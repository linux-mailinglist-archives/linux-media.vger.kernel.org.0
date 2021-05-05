Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152C53737E9
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbhEEJnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:48606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232373AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 259DC61413;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=q4BhlNxVlfORYoTSi6feVaPNYXcgoQfMmzgINIkBslA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gZZ6FCv1SxMi1afk7/pU/SwP6ou74/YfwYgWeC31Q79Id6PKiXTKPuUEwZNpVsIS2
         8+l/ox5g5VrLkHNKCukkKp4I5sTifdejUqTXV5dYmccnOkhASD0g8zj66EDZK3UBNL
         gribrjV4HqU4el2XqHfttulrZbXTkEzPv3voDofmMvNRzIe7XoXIGRujoQkV3nR67a
         wydyl/+0O4moqE13TVmVrNdtjGZI/1sIyzLrcojS8H7l6GO//qKQJ3VJdk/eGKzxvk
         7cLH2bcr5QI7axI8N9yO8LVYUlA3FU9F4AbTkxbbb+PS9O5OS3XQnJL+KiLnOx+UYV
         Jfh4KEBfJJWmQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwI-1C; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 10/25] media: marvel-ccic: fix some issues when getting pm_runtime
Date:   Wed,  5 May 2021 11:42:00 +0200
Message-Id: <0ecf2ea9295dcf08ae6e1ae29ca3bc9ab3221a7c.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling pm_runtime_get_sync() is bad, since even when it
returns an error, pm_runtime_put*() should be called.
So, use instead pm_runtime_resume_and_get().

While here, ensure that the error condition will be checked
during clock enable an media open() calls.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/marvell-ccic/mcam-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
index 141bf5d97a04..ea87110d9073 100644
--- a/drivers/media/platform/marvell-ccic/mcam-core.c
+++ b/drivers/media/platform/marvell-ccic/mcam-core.c
@@ -918,6 +918,7 @@ static int mclk_enable(struct clk_hw *hw)
 	struct mcam_camera *cam = container_of(hw, struct mcam_camera, mclk_hw);
 	int mclk_src;
 	int mclk_div;
+	int ret;
 
 	/*
 	 * Clock the sensor appropriately.  Controller clock should
@@ -931,7 +932,9 @@ static int mclk_enable(struct clk_hw *hw)
 		mclk_div = 2;
 	}
 
-	pm_runtime_get_sync(cam->dev);
+	ret = pm_runtime_resume_and_get(cam->dev);
+	if (ret < 0)
+		return ret;
 	clk_enable(cam->clk[0]);
 	mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
 	mcam_ctlr_power_up(cam);
@@ -1611,7 +1614,9 @@ static int mcam_v4l_open(struct file *filp)
 		ret = sensor_call(cam, core, s_power, 1);
 		if (ret)
 			goto out;
-		pm_runtime_get_sync(cam->dev);
+		ret = pm_runtime_resume_and_get(cam->dev);
+		if (ret < 0)
+			goto out;
 		__mcam_cam_reset(cam);
 		mcam_set_config_needed(cam, 1);
 	}
-- 
2.30.2

