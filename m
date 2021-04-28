Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EC536DA6A
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240038AbhD1Ozu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240489AbhD1OyM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6020B619B1;
        Wed, 28 Apr 2021 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=rXQEV5ur3+5U6VOB8wAB6dlcXqNLqRBsrKFm5rfs1io=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DA5zfXyQFxk2kx/2QTm17SwT1lXw/x3hwbcEIFTRcdNmphvzhv6D4pZPPFH9TEJWG
         PnJZ9/hyjbOKECxGl22P64Ib3mAFcLZFjt7s+4zMk/9BYCBCFRzURkAYXNihZfGzfn
         ILaqHbmbJqJGd8bqXJ2PFQLexOQQPhsfJ3vAht1dcHV5TKLHsVkVMLFWhFgA+x1CST
         BSqvEVWfbcc9Jqo3W3XhY7dEPsZjTpUYnojmDZa4TWkS9KX1i+tllhMIxPXTtot5gq
         279dY34CBGWiZR+ITgbAWOegYPAPzWfCXn760ANABSPxM667S+EqXtXfo/0asNSSNc
         xHqgwPQuPuYWw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrZ-OW; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 41/79] media: i2c: ov02a10: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:02 +0200
Message-Id: <28ee19b0392646b4754f36d19827aa157aa0bb60.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov02a10.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index c47b1d45d8fd..a1d7314b20a9 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -540,11 +540,9 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 	}
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov02a10_start_stream(ov02a10);
 		if (ret) {
-- 
2.30.2

