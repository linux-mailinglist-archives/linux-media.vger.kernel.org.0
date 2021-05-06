Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009D937569F
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhEFPY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235212AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 985F061404;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=kwIJFx+3BZT7CutnecuzIxhgs2GnXNtjRI6MBhWOcG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a+tPDbyenogZ7UBlgx+BT4D5sZ3GwxnDHLgMxA0O3QebeWgYQBkmOBwFHk66pYQVB
         Uzmmmjm9QQeOICXgFQBYMaW5Z/iA1Afg1C1OE3eRAoqe/dvOzCZyBe9QzLUvGH2qF0
         d1eFzfSWns2GvQ87PrERAX1EBP80AIGABrNJt+TNDLsm4KneUFLBsa0ULmtaYSP+uj
         GwwVEczja/IDxOJxE9+qoCKXoqyuzykfOebTrKrNLMWiayg5iwBCEkhzX/rBaWY0qg
         GIh4/6z6d1o+YdS9h3RmMh6s+bcidKo3kbIVz34GsbhkhCbll7Z4MVy1FiJrkCSAHx
         MVyZQXwm6miJA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rvy-P9; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v5 22/30] media: i2c: ov5675: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:18 +0200
Message-Id: <a294f4e4a901ecf61c929775e74311a82c912538.1620314098.git.mchehab+huawei@kernel.org>
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

