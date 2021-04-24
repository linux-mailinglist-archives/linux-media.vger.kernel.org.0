Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BA9369F84
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbhDXGsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234473AbhDXGq1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D46B961943;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=UPiG7WjyXSC7rjSk7XmxEwGay8JCnhR2MqRqUi6k0z0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ptCG4hLUA7WpUVdM3fjbS9LgdHDMYl+UBbr8i/SGdbyQ3V5CP7xWc+6sBzit0enAe
         ZN6fU5dW7dhZ/7DPsIds2VIuU0RHIvjXixgzb4t1Rq9hKYF+T2Vhx0cn3I58b56Agk
         PsfZj/kiuHQt6/FW8vaIMrtSKh01Lid770t0jCTT0b78It/lTbazJtWxExAqm6D6P6
         5N/D+JlQhvgQEVWDcGjwufa7ykIwPmS24kV/EYbwg6iOAYbrjFJrxm2VXO/pcdfjwO
         WtgOLn+4JrME+7cgreOnj/hGcPZAjgKpJM3dc75eejotRd+3KrGY0ghp3N18yFBcH+
         DdyEcF2qOnyQA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfS-Tv; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 36/78] media: i2c: imx334: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:46 +0200
Message-Id: <07cca2da63bfe905e3c4dc9c51945ead79c63572.1619191723.git.mchehab+huawei@kernel.org>
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

