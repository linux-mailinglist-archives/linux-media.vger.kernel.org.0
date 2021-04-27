Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE2636C3CB
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238091AbhD0K3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238097AbhD0K2l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFCD56146D;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=30FDfGkSRFbi6myOhgI3rDKaVJ2tBblGkl0/ENBmv/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W/nE9OxUxQO1HPm1jhW61+Z+2fB25zsHJtYTLioom8ILqALFEfbe+HWGkf0Gj59jB
         RROg5XouIXPna36pijmYvh/f0s2SJIeln1JJ+FmPErcIa54u+3mDlp8ZiWWQTmE+OX
         n/8UkmOHTtqkzze/MR763Pn+PdiJgUJFPMUlR1Ld9kCSzUY7g3pV2vbDktObHcrHBL
         LTWiSB+UrIfJ2MtnU3loZhp7qtsuoB3Zp9hbwl4FwRooW4TcGwDZeLK6Qwv/dliOIE
         8WwZj4g2dDuyatpJDCWR9/hKpW9SGnI1xReH8RrJeTWTZ0myoSprud5PaWNtOauiqc
         UnFTU8t31sG3w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1a-MU; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 49/79] media: i2c: ov5648: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:39 +0200
Message-Id: <07c979d8e29593ef17b135562d68dc2ff67aca02.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5648.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 3ecb4a3e8773..07e64ff0be3f 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2132,11 +2132,9 @@ static int ov5648_s_stream(struct v4l2_subdev *subdev, int enable)
 	int ret;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(sensor->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(sensor->dev);
+		ret = pm_runtime_resume_and_get(sensor->dev);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	mutex_lock(&sensor->mutex);
-- 
2.30.2

