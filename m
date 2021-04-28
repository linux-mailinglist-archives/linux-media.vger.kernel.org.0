Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E4936DA65
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240743AbhD1Ozo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240453AbhD1Ox6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E711A61966;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=30FDfGkSRFbi6myOhgI3rDKaVJ2tBblGkl0/ENBmv/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lrjts9E9yKLvcWcEXP4ConrbZgaYlplg3GUaO93Co4m/qoM66zNDp4z1Eqi4P8zl2
         YNDbFrkpmI0E/v/jcbYcOknI1uHHkjMfeIG3UviPsthdcFNR+cPoS/QM48infZLtfL
         f+WyNSt/iq+Hg1EgjHwpkpjspeozgYefyxOR8KkGo4mpKlu1Ua0W7I4AmuSggHwAgt
         XW4nL8ZK2s5romV3HXSajHn+OxZhAx/HSmW/SADKxKnkVE4iKabPXUEcmVA/Ru8+Nx
         EnqQuu6JmG3Ly6dX8MpQJtLPrxTL8Z2vVBGhYZnMoUJ62RQFYAKn3OPhjbioaeYSwL
         UkU6D74559o2A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Drr-Ty; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 47/79] media: i2c: ov5648: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:08 +0200
Message-Id: <9f681763d22136bc6f2c6602abc1a95964afe30d.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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

