Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055944DE46
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 00:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhKKXLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 18:11:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:36614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230131AbhKKXLr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 18:11:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C73F61381;
        Thu, 11 Nov 2021 23:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636672137;
        bh=MIxhXT3ImtBCjhjlAcsge8qOzD5vIYiIO6gv5yNL9vY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iHI3ac/cJCv9T4oqBROMDc3SWL1+THrHnmIrGDQqKlCh2GJb2MmDBTMhgZ0IkQ+6r
         SL2SLMZkgr9Qjyy+P/Hh1zfidVzPLyhJAdvDMXi4RTswEDuKpYaUgUBVrzQD/Gv1L+
         2ef9GqBedW7AYwfyXzxRNruO8MZdQNMAIugUnqy3IrPknEVWTpQgDV3sH2teOOncXl
         gp7vOlw1ynOV5zfz98jyI/b4nRp0hob+rc95g4ChKi29oSXqIeEbxT6yQThUndwHeo
         re3M1ZkgcQ8xYLQxhehKmWV1wsRiRl6mJJiwprHlNqcwmXGlqGyJMj8WV8KwpCFVnV
         ZPmcPF++OAsPA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlJBe-000I7B-3h; Thu, 11 Nov 2021 23:08:54 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Beatriz Martins de Carvalho 
        <martinsdecarvalhobeatriz@gmail.com>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tom Rix <trix@redhat.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, llvm@lists.linux.dev
Subject: [PATCH 2/3] media: atomisp-gc2235: drop an unused var
Date:   Thu, 11 Nov 2021 23:08:52 +0000
Message-Id: <81245e1273f2e0e96a520b9d00cd415f65d37b48.1636672052.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636672052.git.mchehab+huawei@kernel.org>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this clang Werror with W=1:

drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:573:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
        int ret = -1;
            ^

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636672052.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 5e7085264189..0e6b2e6100d1 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -570,14 +570,16 @@ static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
 {
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
-	int ret = -1;
+	int ret;
 
 	if (!dev || !dev->platform_data)
 		return -ENODEV;
 
-	ret |= dev->platform_data->gpio1_ctrl(sd, !flag);
+	ret = dev->platform_data->gpio1_ctrl(sd, !flag);
 	usleep_range(60, 90);
-	return dev->platform_data->gpio0_ctrl(sd, flag);
+	ret |= dev->platform_data->gpio0_ctrl(sd, flag);
+
+	return ret;
 }
 
 static int power_up(struct v4l2_subdev *sd)
-- 
2.33.1

