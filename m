Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A513369F63
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237520AbhDXGrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233197AbhDXGqO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F4826191B;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=KnK+ScvrOSmF+XC/C/B4F8IBvu/svp7LsuDeKcM5sXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dh+PfW2+3hdsEGYtsEh8UFYqIErdOhnehGTAwrTx8iHASscuLDChlHncSpXNedLeH
         gt+ycULKeJ5RU7UJkIcqIBUH7UFrdZgdCuKPZDfrhpB5OzUU6pYJ+iGyir2fqu735h
         7sceodh6jd8ZvPpzagO67xIp9mbKiYd4sIziA9d0KcAUVe/KRtQiPqy0totwCtOLV0
         19DO7dUDiselSWVjuEfLtPz35CfZdtbHCCXLEcCJ8U0iA/lVGoBIqCLa0J70q3mU/s
         4Y0stPOCeSO6rCnirCvQ6ehnt1xigKrrgDHVlvL2i6DXdeb8HUt15Ufr9//j9ZaAaX
         XUGinBbyQm1zA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfA-OI; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 30/78] media: i2c: imx214: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:40 +0200
Message-Id: <2095c39c68a450e3144f4f5e2ed9a59a1d17b523.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx214.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index e8b281e432e8..1a770a530cf5 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -776,11 +776,9 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 		return 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx214->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx214->dev);
+		ret = pm_runtime_resume_and_get(imx214->dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = imx214_start_streaming(imx214);
 		if (ret < 0)
-- 
2.30.2

