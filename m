Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E732B36C382
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbhD0K2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235621AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57C9A613F9;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=9V28x/0yZtyv8nyV8uH7fSioPt4mARji1tVhL7JUs2c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CiUY3nJzfV3j0iV6EFclfxWEAThSe4t5YuwQ8FY9KB4/bxquN6WnmeciyH5t/NXOd
         XYf/Dyb5T9eijcJO3X0Ez6ELMBsbWMgPTRNCBfih2vD86xE9j/be2y4cHo0xCF851b
         5lYAd9/xDXxA7b0a/usGVy8NpBQlvpEfo5k+oQRoba/ujZPsXF4saCEHXSho2BAE5a
         Y0SmiqxbiI30S/vkC9HEPqu0OUipvHOjzjhEv2UHQWGgfAVimC4kOk/gDC9Q8/EKOe
         9mz+hyzhWFbVXwcm/IJ5zrGsw3OIjg/lTJkctRgWqNlQ8fXKHmhFaa26ZYWSthNbO7
         fmcUxIkLVbtKg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1j-S8; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 52/79] media: i2c: ov5695: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:42 +0200
Message-Id: <569f2a2139747b431ae73d24ef931aa01f4ec029.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5695.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 09bee57a241d..469d941813c6 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -946,11 +946,9 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov5695_start_stream(ov5695);
 		if (ret) {
-- 
2.30.2

