Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EFB36C2B7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhD0KPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235527AbhD0KOo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F0EE613E8;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=Q0bHrDKjUOjsdiFC7y51wKhz9eviTnP6n0iV74l2LA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NXmG/9eu8AaxnkVHJjjXtDIKlJy2Dlfm2BCZ2/MihqF58VANihAxMazB4fnaqihqz
         X5PS80Wq3pMMaXMAlwZt0wQO8ztiSgN/sikXGCmH83OxVC6ut5wXOb/umardTQQ5lL
         4KCEUJOQMoxjPrQ5oqkVIo3syrsQvIoyhTc+WxOBDZBWMbqzOBexhvCxks9AYXCEYb
         7CE8fV44YeJ6H9SSnnBssSKFigYLchpbx5MiZCeGQ33AvGQdnBxyliUSbrQ78PU4qL
         WGEKSA7MMhfbHOEWYY59d0v389ilVdlF+4NhMRtgTPZfkpUJp7Ld0wHxJCMNV9fX/O
         v6WQQ4Sza9eDw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6W-5a; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 40/79] media: i2c: imx334: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:07 +0200
Message-Id: <e42655203e213b7cfa1aeef1b311fe15c1b64763.1619518193.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx334.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 047aa7658d21..a5a03bb4a6ae 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -717,9 +717,9 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx334->dev);
+		ret = pm_runtime_resume_and_get(imx334->dev);
 		if (ret)
-			goto error_power_off;
+			goto error_unlock;
 
 		ret = imx334_start_streaming(imx334);
 		if (ret)
@@ -737,6 +737,7 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 
 error_power_off:
 	pm_runtime_put(imx334->dev);
+error_unlock:
 	mutex_unlock(&imx334->mutex);
 
 	return ret;
-- 
2.30.2

