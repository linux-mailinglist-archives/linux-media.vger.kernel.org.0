Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEFE369F91
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhDXGsV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236986AbhDXGqf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15F626196E;
        Sat, 24 Apr 2021 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=kwIJFx+3BZT7CutnecuzIxhgs2GnXNtjRI6MBhWOcG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M8zU3oi2ikz/PHMmNsPdwIMatZgjkS0v7ZOQPUD9nbSTAkFDmUrjmY14NZJ+hak06
         OkWpss9mCdhacjdIlJD+wMFmGTfGqjTxotYRfueMtLJq5S1FF7c0rdBP66zWV4l/2p
         CZG489/TmwTrT1yfe1hX27zDoFVjxidsnO7Kih/rcGxCzreaVpX1NZzIjxAs/Onj6p
         LWhMXlBLQOlfvOQePS7ckgOpNRb46Ad/GGXJup/OFK74secwPlm6VIFkmblt5J7HAj
         fxpe9hysX20QSgKIh6jMxe4crjF17VenzPBx7prS/+9cEZDhrNxjB/ZYvjBphqBhsR
         gqoZYbPrnAf4Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfz-82; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 47/78] media: i2c: ov5675: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:57 +0200
Message-Id: <b628809e89ca81ba3dca5e6923475b17f5147383.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5675.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index dea32859459a..e7e297a23960 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -863,9 +863,8 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov5675->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov5675->mutex);
 			return ret;
 		}
-- 
2.30.2

