Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE79D36DA6B
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240769AbhD1Ozu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240481AbhD1OyM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE9CA61955;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=oAi5YzlfFlQMfzPh3wYGQ2xjGcqBCgu57W3dE0PjRzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YUNO73Ti7qVJ8KEBqLIktYQxFH8JYnBtDIc2QAqtJTStv+6bQQs3WmpNXK8MSe+C5
         4igrIUbefLK4r4EmdeAch/KeaXscUPM33B/0eyzFNwwg/9ee59a0GM+NjvncX43CXl
         ncVAKRys9liIr24vhwoVqMu2uID0rr0ovPl+Uq3OlaODXB2KukmcdYpYIpOkSifFi0
         l0C1ah/8MDJ4/EotRtrpgX34+tDjpD8K6SsKtdaARgQ07GVJhg2MNfdI0HNPCRWCft
         yoZ7EG0NikOmtSvWytQCxy09/1i1TGPFB2PyCTEBn/8uDlZMPGMklVmDoTO0otZOa/
         BQXu8fGSuS1Sw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Ds9-3V; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 53/79] media: i2c: ov8865: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:14 +0200
Message-Id: <cbe0ef1e412d1ef2694eea9bc7ca75adc8110a3a.1619621413.git.mchehab+huawei@kernel.org>
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

