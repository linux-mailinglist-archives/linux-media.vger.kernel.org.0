Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6992036C3C7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238392AbhD0K3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238032AbhD0K2d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D3A61440;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=oAi5YzlfFlQMfzPh3wYGQ2xjGcqBCgu57W3dE0PjRzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TA2KxyjYBmz7VGpPQfs1ZRA4qhA4C4EgrYpYcsSpvGfskc+qgJBZ785pDjbGxOZVt
         3ji4e62BCGNQ3efEw4jZl6otpQTKjR2knN1t23/06Ke2ew+0dLkz2F4OHsIyYP+sqo
         m72KAZqTKQdgmEC2jzezKTjMoopp7pBNfo6NepjzgyjV4Sb4qLlyuXx2wuqQZZznE+
         o/rdK1IH7eMlSAYysBjGsGpePe64H5L3TFRhpRZ2+T+JuUi8hOykq5MofI7PwOA8wz
         wU03ZSBAZJ+pho4UxbGLtiOQf8iCH2/Ju7O6YTQOTU0nW/9fixJHb1fknA0SKlncib
         1U4OirlwahFdw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o1s-1S; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>,
        Colin Ian King <colin.king@canonical.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 55/79] media: i2c: ov8865: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:45 +0200
Message-Id: <7984a7e594be7b812ebbcef913c34770608fbe4d.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 9ecf180635ee..3bf6ee4898a9 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2497,11 +2497,9 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
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

