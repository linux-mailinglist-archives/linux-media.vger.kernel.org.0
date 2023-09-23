Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D357AC32B
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjIWPVj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbjIWPVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E75D9193
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80171C433C7;
        Sat, 23 Sep 2023 15:21:31 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCHv2 16/23] media: microchip: don't set bus_info
Date:   Sat, 23 Sep 2023 17:21:00 +0200
Message-Id: <20230923152107.283289-17-hverkuil-cisco@xs4all.nl>
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

Let the V4L2 core fill this in.

Fixes these compiler warnings:

drivers/media/platform/microchip/microchip-isc-base.c: In function 'isc_querycap':
drivers/media/platform/microchip/microchip-isc-base.c:486:28: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
  486 |                  "platform:%s", isc->v4l2_dev.name);
      |                            ^~
drivers/media/platform/microchip/microchip-isc-base.c:485:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
  485 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  486 |                  "platform:%s", isc->v4l2_dev.name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/microchip/microchip-isc-base.c: In function 'isc_mc_init':
drivers/media/platform/microchip/microchip-isc-base.c:1996:76: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
 1996 |         snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
      |                                                                            ^~
drivers/media/platform/microchip/microchip-isc-base.c:1996:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
 1996 |         snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1997 |                  isc->v4l2_dev.name);
      |                  ~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 8dbf7bc1e863..1f8528844497 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -478,12 +478,8 @@ static const struct vb2_ops isc_vb2_ops = {
 static int isc_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
-	struct isc_device *isc = video_drvdata(file);
-
 	strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
 	strscpy(cap->card, "Microchip Image Sensor Controller", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", isc->v4l2_dev.name);
 
 	return 0;
 }
@@ -1993,8 +1989,6 @@ int isc_mc_init(struct isc_device *isc, u32 ver)
 	strscpy(isc->mdev.driver_name, KBUILD_MODNAME,
 		sizeof(isc->mdev.driver_name));
 	strscpy(isc->mdev.model, match->compatible, sizeof(isc->mdev.model));
-	snprintf(isc->mdev.bus_info, sizeof(isc->mdev.bus_info), "platform:%s",
-		 isc->v4l2_dev.name);
 	isc->mdev.hw_revision = ver;
 
 	media_device_init(&isc->mdev);
-- 
2.40.1

