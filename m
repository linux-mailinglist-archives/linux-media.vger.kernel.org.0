Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA3AE7AC32E
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbjIWPVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbjIWPVm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E51719A
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A869CC433C8;
        Sat, 23 Sep 2023 15:21:35 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCHv2 19/23] media: atmel: drop bus_info
Date:   Sat, 23 Sep 2023 17:21:03 +0200
Message-Id: <20230923152107.283289-20-hverkuil-cisco@xs4all.nl>
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

Fixes this warning:

drivers/staging/media/deprecated/atmel/atmel-isc-base.c: In function 'isc_querycap':
drivers/staging/media/deprecated/atmel/atmel-isc-base.c:496:28: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 23 [-Wformat-truncation=]
  496 |                  "platform:%s", isc->v4l2_dev.name);
      |                            ^~
drivers/staging/media/deprecated/atmel/atmel-isc-base.c:495:9: note: 'snprintf' output between 10 and 45 bytes into a destination of size 32
  495 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  496 |                  "platform:%s", isc->v4l2_dev.name);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 drivers/staging/media/deprecated/atmel/atmel-isc-base.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
index f5d963904201..8e26663cecb6 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-isc-base.c
@@ -488,12 +488,8 @@ static const struct vb2_ops isc_vb2_ops = {
 static int isc_querycap(struct file *file, void *priv,
 			 struct v4l2_capability *cap)
 {
-	struct isc_device *isc = video_drvdata(file);
-
 	strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
 	strscpy(cap->card, "Atmel Image Sensor Controller", sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", isc->v4l2_dev.name);
 
 	return 0;
 }
-- 
2.40.1

