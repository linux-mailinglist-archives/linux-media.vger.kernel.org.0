Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639FF36C38B
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237549AbhD0K2u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235655AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42828613E6;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=kwIJFx+3BZT7CutnecuzIxhgs2GnXNtjRI6MBhWOcG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=enG4hi9/yztR+ob4i0qWRCY8jG/MkPSN5Yy27gB2Ufz1t6DlfhJsdEoXYcPGMY1YH
         xAOwcUey9MUvD7lbVPpcF7uw8WJAOgIl0vxuRnl2VehpELa2HDSSYA+oqFhD3ZkWLw
         DQssdZEjlMcif8s8WCW1W+nFQe40myImi+87BHGMiTfV49v2VZs42OGrnkF7OgvSWh
         F/d5Ls3QdyYr01asZEFrgf3KpPE2UEH1O/CeInNeBt0jw9rEHjov77agl84aaeT7QS
         I17lSfoHxmMekAPWeK6Yt+s92GXHscmhGAlv3yzRWVIsSPKdTIFvICXQ4X0cfmU6i7
         dTlzjBOgKyCbQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1g-QD; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 51/79] media: i2c: ov5675: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:41 +0200
Message-Id: <88d5dfe2889416c3b17a73fd601b743e63b20918.1619519080.git.mchehab+huawei@kernel.org>
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

