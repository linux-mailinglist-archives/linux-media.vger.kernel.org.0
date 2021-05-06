Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1E337569C
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbhEFPY4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235203AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6302D613DD;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=cJU/MoL9RhqbU2INYkiDGdONljhoe6cy+RDqPfC2nLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UyCbVExH+NwBj1QdDOx4732l++dPlXl2AI3D9IaSiXUR2om/2OIUBSLPt7fDvS/eI
         oAVBYhQUhRUCCm08M9MCnpMFqZAQoKR+ldG+x4i+2KnKgc2K5l/CHlB24k0oOmlaHU
         VWgwZCb8nZcAZPc+8MqgWzLzJzSps5w5/5VWNBNyxWfboKKqCFUZWrdE0IIXLrqqkO
         fChAiecs4PwbBwnll5q8duaDj3qSQZIvG1DSbWb8IRIDDMpoXEmpSo19+8jiHby1fw
         ZyYlPmQBYcid2vURirsFVZe+7TkRwJH7X3/NTUxEq/2NP9nxUqHqOpECEAVcLDxQf6
         9wvRcWOUaav/w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RvW-F4; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 15/30] media: i2c: ov13858: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:11 +0200
Message-Id: <3378b00f77814d32b48dbca76066eaba5c1bcc94.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov13858.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 4a2885ff0cbe..9598c0b19603 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1472,11 +1472,9 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
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

