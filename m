Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE1036C361
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237364AbhD0K2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235516AbhD0K2D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10EFF613D3;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=zHjujpboN+Iu7V2XpqIB+1lLAb+rrUx5c1q69NYA2sw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cpUk7OdXgYMc5IxFKVspOY/n9g+I4nUGSMey5qsa3wWEc559DrPtBbsm+K8r+Hbk/
         WF42f0JmmdMZe5XVH6ol6VtSjiiLkPDp+AKyZsb4MiCE8V4rCH2gSdp8d5YBciIPuT
         q40QSgiqtReZx3wkywWmbWetKfJuhBctr8DLcqgjhlOn+0m8jdzvzsKanbPSJUYw65
         sQG50kUWkFLmiBHMzPS4nMFkfmXhooeAmX/2Mrz/6bH5YJnV02vaHnGhZGbpCaJ6SU
         VSOyvgYJTZ05UyNN3F3JWQt3RKZPymhLB3mcOwO5IXB9I3tvuh6JFtofihkUVzCEKw
         oLgd7M14fh0Yw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1R-GX; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 46/79] media: i2c: ov2685: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:36 +0200
Message-Id: <4cb7f925cb309c2e3bbb8e10d96b3faf9c62d54d.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov2685.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 49a2dcedb347..2f3836dd8eed 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -456,11 +456,10 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&ov2685->client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&ov2685->client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov2685->ctrl_handler);
 		if (ret) {
 			pm_runtime_put(&client->dev);
-- 
2.30.2

