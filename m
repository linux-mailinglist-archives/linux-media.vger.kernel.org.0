Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B64836C34F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbhD0K2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235486AbhD0K2C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 019B5613C5;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=eHVLTLMHsH9CniLLDWRCODM0fRuiKeyCHa5RZsztWV8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e8RlsyiNI1XktFOjf79d6zq4LYHZ5aQJV2v7egsNmkg2BtIcxlyPOZNbv1MrVFGvE
         yJST7LaW53M2WUyas/djhW0xboDOevQzTmTEJFdIOOuaDvljjC11Xfq5C+aizkR1HC
         Y8JjFTaHxHQz5T0FUx3ymdupbSLV1gholDEeN9OuXFPTVd+hWeFdy00I6p9rkqfa8M
         iB2odU1mtFIQGe9TrmNYQgv2vzinGSuywtcVDll8uITzFLo8CYVTTbddtwEphJzfYZ
         Id/t/QFcPeA8UmXXepaniD/aL2VCQ7PArYfqlDa0576nx4u9fr5Un09ILggRWmay6u
         aIWSnvxxpK0Zw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0x-Tt; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 36/79] media: i2c: imx258: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:26 +0200
Message-Id: <04e3ded737aa0c382385ff89239f0266dd72c70c.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx258.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a017ec4e0f50..90529424d5b6 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1039,11 +1039,9 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
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

