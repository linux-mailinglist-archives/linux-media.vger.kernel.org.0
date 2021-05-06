Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89407375685
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhEFPYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:37962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235106AbhEFPY2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CB7461168;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=uVFbSBsOFTlNeqpthO6c96NJAUfPhbV6UvOttxV6+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ly6C76OpD8dXnmadzGR2BNB+zcZwkEwPVSaVQV+4gtC8Zr8Q6AHlofFIaC/K7T8Z8
         nV8sLus77GlGExBjrIUVzhf/BP7BQ2QmIzOp+U774Fr0vHftY7O1gg1hSM9eYd3V2D
         2iuU4k0XiBIqZgXEDYxrvaml0pxvKXXtNusgVLwkqMPjLpS9gxaJEFgJ1egVCBQFrF
         biZHbBUimBYM3TAWJWcG/Zl7/tfcRBUwHtyEk85NkeiNpTCeZe2KluQqMOHRFDQFGc
         dZhiDwZ76tcZQiQAGm5CEqalxfr3hCfFUFXuGUdiniI36ziDL8OhXUZ3q1H4o53DOc
         UvAPAlrGdId9w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RvC-9g; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 10/30] media: i2c: imx290: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:06 +0200
Message-Id: <d268467476d4d75123683c996bd366c8290bcaff.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx290.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6319a42057d2..06020e648a97 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -764,11 +764,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx290->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx290->dev);
+		ret = pm_runtime_resume_and_get(imx290->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = imx290_start_streaming(imx290);
 		if (ret) {
-- 
2.30.2

