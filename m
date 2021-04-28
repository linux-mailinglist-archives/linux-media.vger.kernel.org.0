Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B3536DA81
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240862AbhD1O4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240366AbhD1Oxq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE4CD6194A;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=cJU/MoL9RhqbU2INYkiDGdONljhoe6cy+RDqPfC2nLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r4V0jhslp+vb3TvIxpwmsiFUZL8s7Ri3da0/TD/fpu/3Ft0IW4HegPEAFzc3modqv
         1J3iqgAF6MWGlr1ttiDNi42U7LFUvhR/3KXAkxwl5aoBmjtn9C7XIXpqKsy9tGV4lW
         OrOt2bXl1b7F9GyHL/GuSMu1oYbWKCP5h7OFXYi2jiJxTeuOveC2t/LH4QmcF8UsZ7
         dQ9EXIgJXenGUHg2TFsvDpaHgT9ElE92wDLjf7lCteBy+eoeCYRrNCbwalnLXpzeMW
         q6hMTOY6NJsaEtM/C5DHlp0V8gOxZNyFpHKhVtEWRxY3Mzc0YL1u8Wvr0JRIjavd80
         Aqgfu/5YCzeQw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Drc-PR; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 42/79] media: i2c: ov13858: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:03 +0200
Message-Id: <36c3e68bc5d849058a7693fdcb472fd88057f849.1619621413.git.mchehab+huawei@kernel.org>
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

