Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E525C36C3C5
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbhD0K3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238012AbhD0K2c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF6A36144E;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=x4LtonqYrT7G4qNBwEeK0f+06mohriAA55Pys8MWWx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RFc0Y/+7gCP40w3VzKraULCk+LFdE2ZViPUMHfM3Htxuz+ea83vUb71IZjgDX81Xf
         9MlAufcUX87FstAU3jcUvOOcVLnc6qCyWPNi2ajgbSlLlhkUzSv+Dat4aDNPsGPn8S
         M0T0aB86+/HLQOVwocv6NcCaZfqlJK86A1cHfZKfU5F+hyi4XvQ9Be9t2CLejyGM8S
         l+dLb8Biyu0hsJcE33mzi0IT/DPLLv4Qa8cTeVwBsoGn6UhyVYNWbMpRY7Wha+hDwx
         EElfiHJlyzKjq3QlqAn97kFNbGngBrkOTyINa7TkPxihdeZZyTeRlMB88/a/0eHApS
         4cTMvn9CM8qEA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0Z-Ep; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 28/79] media: i2c: ak7375: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:18 +0200
Message-Id: <af40eb313e5476f62b9a494b320d81fc24e662bd.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ak7375.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index e1f94ee0f48f..40b1a4aa846c 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -87,15 +87,7 @@ static const struct v4l2_ctrl_ops ak7375_vcm_ctrl_ops = {
 
 static int ak7375_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(sd->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int ak7375_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

