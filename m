Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF636C2BE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237658AbhD0KPr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235540AbhD0KOp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB6BA6157E;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=jUMHPV3bIyEEarOloeBBF8gl6HQ5pp77fQglK6LRWcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kIb7+lce1FnQh5HyJ9fE7hXJYauthNRRWT125eY/rKxqY4mA5g/ayIzEvuax1XvIW
         CYllTa6MKMaThVXXVDxCTMr32RKUTi5SVfSR1OLFrkOWX8QrdvJEO3Pc2cLIl5+Kk9
         Tr5PHldCihlHiNqZDzoWJurSqXtyBwANLW8cPNXzxOQanPX8rAgQwZhLQ/aY/DUZ2B
         fIFS1HoKXg5xG0OWpGjAEEt6t/H2EkxTmmN/FVua/Xt+HJAXXsc5lx4i1R1D35OXv+
         bdnbYOYbDcsMZzEhZIZ2ayHEHUm9lsfCehQbeajUBzIOdBBup6roz+JLCkGyRn/MqM
         44L8p7lkMtTbA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j79-T2; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 53/79] media: i2c: ov7740: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:20 +0200
Message-Id: <1e08b1b29b49c9c390d29718328f6e53c9310798.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov7740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index ed6904b2e8f5..74219f67f245 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -624,11 +624,9 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		ret = ov7740_start_streaming(ov7740);
 		if (ret)
-- 
2.30.2

