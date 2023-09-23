Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DFD7AC331
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjIWPVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbjIWPVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5655196
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F010C433CD;
        Sat, 23 Sep 2023 15:21:39 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCHv2 22/23] media: verisilicon: replace snprintf with strscpy+strlcat
Date:   Sat, 23 Sep 2023 17:21:06 +0200
Message-Id: <20230923152107.283289-23-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
References: <20230923152107.283289-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes this warning:

drivers/media/platform/verisilicon/hantro_drv.c: In function 'hantro_add_func':
drivers/media/platform/verisilicon/hantro_drv.c:902:49: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 64 [-Wformat-truncation=]
  902 |         snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
      |                                                 ^~
drivers/media/platform/verisilicon/hantro_drv.c:902:9: note: 'snprintf' output between 5 and 132 bytes into a destination of size 64
  902 |         snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  903 |                  funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "enc" : "dec");
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/verisilicon/hantro_drv.c:902:49: warning: '%s' directive output may be truncated writing up to 127 bytes into a region of size 64 [-Wformat-truncation=]
  902 |         snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
      |                                                 ^~
drivers/media/platform/verisilicon/hantro_drv.c:902:9: note: 'snprintf' output between 5 and 132 bytes into a destination of size 64
  902 |         snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  903 |                  funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "enc" : "dec");
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 50ec24c753e9..a9fa05ac56a9 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -899,8 +899,9 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &hantro_ioctl_ops;
-	snprintf(vfd->name, sizeof(vfd->name), "%s-%s", match->compatible,
-		 funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "enc" : "dec");
+	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
+	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
+		"-enc" : "-dec", sizeof(vfd->name));
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		vpu->encoder = func;
-- 
2.40.1

