Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B52136DA61
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240732AbhD1Ozh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240465AbhD1OyG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E769D6196C;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=9V28x/0yZtyv8nyV8uH7fSioPt4mARji1tVhL7JUs2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Erwj8HW+oR0FZc71dGycbIpEK0qKhHOMvjGbgfaDtQlAtawBxmVjxUWKJ1g7LP4kt
         SQH4je/jtNqKroSvKhUybb5l3m5j152NGz3ZTF/Zp0QQMKxWyF44MiPckMNSQIdxJP
         +cLEWvzADRBSUDDKcZEW8VDTd9/uB1ajQxfVVy1rRrRZcrEvImOn2TFLl5KmzxHAJP
         euUhfQQaffhZmaBIGkwhMNwuTGuQIY7sOqNyXioDOLnr+1Ne57t4DAF9RgBAW+B7Y1
         c1b26O8njaYLRjbANZdYy2gCZuH7hjZhUr5SlXKY519f81FJ3YlSiy3RMNyeNf6I9D
         PZ4Cx22sOwNNg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Ds0-0i; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 50/79] media: i2c: ov5695: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:11 +0200
Message-Id: <6d3d4ee7a9b3b06d745ba7b8f35a8314f45c8fdf.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5695.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 09bee57a241d..469d941813c6 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -946,11 +946,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov5695_start_stream(ov5695);
 		if (ret) {
-- 
2.30.2

