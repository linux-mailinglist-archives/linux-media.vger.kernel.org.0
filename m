Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FBB3756A3
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbhEFPZB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:25:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:38130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235215AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD60961419;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=Z0USvyTZ3fXu9UhxRT5FD354jvvwjeNjqwFRY+Zs3l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IOZyHqll4X1/vDVakeOj+M9UTCwsPf9Mcd4AAHefLVWrTtKW5ZFiCj6s2MknjFQZf
         s52/lV4CJ+Ndjdbe+7YTL4parQCosygYiEZ5K5/uPIjf9n910ssp12PnhMej9GWyh1
         rBHdQrwraElqX9sCsscRqd9umpXtfOdixuBpAqJn/RD9YugsUG8fQd6CYng3i4zWvd
         8di9+O4lyxwhV1XDU6t1k1jHVv1ro0MQjZRy7KWcF5BrR1nwExn89RttOhPvls3Ksw
         oZ6XzB56fDZoaAESuaqbzf8Hauhx8qOvtxh7AhK98H0N9Y7sZ4ZI9Y2BtNRmKHlbkh
         D3dtk/NbBOUVA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RwA-Sx; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 25/30] media: i2c: ov8856: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:21 +0200
Message-Id: <b970fd99f0658fa2bb354e3b6212a1d48265790a.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov8856.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e3af3ea277af..2875f8e4ddcb 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1340,9 +1340,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov8856->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov8856->mutex);
 			return ret;
 		}
-- 
2.30.2

