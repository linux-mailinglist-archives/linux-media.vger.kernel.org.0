Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BDC36DA7C
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbhD1O4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240334AbhD1Oxj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88AA161925;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=28FtFakpR3rMJfq6Bb1gqJsNDZKdyp2sz2lduteJODo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WHKQSvZuv8sv+bJt48n6SS0X1ONsulu6OaHPTbEHZL47ErG3DxJz2sJt1GZi+BI8b
         q2SRuPgUCUX1SDR6AahVpMj+vXDjNlCi3XmqPbMAGxVOh5SnyY3MJSLmVuxijRlHcZ
         kY9CARLjDGFi8sYywZ1UW6EeDHuCT8JRnNnpc7i/aOf2ra+lr72ZhLucHuXtEQCgQe
         mw6Eggg7vqPxzquah2ahaAQcHd5PbxMx2oGvNBkVHpf4rJAstqiJ1SDRzZ20gj/uV+
         StYE5B5Z9P5U5gKPvXSaFm4m+IOe37rlZMzDtCgrCMLwtaIKd2Yt8ERJ2B+Zipa0ke
         SXKAyjYKFMnqQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dr8-Fo; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 32/79] media: i2c: hi556: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:53 +0200
Message-Id: <2f20caddd42b0c86238835d761b6f437f2f1123e.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/hi556.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 6f05c1138e3b..627ccfa34835 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -813,9 +813,8 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&hi556->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&hi556->mutex);
 			return ret;
 		}
-- 
2.30.2

