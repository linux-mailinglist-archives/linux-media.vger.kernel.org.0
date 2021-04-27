Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF11236C2A7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236673AbhD0KPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:34910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235448AbhD0KOh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1114461453;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=uVFbSBsOFTlNeqpthO6c96NJAUfPhbV6UvOttxV6+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BMxx4QZ1wblnRax12rxqlfmVI6OonFUFIxBAwyWwJ3pz6pnkb6ruIebihD9aK+oFR
         wvLCwbyLxVJz+4lF40kW5nJN1iomAGMJ7WKem1/CiL0+oEktecUTvccPNzyWm0wac+
         FZSK3vOfTUh92K3MM8ZaSX5soUlr6+BiKwMWVkq7nWSFOhPackRsm9FfpGvLQ/bRcI
         UZnWfEik1YYgpLTFb6KEL+3R0cG71I9gadY+nUZ1iRaGThbNFtoTT3jOV6EZBntv8w
         UDBq8O59ua3xMUvjrhjyrHWjucEByB+MAJqbrwGfN1ZtFQRZw3Jtm5BoEA9kvZUzBJ
         /7CvYQp+9EHoQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6Q-1a; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 38/79] media: i2c: imx290: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:05 +0200
Message-Id: <21ebf28de1f7f0cad8f6b2589aa1272d78a764d1.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

