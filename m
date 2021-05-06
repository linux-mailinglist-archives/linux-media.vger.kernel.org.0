Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57EA375684
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235208AbhEFPYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:37876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234993AbhEFPY2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 243436101A;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=28FtFakpR3rMJfq6Bb1gqJsNDZKdyp2sz2lduteJODo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EIXNtW33l+LoZwDbDUNv2+xeAbbe+gVCQs0EN+iD+/4nflmVUXiTahCUcSzBNBDMO
         bQvXGpOfNaaJfTBTOPoYzAd1EJykisK+vPoGEHHrbm6++qdx3Qah1IgKwCfCjdVxyp
         Hnzk+X6N0NexJ835tgoDDnYRxIjavddEci/3aknfHCZI0OcvK7l8y34pLtVRYUwrr4
         rE7xs7kY1pf3NUkg0K47HxB84Ma+hwFZ1/ydbqfgl4IXpfXHTG8BIZfaj/A00kvUyC
         ih7Ai3RGWMCpb7m+AJ+6XEQvsxq/PPemmvGuX0EYV0UpI/tEXe8MSQ604C8GYKfm02
         eRTnns7CUrCeg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Ruo-4E; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v5 05/30] media: i2c: hi556: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:01 +0200
Message-Id: <8b729e702a9e3416a66bddd5f42d89e117bd1618.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/hi556.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 6f05c1138e3b..627ccfa34835 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -813,9 +813,8 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&hi556->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&hi556->mutex);
 			return ret;
 		}
-- 
2.30.2

