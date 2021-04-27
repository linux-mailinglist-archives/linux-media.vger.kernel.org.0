Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DDC36C353
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235828AbhD0K2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:48152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235504AbhD0K2C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 177D6613D8;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=k96A/wu5csXQdkebmEvDXUWzQhtBwXxGUFyh7/8ot0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oUUSSjsfuRam55BLoj7etPrAHWOSjJDjKNlzFsg5DVsMsq1vllx5g/SgWn+QTVCvA
         b1Fj0LGWAipwnWg2pfqZHVgsi0bA4yqPYpXrbN6ZAc+WTPZfxVdJrwA7DdroyuY7Az
         AfQoGvcDIHsKZEXLXNVbPbKxKpObFe0tfmd+UVY0NvEVaC+SDQq4Pbec1GhyjUL/3m
         g86gRnEa5qKxWmtLLz3d3cJJARXKAVM6qvF/Azb4zVUzvIzO1g+6gS9kt5QZLk3RuF
         Cg28vMODFvMO06p42Adg7/NKDhp5nhpnInMi8UtgKysDJtyZUW3efSAJYsF4woCMuV
         oGNzH13YZFOmA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1d-OO; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 50/79] media: i2c: ov5670: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:40 +0200
Message-Id: <ea8ea70503d1678a176b39161166d7f9d5278a99.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5670.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index dee7df8dd100..182f271f118f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2347,11 +2347,9 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 		goto unlock_and_return;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = ov5670_start_streaming(ov5670);
 		if (ret)
-- 
2.30.2

