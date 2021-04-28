Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5CC36DA1B
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbhD1Ox4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240299AbhD1Oxc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0CF661461;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=euIQLwDaPDSgWFx6NM45FK2bpju26XjkPQY0ICj4Fck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eVrQ9JsiqHSOD2VwH+JVxt43VtdbWfd9KdFIE4KsasypqqTk2SWl5hzobva8vOJeH
         YAmvBESve74R+BNZprFRS6poE0duv7h+AK7QtDaIuyQzx3F3ewqJRMSWjuO2ufLI/p
         YJ3n/rW+/gblCeNLgzktb7eDTGYvlKs4p3iliMTyKhBl0UU20Dkka9mgOG0pOpMnMN
         rD+P3Sz0lHRkQUFlNZv7jf9uu6ZkPo2/Q4nU4MVZKa/aNrXMd1Csb6wuqbNkbC/cZY
         zM+87X/pPWYxgXMA3wYPdvg6spD7treWwTvnxwk2FcfP7OZ/8X+JD2qzk+yi9Hs8Ir
         z90Jxjf7/E5mw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001DqJ-WC; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 15/79] media: sh_vou: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:36 +0200
Message-Id: <f7fc9697e61bef13937c3455b20e7c855e31d6f7.1619621413.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

While here, check if the PM runtime error was caught at open time.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sh_vou.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
index 4ac48441f22c..ca4310e26c49 100644
--- a/drivers/media/platform/sh_vou.c
+++ b/drivers/media/platform/sh_vou.c
@@ -1133,7 +1133,11 @@ static int sh_vou_open(struct file *file)
 	if (v4l2_fh_is_singular_file(file) &&
 	    vou_dev->status == SH_VOU_INITIALISING) {
 		/* First open */
-		pm_runtime_get_sync(vou_dev->v4l2_dev.dev);
+		err = pm_runtime_resume_and_get(vou_dev->v4l2_dev.dev);
+		if (err < 0) {
+			v4l2_fh_release(file);
+			goto done_open;
+		}
 		err = sh_vou_hw_init(vou_dev);
 		if (err < 0) {
 			pm_runtime_put(vou_dev->v4l2_dev.dev);
-- 
2.30.2

