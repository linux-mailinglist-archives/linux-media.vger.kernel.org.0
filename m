Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9374736C346
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhD0K2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235372AbhD0K17 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:27:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC675613C3;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=cJU/MoL9RhqbU2INYkiDGdONljhoe6cy+RDqPfC2nLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qKyPAg+L9jydgdJExnqviwybORcKu++MgkXDF6vU8hl4oJf8lHDcHKq8Z46M9XNkK
         7z0lY6LwCFVzKvH8CjFNPgGl8blzyTmt5QM2ZkDNj8Mffs92orv4YA5/wkjuGnYwyb
         fCN+2Q6G0rJiYt+/1/x11Wny1TVxsuLmGqb772VvdRP1EYpMuQ5pRAQr7Psc4Ti6Bw
         LsgRaZrTMKgO+ssXZfN9Mi6HTFlh5gwsO/jr27zn6HM0Ia0RAEWej19JHGSRNLOyvR
         uY9/l/WA6Dn/pcSrlujL8VPuw8TA7rfCeeBGBxDkkNigGa02noa9bD74E8VdH0VH42
         myKziTQR7lDSw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1L-Cq; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 44/79] media: i2c: ov13858: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:34 +0200
Message-Id: <32de6ac2a1ae6f62f38ee22e606af0990b3f2d24.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov13858.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 4a2885ff0cbe..9598c0b19603 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1472,11 +1472,9 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
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

