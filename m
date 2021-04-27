Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B70336C2AC
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhD0KPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235461AbhD0KOi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7914C61481;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=3LPMYGviydz+wxD+uX1CWPHMq2PRxZGRtXrIww4fEeI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P4/sMCZmQma9tcVvBc4t9EiLg6Z7EutWJstWPyPLYZs0vmruKhH86XLPF+7PHB0Xf
         +UOjDCvloUFlj0PSKUjXqL9whebZ4iwYVejxNmLWF29XgXpJvus8lH9cDSsR9LB906
         mRnLPr4yuinFa74nbjytbDZGioxYvkQe0yAs/tsdnNYRaz46SuykdZj43A1fITgG2L
         pHbHz8E3PBsX8ndg+SSyFnUpARaULxBLHeK0rpfc0Cw7vBCzz8EGqVsDYNG19HIplZ
         OEW4P117Jbts+nbclxj5PNlCuAnLRgYUbVt5luxvubtILktZKDpgciaHQs7BTlDeNH
         72A3WlGbEg3+g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6c-9V; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 42/79] media: i2c: mt9m001: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:09 +0200
Message-Id: <e5d0d481420b2f580be4c752e7dfe3d061ee3768.1619518193.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index ac1b380e6c03..2867f64e357d 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 		goto done;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
-			goto put_unlock;
+			goto unlock;
 
 		ret = mt9m001_apply_selection(sd);
 		if (ret)
@@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 
 put_unlock:
 	pm_runtime_put(&client->dev);
+unlock:
 	mutex_unlock(&mt9m001->mutex);
 
 	return ret;
-- 
2.30.2

