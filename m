Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 489BC36DA30
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240614AbhD1OzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240316AbhD1Oxg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B981616EC;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=EtwXuWKAdBECD8A9F71A3QjhWQorK36ErcFvypC9txw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fCTc+k2YZX8hZiejt9I8bK4k/2/w0NppXnV/d8io4z17B5RQlgUuTTn+J714aG1cU
         5cYZzliS8FH1qWE+Ay3QGpjT00qZRdhNR2tGwrHMvtRU5mjwN2ZKlOLe0efI9814tx
         4jlLh6lN3beJjvR5aqXG9mwNq57KZnGDjW58HCDiI812U1Jy2bafbwAXRXPzKa+OiV
         zLmxqAj1cTJHiAaU/SbD8VJcS48Tv7iwYxGsn0kzanQ3OTdq6ckqyiddRFJOq3YC8g
         murVpdvN4shEZDlc3mMP5KLe8xR1Ex1MEs8oIs4tcQlXok11CNw9Hl97by3XgiB6Hm
         d0wUoFr9k2vSA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dqq-AJ; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 26/79] staging: media: tegra-video: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:47 +0200
Message-Id: <956254cdffbc7d07b30e41f7b7cb41cf60bbfc72.1619621413.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/tegra-video/csi.c | 3 +--
 drivers/staging/media/tegra-video/vi.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 033a6935c26d..e938bf4c48b6 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -298,10 +298,9 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	struct tegra_csi *csi = csi_chan->csi;
 	int ret, err;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(csi->dev);
 		return ret;
 	}
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061cda57..1298740a9c6c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -297,10 +297,9 @@ static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	int ret;
 
-	ret = pm_runtime_get_sync(chan->vi->dev);
+	ret = pm_runtime_resume_and_get(chan->vi->dev);
 	if (ret < 0) {
 		dev_err(chan->vi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(chan->vi->dev);
 		return ret;
 	}
 
-- 
2.30.2

