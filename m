Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C63736C388
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238157AbhD0K2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235620AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 659AF61402;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=0+qUTNue9hnyAq3YJfJJPyrh70EsjiwzWG3y47ywjxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CG6OQuMRDw4aL2HhzULba78FW659ajYzPkJNTcHUqo287goY+/lJ3wQBhkvs2X5eV
         qpp6o/vZbM+/BzyQLcLujpLxk1gRqDGU3mpek3cYRVj+v/pkrktoIDZXaz2gscBFYU
         5P2qxTopAlj2zc7c4DmRZIQ/OsEwaTXLcps8i+N1oo+8i8mA/diO315zfH8CLiH8z2
         vDZGzJT3KiXtijUulAetuz4+NpzyDMt1OSJ3eZmjrrOTYB0zq+HhYXE7acR+QMOGcZ
         8i3gmVMbmWEMN8knz+Fl6gGelGaxPU6EzE6p2sk1PbxCX1wcB6B3wM1g379vZ2qkk1
         4xJQGRj1YURng==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0i-KY; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 31/79] media: i2c: dw9768: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:21 +0200
Message-Id: <351643aad80075ea3bebcfa431479156d8b92ebf.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/dw9768.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 8b8cb4b077b5..c086580efac7 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,15 +374,7 @@ static const struct v4l2_ctrl_ops dw9768_ctrl_ops = {
 
 static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(sd->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

