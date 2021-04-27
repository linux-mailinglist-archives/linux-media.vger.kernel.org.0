Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BD236C34A
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235713AbhD0K2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235457AbhD0K2C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1709611ED;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=ZOYDC8nizVOemN97ng0w67F2uxMXkIsqLhOdGgCw1ys=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oq+R/VRITgn0pzbnpFdIQAyKQNwdBKvWD+Ctlx3IOzAa7StcMwidOkcuOnW2bmUg7
         LvWjSH5SDVPW+kqytaoS5O3EFEil+AiNZv+2yVYDCkimAnLqIMAxfsllaAQfB9oT2q
         zHtZujH6YEIJ0j/P7SIVEsQSDSeTfvJR0Qu0sxB0boD5z0ng3qHYk7VDUJDdP6SS0I
         OSkNDvXXvh2kPKYmvBRbVMHF7bbi2QKVjhav2CASfrZejCevDzZlGgGlixbfWl4g/W
         wMbSqNlCKhlF34YEWhg3tCoiDykSa7Q/DLjYndGgB6YMqL3JssyEZH7ybVqYcGpeUA
         gstaADeXO1HZA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0E-0q; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 21/79] staging: media: atomisp_fops: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:11 +0200
Message-Id: <b7d1a4dd84721a3028f8321a8ccc800d39ee96b9.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index f1e6b2597853..26d05474a035 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -837,7 +837,7 @@ static int atomisp_open(struct file *file)
 	}
 
 	/* runtime power management, turn on ISP */
-	ret = pm_runtime_get_sync(vdev->v4l2_dev->dev);
+	ret = pm_runtime_resume_and_get(vdev->v4l2_dev->dev);
 	if (ret < 0) {
 		dev_err(isp->dev, "Failed to power on device\n");
 		goto error;
@@ -881,9 +881,9 @@ static int atomisp_open(struct file *file)
 
 css_error:
 	atomisp_css_uninit(isp);
-error:
-	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	pm_runtime_put(vdev->v4l2_dev->dev);
+error:
+	hmm_pool_unregister(HMM_POOL_TYPE_DYNAMIC);
 	rt_mutex_unlock(&isp->mutex);
 	return ret;
 }
-- 
2.30.2

