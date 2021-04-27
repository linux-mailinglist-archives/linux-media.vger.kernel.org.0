Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5446C36C371
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237872AbhD0K23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235577AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A9D2613F3;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=6SWDMHkSlrYNzq7GtPd5DH9pbQJCAbHbxO2AKYAv8vU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lOJDLPBxCl+9cAhbz+aARx6L2YI/w74aH7fhI5eE1HY1iVBkK82rOTZPJFsZQp3FG
         nbqmuE1bbJM9t1GPtrzS4SHGBd/U2qcXSJLSIV0SFKwddIt7lXCFVEy6XKTXZQDd6S
         CZU2KKcwGsAEZpAR+4Fw0H5bt/oEdYfWC8q82nk7MlE4ll74lHLsXAZTlpsjwtTm/n
         b0GudJZoiH7mLg2zS+Mt0laMYZ29BR1HWVl6rFKc2OWWYKXh7CUrTkjbEr2CM5ywCm
         vTQydNGN+zZ6vp7+UQk30DIoWOXSP6KMjtfqFH/oert9WR8SAgX4tE6CX9FgWWw4hX
         47OWPBichWL3Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o16-3N; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 39/79] media: i2c: imx319: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:29 +0200
Message-Id: <0e4c8010910c04654f03304019343fa5d2a8bfef.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx319.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 38540323a156..4e0a8c9d271f 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -2141,11 +2141,9 @@ static int imx319_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		/*
 		 * Apply default & customized values
-- 
2.30.2

