Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C5C7AC330
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 17:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbjIWPVr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 11:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjIWPVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 11:21:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC34197
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 08:21:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561CEC433C9;
        Sat, 23 Sep 2023 15:21:38 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 21/23] media: radio-miropcm20: set bus_info to explicit name
Date:   Sat, 23 Sep 2023 17:21:05 +0200
Message-Id: <20230923152107.283289-22-hverkuil-cisco@xs4all.nl>
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

Fill in bus_info with fixed name.

This fixes this compiler warning:

drivers/media/radio/radio-miropcm20.c: In function 'vidioc_querycap':
drivers/media/radio/radio-miropcm20.c:206:57: warning: '%s' directive output may be truncated writing up to 35 bytes into a region of size 28 [-Wformat-truncation=]
  206 |         snprintf(v->bus_info, sizeof(v->bus_info), "ISA:%s", dev->v4l2_dev.name);
      |                                                         ^~
drivers/media/radio/radio-miropcm20.c:206:9: note: 'snprintf' output between 5 and 40 bytes into a destination of size 32
  206 |         snprintf(v->bus_info, sizeof(v->bus_info), "ISA:%s", dev->v4l2_dev.name);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/radio/radio-miropcm20.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/radio/radio-miropcm20.c b/drivers/media/radio/radio-miropcm20.c
index 99788834c646..08be77b8f3b7 100644
--- a/drivers/media/radio/radio-miropcm20.c
+++ b/drivers/media/radio/radio-miropcm20.c
@@ -199,11 +199,9 @@ static int pcm20_setfreq(struct pcm20 *dev, unsigned long freq)
 static int vidioc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *v)
 {
-	struct pcm20 *dev = video_drvdata(file);
-
 	strscpy(v->driver, "Miro PCM20", sizeof(v->driver));
 	strscpy(v->card, "Miro PCM20", sizeof(v->card));
-	snprintf(v->bus_info, sizeof(v->bus_info), "ISA:%s", dev->v4l2_dev.name);
+	strscpy(v->bus_info, "ISA:radio-miropcm20", sizeof(v->bus_info));
 	return 0;
 }
 
-- 
2.40.1

