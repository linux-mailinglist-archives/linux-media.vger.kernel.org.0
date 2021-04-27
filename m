Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DB736C3C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbhD0K3m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238041AbhD0K2d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D40A56144F;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=8oeNDL2f6ftikmJG74aEJuwd7JVkpDOtWW3l23y+D78=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c41tK+hscMgweL5Tlc0xkZrqp+yUtOdrcR/Kg2lLf3eIS92zsZTGNnWf+tk6urkpk
         JrZ0t8aKAoHDk+srLB4vvpFJmwbcLnUC0kvHfzZRdBd35ZHOkWTbNg4FgXanjYAYCz
         RZlX9LnEcm3Fix01yMLebNo3/SqZtaGGn2ThLliJAi9TsedgkDXIqwRKO5c+JV8OCJ
         TJ2pGPlwQnGluhO+FUBgzJ6XYzuJCBcQi+WFYkNaLTrMNTTHsr867S15W7ZaxJvVeS
         jetPTi09m/tRgUmkUDa67Xi+tJW7am2MIq4lrYKh0EBw+Tjf5IkjzFA/FRy/UvojeZ
         Gi5TpPPVA+38w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0l-MR; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 32/79] media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:22 +0200
Message-Id: <601909851ba888278067e163ea0905b443869ccf.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/dw9807-vcm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
index 438a44b76da8..95e06f13bc9e 100644
--- a/drivers/media/i2c/dw9807-vcm.c
+++ b/drivers/media/i2c/dw9807-vcm.c
@@ -130,15 +130,7 @@ static const struct v4l2_ctrl_ops dw9807_vcm_ctrl_ops = {
 
 static int dw9807_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int rval;
-
-	rval = pm_runtime_get_sync(sd->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return rval;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int dw9807_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

