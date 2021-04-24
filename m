Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15823369F20
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbhDXGqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231135AbhDXGqL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F00896148E;
        Sat, 24 Apr 2021 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=tBhz+mbkfcRSxvb4EBkBlG70VP44aXYRzSWpLAI0sn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tOcopj2YMQ3ovKY0IFy5K4HL+1PEQWwRJ7ACkARgsgui1dMzQUhxFzT55yvJAWrow
         daAmC6m7VFHF/8EmYxjeXEj4Ohs3I82/JVVINkeKDggE3PWqIaVjmL/wFS5W/ESRhm
         drZIRGBX7KaDWusc5DsPIhO1vLhyIvSzKLE1ZLRsUuOZTLtQ8qeeTh8rADvhvvoSl7
         pAW9lzOQxEr16nSN0EmTo5ztMuvCeMX7bEu5+F86LguqftJ7BQu1DShxmix+YxO/zA
         5fG0iqiD53ghie+3zRgo4yTqRZCVssPX2PXRYwpdtlFS9PmDLuhoBX41cnTFr5EGGV
         nNCWS/kfpRjAw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2k-004Jdn-Tu; Sat, 24 Apr 2021 08:45:30 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 02/78] media: marvel-ccic: fix some issues when getting pm_runtime
Date:   Sat, 24 Apr 2021 08:44:12 +0200
Message-Id: <93a8c81827fd7fdd4b50ba5c5f63387519559bf5.1619191723.git.mchehab+huawei@kernel.org>
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
index 141bf5d97a04..3c3a6592e0e6 100644
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
+			return ret;
 		__mcam_cam_reset(cam);
 		mcam_set_config_needed(cam, 1);
 	}
-- 
2.30.2

