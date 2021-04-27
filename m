Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C6236C39E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237977AbhD0K3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:48246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235769AbhD0K2M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BF4161404;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=umqdpGp1oSGyna8Ojn3AGfbapFLyE4ZVzg1c+rmxXd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KCiV1PbCI9tqPf+ESysh50sD/ZfeO4tgOQVcDzYxe/TZ3TwZrjh4pzIlg0RVGfXpj
         yXkx4wsZ3Tv15FHs6m6JkjF/8bIuUZ4pri6b5IoF+6IPjbmRygndCU69LcnvCAieML
         1DCSOcdb/7SRIKt53etmKf++okaqv3tUowLoF2PfoH+Eg6iFPK96IIaUzpU6UDseph
         rxXnCW9beXrxBqb7l1AuiBCcm+/q27m4RC3PVHN/ZaDjsjrAZOE2d4EqP9ncb5sYzN
         /s/0RB4tEGXfkj41XUDhzWBagKhH53kdLMhiHzZPKrLRAqONoPzES7TagWdaReyI/6
         fIG30dhI5FU+Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1U-Ib; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 47/79] media: i2c: ov2740: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:37 +0200
Message-Id: <ac2aac12f66180cd823e1517ef900256482b726a.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov2740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0f3f17f3c426..54779f720f9d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -751,9 +751,8 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov2740->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov2740->mutex);
 			return ret;
 		}
@@ -1049,9 +1048,8 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 		goto exit;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
-- 
2.30.2

