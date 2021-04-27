Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DE136C2C1
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbhD0KPu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235547AbhD0KOp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3CB961629;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=k96A/wu5csXQdkebmEvDXUWzQhtBwXxGUFyh7/8ot0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hw4dgbLVADycQmdwmHlF1MyUVQiS1hu3Vu2aRwx9iTTDx3mYKwdlTkSei6anYnR4i
         MFm4eXqjy/rWXt0RFHjilmUhBOGp+lYq/j5iC5rEUjuQzrmqa9J4KN7F0I2mvut6YV
         DwW5NfxLCTE0VoPjZKpArSziwMXVrwvsGDc8zCBwsCglTCjmYhDxl7VDDbYa6kUrxm
         j3IRqHWb2JafB3MYxx72259pIiLtOWBNJDg+0Va7AVyrlxIwPzzyjbSE7Lty2J38TO
         xm7sUJzfMfDWdwyIpFL7uwYm7t4WLkw7H3G9pTj/c5tafKwIw+OQlXd+4dVVUA818P
         GmFiti49uZctg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j70-Nf; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 50/79] media: i2c: ov5670: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:17 +0200
Message-Id: <1e549236f4e48a6ab8dacbf0d3e19d059f11fa51.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5670.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index dee7df8dd100..182f271f118f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2347,11 +2347,9 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 		goto unlock_and_return;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = ov5670_start_streaming(ov5670);
 		if (ret)
-- 
2.30.2

