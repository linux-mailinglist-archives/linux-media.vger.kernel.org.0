Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1B737568E
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbhEFPYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235192AbhEFPY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50515613C8;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=M+G2FGvpxz8oVs70Hd7XJ+D2QZDVSmESzfk8hhosPRM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZnH/Jy7ZjVGPRC4YIfOXwYpvurWTkTr8BeeG1hd2dT70CwxbugdZu1srV5X9veiw1
         XPASOVTZ2yumX7vu1bSQRbIOp7JX4e0nb2nW6bHOQDUOiL9IZFLFYouMstzz1R4YtB
         K8rFuiRGiJw/uAQs5yx04kuN3FQ2MHMthQYq1LiGpWw2l0akV8ssdeiLQBK3FfY+Ek
         qb0HruJ42WRoC9Svg80zs+PXaLBiq6wWQ7RzDpOePFBdfw+q98oODNpnVUhNkFYMU/
         ziA+FLrsCNtX9OwdX8eY9VGM8z5OCiJ/+oCLxGAyAkUXvvzKzNyv+2B7lzsuRR6PEg
         f0MxEfbgImy3w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RvK-Br; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 12/30] media: i2c: imx355: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:08 +0200
Message-Id: <bfa051b0479f90646605202010b6d61a1a2b91d1.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx355.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ccedcd4c520a..93f13a04439a 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1442,11 +1442,9 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		/*
 		 * Apply default & customized values
-- 
2.30.2

