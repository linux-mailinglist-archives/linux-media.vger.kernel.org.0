Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD034369F4D
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbhDXGqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232714AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E59561628;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=asptFjthmpMSH40y9mihi2F9WNWJSxY/te/hCXNd4N0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p1kFI7dNHSXKbUgS80WMhQC6LqhkxbCf1jUIwAk/BCInO9XdY17uh1tZzGG+5RGsG
         I+a31BBjJzYlzijfv46g/nFcAuuPmaQnKqrjQlQrMxfhAkesYKbvFZFDC/vszGKDFn
         0rTLsDcs1b1LR3Uf8Y58LCFpXj06icDaMYG+f1MRPe3V7rsdvY6h462w+k8sQzejnd
         axVbg69mhPmjdR0+Io8erfCNUUDL7lgs3yW5MTiswR5+dLbQlaeFBM8iUarHwE2SsU
         xy/NS5a4F++w80OLthwDrlq/NnSIrj3TAuSfkiEON4OPTBZb5NoNNruz6MPXQD6Xwe
         /gmw5dQdzB0PQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jev-Jd; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 25/78] media: i2c: ccs-core: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:35 +0200
Message-Id: <34da940f76da6c1d61a193409164070f47243b64.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ccs/ccs-core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 9dc3f45da3dc..1441ddcc9b35 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(&client->dev);
-
+	rval = pm_runtime_resume_and_get(&client->dev);
+	if (rval < 0)
 		return rval;
-	} else if (!rval) {
+
+	if (!rval) {
 		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
 					       ctrl_handler);
 		if (rval)
@@ -3089,7 +3088,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	bool streaming = sensor->streaming;
 	int rval;
 
-	rval = pm_runtime_get_sync(dev);
+	rval = pm_runtime_resume_and_get(dev);
 	if (rval < 0) {
 		pm_runtime_put_noidle(dev);
 
-- 
2.30.2

