Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5026036DA1A
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240432AbhD1Oxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:36352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240290AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD3BD6145A;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=HuTLNsPcfIqbw1UtY6p4jIBErIihq3Y8I/97JFK7QN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gCuwNzsLP/DCAChF9rvXjCLhZlwMEr70h9kQ9oMl1sBVFnW3RXxSfdP3RaLMGbGqH
         3uoxGqPqsWBLJvWQe60yqY8eibD+s4j0FEaV+je7oVk1z4840mTBPN3axizBJRRSQO
         ACRtf+tG10Mj4QRbwBNLQ+vj8zLtUXDPYQkf+6aiPH4jUkSFvpq0H2HW3hgvErSBpn
         Q7HDnNTLprUU0XcIECm0pYPBrOsnOHIuWXWzWF609CWtrwddTroJR3j5wvsRNvBTuz
         +o1uWbZvIqU5/+LVa/mjozD97d+DK+gsXYuYOxb9djCE5VylGD7tMI8QVfAvSXMpQV
         9pcR3H2sl0MIQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dq1-QW; Wed, 28 Apr 2021 16:52:41 +0200
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
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 09/79] media: marvel-ccic: fix some issues when getting pm_runtime
Date:   Wed, 28 Apr 2021 16:51:30 +0200
Message-Id: <eb819ab09ce3ac98ed13493b88495fbd0ca05dec.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

