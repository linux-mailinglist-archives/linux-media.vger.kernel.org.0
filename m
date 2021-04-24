Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907A5369F88
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240448AbhDXGsG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:35964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236588AbhDXGqc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4F1761950;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=umqdpGp1oSGyna8Ojn3AGfbapFLyE4ZVzg1c+rmxXd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Avo5sE0Mqp/WrwoIieF4caEdOLfnvok5H4085NuPzlbLyTph36WypRLmkRK1j1JK8
         aEvNpX9d+tvKyDHayD+V8Hd/W5qUOfb8UXLCINOHz4HpOOFKHrzuzKZk1/YzMmWNGG
         xof32K80Xc2CzZezDfN74zNAWtULWAr+OmCXzGnDUCvRTVAz1JlL0w4z8KbLPIFIJ7
         3D9n52CzF3V/SvfdJ83DaTVmL9JqYjD1P9Lo6xHI6M+sBcJjmKya/YvlgwtWaxaPAh
         9u0cVbAJfQq+DHzfL4Dm86TFPK6Wgjzymhb+izuv4Y8lpO97yb03xgls0+Op6vZpo1
         agXux4scp8TUQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfn-4B; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 43/78] media: i2c: ov2740: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:53 +0200
Message-Id: <0a22901c5a3d29f5e45df239a122725332c6cce7.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov2740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0f3f17f3c426..54779f720f9d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -751,9 +751,8 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov2740->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov2740->mutex);
 			return ret;
 		}
@@ -1049,9 +1048,8 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 		goto exit;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
-- 
2.30.2

